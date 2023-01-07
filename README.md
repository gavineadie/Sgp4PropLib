# The Sgp4Prop Package

The best way to incorporate the Swift interface to the SGP4 libraries in your Swift program is by using a Package.  The [Swift Package Manager](https://www.swift.org/package-manager/) (SPM) is designed to ease the distribution and use of a collection of files like that contained here.

## The Swift development environment

On Apple's platforms (Mac, iPhone, iPad and Apple Watch) the most used development environment is Xcode which is a complete IDE designed to cater for multiple computer languages and multiple target products, kernel extensions, plug-ins, libraries (static or dynamic) all the way to complete applications.

Xcode is a tool aimed at producing software for Apple's hardware.  However, Swift is not limited to Apple products, so where Xcode doesn't go, another mechanism  is required.  The Swift compiler runs on several varieties of Linux, and on Windows, and will build products for those platforms.  The Swift Package Manager operates across all these platforms too.

In the presence of the SPM, on Mac, Linux or Windows, building and running an application can be as simple as
```
    cd Application
    swift run
```
This capability relies on a manifest file which describes the necessary libraries and Swift settings for success.  Any libraries that are necessary for linking external functionality and completing the creation of the runnable application are described within that manifest.

Swift is an object oriented language but the Swift interface to the SGP4 libraries does not make use of that.  Whether providing TLEs, Satellites, Orbital Elements etc as objects would be helpful is a matter for another day.

## The SGP4 Package

The directory 'package' is such a Package and the four sample command-line applications all make use of it to incorporate the Swift interface to the SGP4 dynamic libraries.  The Package.swift manifests for each application are of the form:

```
import PackageDescription

let package = Package(
    name: "Sgp4Prop-Simple",
    dependencies: [
//	.package(url: "https://github.com/gavineadie/Sgp4PropLib.git", from: "0.0.1"),
       	.package(name: "Sgp4PropLib", path: "../package/"),
    ],
    targets: [
        .executableTarget(name: "Sgp4Prop-Simple",
                          dependencies: ["Sgp4PropLib"]),
    ]
)
```
This is actually some Swift code which, in human-readable terms, specifies the name of the application (`Sgp4Prop-Simple`) and that it depends a Package (`dependencies`).  The attributes of the `.package` the applications depends on provides a name and describes its location, which can be a set of local files, or on a `git` server on the Internet.

The `.targets` parameter can describe one or more products related to the `Sgp4Prop-Simple` package.  In this case, there in only one: an executable (a runnable program) called `Sgp4Prop-Simple` requiring only the previously described dependency.  It may seem that there is some redundancy in this package manifest (the target name is repeated, as is what it depends on) and that is because this is the simplest possible manifest.  More complex ones might have multiple dependencies (perhaps a logging library, perhaps a high precision trigonometry library), and might have multiple targets (a testing suite, for example).

Note that there are two `.package` definitions .. one (commented out) relates to a package on the Internet, the other refers to the local file system (in this case the `Sgp4PropLib` package is in the "DriverExamples" directory alongside the four sample applications).

In short, we have each sample application described by a Package and in that Package is a reference to a needed library (which is also a Package).  At the time of the release of this Swift interface, the SGP4 Package contained in the distribution is the same as the one on the Internet, but with the passage of time bug fixes and other improvements will be applied to the Internet version.

In order to keep some control over such changes, the Internet versions are numbered with a 'semantic version' an increasingly common mechanism.  Briefly, this involves a version of the form `P.Q.R` where `R` increments with minor changes, `Q` increments with a functional change, and `P` increments with a major, new  release.  `P` equals zero during development and testing and this Swift release neither tested exhaustively nor, I expect, bug free as I write this, so the version is `0.1.7`

Version increments are seen by the [Swift Package Manager](https://www.swift.org/package-manager/) so improvements can be incorporated automatically or on demand.

## Running the sample applications

Once the Swift directory is downloaded and unzip'd, change directory to that of the sample application to be built and run:

    cd   .. /Swift/DriverExamples/Sgp4Prop_Simple

If the Swift development environment is available on your computer (on Macs, it is a part of Xcode, on Linux see [scroll down to "Linux"](https://www.swift.org/download/#using-downloads)], on Windows (not tested by this author) [scroll further down to "Windows"](https://www.swift.org/download/#using-downloads)]) the command line invocation `swift build` will read, compile and interpret the `Package.swift` file, contained in the current directory, to gather any dependencies, then the Swift compiler will compile everything and link it into a runnable application.

Since some of the sample applications require parameters and/or input/output files, each application can be built and run with in a prepared environment by executing a script (examining the script will reveal more detail):

	./runExample.sh

If you are an Xcode user, these sample applications can be opened up, worked on, built, tested and executable products generated and run by opening the appropriate `Package.swift` file in Xcode.  Differences between the SPM and the Xcode environment will require minor adjustments, but no more than needed to cater for such differences in any application.

## Your application

To use the Swift interface to the SGP4 libraries in your program, you will need to import the namespace to the source code.  There are two such imports .. one, `Sgp4PropLib`, is for pure Swift use and the other, `Sgp4Prop_c`, provides access to values defined in the C header files (mostly in `DllMainDll.h`) that accompany the Swift interface.

The values in the header files are all uppercase so complaints about missing symbols that are all-caps is a good hint that you need to import the C headers.  There is no harm in including both.

For example, the `Sgp4Prop` sample application's Swift source (reduced to essentials for this explanation) reads:

```
import Foundation

import Sgp4PropLib              // make all the Swift functions available
import Sgp4Prop_c               // make enums in "DllMainDll.h" available
                                // .. specifically "IDX_ORDER_READ" below

@main
public struct Sgp4Prop {
    public static func main() {
         :  :  :
        print("## Sgp4Prop starts ..")

        loadAllDlls()           // load all the dylibs
         :  :  :
        TleGetLoaded(Int32(IDX_ORDER_READ), // <-- "IDX_ORDER_READ" is ..
                     &pSatKeys)             // .. defined only in DllMainDll.h
```

## Support

The directory called "`package`" in this distribution is also provided at GitHub.com, and, as time passes, the two will diverge because the Internet version will be improved as necessary.

For this reason, you should modify the Package dependency to the Internet version:

    .package(url: "https://github.com/gavineadie/Sgp4PropLib.git", from: "0.0.1"),

Suggestions, questions, bug reports, etc placed in the "Issues" area of the Sgp4PropLib repository can be viewed by anyone and will get my attention.
