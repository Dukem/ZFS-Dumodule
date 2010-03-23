//
//  ZViewController.m
//  ZFS
//
//  Created by Louis on 12/16/09.
//  Copyright 2009 underwood. All rights reserved.
//

#import "ZStatus.h"

////////////////////////////////////////////

#pragma mark ZCon
@implementation ZCon
@synthesize collection;
@synthesize zcollection;
  
#pragma mark IBActions
- (IBAction)driveOptions:(id)sender
{
	[self changeView:currentview view:other view2:optionsOther mainView:view];
}
- (IBAction)zfsOptions:(id)sender
{
	[self changeView:zfsCurrentView view:zother view2:zoptionsOther mainView:zview];
}
- (IBAction)newDrive:(id)sender
{
	[self changeView:currentview view:other view2:otherOther mainView:view];
}
- (IBAction)znewDrive:(id)sender
{
	[self changeView:zfsCurrentView view:zother view2:zotherOther mainView:zview];
}
- (IBAction)resetDrives:(id)sender
{
	[self updateDrives];
}
#pragma mark Removing & Creating
- (IBAction)remove:(id)sender
{
	[destroyDiskPanel makeKeyAndOrderFront:self];
}
- (IBAction)removeDriveAction:(id)sender
{
	[[DUZFS alloc] removeZPool:[self selection]];
	[destroyDiskPanel orderOut:self];
	[self updateDrives];
}
- (IBAction)removeZFS:(id)sender
{
	[destroyZFSPanel makeKeyAndOrderFront:self];
}
- (IBAction)removeZFSAction:(id)sender
{
	[[DUZFS alloc] removeZFS:[self zselection]];
	[destroyZFSPanel orderOut:self];
	[self updateDrives];
}
#pragma mark Exporting & Importing
- (IBAction)importZpoolAction:(id)sender
{
	NSOpenPanel* oPanel = [NSOpenPanel openPanel];
		
	[oPanel setCanChooseDirectories:YES];
	[oPanel setCanChooseFiles:NO];
	[oPanel setCanCreateDirectories:NO];
	[oPanel setAllowsMultipleSelection:NO];
	[oPanel setAlphaValue:0.95];
	[oPanel setTitle:@"Select the directory containing your images"];
	
	// Display the dialog.  If the OK button was pressed,
	// process the files.
	if ( [oPanel runModalForDirectory:nil file:nil types:nil]
							== NSOKButton )
	{
	
		NSString *directory = [[[oPanel URLs] objectAtIndex:0] path];
/*		
	NSLog(@"Examining %@ ...",directory);
	NSString *string = [[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zpool", @"import", @"-d", directory, nil] :self];
	NSRange range = [string rangeOfString:@"pool: "];
	NSRange range2 = [string rangeOfString:@"    id:"];
	NSString* substring = [string substringWithRange:NSMakeRange( (range.location + range.length), (range2.location - (range.location + range.length))) ];
//	pool: 
		NSLog(substring);
	 */

		[[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zpool", @"import", @"-a", @"-d", directory, nil] :self ];
	}
	[self updateDrives];
}
- (IBAction)exportZpoolAction:(id)sender
{
	[[DUZFS alloc] exportZPool:[self selection]];
	[self updateDrives];
}
#pragma mark Scrub
- (IBAction)scrubZpool:(id)sender
{
	if([[DUZFS alloc] scrubZPool:[self selection]])
	{
	[scrubText setStringValue:@"Retrieving Scrub Status..."];
	[scrubPanel makeKeyAndOrderFront:self];
	[scrubArray addObject:[self selection]];
	[scrubButton setEnabled:NO];
	[scrubClose setEnabled:NO];
	[scrubClose setTransparent:YES];
	
				Time = [ [NSTimer scheduledTimerWithTimeInterval: (1)
													  target:self
													selector:@selector(scrubStatus)	//go to this method whenever the time comes
													userInfo:nil
												   repeats:YES] retain];
		
	NSUserDefaults *spin = [NSUserDefaults standardUserDefaults];
	[spin setBool:1 forKey:@"Async"];
	[spin setBool:0 forKey:@"UIEnabled"];
	}
}
- (IBAction)scrubStatusAction:(id)sender
{
	[self scrubStatus];
}

- (void)scrubStatus
{
	NSString *string = [[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zpool", @"status", [self selection], nil] :self];
	NSRange range = [string rangeOfString:@"scrub: "];
	NSRange range2 = [string rangeOfString:@"config:"];
	NSString* substring = [string substringWithRange:NSMakeRange( (range.location + range.length), (range2.location - (range.location + range.length))) ];
	
	[scrubText setStringValue:substring];
	
	NSRange range3 = [substring rangeOfString:@"scrub completed"];
	if (range3.location != NSNotFound) 
	{
	[scrubButton setEnabled:YES];
	[scrubClose setTransparent:NO];
	[scrubClose setEnabled:YES];
	[scrubStop setEnabled:NO];
	[Time invalidate];
	NSUserDefaults *spin = [NSUserDefaults standardUserDefaults];
	[spin setBool:0 forKey:@"Async"];
	[spin setBool:1 forKey:@"UIEnabled"];
		
	}

}

- (IBAction)stopScrub:(id)sender
{
	NSString *string = [[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zpool", @"status", [self selection], nil] :self];
	NSRange range = [string rangeOfString:@"scrub: "];
	NSRange range2 = [string rangeOfString:@"config:"];
	NSString* substring = [string substringWithRange:NSMakeRange( (range.location + range.length), (range2.location - (range.location + range.length))) ];
	
	NSRange range3 = [substring rangeOfString:@"scrub completed"];
	if (range3.location != NSNotFound) 
	{
	NSUserDefaults *spin = [NSUserDefaults standardUserDefaults];
	[spin setBool:0 forKey:@"Async"];
	[spin setBool:1 forKey:@"UIEnabled"];
	}
	else {
		[[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zpool", @"scrub", @"-s", [scrubArray objectAtIndex:0], nil] :self];	
	}
}
#pragma mark ZPool
- (NSString *)selection
{
	NSMutableDictionary *pirateBook = [Pirates objectAtIndex:[[collectionView selectionIndexes] firstIndex]];
	return [pirateBook objectForKey:@"Name"];
}
- (NSString *)zselection
{
	NSMutableDictionary *pirateBook = [ZPirates objectAtIndex:[[zcollectionView selectionIndexes] firstIndex]];
	return [pirateBook objectForKey:@"Name"];
}
- (void)updateDrives
{	
//	NSMutableArray *Pirates = [[NSMutableArray alloc] initWithCapacity:0];
	[Pirates removeAllObjects];
	
	int index = [[arrayController arrangedObjects] count];
    while ( index > 0) {
	index--;
	[arrayController removeObjectAtArrangedObjectIndex:index];
	}
	int index2 = [[zArrayController arrangedObjects] count];
    while ( index2 > 0) {
	index2--;
	[zArrayController removeObjectAtArrangedObjectIndex:index2];
	}

//	Drives
	NSString *list = [[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zpool",@"list",@"-H",@"-o name",nil] :self];
	NSArray *D = [list componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSMutableArray *Drives = [[NSMutableArray alloc] init];
	[Drives addObjectsFromArray:D];
	[Drives removeLastObject];

//	Health
	NSString *Hlist = [[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zpool",@"list",@"-H",@"-o health",nil] :self];
	NSArray *H = [Hlist componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSMutableArray *Health = [[NSMutableArray alloc] init];
	[Health addObjectsFromArray:H];
	[Health removeLastObject];
//
//	Size
	NSString *Clist = [[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zpool",@"list",@"-H",@"-o size",nil] :self];
	NSArray *C = [Clist componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSMutableArray *Capacity = [[NSMutableArray alloc] init];
	[Capacity addObjectsFromArray:C];
	[Capacity removeLastObject];
//	
	NSUInteger indice;
	indice = 0;
	while ([Pirates count] < ([Drives count])) {
		
		[Pirates addObject: [NSMutableDictionary dictionaryWithObjectsAndKeys:
							[Drives objectAtIndex:indice], @"Name",  
							[Health objectAtIndex:indice], @"Health",
							[Capacity objectAtIndex:indice], @"Capacity",nil]];
		indice++;
	}	
	NSRange range = NSMakeRange(0, ([Drives count]));
	[arrayController insertObjects:Pirates atArrangedObjectIndexes:[NSIndexSet indexSetWithIndexesInRange:range]];
	
//  Update ZDrives
	NSString *Zlist = [[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zfs",@"list",@"-H",@"-o", @"name",nil] :self];
	NSArray *Z = [Zlist componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	NSMutableArray *ZDrives = [[NSMutableArray alloc] init];
	[ZDrives addObjectsFromArray:Z];
	[ZDrives removeLastObject];
//	
//	NSMutableArray *ZPirates = [[NSMutableArray alloc] initWithCapacity:0];
	NSUInteger zindice;
	zindice = 0;
	while ([ZPirates count] < ([ZDrives count])) {
		
		[ZPirates addObject: [NSMutableDictionary dictionaryWithObjectsAndKeys:
							[ZDrives objectAtIndex:zindice], @"Name", nil]];
		zindice++;
	}
	NSRange zrange = NSMakeRange(0, ([ZDrives count]));
	[zArrayController insertObjects:ZPirates atArrangedObjectIndexes:[NSIndexSet indexSetWithIndexesInRange:zrange]];

	[self zfsOptionsList];
}
#pragma mark Kext
- (BOOL)kextCheck
{
	NSString *Astring = [[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/kextstat", @"-l", @"-k", nil] :self];
	NSRange range = [Astring rangeOfString:@"com.apple.filesystems.zfs"];

	if (range.location != NSNotFound) 
		{
			[self kextUI:NO];
			[self updateDrives];
			[DULog log:@"Kext already loaded"];
			return YES;
		}
		else 
		{
			[self kextUI:YES];
			return NO;
		}

}
- (void)kextUI:(BOOL *)Answer
{
	
//	[arrayController insertObject: [NSDictionary dictionaryWithObjectsAndKeys:@"Zpool", @"Name",nil] atArrangedObjectIndex:index];
//	[zArrayController insertObject: [NSDictionary dictionaryWithObjectsAndKeys:@"ZPool", @"Name",nil] atArrangedObjectIndex:index];
//	[[DUZFS alloc] Overworked:@"Attention!":@"You must load the ZFS Kext to continue!"];

	if (Answer) {
//	[kextPanel makeKeyAndOrderFront:self];
	[kextText setStringValue:@"ZFS in Disk Utility, in order to work correctly, requires that you load the ZFS Kext. Without it loaded, nothing is operational."];
	[kextLoadButton setEnabled:YES];
	[kextLoadButton setTransparent:NO];
	NSUserDefaults *no = [NSUserDefaults standardUserDefaults];
	[no setBool:0 forKey:@"UIEnabled"];

	}
	else
	{
	[kextLoadButton setEnabled:NO];
	[kextLoadButton setTransparent:YES];
	[kextText setStringValue:@"ZFS in Disk Utility is currently in its pre-beta stage. Much is non-functional &/or deadly. Use with caution."];
	[destroyDiskPanel orderOut:self];
	NSUserDefaults *no = [NSUserDefaults standardUserDefaults];
	[no setBool:1 forKey:@"UIEnabled"];

	}
}

#pragma mark Other
- (void)awakeFromNib 
{
	[[NSUserDefaults standardUserDefaults] setBool:0 forKey:@"Async"];
//	kextIB = TRUE;

//  Initial views

	[view addSubview:other];
	[other setFrame:[view frame]];
	[zview addSubview:zother];
	[zother setFrame:[zview frame]];


	
	currentview = other;
	view = [other superview];
	zfsCurrentView = zother;
	zview = [zother superview];
//	
    collection = [[[NSMutableArray alloc] initWithCapacity:0] retain];
    zcollection = [[[NSMutableArray alloc] initWithCapacity:0] retain];
	Pirates = [[[NSMutableArray alloc] initWithCapacity:0] retain];
	ZPirates = [[[NSMutableArray alloc] initWithCapacity:0] retain];
	
//  NSCollectionView size.
	NSSize size = NSMakeSize([nscv contentSize].width, 71);
	[collectionView setMinItemSize:size];
	[collectionView setMaxItemSize:size];
	[collectionView setMaxNumberOfColumns:1];
	[zcollectionView setMinItemSize:size];
	[zcollectionView setMaxItemSize:size];
	[zcollectionView setMaxNumberOfColumns:1];

//  Clear background
	[collectionView	setBackgroundColors:[NSArray arrayWithObjects:[NSColor clearColor], [NSColor clearColor], nil]];							 
	[zcollectionView setBackgroundColors:[NSArray arrayWithObjects:[NSColor clearColor], [NSColor clearColor], nil]];							 
	
//	Selected
	[collectionView setSelectionIndexes:[NSIndexSet indexSet]];
	[zcollectionView setSelectionIndexes:[NSIndexSet indexSet]];
	 
//	Other
	NSPasteboard *pboard = [NSPasteboard pasteboardWithName:NSDragPboard];
	NSArray *pboardTypes = [pboard types];
	[newDiskTable registerForDraggedTypes:pboardTypes];
	[collectionView registerForDraggedTypes:[NSArray arrayWithObject:DiskInfoType]];
	
		NSUInteger Integer;
	Integer = 0;
		while([Pirates count] > (Integer - 1)) 
		{

		NSMutableDictionary *pirateBook = [Pirates objectAtIndex:([[collectionView selectionIndexes] firstIndex] + Integer)];
		NSString *string = [[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zpool", @"list", @"-H",[pirateBook objectForKey:@"Name"], nil]];
		NSRange range =	[string rangeOfString:@"cannot open"];
			if (range.location != NSNotFound) 
				{
//					[[DUZFS alloc] Overworked:@"" :@"" ];
				}
		
		}
	[self zfsOptionsList];
	[self kextCheck];
}
- (IBAction)zlistUpdate:(id)sender
{
	[self zfsOptionsList];
}
- (void)zfsOptionsList
{
//  A B
	NSString *B = [[NSBundle bundleForClass:[self class]] pathForResource:@"zfs" ofType:@"plist"];
	NSDictionary *zfs = [[NSDictionary alloc] initWithContentsOfFile:B];
	
	NSEnumerator *Enu = [zfs keyEnumerator];
	NSEnumerator *Eni = [zfs keyEnumerator];
	id value;
//	I
	int Integer;
	Integer = 0;
	int Integi;
	Integi = 0;
	id O;
/*		
	NSArray *pirateBook = [Pirates objectsAtIndexes:[collectionView selectionIndexes]];
	
	while (value = [enu nextObject]) 
	{
		NSString *s = [[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zfs", @"get", @"-H", @"-o", @"value", v, nil] :self ]
	}
*/	
//	D F H v E
	
	NSArray *Drives = [[ZList titleOfSelectedItem] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSString *CurrentDrive;
	CurrentDrive = [Drives objectAtIndex:0];
if (CurrentDrive != nil) 
{
	

	NSMutableArray *CurrentValues = [[NSMutableArray alloc] init];
	id v;
	NSMutableDictionary *variables = [[NSMutableDictionary alloc] initWithCapacity:0];
		NSEnumerator *key = [zfs keyEnumerator];
		while (value = [key nextObject]) 
		{
			NSMutableString *string = [NSMutableString stringWithString:[zfs valueForKey:value]];
			[string insertString:@"=" atIndex:0];
			[string insertString:value atIndex:0];
			NSString *Q = [[DUZFS alloc] ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zfs", @"get", @"-H", value, CurrentDrive, nil] :self];
			NSArray *array = [Q componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
			[variables setValue:[array objectAtIndex:2] forKey:value];
		}
		while (O = [Enu nextObject]) 
	{
		value = [zfs objectForKey:O];
		v = [variables objectForKey:O];
		NSPopUpButton *C = [zfsMatrix cellAtRow:Integer column:Integi];
		[C removeAllItems];
		NSRange range = [value rangeOfString:v];
		if (range.location == NSNotFound) 
		{
		CurrentValues =	[NSMutableArray arrayWithArray:[value componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
			[CurrentValues insertObject:v atIndex:0];
		}
		else 
		{
			CurrentValues =	[NSMutableArray arrayWithArray:[value componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
//			[CurrentValues exchangeObjectAtIndex:0 withObjectAtIndex:[CurrentValues indexOfObject:v]];
		}
			if ([v isEqualToString:@"<size>"]) {

}
		[C addItemsWithTitles:CurrentValues];
				[C selectItemWithTitle:v];
		Integer++;
		 if (Integer == 11);
		 {
			 Integer = 0;
			 Integi++;
		 }
	}

	
	
	Integer = 0;
	Integi = 0;

	while (value = [Eni nextObject]) {
		
		NSPopUpButton *C = [zfsTextMatrix cellAtRow:Integer column:Integi];
		[C setStringValue:value];
		Integer++;
		 if (Integer == 11);
		 {
			 Integer = 0;
			 Integi++;
		 }
	}
}
	
}
- (IBAction)zfsOptionsApply:(id)sender
{
	
	NSString *B = [[NSBundle bundleForClass:[self class]] pathForResource:@"zfs" ofType:@"plist"];
	NSDictionary *A = [[NSDictionary alloc] initWithContentsOfFile:B];
	
	NSEnumerator *Enu = [A keyEnumerator];
	id value;
	int Integer;
	Integer = 0;
	int Integi;
	Integi = 0;
	NSMutableDictionary *E = [[NSMutableDictionary alloc] init];
	while (value = [Enu nextObject]) 
	{		
		NSPopUpButton *C = [zfsMatrix cellAtRow:Integer column:Integi];
		[E setObject:[C titleOfSelectedItem] forKey:value];
		Integer++;
		
		 if (Integer == 11);
		 {
			 Integer = 0;
			 Integi++;
		 }
	}
	 
	NSArray *D = [[ZList titleOfSelectedItem] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSString *F = [D objectAtIndex:0];
/*
	NSMutableArray *array = [[NSMutableArray alloc] init];
	NSMutableString *string = [[NSMutableString alloc] init];
		while (value = [[E keyEnumerator] nextObject]) 
		{
			[string setString:[E valueForKey:value]];
			
			if ([string isEqualToString:@"<size>"]) 
			{
				
			if ([value isEqualToString: @"volsize"]) 
				{
					[array addObject:@"volsize"];
				}
			if ([value isEqualToString: @"reservation"]) 
				{
					[array addObject:@"reservation"];
				}
					 
			if ([value isEqualToString: @"recordsize"]) 
				{
					[array addObject:@"recordsize"];
				}
					 
			if ([value isEqualToString: @"quota"]) 
				{
					[array addObject:@"quota"];
				}
			}
			
			
			if ([[E valueForKey:value] isEqualToString:@"<path>"]) 
			{
				[array addObject:@"mountpoint"];
			}
		}
*/	
	[self optionsApply:E Drive:F];
	
}
- (NSDictionary *)optionsInput:(NSArray *)Array
{


}
- (void)optionsApply:(NSMutableDictionary *)A Drive:(NSString *)C
{
	[zfsStatus setUsesThreadedAnimation:YES];
	[zfsStatus startAnimation:self];
	NSEnumerator *Enu = [A keyEnumerator];
	DUZFS *B = [DUZFS alloc];
	id value;
	NSMutableString *string = [[NSMutableString alloc] init];
		while (value = [Enu nextObject]) 
		{
			[string setString:[A valueForKey:value]];
			
			if ([string isEqualToString:@"<size>"]) 
			{
/*
				if (![value isEqualToString:@"recordsize"]) 
				{
					[sizePanel makeKeyAndOrderFront:self];

					while ([sizePanel isKeyWindow]) 
					{
						
					}
					[ZSize setEnabled:NO];
					[string setString:[sizeText stringValue]];
					[string appendString:@"K"];
					[sizeText setString:@""];
				}
				else {
					[sizePanel makeKeyAndOrderFront:self];
					while ([sizePanel isKeyWindow]) 
					{
						
					}
					[string setString:[sizeText stringValue]];
					[string appendString:[[ZSize titleOfSelectedItem] substringToIndex:1]];
					[sizeText setString:@""];
				}
*/
			}
			else if ([[A valueForKey:value] isEqualToString:@"<path>"]) 
			{
				
			}
			else 
			{
				


			[string insertString:@"=" atIndex:0];
			[string insertString:value atIndex:0];
			NSString *D = [B ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zfs", @"get", @"-H", value, C, nil] :self];
			NSRange range = [string rangeOfString:[A valueForKey:value]];
	
			if (range.location != NSNotFound) 
			{
			[B ZFSCommand:[NSArray arrayWithObjects:@"/usr/sbin/zfs", @"set", string, C, nil] :self];
			}
			}
		}
	[self zfsOptionsList];
	[zfsStatus stopAnimation:self];
}
- (void)dealloc
{
	[Pirates release];
	[collection release];
	[zcollection release];
	[ZPirates release];
	[scrubArray release];
	[Time release];
	[currentview release];
	[zfsCurrentView release];
	[super release];
	[super dealloc];
}
#pragma mark View
- (void)changeView:(NSView *)damn view:(NSView *)no view2:(NSView *)no2 mainView:(NSView *)cview
{
//  Damn = currentView/zfsCurrentView
//  No = other/zother
//  No2 = otherOther/zoptionsOther/zotherOther
//  cview = view/zview

	if (damn == no) {
	headache = no2;
	}
	else {
	headache = no;
	}
	if (damn != nil) {
	[[cview animator] replaceSubview:damn with:headache];
	}
	else {
	[cview addSubview:headache];
	}
	[headache setFrame:[cview frame]];
	if (damn == currentview) 
	{
		currentview = headache;
	}
	else
	{
		zfsCurrentView = headache;
	}
}
@end

////////////////////////////////////////////

#pragma mark ZItem
@implementation ZItem
-(id)copyWithZone:(NSZone *)zone 
{
	id result = [super copyWithZone:zone];
	[NSBundle loadNibNamed:@"collectionView" owner:result];

	return result;
}
- (void)setSelected:(BOOL)flag 
{
	[super setSelected:	flag];

	NSBox *view	= (NSBox*) [self view];
	NSColor *color;
	NSColor *lineColor;

	if (flag) {
		color		= [NSColor selectedControlColor];
		lineColor	= [NSColor blackColor];
	} else {
		color		= [NSColor colorWithCalibratedWhite:0 alpha:0];
		lineColor	= [NSColor controlBackgroundColor];
	}

	[view setBorderColor:lineColor];
	[view setFillColor:color];
}
- (void) awakeFromNib 
{
	NSBox *view	= (NSBox*) [self view];
	[view setTitlePosition:NSNoTitle];
	[view setBoxType:NSBoxCustom];
	[view setCornerRadius:1];
	[view setBorderType:nil];
	[view setTransparent:NO];
}
@end
////////////////////////////////////////////

#pragma mark ZView
@implementation ZView
-(void)awakeFromNib
{
	[self registerForDraggedTypes:[NSArray arrayWithObject:DiskInfoType]];
}
-(unsigned int)draggingEntered:(id < NSDraggingInfo >)sender
{
	return 1;
}
- (void)draggingExited:(id < NSDraggingInfo >)sender
{
}
- (NSDragOperation)draggingUpdated:(id < NSDraggingInfo >)sender
{
	return 1;
}
- (BOOL)performDragOperation:(id < NSDraggingInfo >)sender
{	
	NSPasteboard *pboard;
    NSDragOperation sourceDragMask;
 
    sourceDragMask = [sender draggingSourceOperationMask];
    pboard = [sender draggingPasteboard];
        NSArray *array = [pboard propertyListForType:DiskInfoType];
	NSLog(@"%@",array);
    return YES;
}
- (void)concludeDragOperation:(id < NSDraggingInfo >)sender
{
	NSLog(@"concludeDragOperation!");
}
-(BOOL)prepareForDragOperation:(id < NSDraggingInfo >)sender
{
	NSLog(@"prepareForDragOperation!");
	return YES;
}
@end