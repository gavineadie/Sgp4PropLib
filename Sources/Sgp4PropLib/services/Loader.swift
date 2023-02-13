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
public typealias FunctionPtr = FARPROC
#else
public typealias LibHandle = UnsafeMutableRawPointer
public typealias FunctionPtr = UnsafeMutableRawPointer
#endif

var libHandles = [LibHandle]()               // keep the handles in an array

//
//MARK: Dynamic Library Services
//
public func loadAllDlls() {

    if libHandles.count < 6 {
        let globalHandle = DllMainInit()
        guard EnvInit(globalHandle) == 0 else { fatalError("envInit load failure") }
        guard TimeFuncInit(globalHandle) == 0 else { fatalError("timeFuncInit load failure") }
        guard AstroFuncInit(globalHandle) == 0 else { fatalError("astroFuncInit load failure") }
        guard TleInit(globalHandle) == 0 else { fatalError("tleInit load failure") }
        guard Sgp4Init(globalHandle) == 0 else { fatalError("sgp4Init load failure") }
    }
}

public func loadDll(_ dllName: String) -> LibHandle {
    guard let libHandle = Loader.load(getDylibPath() + dllName, mode: RTLD_LAZY) else {
        fatalError("Could not open '\(getDylibPath() + dllName)' ..") // \(String(cString: dlerror()))")
    }

    libHandles.append(libHandle)                   // put another handle in the pile

    return libHandle
}

/// Use an empty `enum` to create the `Loader` namespace
enum Loader { }

extension Loader {
    static func load(_ path: String?, mode: Int32) -> LibHandle? {
#if os(Windows)
        guard let libHandle = path?.withCString(encodedAs: UTF16.self, LoadLibraryW) else {
            print("LoadLibraryW failure: \(GetLastError())")
            return nil
        }
#else
        guard let libHandle = dlopen(path, mode) else {
            print("dlopen failure")
            return nil
        }
#endif
        return libHandle
    }

    static func lookup(_ functionName: String, in libHandle: LibHandle) -> FunctionPtr {
#if os(Windows)
        guard let functionPointer = GetProcAddress(libHandle, functionName) else {
            fatalError("GetProcAddress failure:")
        }
#else
        guard let functionPointer = dlsym(libHandle, functionName) else {
            fatalError("dlsym failure:")
        }
#endif
        return functionPointer
    }

    static func unload(_ libHandle: LibHandle) {
#if os(Windows)
        guard FreeLibrary(libHandle) else {
            fatalError("FreeLibrary failure: \(GetLastError())")
        }
#else
        guard dlclose(libHandle) == 0 else {
            fatalError("dlclose failure")
        }
#endif
    }

}

//
//TODO: I'm not too proud of this .. I need a better way
//

#if os(Windows)
func getDylibPath() -> String {
    return ""
}
#else
func getDylibPath() -> String {
//    if let dylibDirectory = ProcessInfo.processInfo.environment["LD_LIBRARY_PATH"] {
//        return dylibDirectory + "/"
//    }
    return "/usr/local/lib/sgp4prop/"
}
#endif

func getFunctionPointer(_ libHandle: LibHandle,
                        _ functionName: String) -> FunctionPtr {

    Loader.lookup(functionName, in: libHandle)

}

public func unsafeFunctionSignatureCast<U>(_ value: FunctionPtr,
                                           to type: U.Type) -> U {

    return unsafeBitCast(value, to: type)

}

public func freeAllDlls() {
    if libHandles.count > 0 {
        for i in (0..<libHandles.count).reversed() {  // reverse, so the array is diminished from the tail
            Loader.unload(libHandles[i])
            libHandles.remove(at: i)
        }
    }
}

public func verifyDLLs() {

    print(dllMainGetInfo())
    print(envGetInfo())
    print(timeFuncGetInfo())
    print(astroFuncGetInfo())
    print(tleGetInfo())
    print(sgp4GetInfo())

}
