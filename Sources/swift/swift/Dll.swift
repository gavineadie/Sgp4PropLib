//
//  dll.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/15/22.
//

import Foundation
import obj_c

fileprivate let libHandle = loadDll("libdllmain.dylib")

// -------------------------------- DLLMAININIT
// ORIGINAL:     __int64 DllMainInit()

public func DllMainInit() -> Int64 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "DllMainInit"),
                                 to: fnPtrDllMainInit.self)
    
    return function()
}

// -------------------------------- DLLMAINGETINFO
// ORIGINAL:     void DllMainGetInfo((out-Character[128]) infoStr)

public func DllMainGetInfo(_ infoStr: UnsafeMutablePointer<CChar>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "DllMainGetInfo"),
                                 to: fnPtrDllMainGetInfo.self)
    
    function(infoStr)
}

// -------------------------------- DLLMAINLOADFILE
// ORIGINAL:     int DllMainLoadFile((in-Character[512]) dllMainFile)

public func DllMainLoadFile(_ dllMainFile: UnsafeMutablePointer<CChar>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "DllMainLoadFile"),
                                 to: fnPtrDllMainLoadFile.self)
    
    return function(dllMainFile)
}

// -------------------------------- OPENLOGFILE
// ORIGINAL:     int OpenLogFile((in-Character[512]) fileName)

public func OpenLogFile(_ fileName: UnsafeMutablePointer<CChar>) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "OpenLogFile"),
                                 to: fnPtrOpenLogFile.self)
    
    return function(fileName)
}

// -------------------------------- CLOSELOGFILE
// ORIGINAL:     void CloseLogFile()

public func CloseLogFile() {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "CloseLogFile"),
                                 to: fnPtrCloseLogFile.self)
    
    function()
}

// -------------------------------- LOGMESSAGE
// ORIGINAL:     void LogMessage((in-Character[128]) msgStr)

public func LogMessage(_ msgStr: UnsafeMutablePointer<CChar>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "LogMessage"),
                                 to: fnPtrLogMessage.self)
    
    function(msgStr)
}

// -------------------------------- GETLASTERRMSG
// ORIGINAL:     void GetLastErrMsg((out-Character[128]) lastErrMsg)

public func GetLastErrMsg(_ lastErrMsg: UnsafeMutablePointer<CChar>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "GetLastErrMsg"),
                                 to: fnPtrGetLastErrMsg.self)
    
    function(lastErrMsg)
}

// -------------------------------- GETLASTINFOMSG
// ORIGINAL:     void GetLastInfoMsg((out-Character[128]) lastInfoMsg)

public func GetLastInfoMsg(_ lastInfoMsg: UnsafeMutablePointer<CChar>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "GetLastInfoMsg"),
                                 to: fnPtrGetLastInfoMsg.self)
    
    function(lastInfoMsg)
}

// -------------------------------- GETINITDLLNAMES
// ORIGINAL:     void GetInitDllNames((out-Character[512]) initDllNames)

public func GetInitDllNames(_ initDllNames: UnsafeMutablePointer<CChar>) {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "GetInitDllNames"),
                                 to: fnPtrGetInitDllNames.self)
    
    function(initDllNames)
}

// -------------------------------- SETELSETKEYMODE
// ORIGINAL:     int SetElsetKeyMode((in-Integer) elset_keyMode)

public func SetElsetKeyMode(_ elset_keyMode: Int32) -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "SetElsetKeyMode"),
                                 to: fnPtrSetElsetKeyMode.self)
    
    return function(elset_keyMode)
}

// -------------------------------- GETELSETKEYMODE
// ORIGINAL:     int GetElsetKeyMode()

public func GetElsetKeyMode() -> Int32 {
    
    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "GetElsetKeyMode"),
                                 to: fnPtrGetElsetKeyMode.self)
    
    return function()
}
