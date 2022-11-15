//
//  Sgp4PropDll.m
//  
//
//  Created by Gavin Eadie on 11/13/22.
//

// #import <Foundation/Foundation.h>

#import "Sgp4PropDll.h"
#import "ShimTypes.h"

int objcSgp4PropDs50UTC(int64_t satKey, double time, double* epoOut,
                        Real1D* posOut, Real1D* velOut, Real1D* llhOut) {

    void * sgp4Handle = dlopen("/usr/local/lib/sgp4prop/libsgp4prop.dylib", RTLD_NOW);
    fnPtrSgp4PropDs50UTC dll_Sgp4PropDs50UTC = (fnPtrSgp4PropDs50UTC)dlsym(sgp4Handle, "Sgp4PropDs50UTC");
    
    int result = dll_Sgp4PropDs50UTC(satKey, time, epoOut, (double*)posOut, (double*)velOut, (double*)llhOut);
    
    return 0;
}
