/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "DUWindowController.h"

@interface DUWindowController (ToolbarActions)
- (void)immediateDisableToolbarButtons;
- (BOOL)validateBurnToolbarItem:(id)arg1;
- (BOOL)validateNewImageToolbarItem:(id)arg1;
- (BOOL)validateConvertImageToolbarItem:(id)arg1;
- (BOOL)validateAttachImageToolbarItem:(id)arg1;
- (BOOL)validateVerifyImageToolbarItem:(id)arg1;
- (BOOL)validateChecksumImageToolbarItem:(id)arg1;
- (BOOL)validateResizeImageToolbarItem:(id)arg1;
- (BOOL)validateImageScanToolbarItem:(id)arg1;
- (BOOL)validateJournalDiskToolbarItem:(id)arg1 altText:(unsigned long long *)arg2;
- (BOOL)validateInfoDiskToolbarItem:(id)arg1;
- (BOOL)validateMountDiskToolbarItem:(id)arg1 altText:(unsigned long long *)arg2;
- (BOOL)diskIsRemovable:(id)arg1;
- (BOOL)validateEjectDiskToolbarItem:(id)arg1 altText:(unsigned long long *)arg2;
- (id)moduleWithType:(id)arg1;
- (void)bringModuleToFront:(id)arg1;
- (void)verifySelected:(id)arg1;
- (void)burnImageToolbarAction:(id)arg1;
- (void)newImageToolbarAction:(id)arg1;
- (void)convertImageToolbarAction:(id)arg1;
- (void)attachImageToolbarAction:(id)arg1;
- (void)verifyImageToolbarAction:(id)arg1;
- (void)checksumImageToolbarAction:(id)arg1;
- (void)resizeImageToolbarAction:(id)arg1;
- (void)imageScanToolbarAction:(id)arg1;
- (void)enableJournalDiskToolbarAction:(id)arg1;
- (void)infoDiskToolbarAction:(id)arg1;
- (void)mountDiskToolbarAction:(id)arg1;
- (void)unmountDiskToolbarAction:(id)arg1;
- (void)openOfflineDiskToolbarAction:(id)arg1;
- (void)ejectDiskToolbarAction:(id)arg1;
- (void)openLogToolbarAction:(id)arg1;
@end

