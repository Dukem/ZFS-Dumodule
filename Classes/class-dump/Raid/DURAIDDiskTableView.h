/*
 *     Generated by code-dump 1.05a.
 */
#import "NSOutlineView.h"

@interface DURAIDDiskTableView : NSOutlineView
{
    id module;
}

- (id)hitTest:(struct _NSPoint)fp8;
- (void)keyDown:(id)fp8;
- (void)delete:(id)fp8;
- (BOOL)validateMenuItem:(id)fp8;
- (struct _NSRect)frameOfCellAtColumn:(int)fp8 row:(int)fp12;
- (struct _NSRect)frameOfOutlineCellAtRow:(int)fp8;
- (void)updateToolTipRects;
- (id)view:(id)fp8 stringForToolTip:(int)fp12 point:(struct _NSPoint)fp16 userData:(void *)fp24;
- (void)reloadData;
- (void)dragImage:(id)fp8 at:(struct _NSPoint)fp12 offset:(struct _NSSize)fp20 event:(id)fp28 pasteboard:(id)fp32 source:(id)fp36 slideBack:(BOOL)fp40;
- (void)draggedImage:(id)fp8 endedAt:(struct _NSPoint)fp12 operation:(unsigned int)fp20;
- (unsigned int)draggingSourceOperationMaskForLocal:(BOOL)fp8;
- (id)menuForEvent:(id)fp8;

@end

