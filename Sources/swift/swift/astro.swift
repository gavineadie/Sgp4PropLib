//
//  astro.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libAstroFuncHandle = loadDll("libastrofunc.dylib")

public func astroFuncInit(_ dllHandle: Int64) -> Int32 {

    guard let astroFuncInitPointer = dlsym(libAstroFuncHandle, "AstroFuncInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias AstroFuncInitFunction = fnPtrAstroFuncInit
    let astroFuncInit = unsafeBitCast(astroFuncInitPointer, to: AstroFuncInitFunction.self)
    return astroFuncInit(dllHandle)

}

public func astroFuncGetInfo() -> String {

    guard let astroFuncGetInfoPointer = dlsym(libAstroFuncHandle, "AstroFuncGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias AstroFuncGetInfoFunction = fnPtrAstroFuncGetInfo
    let astroFuncGetInfo = unsafeBitCast(astroFuncGetInfoPointer, to: AstroFuncGetInfoFunction.self)
    astroFuncGetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}

// ---------------- AUTO GENERATED ----------------

public func NToA(_ n: Double) -> Double {

    guard let NToAPointer = dlsym(libAstroFuncHandle, "NToA") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias NToAFunction = fnPtrNToA
    let NToA = unsafeBitCast(NToAPointer, to: NToAFunction.self)

    return NToA(n)

}

public func AToN(_ a: Double) -> Double {

    guard let AToNPointer = dlsym(libAstroFuncHandle, "AToN") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias AToNFunction = fnPtrAToN
    let AToN = unsafeBitCast(AToNPointer, to: AToNFunction.self)

    return AToN(a)

}
