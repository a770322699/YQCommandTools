//
//  YQCommand.m
//  yqbuild
//
//  Created by maygolf on 2017/7/6.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import "YQCommand.h"
#import "YQInitCommand.h"

@interface YQCommand ()

@property (nonatomic, assign) YQCommandType type;
@property (nonatomic, strong) YQBaseParameter *baseParameter;

@end

@implementation YQCommand

- (instancetype)initWithType:(YQCommandType)type baseParameter:(YQBaseParameter *)baseParameter{
    YQCommand *command = nil;
    
    switch (type) {
        case YQCommandType_init:
            command = [[YQInitCommand alloc] init];
            break;
            
        default:
            break;
    }
    
    command.type = type;
    command.baseParameter = baseParameter;
    return command;
}

- (instancetype)initWithType:(YQCommandType)type{
    return [self initWithType:type baseParameter:nil];
}

- (instancetype)initWithBaseCommand:(YQBaseCommand *)baseCommand baseParameter:(YQBaseParameter *)baseParameter{
    YQCommandType type = YQCommandType_none;
    switch (baseCommand.type) {
        case YQBaseCommandType_init:
            type = YQCommandType_init;
            break;
            
        case YQBaseCommandType_config:
            type = YQCommandType_config;
            break;
            
        case YQBaseCommandType_help:
            type = YQCommandType_help;
            break;
            
        case YQBaseCommandType_none:
            type = YQCommandType_none;
            break;
            
        default:
            break;
    }
    
    return [self initWithType:type baseParameter:baseParameter];
}

#pragma mark - public
- (void)execution{
    
}

@end
