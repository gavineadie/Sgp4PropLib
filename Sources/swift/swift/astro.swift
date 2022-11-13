//
//  astro.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation

fileprivate let libAstroFuncHandle = loadDll("libastrofunc.dylib")

public func astroFuncInit(_ dllHandle: Int64) -> Int32 {

    guard let astroFuncInitPointer = dlsym(libAstroFuncHandle, "AstroFuncInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias AstroFuncInitFunction = @convention(c) (Int64) -> Int32
    let astroFuncInit = unsafeBitCast(astroFuncInitPointer, to: AstroFuncInitFunction.self)
    return astroFuncInit(dllHandle)

}

public func astroFuncGetInfo() -> String {

    guard let astroFuncGetInfoPointer = dlsym(libAstroFuncHandle, "AstroFuncGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias AstroFuncGetInfoFunction = @convention(c) (UnsafeMutablePointer<Int8>) -> Void
    let astroFuncGetInfo = unsafeBitCast(astroFuncGetInfoPointer, to: AstroFuncGetInfoFunction.self)
    astroFuncGetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}
