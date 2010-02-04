/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "DUModule.h"

#import "DMAsyncDelegate-Protocol.h"
#import "NSTextFieldDelegate-Protocol.h"

@class DMEraseDisk, DMPartitionDisk, DUNamer, DUTimeEstimator, NSArray, NSBox, NSButton, NSButtonCell, NSCharacterSet, NSMatrix, NSMutableArray, NSPopUpButton, NSTextField;

@interface DUErase : DUModule <DMAsyncDelegate, NSTextFieldDelegate>
{
    NSBox *generalEraseBox;
    NSTextField *titleTextField;
    NSTextField *instructionalTextField;
    NSButton *eraseButton;
    NSButton *optionsButton;
    NSPopUpButton *formatTypeMenu;
    NSTextField *volumeName;
    NSButton *fsOptionsButton;
    NSTextField *secureEraseInfoText;
    NSBox *opticalEraseBox;
    NSTextField *titleOpticalTextField;
    NSTextField *instructionalOpticalTextField;
    id optionsPanel;
    NSButton *optionsNoEraseRadioButton;
    NSButton *optionsZeroDiskRadioButton;
    NSButton *options7PassRadioButton;
    NSButton *options35PassRadioButton;
    NSButton *optionsOKButton;
    NSButton *optionsCancelButton;
    NSTextField *optionsFormatText;
    NSButton *optionsHelpButton;
    long long lastDiskOptions;
    long long cancelDiskOptions;
    id fsOptionsPanel;
    NSMatrix *fsOptionsButtonMatrix;
    NSButtonCell *fsOptionsSinglePassButton;
    NSButtonCell *fsOptions7PassButton;
    NSButtonCell *fsOptions35PassButton;
    NSButton *fsOptionsCancelButton;
    NSButton *fsOptionsOKButton;
    NSButton *fsOptionsHelpButton;
    id containerView;
    DMEraseDisk *ed;
    DMPartitionDisk *dp;
    NSMutableArray *jobQueue;
    BOOL _isRunning;
    int _runType;
    long long _currentPassCount;
    DUNamer *namer;
    BOOL fsIsFAT;
    BOOL isDeterminate;
    unsigned long long _totalJobs;
    unsigned long long _currentJob;
    BOOL _canSkipJob;
    double _jobSplitPercent;
    BOOL _skipping;
    double _skippingPercent;
    NSCharacterSet *dontAllowCharacterSet;
    id drPanelLoaded;
    BOOL holdingMediaReservations;
    BOOL displayedStartMessage;
    double elapsedTime;
    unsigned long long exclusiveAccessRequests;
    NSArray *alertButtons;
    unsigned long long doDisplay;
    DUTimeEstimator *timeEstimator;
}

- (id)init;
- (void)awakeFromNib;
- (void)dealloc;
- (id)dataType;
- (id)displayName;
- (BOOL)shouldRunOnThisConfig;
- (id)tabOrder;
- (id)warnOnSwitch;
- (void)registerForNotifications;
- (void)helpButtonAction:(id)arg1;
- (void)selectionDidChange:(id)arg1;
- (void)diskChangedHandler:(id)arg1;
- (id)eraseTypesForEraseDisk:(id)arg1;
- (void)rebuildFormatMenu;
- (BOOL)supportsSecureErase;
- (void)setRunning:(BOOL)arg1;
- (void)setRunType:(int)arg1;
- (int)runType;
- (id)runTypeDescription;
- (void)enableButtons;
- (void)disableAllButtons;
- (void)newEraseDiskDelegate;
- (void)releaseEraseDiskDelegate;
- (void)newPartitionDiskDelegate;
- (void)releasePartitionDiskDelegate;
- (void)logHeader:(id)arg1 msg:(id)arg2 withFS:(id)arg3 withName:(id)arg4 withMap:(long long)arg5 withType:(int)arg6 withOptions:(long long)arg7;
- (void)logReferenceToDiscRecordingLog;
- (id)safeName;
- (BOOL)windowShouldClose:(id)arg1;
- (void)eraseOptical:(id)arg1;
- (BOOL)eraseViewShouldHandleMediaReservations:(id)arg1;
- (void)handleOpticalEraseView:(id)arg1;
- (void)handleOpticalEraseStatusChange:(id)arg1;
- (void)handleOpticalEraseComplete:(id)arg1;
- (void)eraseDisk:(id)arg1;
- (void)eraseVolume:(id)arg1;
- (void)zeroDisk:(id)arg1;
- (void)randomWriteDisk:(id)arg1;
- (void)secureDisk:(id)arg1 withJobType:(long long)arg2;
- (void)secureFreeSpace:(id)arg1 withJobType:(long long)arg2;
- (void)secureVolume:(id)arg1;
- (void)partitionDisk:(id)arg1;
- (void)queueJob:(id)arg1 jobType:(int)arg2;
- (id)getQueuedJob;
- (void)eatRemainingJobs;
- (long long)diskOptions;
- (void)optionsRadioButtonAction:(id)arg1;
- (void)setSpecificOptionsRadioButton:(long long)arg1;
- (long long)getOptionsRadioButtonSelection;
- (void)optionsButton:(id)arg1;
- (void)optionsOKButton:(id)arg1;
- (void)optionsCancelButton:(id)arg1;
- (void)optionsHelpButton:(id)arg1;
- (void)eraseDiskButton:(id)arg1;
- (void)prepareForPacketWritingButton:(id)arg1;
- (void)formatMenuChanged:(id)arg1;
- (void)alertDidEnd:(id)arg1 returnCode:(long long)arg2 contextInfo:(void *)arg3;
- (void)warningOKButton:(id)arg1;
- (void)warningCancelButton:(id)arg1;
- (void)fsOptionsButton:(id)arg1;
- (void)fsOptionsOKButton:(id)arg1;
- (void)fsOptionsCancelButton:(id)arg1;
- (void)fsOptionsHelpButton:(id)arg1;
- (void)unmountNotification:(id)arg1;
- (void)mountNotification:(id)arg1;
- (void)ejectFailedNotification:(id)arg1;
- (void)unmountFailedNotification:(id)arg1;
- (void)setWorkingDisk:(id)arg1;
- (void)controlTextDidChange:(id)arg1;
- (BOOL)parsePassString:(id)arg1;
- (BOOL)isMultiPassJobType;
- (void)updateSinglePassProgressWithTime:(id)arg1;
- (void)updateMultiPassProgressWithTime:(id)arg1;
- (void)dmAsyncMessageForDisk:(struct __DADisk *)arg1 string:(id)arg2 dictionary:(id)arg3;
- (void)dmAsyncStartedForDisk:(struct __DADisk *)arg1;
- (void)startJob:(id)arg1;
- (void)postEraseHandling:(id)arg1;
- (BOOL)isBelowPartitionThreshold:(id)arg1;
- (void)dmAsyncFinishedForDisk:(struct __DADisk *)arg1 mainError:(int)arg2 detailError:(int)arg3 dictionary:(id)arg4;
- (void)sendCompletionReport:(id)arg1;
- (void)dmAsyncProgressForDisk:(struct __DADisk *)arg1 barberPole:(BOOL)arg2 percent:(float)arg3;
- (void)eraseError:(int)arg1;
- (void)updatePermissions:(id)arg1;
- (BOOL)supportsContextMenuForDiskType:(int)arg1 selectedDisk:(id)arg2;
- (BOOL)displayPanelForDiskType:(int)arg1 andDisk:(id)arg2;

@end

