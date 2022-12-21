# Sgp4Prop

This Package contains two approaches to implementing the SGP4 functions in Swift.
One approach depends on the other.  One is a complete
implementation of all the functions in the SGP4 library, and the libraries it
depends on; the other offers a more idiomatic version of certain functions.

The complete version of the Swift Sgp4 libraries is an automatically generated,
one-to-one, direct equivalent of the C functions.
Since the Swift compiler
can interpret C header (\*.h) files, those headers are 'ground truth' for Swift.
Creating a complete thin Swift interface over the C-style functions that the libraries
offer is a simple process.  These Swift functions are provided in the 'wrappers' directory.

Swift was designed with three core aims, to be **Safe**
in terms of minimizing developer mistakes, **Fast** when it comes to speed of
execution, and **Expressive**, to be as clear and as easy
to understand as possible.  That's given Swift a certain 'feel' just
as formula translation influeced the 'feel' of Fortan, so calling one from the
other involves some friction.

Swift's _safety_ is provided, in part, by rigorous type-checking and as little use
of pointers as possible.  There is a lot of pointer use in there libraries, so the Swift
versions of the library functions look unnatural.  Swift also
doesn't use null-terminated byte arrays to represent strings - strings in Swift are their
own type.  Swift's _expressivity_ is, in one small part, that the result of a Swift function
is returned as the function's value, multiple values would be returned in single `struct`.
There is nothing prohiting returning results via parameter pointers, indeed it is necessary
for this work to be possible, it's just not normal.

To cope with some of these differences and provide functions that would be more familiar to
a Swift user's eyes, a second thin layer of code is laid over the first one.  That's in the
'drivers' dictionary.
It's far from perfect lubrication for the inter-language friction but it helps a little.
To do a 'complete' job of this would make the Swift interface very different from the
existing one and, maybe, add friction of its own.

So, an example.  The raw translation of:
```
    void DllMainGetInfo(char infoStr[128]);
```
is, still passing the string out via the char* reference, as follows:
```
    func DllMainGetInfo(_ infoStr: UnsafeMutablePointer<CChar>)
```
Notice that worrying `UnsafeMutablePointer<CChar>` usage.  It's not really `Unsafe`
in the dangerous meaning, it's just that Swift has lost some control.  However
that pointer (just an address in memory) can, from Swift's point of view point
to nothing other than a `CChar` (C character), a signed 8-bit number.

The 'Swifty' version would pass the string back as the function value.
It's a major imperfection that the two versions are only distinct in the
case of their first letter, but the compiler will catch mistaken use:
```
    func dllMainGetInfo() -> String
```
The reader familiar with Swift has learned nothing from the above!

(https://www.swiftbysundell.com/articles/what-makes-code-swifty/)
