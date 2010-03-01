//
//  DUDisk-ZFSDisk.h
//  ZFS
//
//  Created by Louis Jencka on 3/1/10.
//  Copyright 2010 underwood. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DUDisk.h"
#import "DUZFS.h"

@interface DUDisk_ZFSDisk : DUDisk {

}
-(DUDisk *)createZFSDiskFromZpool:(id)zpool;
@end
