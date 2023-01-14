//
//  Services.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/16/22.
//

import Foundation
import Sgp4Prop_c

public var libHandles = [UnsafeMutableRawPointer]()

//
//MARK: Dynamic Library Services
//
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

    libHandles.append(dllHandle)                   // put another handle in the pile

    return dllHandle
}

//
//TODO: I'm not too proud of this .. I need a better way
//

func getDylibPath() -> String {
    if let dylibDirectory = ProcessInfo.processInfo.environment["LD_LIBRARY_PATH"] {
        return dylibDirectory + "/"
    }

    return "/usr/local/lib/sgp4prop/"
}

func getFunctionPointer(_ libHandle: UnsafeMutableRawPointer?,
                        _ functionName: String) -> UnsafeMutableRawPointer {

    guard let functionPointer = dlsym(libHandle, functionName) else {
        fatalError("dlsym failure: \(String(cString: dlerror())) (freed dylib?)")
    }

    return functionPointer
}

public func freeAllDlls() {
    if libHandles.count > 0 {
        for i in (0..<libHandles.count).reversed() {  // reverse, so the array is diminished from the tail
            guard 0 == freeDll(libHandles[i]) else {
                fatalError("dlclose failure: \(String(cString: dlerror()))")
            }
            libHandles.remove(at: i)
        }
    }
}

func freeDll(_ dllHandle: UnsafeMutableRawPointer) -> Int32 {
    return dlclose(dllHandle)
}

public func verifyDLLs() {

    print(dllMainGetInfo())
    print(envGetInfo())
    print(timeFuncGetInfo())
    print(astroFuncGetInfo())
    print(tleGetInfo())
    print(sgp4GetInfo())

}

//
//MARK: String Extension
//

extension String {

    public func trimRight() -> String {
        String(reversed().drop { $0.isWhitespace }.reversed())
    }

    func stringToTmpFile(_ fileName: String) -> String {

        let urlForString = createFile(fileName, inside: FileManager.default.temporaryDirectory)
        do {
            try self.write(to: urlForString, atomically: false, encoding: .ascii)
        } catch {
            print("stringToTmpFile: \(error.localizedDescription)")
        }

        return urlForString.path
    }

}

// ----------------

// There is a UInt8(ascii:) initialiser but not one for CChar.
// If you need to do this a lot, add one yourself:
// Then you can do CChar(ascii: "A").

extension CChar {                       // Extend CChar's functionality for shortcut ..
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

//
//MARK: Date Extension
//

extension Date {
    /// The number of seconds from 1 January 1950 to the reference date, 1 January 2001.
    public static let timeIntervalBetween1950AndReferenceDate: TimeInterval = 1_609_545_600.0   // 86,400 sec/day -> 18,629 days

    /// Returns a `Date` initialized relative to 00:00:00 UTC on 1 January 1950 by a given number of seconds.
    public init(timeIntervalSince1950: TimeInterval) {
        self.init(timeIntervalSinceReferenceDate: timeIntervalSince1950 - Date.timeIntervalBetween1950AndReferenceDate)
    }
}

/// Converts a Swift `Date` type to days since 1950-00-00 (ds50UTC)
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

/// Obtains the URL of the directory created at `dirPath`
/// - Parameters:
///   - dirPath: absolute path of the directory to create.
/// - Returns: the URL of the directory.
public func createDirectory(_ dirPath: String) -> URL {

    do {
        try FileManager.default.createDirectory(atPath: dirPath,
                                                withIntermediateDirectories: true)
    } catch {
        print("creation of directory \(dirPath) failed: \(error)")
    }

    return URL(fileURLWithPath: dirPath, isDirectory: true)

}

/// Creates a file at `filePath` inside the directory URL and returns its URL
/// - Parameters:
///   - filePath: the name of the file.
///   - inside: the URL of the directory to create it in.
/// - Returns: the URL of the file
public func createFile(_ filePath: String, inside: URL) -> URL {

    let fileURL = URL(fileURLWithPath: filePath, relativeTo: inside)
    let _ = createDirectory(fileURL.deletingLastPathComponent().path)

    if !fileURL.hasDirectoryPath {
        do {
            try Data().write(to: fileURL)
        } catch {
            print("creation of file \(filePath) in \(inside.path) failed: \(error)")
        }
    }

    return fileURL

}

/// Obtains the URL of the (existing file) at the URL `inURL`
/// - Parameters:
///   - inURL: the URL of the target folder.
///   - called: the name of the (existing) file.
/// - Returns: the URL of the file
public func selectFile(_ filePath: String, inside: URL) -> URL {

    URL(fileURLWithPath: filePath, relativeTo: inside)

}

public func writeString(_ string: String, toURL: URL, appending: Bool = true, terminator: String = "\n") {

    if let fileHandle = try? FileHandle(forWritingTo: toURL) {
        if appending { fileHandle.seekToEndOfFile() }           // moving pointer to the end
        fileHandle.write((string + terminator).data(using: .utf8)!)            // adding content
        fileHandle.closeFile()                                  // closing the file
    } else {
        print("text not written to \(toURL.path)")
    }

}


public func nullCharacterArray(size: Int32) -> [Int8] {

    Array(repeating: Int8(0), count: Int(size)+1)

}

public func stringFromCharacterArray(_ array: [Int8], size: Int32) -> String {

    var _array = array
    _array[Int(size)] = 0
    return String(cString: _array).trimRight()

}

func stringToLongArray(_ string: String) -> [Int8] {
    assert(!string.isEmpty)
    assert(string.count < GETSETSTRLEN+1)

    let arrayBase = Array(repeating: CChar(0), count: Int(GETSETSTRLEN)+1 - string.count)
    let arrayChar = string.utf8.map { Int8(bitPattern: $0) }
    return arrayChar + arrayBase

}

// ----------------

// https://developer.apple.com/documentation/swift/string/init(cstring:)-2p84k

public func makeCString(from str: String) -> UnsafeMutablePointer<Int8> {
    let count = str.utf8.count + 1
    let result = UnsafeMutablePointer<Int8>.allocate(capacity: count)
    str.withCString { (baseAddress) in
        result.initialize(from: baseAddress, count: count)
    }
    return result
}

public func dllVersion() -> Double {

    if #available(macOS 13.0, *) {
        if let dllMainVersion = dllMainGetInfo().firstMatch(of: #/\w(\d\.\d)/#) {
            return Double(dllMainVersion.output.1) ?? 0.0
        }
    } else {
        print("Can't do regex")
    }

    return 0.0
}
