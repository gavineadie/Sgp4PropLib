//
//  tle.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libtleHandle = loadDll("libtle.dylib")

/// Initializes Tle DLL for use in the program. If this function returns an error, it is recommended that you stop the program immediately.
///
/// - Parameter dllHandle: The handle that was returned from DllMainInit
/// - Returns: 0 if Tle.dll is initialized successfully, non-0 if there is an error.
public func tleInit(_ dllHandle: Int64) -> Int32 {

    guard let tleInitPointer = dlsym(libtleHandle, "TleInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleInitFunction = fnPtrTleInit
    let tleInit = unsafeBitCast(tleInitPointer, to: TleInitFunction.self)
    return tleInit(dllHandle)

}

/// Returns the information about the Tle DLL.
///
/// The returned string provides information about the version number, build date, and the platform of the Tle DLL.
/// - Returns: A string to hold the information about the Tle DLL.
public func tleGetInfo() -> String {

    guard let tleGetInfoPointer = dlsym(libtleHandle, "TleGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias TleGetInfoFunction = fnPtrTleGetInfo
    let tleGetInfo = unsafeBitCast(tleGetInfoPointer, to: TleGetInfoFunction.self)
    tleGetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}

/// Loads TLEs (satellites) contained in a text file into the TLE DLL's binary tree.
/// You may use this function repeatedly to load TLEs from different input files. However, only unique satKeys are loaded. Duplicated TLEs won't be stored.
///
/// TLEs can be included directly in the specified file, or they can be read from a separate file identified with "ELTFIL=[path\filename]" or "VECFIL=[path\filename]".
///
/// The input file is read in two passes. The function first looks for "ELTFIL=" and "VECFIL=" lines, then it looks for TLEs which were included directly. The result of this is that data entered using both methods will be processed, but the "ELTFIL=" and "VECFIL=" data will be processed first.

/// - Parameter tleFileName: The name of the file containing two line element sets to be loaded.
/// - Returns: 0 if the two line element sets in the file are successfully loaded, non-0 if there is an error.
private func TleLoadFile(_ tleFileName: String) -> Int32 {

    guard let TleLoadFilePointer = dlsym(libtleHandle, "TleLoadFile") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleLoadFileFunction = fnPtrTleLoadFile
    let TleLoadFile = unsafeBitCast(TleLoadFilePointer, to: TleLoadFileFunction.self)

    return tleFileName.withCString {
        TleLoadFile(UnsafeMutablePointer(mutating: $0))
    }

}

// typedef int (STDCALL *fnPtrTleSaveFile)(char tleFile[512], int saveMode, int xf_tleForm);

public func tleRemoveSat(_ satKey: Int64) -> Int32 {

    guard let TleRemoveSatPointer = dlsym(libtleHandle, "TleRemoveSat") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleRemoveSatFunction = fnPtrTleRemoveSat
    let TleRemoveSat = unsafeBitCast(TleRemoveSatPointer, to: TleRemoveSatFunction.self)

    return TleRemoveSat(satKey)

}

// typedef int (STDCALL *fnPtrTleRemoveAllSats)(void);

// typedef int (STDCALL *fnPtrTleGetCount)(void);

public func tleAddSatFrLines(_ line1: String, _ line2: String) -> Int64 {

    guard let tleAddSatFrLinesPointer = dlsym(libtleHandle, "TleAddSatFrLines") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleAddSatFrLinesFunction = fnPtrTleAddSatFrLines
    let tleAddSatFrLines = unsafeBitCast(tleAddSatFrLinesPointer, to: TleAddSatFrLinesFunction.self)
    return tleAddSatFrLines(line1.withCString { UnsafeMutablePointer(mutating: $0) },
                            line2.withCString { UnsafeMutablePointer(mutating: $0) })

}

// typedef __int64 (STDCALL *fnPtrTleAddSatFrCsv)(char csvLine[512]);

// typedef __int64 (STDCALL *fnPtrTleAddSatFrFieldsGP)(int satNum, char secClass, char satName[8], int epochYr, double epochDays, double bstar, int ephType, int elsetNum, double incli, double node, double eccen, double omega, double mnAnomaly, double mnMotion, int revNum);

// typedef __int64 (STDCALL *fnPtrTleAddSatFrFieldsGP2)(int satNum, char secClass, char satName[8], int epochYr, double epochDays, double bstar, int ephType, int elsetNum, double incli, double node, double eccen, double omega, double mnAnomaly, double mnMotion, int revNum, double nDotO2, double n2DotO6);

// typedef int (STDCALL *fnPtrTleUpdateSatFrFieldsGP)(__int64 satKey, char secClass, char satName[8], double bstar, int elsetNum, double incli, double node, double eccen, double omega, double mnAnomaly, double mnMotion, int revNum);

// typedef int (STDCALL *fnPtrTleUpdateSatFrFieldsGP2)(__int64 satKey, char secClass, char satName[8], double bstar, int elsetNum, double incli, double node, double eccen, double omega, double mnAnomaly, double mnMotion, int revNum, double nDotO2, double n2DotO6);

// typedef __int64 (STDCALL *fnPtrTleAddSatFrFieldsSP)(int satNum, char secClass, char satName[8], int epochYr, double epochDays, double bTerm, double ogParm, double agom, int elsetNum, double incli, double node, double eccen, double omega, double mnAnomaly, double mnMotion, int revNum);

// typedef int (STDCALL *fnPtrTleUpdateSatFrFieldsSP)(__int64 satKey, char secClass, char satName[8], double bterm, double ogParm, double agom, int elsetNum, double incli, double node, double eccen, double omega, double mnAnomaly, double mnMotion, int revNum);

// typedef int (STDCALL *fnPtrTleSetField)(__int64 satKey, int xf_Tle, char valueStr[512]);

/// Retrieves the value of a specific field of a TLE.
///
/// The table below indicates which index values correspond to which fields. Make sure to use the appropriate field index for GP TLEs
/// and SP TLEs.  For indexes 5, 15 and 16, the interpretation depends on the ephemeris type of the TLE.
///
/// index             Interpretation
///
/// 1.    Satellite number
/// 2.    Security classification
/// 3.    Satellite international designator
/// 4.    Epoch
/// 5.    Ephemeris type = 0,2: B* drag term (1/er) Ephemeris type = 6   : SP radiation pressure coefficient agom (m2/kg)
/// 6.    Ephemeris type
/// 7.    Element set number
/// 8.    Orbit inclination (degrees)
/// 9.    Right ascension of ascending node (degrees)
/// 10.    Eccentricity
/// 11.    Argument of perigee (degrees)
/// 12.    Mean anomaly (degrees)
/// 13.    Mean motion (rev/day)
/// 14.    Revolution number at epoch
/// 15.    Ephemeris type = 0: SGP mean motion derivative (rev/day /2) or Ephemeris type = 6: SP ballistic coefficient (m2/kg)
/// 16.    Ephemeris type = 0: SGP mean motion second derivative (rev/day²/ 6) or Ephemeris type = 6: SP Outgassing parameter/Thrust Acceleration (km/s2)
///
/// - Parameters:
///   - satKey: The satellite's unique key.
///   - xfTle: Predefined number specifying which field to retrieve. See remarks.
/// - Returns: A string containing the value of the requested field; NULL if failure.
public func TleGetField(_ satKey: Int64, _ xfTle: Int32) -> String? {

    guard let TleGetFieldPointer = dlsym(libtleHandle, "TleGetField") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleGetFieldFunction = fnPtrTleGetField
    let TleGetField = unsafeBitCast(TleGetFieldPointer, to: TleGetFieldFunction.self)

    var info512 = Array(repeating: Int8(0), count: 512)

    _ = TleGetField(satKey, xfTle, &info512); info512[511] = 0
    return String(cString: info512).trimRight()

}

// typedef int (STDCALL *fnPtrTleGetAllFieldsGP)(__int64 satKey, int* satNum, char* secClass, char satName[8], int* epochYr, double* epochDays, double* bstar, int* ephType, int* elsetNum, double* incli, double* node, double* eccen, double* omega, double* mnAnomaly, double* mnMotion, int* revNum);

// typedef int (STDCALL *fnPtrTleGetAllFieldsGP2)(__int64 satKey, int* satNum, char* secClass, char satName[8], int* epochYr, double* epochDays, double* bstar, int* ephType, int* elsetNum, double* incli, double* node, double* eccen, double* omega, double* mnAnomaly, double* mnMotion, int* revNum, double* nDotO2, double* n2DotO6);

// typedef int (STDCALL *fnPtrTleGetAllFieldsSP)(__int64 satKey, int* satNum, char* secClass, char satName[8], int* epochYr, double* epochDays, double* bTerm, double* ogParm, double* agom, int* elsetNum, double* incli, double* node, double* eccen, double* omega, double* mnAnomaly, double* mnMotion, int* revNum);

// typedef int (STDCALL *fnPtrTleParseGP)(char line1[512], char line2[512], int* satNum, char* secClass, char satName[8], int* epochYr, double* epochDays, double* nDotO2, double* n2DotO6, double* bstar, int* ephType, int* elsetNum, double* incli, double* node, double* eccen, double* omega, double* mnAnomaly, double* mnMotion, int* revNum);

// typedef int (STDCALL *fnPtrTleLinesToArray)(char line1[512], char line2[512], double xa_tle[64], char xs_tle[512]);

// typedef int (STDCALL *fnPtrTleParseSP)(char line1[512], char line2[512], int* satNum, char* secClass, char satName[8], int* epochYr, double* epochDays, double* bTerm, double* ogParm, double* agom, int* elsetNum, double* incli, double* node, double* eccen, double* omega, double* mnAnomaly, double* mnMotion, int* revNum);

// typedef int (STDCALL *fnPtrTleGetLines)(__int64 satKey, char line1[512], char line2[512]);

// typedef int (STDCALL *fnPtrTleGetCsv)(__int64 satKey, char csvLine[512]);

// typedef void (STDCALL *fnPtrTleGPFieldsToLines)(int satNum, char secClass, char satName[8], int epochYr, double epochDays, double nDotO2, double n2DotO6, double bstar, int ephType, int elsetNum, double incli, double node, double eccen, double omega, double mnAnomaly, double mnMotion, int revNum, char line1[512], char line2[512]);

// typedef void (STDCALL *fnPtrTleGPFieldsToCsv)(int satNum, char secClass, char satName[8], int epochYr, double epochDays, double nDotO2, double n2DotO6, double bstar, int ephType, int elsetNum, double incli, double node, double eccen, double omega, double mnAnomaly, double mnMotion, int revNum, char csvLine[512]);

// typedef void (STDCALL *fnPtrTleGPArrayToLines)(double xa_tle[64], char xs_tle[512], char line1[512], char line2[512]);

// typedef void (STDCALL *fnPtrTleGPArrayToCsv)(double xa_tle[64], char xs_tle[512], char csvline[512]);

// typedef void (STDCALL *fnPtrTleSPFieldsToLines)(int satNum, char secClass, char satName[8], int epochYr, double epochDays, double bTerm, double ogParm, double agom, int elsetNum, double incli, double node, double eccen, double omega, double mnAnomaly, double mnMotion, int revNum, char line1[512], char line2[512]);

public func tleGetSatKey(_ satNum: Int32) -> Int64 {

    guard let TleGetSatKeyPointer = dlsym(libtleHandle, "TleGetSatKey") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias TleGetSatKeyFunction = fnPtrTleGetSatKey
    let TleGetSatKey = unsafeBitCast(TleGetSatKeyPointer, to: TleGetSatKeyFunction.self)

    return TleGetSatKey(satNum)

}

// typedef __int64 (STDCALL *fnPtrTleFieldsToSatKey)(int satNum, int epochYr, double epochDays, int ephType);

// typedef __int64 (STDCALL *fnPtrTleAddSatFrArray)(double xa_tle[64], char xs_tle[512]);

// typedef int (STDCALL *fnPtrTleUpdateSatFrArray)(__int64 satKey, double xa_tle[64], char xs_tle[512]);

// typedef int (STDCALL *fnPtrTleDataToArray)(__int64 satKey, double xa_tle[64], char xs_tle[512]);

// typedef int (STDCALL *fnPtrTleLinesToCsv)(char line1[512], char line2[512], char csvline[512]);

// typedef int (STDCALL *fnPtrTleCsvToLines)(char csvLine[512], int newSatno, char line1[512], char line2[512]);

public func setTleKeyMode(_ tle_keyMode: Int32) -> Int32 {

    guard let SetTleKeyModePointer = dlsym(libtleHandle, "SetTleKeyMode") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias SetTleKeyModeFunction = fnPtrSetTleKeyMode
    let SetTleKeyMode = unsafeBitCast(SetTleKeyModePointer, to: SetTleKeyModeFunction.self)

    return SetTleKeyMode(tle_keyMode)

}
