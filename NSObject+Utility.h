//
//  NSObject+Utility.h
//  DBUtil
//
//  Created by Rudy on 2019/10/21.
//  Copyright © 2019 Rudy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Utility)

/// 根据继承关系逐层复制实例变量
/// @param obj 复制的源头
- (void)copyIvarFromObj:(id)obj;


/// 复制某个类的层级的实例变量
/// @param obj 复制的源头
/// @param asClass 复制的类层
- (void)copyIvarFromObj:(id)obj asClass:(Class)asClass;

@end

NS_ASSUME_NONNULL_END
