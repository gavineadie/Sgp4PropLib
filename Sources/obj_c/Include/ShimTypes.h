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
} Int1D;

typedef struct {
    int64_t x, y, z;
} Long1D;

typedef struct {
    double x, y, z;
} Real1D;

typedef struct {
    double p, q, r, s, t, u;
} Double_1x6;

typedef struct {
    Int1D a, b;
} Int2D;

typedef struct {
    Long1D a, b;
} Long2D;

typedef struct {
    Real1D a, b;
} Real2D;

_Pragma("clang assume_nonnull begin")

int objcSgp4PropDs50UTC(void * , int64_t, double, double* , Real1D* , Real1D* , Real1D* );

int objcSgp4PropMsePointer(void * , int64_t, double, double* , Real1D* , Real1D* , Real1D* );

int objcSgp4PropDs50UtcPosVel(void * , int64_t, double, Real1D* , Real1D* );

int objcSgp4PropDs50UtcPos(void * , int64_t, double, Real1D* );

int objcSgp4PropDs50UtcLLH(void * , int64_t, double, Real1D* );

_Pragma("clang assume_nonnull end")

#endif /* ShimTypes_h */
