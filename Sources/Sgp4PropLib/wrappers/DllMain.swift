// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation
import AstroStds_c

#if os(Linux)
fileprivate let libHandle = loadDll("libdllmain.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("DllMain.dll")
#else
fileprivate let libHandle = loadDll("libdllmain.dylib")
#endif

public func DllMainInit() -> Int64 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "DllMainInit"), to: fnPtrDllMainInit.self)

    return function()
}

public func DllMainGetInfo(_ infoStr: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "DllMainGetInfo"), to: fnPtrDllMainGetInfo.self)

    function(infoStr)
}

public func DllMainLoadFile(_ dllMainFile: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "DllMainLoadFile"), to: fnPtrDllMainLoadFile.self)

    return function(dllMainFile)
}

public func OpenLogFile(_ fileName: UnsafeMutablePointer<CChar>) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "OpenLogFile"), to: fnPtrOpenLogFile.self)

    return function(fileName)
}

public func CloseLogFile() {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "CloseLogFile"), to: fnPtrCloseLogFile.self)

    function()
}

public func LogMessage(_ msgStr: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "LogMessage"), to: fnPtrLogMessage.self)

    function(msgStr)
}

public func GetLastErrMsg(_ lastErrMsg: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "GetLastErrMsg"), to: fnPtrGetLastErrMsg.self)

    function(lastErrMsg)
}

public func GetLastInfoMsg(_ lastInfoMsg: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "GetLastInfoMsg"), to: fnPtrGetLastInfoMsg.self)

    function(lastInfoMsg)
}

public func GetInitDllNames(_ initDllNames: UnsafeMutablePointer<CChar>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "GetInitDllNames"), to: fnPtrGetInitDllNames.self)

    function(initDllNames)
}

// --------------------------------------------------------------------------------
public func TestInterface(_ cIn: CChar, _ cOut: UnsafeMutablePointer<CChar>,
                          _ intIn: Int32, _ intOut: UnsafeMutablePointer<Int32>,
                          _ longIn: Int64, _ longOut: UnsafeMutablePointer<Int64>,
                          _ realIn: Double, _ realOut: UnsafeMutablePointer<Double>,
                          _ strIn: UnsafeMutablePointer<CChar>, _ strOut: UnsafeMutablePointer<CChar>,
                          _ int1DIn: UnsafeMutablePointer<Int32>, _ int1DOut: UnsafeMutablePointer<Int32>,
                          _ long1DIn: UnsafeMutablePointer<Int64>, _ long1DOut: UnsafeMutablePointer<Int64>,
                          _ real1DIn: UnsafeMutablePointer<Double>, _ real1DOut: UnsafeMutablePointer<Double>,
                          _ int2DIn: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                          _ int2DOut: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                          _ long2DIn: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                          _ long2DOut: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                          _ real2DIn: UnsafeMutablePointer<(Double, Double, Double)>,
                          _ real2DOut: UnsafeMutablePointer<(Double, Double, Double)>) {

// -- rebind the arrays of tuples to arrays of tuple elements

    let _int2DIn = UnsafeMutableRawPointer(int2DIn).bindMemory(to: Int32.self, capacity: 6)
    let _int2DOut = UnsafeMutableRawPointer(int2DIn).bindMemory(to: Int32.self, capacity: 6)
    let _long2DIn = UnsafeMutableRawPointer(long2DIn).bindMemory(to: Int64.self, capacity: 6)
    let _long2DOut = UnsafeMutableRawPointer(long2DIn).bindMemory(to: Int64.self, capacity: 6)
    let _real2DIn = UnsafeMutableRawPointer(real2DIn).bindMemory(to: Double.self, capacity: 6)
    let _real2DOut = UnsafeMutableRawPointer(real2DIn).bindMemory(to: Double.self, capacity: 6)

    typealias functionSignature = @convention(c) (
        CChar, UnsafeMutablePointer<CChar>,
        Int32, UnsafeMutablePointer<Int32>,
        Int64, UnsafeMutablePointer<Int64>,
        Double, UnsafeMutablePointer<Double>,
        UnsafeMutablePointer<CChar>, UnsafeMutablePointer<CChar>,
        UnsafeMutablePointer<Int32>, UnsafeMutablePointer<Int32>,
        UnsafeMutablePointer<Int64>, UnsafeMutablePointer<Int64>,
        UnsafeMutablePointer<Double>, UnsafeMutablePointer<Double>,
        UnsafeMutablePointer<Int32>, UnsafeMutablePointer<Int32>,               // array of tuple elements
        UnsafeMutablePointer<Int64>, UnsafeMutablePointer<Int64>,               // ..
        UnsafeMutablePointer<Double>, UnsafeMutablePointer<Double>) -> Void     // ..

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TestInterface"), to: functionSignature.self)

    function(cIn, cOut, intIn, intOut, longIn, longOut, realIn, realOut, strIn, strOut,
             int1DIn, int1DOut, long1DIn, long1DOut, real1DIn, real1DOut,
             _int2DIn, _int2DOut, _long2DIn, _long2DOut, _real2DIn, _real2DOut)
}
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
public func TestInterface2(_ cInOut: UnsafeMutablePointer<CChar>, _ intInOut: UnsafeMutablePointer<Int32>, _ longInOut: UnsafeMutablePointer<Int64>,
                           _ realInOut: UnsafeMutablePointer<Double>, _ strInOut: UnsafeMutablePointer<CChar>,
                           _ int1DInOut: UnsafeMutablePointer<Int32>, _ long1DInOut: UnsafeMutablePointer<Int64>, _ real1DInOut: UnsafeMutablePointer<Double>,
                           _ int2DInOut: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                           _ long2DInOut: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                           _ real2DInOut: UnsafeMutablePointer<(Double, Double, Double)>) {

    let _int2DInOut = UnsafeMutableRawPointer(int2DInOut).bindMemory(to: Int32.self, capacity: 6)
    let _long2DInOut = UnsafeMutableRawPointer(long2DInOut).bindMemory(to: Int64.self, capacity: 6)
    let _real2DInOut = UnsafeMutableRawPointer(real2DInOut).bindMemory(to: Double.self, capacity: 6)

    typealias functionSignature = @convention(c) (
        UnsafeMutablePointer<CChar>, UnsafeMutablePointer<Int32>, UnsafeMutablePointer<Int64>, UnsafeMutablePointer<Double>,
        UnsafeMutablePointer<CChar>, UnsafeMutablePointer<Int32>, UnsafeMutablePointer<Int64>, UnsafeMutablePointer<Double>,
        UnsafeMutablePointer<Int32>, UnsafeMutablePointer<Int64>, UnsafeMutablePointer<Double>) -> Void

    let function = unsafeBitCast(getFunctionPointer(libHandle, "TestInterface2"), to: functionSignature.self)

    function(cInOut, intInOut, longInOut, realInOut, strInOut, int1DInOut, long1DInOut, real1DInOut, _int2DInOut, _long2DInOut, _real2DInOut)
}
// --------------------------------------------------------------------------------
public func TestInterface3(_ Unk1DIn: UnsafeMutablePointer<Int32>, _ Unk1DOut: UnsafeMutablePointer<Int32>,
                           _ Unk2DIn: UnsafeMutablePointer<(Int32, Int32, Int32)>, _ Unk2DOut: UnsafeMutablePointer<(Int32, Int32, Int32)>) {
    
    let _Unk2In = UnsafeMutableRawPointer(Unk2DIn).bindMemory(to: Int32.self, capacity: 6)
    let _Unk2DOut = UnsafeMutableRawPointer(Unk2DOut).bindMemory(to: Int32.self, capacity: 6)
    
    typealias functionSignature = @convention(c) (UnsafeMutablePointer<Int32>, UnsafeMutablePointer<Int32>,
                                                  UnsafeMutablePointer<Int32>, UnsafeMutablePointer<Int32>) -> Void
    
    let function = unsafeBitCast(getFunctionPointer(libHandle, "TestInterface3"), to: functionSignature.self)
    
    function(Unk1DIn, Unk1DOut, _Unk2In, _Unk2DOut)
}
// --------------------------------------------------------------------------------
public func GetMOICData(_ arrSize: Int32, _ xa_moic: UnsafeMutablePointer<Double>) {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "GetMOICData"), to: fnPtrGetMOICData.self)

    function(arrSize, xa_moic)
}

public func SetElsetKeyMode(_ elset_keyMode: Int32) -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "SetElsetKeyMode"), to: fnPtrSetElsetKeyMode.self)

    return function(elset_keyMode)
}

public func GetElsetKeyMode() -> Int32 {
    let function = unsafeBitCast(getFunctionPointer(libHandle, "GetElsetKeyMode"), to: fnPtrGetElsetKeyMode.self)

    return function()
}
// ========================= End of auto generated code ==========================
