// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libbam.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Bam.dll")
#else
fileprivate let libHandle = loadDll("libbam.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes Bam dll for use in the program
public func BamInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BamInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of Bam.dll. The information is placed in the string parameter you pass in
public func BamGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BamGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Computes the number of time steps using the input start/end times and the step size
public func BamCompNumTSs( _ startDs50UTC: Double,
                           _ stopDs50UTC: Double,
                           _ stepSizeMin: Double ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Double,
                                                   Double,
                                                   Double ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BamCompNumTSs"), to: FunctionSignature.self)

    return function(startDs50UTC, stopDs50UTC, stepSizeMin)
}

// Computes and returns separate/missed distance data
// <br>
// The table below shows the indexes for the Separation Distance values contained in the extBamArr array:
// <table>
//     <caption>table</caption>
//     <tr>
//         <td><b>Index</b></td>
//         <td><b>Index Interpretation</b></td>
//     </tr>
//     <tr><td>0</td><td>time at mininum average separate distances (ds50UTC)</td></tr>
//     <tr><td>1</td><td>minimum average separate distance (km)</td></tr>
//     <tr><td>2</td><td>average position X at minimum average separate distance (km)</td></tr>
//     <tr><td>3</td><td>average position Y at minimum average separate distance (km)</td></tr>
//     <tr><td>4</td><td>average position Z at minimum average separate distance (km)</td></tr>
//     <tr><td>5</td><td>average velocity X at minimum average separate distance (km/s)</td></tr>
//     <tr><td>6</td><td>average velocity Y at minimum average separate distance (km/s)</td></tr>
//     <tr><td>7</td><td>average velocity Z at minimum average separate distance (km/s)</td></tr>
//     <tr><td>8</td><td>average latitude at minimum average separate distance (deg)</td></tr>
//     <tr><td>9</td><td>average longitude at minimum average separate distance (deg)</td></tr>
//     <tr><td>10</td><td>average height at minimum average separate distance (km)</td></tr>
// </table>
// <br>
// The table below shows the indexes for the Miss Distance values contained in the extBamArr array:
// <table>
//     <caption>table</caption>
//     <tr>
//         <td><b>Index</b></td>
//         <td><b>Index Interpretation</b></td>
//     </tr>
//     <tr><td>20</td><td>time at mininum average missed distances (ds50UTC)</td></tr>
//     <tr><td>21</td><td>minimum average missed distance (km)</td></tr>
//     <tr><td>22</td><td>average position X of satellites when they cross the pinch point plan (km)</td></tr>
//     <tr><td>23</td><td>average position Y of satellites when they cross the pinch point plan (km)</td></tr>
//     <tr><td>24</td><td>average position Z of satellites when they cross the pinch point plan (km)</td></tr>
//     <tr><td>25</td><td>average velocity X of satellites when they cross the pinch point plan (km/s)</td></tr>
//     <tr><td>26</td><td>average velocity Y of satellites when they cross the pinch point plan (km/s)</td></tr>
//     <tr><td>27</td><td>average velocity Z of satellites when they cross the pinch point plan (km/s)</td></tr>
//     <tr><td>28</td><td>average latitude of satellites when they cross the pinch point plan (deg)</td></tr>
//     <tr><td>29</td><td>average longitude of satellites when they cross the pinch point plan (deg)</td></tr>
//     <tr><td>30</td><td>average height of satellites when they cross the pinch point plan (km)</td></tr>
// </table>
public func BamCompute( _ satKeys: UnsafeMutablePointer<Int64>,
                        _ numSats: Int32,
                        _ startDs50UTC: Double,
                        _ stopDs50UTC: Double,
                        _ stepSizeMin: Double,
                        _ avgSDs: UnsafeMutablePointer<Double>,
                        _ avgMDs: UnsafeMutablePointer<Double>,
                        _ extBamArr: UnsafeMutablePointer<Double>,
                        _ errCode: UnsafeMutablePointer<Int32> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BamCompute"), to: FunctionSignature.self)

    function(satKeys, numSats, startDs50UTC, stopDs50UTC, stepSizeMin, avgSDs, avgMDs, extBamArr, errCode)
}

// Retrieves other BAM data
// <br>
// The table below shows the indexes for the values for the xf_bam parameter:
// <table>
//     <caption>table</caption>
//     <tr>
//         <td><b>Index</b></td>
//         <td><b>Index Interpretation</b></td>
//     </tr>
//     <tr><td>0</td><td>times when satellites cross the pinch point plan (ds50UTC)</td></tr>
//     <tr><td>1</td><td>missed distances from satellites to the pinch point (km)</td></tr>
//     <tr><td>2</td><td>nadir angles of satellites when they cross the pinch point plan</td></tr>
//     <tr><td>3</td><td>position Xs of satellites when they cross the pinch point plan (km)</td></tr>
//     <tr><td>4</td><td>position Ys of satellites when they cross the pinch point plan (km)</td></tr>
//     <tr><td>5</td><td>position Zs of satellites when they cross the pinch point plan (km)</td></tr>
//     <tr><td>6</td><td>velocity Xs of satellites when they cross the pinch point plan (km/s)</td></tr>
//     <tr><td>7</td><td>velocity Ys of satellites when they cross the pinch point plan (km/s)</td></tr>
//     <tr><td>8</td><td>velocity Zs of satellites when they cross the pinch point plan (km/s)</td></tr>
//     <tr><td>9</td><td>latitude of satellites when they cross the pinch point plan (deg)</td></tr>
//     <tr><td>10</td><td>longitude of satellites when they cross the pinch point plan (deg)</td></tr>
//     <tr><td>11</td><td>height of satellites when they cross the pinch point plan (km)</td></tr>
// </table>
public func BamGetResults( _ xf_bam: Int32, _ bamArr: UnsafeMutablePointer<Double> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BamGetResults"), to: FunctionSignature.self)

    function(xf_bam, bamArr)
}

// Retrieves other BAM data. Same as BamGetResults, but returns everything in one call
// <br>
// The table below shows the indexes for the values for the xf_bam parameter:
// <table>
//     <caption>table</caption>
//     <tr>
//         <td><b>Index</b></td>
//         <td><b>Index Interpretation</b></td>
//     </tr>
//     <tr><td>0</td><td>times when satellites cross the pinch point plan (ds50UTC)</td></tr>
//     <tr><td>1</td><td>missed distances from satellites to the pinch point (km)</td></tr>
//     <tr><td>2</td><td>nadir angles of satellites when they cross the pinch point plan</td></tr>
//     <tr><td>3</td><td>position Xs of satellites when they cross the pinch point plan (km)</td></tr>
//     <tr><td>4</td><td>position Ys of satellites when they cross the pinch point plan (km)</td></tr>
//     <tr><td>5</td><td>position Zs of satellites when they cross the pinch point plan (km)</td></tr>
//     <tr><td>6</td><td>velocity Xs of satellites when they cross the pinch point plan (km/s)</td></tr>
//     <tr><td>7</td><td>velocity Ys of satellites when they cross the pinch point plan (km/s)</td></tr>
//     <tr><td>8</td><td>velocity Zs of satellites when they cross the pinch point plan (km/s)</td></tr>
//     <tr><td>9</td><td>latitude of satellites when they cross the pinch point plan (deg)</td></tr>
//     <tr><td>10</td><td>longitude of satellites when they cross the pinch point plan (deg)</td></tr>
//     <tr><td>11</td><td>height of satellites when they cross the pinch point plan (km)</td></tr>
// </table>
public func BamGetResultsFull( _ bamArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double)> ) {

    let _bamArr = UnsafeMutableRawPointer(bamArr).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BamGetResultsFull"), to: FunctionSignature.self)

    function(_bamArr)
}

public func BamComputeAll( _ satKeys: UnsafeMutablePointer<Int64>,
                           _ numSats: Int32,
                           _ startDs50UTC: Double,
                           _ stopDs50UTC: Double,
                           _ stepSizeMin: Double,
                           _ avgSDs: UnsafeMutablePointer<Double>,
                           _ avgMDs: UnsafeMutablePointer<Double>,
                           _ extBamArr: UnsafeMutablePointer<Double>,
                           _ bamArr: UnsafeMutablePointer<(Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double, Double)>,
                           _ errCode: UnsafeMutablePointer<Int32> ) {

    let _bamArr = UnsafeMutableRawPointer(bamArr).bindMemory(to: Double.self, capacity: 0)

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Int64>,
                                                   Int32,
                                                   Double,
                                                   Double,
                                                   Double,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "BamComputeAll"), to: FunctionSignature.self)

    function(satKeys, numSats, startDs50UTC, stopDs50UTC, stepSizeMin, avgSDs, avgMDs, extBamArr, _bamArr, errCode)
}

//time at mininum average separate distances (ds50UTC)
public let BAM_SD_TIME    =  0
//minimum average separate distance (km)
public let BAM_SD_DIST    =  1
//average position X at minimum average separate distance (km)
public let BAM_SD_POSX    =  2
//average position Y at minimum average separate distance (km)
public let BAM_SD_POSY    =  3
//average position Z at minimum average separate distance (km)
public let BAM_SD_POSZ    =  4
//average velocity X at minimum average separate distance (km/s)
public let BAM_SD_VELX    =  5
//average velocity Y at minimum average separate distance (km/s)
public let BAM_SD_VELY    =  6
//average velocity Z at minimum average separate distance (km/s)
public let BAM_SD_VELZ    =  7
//average latitude at minimum average separate distance (deg)
public let BAM_SD_LAT     =  8
//average longitude at minimum average separate distance (deg)
public let BAM_SD_LON     =  9
//average height at minimum average separate distance (km)
public let BAM_SD_HEIGHT  = 10

//time at mininum average missed distances (ds50UTC)
public let BAM_MD_TIME    = 20
//minimum average missed distance (km)
public let BAM_MD_DIST    = 21
//average position X of satellites when they cross the pinch point plan (km)
public let BAM_MD_POSX    = 22
//average position Y of satellites when they cross the pinch point plan (km)
public let BAM_MD_POSY    = 23
//average position Z of satellites when they cross the pinch point plan (km)
public let BAM_MD_POSZ    = 24
//average velocity X of satellites when they cross the pinch point plan (km/s)
public let BAM_MD_VELX    = 25
//average velocity Y of satellites when they cross the pinch point plan (km/s)
public let BAM_MD_VELY    = 26
//average velocity Z of satellites when they cross the pinch point plan (km/s)
public let BAM_MD_VELZ    = 27
//average latitude of satellites when they cross the pinch point plan (deg)
public let BAM_MD_LAT     = 28
//average longitude of satellites when they cross the pinch point plan (deg)
public let BAM_MD_LON     = 29
//average height of satellites when they cross the pinch point plan (km)
public let BAM_MD_HEIGHT  = 30

public let BAM_MD_SIZE    = 64

//times when satellites cross the pinch point plan (ds50UTC)
public let XF_BAM_MDTIME  =  0
//missed distances from satellites to the pinch point (km)
public let XF_BAM_RANGE   =  1
//nadir angles of satellites when they cross the pinch point plan
public let XF_BAM_NADIR   =  2
//position Xs of satellites when they cross the pinch point plan (km)
public let XF_BAM_POSX    =  3
//position Ys of satellites when they cross the pinch point plan (km)
public let XF_BAM_POSY    =  4
//position Zs of satellites when they cross the pinch point plan (km)
public let XF_BAM_POSZ    =  5
//velocity Xs of satellites when they cross the pinch point plan (km/s)
public let XF_BAM_VELX    =  6
//velocity Ys of satellites when they cross the pinch point plan (km/s)
public let XF_BAM_VELY    =  7
//velocity Zs of satellites when they cross the pinch point plan (km/s)
public let XF_BAM_VELZ    =  8
//latitude of satellites when they cross the pinch point plan (deg)
public let XF_BAM_LAT     =  9
//longitude of satellites when they cross the pinch point plan (deg)
public let XF_BAM_LON     = 10
//height of satellites when they cross the pinch point plan (km)
public let XF_BAM_HEIGHT  = 11



// ========================= End of auto generated code ==========================
