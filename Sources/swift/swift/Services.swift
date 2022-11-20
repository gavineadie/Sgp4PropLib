//
//  Services.swift
//  Sgp4Swift
//
//  Created by Gavin Eadie on 10/16/22.
//

import Foundation

func getDylibPath() -> String {
    if let dylibDirectory = ProcessInfo.processInfo.environment["LD_LIBRARY_PATH"] {
        return dylibDirectory + "/"
    }

    return "/usr/local/lib/sgp4prop/"
}

public func loadDll(_ dllPath: String) -> UnsafeMutableRawPointer {
    guard let dllHandle = dlopen(getDylibPath() + dllPath, RTLD_NOW) else {
        fatalError("Could not open \(getDylibPath() + dllPath) \(String(cString: dlerror()))")
    }

    return dllHandle
}

func freeDll(_ dllHandle: UnsafeMutableRawPointer) -> Int32 {
    return dlclose(dllHandle)
}

extension String {

    func trimRight() -> String {
        String(reversed().drop { $0.isWhitespace }.reversed())
    }
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


func makeCString(from str: String) -> UnsafeMutablePointer<Int8> {
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
    public static let
        timeIntervalBetween1950AndReferenceDate: TimeInterval = 1_609_545_600.0   // 86,400 sec/day -> 18,629 days

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
