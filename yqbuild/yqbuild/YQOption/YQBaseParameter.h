//
//  YQBaseParameter.h
//  yqbuild
//
//  Created by maygolf on 2017/7/6.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YQBaseParameterTargetType) {
    YQBaseParameterTargetType_workspace,
    YQBaseParameterTargetType_project,
};

@interface YQBaseParameter : NSObject

@property (nonatomic, assign) YQBaseParameterTargetType targetType; // 目标类型
@property (nonatomic, strong) NSString *targetName;  // 工程名或者工作空间名
@property (nonatomic, strong) NSString *SDK;  // 编译使用的sdk，默认为：iphoneos10.2
@property (nonatomic, strong) NSString *scheme;  //
@property (nonatomic, strong) NSString *configuration;  // 默认为:Release
@property (nonatomic, strong) NSString *profile;  // 说明文件

- (instancetype)initWithArgc:(int)argc argv:(char * [])argv;

// 设置参数到配置文件字典中
- (NSDictionary *)setParameterToConfigDictionary:(NSDictionary *)configDictionary;

@end
