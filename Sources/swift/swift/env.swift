//
//  env.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/17/22.
//

import Foundation
import obj_c

fileprivate let libenvconstHandle = loadDll("libenvconst.dylib")

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

public func envInit(_ dllHandle: Int64) -> Int32 {

    guard let envInitPointer = dlsym(libenvconstHandle, "EnvInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias EnvInitFunction = fnPtrEnvInit
    let envInit = unsafeBitCast(envInitPointer, to: EnvInitFunction.self)
    return envInit(dllHandle)

}

public func envGetInfo() -> String {

    guard let envGetInfoPointer = dlsym(libenvconstHandle, "EnvGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias EnvGetInfoFunction = fnPtrEnvGetInfo
    let envGetInfo = unsafeBitCast(envGetInfoPointer, to: EnvGetInfoFunction.self)
    envGetInfo(&info128); info128[127] = 0
    return String(cString: info128).trimRight()

}
