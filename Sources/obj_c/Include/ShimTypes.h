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
    Int1D a, b;
} Int2D;

typedef struct {
    Long1D a, b;
} Long2D;

typedef struct {
    Real1D a, b;
} Real2D;

int objcSgp4PropDs50UTC(int64_t, double, double* __nonnull,
                           Real1D* __nonnull, Real1D* __nonnull, Real1D* __nonnull);

#endif /* ShimTypes_h */
