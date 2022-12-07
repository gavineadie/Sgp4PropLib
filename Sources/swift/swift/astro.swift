//
//  astro.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libHandle = loadDll("libastrofunc.dylib")

public func astroFuncInit(_ dllHandle: Int64) -> Int32 {

    guard let astroFuncInitPointer = dlsym(libHandle, "AstroFuncInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias AstroFuncInitFunction = fnPtrAstroFuncInit
    let astroFuncInit = unsafeBitCast(astroFuncInitPointer, to: AstroFuncInitFunction.self)

    return astroFuncInit(dllHandle)

}

public func astroFuncGetInfo() -> String {

    guard let astroFuncGetInfoPointer = dlsym(libHandle, "AstroFuncGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias AstroFuncGetInfoFunction = fnPtrAstroFuncGetInfo
    let astroFuncGetInfo = unsafeBitCast(astroFuncGetInfoPointer, to: AstroFuncGetInfoFunction.self)
    astroFuncGetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}

// ---------------- AUTO GENERATED ----------------
