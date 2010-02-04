/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "NSObject.h"

#import "NSOpenSavePanelDelegate-Protocol.h"

@class ConvertHelper, CryptoHelper, NSPopUpButton, NSSavePanel, NSView;

@interface ConvertImageController : NSObject <NSOpenSavePanelDelegate>
{
    NSView *accessoryView;
    NSPopUpButton *encryptPopup;
    NSPopUpButton *formatPopup;
    CryptoHelper *_cryptoHelper;
    ConvertHelper *_convertHelper;
    NSSavePanel *_savePanel;
    BOOL _allowIFFFormats;
}

+ (id)convertImageController;
- (id)init;
- (void)dealloc;
- (id)getImageParameters:(id)arg1 withDefaultDirectory:(id)arg2 andDefaultFilename:(id)arg3;
- (void)beginGettingImageParametersWithTitle:(id)arg1 withDefaultDirectory:(id)arg2 andDefaultFilename:(id)arg3 onWindow:(id)arg4 forSender:(id)arg5 withSelector:(SEL)arg6 context:(id)arg7;
- (void)savePanelDidEnd:(id)arg1 returnCode:(long long)arg2 contextInfo:(void *)arg3;
- (id)getAccessoryView;
- (void)cleanupAccessoryView;
- (void)setupAccessoryView;
- (void)encryptPopupChanged:(id)arg1;
- (void)formatPopupChanged:(id)arg1;
- (BOOL)allowIFFFormats;
- (void)setAllowIFFFormats:(BOOL)arg1;

@end
