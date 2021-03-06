/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import <Foundation/NSObject.h>

#import "DUNotifierProtocol-Protocol.h"

@class DMManager, DUDiskListSeparator, NSLock, NSMutableArray;

@interface DUDiskController : NSObject <DUNotifierProtocol>
{
    struct __DASession *da;
    DMManager *dm;
    NSMutableArray *masterDMDiskList;
    NSMutableArray *masterOpticalDiskList;
    NSMutableArray *masterDiskImageList;
    NSMutableArray *cachedDMDUDisksWithChildren;
    NSMutableArray *cachedOpticalDisksWithChildren;
    NSMutableArray *cachedDiskImageDisksWithChildren;
    NSMutableArray *cachedMasterDiskList;
    BOOL allowUpdates;
    BOOL needsRefresh;
    BOOL initialStartupComplete;
    NSMutableArray *raidSetList;
    BOOL pendingUpdate;
    NSMutableArray *tempDiskImageList;
    DUDiskListSeparator *gSeparator;
    NSLock *_lock;
    unsigned long long suddenTermCounter;
    NSLock *suddenTermCounterLock;
}

+ (id)sharedDiskController;
+ (BOOL)isPotentiallyValidDiskImage:(id)arg1;
+ (BOOL)isPotentiallyValidDiskImageTryReallyHard:(id)arg1;
- (id)init;
- (void)dealloc;
- (id)dm;
- (struct __DASession *)da;
- (id)masterDiskList;
- (id)cachedMasterDiskList;
- (id)masterVisibleDiskList;
- (id)masterRootOnlyDiskList;
- (id)masterDiskImageList;
- (long long)separatorIndex;
- (id)daDisksWithChildren;
- (id)opticalDisksWithChildren;
- (id)diskImageDisksWithChildren;
- (void)invalidateDMDiskCache;
- (void)invalidateOpticalDisksCache;
- (void)invalidateDiskImageCache;
- (void)rebuildDMDiskList;
- (void)rebuildOpticalDiskList;
- (void)rebuildDiskImageList;
- (void)rebuildMasterList;
- (void)updateDMList;
- (void)updateOpticalList;
- (void)updateDiskImageList;
- (void)updateMasterDiskListWithEveryDisk;
- (void)updateMasterDiskListWithDisk:(id)arg1;
// returns DUDiskDMDisk
- (id)createDUDiskObjectFromDADisk:(struct __DADisk *)arg1;
- (id)createDUDiskObjectFromDiskIdentifier:(id)arg1;
- (id)createDUDiskObjectFromPath:(id)arg1;
- (id)createDUDiskDMDiskObjectFromDiskIdentifier:(id)arg1;
- (id)findDUDiskWithDADisk:(struct __DADisk *)arg1;
- (id)findOrCreateDUDisk:(struct __DADisk *)arg1;
- (unsigned long long)partitionNumberFromDiskIdentifier:(id)arg1;
- (unsigned long long)diskNumberFromDiskIdentifier:(id)arg1;
- (id)convertDADiskListToDUDiskList:(id)arg1;
- (id)directChildrenOfDisk:(id)arg1;
- (id)directDADiskChildrenOfDisk:(struct __DADisk *)arg1;
- (id)getDiskChildrenFromDiskManagement:(struct __DADisk *)arg1;
- (id)childrenOfRAID:(id)arg1;
- (id)diskWithIdentifier:(id)arg1;
- (id)DMAppleRAIDUUIDLookup:(id)arg1;
- (struct __DADisk *)daDiskWithDiskNumber:(unsigned long long)arg1;
- (struct __DADisk *)daDiskWithIdentifier:(id)arg1;
- (id)diskWithDiskNumber:(unsigned long long)arg1;
- (id)diskWithDADisk:(struct __DADisk *)arg1;
- (id)diskWithMountPoint:(id)arg1;
- (id)opticalDiskWithDevice:(id)arg1;
- (id)diskWithRAIDMemberUUID:(id)arg1;
- (id)diskWithRAIDSetUUID:(id)arg1;
- (id)diskWithRAIDSetUUID:(id)arg1 andMemberUUID:(id)arg2;
- (BOOL)wholeDiskHasOS9Drivers:(id)arg1;
- (int)partitionMapTypeForDisk:(id)arg1;
- (void)diskAppeared:(id)arg1;
- (void)immediateEjectUnmountHandler:(id)arg1;
- (void)diskUnmounted:(id)arg1;
- (void)diskEjected:(id)arg1;
- (void)diskChanged:(id)arg1;
- (void)diskEjectFailed:(id)arg1;
- (void)diskUnmountFailed:(id)arg1;
- (void)diskMountFailed:(id)arg1;
- (void)opticalDeviceChanged:(id)arg1;
- (BOOL)allowUpdates;
- (void)setAllowUpdates:(BOOL)arg1;
- (void)getAllKnownDisks;
- (void)notifyFrontmostModulesOnly:(id)arg1 diskNotification:(id)arg2;
- (void)setupDiskNotifications:(id)arg1;
- (void)setInitialStartupComplete:(BOOL)arg1;
- (BOOL)initialStartupComplete;
- (void)checkforJournalChangeStatus;
- (BOOL)partitionIsHidden:(id)arg1;
- (id)viewablePartitions:(id)arg1;
- (BOOL)diskHasLockedViewablePartitions:(id)arg1;
- (BOOL)diskSupportsLiveResize:(id)arg1;
- (void)deleteDiskImageHandler:(id)arg1;
- (BOOL)imageAtPath:(id)arg1;
- (BOOL)string:(id)arg1 inList:(id)arg2;
- (void)writeKnownImageListToDisk;
- (BOOL)pathInDiskImageList:(id)arg1;
- (id)getDiskInListWithPath:(id)arg1;
- (void)moveDiskImagePath:(id)arg1 atIndex:(long long)arg2;
- (void)delayedChangeNotification:(id)arg1;
- (id)addNotifyDiskImagePath:(id)arg1 atIndex:(long long)arg2;
- (id)addDiskImagePath:(id)arg1 atIndex:(long long)arg2;
- (void)removePathFromDiskImageList:(id)arg1;
- (BOOL)removeDiskImage:(id)arg1;
- (void)checkForBackgroundRAIDRebuild:(id)arg1;
- (void)checkAllDisksForBackgroundRAIDRebuild;
- (void)checkListOfDisksForBackgroundRAIDRebuild:(id)arg1;
- (BOOL)raidSetExists;
- (id)raidSetList;
- (void)duEnableSuddenTermination;
- (void)duDisableSuddenTermination;
- (void)dumpDiskList:(BOOL)arg1;

@end

