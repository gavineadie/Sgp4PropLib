// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation
import Sgp4Prop_c

#if os(Linux)
fileprivate let libHandle = loadDll("libenvconst.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("EnvConst.dll")
#else
fileprivate let libHandle = loadDll("libenvconst.dylib")
#endif

public func EnvInit(_ apAddr: Int64) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvInit"), to: fnPtrEnvInit.self)

    return function(apAddr)
}

public func EnvGetInfo(_ infoStr: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetInfo"), to: fnPtrEnvGetInfo.self)

    function(infoStr)
}

public func EnvLoadFile(_ envFile: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvLoadFile"), to: fnPtrEnvLoadFile.self)

    return function(envFile)
}

public func EnvSaveFile(_ envConstFile: UnsafeMutablePointer<CChar>, _ saveMode: Int32, _ saveForm: Int32) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSaveFile"), to: fnPtrEnvSaveFile.self)

    return function(envConstFile, saveMode, saveForm)
}

public func EnvGetFkIdx() -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetFkIdx"), to: fnPtrEnvGetFkIdx.self)

    return function()
}

public func EnvSetFkIdx(_ xf_FkMod: Int32) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSetFkIdx"), to: fnPtrEnvSetFkIdx.self)

    function(xf_FkMod)
}

public func EnvGetGeoIdx() -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetGeoIdx"), to: fnPtrEnvGetGeoIdx.self)

    return function()
}

public func EnvSetGeoIdx(_ xf_GeoMod: Int32) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSetGeoIdx"), to: fnPtrEnvSetGeoIdx.self)

    function(xf_GeoMod)
}

public func EnvGetGeoStr(_ geoStr: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetGeoStr"), to: fnPtrEnvGetGeoStr.self)

    function(geoStr)
}

public func EnvSetGeoStr(_ geoStr: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSetGeoStr"), to: fnPtrEnvSetGeoStr.self)

    function(geoStr)
}

public func EnvGetGeoConst(_ xf_GeoCon: Int32) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetGeoConst"), to: fnPtrEnvGetGeoConst.self)

    return function(xf_GeoCon)
}

public func EnvGetFkConst(_ xf_FkCon: Int32) -> Double {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetFkConst"), to: fnPtrEnvGetFkConst.self)

    return function(xf_FkCon)
}

public func EnvGetFkPtr() -> Int64 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetFkPtr"), to: fnPtrEnvGetFkPtr.self)

    return function()
}

public func EnvSetEarthShape(_ earthShape: Int32) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvSetEarthShape"), to: fnPtrEnvSetEarthShape.self)

    function(earthShape)
}

public func EnvGetEarthShape() -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "EnvGetEarthShape"), to: fnPtrEnvGetEarthShape.self)

    return function()
}
// ========================= End of auto generated code ==========================
