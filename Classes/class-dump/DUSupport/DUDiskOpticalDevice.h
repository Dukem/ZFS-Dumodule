/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import <DUSupport/DUDiskTransientDMDisk.h>

@class DRDevice, NSNumber;

@interface DUDiskOpticalDevice : DUDiskTransientDMDisk
{
    DRDevice *device;
    NSNumber *calculatedIOKitSize;
}

+ (id)newDUDiskOpticalDeviceWithDevice:(id)arg1;
- (id)init;
- (void)dealloc;
- (void)invalidateCachedData;
- (int)duObjectClass;
- (void)setDevice:(id)arg1;
- (id)device;
- (void)updateData:(id)arg1;
- (id)uncachedDisplayIcon;
- (id)displayName;
- (id)toolTipString;
- (int)calculateDUDiskType;
- (id)diskDisplayType;
- (void)diskFullDescription;
- (const char *)di;
- (BOOL)hasParentDisk;
- (void)updateChildren;
- (BOOL)isOpticalDevice;
- (BOOL)isDVDRAM;
- (id)ioKitSize;
- (id)connectionIDDictionary;
- (BOOL)supportsPacketWriting;
- (BOOL)hasBlankOpticalMedia;

@end
