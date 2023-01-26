// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libenvconst.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("EnvConst.dll")
#else
fileprivate let libHandle = loadDll("libenvconst.dylib")
#endif

public func EnvInit( _ apAddr: Int64 ) -> Int32 {

    typealias functionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvInit"), to: functionSignature.self)

    return function(apAddr)
}

public func EnvGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetInfo"), to: functionSignature.self)

    function(infoStr)
}

public func EnvLoadFile( _ envFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvLoadFile"), to: functionSignature.self)

    return function(envFile)
}

public func EnvSaveFile( _ envConstFile: UnsafeMutablePointer<CChar>,
                         _ saveMode: Int32,
                         _ saveForm: Int32 ) -> Int32 {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSaveFile"), to: functionSignature.self)

    return function(envConstFile, saveMode, saveForm)
}

public func EnvGetFkIdx(  ) -> Int32 {

    typealias functionSignature = @convention(c) (  ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetFkIdx"), to: functionSignature.self)

    return function()
}

public func EnvSetFkIdx( _ xf_FkMod: Int32 ) {

    typealias functionSignature = @convention(c) ( Int32 ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSetFkIdx"), to: functionSignature.self)

    function(xf_FkMod)
}

public func EnvGetGeoIdx(  ) -> Int32 {

    typealias functionSignature = @convention(c) (  ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetGeoIdx"), to: functionSignature.self)

    return function()
}

public func EnvSetGeoIdx( _ xf_GeoMod: Int32 ) {

    typealias functionSignature = @convention(c) ( Int32 ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSetGeoIdx"), to: functionSignature.self)

    function(xf_GeoMod)
}

public func EnvGetGeoStr( _ geoStr: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetGeoStr"), to: functionSignature.self)

    function(geoStr)
}

public func EnvSetGeoStr( _ geoStr: UnsafeMutablePointer<CChar> ) {

    typealias functionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSetGeoStr"), to: functionSignature.self)

    function(geoStr)
}

public func EnvGetGeoConst( _ xf_GeoCon: Int32 ) -> Double {

    typealias functionSignature = @convention(c) ( Int32 ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetGeoConst"), to: functionSignature.self)

    return function(xf_GeoCon)
}

public func EnvGetFkConst( _ xf_FkCon: Int32 ) -> Double {

    typealias functionSignature = @convention(c) ( Int32 ) -> Double

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetFkConst"), to: functionSignature.self)

    return function(xf_FkCon)
}

public func EnvGetFkPtr(  ) -> Int64 {

    typealias functionSignature = @convention(c) (  ) -> Int64

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetFkPtr"), to: functionSignature.self)

    return function()
}

public func EnvSetEarthShape( _ earthShape: Int32 ) {

    typealias functionSignature = @convention(c) ( Int32 ) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSetEarthShape"), to: functionSignature.self)

    function(earthShape)
}

public func EnvGetEarthShape(  ) -> Int32 {

    typealias functionSignature = @convention(c) (  ) -> Int32

    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetEarthShape"), to: functionSignature.self)

    return function()
}

// Indexes of Earth Constant fields
//Earth flattening (reciprocal; unitless)
let XF_GEOCON_FF    = 1
//J2 (unitless)
let XF_GEOCON_J2    = 2
//J3 (unitless)
let XF_GEOCON_J3    = 3
//J4 (unitless)
let XF_GEOCON_J4    = 4
//Ke (er**1.5/min)
let XF_GEOCON_KE    = 5
//Earth radius (km/er)
let XF_GEOCON_KMPER = 6
//Earth rotation rate w.r.t. fixed equinox (rad/min)
let XF_GEOCON_RPTIM = 7

//J2/2 (unitless)
let XF_GEOCON_CK2   = 8
//-3/8 J4 (unitless)
let XF_GEOCON_CK4   = 9
//Converts km/sec to er/kem
let XF_GEOCON_KS2EK = 10
//Earth rotation rate w.r.t. fixed equinox (rad/kemin)
let XF_GEOCON_THDOT = 11
//J5 (unitless)
let XF_GEOCON_J5    = 12


// Indexes of FK Constant fields
//Earth rotation rate w.r.t. moving equinox (rad/day)
let XF_FKCON_C1     = 1
//Earth rotation acceleration(rad/day**2)
let XF_FKCON_C1DOT  = 2
//Greenwich angle (1970; rad)
let XF_FKCON_THGR70 = 3

// Indexes represent geopotential models GEO
//Earth constants - JGM2
let XF_GEOMOD_JGM2   =    2
//Earth constants - GEM5
let XF_GEOMOD_GEM5   =    5
//Earth constants - EGM-08
let XF_GEOMOD_EGM08  =    8
//Earth constants - GEM9
let XF_GEOMOD_GEM9   =    9
//Earth constants - STEM68
let XF_GEOMOD_STEM68 =   68
//Earth constants - WGS-72
let XF_GEOMOD_WGS72  =   72
//Earth constants - WGS-84
let XF_GEOMOD_WGS84  =   84
//Earth constants - EGM-96
let XF_GEOMOD_EGM96  =   96
//Invalid earth model
let XF_GEOMOD_UNKNOWN =  100

//*******************************************************************************

// Indexes represent fundamental catalogue FK
//Fundamental Catalog - FK5
let XF_FKMOD_4 = 4
//Fundamental Catalog - FK4
let XF_FKMOD_5 = 5


// ========================= End of auto generated code ==========================
