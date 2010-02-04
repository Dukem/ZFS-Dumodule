/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "DUDiskTransientDMDisk.h"

@class NSNumber, NSString;

@interface DUDiskOfflineDiskImage : DUDiskTransientDMDisk
{
    NSString *imagePath;
    NSString *imageName;
    struct AliasRecord **imageAlias;
    unsigned long long diskImageSize;
    NSNumber *isWritableMediaKey;
    NSNumber *isEncrypted;
    BOOL isHTTP;
}

+ (id)newDUDiskOfflineDiskImageWithPath:(id)arg1;
+ (id)newDUDiskOfflineDiskImageWithDADisk:(struct __DADisk *)arg1;
- (id)init;
- (void)dealloc;
- (int)duObjectClass;
- (void)invalidateCachedData;
- (void)setImagePath:(id)arg1;
- (id)imageName;
- (id)wholeDiskName;
- (void)setSize:(unsigned long long)arg1;
- (unsigned long long)totalSize;
- (unsigned long long)hash;
- (void)setHTTP:(BOOL)arg1;
- (id)imagePath;
- (id)diskImagePath;
- (id)uncachedDisplayIcon;
- (id)displayName;
- (id)stringForOutlineView;
- (id)stringForSimpleInterfaceList;
- (id)diskIdentifier;
- (id)volumeName;
- (id)mediaName;
- (BOOL)isWhole;
- (BOOL)isNonLeaf;
- (id)deviceName;
- (id)toolTipString;
- (int)calculateDUDiskType;
- (id)diskDisplayType;
- (BOOL)canBeRemovedByUser;
- (BOOL)isOfflineDiskImage;
- (id)outlineViewColor;
- (BOOL)canBeRestoreSource;
- (id)protocol;
- (id)mediaType;
- (id)localizedProtocol;
- (BOOL)hasParentDisk;
- (BOOL)isDiskImage;
- (BOOL)isHTTPDiskImage;
- (BOOL)mountAllowed;
- (BOOL)isEncryptedDiskImage;
- (BOOL)isWritableMedia;
- (BOOL)needsPseudoPartitionDisk;
- (void)diskFullDescription;

@end
