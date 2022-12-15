//
//  Services.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/16/22.
//

import Foundation

public func loadAllDlls() {
    let globalHandle = DllMainInit()
    guard EnvInit(globalHandle) == 0 else { fatalError("envInit load failure") }
    guard TimeFuncInit(globalHandle) == 0 else { fatalError("timeFuncInit load failure") }
    guard AstroFuncInit(globalHandle) == 0 else { fatalError("astroFuncInit load failure") }
    guard TleInit(globalHandle) == 0 else { fatalError("tleInit load failure") }
    guard Sgp4Init(globalHandle) == 0 else { fatalError("sgp4Init load failure") }
}

public func loadDll(_ dllName: String) -> UnsafeMutableRawPointer {
    guard let dllHandle = dlopen(getDylibPath() + dllName, RTLD_NOW) else {
        fatalError("Could not open \(getDylibPath() + dllName) \(String(cString: dlerror()))")
    }

    return dllHandle
}

func getDylibPath() -> String {
    //    if let dylibDirectory = ProcessInfo.processInfo.environment["LD_LIBRARY_PATH"] {
    //        return dylibDirectory + "/"
    //    }
    
    return "/usr/local/lib/sgp4prop/"
}

func freeDll(_ dllHandle: UnsafeMutableRawPointer) -> Int32 {
    return dlclose(dllHandle)
}

//TODO: FINISH THIS
public func freeAllDlls() {
}

extension String {
    
    public func trimRight() -> String {
        String(reversed().drop { $0.isWhitespace }.reversed())
    }
}

func getFunctionPointer(_ libHandle: UnsafeMutableRawPointer?,
                        _ functionName: String) -> UnsafeMutableRawPointer {
    
    guard let functionPointer = dlsym(libHandle, functionName) else {
        fatalError("dlsym failure: \(String(cString: dlerror()))")
    }
    
    return functionPointer
}

// -----

// There is a UInt8(ascii:) initialiser but not one for CChar.
// If you need to do this a lot, add one yourself:
// Then you can do CChar(ascii: "A").

extension CChar {
    public init(ascii v: Unicode.Scalar) {
        self = CChar(bitPattern: UInt8(ascii: v))
    }
}

extension RangeReplaceableCollection {
    
    /// If not already at least the given length, appends enough copies of a
    /// given element to reach that length.
    public mutating func pad(toLength count: Int, with element: Element) {
        append(contentsOf: repeatElement(element, count: Swift.max(0, count - self.count)))
    }
}

extension StringProtocol {
    var data: Data { .init(utf8) }
    var bytes: [UInt8] { .init(utf8) }
}

// ----------------


// convert "char line1[512]" to String

// https://duan.ca/2020/09/09/free-c-strings/

func c128_to_s(c: UnsafePointer<CUnsignedChar>) -> String {
    String(cString: c)
}

// https://developer.apple.com/documentation/swift/string/init(cstring:)-2p84k


public func makeCString(from str: String) -> UnsafeMutablePointer<Int8> {
    let count = str.utf8.count + 1
    let result = UnsafeMutablePointer<Int8>.allocate(capacity: count)
    str.withCString { (baseAddress) in
        result.initialize(from: baseAddress, count: count)
    }
    return result
}

// ---------------- Time Services ---------------- //

extension Date {
    /// The number of seconds from 1 January 1950 to the reference date, 1 January 2001.
    public static let timeIntervalBetween1950AndReferenceDate: TimeInterval = 1_609_545_600.0   // 86,400 sec/day -> 18,629 days
    
    /// Returns a `Date` initialized relative to 00:00:00 UTC on 1 January 1950 by a given number of seconds.
    public init(timeIntervalSince1950: TimeInterval) {
        self.init(timeIntervalSinceReferenceDate: timeIntervalSince1950 - Date.timeIntervalBetween1950AndReferenceDate)
    }
}

/// Converts a Swift `Date` type to days since 1950-01-01 (ds50UTC)
/// - Parameter date: a `Date`
/// - Returns: days since 1950
public func dateToUTC(_ date: Date) -> Double {
    return date.timeIntervalSince(Date(timeIntervalSince1950: 0.0)) / (60*1440)
}

public func printWarning(_ softwareName: String) {
    print(
        """
        **********************************************************
        *                                                        *
        *  \(softwareName.uppercased()
                .padding(toLength: 50, withPad: " ", startingAt: 0))    *
        *                                                        *
        *                      W A R N I N G                     *
        *  THIS SOFTWARE CONTAINS TECHNICAL DATA WHOSE EXPORT IS *
        *  RESTRICTED BY THE ARMS EXPORT CONTROL ACT (TITLE 22,  *
        *  USC, SEC 2751 ) OR EXECUTIVE ORDER 12470. VIOLATORS   *
        *  OF EXPORT LAWS ARE SUBJECT TO SEVERE CRIMINAL         *
        *  PENALTIES.                                            *
        *                 D I S T R I B U T I O N                *
        *  DISTRIBUTION IS AUTHORIZED TO US GOVERNMENT AGENCIES  *
        *  AND THEIR CONTRACTORS FOR OFFICIAL USE ON A NEED TO   *
        *  KNOW BASIS ONLY. ALL REQUESTS FOR THIS SOFTWARE SHALL *
        *  BE REFERRED TO AFSPC/A9.  NO SOFTWARE CODE, MANUAL,   *
        *  OR MEDIA CONTAINING ANY REPRESENTATION OF THE UNITED  *
        *  STATES AIR FORCE (USAF), HQ AIR FORCE SPACE COMMAND   *
        *  (AFSPC) SPACE ANALYSIS CENTER (ASAC) [AFSPC/A9]       *
        *  CAPABILITY MAY BE ASSIGNED, COPIED, OR TRANSFERRED TO *
        *  ANY NON-AUTHORIZED PERSON, CONTRACTOR, OR GOVERNMENT  *
        *  AGENCY WITHOUT THE EXPRESSED WRITTEN CONSENT OF       *
        *               USAF, HQ AFSPC/A9.                       *
        **********************************************************
        """
    )
}

//TODO: MOVE TO SERVICES

/// Obtains the URL of the directory created at the URL `inURL`
/// - Parameters:
///   - inURL: the URL of the target folder.
///   - called: the name of the directory.
/// - Returns: the URL of the directory.
public func createDirectory(_ called: String, at: URL) -> URL {

    do {
        try FileManager.default.createDirectory(atPath: called, withIntermediateDirectories: true)
    } catch {
        print("creation of directory \(at) failed: \(error)")
    }

    return URL(fileURLWithPath: called, isDirectory: true, relativeTo: at)

}

/// Obtains the URL of the directory created at the URL `inURL`
/// - Parameters:
///   - inURL: the URL of the target folder.
///   - called: the name of the (existing) file.
/// - Returns: the URL of the file
public func createFile(_ called: String, inURL: URL) -> URL {

    let fileURL = URL(fileURLWithPath: called, relativeTo: inURL)

    do {
        try Data().write(to: fileURL)
    } catch {
        print("creation of file \(called) failed: \(error)")
    }

    return fileURL

}
/// Obtains the URL of the (existing file) at the URL `inURL`
/// - Parameters:
///   - inURL: the URL of the target folder.
///   - called: the name of the (existing) file.
/// - Returns: the URL of the file
public func selectFile(_ called: String, inURL: URL) -> URL {

    URL(fileURLWithPath: called, relativeTo: inURL)

}

public func writeString(_ string: String, toURL: URL, appending: Bool = true, terminator: String = "\n") {

    if let fileHandle = try? FileHandle(forWritingTo: toURL) {
        if appending { fileHandle.seekToEndOfFile() }           // moving pointer to the end
        fileHandle.write((string + terminator).data(using: .utf8)!)            // adding content
        fileHandle.closeFile()                                  // closing the file
    } else {
        print("data not written")
    }

}
