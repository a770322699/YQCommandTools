//
//  YQCommand.h
//  yqbuild
//
//  Created by maygolf on 2017/7/6.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YQBaseCommand.h"
#import "YQBaseParameter.h"

typedef NS_ENUM(NSInteger, YQCommandType) {
    YQCommandType_none,
    YQCommandType_init,     // 初始化命令
    YQCommandType_config,   // 配置命令
    YQCommandType_help,     // 查看帮助命令
};

@interface YQCommand : NSObject

@property (nonatomic, readonly) YQCommandType type;
@property (nonatomic, readonly) YQBaseParameter *baseParameter;

- (instancetype)initWithType:(YQCommandType)type;
- (instancetype)initWithBaseCommand:(YQBaseCommand *)baseCommand baseParameter:(YQBaseParameter *)baseParameter;
- (void)execution;

@end
