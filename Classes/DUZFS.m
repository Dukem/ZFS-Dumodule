//
//  DUZFS.m
//  ZFS
//
//  Created by Louis on 12/10/09.
//  Copyright 2009 underwood. All rights reserved.
/* 
 I've gotten these headers using a class-dump on the DUSupport.framework inside
 Disk Utility. Here're the calls that Disk Utility currently makes;
 
 1 [DUZFS init];
 2 [DUZFS dataType];
 3 [DUZFS tabOrder];
 4 [DUZFS tabOrder];
 5 [DUZFS tabOrder];
 6 [DUZFS displayName];
 7 [DUZFS displayName];
 8 [DUZFS registerForNotifications];
 9 [DUZFS displayPanelForDiskType]; When disk is selected.

 In the included DUSupport there are many headers, most of which are unnecessary. There are,
 however, some zfs headers for the now extinct ZFS support. Perhaps they could be of some
 use. Most of the headers have erroneous #imports.
*/



#import "DUZFS.h"
@implementation DUZFS

#pragma mark Essential
-(id)init
{
//  [super init] causes a loop of despair.
//  Must init other classes in xib.
	[[ZFSSparkle alloc] init];
	[[ZCon alloc] init];
	[[ZView alloc] init];
	[[ZItem alloc] init];	
	
//  Load xib.
	BOOL BUNDLE = [NSBundle loadNibNamed:@"ZFS" owner:self ];
	if (!BUNDLE) {
		[DULog log:@"ZFS Nib not loading. Will not load ZFS.dumodule"];
		[self Overworked:@"ZFS could not load.":@"ZFS could not load the nib. 'ZFS.DUModule' will not load."];
		[ZFSSparkle release];
		[ZCon release];
		[ZView release];
		[ZItem release];
		[self dealloc];
		return nil;
	}
	if (![[[NSFileManager alloc] init] fileExistsAtPath:@"/usr/sbin/zpool"]) {
		[self Overworked:@"ZFS.kext could not be found.":@"Please download & install the ZFS command line tools from 'https://groups.google.com/group/zfs-macos/files'. 'ZFS.DUModule' will not load."];
//				[[NSBundle bundleForClass:[self class]] unload];
		 return nil;
	}
	else {
//[[DUProgressWindowController alloc] beginProgressWithMessage:@"Hello" withInformationText:@"Hello" allowCancel:0 cancelButtonTitle:nil allowSkip:0 skipButtonTitle:nil usingDelegate:self andCancelSelector:nil andSkipSelector:nil andContext:@"Hello"];

		return self;
	}

	return nil;
} 
-(void)awakeFromNib
{

	[self setWindowController:self];
    [outlineView registerForDraggedTypes:[NSArray arrayWithObject:AbstractTreeNodeType]];
	[outlineView registerForDraggedTypes:[NSArray arrayWithObject:DiskInfoType]];

	NSManagedObjectContext *context = [self managedObjectContext];
	NSManagedObject        *instrument  = nil;
	instrument = [NSEntityDescription insertNewObjectForEntityForName:@"Outline"
                  inManagedObjectContext: context];
	[instrument setValue:[NSString stringWithString:@"ZPool"] forKey: @"name"];	
	[instrument setValue:[[[NSImage alloc] init] initWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"VolumeIcon" ofType:@"icns"]] forKey: @"image"];	

}

-(id)dataType
{
//  Unknown Function. Requires NSString.
	return @"ZFS";
}
-(BOOL)shouldRunOnThisConfig
{
//	Return one or doesn't load.
	return 1;
}
-(id)displayName
{
//  Displayed Name
	return @"ZFS";
}
-(id)tabOrder
{
// Any number above 0 will do
	return [NSNumber numberWithInteger:100 ];
}
-(BOOL)displayPanelForDiskType:(int)arg1 andDisk:(id)arg2
{
// Might as well leave it as yes.
	return YES;
}
-(BOOL)supportsContextMenuForDiskType:(int)arg1 selectedDisk:(id)arg2
{
	return YES;
}
#pragma mark Called
-(void)registerForNotifications
{	
	
	NSNotificationCenter *NC = [NSNotificationCenter defaultCenter];
//  For seeing all notifications.
//	[NC addObserver:self selector:@selector(log:) name:nil object:nil];
	[NC addObserver:(id)self selector:@selector(loadNib	:) name:@"Current Tab" object:NULL];
}
#pragma mark Debug
-(void)log:(NSNotificationCenter *)note {
NSLog(@"note = %@", note);
}
-(void)Overworked:(NSString *)Header :(NSString *)Body
{
//	Quick notifications.
		NSError *theError = [NSError errorWithDomain:@"" code:1 userInfo:nil];
		NSAlert *theAlert = [NSAlert alertWithError:theError];
		[theAlert setInformativeText:Body];
		[theAlert setMessageText:Header];
		[theAlert setIcon:nil];
		[theAlert setShowsSuppressionButton:0];
		[theAlert runModal];
}



#pragma mark Sparkle
-(SUUpdater *)updater {
    return [SUUpdater updaterForBundle:[NSBundle bundleForClass:[self class]]];
}

#pragma mark Cocoa
 
-(IBAction)loadKextAction:(id)sender
{
	[self loadKext];
	
	
}
#pragma mark Z Command Line

-(void)loadKext
{
	/*
	NSString *helperToolPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/../PlugIns/ZFS.dumodule/Contents/Resources/ZTool"];
	NSArray *args = [NSArray arrayWithObjects:helperToolPath, @"loadKext", nil];
	NSTask *Task = [NSTask launchedTaskWithLaunchPath:helperToolPath arguments:args];
	[Task waitUntilExit];
	*/
					
	[DULog log:@"Loading Kext"];
	char *string[] = {"/System/Library/Extensions/zfs.kext", NULL};
	BOOL kext = [self authorizedTask:string tool:"/sbin/kextload" array2:nil tool2:nil];
	if (kext == YES) 
	{
		
		[DULog log:@"Kext Loaded"];
		NSLog(@"Kext Loaded");
		sleep(3);
		if (![[ZCon alloc] kextCheck]) {
		[self Overworked:@"ZFS has loaded the kext.":@"At this time you may have to quit and re-open Disk Utility for ZFS to work."];
		}
		else
		{
			[[ZCon alloc]kextUI:NO];
		[self Overworked:@"ZFS has loaded the kext.":@"At this time you may have to quit and re-open Disk Utility for ZFS to work."];
		}
	}
	else 
	{
		[self Overworked:@"ZFS could not load.":@"ZFS could not load the kext. ZFS will now unload."];
		// unload?
	}

}
-(NSString *)ZFSCommand:(NSArray *)Array :(id)sender
{	
	NSTask *task = [[NSTask alloc] init];
	NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    [task setStandardError: [task standardOutput]];
    // The path to the binary is the first argument that was passed in
    [task setLaunchPath: [Array objectAtIndex:0]];
    // The rest of the task arguments are just grabbed from the array
    [task setArguments: [Array subarrayWithRange: NSMakeRange (1, ([Array count] - 1))]];

	NSFileHandle *file = [pipe fileHandleForReading];
   [task launch];

    NSData *data = [file readDataToEndOfFile];

    NSString *string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
	return string;
}
-(BOOL)authorizedTask:(id *)array tool:(id *)myToolPath array2:(id *)array2 tool2:(id *)myToolPath2
{
		OSStatus myStatus;
		AuthorizationFlags myFlags = kAuthorizationFlagDefaults;
		AuthorizationRef myAuthorizationRef;

		myStatus = AuthorizationCreate(NULL, kAuthorizationEmptyEnvironment, myFlags, &myAuthorizationRef);
		if (myStatus != errAuthorizationSuccess)
			return myStatus;

		AuthorizationItem myItems = {kAuthorizationRightExecute, 0, NULL, 0};
		AuthorizationRights myRights = {1, &myItems};
		myFlags = kAuthorizationFlagDefaults |
			kAuthorizationFlagInteractionAllowed |
			kAuthorizationFlagPreAuthorize |
			kAuthorizationFlagExtendRights;

		NSLog(@"Asking for permission...");

		myStatus = AuthorizationCopyRights (myAuthorizationRef, &myRights, NULL, myFlags, NULL );
		if (myStatus != errAuthorizationSuccess)
		{
			return 0;
		}
/*
	NSUInteger Integer;
	Integer = 0;
	NSMutableString *String;
	while (Integer < [array count]) 
	{
		[String appendString:[array objectAtIndex:Integer]];
		Integer++;
	}
*/
// const char* cString = [String cStringUsingEncoding:NSASCIIStringEncoding];

		FILE *myCommunicationsPipe = NULL;
		
		myFlags = kAuthorizationFlagDefaults;

		myStatus = AuthorizationExecuteWithPrivileges(myAuthorizationRef, myToolPath, myFlags, array, &myCommunicationsPipe);

	if (array2 != nil) 
	{
		myStatus = AuthorizationExecuteWithPrivileges(myAuthorizationRef, myToolPath2, myFlags, array2, &myCommunicationsPipe);

}
	return 1;
}
/*
-(void)eraseDisk:(id)disk
{
    [[DUNamer alloc] name:1 ];
	id result_19 = [self safeName];
	__strong const char * result_29 = [[fp8 diskIdentifier] UTF8String];
	du_log()
	id result_46 = [[formatTypeMenu selectedItem] representedObject];
	[self setRunType:1 ];
	NSBundle * result_64 = [NSBundle bundleForClass:[self class] ];
	NSString * result_73 = [result_64 localizedStringForKey:@"Preparing to erase" value:@"" table:nil ];
	[self logHeader:fp8 msg:result_73 withFS:result_46 withName:result_19 withMap:-2 withType:1 withOptions:0 ];
	[self newEraseDiskDelegate];
	UNKNOWN_RES_TYPE result_108 = [ed eraseDisk:[fp8 theDMDisk] format:result_46 name:result_19 synchronous:0 ];	
	
}
 */
#pragma mark ZPool
- (void)removeZPool:(NSString *)zpool
{
	NSLog(@"Destroying %@", zpool);
	char *string = [zpool UTF8String];
	char *argh[] = {"umount", "force", string, NULL};
	char *arghh[] = {"destroy", string, NULL};
	BOOL A = [self authorizedTask:argh tool:"/usr/sbin/diskutil" array2:arghh tool2:"/usr/sbin/zpool"]; 

//	[[DUZFS alloc] authorizedTask:[NSArray arrayWithObjects:@"/usr/sbin/zpool", @"destroy", [pirateBook objectForKey:@"Name"], nil]]; 
/*
NSMutableDictionary *pirateBook = [Pirates objectAtIndex:([[collectionView selectionIndexes] count] - 1)];
	NSLog(@"Destroying %@", [pirateBook objectForKey:@"Name"]);
	NSString *String
	[String appendString:
	[[DUZFS alloc] ZTool:[NSArray arrayWithObjects:@"/usr/sbin/diskutil", @"umount", @"force", [pirateBook objectForKey:@"Name"], nil]]; 
	
 */
}
- (void)removeZFS:(NSString *)zfs
{
	NSLog(@"Destroying %@", zfs);
	char *string = [zfs UTF8String];
	char *arghh[] = {"destroy", string, NULL};
	BOOL A = [self authorizedTask:nil tool:nil array2:arghh tool2:"/usr/sbin/zfs"]; 

//	[[DUZFS alloc] authorizedTask:[NSArray arrayWithObjects:@"/usr/sbin/zpool", @"destroy", [pirateBook objectForKey:@"Name"], nil]]; 
/*
NSMutableDictionary *pirateBook = [Pirates objectAtIndex:([[collectionView selectionIndexes] count] - 1)];
	NSLog(@"Destroying %@", [pirateBook objectForKey:@"Name"]);
	NSString *String
	[String appendString:
	[[DUZFS alloc] ZTool:[NSArray arrayWithObjects:@"/usr/sbin/diskutil", @"umount", @"force", [pirateBook objectForKey:@"Name"], nil]]; 
	
 */
}
- (void)addZPool:(NSString *)zpool
{	
	NSMutableString *log = [[NSMutableString alloc] init];
	[log setString:@"Creating "];
	[log appendString:zpool];
	[DULog log:log];
	
	char *string = [zpool UTF8String];
	char *argh[] = {"umount", "force", string, NULL};
	char *arghh[] = {"destroy", string, NULL};
	BOOL A = [self authorizedTask:argh tool:"/usr/sbin/diskutil" array2:arghh tool2:"/usr/sbin/zpool"]; 


}
- (BOOL *)scrubZPool:(NSString *)zpool
{	
	NSMutableString *log = [[NSMutableString alloc] init];
	[log setString:@"Scrubbing "];
	[log appendString:zpool];
	[DULog log:log];
	
	char *string = [zpool UTF8String];
	char *arghh[] = {"scrub", string, NULL};

	if(![self authorizedTask:arghh tool:"/usr/sbin/zpool" array2:nil tool2:nil])
	{
		return NO;	
		
	}


}
- (void)exportZPool:(NSString *)zpool
{	
	NSMutableString *log = [[NSMutableString alloc] init];
	[log setString:@"Exporting "];
	[log appendString:zpool];
	[DULog log:log];
	
	char *string = [zpool UTF8String];
	char *argh[] = {"umount", "force", string, NULL};
	char *arghh[] = {"export", string, NULL};

		[self authorizedTask:argh tool:"/usr/sbin/diskutil" array2:arghh tool2:"/usr/sbin/zpool"]; 
}
- (void)importZPool
{	

}
#pragma mark ZFS
- (void)removeZFS
{
	ZCon *ZC = [ZCon alloc];
	NSLog(@"Destroying %@", [ZC selection]);
	char *string = [[ZC selection] UTF8String];
	char *argh[] = {"umount", "force", string, NULL};
	char *arghh[] = {"destroy", string, NULL};
	BOOL A = [self authorizedTask:argh tool:"/usr/sbin/diskutil" array2:arghh tool2:"/usr/sbin/zpool"]; 

	[ZC updateDrives];
//	[[DUZFS alloc] authorizedTask:[NSArray arrayWithObjects:@"/usr/sbin/zpool", @"destroy", [pirateBook objectForKey:@"Name"], nil]]; 
/*
NSMutableDictionary *pirateBook = [Pirates objectAtIndex:([[collectionView selectionIndexes] count] - 1)];
	NSLog(@"Destroying %@", [pirateBook objectForKey:@"Name"]);
	NSString *String
	[String appendString:
	[[DUZFS alloc] ZTool:[NSArray arrayWithObjects:@"/usr/sbin/diskutil", @"umount", @"force", [pirateBook objectForKey:@"Name"], nil]]; 
	
 */
}

#pragma mark CoreZFS
@synthesize window;

/**
    Returns the support directory for the application, used to store the Core Data
    store file.  This code uses a directory named "Untitled" for
    the content, either in the NSApplicationSupportDirectory location or (if the
    former cannot be found), the system's temporary directory.
 */

- (NSString *)applicationSupportDirectory {

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : NSTemporaryDirectory();
    return [basePath stringByAppendingPathComponent:@"ZFS"];
}


/**
    Creates, retains, and returns the managed object model for the application 
    by merging all of the models found in the application bundle.
 */
 
- (NSManagedObjectModel *)managedObjectModel {

    if (managedObjectModel) return managedObjectModel;
	
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:[NSBundle bundleForClass:[self class]]]] retain];    
    return managedObjectModel;
						  
}


/**
    Returns the persistent store coordinator for the application.  This 
    implementation will create and return a coordinator, having added the 
    store for the application to it.  (The directory for the store is created, 
    if necessary.)
 */

- (NSPersistentStoreCoordinator *) persistentStoreCoordinator {

    if (persistentStoreCoordinator) return persistentStoreCoordinator;

    NSManagedObjectModel *mom = [self managedObjectModel];
    if (!mom) {
        NSAssert(NO, @"Managed object model is nil");
        NSLog(@"%@:%s No model to generate a store from", [self class], _cmd);
        return nil;
    }

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *applicationSupportDirectory = [self applicationSupportDirectory];
    NSError *error = nil;
    
    if ( ![fileManager fileExistsAtPath:applicationSupportDirectory isDirectory:NULL] ) {
		if (![fileManager createDirectoryAtPath:applicationSupportDirectory withIntermediateDirectories:NO attributes:nil error:&error]) {
            NSAssert(NO, ([NSString stringWithFormat:@"Failed to create App Support directory %@ : %@", applicationSupportDirectory,error]));
            NSLog(@"Error creating application support directory at %@ : %@",applicationSupportDirectory,error);
            return nil;
		}
    }
    
    NSURL *url = [NSURL fileURLWithPath: [applicationSupportDirectory stringByAppendingPathComponent: @"zfs.binary"]];
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: mom];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSBinaryStoreType 
                                                configuration:nil 
                                                URL:url 
                                                options:nil 
                                                error:&error]){
        [[NSApplication sharedApplication] presentError:error];
        [persistentStoreCoordinator release], persistentStoreCoordinator = nil;
        return nil;
    }    

    return persistentStoreCoordinator;
}

/**
    Returns the managed object context for the application (which is already
    bound to the persistent store coordinator for the application.) 
 */
 
- (NSManagedObjectContext *) managedObjectContext {

    if (managedObjectContext) return managedObjectContext;

    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:@"Failed to initialize the store" forKey:NSLocalizedDescriptionKey];
        [dict setValue:@"There was an error building up the data file." forKey:NSLocalizedFailureReasonErrorKey];
        NSError *error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        [[NSApplication sharedApplication] presentError:error];
        return nil;
    }
    managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator: coordinator];

    return managedObjectContext;
}

/**
    Returns the NSUndoManager for the application.  In this case, the manager
    returned is that of the managed object context for the application.
 */
 
- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window {
    return [[self managedObjectContext] undoManager];
}


/**
    Performs the save action for the application, which is to send the save:
    message to the application's managed object context.  Any encountered errors
    are presented to the user.
 */
 
- (IBAction) saveAction:(id)sender {

    NSError *error = nil;
    
    if (![[self managedObjectContext] commitEditing]) {
        NSLog(@"%@:%s unable to commit editing before saving", [self class], _cmd);
    }

    if (![[self managedObjectContext] save:&error]) {
        [[NSApplication sharedApplication] presentError:error];
    }
}


/**
    Implementation of the applicationShouldTerminate: method, used here to
    handle the saving of changes in the application managed object context
    before the application terminates.
 */
 
- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {

    if (!managedObjectContext) return NSTerminateNow;

    if (![managedObjectContext commitEditing]) {
        NSLog(@"%@:%s unable to commit editing to terminate", [self class], _cmd);
        return NSTerminateCancel;
    }

    if (![managedObjectContext hasChanges]) return NSTerminateNow;

    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
    
        // This error handling simply presents error information in a panel with an 
        // "Ok" button, which does not include any attempt at error recovery (meaning, 
        // attempting to fix the error.)  As a result, this implementation will 
        // present the information to the user and then follow up with a panel asking 
        // if the user wishes to "Quit Anyway", without saving the changes.

        // Typically, this process should be altered to include application-specific 
        // recovery steps.  
                
        BOOL result = [sender presentError:error];
        if (result) return NSTerminateCancel;

        NSString *question = NSLocalizedString(@"Could not save changes while quitting.  Quit anyway?", @"Quit without saves error question message");
        NSString *info = NSLocalizedString(@"Quitting now will lose any changes you have made since the last successful save", @"Quit without saves error question info");
        NSString *quitButton = NSLocalizedString(@"Quit anyway", @"Quit anyway button title");
        NSString *cancelButton = NSLocalizedString(@"Cancel", @"Cancel button title");
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:question];
        [alert setInformativeText:info];
        [alert addButtonWithTitle:quitButton];
        [alert addButtonWithTitle:cancelButton];

        NSInteger answer = [alert runModal];
        [alert release];
        alert = nil;
        
        if (answer == NSAlertAlternateReturn) return NSTerminateCancel;

    }

    return NSTerminateNow;
}

-(void)dealloc
{
	[super dealloc];
}

#pragma mark Code Added for AbstractTree Drag and Drop
/*
    The application has a single window and is not document-based. Closing the (only) window will
    result in the application terminating.
*/

/*
    Up to this point, the code in this file is generated when you select an Xcode project 
    of type Cocoa Core Data Application. The methods below are implemented to support 
    drag and drop. For general information on drag and drop in Cocoa, go to 
    http://developer.apple.com/documentation/Cocoa/Conceptual/DragandDrop/DragandDrop.html
    Outline views have their own API for drag and drop within the NSOutlineViewDataSource
    informal protocol. Reference for that protocol can be found at
    http://developer.apple.com/documentation/Cocoa/Reference/ApplicationKit/Protocols/NSOutlineViewDataSource_Protocol/Reference/Reference.html
*/

// Declare a string constant for the drag type - to be used when writing and retrieving pasteboard data...

/*
    Run time setup.
*/
/*
    Beginning the drag from the outline view.
*/
- (BOOL)outlineView:(NSOutlineView *)outlineView writeItems:(NSArray *)items toPasteboard:(NSPasteboard *)pboard {
    // Tell the pasteboard what kind of data we'll be placing on it
    [pboard declareTypes:[NSArray arrayWithObject:AbstractTreeNodeType] owner:self];
    // Query the NSTreeNode (not the underlying Core Data object) for its index path under the tree controller.
    NSIndexPath *pathToDraggedNode = [[items objectAtIndex:0] indexPath];
    // Place the index path on the pasteboard.
    NSData *indexPathData = [NSKeyedArchiver archivedDataWithRootObject:pathToDraggedNode];
    [pboard setData:indexPathData forType:AbstractTreeNodeType];
    // Return YES so that the drag actually begins...
    return YES;
}

/*
    Performing a drop in the outline view. This allows the user to manipulate the structure of the tree by moving subtrees under new parent nodes.
*/
- (BOOL)outlineView:(NSOutlineView *)outlineView acceptDrop:(id <NSDraggingInfo>)info item:(id)item childIndex:(NSInteger)index {
    // Retrieve the index path from the pasteboard.
	
	
	if ([[[info draggingPasteboard] propertyListForType:DiskInfoType] count] == 1) 
	{
    NSArray *array = [[info draggingPasteboard]propertyListForType:DiskInfoType];
		
	id disk = [[DUDiskController sharedDiskController] diskWithIdentifier:[array objectAtIndex:0]];
		
		NSManagedObjectContext * context = [self managedObjectContext];
		NSManagedObject        * instrument  = nil;
instrument = [NSEntityDescription insertNewObjectForEntityForName: @"Outline"
                  inManagedObjectContext: context];
[instrument setValue:[disk displayName] forKey: @"name"];	
[instrument setValue:[disk uncachedDisplayIcon] forKey: @"image"];	
[instrument setValue:NO forKey: @"editable"];	

}
	else
	{
	NSIndexPath *droppedIndexPath = [NSKeyedUnarchiver unarchiveObjectWithData:[[info draggingPasteboard] dataForType:AbstractTreeNodeType]];
    id treeRoot = [treeController arrangedObjects];
	NSTreeNode *node = [treeRoot descendantNodeAtIndexPath:droppedIndexPath];
	[treeController moveNode:node toIndexPath:[[item indexPath] indexPathByAddingIndex:0]];
		NSLog(@"%@",[treeController selectedObjects]);
	}

    return YES;
}

/*
    Validating a drop in the outline view. This method is called to determine whether or not to permit a drop operation. There are two cases in which this application will not permit a drop to occur:
        • A node cannot be dropped onto one of its descendents
        • A node cannot be dropped "between" two other nodes. That would imply some kind of ordering, which is not provided for in the data model.
*/
- (NSDragOperation)outlineView:(NSOutlineView *)outlineView validateDrop:(id <NSDraggingInfo>)info proposedItem:(id)item proposedChildIndex:(NSInteger)index {
    // The index indicates whether the drop would take place directly on an item or between two items. 
    // Between items implies that sibling ordering is supported (it's not in this application),
    // so we only indicate a valid operation if the drop is directly over (index == -1) an item.
    if (index != -1) {
        return NSDragOperationNone;
    }
    NSIndexPath *droppedIndexPath;
    
	// Retrieve the index path from the pasteboard.
	if ([[[info draggingPasteboard] propertyListForType:DiskInfoType] count] > 0) 
	{
		droppedIndexPath= [NSIndexPath indexPathWithIndex:1];
	}
	else {
    droppedIndexPath = [NSKeyedUnarchiver unarchiveObjectWithData:[[info draggingPasteboard] dataForType:AbstractTreeNodeType]];
	}

    // We need to find the NSTreeNode positioned at the index path. We start by getting the root node of the tree.
    // In NSTreeController, arrangedObjects returns the root node of the tree.
    id treeRoot = [treeController arrangedObjects];
    // Find the node being moved by querying the root node. NSTreeNode is a 10.5 API.
    NSTreeNode *node = [treeRoot descendantNodeAtIndexPath:droppedIndexPath];
    NSTreeNode *parent = item;
    while (parent != nil) {
        if (parent == node) {
            return NSDragOperationNone;
        }
        parent = [parent parentNode];
    }
    
    // All tests have been passed; permit the drop by returning a valid drag operation.
    return NSDragOperationGeneric;
}

@end
