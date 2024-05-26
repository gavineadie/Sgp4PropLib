//
//  EnvConstDriver.swift
//
//  Created by Gavin Eadie on 12/4/22.
//

import Foundation

/// Initializes the EnvInit DLL for use in the program. If this function returns an error,
/// it is recommended that you stop the program immediately.
///
/// An error will occur if you forget to load and initialize all the prerequisite DLLs,
/// as listed in the DLL Prerequisites section of the accompanying documentation,
/// before using this DLL.
///
/// When the function is called, the GEO model is set to WGS-72 and the FK
/// model is set to FK5. If the user plans to use the SGP4 propagator, do NOT
/// change this default setting. Otherwise, SGP4 won't work
///
/// - Parameter dllHandle: The handle that was returned from `DllMainInit`,
/// see the documentation for DllMain.dll for details.
/// - Returns: zero indicating the EnvConst DLL has been initialized successfully. Other values indicate an error.
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func envInit(_ dllHandle: Int64) -> Int { Int(EnvInit(dllHandle)) }

/// Returns information about the EnvConst DLL.
///
/// - Returns: A `String` of information about the DLL version number, build date, and platform.
public func envGetInfo() -> String {

    var infoString = emptyCcharArray(size: GETSETSTRLEN)
    EnvGetInfo(&infoString)
    return String(fromCcharArray: infoString, size: GETSETSTRLEN)

}

/// Reads Earth constants (GEO) model and fundamental catalogue (FK) model settings from a file.
///
/// The users can use NAME=VALUE pair to setup the GEO and FK models in the input file.
///
/// For GEO model, the valid names are `GEOCONST`, `BCONST` and the valid values are
/// `WGS-72`, `WGS72`, `72`, `WGS-84`, `WGS84`, `84`, `EGM-96`, `EGM96`, `96`,
/// `EGM-08`, `EGM08`, `08`, `JGM-2`, `JGM2`, `2`, `SEM68R`, `68`, `GEM5`, `5`, `GEM9`, and `9`.
///
/// For FK model, the valid name is `FKCONST` and the valid values are: `FK4`, `4`, `FK5`, `5`.
///
/// All the string literals are case-insensitive.
/// - Parameters:
///   - filePath: The name of the input file.
/// - Returns: zero indicating the input file has been loaded successfully. Other values indicate an error.
public func envLoadFile(_ filePath: String) -> Int {

    Int(EnvLoadFile(filePath.cString))

}

/// Saves the current Earth constants (GEO) model and fundamental catalogue (FK) model settings to a file.
/// - Parameters:
///   - envFilePath: The name of the file in which to save the settings.
///   - saveMode: Specifies whether to create a new file or append to an existing one. (0 = create, 1= append)
///   - saveForm: Specifies the mode in which to save the file. (0 = text format, 1 = xml (not yet implemented, reserved for future))
/// - Returns: zero indicating the GEO and FK settings have been successfully saved to the file. Other values indicate an error.
public func envSaveFile(_ envFilePath: String, _ saveMode: Int, _ saveForm: Int) -> Int {

    Int(EnvSaveFile(envFilePath.cString, Int32(saveMode), Int32(saveForm)))

}

/// Returns the name of the current Earth constants (GEO) model.
///
/// The geoStr parameter may contain one of the following values:
///
///     WGS-84
///     EGM-96
///     EGM-08
///     WGS-72
///     JGM2
///     SEM68R
///     GEM5
///     GEM9
/// - Returns: Returns the name of the current Earth constants (GEO) model.
public func envGetGeoStr() -> String {

    var geoString = emptyCcharArray(size: 16)
    EnvGetGeoStr(&geoString)
    return String(fromCcharArray: geoString, size: 16)

}

/// Changes the Earth constants (GEO) setting to the model specified
/// by a string literal.
///
/// If you specify an invalid value for geoStr, the program will continue
/// to use the current setting.
///
/// The GEO model is globally shared among the libraries. If its setting is
/// changed, the new setting takes effect immediately.
///
/// The following table lists possible values of the parameter value GEO setting:
///
/// geoStr (any string in the row)
///
///                        Interpretation
///
///     'WGS-84', 'WGS84', '84' -> WGS-84
///     'EGM-96', 'EGM96', '96' -> EGM-96
///     'EGM-08', 'EGM08', '8' -> EGM-08
///     'WGS-72', 'WGS72', '72' -> WGS-72 (default)
///     'JGM-2, 'JGM2', '2' -> JGM-2
///     'SEM68R', '68' -> STEM68R, SEM68R
///     'GEM5', '5' -> GEM5
///     'GEM9', '9' -> GEM9
///
/// The GEO model must be set to WGS-72 to use the SGP4 propagator.
/// - Parameter geoStr: The GEO model to use, expressed as a string.
public func envSetGeoStr(_ geoStr: String) { EnvSetGeoStr(geoStr.cString) }
