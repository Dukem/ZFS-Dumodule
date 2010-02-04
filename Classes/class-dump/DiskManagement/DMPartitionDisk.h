/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "NSObject.h"

@interface DMPartitionDisk : NSObject
{
    id _instPriv;
}

- (id)init;
- (id)initWithManager:(id)arg1;
- (void)dealloc;
- (void)setDelegate:(id)arg1;
- (int)partitionDisk:(struct __DADisk *)arg1 withMap:(id)arg2 formatVolumes:(BOOL)arg3;
- (int)splitPartition:(struct __DADisk *)arg1 intoNewPartitions:(id)arg2;
- (int)getResizeLimits:(struct __DADisk *)arg1 returningInfo:(id *)arg2;
- (int)resizePartition:(struct __DADisk *)arg1 toBytes:(id)arg2 withNewMapEntries:(id)arg3;
- (int)mergePartitions:(id)arg1 filesystem:(id)arg2 name:(id)arg3 erase:(BOOL)arg4;
- (int)adjustMapToFitGrownWholeDisk:(struct __DADisk *)arg1;
- (id)getPartitionStartLocationForDisk:(struct __DADisk *)arg1;
- (int)changeFilesystemSizeOnDisk:(struct __DADisk *)arg1 toSize:(id)arg2 fitPartition:(BOOL)arg3;
- (int)createExternalJournalOnDisk:(struct __DADisk *)arg1 forDisk:(struct __DADisk *)arg2;

@end

