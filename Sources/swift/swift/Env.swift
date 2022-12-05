//
//  env.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libHandle = loadDll("libenvconst.dylib")

// -------------------------------- ENVINIT
// ORIGINAL:     int EnvInit((in-Long) apPtr)

public func EnvInit(_ apPtr: Int64) -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvInit"),
                          to: fnPtrEnvInit.self)

    return function(apPtr)
}

// -------------------------------- ENVGETINFO
// ORIGINAL:     void EnvGetInfo((out-Character[128]) infoStr)

public func EnvGetInfo(_ infoStr: UnsafeMutablePointer<CChar>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvGetInfo"),
                          to: fnPtrEnvGetInfo.self)

    function(infoStr)
}

// -------------------------------- ENVLOADFILE
// ORIGINAL:     int EnvLoadFile((in-Character[512]) envFile)

public func EnvLoadFile(_ envFile: UnsafeMutablePointer<CChar>) -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvLoadFile"),
                          to: fnPtrEnvLoadFile.self)

    return function(envFile)
}

// -------------------------------- ENVSAVEFILE
// ORIGINAL:     int EnvSaveFile((in-Character[512]) envConstFile, (in-Integer) saveMode, (in-Integer) saveForm)

public func EnvSaveFile(_ envConstFile: UnsafeMutablePointer<CChar>, _ saveMode: Int32, _ saveForm: Int32) -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvSaveFile"),
                          to: fnPtrEnvSaveFile.self)

    return function(envConstFile, saveMode, saveForm)
}

// -------------------------------- ENVGETFKIDX
// ORIGINAL:     int EnvGetFkIdx()

public func EnvGetFkIdx() -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvGetFkIdx"),
                          to: fnPtrEnvGetFkIdx.self)

    return function()
}

// -------------------------------- ENVSETFKIDX
// ORIGINAL:     void EnvSetFkIdx((in-Integer) xf_FkMod)

public func EnvSetFkIdx(_ xf_FkMod: Int32) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvSetFkIdx"),
                          to: fnPtrEnvSetFkIdx.self)

    function(xf_FkMod)
}

// -------------------------------- ENVGETGEOIDX
// ORIGINAL:     int EnvGetGeoIdx()

public func EnvGetGeoIdx() -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvGetGeoIdx"),
                          to: fnPtrEnvGetGeoIdx.self)

    return function()
}

// -------------------------------- ENVSETGEOIDX
// ORIGINAL:     void EnvSetGeoIdx((in-Integer) xf_GeoMod)

public func EnvSetGeoIdx(_ xf_GeoMod: Int32) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvSetGeoIdx"),
                          to: fnPtrEnvSetGeoIdx.self)

    function(xf_GeoMod)
}

// -------------------------------- ENVGETGEOSTR
// ORIGINAL:     void EnvGetGeoStr((out-Character[6]) geoStr)

public func EnvGetGeoStr(_ geoStr: UnsafeMutablePointer<CChar>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvGetGeoStr"),
                          to: fnPtrEnvGetGeoStr.self)

    function(geoStr)
}

// -------------------------------- ENVSETGEOSTR
// ORIGINAL:     void EnvSetGeoStr((in-Character[6]) geoStr)

public func EnvSetGeoStr(_ geoStr: UnsafeMutablePointer<CChar>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvSetGeoStr"),
                          to: fnPtrEnvSetGeoStr.self)

    function(geoStr)
}

// -------------------------------- ENVGETGEOCONST
// ORIGINAL:     double EnvGetGeoConst((in-Integer) xf_GeoCon)

public func EnvGetGeoConst(_ xf_GeoCon: Int32) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvGetGeoConst"),
                          to: fnPtrEnvGetGeoConst.self)

    return function(xf_GeoCon)
}

// -------------------------------- ENVGETFKCONST
// ORIGINAL:     double EnvGetFkConst((in-Integer) xf_FkCon)

public func EnvGetFkConst(_ xf_FkCon: Int32) -> Double {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvGetFkConst"),
                          to: fnPtrEnvGetFkConst.self)

    return function(xf_FkCon)
}

// -------------------------------- ENVGETFKPTR
// ORIGINAL:     __int64 EnvGetFkPtr()

public func EnvGetFkPtr() -> Int64 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvGetFkPtr"),
                          to: fnPtrEnvGetFkPtr.self)

    return function()
}

// -------------------------------- ENVSETEARTHSHAPE
// ORIGINAL:     void EnvSetEarthShape((in-Integer) earthShape)

public func EnvSetEarthShape(_ earthShape: Int32) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvSetEarthShape"),
                          to: fnPtrEnvSetEarthShape.self)

    function(earthShape)
}

// -------------------------------- ENVGETEARTHSHAPE
// ORIGINAL:     int EnvGetEarthShape()

public func EnvGetEarthShape() -> Int32 {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "EnvGetEarthShape"),
                          to: fnPtrEnvGetEarthShape.self)

    return function()
}
