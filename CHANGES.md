# Change Note Summary

### 2025 Feb 12 : v0.2.6 • _5th public release (corresponds to Space-Track v9.5)_

### 2024 May 25 : v0.2.6 • _4th public release (corresponds to Space-Track v9.4)_

### 2024 Feb 10 : v0.2.5 • _Third public release (corresponds to Space-Track v9.3)_

### 2023 Dec 23 : v0.2.4 • _Cater for a minor API change in Swift 5.8 (no functional change)_

- Swift is a language which improves in an evolutionary manner.  In Swift 5.8 a little used API was deprecated 
after much careful consideration.  Such changes do not break existing programs but, if the over zealous
programmer adjusts code to the new usage, that **will** cause an error in older compilers - I'm guilty of that.
Any compiler earlier than Swift 5.8 would fail to compile the new usage, `UnsafeMutablePointer.assign(..)`.
The previous form, `UnsafeMutablePointer.update(..)` was left in the Swift library and would have caused no 
trouble (while generating reminders of the depreciated usage) if I had left it alone.

### 2023 Sep 30 : v0.2.3 • _Third public release (corresponds to Space-Track v9.2)_

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
