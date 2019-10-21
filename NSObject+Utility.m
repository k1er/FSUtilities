//
//  NSObject+Utility.m
//  DBUtil
//
//  Created by Rudy on 2019/10/21.
//  Copyright © 2019 Rudy. All rights reserved.
//

#import "NSObject+Utility.h"

#import <objc/runtime.h>

@implementation NSObject (Utility)

- (void)copyIvarFromObj:(id)obj {
    Class originClass = [self class];
       
    if (originClass == nil || ![obj isKindOfClass:originClass]) {
        return;
    }
    
    do {
        [self copyIvarFromObj:obj asClass:originClass];
    } while ([originClass superclass]);
}

- (void)copyIvarFromObj:(id)obj asClass:(Class)asClass {
    unsigned int ivarCount = 0;
    Ivar * ivars = class_copyIvarList(asClass, &ivarCount);
    for (unsigned int i = 0; i < ivarCount; i ++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        
        NSString *keyPath = [NSString stringWithUTF8String:name];
        [self setValue:[obj valueForKeyPath:keyPath] forKeyPath:keyPath];
    }
    
    free(ivars);
}

@end
