//
//  No.m
//  ZFS
//
//  Created by Louis Jencka on 2/3/10.
//  Copyright 2010 underwood. All rights reserved.
//

#import "No.h"


@implementation No
-(void)awakeFromNib
{
    [outlineView registerForDraggedTypes:[NSArray arrayWithObject:AbstractTreeNodeType]];
	[outlineView registerForDraggedTypes:[NSArray arrayWithObject:DiskInfoType]];
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
	NSMutableDictionary *A = [[NSMutableDictionary alloc] init];
		
	id disk = [[DUDiskController sharedDiskController] diskWithIdentifier:[array objectAtIndex:0]];
	
		
		NSManagedObjectContext * context = [treeController managedObjectContext];
		NSManagedObject        * instrument  = nil;
instrument = [NSEntityDescription insertNewObjectForEntityForName: @"ZPoolOutline"
                  inManagedObjectContext: context];
[instrument setValue:[disk displayName] forKey: @"name"];	
[instrument setValue:[disk uncachedDisplayIcon] forKey: @"image"];	
}
	else
	{
	NSIndexPath *droppedIndexPath = [NSKeyedUnarchiver unarchiveObjectWithData:[[info draggingPasteboard] dataForType:AbstractTreeNodeType]];
    id treeRoot = [treeController arrangedObjects];
	NSTreeNode *node = [treeRoot descendantNodeAtIndexPath:droppedIndexPath];
	[treeController moveNode:node toIndexPath:[[item indexPath] indexPathByAddingIndex:0]];
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
		droppedIndexPath= [NSIndexPath indexPathWithIndex:0];
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
- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item {	
	return NULL;
}
- (int)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
	return 1;
}
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
	return NO;
}
- (id)outlineView:(NSOutlineView *)outlineView child:(int)index ofItem:(id)item {
	return NULL;
}



@end

@implementation Ni
-(void)awakeFromNib
{
    [outlineView registerForDraggedTypes:[NSArray arrayWithObject:AbstractTreeNodeType]];
	[outlineView registerForDraggedTypes:[NSArray arrayWithObject:DiskInfoType]];
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
	
		
		NSManagedObjectContext * context = [treeController managedObjectContext];
		NSManagedObject        * instrument  = nil;
instrument = [NSEntityDescription insertNewObjectForEntityForName: @"ZFSOutline"
                  inManagedObjectContext: context];
[instrument setValue:[disk displayName] forKey: @"name"];	
[instrument setValue:[disk uncachedDisplayIcon] forKey: @"image"];	
		NSLog(@"1");
}
	else
	{
	NSIndexPath *droppedIndexPath = [NSKeyedUnarchiver unarchiveObjectWithData:[[info draggingPasteboard] dataForType:AbstractTreeNodeType]];
    id treeRoot = [treeController arrangedObjects];
	NSTreeNode *node = [treeRoot descendantNodeAtIndexPath:droppedIndexPath];
	[treeController moveNode:node toIndexPath:[[item indexPath] indexPathByAddingIndex:0]];
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
		droppedIndexPath= [NSIndexPath indexPathWithIndex:0];
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
- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item {	
	return NULL;
}
- (int)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
	return 1;
}
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
	return NO;
}
- (id)outlineView:(NSOutlineView *)outlineView child:(int)index ofItem:(id)item {
	return NULL;
}



@end