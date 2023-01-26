// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libenvconst.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("EnvConst.dll")
#else
fileprivate let libHandle = loadDll("libenvconst.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes the EnvInit DLL for use in the program.
// If this function returns an error, it is recommended that you stop the program immediately.
// 
// An error will occur if you forget to load and initialize all the prerequisite DLLs, as listed in the DLL Prerequisites section of the accompanying documentation, before using this DLL.
// 
// When the function is called, the GEO model is set to WGS-72 and the FK model is set to FK5.  If the user plans to use the SGP4 propagator, do NOT change this default setting. Otherwise, SGP4 won't work
public func EnvInit( _ apAddr: Int64 ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvInit"), to: functionSignature.self)

    return function(apAddr)
}

// Returns information about the EnvConst DLL.
// The returned string provides information about the version number, build date, and the platform of the EnvConst DLL.
public func EnvGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetInfo"), to: functionSignature.self)

    function(infoStr)
}

// Reads Earth constants (GEO) model and fundamental catalogue (FK) model settings from a file.
// The users can use NAME=VALUE pair to setup the GEO and FK models in the input file. 
// 
// For GEO model, the valid names are GEOCONST, BCONST and the valid values are WGS-72, WGS72,  72, WGS-84, WGS84, 84, EGM-96, EGM96, 96, EGM-08, EGM08, 08, JGM-2, JGM2, 2, SEM68R, 68, GEM5, 5, GEM9, and 9.
// 
// For FK model, the valid name is FKCONST and the valid values are: FK4, 4, FK5, 5.
// 
// All the string literals are case-insensitive.	
public func EnvLoadFile( _ envFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvLoadFile"), to: functionSignature.self)

    return function(envFile)
}

// Saves the current Earth constants (GEO) model and fundamental catalogue (FK) model settings to a file.
// Returns zero indicating the GEO and FK settings have been successfully saved to the file. Other values indicate an error.
public func EnvSaveFile( _ envConstFile: UnsafeMutablePointer<CChar>,
                         _ saveMode: Int32,
                         _ saveForm: Int32 ) -> Int32 {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSaveFile"), to: functionSignature.self)

    return function(envConstFile, saveMode, saveForm)
}

// Returns the current fundamental catalogue (FK) setting. 
// The FK model is shared among all the Standardized Astrodynamic Algorithms DLLs in the program. 
public func EnvGetFkIdx(  ) -> Int32 {

    typealias functionSignature = @convention(c) (  ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetFkIdx"), to: functionSignature.self)

    return function()
}

// Changes the fundamental catalogue (FK) setting to the specified value. 
// If the users enter an invalid value for the fkIdx, the program will continue to use the current setting. 
// 
// The FK model is globally shared among the Standardized Astrodynamic Algorithms DLLs. If its setting is changed, the new setting takes effect immediately.
// The FK model must be set to FK5 to use the SGP4 propagator.
public func EnvSetFkIdx( _ xf_FkMod: Int32 ) {

    typealias functionSignature = @convention(c) ( Int32 ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSetFkIdx"), to: functionSignature.self)

    function(xf_FkMod)
}

// Returns the current Earth constants (GEO) setting. 
// <br>
// The GEO model is shared among all the Standardized Astrodynamic Algorithms DLLs in the program.
// <br>
// The following table lists possible values of the return value GEO setting:
// <table summary="">
// <tr>
// <td><b>Value</b></td>
// <td><b>Value interpretation</b></td>
// </tr>
// <tr><td>84</td><td>WGS-84</td></tr>
// <tr><td>96</td><td>EGM-96</td></tr>
// <tr><td>08</td><td>EGM-08</td></tr>
// <tr><td>72</td><td>WGS-72 (default)</td></tr>
// <tr><td>2</td><td>JGM2</td></tr>
// <tr><td>68</td><td>STEM68R, SEM68R</td></tr>
// <tr><td>5</td><td>GEM5</td></tr>
// <tr><td>9</td><td>GEM9</td></tr>
// </table>
public func EnvGetGeoIdx(  ) -> Int32 {

    typealias functionSignature = @convention(c) (  ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetGeoIdx"), to: functionSignature.self)

    return function()
}

// Changes the Earth constants (GEO) setting to the specified value.
// <br>
// If you specify an invalid value for xf_GeoMod, the program will continue to use the current setting. 
// <br>
// The GEO model is globally shared among the Standardized Astrodynamic Algorithms DLLs. If its setting is changed, the new setting takes effect immediately
// <br>
// The following table lists possible values of the parameter value GEO setting:
// <table summary="">
// <tr>
// <td><b>Value</b></td>
// <td><b>Value interpretation</b></td>
// </tr>
// <tr><td>84</td><td>WGS-84</td></tr>
// <tr><td>96</td><td>EGM-96</td></tr>
// <tr><td>08</td><td>EGM-08</td></tr>
// <tr><td>72</td><td>WGS-72 (default)</td></tr>
// <tr><td>2</td><td>JGM2</td></tr>
// <tr><td>68</td><td>STEM68R, SEM68R</td></tr>
// <tr><td>5</td><td>GEM5</td></tr>
// <tr><td>9</td><td>GEM9</td></tr>
// </table>
// <br>
// The GEO model must be set to WGS-72 to use the SGP4 propagator.
public func EnvSetGeoIdx( _ xf_GeoMod: Int32 ) {

    typealias functionSignature = @convention(c) ( Int32 ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSetGeoIdx"), to: functionSignature.self)

    function(xf_GeoMod)
}

// Returns the name of the current Earth constants (GEO) model. 
// <br>
// The geoStr parameter may contain one of the following values:
// <table summary="">
// <tr><td>WGS-84</td></tr>
// <tr><td>EGM-96</td></tr>
// <tr><td>EGM-08</td></tr>
// <tr><td>WGS-72</td></tr>
// <tr><td>JGM2</td></tr>
// <tr><td>SEM68R</td></tr>
// <tr><td>GEM5</td></tr>
// <tr><td>GEM9</td></tr>
// </table>
public func EnvGetGeoStr( _ geoStr: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetGeoStr"), to: functionSignature.self)

    function(geoStr)
}

// Changes the Earth constants (GEO) setting to the model specified by a string literal. 
// <br>
// If you specify an invalid value for geoStr, the program will continue to use the current setting.
// <br>
// The GEO model is globally shared among the Standardized Astrodynamic Algorithms DLLs. If its setting is changed, the new setting takes effect immediately.
// <br>
// The following table lists possible values of the parameter value GEO setting:
// <table summary="">
// <tr>
// <td><b>geoStr (any string in the row)</b></td>
// <td><b>Interpretation</b></td>
// </tr>
// <tr><td>'WGS-84', 'WGS84', '84'</td><td>WGS-84</td></tr>
// <tr><td>'EGM-96', 'EGM96', '96'</td><td>EGM-96</td></tr>
// <tr><td>'EGM-08', 'EGM08', '8'</td><td>EGM-08</td></tr>
// <tr><td>'WGS-72', 'WGS72', '72'</td><td>WGS-72 (default)</td></tr>
// <tr><td>'JGM-2, 'JGM2', '2'</td><td>JGM-2</td></tr>
// <tr><td>'SEM68R', '68'</td><td>STEM68R, SEM68R</td></tr>
// <tr><td>'GEM5', '5'</td><td>GEM5</td></tr>
// <tr><td>'GEM9', '9'</td><td>GEM9</td></tr>
// </table>   
// <br>
// The GEO model must be set to WGS-72 to use the SGP4 propagator.
public func EnvSetGeoStr( _ geoStr: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSetGeoStr"), to: functionSignature.self)

    function(geoStr)
}

// Retrieves the value of one of the constants from the current Earth constants (GEO) model. 
// <br>
// The following table lists possible values of the parameter value xf_GeoCon:
// <table summary="">
// <tr>
// <td><b>xf_GeoCon</b></td>
// <td><b>xf_GeoCon Interpretation</b></td>
// </tr>
// <tr><td>1</td><td>FF: Earth flattening (reciprocal; unitless)</td></tr>
// <tr><td>2</td><td>J2 (unitless)</td></tr>
// <tr><td>3</td><td>J3 (unitless)</td></tr>
// <tr><td>4</td><td>J4 (unitless)</td></tr>
// <tr><td>5</td><td>KE (er^1.5/min)</td></tr>
// <tr><td>6</td><td>KMPER: Earth radius (km/er)</td></tr>
// <tr><td>7</td><td>RPTIM: Earth rotation rate w.r.t. fixed equinox (rad/min)</td></tr>
// <tr><td>8</td><td>CK2: J2/2 (unitless)</td></tr>
// <tr><td>9</td><td>CK4: -3/8 J4 (unitless)</td></tr>
// <tr><td>10</td><td>KS2EK: Converts km/sec to er/kem</td></tr>
// <tr><td>11</td><td>THDOT: Earth rotation rate w.r.t. fixed equinox (rad/kem)</td></tr>
// </table>   
public func EnvGetGeoConst( _ xf_GeoCon: Int32 ) -> Double {

    typealias functionSignature = @convention(c) ( Int32 ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetGeoConst"), to: functionSignature.self)

    return function(xf_GeoCon)
}

// Retrieves the value of one of the constants from the current fundamental catalogue (FK) model.
// <br>
// The following table lists possible values of the parameter value xf_FkCon:
// <table summary="">
// <tr>
// <td><b>xf_FkCon</b></td>
// <td><b>xf_FkCon Interpretation</b></td>
// </tr>
// <tr><td>1</td><td>c1: Earth rotation rate w.r.t. moving equinox (rad/day)</td></tr>
// <tr><td>2</td><td>c1dot: Earth rotation acceleration (rad/day2)</td></tr>
// <tr><td>3</td><td>thgr70: Greenwich angle (1970; rad)</td></tr>
// </table>   
public func EnvGetFkConst( _ xf_FkCon: Int32 ) -> Double {

    typealias functionSignature = @convention(c) ( Int32 ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetFkConst"), to: functionSignature.self)

    return function(xf_FkCon)
}

// Returns a handle that can be used to access the fundamental catalogue (FK) data structure. 
// <br>
// This function is needed when calling the ThetaGrnwch function from TimeFunc.dll.
// <br>
// The handle returned by this function is sometimes called a pointer for historical reasons. The name EnvGetFkPtr comes from the fact that the handle used to be called a pointer.
public func EnvGetFkPtr(  ) -> Int64 {

    typealias functionSignature = @convention(c) (  ) -> Int64

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetFkPtr"), to: functionSignature.self)

    return function()
}

// Specifies the shape of the earth that will be used by the Astro Standards software, either spherical earth or oblate earth
public func EnvSetEarthShape( _ earthShape: Int32 ) {

    typealias functionSignature = @convention(c) ( Int32 ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSetEarthShape"), to: functionSignature.self)

    function(earthShape)
}

// Returns the value representing the shape of the earth being used by the Astro Standards software, either spherical earth or oblate earth
public func EnvGetEarthShape(  ) -> Int32 {

    typealias functionSignature = @convention(c) (  ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetEarthShape"), to: functionSignature.self)

    return function()
}

// Indexes of Earth Constant fields
//Earth flattening (reciprocal; unitless)
public let XF_GEOCON_FF    = 1
//J2 (unitless)
public let XF_GEOCON_J2    = 2
//J3 (unitless)
public let XF_GEOCON_J3    = 3
//J4 (unitless)
public let XF_GEOCON_J4    = 4
//Ke (er**1.5/min)
public let XF_GEOCON_KE    = 5
//Earth radius (km/er)
public let XF_GEOCON_KMPER = 6
//Earth rotation rate w.r.t. fixed equinox (rad/min)
public let XF_GEOCON_RPTIM = 7

//J2/2 (unitless)
public let XF_GEOCON_CK2   = 8
//-3/8 J4 (unitless)
public let XF_GEOCON_CK4   = 9
//Converts km/sec to er/kem
public let XF_GEOCON_KS2EK = 10
//Earth rotation rate w.r.t. fixed equinox (rad/kemin)
public let XF_GEOCON_THDOT = 11
//J5 (unitless)
public let XF_GEOCON_J5    = 12


// Indexes of FK Constant fields
//Earth rotation rate w.r.t. moving equinox (rad/day)
public let XF_FKCON_C1     = 1
//Earth rotation acceleration(rad/day**2)
public let XF_FKCON_C1DOT  = 2
//Greenwich angle (1970; rad)
public let XF_FKCON_THGR70 = 3

// Indexes represent geopotential models GEO
//Earth constants - JGM2
public let XF_GEOMOD_JGM2   =    2
//Earth constants - GEM5
public let XF_GEOMOD_GEM5   =    5
//Earth constants - EGM-08
public let XF_GEOMOD_EGM08  =    8
//Earth constants - GEM9
public let XF_GEOMOD_GEM9   =    9
//Earth constants - STEM68
public let XF_GEOMOD_STEM68 =   68
//Earth constants - WGS-72
public let XF_GEOMOD_WGS72  =   72
//Earth constants - WGS-84
public let XF_GEOMOD_WGS84  =   84
//Earth constants - EGM-96
public let XF_GEOMOD_EGM96  =   96
//Invalid earth model
public let XF_GEOMOD_UNKNOWN =  100

//*******************************************************************************

// Indexes represent fundamental catalogue FK
//Fundamental Catalog - FK5
public let XF_FKMOD_4 = 4
//Fundamental Catalog - FK4
public let XF_FKMOD_5 = 5


// ========================= End of auto generated code ==========================
