/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import <AppKit/NSOutlineView.h>

@interface DUOutlineView : NSOutlineView
{
}

- (void)awakeFromNib;
- (void)keyDown:(id)arg1;
- (void)delete:(id)arg1;
- (BOOL)validateMenuItem:(id)arg1;
- (struct CGRect)frameOfCellAtColumn:(long long)arg1 row:(long long)arg2;
- (struct CGRect)frameOfOutlineCellAtRow:(long long)arg1;
- (long long)levelForItem:(id)arg1;
- (void)draggedImage:(id)arg1 endedAt:(struct CGPoint)arg2 operation:(unsigned long long)arg3;
- (unsigned long long)draggingSourceOperationMaskForLocal:(BOOL)arg1;
- (void)dragImage:(id)arg1 at:(struct CGPoint)arg2 offset:(struct CGSize)arg3 event:(id)arg4 pasteboard:(id)arg5 source:(id)arg6 slideBack:(BOOL)arg7;
- (id)menuForEvent:(id)arg1;

@end
