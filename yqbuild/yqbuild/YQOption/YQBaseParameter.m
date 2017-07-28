//
//  YQBaseParameter.m
//  yqbuild
//
//  Created by maygolf on 2017/7/6.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#include <getopt.h>

#import "YQBaseParameter.h"

typedef NS_ENUM(int, YQBaseParameterFlag) {
    YQBaseParameterFlag_error,
    YQBaseParameterFlag_targetType,
    YQBaseParameterFlag_targetName,
    YQBaseParameterFlag_sdk,
    YQBaseParameterFlag_scheme,
    YQBaseParameterFlag_configuration,
    YQBaseParameterFlag_profile,
};

@implementation YQBaseParameter

- (instancetype)init{
    if (self = [super init]) {
        self.targetType = YQBaseParameterTargetType_workspace;
        self.SDK = @"iphoneos10.2";
        self.configuration = @"Release";
        
        NSString *workspace = nil;
        NSString *projectName = nil;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSArray *contents = [fileManager contentsOfDirectoryAtPath:[fileManager currentDirectoryPath] error:NULL];
        for (NSString *contentName in contents) {
            if ([contentName hasSuffix:@"xcworkspace"]) {
                workspace = contentName;
                break;
            }else if ([contentName hasSuffix:@"xcodeproj"]){
                projectName = contentName;
            }
        }
        if (workspace) {
            self.targetName = workspace;
        }else if (projectName){
            self.targetName = projectName;
            self.targetType = YQBaseParameterTargetType_project;
        }
    }
    return self;
}

- (instancetype)initWithArgc:(int)argc argv:(char * [])argv{
    if (self = [self init]) {
        if (argc <= 1) {
            return self;
        }
        
        int opt = -1;
        int option_index = 0;
        static struct option long_options[] = {
            {"targettype", required_argument, NULL, YQBaseParameterFlag_targetType},
            {"target", required_argument, NULL, YQBaseParameterFlag_targetName},
            {"sdk", required_argument, NULL, YQBaseParameterFlag_sdk},
            {"scheme", required_argument, NULL, YQBaseParameterFlag_scheme},
            {"configuration", required_argument, NULL, YQBaseParameterFlag_configuration},
            {"profile", required_argument, NULL, YQBaseParameterFlag_profile},
        };
        
        while ( (opt = getopt_long(argc, argv, NULL, long_options, &option_index)) != -1){
            NSString *value = [[NSString alloc] initWithCString:optarg encoding:NSUTF8StringEncoding];
            switch (opt) {
                case YQBaseParameterFlag_targetType:
                    if ([value isEqualToString:@"project"]) {
                        self.targetType = YQBaseParameterTargetType_project;
                    }else{
                        self.targetType = YQBaseParameterTargetType_workspace;
                    }
                    break;
                    
                case YQBaseParameterFlag_targetName:
                    self.targetName = value;
                    break;
                    
                case YQBaseParameterFlag_sdk:
                    self.SDK = value;
                    break;
                    
                case YQBaseParameterFlag_scheme:
                    self.scheme = value;
                    break;
                    
                case YQBaseParameterFlag_configuration:
                    self.configuration = value;
                    break;
                    
                case YQBaseParameterFlag_profile:
                    self.profile = value;
                    break;
                    
                default:
                    break;
            }
        }
    }
    
    return self;
}

#pragma mark - getter
- (NSString *)scheme{
    return _scheme.length ? _scheme : [self.targetName stringByDeletingPathExtension];
}

#pragma mark - private
- (NSString *)noteString{
    return @"//";
}

// 是否有注释
- (BOOL)hasNoteForValue:(NSString *)value{
    return [value hasPrefix:[self noteString]];
}

// 添加注释
- (NSString *)addNoteToValue:(NSString *)value{
    if ([self hasNoteForValue:value]) {
        return value;
    }
    
    return [[self noteString] stringByAppendingString:value];
}

// 删除注释
- (NSString *)deleteNoteFromValue:(NSString *)value{
    if (![self hasNoteForValue:value]) {
        return value;
    }
    
    return [value substringFromIndex:[self noteString].length];
}

// 默认配置文件的参数
+ (instancetype)defaultConfigFileParameter{
    YQBaseParameter *par = [[self alloc] init];
    if (par.targetName.length == 0) {
        par.targetName = [par addNoteToValue:@"targetName"];
    }
    if (par.scheme.length == 0) {
        par.scheme = [par addNoteToValue:@"scheme"];
    }
    if (par.profile.length == 0) {
        par.profile = [par addNoteToValue:@"profile"];
    }
    
    return par;
}

#pragma mark - public
// 设置参数到配置文件字典中
- (NSDictionary *)setParameterToConfigDictionary:(NSDictionary *)configDictionary{
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:configDictionary];
    
    
}

@end
