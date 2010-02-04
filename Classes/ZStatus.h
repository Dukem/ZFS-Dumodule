//
//  ZViewController.h
//  ZFS
//
//  Created by Louis Jencka on 12/16/09.
//  Copyright 2009 underwood. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ZStatus.h"
#import "DUZFS.h"
#include <math.h>
#include "QuartzCore/CoreAnimation.h"

@interface ZCon : NSObject {
	IBOutlet NSCollectionView *collectionView;
	IBOutlet NSCollectionView *zcollectionView;
	IBOutlet NSArrayController *arrayController;
	IBOutlet NSArrayController *zArrayController;
	IBOutlet NSObjectController *ZDrive;
	IBOutlet NSPopUpButton *ZList;
	IBOutlet NSPopUpButton *ZSize;
	IBOutlet NSScrollView *nscv;
	IBOutlet NSPanel *kextPanel;
	IBOutlet NSPanel *destroyDiskPanel;
	IBOutlet NSPanel *destroyZFSPanel;
	IBOutlet NSPanel *scrubPanel;
	IBOutlet NSPanel *sizePanel;
	IBOutlet NSButton *kextLoadButton;
	IBOutlet NSButton *scrubButton;
	IBOutlet NSButton *scrubClose;
	IBOutlet NSButton *scrubStop;
	IBOutlet NSTextField *kextText;
	IBOutlet NSTextField *scrubText;
	IBOutlet NSTextField *zfsOptionsText;
	IBOutlet NSTextField *zpoolOptionsText;
	IBOutlet NSTextField *sizeText;
	IBOutlet NSTableView *newDiskTable;
	IBOutlet NSView *view;
	IBOutlet NSView *other;
	IBOutlet NSView *otherOther;
	IBOutlet NSView *optionsOther;
	IBOutlet NSView *zview;
	IBOutlet NSView *zother;
	IBOutlet NSView *zotherOther;
	IBOutlet NSView *zoptionsOther;
	IBOutlet NSMatrix *zfsMatrix;
	IBOutlet NSMatrix *zfsTextMatrix;
	IBOutlet NSProgressIndicator *zfsStatus;
	NSMutableArray *collection;
	NSMutableArray *zcollection;
	NSMutableArray *Pirates;
	NSMutableArray *ZPirates;
	NSMutableArray *scrubArray;
	NSTimer *Time;
	NSView *currentview;
	NSView *zfsCurrentView;
	NSView *headache;
	NSMatrix *zfsSettings;
	
	id *options;
	id *drives;
}
- (IBAction)resetDrives:(id)sender;
- (IBAction)driveOptions:(id)sender;
- (IBAction)zfsOptions:(id)sender;
- (IBAction)zfsOptionsApply:(id)sender;
- (IBAction)newDrive:(id)sender;
- (IBAction)znewDrive:(id)sender;
- (IBAction)remove:(id)sender;
- (IBAction)removeDriveAction:(id)sender;
- (IBAction)removeZFS:(id)sender;
- (IBAction)removeZFSAction:(id)sender;
- (IBAction)importZpoolAction:(id)sender;
- (IBAction)exportZpoolAction:(id)sender;
- (IBAction)scrubZpool:(id)sender;
- (IBAction)scrubStatusAction:(id)sender;
- (IBAction)zlistUpdate:(id)sender;
- (BOOL)kextCheck;
- (void)changeView:(NSView *)damn view:(NSView *)no view2:(NSView *)no2 mainView:(NSView *)cview;
- (void)kextUI:(BOOL *)Answer;
- (void)updateDrives;
- (void)awakeFromNib;
- (void)scrubStatus;
- (void)zfsOptionsList;
- (NSString *)selection;

@property (nonatomic, retain) NSArray* collection;
@property (nonatomic, retain) NSArray* zcollection;

@end
////////////////////////////////////////////

@interface ZItem : NSCollectionViewItem
{
	IBOutlet NSTextField *Name;
	IBOutlet NSTextField *Health;
	IBOutlet NSTextField *Capacity;
	IBOutlet NSTextField *Used;

}
-(IBAction)kextLoad:(id)sender;
-(id)copyWithZone:(NSZone *)zone;

@end
////////////////////////////////////////////
#import "DUOutlineView.h"
@interface ZView : NSOutlineView {

    id dragDelegate;
}
- (unsigned int)draggingEntered:(id < NSDraggingInfo >)sender;
- (void)draggingExited:(id < NSDraggingInfo >)sender;
- (BOOL)prepareForDragOperation:(id < NSDraggingInfo >)sender;
- (BOOL)performDragOperation:(id < NSDraggingInfo >)sender;
- (void)concludeDragOperation:(id < NSDraggingInfo >)sender;
- (NSDragOperation)draggingUpdated:(id < NSDraggingInfo >)sender;
- (id)dragDelegate;
- (void)setDragDelegate:(id < NSDraggingInfo >)sender;

@end

@end
