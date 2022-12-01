//
//  Sgp4PropDll.m
//  
//
//  Created by Gavin Eadie on 11/13/22.
//

#import "Sgp4PropDll.h"
#import "ShimTypes.h"

int objcSgp4PropDs50UTC(void * libSgp4Handle, int64_t satKey, double ds50UTC, double* mseOut,
                        Double_3* posOut, Double_3* velOut, Double_3* llhOut) {

    fnPtrSgp4PropDs50UTC dll_Sgp4PropDs50UTC = (fnPtrSgp4PropDs50UTC)dlsym(libSgp4Handle, "Sgp4PropDs50UTC");
    
    return dll_Sgp4PropDs50UTC(satKey, ds50UTC, mseOut, (double*)posOut, (double*)velOut, (double*)llhOut);
    
}

int objcSgp4PropMsePointer(void * libSgp4Handle, int64_t satKey, double mse, double* ds50UTC,
                           Double_3* pos, Double_3* vel, Double_3* llh) {
    
    fnPtrSgp4PropDs50UTC dll_Sgp4PropMse = (fnPtrSgp4PropMse)dlsym(libSgp4Handle, "Sgp4PropMse");
    
    return dll_Sgp4PropMse(satKey, mse, ds50UTC, (double*)pos, (double*)vel, (double*)llh);
    
}

int objcSgp4PropDs50UtcPosVel(void * libSgp4Handle, int64_t satKey, double ds50UTC,
                              Double_3* pos, Double_3* vel) {
    
    fnPtrSgp4PropDs50UtcPosVel dll_Sgp4PropDs50UtcPosVel = (fnPtrSgp4PropDs50UtcPosVel)dlsym(libSgp4Handle, "Sgp4PropDs50UtcPosVel");
    
    return dll_Sgp4PropDs50UtcPosVel(satKey, ds50UTC, (double*)pos, (double*)vel);
    
}

int objcSgp4PropDs50UtcLLH(void * libSgp4Handle, int64_t satKey, double ds50UTC, Double_3* llh) {
    
    fnPtrSgp4PropDs50UtcLLH dll_Sgp4PropDs50UtcLLH = (fnPtrSgp4PropDs50UtcLLH)dlsym(libSgp4Handle, "Sgp4PropDs50UtcLLH");
    
    return dll_Sgp4PropDs50UtcLLH(satKey, ds50UTC, (double*)llh);
    
}

int objcSgp4PropDs50UtcPos(void * libSgp4Handle, int64_t satKey, double ds50UTC, Double_3* pos) {
    
    fnPtrSgp4PropDs50UtcPos dll_Sgp4PropDs50UtcPos = (fnPtrSgp4PropDs50UtcPos)dlsym(libSgp4Handle, "Sgp4PropDs50UtcPos");
    
    return dll_Sgp4PropDs50UtcPos(satKey, ds50UTC, (double*)pos);
    
}
