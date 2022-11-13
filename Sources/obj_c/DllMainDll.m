//
//  DllMainDll.m
//  sgp4command
//
//  Created by Gavin Eadie on 11/7/22.
//

//#import <Foundation/Foundation.h>

#import "DllMainDll.h"

//void * mainHandle;

//__int64 dllMainInit(void) {
//    mainHandle = dlopen("/usr/local/lib/sgp4prop/libdllmain.dylib", RTLD_NOW);
//    fnPtrDllMainInit mainInit = (fnPtrDllMainInit)dlsym(mainHandle, "DllMainInit");
//
//    return mainInit();
//}

//NSString * dllMainFuncGetInfo(void) {
//    fnPtrDllMainGetInfo mainGetInfo_f = (fnPtrDllMainGetInfo)dlsym(mainHandle, "DllMainGetInfo");
//
//    char info[128];
//    mainGetInfo_f(info);
//    info[127] = 0;
//
//    return [NSString stringWithCString:info encoding:NSUTF8StringEncoding];
//}
