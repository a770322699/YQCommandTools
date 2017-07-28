//
//  YQBaseCommand.m
//  yqbuild
//
//  Created by maygolf on 2017/7/6.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import "YQBaseCommand.h"

@implementation YQBaseCommand

- (instancetype)initWithArgc:(int)argc argv:(char * [])argv{
    if (self = [super init]) {
        if (argc <= 1) {
            return self;
        }
        
        NSString *value = [[NSString alloc] initWithCString:argv[1] encoding:NSUTF8StringEncoding];
        if ([value isEqualToString:@"init"]) {
            self.type = YQBaseCommandType_init;
        }else if ([value isEqualToString:@"config"]){
            self.type = YQBaseCommandType_config;
        }else if ([value isEqualToString:@"help"]){
            self.type = YQBaseCommandType_help;
        }
    }
    return self;
}

@end
