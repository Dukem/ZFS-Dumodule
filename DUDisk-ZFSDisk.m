//
//  DUDisk-ZFSDisk.m
//  ZFS
//
//  Created by Louis on 3/1/10.
//  Copyright 2010 underwood. All rights reserved.
//

#import "DUDisk-ZFSDisk.h"


@implementation DUDisk_ZFSDisk
-(DUDisk *)createZFSDiskFromZpool:(id)zpool
{

		NSLog(@"%@",[[DUDiskController alloc] masterDiskList]);
		NSLog(@"%@",[[DUDiskController alloc] masterVisibleDiskList]);

		DUDisk *Disk = [[DUDiskController sharedDiskController] createDUDiskObjectFromPath:@"/Users/Snow/Documents/zfs.img"];
		NSLog(@"%@",[Disk description]);
		[Disk setIsDisplayedToUser:1];
		[Disk setDiskIdentifier:@"!"];
		[[DUDiskController sharedDiskController] updateMasterDiskListWithDisk:Disk];
		[[DUDiskController sharedDiskController] rebuildMasterList];
	
}
@end
