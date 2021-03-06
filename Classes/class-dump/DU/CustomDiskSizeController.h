/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "NSObject.h"

#import "NSWindowDelegate-Protocol.h"

@class NSButton, NSPanel, NSPopUpButton, NSTextField;

@interface CustomDiskSizeController : NSObject <NSWindowDelegate>
{
    NSButton *cancelButton;
    NSButton *okButton;
    NSPopUpButton *unitsPopup;
    NSTextField *volumeSizeTextField;
    NSPanel *window;
    NSTextField *titleArea;
    BOOL _isSheet;
    SEL _selector;
    id _modalDelegate;
    id _context;
    long long _sectors;
    long long _units;
}

+ (id)sharedInstance;
- (id)init;
- (void)dealloc;
- (void)handleCancel:(id)arg1;
- (void)handleOK:(id)arg1;
- (void)handleSizeChanged:(id)arg1;
- (void)handleUnitsChanged:(id)arg1;
- (double)sectorsToFormattedSize:(long long)arg1 withUnits:(long long)arg2;
- (void)beginCustomSizeSelection:(id)arg1 withSectors:(long long)arg2 withUnits:(long long)arg3 withSelector:(SEL)arg4 forModalDelegate:(id)arg5;
- (void)sheetWillEnd:(id)arg1 returnCode:(long long)arg2 contextInfo:(void *)arg3;
- (void)loadFromNibIfNecessary:(id)arg1;
- (void)awakeFromNib;
- (id)context;
- (void)setContext:(id)arg1;
- (SEL)selector;
- (void)setSelector:(SEL)arg1;

@end

