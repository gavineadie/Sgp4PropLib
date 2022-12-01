//
//  ShimTypes.h
//  Sgp4PropApp
//
//  Created by Gavin Eadie on 11/4/22.
//

#ifndef ShimTypes_h
#define ShimTypes_h

typedef struct {
    int32_t x, y, z;
} Int32_3;

typedef struct {
    int64_t x, y, z;
} Int64_3;

typedef struct {
    double x, y, z;
} Double_3;

typedef struct {
    double g, h, j, k, l, m;
} Double_6;

typedef struct {
    double f0, f1, f2, f3, f4, f5, f6, f7, f8, f9;
} Double_10;

typedef struct {
    Int32_3 a, b;
} Int32_2_3;

typedef struct {
    Int64_3 a, b;
} Int64_2_3;

typedef struct {
    Double_3 a, b;
} Double_2_3;

typedef struct {
    Double_6 p, q, r, s, t, u;
} Double_6_6;

_Pragma("clang assume_nonnull begin")

int objcSgp4PropDs50UTC(void * , int64_t, double, double* , Double_3* , Double_3* , Double_3* );

int objcSgp4PropMsePointer(void * , int64_t, double, double* , Double_3* , Double_3* , Double_3* );

int objcSgp4PropDs50UtcPosVel(void * , int64_t, double, Double_3* , Double_3* );

int objcSgp4PropDs50UtcPos(void * , int64_t, double, Double_3* );

int objcSgp4PropDs50UtcLLH(void * , int64_t, double, Double_3* );

_Pragma("clang assume_nonnull end")

#endif /* ShimTypes_h */
