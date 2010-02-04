/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "DUMountsController.h"

@interface DUMountsController (_DUPrivate)
- (void)awakeFromNib;
- (void)dealloc;
- (id)localODNode;
- (id)configODNode;
- (BOOL)preflightAuthRights;
- (void)setMountsModified:(BOOL)arg1;
- (void)loadMounts:(id)arg1;
- (void)mountFieldDidChange:(id)arg1;
- (void)mountsResults:(id)arg1 forQuery:(id)arg2 error:(id)arg3;
- (void)mountVerificationExpired;
- (void)mountVerificationSucceeded;
- (void)threadedPingNFSServer:(id)arg1;
- (void)results:(id)arg1 forQuery:(id)arg2 error:(id)arg3;
- (void)updateSystemWithNewMountInfo;
@end
