/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import <Foundation/NSObject.h>

@class NSLock;

@interface DULog : NSObject
{
    NSLock *_lock;
}

+ (id)sharedLog;
+ (void)diskSummary:(id)arg1;
+ (void)log:(id)arg1;
+ (void)log:(id)arg1 withEOL:(BOOL)arg2;
+ (void)log:(id)arg1 priority:(unsigned long long)arg2;
+ (void)log:(id)arg1 priority:(unsigned long long)arg2 withEOL:(BOOL)arg3;
- (id)init;
- (void)dealloc;
- (void)log:(id)arg1 priority:(unsigned long long)arg2 withEOL:(BOOL)arg3;

@end

