//
//  dll.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/15/22.
//

import Foundation
import obj_c

fileprivate let libdllmainHandle = loadDll("libdllmain.dylib")

/// This is the most important function call of the *Standardized Astrodynamic Algorithms library*.
/// It returns a handle which can be used to access the static global data set needed by the
/// Standardized Astrodynamic Algorithms dynamic libraries to communicate among themselves.
///
/// All other function calls within the API will use this handle, so make sure you save this
/// function's return value. This function must be called before any other functions in the
/// library can be called. This applies to the functions in this dynamic library, and in all
/// other dynamic libraries in the library.
///
/// When passing the return value from this function to an initialization routine for another
/// dynamic library (`AstroFunc.AstroFuncInit`, `TimeFunc.TimeFuncInit...`), the initialization routine will check to see if the passed in handle refers to a valid global data set.
/// If you forget to call this function first, the `GetLastErrMsg()` function won't return a
/// correct value.
/// - Returns: A handle to the global data set. You will pass this handle to other initialization functions within other DLLs in the API.
public func dllMainInit() -> Int64 {

    guard let mainInitPointer = dlsym(libdllmainHandle, "DllMainInit") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias MainInitFunction = fnPtrDllMainInit
    let mainInit = unsafeBitCast(mainInitPointer, to: MainInitFunction.self)

    return mainInit()
}

/// Returns information about the DllMain DLL.
///
/// The returned string provides information about the version number, build date, and the platform.
/// - Returns: A string holding the information about DllMain.dll. (out-Character[128])
public func dllMainGetInfo() -> String {

    guard let mainGetInfoPointer = dlsym(libdllmainHandle, "DllMainGetInfo") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias MainGetInfoFunction = fnPtrDllMainGetInfo

    var info128 = Array(repeating: Int8(0), count: Int(INFOSTRLEN))
    let dllMainGetInfo = unsafeBitCast(mainGetInfoPointer, to: MainGetInfoFunction.self)
    dllMainGetInfo(&info128); info128[Int(INFOSTRLEN)-1] = 0

    return String(cString: info128).trimRight()
}

/// Returns a list of names of the Standardized Astrodynamic Algorithms dynamic
/// libraries that were initialized successfully.
/// - Returns: A string with the names of the dynamic libraries that were initialized
/// successfully. (out-Character[512])
public func getInitDllNames() -> String {

    guard let getInitDllNamesPointer = dlsym(libdllmainHandle, "GetInitDllNames") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info512 = Array(repeating: Int8(0), count: Int(GETSETSTRLEN))

    typealias getInitDllNamesFunction = fnPtrGetInitDllNames
    let getInitDllNames = unsafeBitCast(getInitDllNamesPointer,
                                        to: getInitDllNamesFunction.self)
    getInitDllNames(&info512);info512[Int(GETSETSTRLEN)-1] = 0

    return String(cString: info512).trimmingCharacters(in: .whitespaces)
}

/// Returns a character string describing the last error that occurred. As a common practice,
/// this function is called to retrieve the error message when an error occurs.
///
/// This function works with or without an opened log file.
///
/// If you call this function before you have called DllMainInit(), the function will
/// return an invalid string. This could result in undefined behavior.
/// - Returns: A string that stores the last logged error message. (out-Character[128])
public func GetLastErrMsg() -> String {

    guard let getLastErrMsgPointer = dlsym(libdllmainHandle, "GetLastErrMsg") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: Int(LOGMSGLEN))

    typealias GetLastErrMsgFunction = fnPtrGetLastErrMsg
    let getLastErrMsg = unsafeBitCast(getLastErrMsgPointer,
                                      to: GetLastErrMsgFunction.self)
    getLastErrMsg(&info128); info128[Int(LOGMSGLEN)-1] = 0

    return String(cString: info128).trimmingCharacters(in: .whitespaces)
}

/// Returns a character string describing the last informational message that was recorded.
///
/// This function is usually called right after space objects (TLEs, VCMs, sensors,
/// observations, etc.) in an input text file were loaded. It gives information about how
/// many records were successfully loaded, how many were bad, and how many were
/// duplicated.
///
/// This function works with or without an opened log file.
/// If you call this function before you have called `DllMainInit()`, the function will
/// return an invalid string. This could result in undefined behavior.
///
/// (This function provides a quick way to check whether all of the prerequisite
/// dynamic libraries have been loaded and initialized correctly. Improper initialization of the
/// Standardized Astrodynamic Algorithms dynamic libraries is one of the most common
/// causes of program crashes.)
/// - Returns: A string that stores the last logged informational message. (out-Character[128])
public func GetLastInfoMsg() -> String {

    guard let getLastInfoMsgPointer = dlsym(libdllmainHandle, "GetLastInfoMsg") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    var info128 = Array(repeating: Int8(0), count: Int(LOGMSGLEN))

    typealias GetLastInfoMsgFunction = fnPtrGetLastInfoMsg
    let getLastInfoMsg = unsafeBitCast(getLastInfoMsgPointer, to: GetLastInfoMsgFunction.self)
    getLastInfoMsg(&info128); info128[Int(LOGMSGLEN)-1] = 0

    return String(cString: info128).trimmingCharacters(in: .whitespaces)
}

/// Opens a log file and enables the writing of diagnostic information into it.
///
/// All of the DLLs in the library will write diagnostic information into the log file once this function has been called.  If the file specified by logFileName already exists, its contents are erased.
///
/// Enabling logging can potentially result in large amounts of diagnostic information being
/// generated, which can lead to large amounts of storage being consumed as well as
/// performance decreases. For this reason, it is recommended that this function only
/// be used for debugging purposes.
/// - Parameter fileName: The name of the log file to use. (in-Character[512])
/// - Returns: 0 if the file was opened successfully. Other values indicate an error.
public func OpenLogFile(fileName: String) -> Int32 {
    guard let openLogFilePointer = dlsym(libdllmainHandle, "OpenLogFile") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }
    
    typealias OpenLogFileFunction = fnPtrOpenLogFile
    let openLogFile = unsafeBitCast(openLogFilePointer, to: OpenLogFileFunction.self)

    return fileName.withCString {
        openLogFile(UnsafeMutablePointer(mutating: $0))
    }
}

/// Writes a message into the log file.
///
/// Make sure the log file is open by calling OpenLogFile before using this function.
///
/// - Parameter message: A message to be written into the log file, limited to 128 characters.
/// If the message is longer than this, it will be truncated. (in-Character[128])
public func LogMessage(message: String) {
    guard let logMessagePointer = dlsym(libdllmainHandle, "LogMessage") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias LogMessageFunction = fnPtrLogMessage
    let logMessage = unsafeBitCast(logMessagePointer, to: LogMessageFunction.self)

    logMessage(makeCString(from: message))
}

/// Closes the currently open log file and reset the last logged error message to null.
///
/// Remember to close the log file before exiting the program.
public func CloseLogFile() {
    guard let closeLogFilePointer = dlsym(libdllmainHandle, "CloseLogFile") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias CloseLogFileFunction = fnPtrCloseLogFile

    let closeLogFile = unsafeBitCast(closeLogFilePointer,
                                     to: CloseLogFileFunction.self)

    closeLogFile()
}

// ---------------- AUTO GENERATED ----------------

public func SetElsetKeyMode(_ elset_keyMode: Int32) -> Int32 {

    guard let SetElsetKeyModePointer = dlsym(libdllmainHandle, "SetElsetKeyMode") else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }

    typealias SetElsetKeyModeFunction = fnPtrSetElsetKeyMode
    let SetElsetKeyMode = unsafeBitCast(SetElsetKeyModePointer, to: SetElsetKeyModeFunction.self)

    return SetElsetKeyMode(elset_keyMode)

}

