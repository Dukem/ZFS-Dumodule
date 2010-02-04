/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "DUBaseWindowController.h"

#import "DUListWindowProtocol-Protocol.h"
#import "NSTabViewDelegate-Protocol.h"
#import "NSToolbarDelegate-Protocol.h"

@class DUDiskListViewController, DUInfoPanel, DUModule, DUModuleManager, DUWindowControllerInfoPanel, NSButton, NSLock, NSMutableArray, NSProgressIndicator, NSSplitView, NSTabView, NSTabViewItem, NSTextField, NSView;

@interface DUWindowController : DUBaseWindowController <DUListWindowProtocol, NSToolbarDelegate, NSTabViewDelegate>
{
    NSSplitView *splitInnerView;
    id statusAreaView;
    NSTabView *panelTabView;
    NSTabViewItem *blankTabViewItem;
    NSTextField *messageTextView;
    NSProgressIndicator *startupProgressBar;
    NSView *listView;
    NSButton *helpButton;
    DUWindowControllerInfoPanel *extendedInfoController;
    DUDiskListViewController *diskListViewController;
    DUModuleManager *moduleManager;
    DUInfoPanel *infoPanel;
    NSMutableArray *moduleTabViewList;
    BOOL tabsUpdateOnSelection;
    NSMutableArray *listTabViewList;
    DUModule *dfaModule;
    NSLock *warningMessageLock;
}

+ (void)initialize;
- (id)init;
- (void)dealloc;
- (void)awakeFromNib;
- (void)setupToolbar;
- (void)windowDidLoad;
- (void)endWindowCloseWarn:(id)arg1 returnCode:(long long)arg2;
- (BOOL)windowShouldClose:(id)arg1;
- (void)windowIsClosing:(id)arg1;
- (void)loadModules;
- (void)configureModules:(id)arg1;
- (void)setupInfoPanel;
- (void)setupDiskListView;
- (void)setWindowTitleOnSelection:(id)arg1;
- (id)windowTitleForDocumentDisplayName:(id)arg1;
- (id)warnOnClose;
- (id)warnOnQuit;
- (id)warnOnSwitch;
- (BOOL)canPrint;
- (void)printModuleSpecific:(id)arg1;
- (void)forceUpdateWindow:(id)arg1;
- (void)notifyWindowOfEvent:(id)arg1 diskNotification:(id)arg2;
- (void)interfaceLockChanged:(id)arg1;
- (id)activeTabController;
- (id)activeDUModule;
- (void)tabView:(id)arg1 didSelectTabViewItem:(id)arg2;
- (void)endWindowSwitchWarn:(id)arg1 returnCode:(long long)arg2 contextInfo:(void *)arg3;
- (BOOL)tabView:(id)arg1 shouldSelectTabViewItem:(id)arg2;
- (double)splitView:(id)arg1 constrainMaxCoordinate:(double)arg2 ofSubviewAt:(long long)arg3;
- (double)splitView:(id)arg1 constrainMinCoordinate:(double)arg2 ofSubviewAt:(long long)arg3;
- (void)splitViewDidResizeSubviews:(id)arg1;
- (void)doneWaitingForDisks:(id)arg1;
- (void)fullListReceived:(id)arg1;
- (void)stuffChanged:(id)arg1;
- (id)disksContainSMARTErrors:(id)arg1;
- (id)listView;
- (id)listController;
- (void)helpButtonAction:(id)arg1;
- (void)updateModuleTabViews:(id)arg1;
- (BOOL)tabsUpdateOnSelection;
- (void)setTabsUpdateOnSelection:(BOOL)arg1;
- (void)dmToolDied:(id)arg1;
- (void)unselectAllDisks:(id)arg1;
- (void)reloadData;
- (id)disksStringForCount:(long long)arg1;
- (id)volumesStringForCount:(long long)arg1;
- (void)outlineViewSelectionDidChange:(id)arg1;
- (id)selectedDisks;
- (id)selectedVolumes;
- (id)selectedRAIDs;
- (id)allSelectedItems;
- (id)allSelectedItems:(BOOL)arg1 filterDuplicates:(BOOL)arg2;
- (id)globalProgressBar;
- (void)setGlobalProgressBarValue:(double)arg1;
- (void)setGlobalProgressBarIndeterminate:(BOOL)arg1;
- (void)startGlobalProgressBarAnimation:(id)arg1;
- (void)stopGlobalProgressBarAnimation:(id)arg1;
- (void)activateGlobalProgressBar:(BOOL)arg1;
- (void)activateGlobalProgressText:(BOOL)arg1;
- (void)setGlobalProgressText:(id)arg1;
- (void)setGlobalPersistentMessageText:(id)arg1;
- (void)setGlobalPersistentAttributedMessageText:(id)arg1;
- (BOOL)globalTextPersistent;
- (BOOL)selectedIsMountable;
- (BOOL)selectedIsOpenable;
- (void)handleContextualMenu:(id)arg1;
- (BOOL)validateMenuItem:(id)arg1;
- (BOOL)validateToolbarItem:(id)arg1;
- (id)toolbar:(id)arg1 itemForItemIdentifier:(id)arg2 willBeInsertedIntoToolbar:(BOOL)arg3;
- (id)toolbarDefaultItemIdentifiers:(id)arg1;
- (id)toolbarAllowedItemIdentifiers:(id)arg1;

@end

