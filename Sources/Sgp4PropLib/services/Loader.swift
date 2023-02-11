//===------------------------ SwiftScan.swift -----------------------------===//
//
// This source file was part of the Swift.org open source project
//
//===----------------------------------------------------------------------===//

#if os(Windows)
import WinSDK
#elseif os(iOS) || os(macOS) || os(tvOS) || os(watchOS)
import Darwin
#else
import Glibc
#endif

#if os(Windows)
public typealias LibHandle = HMODULE
public typealias functionPtr = FARPROC
#else
public typealias LibHandle = UnsafeMutableRawPointer
public typealias functionPtr = UnsafeMutableRawPointer
#endif

public enum Loader { }

extension Loader {
    public static func load(_ path: String?, mode: Flags) -> LibHandle? {
#if os(Windows)
        guard let libHandle = path?.withCString(encodedAs: UTF16.self, LoadLibraryW) else {
            print("LoadLibraryW failure: \(GetLastError())") // throw Loader.Error.open("LoadLibraryW failure: \(GetLastError())")
            return nil
        }
#else
        guard let libHandle = dlopen(path, mode.rawValue) else {
            print("dlopen failure") // throw Loader.Error.open(Loader.error() ?? "unknown error")
            return nil
        }
#endif
        return libHandle
    }

    public static func lookup(symbol: String, in libHandle: LibHandle) -> functionPtr { //### what for Windows ??
#if os(Windows)
        guard let pointer = GetProcAddress(libHandle, symbol) else {
            fatalError("GetProcAddress failure:") // return nil
        }
#else
        guard let pointer = dlsym(libHandle, symbol) else {
            fatalError("dlsym failure:") // return nil
        }
#endif
        return pointer // unsafeBitCast(pointer, to: T.self)
    }

    public static func unload(_ libHandle: LibHandle) {
#if os(Windows)
        guard FreeLibrary(libHandle) else {
            fatalError("FreeLibrary failure: \(GetLastError())") // throw Loader.Error.close("FreeLibrary failure: \(GetLastError())")
        }
#else
        guard dlclose(libHandle) == 0 else {
            fatalError("dlclose failure") // throw Loader.Error.close(Loader.error() ?? "unknown error")
        }
#endif
    }

}

extension Loader {
    public struct Flags: RawRepresentable, OptionSet {
        public var rawValue: Int32

        public init(rawValue: Int32) {
            self.rawValue = rawValue
        }
    }
}

#if !os(Windows)
extension Loader.Flags {
    public static var lazy: Loader.Flags {
        Loader.Flags(rawValue: RTLD_LAZY)
    }

    public static var now: Loader.Flags {
        Loader.Flags(rawValue: RTLD_NOW)
    }

    public static var local: Loader.Flags {
        Loader.Flags(rawValue: RTLD_LOCAL)
    }

    public static var global: Loader.Flags {
        Loader.Flags(rawValue: RTLD_GLOBAL)
    }

    // Platform-specific flags
#if os(iOS) || os(macOS) || os(tvOS) || os(watchOS)
    public static var first: Loader.Flags {
        Loader.Flags(rawValue: RTLD_FIRST)
    }

    public static var deepBind: Loader.Flags {
        Loader.Flags(rawValue: 0)
    }
#else
    public static var first: Loader.Flags {
        Loader.Flags(rawValue: 0)
    }

#if os(Linux)
    public static var deepBind: Loader.Flags {
        Loader.Flags(rawValue: RTLD_DEEPBIND)
    }
#else
    public static var deepBind: Loader.Flags {
        Loader.Flags(rawValue: 0)
    }
#endif
#endif
}
#endif

