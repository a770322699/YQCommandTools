//
//  YQBaseOptionManager.m
//  yqbuild
//
//  Created by maygolf on 2017/7/6.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import "YQBaseOptionManager.h"

@interface YQBaseOptionManager ()

@property (nonatomic, strong) YQBaseCommand *command;
@property (nonatomic, strong) YQBaseParameter *parameter;

@end

@implementation YQBaseOptionManager
YQ_SYNTHESIZE_SINGLETON_FOR_CLASS(YQBaseOptionManager)

+ (YQBaseOptionManager *)formatterWithArgc:(int)argc argv:(char * [])argv{
    YQBaseOptionManager *manager = [self sharedInstance];
    manager.command = [[YQBaseCommand alloc] initWithArgc:argc argv:argv];
    manager.parameter = [[YQBaseParameter alloc] initWithArgc:argc argv:argv];
    
    return manager;
}

@end
