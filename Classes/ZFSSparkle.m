//
//  ZFSSparkle.m
//  ZFS
//
//  Created by Louis Jencka on 12/14/09.
//  Copyright 2009 underwood. All rights reserved.
//

#import "ZFSSparkle.h"


@implementation ZFSSparkle
+ (id)sharedUpdater
{
    return [self updaterForBundle:[NSBundle bundleForClass:[self class]]];
}

- (id)init
{
    return [self initForBundle:[NSBundle bundleForClass:[self class]]];
}
@end
