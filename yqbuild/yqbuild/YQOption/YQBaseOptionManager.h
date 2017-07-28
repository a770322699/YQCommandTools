//
//  YQBaseOptionManager.h
//  yqbuild
//
//  Created by maygolf on 2017/7/6.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YQBaseCommand.h"
#import "YQBaseParameter.h"

@interface YQBaseOptionManager : NSObject
YQ_DECLARE_SINGLETON_FOR_CLASS(YQBaseOptionManager)

@property (nonatomic, readonly) YQBaseCommand *command;
@property (nonatomic, readonly) YQBaseParameter *parameter;

+ (YQBaseOptionManager *)formatterWithArgc:(int)argc argv:(char * [])argv;

@end
