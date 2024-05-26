//
//  TestInterfaceDriver.swift
//
//  Created by Gavin Eadie on 12/4/22.
//

import Foundation

/// Tests different input/output data types that are supported by the Astrodynamic Standards library.
/// - Parameters:
///   - cIn:       an input character (in-Character)
///   - cOut:      an output character - should return the same value as the input cIn (out-Character)
///   - intIn:     an input 32-bit integer (in-Integer)
///   - intOut:    an output 32-bit integer - should return the same value as the input intIn (out-Integer)
///   - longIn:    an input 64-bit integer (in-Long)
///   - longOut:   an output 64-bit integer - should return the same value as the input longIn (out-Long)
///   - realIn:    an input 64-bit real (in-Double)
///   - realOut:   an output 64-bit real - should return the same value as the input realIn (out-Double)
///   - strIn:     input string (in-Character[512])
///   - strOut:    output string - should return the same value as the input strIn (out-Character[512])
///   - int1DIn:   an input array of 32-bit integers (in-Integer[3])
///   - int1DOut:  an output array of 32-bit integers - should return the same values as the input int1DIn (out-Integer[3])
///   - long1DIn:  an input array of 64-bit integers (in-Long[3])
///   - long1DOut: an output array of 64-bit integers - should return the same values as the input long1DIn (out-Long[3])
///   - real1DIn:  an input array of 64-bit reals (in-Double[3])
///   - real1DOut: an output array of 64-bit reals - should return the same values as the input real1DIn (out-Double[3])
///   - int2DIn:   an input 2D-array of 32-bit integers (2 rows, 3 columns) - for column-major order language, reverse the order (in-Integer[2, 3])
///   - int2DOut:  an output 2D-array of 32-bit integers - should return the same values as the input int2DIn (out-Integer[2, 3])
///   - long2DIn:  an input 2D-array of 64-bit integers (2 rows, 3 columns) - for column-major order language, reverse the order (in-Long[2, 3])
///   - long2DOut: an output 2D-array of 64-bit integers - should return the same values as the input long2DIn (out-Long[2, 3])
///   - real2DIn:  an input 2D-array of 64-bit reals (2 rows, 3 columns) - for column-major order language, reverse the order (in-Double[2, 3])
///   - real2DOut: an output 2D-array of 64-bit reals - should return the same values as the input real2DIn (out-Double[2, 3])
public func testInterface1(_ char_In: String, _ char_Out: inout String,
                           _ int_In: Int32, _ int_Out: UnsafeMutablePointer<Int32>,
                           _ long_In: Int64, _ long_Out: UnsafeMutablePointer<Int64>,
                           _ real_In: Double, _ real_Out: UnsafeMutablePointer<Double>,
                           _ str_In: String, _ str_Out: inout String,
                           _ int1D_In: UnsafeMutablePointer<Int32>, _ int1D_Out: UnsafeMutablePointer<Int32>,
                           _ long1D_In: UnsafeMutablePointer<Int64>, _ long1D_Out: UnsafeMutablePointer<Int64>,
                           _ real1D_In: UnsafeMutablePointer<Double>, _ real1D_Out: UnsafeMutablePointer<Double>,
                           _ int2D_In: UnsafeMutablePointer<(Int32, Int32, Int32)>, _ int2D_Out: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                           _ long2D_In: UnsafeMutablePointer<(Int64, Int64, Int64)>, _ long2D_Out: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                           _ real2D_In: UnsafeMutablePointer<(Double, Double, Double)>, _ real2D_Out: UnsafeMutablePointer<(Double, Double, Double)>) {

    let _char_In = char_In.utf8CString[0]
    var _char_Out = CChar(0)
    let _str_In = str_In.cString
    var _str_Out = emptyCcharArray(size: INPUTCARDLEN)            //[INPUTCARDLEN = 512]

    TestInterface(_char_In, &_char_Out,
                  int_In, int_Out,
                  long_In, long_Out,
                  real_In, real_Out,
                  _str_In, &_str_Out,
                  int1D_In, int1D_Out,
                  long1D_In, long1D_Out,
                  real1D_In, real1D_Out,
                  int2D_In, int2D_Out,
                  long2D_In, long2D_Out,
                  real2D_In, real2D_Out)

    char_Out = String(UnicodeScalar(UInt8(bitPattern: _char_Out)))
    str_Out = String(fromCcharArray: _str_Out, size: INPUTCARDLEN)

}

/// Tests different input/output data types that are supported by the Astrodynamic Standards library.
/// - Parameters:
///   - char_InOut:   Output should return 'Z' (inout-Character)
///   - int_InOut:    Output should return Input + 1 (inout-Integer)
///   - long_InOut:   Output should return Input + 2 (inout-Long)
///   - real_InOut:   Output should return Input + 42.123456 (inout-Double)
///   - str_InOut:    Output should return "It doesn't matter what your string was." (inout-Character[512])
///   - int1D_InOut:  Output should return Input + 1 (inout-Integer[3])
///   - long1D_InOut: Output should return Input + 1234567890123456789 (inout-Long[3])
///   - real1D_InOut: Output should return Input + 42.0 (inout-Double[3])
///   - int2D_InOut:  Output should return Input + 1 (inout-Integer[2, 3])
///   - long2D_InOut: Output should return Input + 6 (inout-Long[2, 3])
///   - real2D_InOut: Output should return Input + 7.6 (inout-Double[2, 3])
public func testInterface2(_ char_InOut: inout String,
                           _ int_InOut: UnsafeMutablePointer<Int32>,
                           _ long_InOut: UnsafeMutablePointer<Int64>,
                           _ real_InOut: UnsafeMutablePointer<Double>,
                           _ str_InOut: inout String,
                           _ int1D_InOut: UnsafeMutablePointer<Int32>,
                           _ long1D_InOut: UnsafeMutablePointer<Int64>,
                           _ real1D_InOut: UnsafeMutablePointer<Double>,
                           _ int2D_InOut: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                           _ long2D_InOut: UnsafeMutablePointer<(Int64, Int64, Int64)>,
                           _ real2D_InOut: UnsafeMutablePointer<(Double, Double, Double)>) {

    var _char_InOut = char_InOut.utf8CString[0]
    var _str_InOut = str_InOut.toCcharArray()

    TestInterface2(&_char_InOut, int_InOut, long_InOut, real_InOut, &_str_InOut,
                   int1D_InOut, long1D_InOut, real1D_InOut,
                   int2D_InOut, long2D_InOut, real2D_InOut)

    char_InOut = String(UnicodeScalar(UInt8(bitPattern: _char_InOut)))
    str_InOut = String(fromCcharArray: _str_InOut, size: INPUTCARDLEN)

}

/// Tests input and output arrays with unknown length that are supported by the Astrodynamic Standards library.
/// - Parameters:
///   - int1DIn: Unknown dimension should be length (3) (in-Integer[*])
///   - int1DOut: Unknown dimension should be length (3), Unk1DOut should return same as Unk1DIn * 4 (out-Integer[*])
///   - int2DIn: Unknown dimension should be length (2) (in-Integer[*, 3])
///   - int2DOut: Unknown dimension should be length (2), Unk2DOut should return same as Unk2DIn * 5 (out-Integer[*, 3])
public func testInterface3(_ int1D_In: UnsafeMutablePointer<Int32>,
                           _ int1D_Out: UnsafeMutablePointer<Int32>,
                           _ int2D_In: UnsafeMutablePointer<(Int32, Int32, Int32)>,
                           _ int2D_Out: UnsafeMutablePointer<(Int32, Int32, Int32)>) {

    TestInterface3(int1D_In, int1D_Out, int2D_In, int2D_Out)

}
