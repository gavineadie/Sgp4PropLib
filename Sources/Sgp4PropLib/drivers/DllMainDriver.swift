//
//  MainDriver.swift
//
//
//  Created by Gavin Eadie on 12/4/22.
//

import Foundation

/// This is the most important function call of the Astrodynamics Standards libraries.
/// It returns a handle which can be used to access the static global data set needed by the
/// Astrodynamics Standards libraries to communicate among themselves.
///
/// All other function calls within the API will use this handle, so make sure you save this
/// function's return value. This function must be called before any other functions in the
/// library can be called. This applies to the functions in this dynamic library, and in all
/// other dynamic libraries in the library.
///
/// When passing the return value from this function to an initialization routine for another
/// dynamic library (`AstroFunc.AstroFuncInit`, `TimeFunc.TimeFuncInit...`),
/// the initialization routine will check to see if the passed in handle refers to a valid global data set.
/// If you forget to call this function first, the `GetLastErrMsg()` function won't return a
/// correct value.
/// - Returns: A handle to the global data set. You will pass this handle to other
/// initialization functions within other DLLs in the API.
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func dllMainInit() -> Int64 { DllMainInit() }

/// Returns information about the DllMain DLL.
///
/// - Returns: A `String` of information about the DLL version number, build date, and platform.
public func dllMainGetInfo() -> String {

    var infoString = emptyCcharArray(size: INFOSTRLEN)
    DllMainGetInfo(&infoString)
    return String(fromCcharArray: infoString, size: INFOSTRLEN)

}

/// Returns a list of names of the libraries that were initialized successfully.
/// - Returns: A string with the names of the dynamic libraries that were initialized
/// successfully. (out-Character[512])
@available(*, deprecated, message: "This function has been deprecated since v9.0")
public func getInitDllNames() -> String {

    var getNamesString = emptyCcharArray(size: GETSETSTRLEN)
    GetInitDllNames(&getNamesString)
    return String(fromCcharArray: getNamesString, size: GETSETSTRLEN)

}

/// Returns a character string describing the last error that occurred. As a common practice,
/// this function is called to retrieve the error message when an error occurs.
///
/// This function works with or without an opened log file.
///
/// If you call this function before you have called DllMainInit(), the function will
/// return an invalid string. This could result in undefined behavior.
/// - Returns: A string that stores the last logged error message.
public func getLastErrMsg() -> String {

    var messageString = emptyCcharArray(size: LOGMSGLEN)
    GetLastErrMsg(&messageString)
    return String(fromCcharArray: messageString, size: LOGMSGLEN)

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
/// libraries is one of the most common causes of program crashes.)
/// - Returns: A string that stores the last logged informational message.
public func GetLastInfoMsg() -> String {

    var messageString = emptyCcharArray(size: LOGMSGLEN)
    GetLastInfoMsg(&messageString)
    return String(fromCcharArray: messageString, size: LOGMSGLEN)

}

/// Opens a log file and enables the writing of diagnostic information into it.
///
/// All of the DLLs in the library will write diagnostic information into the log file once
/// this function has been called.  If the file specified by logFileName already exists,
/// its contents are erased.
///
/// Enabling logging can potentially result in large amounts of diagnostic information being
/// generated, which can lead to large amounts of storage being consumed as well as
/// performance decreases. For this reason, it is recommended that this function only
/// be used for debugging purposes.
/// - Parameter fileName: The name of the log file to use.
/// - Returns: 0 if the file was opened successfully. Other values indicate an error.
public func openLogFile(_ filePath: String) -> Int {

    Int(OpenLogFile(filePath.cString))

}

/// Writes a message into the log file.
///
/// Make sure the log file is open by calling OpenLogFile before using this function.
///
/// - Parameter message: A message to be written into the log file, limited to 128 characters.
/// If the message is longer than this, it will be truncated.
public func logMessage(_ message: String) {

    LogMessage(message.cString)

}

/// Closes the currently open log file and reset the last logged error message to null.
///
/// Remember to close the log file before exiting the program.
public func closeLogFile() { CloseLogFile() }

/// Loads DllMain-related parameters (AS_MOIC) from a text file
///
/// Whenever the user wants to enter and later retrieve his own input data in an input text file,
/// he can use the predefined input card “AS_MOIC” format to fulfil that. This input card allows
/// up to 128 numeric data fields. It’s a free format and the only requirement is that data fields
/// are separated by commas or white spaces.
///
/// - Parameter filePath: The name of the input file.
/// - Returns: zero indicating the input file has been loaded successfully. Other values indicate an error.
public func dllMainLoadFile(_ filePath: String) -> Int {

    Int(DllMainLoadFile(filePath.cString))

}
