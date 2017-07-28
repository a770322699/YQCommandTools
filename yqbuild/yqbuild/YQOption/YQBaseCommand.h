//
//  YQBaseCommand.h
//  yqbuild
//
//  Created by maygolf on 2017/7/6.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YQBaseCommandType) {
    YQBaseCommandType_none,         // 无命令参数
    YQBaseCommandType_init,         // 初始化命令
    YQBaseCommandType_config,       // 配置命令
    YQBaseCommandType_help,         // 查看帮助
};

@interface YQBaseCommand : NSObject

@property (nonatomic, assign) YQBaseCommandType type; // 命令类型

- (instancetype)initWithArgc:(int)argc argv:(char * [])argv;

@end
