// This wrapper file was generated automatically by the GenDllWrappers program.

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
// ========================= End of auto generated code ==========================
