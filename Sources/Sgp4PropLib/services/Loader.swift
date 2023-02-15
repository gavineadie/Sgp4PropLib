//===-------------------------- Loader.swift ------------------------------===//
//
// This source file is based on part of the Swift.org open source project
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
    guard let libHandle = Loader.load(getDylibPath() + dllName, mode: 1) else {
        fatalError("Could not open '\(getDylibPath() + dllName)' ..")
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
            print("LoadLibraryW failure: error #\(GetLastError())")
            return nil
        }
#else
        guard let libHandle = dlopen(path, mode) else {
            print("dlopen failure: \(String(cString: dlerror()))")
            return nil
        }
#endif
        return libHandle
    }

    static func lookup(_ functionName: String, in libHandle: LibHandle) -> FunctionPtr {
#if os(Windows)
        guard let functionPointer = GetProcAddress(libHandle, functionName) else {
            fatalError("GetProcAddress failure: error #\(GetLastError())")
        }
#else
        guard let functionPointer = dlsym(libHandle, functionName) else {
            fatalError("dlsym failure: \(String(cString: dlerror()))")
        }
#endif
        return functionPointer
    }

    static func unload(_ libHandle: LibHandle) {
#if os(Windows)
        guard FreeLibrary(libHandle) else {
            fatalError("FreeLibrary failure:  error #\(GetLastError())")
        }
#else
        guard dlclose(libHandle) == 0 else {
            fatalError("dlclose failure: \(String(cString: dlerror()))")
        }
#endif
    }

}

//
//MARK: Environment Variables
//

#if os(Windows)
func getDylibPath() -> String { "" }
#else
func getDylibPath() -> String {
    if let value = getEnVariable("LD_LIBRARY_PATH"), !value.isEmpty {
        if value.contains(":") {
            fatalError("the environment variable LD_LIBRARY_PATH must contain ONLY the file path to the AS libraries")
        } else {
            return value + "/"
        }
    } else {
        fatalError("the environment variable LD_LIBRARY_PATH must contain the file path to the AS libraries")
    }
}
#endif

func getEnVariable (_ variable: String) -> String? {

    guard let value = getenv(variable) else { return nil }

    return String(cString: value)

}

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
