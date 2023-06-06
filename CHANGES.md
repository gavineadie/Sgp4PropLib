# Change Note Summary

### 2023 Jun 05 : v0.2.2 • _Second public release (corresponds to Space-Track v9.1)_

- **Library Error Fixed**: the bug referenced below at v0.2.1 `Sgp4GenEphems` has been corrected in the v9.1 base library.
- A driver 'convenience' function `tleGetEpochUTC` was added to TleDriver.swift

### 2023 Feb 01 : v0.2.1

- Services: IDX_ERR_NONE, IDX_ERR_WARN, IDX_ERR_ERROR added ..
- Driver: `sgp4GenEphems`: last parameter "genEphemPts" changed from `UnsafeMutablePointer<Int32>` to `UnsafeMutablePointer<Int>` ..
- **Library Error**: a known bug in `Sgp4GenEphems` .. last parameter ("genEphemPts") is returned 1 too many on array overflow

### 2023 Jan 18 : v0.2.0 • _First public release (corresponds to Space-Track v9)_

- Sample application removed ..

### 2023 Jan 14 : v0.1.12

- TestInterfaces driver and sample application added ..
- Unit Tests spilt into dynamic library related files ..

### 2023 Jan 07 : v0.1.11

- First public release (corresponds to Space-Track v9) ..
- READMEs updated ..
- Drivers: Basic XS_TLE support added ..
- Drivers: "typealias" for SatKey and SatNum ..
- Drivers: "tleGetLoaded" returns Array(SatKey) ..
- Drivers: "nullCharacterArray" and "stringFromCharacterArray" replaces old usage ..
- Drivers: "secClass" inout corrected to be String ..
- more unit tests ..

### 2022 Dec 21 : v0.1.5

- Rename headers directory "Include" to "include" for case sensitive Ubuntu ..

### 2022 Dec 20 : v0.1.4

- READMEs created ..
- Change file name cases ..

### 2022 Dec 16 : v0.1.1

- Wrappers and Services directories ..
- Wrappers: "→ Int32" changed to "→ Int" ..
- Wrappers: add TestInterface functions ..

### 2022 Nov 24 : v0.0.9

- Merge branch 'autogen' ..

### 2022 Nov 13 : v0.0.1

- Initial Commit ..
