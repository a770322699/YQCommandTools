//
//  YQInitCommand.m
//  yqbuild
//
//  Created by maygolf on 2017/7/6.
//  Copyright © 2017年 yiquan. All rights reserved.
//

#import "YQInitCommand.h"

@implementation YQInitCommand

#pragma mark - public
- (void)execution{
    NSString *configFileName = @"configer.plist";
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *directoryPath = [[fileManager currentDirectoryPath] stringByAppendingPathComponent:kBuildDirectory];
    NSString *filePath = [directoryPath stringByAppendingPathComponent:configFileName];
    
    BOOL exist = [fileManager fileExistsAtPath:filePath];
    if (exist) {
        NSLog(@"config file existed, remove it?\n please intput y mean yes or n mean NO");
        char needRemove = 'n';
        scanf("%s", &needRemove);
        if (needRemove == 'y') {
            [fileManager removeItemAtPath:filePath error:NULL];
            exist = NO;
        }
    }
    
    NSMutableDictionary *content = nil;
    if (exist) {
        content = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    }else{
        
        content = [NSMutableDictionary dictionary];
        [content setObject:@"//targettype" forKey:@"targettype"];
        [content setObject:@"//target" forKey:@"target"];
        [content setObject:@"iphoneos10.2" forKey:@"sdk"];
        [content setObject:@"//scheme" forKey:@"scheme"];
    }
    
    if (!exist) {
        BOOL direcoryExist = [fileManager fileExistsAtPath:directoryPath isDirectory:NULL];
        if (!direcoryExist) {
            [fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:NULL];
        }

        [@{@"xxxx" : @"xxxx"} writeToFile:filePath atomically:YES];
    }else{
        [@{@"aaaaa" : @"aaaa"} writeToFile:filePath atomically:YES];
    }
}

@end
