//
//  Sgp4PropDll.m
//  
//
//  Created by Gavin Eadie on 11/13/22.
//

// #import <Foundation/Foundation.h>

#import "Sgp4PropDll.h"
#import "ShimTypes.h"

int objcSgp4PropDs50UTC(int64_t satKey, double time, double* __nonnull epo,
                        Real1D* __nonnull posInOut, Real1D* __nonnull velInOut, Real1D* __nonnull llhInOut) {

    void * sgp4Handle = dlopen("/usr/local/lib/sgp4prop/libsgp4prop.dylib", RTLD_NOW);
    fnPtrSgp4PropDs50UTC Sgp4PropDs50UTC = (fnPtrSgp4PropDs50UTC)dlsym(sgp4Handle, "Sgp4PropDs50UTC");

    Sgp4PropDs50UTC(satKey, time, epo, (double*)posInOut, (double*)velInOut, (double*)llhInOut);
    
    return 0;
}
