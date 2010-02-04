//
//  ZFSSparkle.h
//  ZFS
//
//  Created by Louis Jencka on 12/14/09.
//  Copyright 2009 underwood. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include <Sparkle/SUUpdater.h>

@class SUUpdater;

@interface ZFSSparkle : SUUpdater {

}
+ (id)sharedUpdater;
- (id)init;
@end
