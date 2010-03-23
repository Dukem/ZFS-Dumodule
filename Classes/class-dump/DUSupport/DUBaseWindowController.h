/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import <AppKit/NSWindowController.h>

#import "DUWindowControllerProtocol-Protocol.h"

@class DUDiskController;

@interface DUBaseWindowController : NSWindowController <DUWindowControllerProtocol>
{
    BOOL interfaceLock;
    DUDiskController *diskController;
}

- (void)dealloc;
- (void)resizeWindowForSmallDisplaysWithHeight:(double)arg1 withWidth:(double)arg2;
- (BOOL)windowShouldClose:(id)arg1;
- (void)setupNotifications:(id)arg1;
- (id)diskController;
- (void)interfaceLockChanged:(id)arg1;
- (void)windowIsClosing:(id)arg1;
- (void)stuffChanged:(id)arg1;
- (void)dmToolDied:(id)arg1;
- (void)handleQuitWarning:(id)arg1;
- (void)handleContextualMenu:(id)arg1;
- (id)activeDUModule;
- (id)listController;
- (id)selectedDisks;
- (id)selectedVolumes;
- (id)selectedRAIDs;
- (id)allSelectedItems;
- (id)allSelectedItems:(BOOL)arg1 filterDuplicates:(BOOL)arg2;
- (void)setInterfaceLock;
- (void)resetInterfaceLock;
- (BOOL)interfaceLock;
- (id)globalProgressBar;
- (void)setGlobalProgressBarValue:(double)arg1;
- (void)setGlobalProgressText:(id)arg1;
- (void)setGlobalProgressBarIndeterminate:(BOOL)arg1;
- (void)startGlobalProgressBarAnimation:(id)arg1;
- (void)stopGlobalProgressBarAnimation:(id)arg1;
- (void)activateGlobalProgressBar:(BOOL)arg1;
- (void)activateGlobalProgressText:(BOOL)arg1;
- (void)setGlobalPersistentMessageText:(id)arg1;
- (void)setGlobalPersistentAttributedMessageText:(id)arg1;
- (BOOL)globalTextPersistent;
- (void)forceUpdateWindow:(id)arg1;
- (void)notifyWindowOfEvent:(id)arg1 diskNotification:(id)arg2;
- (void)notifyWindowOfCompletion:(id)arg1;
- (id)warnOnClose;
- (id)warnOnQuit;
- (id)warnOnSwitch;
- (BOOL)canPrint;
- (void)printModuleSpecific:(id)arg1;

@end

