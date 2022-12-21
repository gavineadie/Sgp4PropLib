//
//  Tests.swift
//  
//
//  Created by Gavin Eadie on 12/8/22.
//

import Foundation
import obj_c

#if os(Linux)
fileprivate let libHandle = loadDll("libsgp4prop.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Sgp4prop.dll")
#else
fileprivate let libHandle = loadDll("libsgp4prop.dylib")
#endif

// -------------------------------- TESTINTERFACE
// ORIGINAL:     void TestInterface((in-Character) cIn, (out-Character) cOut, (in-Integer) intIn, (out-Integer) intOut, (in-Long) longIn, (out-Long) longOut, (in-Double) realIn, (out-Double) realOut, (in-Character[512]) strIn, (out-Character[512]) strOut, (in-Integer[3]) int1DIn, (out-Integer[3]) int1DOut, (in-Long[3]) long1DIn, (out-Long[3]) long1DOut, (in-Double[3]) real1DIn, (out-Double[3]) real1DOut, (in-Integer[2, 3]) int2DIn, (out-Integer[2, 3]) int2DOut, (in-Long[2, 3]) long2DIn, (out-Long[2, 3]) long2DOut, (in-Double[2, 3]) real2DIn, (out-Double[2, 3]) real2DOut)

public func TestInterface(_ cIn: CChar, _ cOut: UnsafeMutablePointer<CChar>, _ intIn: Int32, _ intOut: UnsafeMutablePointer<Int32>, _ longIn: Int64, _ longOut: UnsafeMutablePointer<Int64>, _ realIn: Double, _ realOut: UnsafeMutablePointer<Double>, _ strIn: UnsafeMutablePointer<CChar>, _ strOut: UnsafeMutablePointer<CChar>, _ int1DIn: UnsafeMutablePointer<Int32>, _ int1DOut: UnsafeMutablePointer<Int32>, _ long1DIn: UnsafeMutablePointer<Int64>, _ long1DOut: UnsafeMutablePointer<Int64>, _ real1DIn: UnsafeMutablePointer<Double>, _ real1DOut: UnsafeMutablePointer<Double>, _ int2DIn: UnsafeMutablePointer<(Int32, Int32, Int32)>, _ int2DOut: UnsafeMutablePointer<(Int32, Int32, Int32)>, _ long2DIn: UnsafeMutablePointer<(Int64, Int64, Int64)>, _ long2DOut: UnsafeMutablePointer<(Int64, Int64, Int64)>, _ real2DIn: UnsafeMutablePointer<(Double, Double, Double)>, _ real2DOut: UnsafeMutablePointer<(Double, Double, Double)>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TestInterface"),
                          to: fnPtrTestInterface.self)

    function(cIn, cOut, intIn, intOut, longIn, longOut, realIn, realOut, strIn, strOut, int1DIn, int1DOut, long1DIn, long1DOut, real1DIn, real1DOut, int2DIn, int2DOut, long2DIn, long2DOut, real2DIn, real2DOut)
}

// -------------------------------- TESTINTERFACE2
// ORIGINAL:     void TestInterface2((inout-Character) cInOut, (inout-Integer) intInOut, (inout-Long) longInOut, (inout-Double) realInOut, (inout-Character[512]) strInOut, (inout-Integer[3]) int1DInOut, (inout-Long[3]) long1DInOut, (inout-Double[3]) real1DInOut, (inout-Integer[2, 3]) int2DInOut, (inout-Long[2, 3]) long2DInOut, (inout-Double[2, 3]) real2DInOut)

public func TestInterface2(_ cInOut: UnsafeMutablePointer<CChar>, _ intInOut: UnsafeMutablePointer<Int32>, _ longInOut: UnsafeMutablePointer<Int64>, _ realInOut: UnsafeMutablePointer<Double>, _ strInOut: UnsafeMutablePointer<CChar>, _ int1DInOut: UnsafeMutablePointer<Int32>, _ long1DInOut: UnsafeMutablePointer<Int64>, _ real1DInOut: UnsafeMutablePointer<Double>, _ int2DInOut: UnsafeMutablePointer<(Int32, Int32, Int32)>, _ long2DInOut: UnsafeMutablePointer<(Int64, Int64, Int64)>, _ real2DInOut: UnsafeMutablePointer<(Double, Double, Double)>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TestInterface2"),
                          to: fnPtrTestInterface2.self)

    function(cInOut, intInOut, longInOut, realInOut, strInOut, int1DInOut, long1DInOut, real1DInOut, int2DInOut, long2DInOut, real2DInOut)
}

// -------------------------------- TESTINTERFACE3
// ORIGINAL:     void TestInterface3((in-Integer[*]) Unk1DIn, (out-Integer[*]) Unk1DOut, (in-Integer[*, 3]) Unk2DIn, (out-Integer[*, 3]) Unk2DOut)

public func TestInterface3(_ Unk1DIn: UnsafeMutablePointer<Int32>, _ Unk1DOut: UnsafeMutablePointer<Int32>, _ Unk2DIn: UnsafeMutablePointer<(Int32, Int32, Int32)>, _ Unk2DOut: UnsafeMutablePointer<(Int32, Int32, Int32)>) {

    let function = unsafeBitCast(getFunctionPointer(libHandle,
                                                    "TestInterface3"),
                          to: fnPtrTestInterface3.self)

    function(Unk1DIn, Unk1DOut, Unk2DIn, Unk2DOut)
}
