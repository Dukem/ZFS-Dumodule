/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "NSWindowController.h"

#import "NSToolbarDelegate-Protocol.h"

@class DULogFile, NSFileHandle, NSPopUpButton, NSSearchField, NSSlider, NSString, NSTextField, NSTextView, NSWindow;

@interface DULogController : NSWindowController <NSToolbarDelegate>
{
    DULogFile *logFile;
    NSFileHandle *outputFileHandle;
    NSString *filterString;
    NSString *tmpName;
    long long loadSize;
    NSTextView *textView;
    NSPopUpButton *encodingPopUpButton;
    NSSearchField *searchField;
    NSWindow *reloadSheet;
    NSSlider *loadSlider;
    NSTextField *minValue;
    NSTextField *midValue;
    NSTextField *maxValue;
}

- (id)init;
- (void)dealloc;
- (void)windowDidLoad;
- (void)windowDidBecomeKey:(id)arg1;
- (BOOL)windowShouldClose:(id)arg1;
- (void)windowWillClose:(id)arg1;
- (void)setLogFile:(id)arg1;
- (id)logFile;
- (void)setFilterString:(id)arg1;
- (id)textView;
- (id)font;
- (void)setFont:(id)arg1;
- (void)setWrap:(BOOL)arg1;
- (void)reload;
- (void)updateNotification:(id)arg1;
- (BOOL)validateMenuItem:(id)arg1;
- (id)toolbar:(id)arg1 itemForItemIdentifier:(id)arg2 willBeInsertedIntoToolbar:(BOOL)arg3;
- (id)toolbarDefaultItemIdentifiers:(id)arg1;
- (id)toolbarAllowedItemIdentifiers:(id)arg1;
- (BOOL)validateToolbarItem:(id)arg1;
- (void)toolbarWillAddItem:(id)arg1;
- (void)clear:(id)arg1;
- (void)changeEncoding:(id)arg1;
- (void)revertDocumentToSaved:(id)arg1;
- (void)load:(id)arg1;
- (void)cancelLoad:(id)arg1;
- (void)applyFilter:(id)arg1;
- (void)orderBehind:(id)arg1;
- (void)printDocument:(id)arg1;
- (void)insertMarker:(id)arg1;
- (void)saveDocumentTo:(id)arg1;
- (void)saveSelectionTo:(id)arg1;
- (void)errorSheetDidEnd:(id)arg1 returnCode:(int)arg2 contextInfo:(void *)arg3;
- (void)savePanelDidEnd:(id)arg1 returnCode:(long long)arg2 contextInfo:(void *)arg3;
- (void)deleteFile:(id)arg1;
- (void)deleteSheetDidDismiss:(id)arg1 returnCode:(long long)arg2 contextInfo:(void *)arg3;
- (void)selfTest;

@end
