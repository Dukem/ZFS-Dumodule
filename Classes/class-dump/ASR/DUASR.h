/*
 *     Generated by code-dump 1.05a.
 */
#import "DUModule.h"

@class DUDisk, DUTimeEstimator, DragTextField, NSButton, NSImageView, NSString, NSTextField, NSTimer;

@interface DUASR : DUModule
{
    NSTextField *instructionalTextField;
    NSTextField *srcInstructionalTextField;
    NSTextField *dstInstructionalTextField;
    NSButton *eraseTargetCheckbox;
    NSButton *skipChecksumCheckbox;
    DragTextField *sourceText;
    DragTextField *targetText;
    NSButton *restoreButton;
    NSImageView *sourceIcon;
    NSImageView *targetIcon;
    NSButton *chooseSourceButton;
    DUDisk *_targetVol;
    DUDisk *_srcVol;
    NSString *_sourceFullName;
    BOOL _doneFlag;
    NSTimer *_doneTimer;
    int _skipState;
    double _maxVal;
    BOOL _isRunning;
    int _state;
    DUTimeEstimator *_stageEstimator;
    DUTimeEstimator *_globalEstimator;
    NSString *_warnMsg;
    NSString *_stageString;
    BOOL _cancelFlag;
    NSString *_restoreButtonTitle;
    BOOL partOfRAID;
    BOOL isIPod;
}

- (id)init;
- (void)awakeFromNib;
- (void)cleanup;
- (void)dealloc;
- (id)dataType;
- (id)displayName;
- (BOOL)shouldRunOnThisConfig;
- (id)tabOrder;
- (void)helpButtonAction:(id)fp8;
- (void)selectionDidChange:(id)fp8;
- (void)diskChangedHandler:(id)fp8;
- (void)interfaceLockChanged:(id)fp8;
- (void)setRunning:(BOOL)fp8;
- (void)enableButtons;
- (void)disableAllButtons;
- (void)setTargetVol:(id)fp8;
- (id)targetVol;
- (void)setSrcVol:(id)fp8;
- (id)srcVol;
- (void)setSourceVol:(id)fp8;
- (void)setDestinationVol:(id)fp8;
- (void)chooseSource:(id)fp8;
- (void)openPanelDidEnd:(id)fp8 returnCode:(int)fp12 contextInfo:(void *)fp16;
- (void)restoreButton:(id)fp8;
- (void)alertDidEnd:(id)fp8 returnCode:(int)fp12 contextInfo:(void *)fp16;
- (void)logRestoreAction;
- (void)doRestore;
- (void)controlTextDidChange:(id)fp8;
- (void)eraseToggle:(id)fp8;
- (void)skipToggle:(id)fp8;
- (void)validateSkipCheckbox;
- (unsigned int)textField:(id)fp8 validateDrop:(id)fp12;
- (BOOL)textField:(id)fp8 acceptDrop:(id)fp12;
- (id)buildExecutionDictionary;
- (void)resetUI;
- (id)warnMsg;
- (void)setWarnMsg:(id)fp8;
- (id)windowController;
- (id)stageEstimator;
- (void)setStageEstimator:(id)fp8;
- (id)globalEstimator;
- (void)setGlobalEstimator:(id)fp8;
- (id)stageString;
- (void)setStageString:(id)fp8;
- (BOOL)cancelFlag;
- (void)setCancelFlag:(BOOL)fp8;
- (void)error:(int)fp8;
- (void)errorWithString:(id)fp8;
- (id)findErrorString:(int)fp8;
- (BOOL)validateMenuItem:(id)fp8;
- (id)contextualMenuForDisk:(id)fp8;
- (BOOL)supportsContextMenuForDiskType:(int)fp8;
- (BOOL)displayPanelForDiskType:(int)fp8 andDisk:(id)fp12;

@end
