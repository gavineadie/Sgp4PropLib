import XCTest
@testable import swift

final class Sgp4App2Tests: XCTestCase {

    override func setUp() {
        let globalHandle = dllMainInit()
        guard envInit(globalHandle) == 0 else { fatalError("envInit load failure") }
        guard timeFuncInit(globalHandle) == 0 else { fatalError("timeFuncInit load failure") }
        guard astroFuncInit(globalHandle) == 0 else { fatalError("astroFuncInit load failure") }
        guard tleInit(globalHandle) == 0 else { fatalError("tleInit load failure") }
        guard sgp4Init(globalHandle) == 0 else { fatalError("sgp4Init load failure") }
    }

    func testDTGxx() throws {

        print(utcToDTG20(0.0))          // 1956/001 0000 00.000 (below limit)
        print(utcToDTG20(2000.0))       // 1956/001 0000 00.000 (below limit)
        print(utcToDTG20(2192.0))       // 1956/001 0000 00.000 (equals limit)
        print(utcToDTG20(10000.0))      // 1977/138 0000 00.000
        print(utcToDTG20(30000.0))      // 2032/050 0000 00.000

        print(utcToDTG19(0.0))
        print(utcToDTG19(2000.0))
        print(utcToDTG19(2192.0))
        print(utcToDTG19(10000.0))      // 1977May18000000.000
        print(utcToDTG19(30000.0))      //

        print(utcToDTG17(0.0))
        print(utcToDTG17(2000.0))
        print(utcToDTG17(2192.0))
        print(utcToDTG17(10000.0))      // 1977/138.00000000
        print(utcToDTG17(30000.0))      //

        print(utcToDTG15(0.0))
        print(utcToDTG15(2000.0))
        print(utcToDTG15(2192.0))
        print(utcToDTG15(10000.0))      // 77138000000.000
        print(utcToDTG15(30000.0))      // 32050000000.000

        print(dtgToUTC("1977May18000000.000"))  // "YYYYMonDDHHMMSS.SSS" (20)
        print(dtgToUTC("77 138 00 00 00.000"))  // "YY DDD HH MM SS.SSS" (20)
        print(dtgToUTC("77 138 0000 00.000"))   // "YY DDD HHMM SS.SSS"  (19)
        print(dtgToUTC("1977/138.00000000"))    // "YYYY/DDD.DDDDDDD"    (17)
        print(dtgToUTC("77138000000.000"))      // "YYDDDHHMMSS.SSS"     (15)

        print(dtgToUTC("77138"))                // Just wrong! (5)

        XCTAssertEqual(dtgToUTC(utcToDTG19(0.0)), 2192.0, accuracy: 0.0)

    }

    func testUTCToTimeComps() {

        var year = Int32(0)
        var dayOfYear = Int32(0)
        var hh = Int32(0)
        var mm = Int32(0)
        var sss = Double(0.0)

        UTCToTimeComps1(10000.2, &year, &dayOfYear, &hh, &mm, &sss)

        print("\(year) \(dayOfYear) \(hh) \(mm) \(sss)")

        var month = Int32(0)
        var dayOfMonth = Int32(0)

        UTCToTimeComps2(10000.2, &year, &month, &dayOfMonth, &hh, &mm, &sss)

        print("\(year) \(month) \(dayOfMonth) \(hh) \(mm) \(sss)")

    }

    func testDates() {

        let daysFrom1950 = dateToUTC(Date())
        print(     "days from 1950: \(daysFrom1950)")

        var year = Int32(0)
        var dayOfYear = Int32(0)
        var hh = Int32(0)
        var mm = Int32(0)
        var sss = Double(0.0)

        UTCToTimeComps1(daysFrom1950, &year, &dayOfYear, &hh, &mm, &sss)
        print("\(year) \(dayOfYear) \(hh) \(mm) \(sss)")

        var month = Int32(0)
        var dayOfMonth = Int32(0)

        UTCToTimeComps2(daysFrom1950, &year, &month, &dayOfMonth, &hh, &mm, &sss)
        print("\(year) \(month) \(dayOfMonth) \(hh) \(mm) \(sss)")

    }
}
