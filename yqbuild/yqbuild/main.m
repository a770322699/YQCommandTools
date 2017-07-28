//
//  main.m
//  yqbuild
//
//  Created by maygolf on 2017/7/5.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YQBaseOptionManager.h"
#import "YQCommand.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 获取选项中的命令和参数
        YQBaseOptionManager *manager = [YQBaseOptionManager formatterWithArgc:argc argv:(char **)argv];
        
        // 执行命令
        [[[YQCommand alloc] initWithBaseCommand:manager.command baseParameter:manager.parameter] execution];
    }
    return 0;
}
