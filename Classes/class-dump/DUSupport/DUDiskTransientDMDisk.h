/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "DUDisk.h"

@class NSString;

@interface DUDiskTransientDMDisk : DUDisk
{
    NSString *diskIdentifier;
    DUDisk *diskNode;
}

- (id)init;
- (void)dealloc;
- (BOOL)shouldInvalidateCachedData;
- (void)invalidateCachedData;
- (int)duObjectClass;
- (void)setDiskNode:(id)arg1;
- (id)diskNode;
- (void)setDiskIdentifier:(id)arg1;
- (id)diskIdentifier;
- (id)deviceNode;
- (BOOL)isDisplayedToUser;
- (id)displayIcon;
- (id)displayName;
- (id)stringForOutlineView;
- (id)stringForSimpleInterfaceList;
- (id)toolTipString;
- (int)calculateDUDiskType;
- (id)diskDisplayType;
- (void)diskOneLineDescription;
- (void)diskFullDescription;
- (const char *)di;
- (BOOL)hasParentDisk;
- (struct __DADisk *)theDADisk;
- (id)children;
- (void)updateChildren;
- (id)wholeDiskName;
- (unsigned long long)sliceNumber;
- (struct __CFDictionary *)registryProps;
- (long long)partitionID;
- (BOOL)deviceIsOpen;
- (BOOL)isVirtualOnly;
- (id)mountPoint;
- (id)volumeName;
- (id)filesystem;
- (id)filesystemType;
- (id)ioContent;
- (id)deviceTreePath;
- (id)bayName;
- (id)UUID;
- (id)diskArbInfoDict;
- (BOOL)isWritableMedia;
- (BOOL)isWritableVolume;
- (BOOL)isEjectable;
- (BOOL)isWhole;
- (BOOL)isNetworkDisk;
- (BOOL)isNonLeaf;
- (BOOL)isCDROM;
- (BOOL)isDVDROM;
- (BOOL)isOpticalDisc;
- (BOOL)isJournaled;
- (BOOL)isErasableOpticalMedia;
- (BOOL)isMountable;
- (id)opticalMediaType;
- (long long)isInternal;
- (id)opticalDeviceType;
- (id)busSpecificKeys;
- (id)ioKitSize;
- (id)blockSize;
- (unsigned long long)totalSize;
- (unsigned long long)freeSpace;
- (unsigned long long)rawSize;
- (id)protocol;
- (id)mediaType;
- (unsigned long long)diskNumber;
- (unsigned long long)partitionNumber;
- (BOOL)permissionsEnabled;
- (BOOL)canRepairPermissions;
- (BOOL)canBeVerified;
- (BOOL)canBeRepaired;
- (BOOL)mountAllowed;
- (BOOL)isOpticalDevice;
- (BOOL)isFireWireDisk;
- (BOOL)isUSBDisk;
- (BOOL)isSCSIDisk;
- (BOOL)isDVDRAM;
- (BOOL)isBootVolume;
- (BOOL)needsPseudoPartitionDisk;
- (id)connectionIDDictionary;
- (BOOL)supportsPacketWriting;
- (BOOL)hasBlankOpticalMedia;
- (BOOL)isTransientDisk;
- (void)setEjected:(BOOL)arg1;

@end

