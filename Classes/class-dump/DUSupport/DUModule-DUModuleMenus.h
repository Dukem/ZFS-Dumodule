/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import <DUSupport/DUModule.h>

@interface DUModule (DUModuleMenus)
- (id)createMenuItem:(id)arg1 withTarget:(id)arg2 withObject:(id)arg3 withAction:(SEL)arg4;
- (id)moduleSpecificMenu;
- (id)moduleSpecificDockMenu;
- (void)setModuleSpecificMenu:(id)arg1;
- (void)setModuleSpecificDockMenu:(id)arg1;
- (id)contextualMenuForDisk:(id)arg1;
- (BOOL)supportsContextMenuForDiskType:(int)arg1 selectedDisk:(id)arg2;
@end
