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
