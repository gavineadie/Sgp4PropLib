//
//  TimeFuncDll.m
//  sgp4command
//
//  Created by Gavin Eadie on 11/8/22.
//

//#import <Foundation/Foundation.h>

#import "TimeFuncDll.h"

//void * libtimefuncHandle;

//int timeFuncInit(__int64 globalHandle) {
//    libtimefuncHandle = dlopen("/usr/local/lib/sgp4prop/libtimefunc.dylib", RTLD_NOW);
//    fnPtrTimeFuncInit timeFuncInit = (fnPtrTimeFuncInit)dlsym(libtimefuncHandle, "TimeFuncInit");
//
//    return timeFuncInit(globalHandle);
//}

//NSString * timeFuncGetInfo(void) {
//    fnPtrTimeFuncGetInfo timeGetInfo_f = (fnPtrTimeFuncGetInfo)dlsym(libtimefuncHandle, "TimeFuncGetInfo");
//    
//    char info[128];
//    timeGetInfo_f(info);
//    info[127] = 0;
//    return [NSString stringWithCString:info encoding:NSUTF8StringEncoding];
//    
//}
