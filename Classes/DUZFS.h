//
//  DUZFS.h
//  ZFS
//
//  Created by Louis on 12/10/09.
//  Copyright 2009 underwood. All rights reserved.

#import <Cocoa/Cocoa.h>
#import "DUModule.h"
#import "DMAsyncDelegate-Protocol.h"
#import "DULog.h"
#import "DUVFSEventHandler-DUPrivate.h"
#import "DUDiskController-DMManager.h"
#import "DUDiskOfflineDiskImage.h"
#import "DUPreferences.h"
#import "DUPreferences-_DUPrivate.h"
#import "DUPluginProtocol-Protocol.h"
#import "DUDiskController.h"
#import "DUDiskController-DUPrivate.h"

#include "ZFSSparkle.h"
#include "ZStatus.h"

#define DiskInfoType @"DiskInfoType"

#define AbstractTreeNodeType @"AbstractTreeNodeType"

@class DUDiskController;
@interface DUZFS : DUModule <DUPluginProtocol> {
	
//	utilityView must be connected in xib.
	IBOutlet id kextPanel;

    NSWindow *window;
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
	
	IBOutlet NSOutlineView *outlineView;
	IBOutlet NSTreeController *treeController;
}

@property (nonatomic, retain) IBOutlet NSWindow *window;

@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;


- (id)init;
- (id)dataType;
- (id)displayName;
- (id)tabOrder;

- (void)awakeFromNib;
- (void)Overworked:(NSString *)Header :(NSString *)Body;
- (void)dealloc;
- (void)registerForNotifications;

- (BOOL)authorizedTask:(id *)array tool:(id *)myToolPath array2:(id *)array2 tool2:(id *)myToolPath2;
- (BOOL)displayPanelForDiskType:(int)arg1 andDisk:(id)arg2;
- (BOOL)shouldRunOnThisConfig;

//
- (IBAction)loadKextAction:(id)sender;
//
- (NSString *)ZFSCommand:(NSArray *)Array :(id)sender;

- (void)removeZPool:(NSString *)zpool;
- (void)addZPool:(NSString *)zpool;
- (void)exportZPool:(NSString *)zpool;
- (void)importZPool;
- (void)loadKext;

- (void)moduleDidLoad;
- (id)dm;
- (id)diskController;
- (id)windowController;
- (id)parentTabView;
- (id)parentTabViewItem;
- (id)utilityView;
- (void)setWindowController:(id)arg1;
- (void)setParentTabView:(id)arg1;
- (void)setParentTabViewItem:(id)arg1;
- (BOOL)currentActiveTab;
- (void)setActiveTab;
- (id)warnOnClose;
- (id)warnOnQuit;
- (id)warnOnSwitch;
- (BOOL)canPrint;
- (void)printModuleSpecific:(id)arg1;
- (void)helpButtonAction:(id)arg1;
- (void)registerForNotifications;
- (void)selectionDidChange:(id)arg1;
- (void)becomeSelectedTab;
- (void)deselectTab;
- (void)parentTabViewChanged:(id)arg1;



@end
