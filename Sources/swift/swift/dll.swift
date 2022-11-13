//
//  dll.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/15/22.
//

import Foundation
import obj_c

fileprivate let libdllmainHandle = loadDll("libdllmain.dylib")

public func dllMainInit() -> Int64 {

    guard let mainInitPointer = dlsym(libdllmainHandle, "DllMainInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias MainInitFunction = fnPtrDllMainInit // @convention(c) () -> Int64
    let mainInit = unsafeBitCast(mainInitPointer, to: MainInitFunction.self)

    return mainInit()
}

public func dllMainGetInfo() -> String {

    guard let mainGetInfoPointer = dlsym(libdllmainHandle, "DllMainGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias MainGetInfoFunction = @convention(c) (UnsafeMutablePointer<Int8>) -> Void

    var info128 = Array(repeating: Int8(0), count: Int(128))
    let dllMainGetInfo = unsafeBitCast(mainGetInfoPointer, to: MainGetInfoFunction.self)
    dllMainGetInfo(&info128); info128[Int(128)-1] = 0

    return String(cString: info128).trimRight()
}

public func getInitDllNames() -> String {

    guard let getInitDllNamesPointer = dlsym(libdllmainHandle, "GetInitDllNames") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info512 = Array(repeating: Int8(0), count: 512)

    typealias getInitDllNamesFunction = @convention(c) (UnsafeMutablePointer<Int8>) -> Void
    let getInitDllNames = unsafeBitCast(getInitDllNamesPointer,
                                        to: getInitDllNamesFunction.self)
    getInitDllNames(&info512);info512[511] = 0

    return String(cString: info512).trimmingCharacters(in: .whitespaces)
}

public func GetLastErrMsg() -> String {

    guard let getLastErrMsgPointer = dlsym(libdllmainHandle, "GetLastErrMsg") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias GetLastErrMsgFunction = @convention(c) (UnsafeMutablePointer<Int8>) -> Void
    let getLastErrMsg = unsafeBitCast(getLastErrMsgPointer,
                                      to: GetLastErrMsgFunction.self)
    getLastErrMsg(&info128); info128[127] = 0

    return String(cString: info128).trimmingCharacters(in: .whitespaces)
}

public func GetLastInfoMsg() -> String {

    guard let getLastInfoMsgPointer = dlsym(libdllmainHandle, "GetLastInfoMsg") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: 128)

    typealias GetLastInfoMsgFunction = @convention(c) (UnsafeMutablePointer<Int8>) -> Void
    let getLastInfoMsg = unsafeBitCast(getLastInfoMsgPointer,
                                       to: GetLastInfoMsgFunction.self)
    getLastInfoMsg(&info128); info128[127] = 0

    return String(cString: info128).trimmingCharacters(in: .whitespaces)
}

public func OpenLogFile(fileName: String) -> Int64 {
    guard let openLogFilePointer = dlsym(libdllmainHandle, "OpenLogFile") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias OpenLogFileFunction = @convention(c) (UnsafePointer<UInt8>) -> Int64

    let openLogFile = unsafeBitCast(openLogFilePointer,
                                    to: OpenLogFileFunction.self)

    return openLogFile(Array((fileName + "\0").utf8))
}

public func LogMessage(message: String) -> Void {
    guard let logMessagePointer = dlsym(libdllmainHandle, "LogMessage") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias LogMessageFunction = @convention(c) (UnsafePointer<UInt8>) -> Void

    let logMessage = unsafeBitCast(logMessagePointer,
                                   to: LogMessageFunction.self)

    logMessage(Array((message + "\0").utf8))
}

public func CloseLogFile() -> Void {
    guard let closeLogFilePointer = dlsym(libdllmainHandle, "CloseLogFile") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias CloseLogFileFunction = @convention(c) () -> Void

    let closeLogFile = unsafeBitCast(closeLogFilePointer,
                                     to: CloseLogFileFunction.self)

    closeLogFile()
}
