/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "NSObject.h"

@class DUModuleManager, NSMenu;

@interface DUContextualMenus : NSObject
{
    DUModuleManager *firstModuleManager;
    NSMenu *dockMenu;
    BOOL runningFromInstallMedia;
}

+ (id)sharedContextualMenus;
- (id)init;
- (void)dealloc;
- (void)setModuleManager:(id)arg1;
- (id)contextualMenuForDisk:(id)arg1 inWindow:(id)arg2;
- (id)dockMenu;

@end

