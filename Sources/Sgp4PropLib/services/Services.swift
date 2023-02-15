//
//  Services.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/16/22.
//

import Foundation

public let IDX_ERR_NONE  = 0        // Ok
public let IDX_ERR_WARN  = 1        // Warning
public let IDX_ERR_ERROR = 2        // Error


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

    public var cString: UnsafeMutablePointer<Int8> {
        get {
            let count = self.utf8.count + 1
            let result = UnsafeMutablePointer<Int8>.allocate(capacity: count)
            self.withCString { (baseAddress) in
                result.initialize(from: baseAddress, count: count)
            }
            return result
        }
    }

    public func toCcharArray(size: Int = 512) -> [Int8] {
        assert(!self.isEmpty)
        assert(self.count < size+1)

        let arrayBase = Array(repeating: CChar(0), count: Int(size)+1 - self.count)
        let arrayChar = self.utf8.map { Int8(bitPattern: $0) }
        return arrayChar + arrayBase

    }

    public init(fromCcharArray array: [Int8], size: Int) {
        var _array = array
        _array[size] = 0
        self = String(cString: _array).trimRight()
    }

}

public func emptyCcharArray(size: Int) -> [Int8] {

    Array(repeating: Int8(0), count: size+1)

}

//
//MARK: Date Extension
//

extension Date {
    /// The number of seconds from 1 January 1950 to the reference date, 1 January 2001.
    public static let timeIntervalBetween1950AndReferenceDate: TimeInterval = 1_609_545_600.0   // 86,400 sec/day -> 18,629 days

    /// Returns a `Date` initialized relative to 00:00:00 UTC on 1 January 1950 by a given number of seconds.
    public init(secondSince1950: TimeInterval) {
        self.init(timeIntervalSinceReferenceDate: secondSince1950 - Date.timeIntervalBetween1950AndReferenceDate)
    }

    /// Converts a Swift `Date` type to days since 1950-00-00 (ds50UTC)
    public var ds1950Now: Double {
        get { self.timeIntervalSince(Date(secondSince1950: 0.0)) / (60*1440) }
    }
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

//
//MARK: File Functions (not exhaustive)
//

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
