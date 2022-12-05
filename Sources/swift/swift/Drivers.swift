//
//  Drivers.swift
//  
//
//  Created by Gavin Eadie on 12/4/22.
//

import Foundation
import obj_c

public func dllMainInit() -> Int64 { DllMainInit() }

public func dllMainGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(INFOSTRLEN))
    DllMainGetInfo(&infoString)
    infoString[Int(INFOSTRLEN)-1] = 0
    return String(cString: infoString).trimRight()

}

public func getInitDllNames() -> String {

    var getNamesString = Array(repeating: Int8(0), count: Int(GETSETSTRLEN))
    GetInitDllNames(&getNamesString)
    getNamesString[Int(GETSETSTRLEN)-1] = 0
    return String(cString: getNamesString).trimRight()

}

public func envGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(512))
    EnvGetInfo(&infoString)
    infoString[511] = 0
    return String(cString: infoString).trimRight()

}

public func timeFuncGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(512))
    TimeFuncGetInfo(&infoString)
    infoString[511] = 0
    return String(cString: infoString).trimRight()

}

public func astroFuncGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(512))
    AstroFuncGetInfo(&infoString)
    infoString[511] = 0
    return String(cString: infoString).trimRight()

}

public func tleGetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(512))
    TleGetInfo(&infoString)
    infoString[511] = 0
    return String(cString: infoString).trimRight()

}

public func sgp4GetInfo() -> String {

    var infoString = Array(repeating: Int8(0), count: Int(512))
    Sgp4GetInfo(&infoString)
    infoString[511] = 0
    return String(cString: infoString).trimRight()

}

public func tleAddSatFrLines (_ line1: String, _ line2: String) -> Int64 {

    TleAddSatFrLines(makeCString(from: line1), makeCString(from: line2))

}

public func getLastErrMsg() -> String {

    var messageString = Array(repeating: Int8(0), count: Int(LOGMSGLEN))
    GetLastErrMsg(&messageString)
    messageString[Int(LOGMSGLEN)-1] = 0
    return String(cString: messageString).trimRight()

}

public func utcToDTG19(_ ds50UTC: Double) -> String {

    var string24 = Array(repeating: Int8(0), count: Int(24))
    UTCToDTG19(ds50UTC, &string24)
    string24[23] = 0
    return String(cString: string24).trimRight()

}

public func openLogFile(_ filePath: String) -> Int32 {

    OpenLogFile(makeCString(from: filePath))

}

public func logMessage(_ message: String) {

    LogMessage(makeCString(from: message))

}
