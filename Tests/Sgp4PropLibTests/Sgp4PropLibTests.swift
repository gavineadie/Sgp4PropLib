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

    func testUTCtoDTGxx() throws {

        XCTAssertEqual(utcToDTG20(0.0), "1956/001 0000 00.000")         // (below limit)
        XCTAssertEqual(utcToDTG20(2000.0), "1956/001 0000 00.000")      // (below limit)
        XCTAssertEqual(utcToDTG20(2192.0), "1956/001 0000 00.000")      // (equals limit)
        XCTAssertEqual(utcToDTG20(2192.0), "1956/001 0000 00.000")      // (equals limit)
        XCTAssertEqual(utcToDTG20(10000.0), "1977/138 0000 00.000")     //
        XCTAssertEqual(utcToDTG20(30000.0), "2032/050 0000 00.000")     //
        XCTAssertEqual(utcToDTG20(50000.0), "2086/326 0000 00.000")     // (above limit?)
        XCTAssertEqual(utcToDTG20(90000.0), "2196/149 0000 00.000")     // (above limit?)

        XCTAssertEqual(utcToDTG19(0.0), "1956Jan01000000.000")
        XCTAssertEqual(utcToDTG19(2000.0), "1956Jan01000000.000")
        XCTAssertEqual(utcToDTG19(2192.0), "1956Jan01000000.000")
        XCTAssertEqual(utcToDTG19(10000.0), "1977May18000000.000")      //
        XCTAssertEqual(utcToDTG19(30000.0), "2032Feb19000000.000")      //

        XCTAssertEqual(utcToDTG17(0.0), "1956/001.00000000")
        XCTAssertEqual(utcToDTG17(2000.0), "1956/001.00000000")
        XCTAssertEqual(utcToDTG17(2192.0), "1956/001.00000000")
        XCTAssertEqual(utcToDTG17(10000.0), "1977/138.00000000")        // 1977/138.00000000
        XCTAssertEqual(utcToDTG17(30000.0), "2032/050.00000000")        //

        XCTAssertEqual(utcToDTG15(0.0), "56001000000.000")
        XCTAssertEqual(utcToDTG15(2000.0), "56001000000.000")
        XCTAssertEqual(utcToDTG15(2192.0), "56001000000.000")
        XCTAssertEqual(utcToDTG15(10000.0), "77138000000.000")          // 77138000000.000
        XCTAssertEqual(utcToDTG15(30000.0), "32050000000.000")          // 32050000000.000

        XCTAssertEqual(dtgToUTC("1977May18000000.000"), 10000.0)        // "YYYYMonDDHHMMSS.SSS" (20)
        XCTAssertEqual(dtgToUTC("77 138 00 00 00.000"), 10000.0)        // "YY DDD HH MM SS.SSS" (20)
        XCTAssertEqual(dtgToUTC("77 138 0000 00.000"), 10000.0)         // "YY DDD HHMM SS.SSS"  (19)
        XCTAssertEqual(dtgToUTC("1977/138.00000000"), 10000.0)          // "YYYY/DDD.DDDDDDD"    (17)
        XCTAssertEqual(dtgToUTC("77138000000.000"), 10000.0)            // "YYDDDHHMMSS.SSS"     (15)

        XCTAssertEqual(dtgToUTC("77138"), 10000.0)                      // Just wrong! (5)

        XCTAssertEqual(dtgToUTC(utcToDTG19(0.0)), 2192.0, accuracy: 0.0)

    }

    func testUTCToTimeComps() {

        let ds50 = TimeComps1ToUTC(1956, 1, 0, 0, 0.0)
        print("  TimeComps1ToUTC(1956) = \(ds50)")

        var year = Int32(0)
        var dayOfYear = Int32(0)
        var hh = Int32(0)
        var mm = Int32(0)
        var sss = Double(0.0)

        //TODO: Some rounding of seconds
        UTCToTimeComps1(10000.2, &year, &dayOfYear, &hh, &mm, &sss)
        XCTAssertEqual("\(year) \(dayOfYear) \(hh) \(mm)", "1977 138 4 48")

        var month = Int32(0)
        var dayOfMonth = Int32(0)

        //TODO: Some rounding of seconds
        UTCToTimeComps2(10000.2, &year, &month, &dayOfMonth, &hh, &mm, &sss)
        XCTAssertEqual("\(year) \(month) \(dayOfMonth) \(hh) \(mm)", "1977 5 18 4 48")

    }

    func testDates() {

        let now = Date()
        print("                  (now) = \(now)")

        let nowFrom1950 = dateToUTC(now)
        print("      daysFrom1950(now) = \(nowFrom1950)")

        print("        utcToDTG17(now) = \(utcToDTG17(nowFrom1950))")

        var year = Int32(0)
        var dayOfYear = Int32(0)
        var hh = Int32(0)
        var mm = Int32(0)
        var sss = Double(0.0)

        UTCToTimeComps1(nowFrom1950, &year, &dayOfYear, &hh, &mm, &sss)
        print("   TimeComps1ToUTC(now) = \(year) \(dayOfYear) \(hh) \(mm) \(sss)")

        var month = Int32(0)
        var dayOfMonth = Int32(0)

        UTCToTimeComps2(nowFrom1950, &year, &month, &dayOfMonth, &hh, &mm, &sss)
        print("   TimeComps2ToUTC(now) = \(year) \(month) \(dayOfMonth) \(hh) \(mm) \(sss)")

        let tleDate = YrDaysToUTC(2022, 323.89725341)                 // "22323.89725341
        UTCToTimeComps1(tleDate, &year, &dayOfYear, &hh, &mm, &sss)
        print("   TimeComps1ToUTC(tle) = \(year) \(dayOfYear) \(hh) \(mm) \(sss)")
        UTCToTimeComps2(tleDate, &year, &month, &dayOfMonth, &hh, &mm, &sss)
        print("   TimeComps2ToUTC(tle) = \(year) \(month) \(dayOfMonth) \(hh) \(mm) \(sss)")

    }

    func testTLE() {

        loadAllDlls()

// load a TLE using strings (see TLE dll document)
//      let satKey = tleAddSatFrLines("1 90021U RELEAS14 00051.47568104 +.00000184 +00000+0 +00000-4 0 0814",
//                                    "2 90021   0.0222 182.4923 0000720  45.6036 131.8822  1.00271328 1199")

        let satKey = tleAddSatFrLines("1 00694U 63047A   22346.21636301 +.00001226  00000 0  14598-3 0 0999x",
                                      "2 00694  30.3563 289.0742 0579612 154.2031 208.8696 14.0412882996468x")
//                                              1         2         3         4         5         6         7         8
//                                     12345678901234567890123456789012345678901234567890123456789012345678901234567890
//                                     1 25544U 98067A   22350.92995838  .00012052  00000+0  21882-3 0  9998
//                                     2 25544  51.6430 151.3097 0003678 167.7951 338.1576 15.49996899373529

//                                     1 NNNNNU NNNNNAAA NNNNN.NNNNNNNN +.NNNNNNNN +NNNNN-N +NNNNN-N N NNNNN
        print("\(satKey)")

        var satNum: Int32 = 0
        var secClass: String = ""
        var satName: String = ""
        var epochYear: Int32 = 0
        var epochDays = 0.0

        var bstar = 0.0
        var ephType: Int32 = 0
        var elsetNum: Int32 = 0
        var incli = 0.0
        var node = 0.0
        var eccen = 0.0
        var omega = 0.0
        var mnAnom = 0.0
        var mnMotion = 0.0
        var revNum: Int32 = 0

        tleGetAllFieldsGP(satKey,
                          &satNum,          //TODO: pad with zero ?
                          &secClass,        //TODO: want ASCII, not Int8
                          &satName,
                          &epochYear,
                          &epochDays,
                          &bstar,
                          &ephType,
                          &elsetNum,        //TODO: no checksum byte
                          &incli,
                          &node,
                          &eccen,
                          &omega,
                          &mnAnom,
                          &mnMotion,
                          &revNum)          //TODO: no checksum byte

        print("\(satNum) .. ")

    }

//    func testWarning() {
//
//        printWarning("\"Gavin's Port of Sgp4Prop\"")
//
//    }

}
