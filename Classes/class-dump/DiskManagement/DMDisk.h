/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "NSObject.h"

@class NSString;

@interface DMDisk : NSObject
{
    NSString *_bsd;
    NSString *_vol;
    NSString *_mnt;
}

- (id)initWithBSD:(id)arg1 VOL:(id)arg2 MNT:(id)arg3;
- (void)dealloc;
- (id)description;
- (id)wholeDiskName;
- (BOOL)isRAIDSlice;
- (BOOL)isRAIDSpare;
- (BOOL)isRAIDMaster;

@end
