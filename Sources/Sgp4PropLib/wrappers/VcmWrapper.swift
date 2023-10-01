// This wrapper file was generated automatically by the GenDllWrappers program.
import Foundation

#if os(Linux)
fileprivate let libHandle = loadDll("libvcm.so")
#elseif os(Windows)
fileprivate let libHandle = loadDll("Vcm.dll")
#else
fileprivate let libHandle = loadDll("libvcm.dylib")
#endif

// Notes: This function has been deprecated since v9.0. 
// Initializes Vcm DLL for use in the program
// If this function returns an error, it is recommended that the users stop the program immediately. The error occurs if the users forget to load and initialize all the prerequisite DLLs, as listed in the DLL Prerequisites section, before using this DLL.
public func VcmInit( _ apAddr: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmInit"), to: FunctionSignature.self)

    return function(apAddr)
}

// Returns information about the current version of Vcm DLL. The information is placed in the string parameter you pass in
// The returned string provides information about the version number, build date, and the platform of the Vcm DLL. 
public func VcmGetInfo( _ infoStr: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmGetInfo"), to: FunctionSignature.self)

    function(infoStr)
}

// Loads a text file containing Vcm's
// The users can use this function repeatedly to load Vcm records from different input files. However, only unique satKeys are stored in the binary tree. Duplicated satKeys won't be stored. 
// 
// State vectors can be included directly in the main input file or they can be read from a separate file identified with "ELTFIL=[pathname\filename]" or "VECFIL=[path/filename]" or "SPVMSG=[path/filename]".
// 
// This function only reads Vcm records from the main input file or Vcm records from the file identified with ELTFIL or VECFIL in the input file. It won't read anything else.
public func VcmLoadFile( _ vcmFile: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmLoadFile"), to: FunctionSignature.self)

    return function(vcmFile)
}

// Saves the currently loaded VCM's to a file
// If the users call this routine immediately after VcmLoadFile. The VCMs contents in the two file should be the same (minus duplicated VCMs or bad VCMs).
// 
// The purpose of this function is to save the current state of the loaded VCMs, usually used in GUI applications, for future use.
public func VcmSaveFile( _ vcmFile: UnsafeMutablePointer<CChar>,
                         _ saveMode: Int32,
                         _ saveForm: Int32 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   Int32,
                                                   Int32 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmSaveFile"), to: FunctionSignature.self)

    return function(vcmFile, saveMode, saveForm)
}

// Removes a VCM represented by the satKey from memory
// If the users enter an invalid satKey - a non-existing satKey in memory, the function will return a non-zero value indicating an error.
public func VcmRemoveSat( _ satKey: Int64 ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64 ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmRemoveSat"), to: FunctionSignature.self)

    return function(satKey)
}

// Removes all VCM's from memory
// The function returns zero if all the satellites are removed successfully from the Vcm DLL's binary tree.
public func VcmRemoveAllSats(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmRemoveAllSats"), to: FunctionSignature.self)

    return function()
}

// Retrieves all of the currently loaded satKeys. These satKeys can be used to access the internal data for the VCM's
// See VcmGetLoaded for an example.
// This function is useful for dynamically allocating memory for the array that is passed to the function VcmGetLoaded().
public func VcmGetCount(  ) -> Int32 {

    typealias FunctionSignature = @convention(c) (  ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmGetCount"), to: FunctionSignature.self)

    return function()
}

// Retrieves all of the currently loaded satKeys. These satKeys can be used to access the internal data for the VCM's
// It is recommended that VcmGetCount() is used to count how many satellites are currently loaded in the Vcm DLL's binary tree. The users then use this number to dynamically allocate the satKeys array and pass it to this function. 
// 
// If the users prefer to pass a static array to the function, make sure it is big enough to store all the satKeys in memory.
public func VcmGetLoaded( _ order: Int32, _ satKeys: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmGetLoaded"), to: FunctionSignature.self)

    function(order, satKeys)
}

// Adds a VCM using its 1-line or concatenated string formats
// If the satellite was previously added to the Vcm DLL's binary tree, the function also returns a negative value indicating an error. 
// 
// The users can use this function repeatedly to add many satellites (one satellite at a time) to the Vcm DLL's binary tree. 
public func VcmAddSatFrLines( _ vcmString: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmAddSatFrLines"), to: FunctionSignature.self)

    return function(vcmString)
}

// Works like VcmAddSatFrLines but designed for Matlab
public func VcmAddSatFrLinesML( _ vcmString: UnsafeMutablePointer<CChar>, _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmAddSatFrLinesML"), to: FunctionSignature.self)

    function(vcmString, satKey)
}

// Adds a VCM using its individually provided field values
// <br>
// The table below indicates starting character position for each field in the xs_vcm parameter:
// <table>
// <caption>table</caption>
// <tr>
// <td>Starting Character Position</td>
// <td>Input Description</td>
// </tr>
// <tr><td> 0</td><td>satellite name, A8</td></tr>
// <tr><td> 8</td><td>common satellite name, A25</td></tr>
// <tr><td>33</td><td>geopotential name, A6 (WGS-72, WGS-84, EGM-96, ...)</td></tr>
// <tr><td>39</td><td>drag model, A12</td></tr>
// <tr><td>51</td><td>lunar solar pertubations, A3 (ON, OFF)</td></tr>
// <tr><td>54</td><td>radiation pressure pertubations, A3 (ON, OFF)</td></tr>
// <tr><td>57</td><td>Earth + ocean tides pertubation, A3 (ON, OFF)</td></tr>
// <tr><td>60</td><td>intrack thrust, A3 (ON, OFF)</td></tr>
// <tr><td>63</td><td>integration mode, A6 (ASW, OSW, SPADOC, ...)</td></tr>
// <tr><td>69</td><td>coordinate system, A5</td></tr>
// <tr><td>74</td><td>type of partial derivatives, A8</td></tr>
// <tr><td>82</td><td>step mode, A4 (AUTO, TIME, S)</td></tr>
// <tr><td>86</td><td>fixed step size indicator, A3 (ON, OFF)</td></tr>
// <tr><td>89</td><td>initial step size selection, A6 (AUTO, MANUAL)</td></tr>
// </table>
// <br> 
// The table below indicates the index for each field in the xa_vcm array:
// <table>
// <caption>table</caption>
// <tr>
// <td>Index (xa_vcm)</td>
// <td>index Interpretation</td>
// </tr>
// <tr><td>  0</td><td>satellite number</td></tr>
// <tr><td>  1</td><td>satellite's epoch time</td></tr>
// <tr><td>  2</td><td>epoch revolution number</td></tr>
// <tr><td>  3</td><td>J2K position X (km)</td></tr>
// <tr><td>  4</td><td>J2K position Y (km)</td></tr>
// <tr><td>  5</td><td>J2K position Z (km)</td></tr>
// <tr><td>  6</td><td>J2K velocity X (km/s)</td></tr>
// <tr><td>  7</td><td>J2K velocity Y (km/s)</td></tr>
// <tr><td>  8</td><td>J2K velocity Z (km/s)</td></tr>
// <tr><td>  9</td><td>ECI position X (km)</td></tr>
// <tr><td> 10</td><td>ECI position Y (km)</td></tr>
// <tr><td> 11</td><td>ECI position Z (km)</td></tr>
// <tr><td> 12</td><td>ECI velocity X (km/s)</td></tr>
// <tr><td> 13</td><td>ECI velocity Y (km/s)</td></tr>
// <tr><td> 14</td><td>ECI velocity Z (km/s)</td></tr>
// <tr><td> 15</td><td>EFG position X (km)</td></tr>
// <tr><td> 16</td><td>EFG position Y (km)</td></tr>
// <tr><td> 17</td><td>EFG position Z (km)</td></tr>
// <tr><td> 18</td><td>EFG velocity X (km/s)</td></tr>
// <tr><td> 19</td><td>EFG velocity Y (km/s)</td></tr>
// <tr><td> 20</td><td>EFG velocity Z (km/s)</td></tr>
// <tr><td> 21</td><td>geopotential zonals</td></tr>
// <tr><td> 22</td><td>geopotential tesserals</td></tr>
// <tr><td> 23</td><td>ballistic coefficient (m^2/kg)</td></tr>
// <tr><td> 24</td><td>BDOT (m^2/kg-s)</td></tr>
// <tr><td> 25</td><td>solar radiation pressure coefficient (m^2/kg)</td></tr>
// <tr><td> 26</td><td>energy dissipation rate (w/kg)</td></tr>
// <tr><td> 27</td><td>outgassing parameter/thrust acceleration (km/s^2)</td></tr>
// <tr><td> 28</td><td>center of mass offset (m)</td></tr>
// <tr><td> 29</td><td>solar flux F10</td></tr>
// <tr><td> 30</td><td>average F10</td></tr>
// <tr><td> 31</td><td>average Ap</td></tr>
// <tr><td> 32</td><td>TAI - UTC (s)</td></tr>
// <tr><td> 33</td><td>UT1 - UTC (s)</td></tr>
// <tr><td> 34</td><td>UT1 rate (ms/day)</td></tr>
// <tr><td> 35</td><td>polar motion X (arcsec)</td></tr>
// <tr><td> 36</td><td>polar motion Y (arcsec)</td></tr>
// <tr><td> 37</td><td>nutation terms</td></tr>
// <tr><td> 38</td><td>leap second time in days since 1950 UTC</td></tr>
// <tr><td> 39</td><td>initial step size</td></tr>
// <tr><td> 40</td><td>integrator control error</td></tr>
// <tr><td> 41</td><td>position u sigma (km)</td></tr>
// <tr><td> 42</td><td>position v sigma (km)</td></tr>
// <tr><td> 43</td><td>position w sigma (km)</td></tr>
// <tr><td> 44</td><td>velocity u sigma (km/s)</td></tr>
// <tr><td> 45</td><td>velocity v sigma (km/s)</td></tr>
// <tr><td> 46</td><td>velocity w sigma (km/s)</td></tr>
// <tr><td> 47</td><td>covariance matrix size</td></tr>
// <tr><td> 48</td><td>weighted RM of last DC on the satellite</td></tr>
// <tr><td>100</td><td>the lower triangle portion of the full cov matrix (100-120: 6x6 covmtx, ..., 100-144: 9x9
// covmtx)</td></tr>
// </table>
// <br>
// The order of the values in the lower half of the covariance matrix is described in the VCM Data Description section.  
// <br>
// For a 6x6 covariance matrix, the 21 values should be entered in the xa_vcm array using index values 100-120.  
// <br>
// For a 9x9 covariance matrix, the 45 values should be entered using the index values 100-144.
public func VcmAddSatFrFields( _ xs_vcm: UnsafeMutablePointer<CChar>, _ xa_vcm: UnsafeMutablePointer<Double> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmAddSatFrFields"), to: FunctionSignature.self)

    return function(xs_vcm, xa_vcm)
}

// Works like VcmAddSatFrFields but designed for Matlab
// <br>
// See VcmAddSatFrFields for definitions of the xs_vcm and xa_vcm parameters.
public func VcmAddSatFrFieldsML( _ xs_vcm: UnsafeMutablePointer<CChar>,
                                 _ xa_vcm: UnsafeMutablePointer<Double>,
                                 _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmAddSatFrFieldsML"), to: FunctionSignature.self)

    function(xs_vcm, xa_vcm, satKey)
}

// Retrieves VCM data associated with the input satKey
public func VcmRetrieveAllData( _ satKey: Int64,
                                _ xs_vcm: UnsafeMutablePointer<CChar>,
                                _ xa_vcm: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmRetrieveAllData"), to: FunctionSignature.self)

    return function(satKey, xs_vcm, xa_vcm)
}

// Updates a VCM using its individual field values. Note: satellite's number and epoch won't be updated
// <br>
// See VcmAddSatFrFields for definitions of the xs_vcm and xa_vcm parameters.
public func VcmUpdateSatFrFields( _ satKey: Int64,
                                  _ xs_vcm: UnsafeMutablePointer<CChar>,
                                  _ xa_vcm: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmUpdateSatFrFields"), to: FunctionSignature.self)

    return function(satKey, xs_vcm, xa_vcm)
}

// Retrieves the value of a specific field of a VCM
// <br>
// The table below shows the values for the xf_Vcm parameter:
// <table>
// <caption>table</caption>
// <tr>
// <td>index</td>
// <td>index Interpretation</td>
// </tr>
// <tr><td> 1 </td><td> Satellite number I5</td></tr>
// <tr><td> 2 </td><td> Satellite international designator A8</td></tr>
// <tr><td> 3 </td><td> Epoch YYYYDDDHHMMSS.SSS A17</td></tr>
// <tr><td> 4 </td><td> Revolution number I5</td></tr>
// <tr><td> 5 </td><td> position X (km) F16.8 </td></tr>
// <tr><td> 6 </td><td> position Y (km) F16.8 </td></tr>
// <tr><td> 7 </td><td> position Z (km) F16.8   </td></tr>
// <tr><td> 8 </td><td> velocity X (km/s) F16.12</td></tr>
// <tr><td> 9 </td><td> velocity Y (km/s) F16.12</td></tr>
// <tr><td>10 </td><td> velocity Z (km/s) F16.12</td></tr>
// <tr><td>11 </td><td> Geo Name A6</td></tr>
// <tr><td>12 </td><td> Geo zonals I2</td></tr>
// <tr><td>13 </td><td> Geo tesserals I2</td></tr>
// <tr><td>14 </td><td> Drag modelel A12 (NONE, JAC70/MSIS90) </td></tr>
// <tr><td>15 </td><td> Lunar solar A3 (ON/OFF)</td></tr>
// <tr><td>16 </td><td> Radiation pressure pertubations A3 (ON/OFF)</td></tr>
// <tr><td>17 </td><td> Earth + ocean tides pertubations A3 (ON/OFF)</td></tr>
// <tr><td>18 </td><td> Intrack thrust A3 (ON/OFF)</td></tr>
// <tr><td>19 </td><td> Ballistic coefficient (m^2/kg)</td></tr>
// <tr><td>20 </td><td> Radiation pressure coefficient  (m^2/kg)</td></tr>
// <tr><td>21 </td><td> Outgassing parameter (km/s^2)</td></tr>
// <tr><td>22 </td><td> Center of mass offset (m)</td></tr>
// <tr><td>23 </td><td> Solar flux F10 I3</td></tr>
// <tr><td>24 </td><td> Solar flux F10 average I3</td></tr>
// <tr><td>25 </td><td> Ap average F5.1</td></tr>
// <tr><td>26 </td><td> TAI minus UTC (s)I2</td></tr>
// <tr><td>27 </td><td> UT1 minus UTC (s) F7.5</td></tr>
// <tr><td>28 </td><td> UT1 rate (ms/day)  F5.3</td></tr>
// <tr><td>29 </td><td> Polar motion X (arcsec) F6.4</td></tr>
// <tr><td>30 </td><td> Polar motion Y (arcsec) F6.4</td></tr>
// <tr><td>31 </td><td> Nutation terms I3</td></tr>
// <tr><td>32 </td><td> Leap second time YYYYDDDHHMMSS.SSS A17</td></tr>
// <tr><td>33 </td><td> Integration mode A6 (ASW, OSW, SPADOC)</td></tr>
// <tr><td>34 </td><td> Type of partial derivatives A8 (ANALYTIC, FULL NUM, FAST NUM)</td></tr>
// <tr><td>35 </td><td> Integration step mode A4 (AUTO/TIME, S)</td></tr>
// <tr><td>36 </td><td> Fixed step size indicator A3 (ON/OFF)</td></tr>
// <tr><td>37 </td><td> Initial step size selection A6 (AUTO/MANUAL)</td></tr>
// <tr><td>38 </td><td> Initial integration step size F8.3</td></tr>
// <tr><td>39 </td><td> Integrator error control E9.3</td></tr>
// <tr><td>40 </td><td> Weighted RMS of last DC E10.5</td></tr>
// <tr><td>41 </td><td> BDOT (M2/KG-S)</td></tr>
// <tr><td>42 </td><td> EDR (W/KG)</td></tr>
// </table>
public func VcmGetField( _ satKey: Int64,
                         _ xf_Vcm: Int32,
                         _ valueStr: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmGetField"), to: FunctionSignature.self)

    return function(satKey, xf_Vcm, valueStr)
}

// Updates the value of a specific field of a VCM
// See VcmGetField for a description of the xf_Vcm parameter.
public func VcmSetField( _ satKey: Int64,
                         _ xf_Vcm: Int32,
                         _ valueStr: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmSetField"), to: FunctionSignature.self)

    return function(satKey, xf_Vcm, valueStr)
}

// Retrieves all of the data for a VCM in a single function call
public func VcmGetAllFields( _ satKey: Int64,
                             _ satNum: UnsafeMutablePointer<Int32>,
                             _ satName: UnsafeMutablePointer<CChar>,
                             _ epochDtg: UnsafeMutablePointer<CChar>,
                             _ revNum: UnsafeMutablePointer<Int32>,
                             _ posECI: UnsafeMutablePointer<Double>,
                             _ velECI: UnsafeMutablePointer<Double>,
                             _ geoName: UnsafeMutablePointer<CChar>,
                             _ geoZonals: UnsafeMutablePointer<Int32>,
                             _ geoTesserals: UnsafeMutablePointer<Int32>,
                             _ dragModel: UnsafeMutablePointer<CChar>,
                             _ lunarSolar: UnsafeMutablePointer<CChar>,
                             _ radPress: UnsafeMutablePointer<CChar>,
                             _ earthTides: UnsafeMutablePointer<CChar>,
                             _ intrackThrust: UnsafeMutablePointer<CChar>,
                             _ bTerm: UnsafeMutablePointer<Double>,
                             _ agom: UnsafeMutablePointer<Double>,
                             _ ogParm: UnsafeMutablePointer<Double>,
                             _ cmOffset: UnsafeMutablePointer<Double>,
                             _ f10: UnsafeMutablePointer<Int32>,
                             _ f10Avg: UnsafeMutablePointer<Int32>,
                             _ apAvg: UnsafeMutablePointer<Double>,
                             _ tconRec: UnsafeMutablePointer<Double>,
                             _ nTerms: UnsafeMutablePointer<Int32>,
                             _ leapYrDtg: UnsafeMutablePointer<CChar>,
                             _ integMode: UnsafeMutablePointer<CChar>,
                             _ partials: UnsafeMutablePointer<CChar>,
                             _ stepMode: UnsafeMutablePointer<CChar>,
                             _ fixStep: UnsafeMutablePointer<CChar>,
                             _ stepSelection: UnsafeMutablePointer<CChar>,
                             _ initStepSize: UnsafeMutablePointer<Double>,
                             _ errCtrl: UnsafeMutablePointer<Double>,
                             _ rms: UnsafeMutablePointer<Double> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Int32>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<Double> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmGetAllFields"), to: FunctionSignature.self)

    return function(satKey, satNum, satName, epochDtg, revNum, posECI, velECI, geoName, geoZonals, geoTesserals, dragModel, lunarSolar, radPress, earthTides, intrackThrust, bTerm, agom, ogParm, cmOffset, f10, f10Avg, apAvg, tconRec, nTerms, leapYrDtg, integMode, partials, stepMode, fixStep, stepSelection, initStepSize, errCtrl, rms)
}

// Returns the concatenated string representation of a VCM by the satellite's satKey
public func VcmGetLines( _ satKey: Int64, _ vcmLines: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( Int64,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmGetLines"), to: FunctionSignature.self)

    return function(satKey, vcmLines)
}

// Converts VCM 1-line format to multi-line format (as a concatenated string)
public func Vcm1LineToMultiLine( _ vcm1Line: UnsafeMutablePointer<CChar>, _ vcmLines: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "Vcm1LineToMultiLine"), to: FunctionSignature.self)

    return function(vcm1Line, vcmLines)
}

// Converts VCM multi-line format (as a concatenated string) to 1-line format 
public func VcmMultiLineTo1Line( _ vcmLines: UnsafeMutablePointer<CChar>, _ vcm1Line: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmMultiLineTo1Line"), to: FunctionSignature.self)

    return function(vcmLines, vcm1Line)
}

// Returns the first satKey from the currently loaded set of VCM's that contains the specified satellite number
// This function is useful when Vcm dll is used in applications that requires only one record (one Vcm entry) for one satellite and the applications refer to that Vcm by its satellite number. However, the Standardized Astrodynamic Algorithms library is only working with satKeys, this function helps to return the associated satKey of that satellite.
public func VcmGetSatKey( _ satNum: Int32 ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32 ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmGetSatKey"), to: FunctionSignature.self)

    return function(satNum)
}

// Works like VcmGetSatKey but designed for Matlab
public func VcmGetSatKeyML( _ satNum: Int32, _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmGetSatKeyML"), to: FunctionSignature.self)

    function(satNum, satKey)
}

// Computes a satKey from the input data
// This is the proper way to reconstruct a satKey from its fields. If the users use their own routine to do this, the computed satKey might be different. 
public func VcmFieldsToSatKey( _ satNum: Int32, _ epochDtg: UnsafeMutablePointer<CChar> ) -> Int64 {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar> ) -> Int64

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmFieldsToSatKey"), to: FunctionSignature.self)

    return function(satNum, epochDtg)
}

// Works like VcmFieldsToSatKey but designed for Matlab
public func VcmFieldsToSatKeyML( _ satNum: Int32,
                                 _ epochDtg: UnsafeMutablePointer<CChar>,
                                 _ satKey: UnsafeMutablePointer<Int64> ) {

    typealias FunctionSignature = @convention(c) ( Int32,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Int64> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmFieldsToSatKeyML"), to: FunctionSignature.self)

    function(satNum, epochDtg, satKey)
}

// Constructs a multi-line VCM (as a concatenated string) from the VCM data stored in the input arrays.
public func VcmArrayToVcmLines( _ xa_vcm: UnsafeMutablePointer<Double>,
                                _ xs_vcm: UnsafeMutablePointer<CChar>,
                                _ vcmLines: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmArrayToVcmLines"), to: FunctionSignature.self)

    function(xa_vcm, xs_vcm, vcmLines)
}

// Constructs a 1-line VCM from the VCM data stored in the input arrays.
public func VcmArrayToVcm1Line( _ xa_vcm: UnsafeMutablePointer<Double>,
                                _ xs_vcm: UnsafeMutablePointer<CChar>,
                                _ vcm1Line: UnsafeMutablePointer<CChar> ) {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<CChar> ) -> Void

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmArrayToVcm1Line"), to: FunctionSignature.self)

    function(xa_vcm, xs_vcm, vcm1Line)
}

// Parses data either in 1-line or multi-line (as a concatenated string) VCM and stores that data into the output arrays
// This function only parses data from the input VCM but DOES NOT load/add the input VCM to memory.
public func VcmStringToArray( _ vcmString: UnsafeMutablePointer<CChar>,
                              _ xa_vcm: UnsafeMutablePointer<Double>,
                              _ xs_vcm: UnsafeMutablePointer<CChar> ) -> Int32 {

    typealias FunctionSignature = @convention(c) ( UnsafeMutablePointer<CChar>,
                                                   UnsafeMutablePointer<Double>,
                                                   UnsafeMutablePointer<CChar> ) -> Int32

    let function = unsafeFunctionSignatureCast(getFunctionPointer(libHandle, "VcmStringToArray"), to: FunctionSignature.self)

    return function(vcmString, xa_vcm, xs_vcm)
}

// Maximum string length of a multi-line VCM concatenated into one big string
public let VCMSTRLEN = 4000


// Maximum string length of a 1-line VCM string
public let VCM1LINELEN = 1500


// Starting location of the VCM's text data fields
//satellite name A8
public let XS_VCM_SATNAME       =   0
//common satellite name A25
public let XS_VCM_COMMNAME      =   8
//geopotential name A6 (WGS-72, WGS-84, EGM-96, ...)
public let XS_VCM_GEONAME       =  33
//drag model A12
public let XS_VCM_DRAGMOD       =  39
//lunar solar pertubations A3 (ON, OFF)
public let XS_VCM_LUNAR         =  51
//radiation pressure pertubations A3 (ON, OFF)
public let XS_VCM_RADPRESS      =  54
//Earth + ocean tides pertubation A3 (ON, OFF)
public let XS_VCM_EARTHTIDES    =  57
//intrack thrust A3 (ON, OFF)
public let XS_VCM_INTRACK       =  60
//integration mode A6 (ASW, OSW, SPADOC, ...)
public let XS_VCM_INTEGMODE     =  63
//coordinate system A5
public let XS_VCM_COORDSYS      =  69
//type of partial derivatives A8
public let XS_VCM_PARTIALS      =  74
//step mode A4 (AUTO, TIME, S)
public let XS_VCM_STEPMODE      =  82
//fixed step size indicator A3 (ON, OFF)
public let XS_VCM_FIXEDSTEP     =  86
//initial step size selection A6 (AUTO, MANUAL)
public let XS_VCM_STEPSEL       =  89

public let XS_VCM_SIZE          = 512

// VCM's text data fields - new convention (start index, string length)
//satellite name A8
public let XS_VCM_SATNAME_0_8      =   0
//common satellite name A25
public let XS_VCM_COMMNAME_8_25    =   8
//geopotential name A6 (WGS-72, WGS-84, EGM-96, ...)
public let XS_VCM_GEONAME_33_6     =  33
//drag model A12
public let XS_VCM_DRAGMOD_39_12    =  39
//lunar solar pertubations A3 (ON, OFF)
public let XS_VCM_LUNAR_51_3       =  51
//radiation pressure pertubations A3 (ON, OFF)
public let XS_VCM_RADPRESS_54_3    =  54
//Earth + ocean tides pertubation A3 (ON, OFF)
public let XS_VCM_EARTHTIDES_57_3  =  57
//intrack thrust A3 (ON, OFF)
public let XS_VCM_INTRACK_60_3     =  60
//integration mode A6 (ASW, OSW, SPADOC, ...)
public let XS_VCM_INTEGMODE_63_6   =  63
//coordinate system A5
public let XS_VCM_COORDSYS_69_5    =  69
//type of partial derivatives A8
public let XS_VCM_PARTIALS_74_8    =  74
//step mode A4 (AUTO, TIME, S)
public let XS_VCM_STEPMODE_82_4    =  82
//fixed step size indicator A3 (ON, OFF)
public let XS_VCM_FIXEDSTEP_86_3   =  86
//initial step size selection A6 (AUTO, MANUAL)
public let XS_VCM_STEPSEL_89_6     =  89

public let XS_VCM_LENGTH           = 512

// Indexes to access data from an array containing VCM numerical data fields
//satellite number
public let XA_VCM_SATNUM        =   0
//satellite's epoch time
public let XA_VCM_EPOCHDS50UTC  =   1
//epoch revolution number
public let XA_VCM_REVNUM        =   2
//J2K position X (km)
public let XA_VCM_J2KPOSX       =   3
//J2K position Y (km)
public let XA_VCM_J2KPOSY       =   4
//J2K position Z (km)
public let XA_VCM_J2KPOSZ       =   5
//J2K velocity X (km/s)
public let XA_VCM_J2KVELX       =   6
//J2K velocity Y (km/s)
public let XA_VCM_J2KVELY       =   7
//J2K velocity Z (km/s)
public let XA_VCM_J2KVELZ       =   8
//ECI position X (km)
public let XA_VCM_ECIPOSX       =   9
//ECI position Y (km)
public let XA_VCM_ECIPOSY       =  10
//ECI position Z (km)
public let XA_VCM_ECIPOSZ       =  11
//ECI velocity X (km/s)
public let XA_VCM_ECIVELX       =  12
//ECI velocity Y (km/s)
public let XA_VCM_ECIVELY       =  13
//ECI velocity Z (km/s)
public let XA_VCM_ECIVELZ       =  14
//EFG position X (km)
public let XA_VCM_EFGPOSX       =  15
//EFG position Y (km)
public let XA_VCM_EFGPOSY       =  16
//EFG position Z (km)
public let XA_VCM_EFGPOSZ       =  17
//EFG velocity X (km/s)
public let XA_VCM_EFGVELX       =  18
//EFG velocity Y (km/s)
public let XA_VCM_EFGVELY       =  19
//EFG velocity Z (km/s)
public let XA_VCM_EFGVELZ       =  20
//geopotential zonals
public let XA_VCM_GEOZON        =  21
//geopotential tesserals
public let XA_VCM_GEOTES        =  22
//ballistic coefficient (m^2/kg)
public let XA_VCM_BTERM         =  23
//BDOT (m^2/kg-s)
public let XA_VCM_BDOT          =  24
//solar radiation pressure coefficient (m^2/kg)
public let XA_VCM_AGOM          =  25
//energy dissipation rate (w/kg)
public let XA_VCM_EDR           =  26
//outgassing parameter/thrust acceleration (m/s^2)
public let XA_VCM_OGPARM        =  27
//center of mass offset (m)
public let XA_VCM_CMOFFSET      =  28
//solar flux F10
public let XA_VCM_F10           =  29
//average F10
public let XA_VCM_F10AVG        =  30
//average Ap
public let XA_VCM_APAVG         =  31
//TAI - UTC (s)
public let XA_VCM_TAIMUTC       =  32
//UT1 - UTC (s)
public let XA_VCM_UT1MUTC       =  33
//UT1 rate (ms/day)
public let XA_VCM_UT1RATE       =  34
//polar motion X (arcsec)
public let XA_VCM_POLMOTX       =  35
//polar motion Y (arcsec)
public let XA_VCM_POLMOTY       =  36
//nutation terms
public let XA_VCM_NUTTERMS      =  37
//leap second time in days since 1950 UTC
public let XA_VCM_LEAPDS50UTC   =  38
//initial step size
public let XA_VCM_INITSTEP      =  39
//integrator control error
public let XA_VCM_ERRCTRL       =  40
//position u sigma (km)
public let XA_VCM_POSUSIG       =  41
//position v sigma (km)
public let XA_VCM_POSVSIG       =  42
//position w sigma (km)
public let XA_VCM_POSWSIG       =  43
//velocity u sigma (km/s)
public let XA_VCM_VELUSIG       =  44
//velocity v sigma (km/s)
public let XA_VCM_VELVSIG       =  45
//velocity w sigma (km/s)
public let XA_VCM_VELWSIG       =  46
//covariance matrix size
public let XA_VCM_COVMTXSIZE    =  47
//weighted RM of last DC on the satellite
public let XA_VCM_RMS           =  48
//the lower triangle portion of the full cov matrix (100-120: 6x6 covmtx, ..., 100-144: 9x9 covmtx)
public let XA_VCM_COVELEMS      = 100

public let XA_VCM_SIZE          = 512

// Indexes of VCM data fields
//Satellite number I5
public let XF_VCM_SATNUM    =  1
//Satellite international designator A8
public let XF_VCM_SATNAME   =  2
//Epoch YYYYDDDHHMMSS.SSS A17
public let XF_VCM_EPOCH     =  3
//Revolution number I5
public let XF_VCM_REVNUM    =  4
//position X (km) F16.8
public let XF_VCM_POSX      =  5
//position Y (km) F16.8
public let XF_VCM_POSY      =  6
//position Z (km) F16.8
public let XF_VCM_POSZ      =  7
//velocity X (km/s) F16.12
public let XF_VCM_VELX      =  8
//velocity Y (km/s) F16.12
public let XF_VCM_VELY      =  9
//velocity Z (km/s) F16.12
public let XF_VCM_VELZ      = 10
//Geo Name A6
public let XF_VCM_GEONAME   = 11
//Geo zonals I2
public let XF_VCM_GEOZONALS = 12
//Geo tesserals I2
public let XF_VCM_GEOTESSER = 13
//Drag modelel A12 (NONE, JAC70/MSIS90)
public let XF_VCM_DRAGMODE  = 14
//Lunar solar A3 (ON/OFF)
public let XF_VCM_LUNSOL    = 15
//Radiation pressure pertubations A3 (ON/OFF)
public let XF_VCM_RADPRESS  = 16
//Earth + ocean tides pertubations A3 (ON/OFF)
public let XF_VCM_ERTHTIDES = 17
//Intrack thrust A3 (ON/OFF)
public let XF_VCM_INTRACK   = 18
//Ballistic coefficient (m^2/kg)
public let XF_VCM_BTERM     = 19
//Radiation pressure coefficient  (m^2/kg)
public let XF_VCM_AGOM      = 20
//Outgassing parameter (m/s^2)
public let XF_VCM_OGPARM    = 21
//Center of mass offset (m)
public let XF_VCM_CMOFFSET  = 22
//Solar flux F10 I3
public let XF_VCM_F10       = 23
//Solar flux F10 average I3
public let XF_VCM_F10AVG    = 24
//Ap average F5.1
public let XF_VCM_APAVG     = 25
//TAI minus UTC (s)I2
public let XF_VCM_TAIMUTC   = 26
//UT1 minus UTC (s) F7.5
public let XF_VCM_UT1MUTC   = 27
//UT1 rate (ms/day)  F5.3
public let XF_VCM_UT1RATE   = 28
//Polar motion X (arcsec) F6.4
public let XF_VCM_POLARX    = 29
//Polar motion Y (arcsec) F6.4
public let XF_VCM_POLARY    = 30
//Nutation terms I3
public let XF_VCM_NTERMS    = 31
//Leap second time YYYYDDDHHMMSS.SSS A17
public let XF_VCM_LEAPYR    = 32
//Integration mode A6 (ASW, OSW, SPADOC)
public let XF_VCM_INTEGMODE = 33
//Type of partial derivatives A8 (Analytic, FULL NUM, FAST NUM)
public let XF_VCM_PARTIALS  = 34
//Integration step mode A4 (AUTO/TIME, S)
public let XF_VCM_STEPMODE  = 35
//Fixed step size indicator A3 (ON/OFF)
public let XF_VCM_FIXEDSTEP = 36
//Initial step size selection A6 (AUTO/MANUAL)
public let XF_VCM_STEPSLCTN = 37
//Initial integration step size F8.3
public let XF_VCM_STEPSIZE  = 38
//Integrator error control E9.3
public let XF_VCM_ERRCTRL   = 39
//Weighted rms of last DC E10.5
public let XF_VCM_RMS       = 40
//BDOT (M2/KG-S)
public let XF_VCM_BDOT      = 41
//EDR (W/KG)
public let XF_VCM_EDR       = 42


//*******************************************************************************
// Different ingetration control/step mode
public let STEPMODE_AUTO = 0
public let STEPMODE_TIME = 1
public let STEPMODE_S    = 2


// ========================= End of auto generated code ==========================
