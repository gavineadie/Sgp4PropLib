//
//  TleTests.swift
//
//  Created by Gavin Eadie on 14 Jan 23.
//

import XCTest

@testable import Sgp4PropLib

final class TleTests: XCTestCase {

    func testTLE() {

        _ = Sgp4RemoveAllSats()
        _ = TleRemoveAllSats()

        let satKey = tleAddSatFrLines(testLine1, testLine2)
        print(getLastErrMsg())

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

        let _ = tleGetAllFieldsGP(satKey,
                                  &satNum,          //TODO: pad with zero ?
                                  &secClass,        //TODO: want ASCII, not Int8
                                  &satName,
                                  &epochYear,
                                  &epochDays,
                                  &bstar,
                                  &ephType,
                                  &elsetNum,
                                  &incli,
                                  &node,
                                  &eccen,
                                  &omega,
                                  &mnAnom,
                                  &mnMotion,
                                  &revNum)

        XCTAssertEqual(satNum, 90021)
        XCTAssertEqual(secClass, "U")                //TODO: want ASCII, not Int8
        XCTAssertEqual(satName, "RELEAS14")
        XCTAssertEqual(epochYear, 2000)
        XCTAssertEqual(epochDays, 51.47568104)
        XCTAssertEqual(bstar, 0.0)
        XCTAssertEqual(ephType, 0)
        XCTAssertEqual(elsetNum, 814)
        XCTAssertEqual(incli, 0.0222)
        XCTAssertEqual(node, 182.4923)
        XCTAssertEqual(eccen, 7.2e-05)
        XCTAssertEqual(omega, 45.6036)
        XCTAssertEqual(mnAnom, 131.8822)
        XCTAssertEqual(mnMotion, 1.00271328)

    }

    func testTleParseSP() {

        _ = Sgp4RemoveAllSats()
        _ = TleRemoveAllSats()

        var satNum: Int32 = 0
        var secClass: String = ""
        var satName: String = ""
        var epochYear: Int32 = 0
        var epochDays = 0.0

        var nDotO2 = 0.0
        var n2DotO6 = 0.0

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

        XCTAssert(0 == tleParseGP(testLine1, testLine2,
                                  &satNum,          //TODO: pad with zero ?
                                  &secClass,
                                  &satName,
                                  &epochYear,
                                  &epochDays,
                                  &bstar,
                                  &nDotO2,
                                  &n2DotO6,
                                  &ephType,
                                  &elsetNum,
                                  &incli,
                                  &node,
                                  &eccen,
                                  &omega,
                                  &mnAnom,
                                  &mnMotion,
                                  &revNum))

        XCTAssertEqual(satNum, 90021)
        XCTAssertEqual(secClass, "U")
        XCTAssertEqual(satName, "RELEAS14")
        XCTAssertEqual(epochYear, 2000)
        XCTAssertEqual(epochDays, 51.47568104)
        XCTAssertEqual(bstar, 1.84e-06)
        XCTAssertEqual(nDotO2, 0.0)
        XCTAssertEqual(n2DotO6, 0.0)
        XCTAssertEqual(ephType, 0)
        XCTAssertEqual(elsetNum, 814)
        XCTAssertEqual(incli, 0.0222)
        XCTAssertEqual(node, 182.4923)
        XCTAssertEqual(eccen, 7.2e-05)
        XCTAssertEqual(omega, 45.6036)
        XCTAssertEqual(mnAnom, 131.8822)
        XCTAssertEqual(mnMotion, 1.00271328)

    }

    func testGetEpoch() {

        _ = Sgp4RemoveAllSats()
        _ = TleRemoveAllSats()

        var satKey = tleAddSatFrLines(testLine1, testLine2)
        print(getLastErrMsg())

        let dateTimeGroup = tleGetField(satKey, XF_TLE_EPOCH)!
        let ds1950UTC = dtgToUTC(dateTimeGroup)

        XCTAssertEqual(ds1950UTC, 18313.47568104)

        XCTAssertEqual(tleGetEpochUTC(satKey), 18313.47568104)

        // test advancing one (leap) year ..
        satKey = tleAddSatFrLines("1 90021U RELEAS14 01051.47568104 +.00000184 +00000+0 +00000-4 0 0814 ",
                                  "2 90021   0.0222 182.4923 0000720  45.6036 131.8822  1.00271328 1199 ")
        XCTAssertEqual(tleGetEpochUTC(satKey), 18313.47568104 + 366.0)          // leap year

        // test advancing another (non-leap) year ..
        satKey = tleAddSatFrLines("1 90021U RELEAS14 02051.47568104 +.00000184 +00000+0 +00000-4 0 0814 ",
                                  "2 90021   0.0222 182.4923 0000720  45.6036 131.8822  1.00271328 1199 ")
        XCTAssertEqual(tleGetEpochUTC(satKey), 18313.47568104 + 366.0 + 365.0)

        // test failure gives 0.0 ..
        satKey = tleAddSatFrLines("1 90021U RELEAS14 99951.47568104 +.00000184 +00000+0 +00000-4 0 0814 ",
                                  "2 90021   0.0222 182.4923 0000720  45.6036 131.8822  1.00271328 1199 ")
        XCTAssertEqual(tleGetEpochUTC(satKey), 0.0)

    }

    func testTLEs() {

        let tleFilePath = tleString.stringToTmpFile("brightest.2le")
        XCTAssertEqual(0, tleLoadFile(tleFilePath))

        print("tleGetCount: \(tleGetCount())")

        print(tleGetLoaded()!)

    }

    func testTleLineToArray() {

        _ = Sgp4RemoveAllSats()
        _ = TleRemoveAllSats()

        var tleArray: [Double] = Array(repeating: Double(0.0), count: Int(XA_TLE_SIZE))

        let txtArray = tleLinesToArray(testLine1, testLine2, &tleArray)

        XCTAssertEqual(txtArray!, "URELEAS14")
        XCTAssertEqual(tleArray.count, 64)

        XCTAssertEqual(tleArray[0], 90021.0)
        print(tleArray)

    }

    func testXS() {

        let text = "URELEAS14"
        let dict = xsTleDecode(text)
        XCTAssert(dict.count == 2)
        XCTAssertEqual(text, xsTleEncode(dict))

    }

    func test_tleGetField() {

        loadAllDlls()

        _ = Sgp4RemoveAllSats()
        _ = TleRemoveAllSats()

        /*╭╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╮
          ┆ 1 NNNNNU NNNNNAAA NNNNN.NNNNNNNN ±.NNNNNNNN ±NNNNN-N ±NNNNN-N N NNNNN                            ┆
          ┆ 1 90021U RELEAS14 22346.21636301 +.00000184  00000 0  00000 0 0 0814    [zero index]             ┆
          ┆   -----                                                               < [02-06] satellite #      ┆
          ┆        U                                                              < [   07] classification   ┆
          ┆          .-                                                           < [09-10] ID (year)        ┆
          ┆            ---                                                        < [11-13] ID (launch #)    ┆
          ┆               ---                                                     < [14-16] ID (fragment)    ┆
          ┆                   --                                                  < [18-19] epoch year       ┆
          ┆                     ------------                                      < [20-31] epoch day        ┆
          ┆                                  ----------           [not used SGP4] < [33-42] Mean Motion/s    ┆
          ┆                                             .-----    [not used SGP4] < [44-                     ┆
          ┆                                                   --  [not used SGP4] <    -51] Mean Motion/s/s  ┆
          ┆                                                      .-----           < [53-                     ┆
          ┆                                                            --         < [  -60] BSTAR drag term  ┆
          ┆                                                               -       < [   62] ephemeris type   ┆
          ┆                                                                 ----  < [64-67] element number   ┆
          ┆                                                                     - < [   68] checksum         ┆
          ╰╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╯*/

        /*╭╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╮
          ┆ 2 NNNNN NNN.NNNN NNN.NNNN NNNNNNN NNN.NNNN NNN.NNNN NN.NNNNNNNNNNNNNN                            ┆
          ┆ 2 90021   1.7703  70.7404 0000942 313.6344 184.9072  1.0021757909554    [zero index]             ┆
          ┆   -----                                                               < [02-06] satellite #      ┆
          ┆         --------                                                      < [08-15] inclination      ┆
          ┆                  --------                                             < [17-24] RAAN             ┆
          ┆                          .-------                                     < [26-32] eccentricity     ┆
          ┆                                   --------                            < [34-41] Arg of Perigee   ┆
          ┆                                            --------                   < [43-50] Mean Anomaly     ┆
          ┆                                                     -----------       < [52-62] Mean Motion      ┆
          ┆                                                                -----  < [63-67] revolution #     ┆
          ┆                                                                     - < [   68] checksum         ┆
          ┆                                                                                                  ┆
          ┆ The reference frame of the Earth-centered inertial (ECI) coordinates produced by the SGP4/SDP4   ┆
          ┆ orbital model is true equator, mean equinox (TEME) of epoch.                                     ┆
          ╰╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╯*/


        let satKey = tleAddSatFrLines(testLine1, testLine2)

        XCTAssertEqual(tleGetField(satKey, XF_TLE_SATNUM)!, "90021")                // SATELLITE NUMBER
        XCTAssertEqual(tleGetField(satKey, XF_TLE_CLASS)!, "U")                     // SECURITY CLASSIFICATION
        XCTAssertEqual(tleGetField(satKey, XF_TLE_SATNAME)!, "RELEAS14")            // SATELLITE NAME A8
        XCTAssertEqual(tleGetField(satKey, XF_TLE_EPOCH)!, "2000051.47568104")      // SATELLITE'S EPOCH TIME "YYYYJJJ.JJJJJJJJ"
        XCTAssertEqual(tleGetField(satKey, XF_TLE_BSTAR)!, "0.000000000000000")     // GP B* DRAG TERM (1/ER)
        XCTAssertEqual(tleGetField(satKey, XF_TLE_EPHTYPE)!, "0")                   // SATELLITE EPHEMERIS TYPE:
        XCTAssertEqual(tleGetField(satKey, XF_TLE_ELSETNUM)!, "814")                // ELEMENT SET NUMBER
        XCTAssertEqual(tleGetField(satKey, XF_TLE_INCLI)!, "0.022200000000000")     // ORBIT INCLINATION (DEG)
        XCTAssertEqual(tleGetField(satKey, XF_TLE_NODE)!, "182.492300000000000")    // RIGHT ASCENSION OF ASENDING NODE (DEG)
        XCTAssertEqual(tleGetField(satKey, XF_TLE_ECCEN)!, "0.000072000000000")     // ECCENTRICITY
        XCTAssertEqual(tleGetField(satKey, XF_TLE_OMEGA)!, "45.603600000000000")    // ARGUMENT OF PERIGEE (DEG)
        XCTAssertEqual(tleGetField(satKey, XF_TLE_MNANOM)!, "131.882200000000012")  // MEAN ANOMALY (DEG)
        XCTAssertEqual(tleGetField(satKey, XF_TLE_MNMOTN)!, "1.002713280000000")    // MEAN MOTION (REV/DAY)
        XCTAssertEqual(tleGetField(satKey, XF_TLE_REVNUM)!, "1199")                 // REVOLUTION NUMBER AT EPOCH

        XCTAssertEqual(0, sgp4InitSat(satKey))

        let epoch = dtgToUTC("22346.21636301")
        var line1 = ""
        var line2 = ""

        XCTAssertEqual(0, sgp4ReepochTLE(satKey, epoch, &line1, &line2))

        print("\nGET:\n\(line1)\n\(line2)\n")

        if let twoString = sgp4ReepochTLE(satKey, epoch) {
            print("GET:\n\(twoString.0)\n\(twoString.1)\n")
        }
    }

    func testCheckSum() {

        loadAllDlls()

        _ = Sgp4RemoveAllSats()
        _ = TleRemoveAllSats()

        let threeInts = getCheckSums(testLine1, testLine2)
        if threeInts.2 == 0 {
            print("\nCHK_L1 = \(threeInts.0), CHK_L2 = \(threeInts.1)\n")
        } else {
            print("getCheckSums error code: \(threeInts.2)")
        }

    }

    func test_tleSetField() {

        let satKey: Int64 = 514756810000900211

        XCTAssertEqual(0, tleSetField(satKey, Int(XF_TLE_SATNUM), "90021"), "tleSetField error")
        _ = tleSetField(satKey, Int(XF_TLE_CLASS), "U")
        _ = tleSetField(satKey, Int(XF_TLE_SATNAME), "RELEAS14")
        _ = tleSetField(satKey, Int(XF_TLE_EPOCH), "2000051.47568104")
        _ = tleSetField(satKey, Int(XF_TLE_BSTAR), "0.000000000000000")
        _ = tleSetField(satKey, Int(XF_TLE_EPHTYPE), "0")
        _ = tleSetField(satKey, Int(XF_TLE_ELSETNUM), "814")
        _ = tleSetField(satKey, Int(XF_TLE_INCLI), "0.022200000000000")
        _ = tleSetField(satKey, Int(XF_TLE_NODE), "182.492300000000000")
        _ = tleSetField(satKey, Int(XF_TLE_ECCEN), "0.000072000000000")
        _ = tleSetField(satKey, Int(XF_TLE_OMEGA), "45.603600000000000")
        _ = tleSetField(satKey, Int(XF_TLE_MNANOM), "131.882200000000012")
        _ = tleSetField(satKey, Int(XF_TLE_MNMOTN), "1.002713280000000")
        _ = tleSetField(satKey, Int(XF_TLE_REVNUM), "1199")

        let epoch = dtgToUTC("22346.21636301")
        var line1 = ""
        var line2 = ""
        XCTAssertEqual(0, sgp4ReepochTLE(satKey, epoch, &line1, &line2))

        print("\nSET:\n\(line1)\n\(line2)\n")

        XCTAssertEqual(0, sgp4RemoveSat(satKey))

    }

    func testCSV() {

        if (libHandles.isEmpty) { loadAllDlls() }

        let line1import = "1 00694U 63047A   22346.21636301 +.00001226  00000 0  14598-3 0 0999 "
        let line2import = "2 00694  30.3563 289.0742 0579612 154.2031 208.8696 14.0412882996468 "

        let satKey = tleAddSatFrLines(line1import, line2import)

        let csvString = tleGetCsv(satKey)!
        XCTAssertEqual(csvString, "U,694,1963-047A,2022,346.21636301,1.226E-5,,1.4598E-4,,999,30.3563,289.0742,5.79612E-2,154.2031,208.8696,14.04128829,96468,,,,,,,,,UNKNOWN")

        var line1export = ""
        var line2export = ""

        XCTAssert(0 == tleCsvToLines(csvString, 0, &line1export, &line2export))

        XCTAssertNotEqual(line1import, line1export)     // there's a blank character ending the input lines
        XCTAssertNotEqual(line2import, line2export)

        XCTAssertEqual(line1import.trimRight(), line1export)
        XCTAssertEqual(line2import.trimRight(), line2export)
    }


}

//                        1         2         3         4         5         6         7
//               1234567890123456789012345678901234567890123456789012345678901234567890
let testLine1 = "1 90021U RELEAS14 00051.47568104 +.00000184 +00000+0 +00000-4 0 0814 "
let testLine2 = "2 90021   0.0222 182.4923 0000720  45.6036 131.8822  1.00271328 1199 "

let tleString = """
1 00694U 63047A   22351.76071400  .00001289  00000+0  15209-3 0  9996
2 00694  30.3573 258.4733 0579630 202.4609 154.9614 14.04142659965463
1 00733U 64002A   22351.81402043  .00000269  00000+0  11558-3 0  9999
2 00733  99.0046 287.8431 0034688  88.7833 271.7323 14.32623909 69562
1 00877U 64053B   22351.78775767  .00000118  00000+0  48981-4 0  9990
2 00877  65.0765 179.5994 0056333  28.1418 332.2705 14.59636894 94775
1 02802U 67045B   22351.79081066  .00000284  00000+0  88959-4 0  9990
2 02802  74.0129  24.9834 0067330 315.2971  44.2769 14.44012755918940
1 03230U 68040B   22351.82643161  .00001806  00000+0  18056-3 0  9997
2 03230  74.0339 177.9015 0030106 312.5074  47.3566 14.91999003913726
1 03597U 68110A   22351.71897875  .00000249  00000+0  74106-4 0  9991
2 03597  34.9952 355.4217 0005305 124.2844 235.8349 14.46036842848454
1 03669U 69009A   22351.51029852  .00000253  00000+0  18389-3 0  9994
2 03669  88.4171 285.1859 1710835 306.2161  39.2258 11.29610827215461
1 04327U 70009A   22351.74532067  .00000030  00000+0  96363-4 0  9992
2 04327  99.1297 347.8651 0004236 307.4741 225.8362 13.58536312619933
1 04814U 70113B   22351.85081076  .00014306  00000+0  30572-3 0  9990
2 04814  81.1376 135.4680 0019994 354.8861   5.2175 15.44486235843523
1 05118U 71028B   22351.83932648  .00004783  00000+0  22884-3 0  9997
2 05118  81.2552   5.8220 0043844  23.9698 336.3559 15.17903193808152
1 05560U 71089A   22351.62777510  .00000553  00000+0  14748-3 0  9998
2 05560  92.7143 131.2864 0018439  96.3922 263.9383 14.48427799691640
1 05730U 71119B   22351.83225968  .00006418  00000+0  39479-3 0  9993
2 05730  73.8981 169.9958 0662512  14.9646 347.0082 14.10665124487858
1 06073U 72023E   22351.85737458  .00050098  62610-5  15602-3 0  9999
2 06073  52.0294  34.2821 1073931 257.3148  90.5821 13.73231481624194
1 06153U 72065A   22351.88611493  .00000336  00000+0  76091-4 0  9996
2 06153  35.0048 158.0724 0007519 260.8552 247.7596 14.58201459674077
1 06155U 72065B   22351.64647937  .00001095  00000+0  17227-3 0  9992
2 06155  35.0052 339.5992 0037919 218.5608 141.2379 14.72264114667236
1 08459U 75112B   22351.78754046  .00000183  00000+0  70380-4 0  9999
2 08459  74.0622  23.5632 0015026  45.4901 314.7477 14.36998146462609
1 10114U 77057B   22351.82230487  .00003722  00000+0  17543-3 0  9996
2 10114  97.4337 128.4415 0014019 136.7235 223.5104 15.20033685488144
1 10967U 78064A   22351.77648344  .00000270  00000+0  11866-3 0  9997
2 10967 107.9943 179.1598 0002908 265.3177  94.7635 14.44134062336340
1 11251U 79005A   22351.53814812  .00016753  00000+0  31244-3 0  9994
2 11251  97.7489 334.4343 0013990  85.5674 274.7174 15.48781615949209
1 11267U 79011B   22351.82284089  .00000622  00000+0  62738-4 0  9998
2 11267  82.5243 131.7501 0017484  29.5345 330.6857 14.89344063353312
1 11574U 79089B   22351.74665030  .00000325  00000+0  10924-3 0  9993
2 11574  74.0695 109.0394 0016601 225.0599 134.9211 14.40985155266358
1 11672U 80005B   22351.73667933  .00000574  00000+0  59131-4 0  9995
2 11672  82.5148 342.2175 0017988 121.7471 238.5502 14.88369963301126
1 12139U 81003B   22351.82790885  .00009096  00000+0  40015-3 0  9994
2 12139  82.9472 259.2464 0428776 168.3510 192.8021 14.65747157139722
1 12465U 81046B   22351.81146355  .00003856  00000+0  19037-3 0  9997
2 12465  81.2425 232.5800 0033620  77.8685 282.6307 15.17132076258609
1 12585U 81065A   22351.60633361  .00005646  00000+0  22265-3 0  9992
2 12585  97.5841 358.8569 0011836 208.1841 151.8757 15.25923974262083
1 12904U 81103B   22351.83495392  .00003344  00000+0  21737-3 0  9991
2 12904  81.1765 138.1732 0027224 287.0550  72.7692 15.07462240795044
1 13068U 82013B   22351.83759781  .00002139  00000+0  13243-3 0  9993
2 13068  81.2054  86.0752 0027696 149.3427 210.9424 15.09074890226014
1 13154U 82039B   22351.81974317  .00002345  00000+0  18384-3 0  9999
2 13154  81.1826 119.8577 0038337 223.4335 136.3864 15.00047189204491
1 13403U 82079B   22351.79854477  .00003878  00000+0  24024-3 0  9991
2 13403  81.1720 125.0586 0033493 135.8512 224.5395 15.09078001199220
1 13552U 82092A   22351.73043113  .00009790  00000+0  27671-3 0  9992
2 13552  82.5717  84.2931 0024877 169.2629 190.9151 15.35862045 60841
1 13553U 82092B   22351.74064294  .00000527  00000+0  59533-4 0  9999
2 13553  82.5678 161.4651 0019912 241.2544 129.1331 14.84541789154048
1 13819U 83010B   22351.66336014  .00003551  00000+0  16876-3 0  9990
2 13819  81.1141 330.4142 0031306 108.3642 252.0997 15.18508479177810
1 14032U 83037A   22351.80928310  .00006665  00000+0  28501-3 0  9996
2 14032  82.5142 258.1890 0017201 118.2037 242.0939 15.22518362166119
1 14208U 83075B   22351.87228024  .00004360  00000+0  24201-3 0  9998
2 14208  97.5059 323.8570 0037832  39.4779 320.9198 15.13651504150742
1 14372U 83099A   22351.86400885  .00007522  00000+0  31556-3 0  9996
2 14372  82.5126 152.8342 0012714 287.4392  72.5454 15.23251650142518
1 14699U 84013A   22351.62905095  .00002334  00000+0  15245-3 0  9995
2 14699  82.5264 182.2063 0012248  37.0096 323.1974 15.07322577 94317
1 14819U 84027A   22351.51091023  .00013001  00000+0  37272-3 0  9996
2 14819  82.4778 159.8945 0011067 137.4459 222.7644 15.35700491122467
1 14820U 84027B   22351.82844994  .00000464  00000+0  52881-4 0  9998
2 14820  82.5431 267.7732 0017036 268.9727  90.9537 14.83957020 72834
1 15354U 84108B   22351.37801079  .00301645  47776-4  63656-3 0  9990
2 15354  56.9908  15.4445 0010780  44.8942 315.3007 15.98341382110170
1 15483U 85006B   22351.79864222  .00000212  00000+0  80847-4 0  9998
2 15483  74.0462 266.3169 0017600 113.9480 304.7347 14.36550135984809
1 15494U 85009A   22351.84870275  .00008608  00000+0  29700-3 0  9991
2 15494  82.4775  32.7070 0002603 163.7150 196.4175 15.29821974 74632
1 15772U 85042D   22351.73092840  .00000104  00000+0  68963-4 0  9997
2 15772  71.1090  55.1718 0034584 162.2372 331.8941 14.21380982946978
1 15945U 85069B   22351.67963650  .00000411  00000+0  45959-4 0  9998
2 15945  82.5285  50.7772 0020830 126.6675 233.6459 14.84344430997989
1 16182U 85097B   22351.77097547 -.00000069  00000+0 -10487-4 0  9996
2 16182  71.0035  99.7973 0009893 256.8248 216.2498 14.16301911920420
1 16496U 86006B   22351.79046610  .00000534  00000+0  60512-4 0  9991
2 16496  82.5252 286.0337 0017553 276.5059 145.0970 14.84443098974322
1 16719U 86034A   22351.77578470  .00003823  00000+0  18304-3 0  9997
2 16719  82.5501 180.6853 0011506 145.3751 225.5096 15.18605302999857
1 16792U 86046B   22351.83192024  .00000553  00000+0  63942-4 0  9991
2 16792  82.4827 111.0560 0024708 152.0524 208.2024 14.83543422951641
1 16882U 86055B   22351.70300398  .00000527  00000+0  60981-4 0  9993
2 16882  82.5203 152.0134 0018298 262.9561 107.3969 14.83534488944620
1 16908U 86061A   22351.86974657 -.00000097  00000+0  38169-5 0  9998
2 16908  50.0083 115.0551 0011454 168.2662  10.1434 12.44498377321330
1 17295U 87003A   22351.89268468  .00005889  00000+0  27722-3 0  9998
2 17295  82.5116 323.9006 0003937  40.3220 319.8305 15.19351336963133
1 17567U 87024B   22351.81534686  .00000565  00000+0  64686-4 0  9990
2 17567  82.5287 117.7614 0018715 191.2603 168.8196 14.84063876913381
1 17589U 87027A   22351.79123161  .00000018  00000+0  35153-4 0  9996
2 17589  70.9154 281.6488 0027063 175.2789 184.8593 14.12903079843922
1 17590U 87027B   22351.78823121  .00000156  00000+0  10176-3 0  9990
2 17590  71.0032 237.9320 0003209 139.1025 221.0340 14.16848842848523
1 17912U 87038B   22351.42227582  .00000478  00000+0  55200-4 0  9995
2 17912  82.5011 324.8256 0021738  92.9591 267.4112 14.83333109904444
1 17973U 87041A   22351.77101615  .00000434  00000+0  25198-3 0  9996
2 17973  70.8995 357.9441 0031519 346.4431  13.5840 14.14180712837035
1 18153U 87055B   22351.60214267  .00000431  00000+0  49342-4 0  9997
2 18153  82.5004  17.6311 0020125 305.4057  54.5278 14.83589764895156
1 18187U 87060A   22351.78676461 -.00000026  00000+0  28059-4 0  9990
2 18187  65.0113   4.5042 0014217 262.7577  97.1891 14.31166339851342
1 18421U 87088A   22351.73347759  .00006230  00000+0  27825-3 0  9992
2 18421  82.4993  88.0682 0014424 126.9136 233.3424 15.21070373923125
1 18749U 88001B   22351.79699108  .00000392  00000+0  44598-4 0  9995
2 18749  82.5145 221.5833 0018964 163.4254 196.7585 14.83516431867269
1 18958U 88020A   22351.89070924  .00002276  00000+0  15709-3 0  9992
2 18958  82.5291 322.9016 0009487 280.6877  79.3282 15.05303806872390
1 19046U 88032B   22351.81065132  .00003059  00000+0  22004-3 0  9997
2 19046  97.4019 342.8439 0035504 335.7369  24.2184 15.04458416874174
1 19120U 88039B   22351.84255603 -.00000104  00000+0 -26576-4 0  9993
2 19120  71.0154  38.4137 0022705 340.6472  19.3788 14.19274564791243
1 19210U 88050A   22351.77726204  .00003817  00000+0  24401-3 0  9994
2 19210  82.5147 242.3201 0014089 249.3497 110.6222 15.08279855859181
1 19257U 88053B   22351.84083906  .00000253  00000+0  92653-4 0  9997
2 19257  74.0478 121.2879 0021276 236.1268 285.5667 14.37684148807259
1 19573U 88093A   22351.62038847  .00002606  00000+0  17107-3 0  9996
2 19573  82.5191 198.7251 0011811 285.9994  73.9932 15.07206633840866
1 19574U 88093B   22351.75732802  .00000423  00000+0  48304-4 0  9992
2 19574  82.5329  65.9042 0020729 333.7741 147.2090 14.83625965826267
1 19650U 88102B   22351.73072071  .00000286  00000+0  16929-3 0  9995
2 19650  70.9995 109.4126 0014342 355.1520   4.9462 14.15852264760141
1 20261U 89080A   22351.82878435  .00001231  00000+0  36058-3 0  9995
2 20261  82.6009 148.9925 1200832 139.7439 229.9163 12.56640302518687
1 20262U 89080C   22351.68712693  .00000304  00000+0  88769-4 0  9990
2 20262  82.5932 208.9002 1236095 354.7286   4.1710 12.49143588512999
1 20303U 89085B   22351.73609347  .00025169  00000+0  52549-3 0  9990
2 20303  35.6381 357.5885 0065496  69.5748 291.2002 15.42267305808698
1 20323U 89089B   22351.75142028  .00000371  00000+0  10476-3 0  9997
2 20323  97.0647   3.8350 0070143 236.5125 122.9355 14.48628306725073
1 20443U 90005H   22351.79938732  .00000270  00000+0  10296-3 0  9997
2 20443  98.4640  57.1659 0011245 134.4569 225.7540 14.38326205723397
1 20453U 90008B   22351.14018425  .00012793  00000+0  64474-3 0  9998
2 20453  35.6221 257.3931 0256465  27.7384 333.6753 14.92200462747181
1 20465U 90010A   22351.83137767  .00002393  00000+0  19284-3 0  9995
2 20465  82.4883 113.8295 0015110   5.0599 355.0774 14.99430051765103
1 20466U 90010B   22351.85002566  .00000459  00000+0  55259-4 0  9990
2 20466  82.5030 291.8510 0019476 212.9447 147.0555 14.81662546753960
1 20511U 90018B   22351.85085531  .00000391  00000+0  48188-4 0  9990
2 20511  82.5236 242.3180 0017577   7.0608  37.3376 14.80307158748224
1 20580U 90037B   22351.44895964  .00003525  00000+0  19267-3 0  9998
2 20580  28.4714  35.5616 0002425 204.2653 175.6784 15.11424663593923
1 20625U 90046B   22351.77746022  .00000082  00000+0  67494-4 0  9995
2 20625  70.9986 251.1073 0016319 290.8388  69.0987 14.14710978681784
1 20663U 90055A   22351.73640350  .00002082  00000+0  18350-3 0  9998
2 20663  62.7934 356.5011 0130397  68.2868 293.2050 14.93572745759663
1 20666U 90055D   22351.75613432  .00002091  00000+0  18201-3 0  9999
2 20666  62.7844 270.4411 0132346  90.2160 271.4100 14.93866836761631
1 20775U 90078B   22351.81832348  .00010713  00000+0  49675-3 0  9990
2 20775  82.9238 190.0469 0537302 232.8825 122.2131 14.43066137636938
1 21088U 91006B   22351.73246174  .00000154  00000+0  13945-3 0  9996
2 21088  82.9416 326.1711 0024010  93.8942  79.2373 13.77230318601917
1 21397U 91039A   22351.61758221  .00001792  00000+0  16427-3 0  9990
2 21397  82.5215  28.1655 0017043 357.0459   3.0658 14.94254279688520
1 21422U 91042A   22351.78079648  .00001569  00000+0  14799-3 0  9992
2 21422  82.4996 133.0323 0015128  62.7410 297.5349 14.93062948687032
1 21423U 91042B   22351.80733776  .00000371  00000+0  45844-4 0  9991
2 21423  82.4945 243.1476 0018361 142.6475 217.6019 14.80052245678740
1 21574U 91050A   22351.84193128  .00000233  00000+0  91353-4 0  9995
2 21574  98.7219 323.1325 0033891  93.9417 266.5645 14.37978510646378
1 21610U 91050F   22351.76911215  .00000318  00000+0  11190-3 0  9996
2 21610  98.3621  57.5297 0003887  49.8743 310.2786 14.41169146649235
1 21819U 91086A   22351.88506119  .00000770  00000+0  14642-3 0  9999
2 21819  82.6094 298.7368 1513206 124.3440 251.0269 12.06231636354345
1 21876U 92008B   22351.83434093  .00000079  00000+0  66049-4 0  9994
2 21876  82.9280  63.5188 0034900 181.6983 316.6589 13.75719623547455
1 21938U 92020B   22351.67687058  .00000036  00000+0  22037-4 0  9992
2 21938  82.9298 308.5476 0029002 348.3899 184.6479 13.75315170539192
1 22219U 92076A   22351.64502262 -.00000083  00000+0 -18712-4 0  9995
2 22219  71.0615 319.9830 0019160 208.3827 151.6254 14.13723045551867
1 22220U 92076B   22351.81970861 -.00000197  00000+0 -75055-4 0  9999
2 22220  70.9990 148.8347 0010471  90.3134  10.7123 14.16520988555016
1 22236U 92080A   22351.63040818  .00001578  00000+0  16533-3 0  9998
2 22236  82.5068 320.4024 0016772 163.4918 196.6850 14.88887414605083
1 22285U 92093B   22351.60336685  .00000095  00000+0  73215-4 0  9997
2 22285  71.0212 316.7326 0006358 291.8183  68.2263 14.15109396546478
1 22286U 92094A   22351.84289752  .00001736  00000+0  18072-3 0  9999
2 22286  82.5201 277.5106 0019067 287.8266  72.0872 14.89172580600311
1 22566U 93016B   22351.82562993  .00000322  00000+0  19048-3 0  9998
2 22566  71.0059 168.4457 0011906 308.2196  51.7854 14.15021552535533
1 22626U 93024A   22351.17774883  .00001698  00000+0  17769-3 0  9990
2 22626  82.5210 306.6684 0016982 290.8016  69.1382 14.88980799604599
1 22803U 93059B   22351.68837326 -.00000006  00000+0  20961-4 0  9995
2 22803  70.9905 334.6214 0018420 212.1900 147.8101 14.16892629512659
1 22830U 93061H   22351.77739476  .00000206  00000+0  94058-4 0  9994
2 22830  98.6424  53.9829 0011427 156.0642 204.1075 14.31631289525497
1 23087U 94023A   22351.77871094 -.00000183  00000+0 -71427-4 0  9992
2 23087  71.0525 118.5403 0008023  11.5537 348.5768 14.13896378478289
1 23088U 94023B   22351.51896100 -.00000224  00000+0 -91253-4 0  9995
2 23088  70.9999  24.5989 0005785 280.2007  79.8462 14.14727642479449
1 23343U 94074B   22351.70750036  .00000413  00000+0  65484-4 0  9998
2 23343  97.8687  40.4479 0008250  85.6534  27.5686 14.77172280513211
1 23405U 94077B   22351.60348154 -.00000254  00000+0 -10611-3 0  9999
2 23405  70.9830 310.3689 0002721 211.6772 148.4188 14.15276331449533
1 23560U 95021A   22351.80763176  .00012151  00000+0  42660-3 0  9994
2 23560  98.5052 282.8181 0001742 314.9217  45.1879 15.29597400481311
1 23561U 95021B   22351.81309219  .00000278  00000+0  10598-3 0  9992
2 23561  98.6009  49.6312 0007845  65.6887  69.3009 14.38248185449840
1 23705U 95058B   22351.83304820 -.00000138  00000+0 -46516-4 0  9994
2 23705  71.0217 132.5039 0010229 120.0032 240.2107 14.15196999401197
1 24298U 96051B   22351.80960233  .00000154  00000+0  10947-3 0  9993
2 24298  70.8241 143.9138 0012566  80.2438 280.0100 14.12463576355321
1 24883U 97037A   22351.83251857  .00000328  00000+0  13423-3 0  9991
2 24883  98.7023 116.0375 0001351 303.8534  56.2522 14.33846078339589
1 25400U 98043G   22351.83083631  .00000070  00000+0  48013-4 0  9996
2 25400  98.6906 286.0701 0009628 189.5523 170.5474 14.25547916271140
1 25407U 98045B   22351.77758632 -.00000167  00000+0 -60604-4 0  9997
2 25407  71.0105 138.0448 0007095   1.9258 358.1891 14.15882526260351
1 25544U 98067A   22351.89982037  .00011319  00000+0  20588-3 0  9999
2 25544  51.6429 146.5036 0003657 169.8145 351.5610 15.50017524373676
1 25732U 99025C   22351.88811546  .00000062  00000+0  51446-4 0  9999
2 25732  98.8313  32.4593 0038230 122.4315  49.9445 14.17762869221240
1 25860U 99039A   22351.83960706  .00000526  00000+0  81824-4 0  9992
2 25860  98.1165  33.0696 0001426 113.5136 246.6223 14.77120858260324
1 25861U 99039B   22351.69618293  .00000497  00000+0  74615-4 0  9995
2 25861  98.1617  21.5777 0016823 102.6511 257.6581 14.78991337262580
1 25876U 99041E   22351.88405757  .00000549  00000+0  13347-3 0  9996
2 25876  51.7643 302.5653 0528630 129.4411 235.4546 14.05428303197013
1 25977U 99064A   22351.80739377  .00000714  00000+0  95049-4 0  9997
2 25977  98.3075 193.3518 0000298  12.4748 347.6472 14.82985376510450
1 25994U 99068A   22351.82484095  .00000452  00000+0  10594-3 0  9996
2 25994  98.1187  59.5234 0000306 291.9706 203.5560 14.58942618223215
1 26070U 00006B   22351.62948655  .00000062  00000+0  56285-4 0  9996
2 26070  71.0036  54.2660 0016506 183.3571 176.7444 14.15512105181832
1 26474U 00047B   22351.69650607  .00002429  00000+0  21111-3 0  9991
2 26474  67.9947  80.1671 0059470 272.9813  86.4525 14.97495208215879
1 27386U 02009A   22351.85065811  .00000229  00000+0  89110-4 0  9999
2 27386  98.2072 324.5737 0001258  83.7670 334.9665 14.38199143 89820
1 27422U 02021B   22351.83889490  .00000286  00000+0  12857-3 0  9995
2 27422  98.4719 292.5099 0013178  58.5553 301.6916 14.29504268 75654
1 27424U 02022A   22351.79858875  .00000875  00000+0  20256-3 0  9992
2 27424  98.2681 292.1331 0001663  57.4298 332.4756 14.57519255 96893
1 27432U 02024C   22351.87242286  .00000044  00000+0  46196-4 0  9995
2 27432  99.0456  19.4344 0051225 118.3991  54.1590 14.14166791 62748
1 27597U 02056A   22351.81719044  .00000246  00000+0  11733-3 0  9999
2 27597  98.6286 293.1098 0001089 135.2977 224.8292 14.27700700 42132
1 27601U 02056E   22351.76783461  .00000312  00000+0  12692-3 0  9992
2 27601  98.1821 348.0375 0073111  74.7253  97.0785 14.32168964 45412
1 28059U 03049C   22351.77791471  .00000374  00000+0  10121-3 0  9997
2 28059  98.5395 291.6177 0048957 226.5625 133.1492 14.52913489 15431
1 28222U 04012C   22351.89127441  .00004560  00000+0  24790-3 0  9991
2 28222  97.7905 336.5113 0044247 141.6878 242.9427 15.14175485 23986
1 28353U 04021B   22351.82385656 -.00000314  00000+0 -13956-3 0  9990
2 28353  70.9995 183.6792 0004575 357.8580   2.2521 14.14289232956272
1 28415U 04035C   22351.86427075  .00003436  00000+0  21490-3 0  9998
2 28415  97.4948  28.2181 0050548 110.7169 249.9488 15.09011337  1254
1 28480U 04046B   22351.83537482  .00000276  00000+0  11910-3 0  9998
2 28480  98.0867 325.3169 0142418  39.4383 321.7062 14.25893634940572
1 28499U 04049H   22351.83840132  .00001192  00000+0  15193-3 0  9995
2 28499  98.1160 110.4776 0090624 201.3568 275.8264 14.80686551971219
1 28738U 05024B   22351.76369647  .00005210  00000+0  28073-3 0  9990
2 28738  97.3533 353.7257 0009337 261.3843  98.6331 15.15184314959490
1 28773U 05025A   22351.86034227  .00007426  00000+0  29946-3 0  9995
2 28773  31.3788 180.9930 0004261  64.5516 295.5573 15.23441827962997
1 28931U 06002A   22351.83758022  .00001169  00000+0  23438-3 0  9998
2 28931  97.9610 310.1104 0002233  75.3504 284.7954 14.63496021901242
1 28932U 06002B   22351.78547759  .00003255  00000+0  28791-3 0  9991
2 28932  98.2695  44.1449 0084406 209.3362 150.3104 14.94390938917414
1 28939U 06005A   22351.83190047  .00052682  00000+0  62977-3 0  9993
2 28939  98.1858  90.4539 0051138 337.3292  22.5703 15.59216086921519
1 29093U 06015B   22351.60288248  .00064931  00000+0  46086-3 0  9995
2 29093  97.5684 224.9923 0025198 218.4958 141.4509 15.73282927928196
1 29228U 06021A   22351.51498165  .00001632  00000+0  12587-3 0  9991
2 29228  69.9355  22.3268 0003213 187.0166 173.0951 15.03739822909928
1 29252U 06029A   22351.84766958  .00005958  00000+0  25660-3 0  9991
2 29252  64.5208 188.1153 0047799 235.0110 124.6524 15.22560884906877
1 29507U 06046C   22351.79850242  .00001979  00000+0  15086-3 0  9997
2 29507  97.7103  21.0378 0044224 337.6260  22.3035 15.02473463882396
1 31114U 07010B   22351.68782700  .00000138  00000+0  82440-4 0  9992
2 31114  98.2543 152.2992 0060629 123.0478 237.6543 14.19477850812558
1 31598U 07023A   22351.89554812  .00000833  00000+0  11110-3 0  9993
2 31598  97.8871 172.9553 0001285  88.5810 271.5549 14.82166630840132
1 31789U 07028A   22351.79404298  .00006139  00000+0  26884-3 0  9990
2 31789  64.4958 231.9531 0059150 286.7981  72.6660 15.21414978853770
1 31792U 07029A   22351.82410300 -.00000153  00000+0 -56865-4 0  9995
2 31792  70.9480 155.2877 0007694 144.3269 215.8367 14.12592429797747
1 31793U 07029B   22351.84122038 -.00000181  00000+0 -69397-4 0  9991
2 31793  70.9756 127.6004 0002871 280.9790 191.4663 14.14500845798794
1 33504U 09003A   22351.62524597  .00003212  00000+0  15486-3 0  9994
2 33504  82.4414  33.0738 0017852   0.7797 359.3461 15.18228457765740
1 37731U 11030B   22351.53406497  .00000923  00000+0  13986-3 0  9990
2 37731  97.6923 328.9149 0057832 214.2067 259.9877 14.75341427616044
1 38341U 12025E   22351.62707874  .00001481  00000+0  17589-3 0  9999
2 38341  98.4791 218.8677 0054225 176.0842 184.0806 14.85156643572839
1 39271U 13055G   22351.75308787  .00026699  00000+0  54536-3 0  9991
2 39271  80.9551 352.1102 0492458 269.9941  84.4855 14.71665364483640
1 39358U 13057A   22351.86149049  .00001582  00000+0  18163-3 0  9995
2 39358  74.9742 244.2753 0017206  79.9937 280.3170 14.86467958496244
1 39364U 13059B   22351.71949319  .00011784  00000+0  34141-3 0  9995
2 39364  97.1356  38.9456 0040611  36.5212 323.8789 15.34868492508287
1 39679U 14021B   22351.78381957  .00003677  00000+0  18071-3 0  9995
2 39679  51.6124 181.3972 0160834 236.2799 122.2755 15.10042452476809
1 39766U 14029A   22351.75755037  .00000195  00000+0  33053-4 0  9991
2 39766  97.9226  86.2641 0001404  99.5799 260.5583 14.79473072462737
1 40306U 14071B   22351.49412947  .00211658  18412-4  70169-3 0  9998
2 40306  97.4244 336.9304 0008383  65.8761 294.3388 15.90287199455684
1 40354U 14084B   22351.79462381  .00011884  00000+0  23427-3 0  9998
2 40354  74.7365 293.0773 0030789  15.5382 344.6771 15.46684080448912
1 41038U 15069A   22351.92472554  .00000502  00000+0  71685-4 0  9995
2 41038  98.0614 353.0473 0000753 133.6840 226.4439 14.81016770381446
1 41337U 16012A   22351.64107163  .00001909  00000+0  14339-3 0  9990
2 41337  31.0062 336.5022 0011813 100.4527 259.7440 14.99939473374649
1 42758U 17034A   22351.94155984  .00004848  00000+0  29269-3 0  9993
2 42758  43.0177  58.4181 0010374 348.3848 180.4931 15.11648305303938
1 43521U 18054D   22351.34171676  .00007259  00000+0  35535-3 0  9997
2 43521  35.1541 304.3221 0077955 263.4967  95.6868 15.14807628247413
1 43600U 18066A   22351.00094314  .00222544  00000+0  86691-3 0  9999
2 43600  96.7307 353.9955 0013623 114.1078 246.1621 15.86394825250070
1 43641U 18076A   22351.76896699  .00000507  00000+0  70195-4 0  9990
2 43641  97.8843 175.8529 0001337  84.2154 275.9223 14.82159355226883
1 43682U 18084L   22351.72625038  .00005649  00000+0  38228-3 0  9999
2 43682  98.8977 342.6533 0054244  22.5112 337.8473 15.05821966226885
1 46265U 20059A   22351.93511725  .00000497  00000+0  68927-4 0  9990
2 46265  97.8847 175.0782 0001463  85.6001 274.5382 14.82168394124309
1 48274U 21035A   22351.74770696  .00050108  00000+0  61226-3 0  9998
2 48274  41.4745 181.3915 0003876 156.8334 267.1436 15.59581000 93469
1 51842U 22019U   22351.80128376  .00010479  00000+0  38087-3 0  9991
2 51842  97.5448  70.9428 0063009 264.6365 245.5107 15.26568734 44727
1 52260U 21092C   22351.81056119  .00082086  00000+0  35959-3 0  9990
2 52260  41.4745 156.6950 0012503 359.0485   1.0337 15.83501267 38293
1 52794U 22058K   22351.83138148  .00004079  00000+0  22371-3 0  9990
2 52794  50.1737  23.1704 0100843 105.0943 256.1193 15.12156442 30020
"""
