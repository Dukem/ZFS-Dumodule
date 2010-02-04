#import "DUErase.h"

@implementation DUErase

- (id)init
{
	DUErase * result_20 = [self init];
	if (UNKNOWN_CONDITION) {
			//stb	r0,0xc8(r30)
			//stw	r29,0xcc(r30)
		id result_40 = [[NSCharacterSet characterSetWithCharactersInString:@":" ] retain];
			//stw	r29,0x10c(r30)
			//stw	r3,0xf8(r30)
			//stw	r29,0xfc(r30)
		BOOL result_52 = [NSBundle loadNibNamed:@"Erase" owner:result_20 ];
	}
	return nil;
}

- (void)awakeFromNib
{
	[volumeName setDelegate:0 ];
	NSMutableAttributedString * result_30 = [NSMutableAttributedString alloc];
	NSString * result_50 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"To erase all data on a disk or volume:\n1	Select the disk or volume in the list on the left.\n2	Specify a format and name.\n3	If you want to prevent the recovery of the disk\U2019s erased data, click Security Options.\n4	Click Erase." value:@"" table:nil ];
	NSMutableAttributedString * result_61 = [result_30 initWithString:result_50 attributes:[self instructionalTextParagraphStyle] ];
	NSMutableAttributedString * result_66 = [NSMutableAttributedString alloc];
	NSString * result_86 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"\n\nTo prevent the recovery of previously deleted files without erasing the volume, select a volume in the list on the left, and click Erase Free Space." value:@"" table:nil ];
	NSMutableAttributedString * result_98 = [result_66 initWithString:result_86 attributes:[self instructionalTextParagraphStyleNoIndent] ];
	[result_61 appendAttributedString:result_98 ];
	[instructionalTextField setAttributedStringValue:result_61 ];
	[result_98 release];
	[result_61 release];
	[titleOpticalTextField setStringValue:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"To erase a rewritable CD or DVD so that you can write to it again:" value:@"" table:nil ] ];
	NSMutableAttributedString * result_150 = [NSMutableAttributedString alloc];
	NSString * result_170 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"1	Choose how to erase it.\n\n	If you haven\U2019t been able to save to or read from the disc reliably, select Completely. Otherwise, select Quickly.\n\n	Quickly erasing a disc takes a few minutes. Completely erasing it can take about an hour.\n\n2	Click Erase." value:@"" table:nil ];
	NSMutableAttributedString * result_181 = [result_150 initWithString:result_170 attributes:[self instructionalTextParagraphStyle] ];
	[instructionalOpticalTextField setAttributedStringValue:result_181 ];
	[result_181 release];
	namer = [[DUNamer alloc] init];
}

- (void)dealloc
{
	[namer release];
	[self releaseEraseDiskDelegate];
	[self releasePartitionDiskDelegate];
	[jobQueue release];
	[dontAllowCharacterSet release];
	[[timeEstimator release] dealloc];
}

- (id)dataType
{
	return @"Erase";
}

- (id)displayName
{
	NSBundle * result_19 = [NSBundle bundleForClass:[self class] ];
	return [NSBundle bundleForClass:[self class] ];
}

- (BOOL)shouldRunOnThisConfig
{
	if ([[NSUserDefaults standardUserDefaults] objectForKey:&DUModule_ERASE ] != 0) {
		BOOL result_35 = [[NSUserDefaults standardUserDefaults] boolForKey:&DUModule_ERASE ];
	}
	__strong const char * result_45 = [[self displayName] UTF8String];
	if (1 != 0) {
		du_log()
		return 1;
	}
	du_log()
	return 1;
}

- (id)tabOrder
{
	return [NSNumber numberWithInteger:nil(0x1e) ];
}

- (void)registerForNotifications
{
	[self registerForNotifications];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(diskChangedHandler:) name:_DUDiskAppearedNotification object:nil ];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(diskChangedHandler:) name:_DUDiskChangedNotification object:nil ];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(diskChangedHandler:) name:_DUDiskUnmountedNotification object:nil ];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(diskChangedHandler:) name:_DUDiskEjectedNotification object:nil ];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(diskChangedHandler:) name:_DUInterfaceLockedNotification object:nil ];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(diskChangedHandler:) name:_DUInterfaceUnlockedNotification object:nil ];
}

- (void)helpButtonAction:(id)fp8
{
	NSHelpManager * result_16 = [NSHelpManager sharedHelpManager];
	return [result_16 openHelpAnchor:@"dskutl14079" inBook:[[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Disk Utility Help" value:@"" table:nil ] ];
}

- (void)selectionDidChange:(id)fp8
{
	if ([self currentActiveTab] != 0) {
			//lwz	r3,0xc(r30)
		[self setWorkingDisk:[[[self currentActiveTab] allSelectedItems] lastObject] ];
		if ([[self workingDisk] isOpticalDevice] == 0) {
			if ([[self workingDisk] diskType] != 11) {
				if ([[self workingDisk] isErasableOpticalMedia] != 0) {
			}
		}
		if ([[self isOpticalDevice] isDVDRAM] == 0) {
			[generalEraseBox setHidden:YES ];
			[opticalEraseBox setHidden:NO ];
			if ([[self workingDisk] diskType] == 11) {
				if ([[self workingDisk] respondsToSelector:@selector(device) ] != 0) {
					UNKNOWN_RES_TYPE result_130 = [[self workingDisk] device];
						//b	0x2470
				}
			}
			UNKNOWN_RES_TYPE result_141 = [[self diskType] isErasableOpticalMedia];
			if (drPanelLoaded == 0) {
				drPanelLoaded = [DROpticalDiscEraseView opticalDiscEraseView];
				[[DROpticalDiscEraseView opticalDiscEraseView] setTarget:self ];
				[drPanelLoaded setAction:@selector(handleOpticalEraseView:) ];
				UNKNOWN_RES_TYPE result_175 = [drPanelLoaded setDelegate:0 ];
				if (nil != 0) {
					UNKNOWN_RES_TYPE result_186 = [drPanelLoaded setDevice:0 ];
				}
				UNKNOWN_RES_TYPE result_195 = [nil(0x122dc) ];
				UNKNOWN_RES_TYPE result_217 = [nil(0x122dc) ];
					//lfs	f31,0x90(r1)
				UNKNOWN_RES_TYPE result_240 = [nil(0x122dc) ];
					//lfs	f30,0x78(r1)
					//lfs	f0,0x50(r1)
					//fsubs	f31,f31,f0
				UNKNOWN_RES_TYPE result_265 = [nil(0x122dc) ];
					//fsubs	f31,f31,f30
					//lfs	f0,0x80(r1)
					//fadds	f30,f30,f31
					//fsubs	f0,f0,f30
					//stfs	f0,0x70(r1)
				UNKNOWN_RES_TYPE result_292 = [nil(0x122dc) ];
					//lfs	f31,0x3c(r1)
				UNKNOWN_RES_TYPE result_315 = [nil(0x122dc) ];
					//lfs	f0,0x64(r1)
					//fadds	f31,f31,f0
					//lfs	f0,0x74(r1)
					//fsubs	f31,f31,f0
					//lfs	f0,0xccdc(r9)
					//fadds	f31,f31,f0
					//stfs	f31,0x6c(r1)
				[drPanelLoaded setFrame:UKNOWN_OBJECT ];
				[drPanelLoaded setAutoresizingMask:nil(0xc) ];
				[opticalEraseBox addSubview:drPanelLoaded ];
					//b	0x29a4
			}
			if (nil != 0) {
				UNKNOWN_RES_TYPE result_379 = [drPanelLoaded setDevice:0 ];
			}
		}
		UNKNOWN_RES_TYPE result_397 = [generalEraseBox ];
		UNKNOWN_RES_TYPE result_403 = [opticalEraseBox ];
		UNKNOWN_RES_TYPE result_411 = [self performSelectorOnMainThread:50052 withObject:0 waitUntilDone:1 ];
		id result_421 = [[formatTypeMenu selectedItem] representedObject];
		BOOL result_432 = [[result_421 filesystemType] isEqualToString:@"msdos" ];
		if (UNKNOWN_CONDITION) {
			fsIsFAT = 1;
				//b	0x275c
		}
		fsIsFAT = result_432;
		UNKNOWN_RES_TYPE result_449 = [namer setUserEnteredName:0 ];
			//lwz	r3,0xc(r30)
		if ([[result_449 allSelectedItems] count] == 1) {
			if ([[self workingDisk] diskType] != 1) {
				if ([[self workingDisk] partitionNumber] == 0) {
					if ([[[self workingDisk] diskIdentifier] hasSuffix:@"s0" ] == 0) {
				}
			}
				//lwz	r4,0xddb8(r21)
				//lwz	r3,0xe1d8(r22)
			NSBundle * result_523 = [NSBundle bundleForClass:[UKNOWN_OBJECT ] ];
			NSString * result_532 = [result_523 localizedStringForKey:@"Untitled" value:@"" table:nil ];
			UNKNOWN_RES_TYPE result_538 = [namer setDefaultName:result_532 ];
				//lwz	r4,0xddb8(r21)
				//lwz	r3,0xe1d8(r22)
			NSString * result_559 = [[NSBundle bundleForClass:[UKNOWN_OBJECT ] ] localizedStringForKey:@"UNTITLED" value:@"" table:nil ];
				//b	0x293c
			NSString * result_571 = [[self ] displayName];
			if (setDefaultFATName: != 0) {
				UNKNOWN_RES_TYPE result_586 = [setDefaultFATName: isValidName:result_571 correctedName:61564 ];
					//b	0x2918
			}
			UNKNOWN_RES_TYPE result_597 = [namer setDefaultName:0 ];
			UNKNOWN_RES_TYPE result_605 = [namer setDefaultFATName:0 ];
		}
		[volumeName setStringValue:[namer name:fsIsFAT ] ];
		[self setSpecificOptionsRadioButton:0 ];
		UNKNOWN_RES_TYPE result_637 = [self performSelectorOnMainThread:49940 withObject:0 waitUntilDone:1 ];
	}
}

- (void)diskChangedHandler:(id)fp8
{
	if ([self currentActiveTab] != 0) {
		if (fp8 != 0) {
			if ([fp8 object] != 0) {
				id result_35 = [fp8 object];
				if ([result_35 isKindOfClass:[DUDisk class] ] != 0) {
					if ([fp8 object] != 0) {
							//lwz	r0,0x2c(r26)
						if (UKNOWN_OBJECT != 0) {
							UNKNOWN_RES_TYPE result_70 = [[fp8 object] diskIdentifier];
								//lwz	r3,0x2c(r26)
							if ([result_70 isEqualToString:[result_70 diskIdentifier] ] != 0) {
								UNKNOWN_RES_TYPE result_94 = [self performSelectorOnMainThread:50052 withObject:0 waitUntilDone:1 ];
								return [self performSelectorOnMainThread:49940 withObject:0 waitUntilDone:1 ];
							}
						}
					}
				}
			}
		}
	}
}

- (id)eraseTypesForEraseDisk:(id)fp8
{
	if ([fp8 parentIsRAIDMaster] != 0) {
		UNKNOWN_RES_TYPE result_32 = [fp8 parentDisk];
		UNKNOWN_RES_TYPE result_43 = [DMEraseDisk eraseTypesForDisk:[result_32 theDMDisk] ];
		NSUInteger result_48 = [result_43 count];
		NSMutableArray * result_55 = [NSMutableArray array];
		if (nil >= result_48) {
			id result_66 = [result_55 copy];
			return [result_55 copy];
		}
		id result_83 = [result_43 objectAtIndex:nil ];
		if ([[result_83 filesystemType] isEqualToString:@"msdos" ] == 0) {
			if ([[result_83 filesystemType] isEqualToString:@"ufs" ] == 0) {
				[result_55 addObject:result_83 ];
			}
		}
		if (1 >= result_48) {
		id result_122 = [result_55 copy];
		return [result_55 copy];
	}
	if ([[self workingDisk] isPseudoDisk] != 0) {
		UNKNOWN_RES_TYPE result_161 = [[fp8 parentDisk] theDMDisk];
		return DMEraseDisk;
	}
	UNKNOWN_RES_TYPE result_183 = [fp8 theDMDisk];
	return DMEraseDisk;
}

- (void)rebuildFormatMenu
{
		//lwz	r3,0xc(r3)
	if ([self interfaceLock] == 0) {
		if ([self workingDisk] == 0) {
			[formatTypeMenu removeAllItems];
			UNKNOWN_RES_TYPE result_41 = [DMFilesystem filesystemWithName:61740 ];
			UNKNOWN_RES_TYPE result_48 = [result_41 userVisibleName];
			[formatTypeMenu addItemWithTitle:result_48 ];
			return [formatTypeMenu selectItemWithTitle:[result_41 userVisibleName] ];
		}
		UNKNOWN_RES_TYPE result_82 = [[self workingDisk] filesystem];
		UNKNOWN_RES_TYPE result_91 = [[self workingDisk] theDMDisk];
		if (result_82 == 0) {
			UNKNOWN_RES_TYPE result_103 = [DMEraseDisk defaultFilesystemForDisk:result_91 ];
		}
		UNKNOWN_RES_TYPE result_110 = [result_82 filesystemName];
		if ([result_110 isEqualToString:@"MS-DOS FAT32" ] != 0) {
			UNKNOWN_RES_TYPE result_128 = [DMFilesystem filesystemWithName:61772 ];
		}
		id result_140 = [self eraseTypesForEraseDisk:[self workingDisk] ];
		[formatTypeMenu removeAllItems];
		if ([result_140 count] == 0) {
			if (result_82 == 0) {
				UNKNOWN_RES_TYPE result_167 = [DMEraseDisk defaultFilesystemForDisk:result_91 ];
				if (UNKNOWN_CONDITION) {
					UNKNOWN_RES_TYPE result_175 = [DMEraseDisk defaultFilesystemForDisk:0 ];
				}
			}
			if ([[result_82 filesystemName] isEqualToString:@"MS-DOS FAT32" ] != 0) {
				UNKNOWN_RES_TYPE result_196 = [DMFilesystem filesystemWithName:61772 ];
			}
			[formatTypeMenu addItemWithTitle:[result_82 userVisibleName] ];
				//b	0x2e20
		}
		DUSortedFilesystemList()
		if ([result_216 containsObject:result_82 ] == 0) {
			NSMutableArray * result_233 = [NSMutableArray arrayWithArray:result_216 ];
			[result_233 addObject:result_82 ];
			DUSortedFilesystemList()
		}
		NSEnumerator * result_256 = [result_216 objectEnumerator];
			//b	0x2e0c
		if ([result_256 formatExecutable] != 0) {
			if ([[nil(0x12a9c) formatExecutable] length] != 0) {
				UNKNOWN_RES_TYPE result_280 = [nil(0x12a9c) userVisibleName];
				[formatTypeMenu addItemWithTitle:result_280 ];
				[[formatTypeMenu itemWithTitle:result_280 ] setRepresentedObject:nil(0x12a9c) ];
			}
		}
		id result_301 = [result_256 nextObject];
		if (UNKNOWN_CONDITION) {
		if (result_82 != 0) {
			[formatTypeMenu selectItemWithTitle:[result_82 userVisibleName] ];
		}
		if ([formatTypeMenu selectedItem] == 0) {
			UNKNOWN_RES_TYPE result_339 = [DMEraseDisk defaultFilesystemForDisk:result_91 ];
			if (UNKNOWN_CONDITION) {
				UNKNOWN_RES_TYPE result_347 = [DMEraseDisk defaultFilesystemForDisk:0 ];
			}
			[formatTypeMenu selectItemWithTitle:[result_339 userVisibleName] ];
			if ([formatTypeMenu selectedItem] == 0) {
				UNKNOWN_RES_TYPE result_379 = [result_339 userVisibleName];
				[formatTypeMenu addItemWithTitle:result_379 ];
				[[formatTypeMenu itemWithTitle:[result_339 userVisibleName] ] setRepresentedObject:result_339 ];
				return [formatTypeMenu selectItemWithTitle:[result_339 userVisibleName] ];
			}
		}
	}
}

- (BOOL)supportsSecureErase
{
	return 1;
}

- (void)setRunning:(BOOL)fp8
{
	if (UNKNOWN_CONDITION) {
		if (UKNOWN_OBJECT == 0) {
				//lwz	r3,0xc(r3)
			UNKNOWN_RES_TYPE result_28 = [self setInterfaceLock];
			[self enableButtons];
			displayedStartMessage = UKNOWN_OBJECT;
				//lfs	f1,0x9ae8(r2)
			isDeterminate = UKNOWN_OBJECT;
			_skipping = UKNOWN_OBJECT;
				//lwz	r3,0xc(r30)
				//stfs	f1,0xf4(r30)
			UNKNOWN_RES_TYPE result_48 = [result_33 setGlobalProgressBarValue:fp8 ];
				//lwz	r26,0xc(r30)
			UNKNOWN_RES_TYPE result_76 = [fp8 setGlobalProgressText:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Unmounting disk" value:@"" table:nil ] ];
				//lwz	r3,0xc(r30)
			UNKNOWN_RES_TYPE result_82 = [result_76 activateGlobalProgressBar:1 ];
				//lwz	r3,0xc(r30)
			UNKNOWN_RES_TYPE result_88 = [result_82 activateGlobalProgressText:1 ];
				//lwz	r3,0xc(r30)
			UNKNOWN_RES_TYPE result_94 = [result_88 setGlobalProgressBarIndeterminate:1 ];
				//lwz	r3,0xc(r30)
			UNKNOWN_RES_TYPE result_100 = [result_94 startGlobalProgressBarAnimation:0 ];
			[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(unmountNotification:) name:DMDiskUnmountedNotification object:nil ];
			[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mountNotification:) name:DMDiskMountedNotification object:nil ];
			[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ejectFailedNotification:) name:DMDiskEjectFailedNotification object:nil ];
			[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(unmountFailedNotification:) name:DMDiskUnmountFailedNotification object:nil ];
			_isRunning = 1;
		}
	}
		//lwz	r3,0xc(r3)
		//lwz	r4,0xad60(r4)
	UNKNOWN_RES_TYPE result_183 = [self ];
		//lwz	r3,0xc(r30)
	UNKNOWN_RES_TYPE result_189 = [result_183 activateGlobalProgressBar:0 ];
		//lwz	r3,0xc(r30)
	UNKNOWN_RES_TYPE result_195 = [result_189 activateGlobalProgressText:0 ];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:DMDiskUnmountedNotification object:nil ];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:DMDiskMountedNotification object:nil ];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:DMDiskEjectFailedNotification object:nil ];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:DMDiskUnmountFailedNotification object:nil ];
	[self setRunType:0 ];
	_isRunning = fp8;
	lastOS9ButtonSetting = 1;
	return [self selectionDidChange:nil ];
}

- (void)setRunType:(int)fp8
{
	_runType = fp8;
}

- (int)runType
{
	return _runType;
}

- (id)runTypeDescription
{
	int result_11 = [self runType];
		//cmplwi	cr7,r3,0x10
	if (UNKNOWN_CONDITION) {
			//rlwinm	r0,r3,2,0,29
			//lwzx	r9,r2,r0
			//add	r9,r9,r2
			//bctr
			//.long 0x00000308
			//.long 0x00000044
			//.long 0x00000088
			//.long 0x000000e8
			//.long 0x0000012c
			//.long 0x000000e8
			//.long 0x00000170
			//.long 0x000001b4
			//.long 0x000001b4
			//.long 0x000001f8
			//.long 0x0000023c
			//.long 0x000000e8
			//.long 0x00000280
			//.long 0x00000280
			//.long 0x000002c4
			//.long 0x000002c4
			//.long 0x000002c4
		NSBundle * result_52 = [NSBundle bundleForClass:[self class] ];
		return [NSBundle bundleForClass:[self class] ];
[NSBundle bundleForClass:[self class] ];
		return [NSBundle bundleForClass:[self class] ];
[NSBundle bundleForClass:[self class] ];
		return [NSBundle bundleForClass:[self class] ];
[NSBundle bundleForClass:[self class] ];
		return [NSBundle bundleForClass:[self class] ];
[NSBundle bundleForClass:[self class] ];
		return [NSBundle bundleForClass:[self class] ];
[NSBundle bundleForClass:[self class] ];
		return [NSBundle bundleForClass:[self class] ];
[NSBundle bundleForClass:[self class] ];
		return [NSBundle bundleForClass:[self class] ];
[NSBundle bundleForClass:[self class] ];
		return [NSBundle bundleForClass:[self class] ];
[NSBundle bundleForClass:[self class] ];
		return [NSBundle bundleForClass:[self class] ];
[NSBundle bundleForClass:[self class] ];
		return [NSBundle bundleForClass:[self class] ];
	}
	return @"";
}

- (void)enableOS9Button:(int)fp8 locked:(BOOL)fp12
{
	UNKNOWN_RES_TYPE result_19 = [DUDiskController sharedDiskController];
	if ([result_19 partitionMapTypeForDisk:[self workingDisk] ] == 0) {
		if ([[[[formatTypeMenu selectedItem] representedObject] filesystemType] isEqualToString:@"msdos" ] == 0) {
			if (fp8 != 1) {
				if (fp8 == 7) {
			}
			double result_78 = [[[self isEqualToString:61660 ] ioKitSize] doubleValue];
				//fcmpu	cr7,f1,f0
				//cror	30,29,30
			if (fp8 == 1) {
				if ([[self workingDisk] isInternal] != 0) {
					if ([[[DUDiskController sharedDiskController] dm] preBootEnvironment] == 0) {
				}
				if ([[self isInternal] isInternal] != 0) {
					if ([[DUPreferences sharedPreferences] canBootOS9] != 0) {
				}
				[os9DriverCheckBox setHidden:NO ];
				[os9DriverInfoText setHidden:NO ];
				if (fp12 == 0) {
					UNKNOWN_RES_TYPE result_159 = [DUDiskController sharedDiskController];
					if ([result_159 diskHasBootPartition:[self workingDisk] ] != 0) {
				}
				[DUDiskController setHidden:NO ];
				UNKNOWN_RES_TYPE result_203 = [result_189 wholeDiskHasOS9Drivers:[self workingDisk] ];
				[os9DriverCheckBox setState:result_203 ];
				NSBundle * result_223 = [NSBundle bundleForClass:[DUModule class] ];
				NSString * result_231 = [result_223 localizedStringForKey:@"Mac OS 9 Drivers Installed" value:@"" table:nil ];
				[os9DriverCheckBox setTitle:result_231 ];
				[os9DriverCheckBox setEnabled:NO ];
				NSString * result_267 = [[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Select %@ if you want this volume to be a Mac OS 9 startup disk." value:@"" table:nil ];
				NSString * result_285 = [[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Mac OS 9 Drivers Installed" value:@"" table:nil ];
				return [os9DriverInfoText setStringValue:[NSString stringWithFormat:result_267 ] ];
	//lwz	r5,0xec(r17)
	//lwz	r3,0x50(r17)
[UKNOWN_OBJECT setState:UKNOWN_OBJECT ];
					//lwz	r25,0x50(r17)
				NSBundle * result_333 = [NSBundle bundleForClass:[DUModule class] ];
				NSString * result_341 = [result_333 localizedStringForKey:@"Install Mac OS 9 Disk Drivers" value:@"" table:nil ];
				UNKNOWN_RES_TYPE result_347 = [UKNOWN_OBJECT setTitle:result_341 ];
					//lwz	r3,0x50(r17)
				[UKNOWN_OBJECT setEnabled:YES ];
					//lwz	r17,0x54(r17)
				NSString * result_375 = [[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Select %@ if you want this volume to be a Mac OS 9 startup disk." value:@"" table:nil ];
				NSString * result_393 = [[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Install Mac OS 9 Disk Drivers" value:@"" table:nil ];
				return [UKNOWN_OBJECT setStringValue:[NSString stringWithFormat:result_375 ] ];
			}
		}
	}
	[os9DriverCheckBox setState:nil ];
	[os9DriverCheckBox setEnabled:NO ];
	[os9DriverCheckBox setHidden:YES ];
	return [os9DriverInfoText setHidden:YES ];
}

- (void)enableButtons
{
	if ([generalEraseBox isHidden] != 0) {
		if (drPanelLoaded != 0) {
				//lwz	r3,0xc(r30)
			if ([[generalEraseBox isHidden] interfaceLock] == 0) {
				if ([[[self utilityView] window] isMainWindow] == 0) {
			}
			return [drPanelLoaded ];
		}
	}
		//lwz	r3,0xc(r30)
	if ([[generalEraseBox isHidden] ] == 0) {
		if ([[[self utilityView] window] isMainWindow] == 0) {
	}
		//lwz	r4,0xd0a0(r4)
	UNKNOWN_RES_TYPE result_109 = [self ];
	if (_canSkipJob != 0) {
		NSString * result_126 = [eraseButton title];
		NSBundle * result_139 = [NSBundle bundleForClass:[self class] ];
		if ([result_126 isEqualToString:[result_139 localizedStringForKey:@"Skip" value:@"" table:nil ] ] == 0) {
			[eraseButton setTitle:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Skip" value:@"" table:nil ] ];
		}
		[eraseButton setEnabled:[[[self utilityView] window] isMainWindow] ];
			//lwz	r3,0x4(r30)
		[result_207 setNeedsDisplay:YES ];
			//lwz	r3,0x4(r30)
		return [result_213 performSelectorOnMainThread:@selector(displayIfNeeded) withObject:nil waitUntilDone:YES ];
	}
	NSString * result_241 = [eraseButton title];
	NSBundle * result_254 = [NSBundle bundleForClass:[DUModule class] ];
	if ([result_241 isEqualToString:[result_254 localizedStringForKey:@"Erase\U2026" value:@"" table:nil ] ] == 0) {
		[eraseButton setTitle:[[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Erase\U2026" value:@"" table:nil ] ];
	}
		//lwz	r3,0x4(r30)
	[[result_241 isEqualToString:[result_254 localizedStringForKey:@"Erase\U2026" value:@"" table:nil ] ] setNeedsDisplay:YES ];
		//lwz	r3,0x4(r30)
	return [result_305 performSelectorOnMainThread:@selector(displayIfNeeded) withObject:nil waitUntilDone:YES ];
}

- (void)disableAllButtons
{
	[eraseButton setEnabled:NO ];
	[optionsButton setEnabled:NO ];
	[fsOptionsButton setEnabled:NO ];
	[formatTypeMenu setEnabled:NO ];
	[volumeName setEnabled:NO ];
	[os9DriverCheckBox setEnabled:NO ];
	return [secureEraseInfoText setEnabled:NO ];
}

- (void)newEraseDiskDelegate
{
	[self releaseEraseDiskDelegate];
	ed = [[DMEraseDisk alloc] init];
	return [[[DMEraseDisk alloc] init] setDelegate:0 ];
}

- (void)releaseEraseDiskDelegate
{
	if (ed != 0) {
		UNKNOWN_RES_TYPE result_18 = [ed setDelegate:0 ];
		[ed release];
		ed = nil;
	}
}

- (void)newPartitionDiskDelegate
{
	[self releasePartitionDiskDelegate];
	dp = [[DMPartitionDisk alloc] init];
	return [[[DMPartitionDisk alloc] init] setDelegate:0 ];
}

- (void)releasePartitionDiskDelegate
{
	if (dp != 0) {
		UNKNOWN_RES_TYPE result_18 = [dp setDelegate:0 ];
		[dp release];
		dp = nil;
	}
}

- (void)logHeader:(id)fp8 msg:(id)fp12 withFS:(id)fp16 withName:(id)fp20 withMap:(int)fp24 withType:(int)fp28 withOptions:(int)fp32
{
	id result_39 = [self safeName];
	NSBundle * result_58 = [NSBundle bundleForClass:[self class] ];
	UNKNOWN_RES_TYPE result_80 = [DULog log:[NSString stringWithFormat:[result_58 localizedStringForKey:@"%@ : \U201C%@\U201D" value:@"" table:nil ] ] ];
	if (fp24 == -2) {
		UNKNOWN_RES_TYPE result_96 = [[DUDiskController sharedDiskController] partitionMapTypeForDisk:0 ];
	}
		//cmplwi	cr7,r0,0x3
	if (fp24 <= -2) {
		if (fp24 == 0) {
				//lwz	r25,0x9dbc(r2)
			NSString * result_130 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	Partition Scheme: %@" value:@"" table:nil ];
			NSBundle * result_143 = [NSBundle bundleForClass:[DUModule class] ];
				//b	0x6834
		}
		if (fp24 == 1) {
				//lwz	r25,0x9dbc(r2)
			NSString * result_175 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	Partition Scheme: %@" value:@"" table:nil ];
			NSBundle * result_188 = [NSBundle bundleForClass:[DUModule class] ];
				//b	0x6834
		}
		if (fp24 == 2) {
				//lwz	r25,0x9dbc(r2)
			NSString * result_220 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	Partition Scheme: %@" value:@"" table:nil ];
			NSBundle * result_233 = [NSBundle bundleForClass:[DUModule class] ];
				//b	0x6834
		}
		if (fp24 == -1) {
				//lwz	r25,0x9dbc(r2)
			NSString * result_265 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	Partition Scheme: %@" value:@"" table:nil ];
			NSString * result_285 = [[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Unformatted" value:@"" table:nil ];
			UNKNOWN_RES_TYPE result_296 = [DULog log:[NSString ] ];
		}
	}
	if ([os9DriverCheckBox state] != 0) {
		UNKNOWN_RES_TYPE result_331 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	Mac OS 9 Disk Drivers installed" value:@"" table:nil ] ];
	}
		//cmplwi	cr7,r0,0x1
	if ([os9DriverCheckBox state] > 0) {
		if (fp28 == 10) {
	}
	if ([os9DriverCheckBox state] == 0) {
		NSString * result_364 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	1 volume will be erased" value:@"" table:nil ];
			//b	0x6990
	}
	UNKNOWN_RES_TYPE result_393 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	1 volume will be created" value:@"" table:nil ] ];
	if (UKNOWN_OBJECT != 0) {
			//lwz	r26,0x9dbc(r2)
		NSString * result_423 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"		Name       : \U201C%@\U201D" value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_435 = [DULog log:[NSString ] ];
	}
	double result_445 = [[UKNOWN_OBJECT ioKitSize] doubleValue];
	sizeDescriptionStringForSize()
	if (UNKNOWN_CONDITION) {
			//lwz	r26,0x9dbc(r2)
		NSString * result_474 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"		Size       : %@" value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_485 = [DULog log:[NSString ] ];
	}
	if (UKNOWN_OBJECT != 0) {
			//lwz	r26,0x9dbc(r2)
		NSString * result_515 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"		Filesystem : %@\n" value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_522 = [UKNOWN_OBJECT userVisibleName];
		UNKNOWN_RES_TYPE result_533 = [DULog log:[NSString ] ];
	}
		//cmplwi	cr7,r0,0x1
	if (UKNOWN_OBJECT <= 0) {
			//lwz	r26,0x9dbc(r2)
		NSString * result_562 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"		Passes     : %lu" value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_574 = [DULog log:[NSString ] ];
	}
	if (fp28 == 13) {
		UNKNOWN_RES_TYPE result_604 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	35 Pass Secure Erase" value:@"" table:nil ] ];
			//lwz	r3,0xc(r21)
		return [result_604 setGlobalProgressText:0 ];
	}
	if (fp28 == 12) {
		UNKNOWN_RES_TYPE result_648 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	7 Pass Secure Erase" value:@"" table:nil ] ];
			//lwz	r3,0xc(r21)
		return [result_648 setGlobalProgressText:0 ];
	}
	if (fp28 == 11) {
		UNKNOWN_RES_TYPE result_692 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	1 Pass Secure Erase" value:@"" table:nil ] ];
			//lwz	r3,0xc(r21)
		return [result_692 setGlobalProgressText:0 ];
	}
	if (fp28 == 16) {
		UNKNOWN_RES_TYPE result_736 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	35 Pass Erase Free Space" value:@"" table:nil ] ];
			//lwz	r3,0xc(r21)
		return [result_736 setGlobalProgressText:0 ];
	}
	if (fp28 == 15) {
		UNKNOWN_RES_TYPE result_780 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	7 Pass Erase Free Space" value:@"" table:nil ] ];
			//lwz	r3,0xc(r21)
		return [result_780 setGlobalProgressText:0 ];
	}
	if (fp28 == 14) {
		UNKNOWN_RES_TYPE result_824 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	1 Pass Erase Free Space" value:@"" table:nil ] ];
			//lwz	r3,0xc(r21)
		return [result_824 setGlobalProgressText:0 ];
	}
	if (fp28 == 6) {
		UNKNOWN_RES_TYPE result_867 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	Secure Volume Erase" value:@"" table:nil ] ];
	}
		//lwz	r3,0xc(r21)
	return [result_447 setGlobalProgressText:0 ];
}

- (void)logReferenceToDiscRecordingLog
{
}

- (id)safeName
{
	return [namer name:fsIsFAT ];
}

- (BOOL)windowShouldClose:(id)fp8
{
		//lwz	r3,0xc(r3)
	UNKNOWN_RES_TYPE result_12 = [self interfaceLock];
		//rlwinm	r3,r3,0,24,31
	return nil;
}

- (void)eraseOptical:(id)fp8
{
	UNKNOWN_RES_TYPE result_28 = [[DRNotificationCenter currentRunLoopCenter] addObserver:0 selector:49572 name:kDREraseStatusChangedNotification object:0 ];
	if ([fp8 device] != 0) {
		NSString * result_41 = [[fp8 device] displayName];
		if (UNKNOWN_CONDITION) {
			if ([result_41 length] != 0) {
				NSBundle * result_71 = [NSBundle bundleForClass:[self class] ];
				NSString * result_80 = [result_71 localizedStringForKey:@"%@ : \U201C%@\U201D" value:@"" table:nil ];
				NSString * result_99 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Preparing to erase optical media on device" value:@"" table:nil ];
				NSString * result_106 = [NSString stringWithFormat:result_80 ];
					//b	0x9f98
			}
		}
	}
	NSBundle * result_125 = [NSBundle bundleForClass:[self class] ];
	NSString * result_135 = [result_125 localizedStringForKey:@"Preparing to erase optical media" value:@"" table:nil ];
	UNKNOWN_RES_TYPE result_143 = [DULog log:result_135 ];
		//lwz	r26,0xc(r30)
	UNKNOWN_RES_TYPE result_167 = [UKNOWN_OBJECT setGlobalProgressText:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Preparing to erase optical media" value:@"" table:nil ] ];
	if ([[fp8 eraseType] isEqualToString:DREraseTypeQuick ] != 0) {
		UNKNOWN_RES_TYPE result_211 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	Optical erase option: Quick Erase." value:@"" table:nil ] ];
		return [fp8 start];
	}
	UNKNOWN_RES_TYPE result_251 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	Optical erase option: Complete Erase." value:@"" table:nil ] ];
	return [fp8 start];
}

- (BOOL)eraseViewShouldHandleMediaReservations:(id)fp8
{
	holdingMediaReservations = nil;
	return nil;
}

- (void)handleOpticalEraseView:(id)fp8
{
	UNKNOWN_RES_TYPE result_13 = [fp8 eraseObject];
	UNKNOWN_RES_TYPE result_22 = [[result_13 device] acquireMediaReservation];
	UNKNOWN_RES_TYPE result_27 = [result_13 eraseType];
	[self setRunning:YES ];
	BOOL result_44 = [result_27 isEqualToString:DREraseTypeQuick ];
	[self queueJob:result_13 jobType:7 ];
	return [self eraseFinishedForDisk:nil ];
}

- (void)handleOpticalEraseStatusChange:(id)fp8
{
	id result_14 = [fp8 object];
	if (UNKNOWN_CONDITION) {
		if ([result_14 isKindOfClass:[DRErase class] ] != 0) {
			UNKNOWN_RES_TYPE result_39 = [result_14 status];
			if (UNKNOWN_CONDITION) {
				UNKNOWN_RES_TYPE result_52 = [result_39 objectForKey:DRStatusStateKey ];
				if ([result_52 isEqualToString:DRStatusStateDone ] != 0) {
					UNKNOWN_RES_TYPE result_70 = [self workingDisk];
						//fcmpu	cr7,f1,f0
					if ([result_52 isEqualToString:DRStatusStateDone ] != 0) {
						DUTimeElapsedString()
						if (UNKNOWN_CONDITION) {
							UNKNOWN_RES_TYPE result_125 = [DULog log:[NSString stringWithFormat:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Optical erase completed successfully in %@." value:@"" table:nil ] ] ];
						}
					}
					[self eraseFinishedForDisk:[result_70 theDMDisk] ];
					return [self handleOpticalEraseComplete:result_14 ];
				}
				if ([result_52 isEqualToString:DRStatusStateFailed ] != 0) {
					NSBundle * result_184 = [NSBundle bundleForClass:[self class] ];
					UNKNOWN_RES_TYPE result_199 = [DULog log:[result_184 localizedStringForKey:@"Erase of optical media did not complete or completed with an error.\n\nSee the DiscRecording log file, ~/Library/Logs/DiscRecording.log, for additional information." value:@"" table:nil ] ];
					NSString * result_218 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Optical Erase failed" value:@"" table:nil ];
					UNKNOWN_RES_TYPE result_243 = [self simpleModuleAlert:result_218 msg:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Erase of optical media did not complete or completed with an error.\n\nSee the DiscRecording log file, ~/Library/Logs/DiscRecording.log, for additional information." value:@"" table:nil ] err:0 ];
					[self logReferenceToDiscRecordingLog];
					[self eraseFinishedForDisk:nil ];
					return [self handleOpticalEraseComplete:result_14 ];
				}
				if ([result_52 isEqualToString:DRStatusStateErasing ] != 0) {
					UNKNOWN_RES_TYPE result_291 = [result_39 objectForKey:DRStatusEraseTypeKey ];
					double result_304 = [[result_39 objectForKey:DRStatusPercentCompleteKey ] doubleValue];
						//fmul	f1,f1,f0
						//frsp	f31,f1
					UNKNOWN_RES_TYPE result_317 = [result_39 objectForKey:DRStatusProgressInfoKey ];
						//mfcr	r29
					if (UNKNOWN_CONDITION) {
						double result_329 = [[result_317 objectForKey:62524 ] doubleValue];
					}
					if (isDeterminate == 0) {
							//lwz	r3,0xc(r30)
						UNKNOWN_RES_TYPE result_342 = [result_317 setGlobalProgressBarIndeterminate:0 ];
						isDeterminate = 1;
					}
						//fmr	f1,f31
						//lwz	r3,0xc(r30)
					UNKNOWN_RES_TYPE result_351 = [result_317 setGlobalProgressBarValue:DRStatusProgressInfoKey ];
						//lfs	f0,0x4ebc(r2)
						//fcmpu	cr7,f31,f0
					if (isDeterminate > 0) {
							//lwz	r26,0xc(r30)
						return [¦< setGlobalProgressText:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Finishing optical media erase" value:@"" table:nil ] ];
					}
					if ([result_291 isEqualToString:DREraseTypeQuick ] == 0) {
						if ([[DUPreferences sharedPreferences] useTimeEstimateForDiscRecording] != 0) {
								//mtocrf	0x80,r29
							if (UNKNOWN_CONDITION) {
								double result_434 = [[result_317 objectForKey:62556 ] doubleValue];
									//fcmpu	cr7,f1,f0
								if ([[DUPreferences sharedPreferences] useTimeEstimateForDiscRecording] != 0) {
									DUTimeElapsedString()
									if (UNKNOWN_CONDITION) {
											//lwz	r24,0xc(r30)
										return [result_291 setGlobalProgressText:[NSString stringWithFormat:[[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Erasing optical disc. Estimated time: %@" value:@"" table:nil ] ] ];
									}
								}
							}
						}
					}
						//lwz	r26,0xc(r30)
					return [¦< setGlobalProgressText:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Erasing optical media" value:@"" table:nil ] ];
				}
			}
		}
	}
}

- (void)handleOpticalEraseComplete:(id)fp8
{
	UNKNOWN_RES_TYPE result_26 = [[DRNotificationCenter currentRunLoopCenter] removeObserver:0 name:kDREraseStatusChangedNotification object:0 ];
	return [[fp8 device] releaseMediaReservation];
}

- (void)eraseDisk:(id)fp8
{
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
	if (UNKNOWN_CONDITION) {
		NSString * result_137 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Error with disk erase %@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_153 = [DULog log:[NSString stringWithFormat:result_137 ] ];
		NSString * result_172 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Disk Erase failed" value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_198 = [self simpleModuleAlert:result_172 msg:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Disk Erase failed with the error:\n\n%@" value:@"" table:nil ] err:result_108 ];
		[self setRunType:-1 ];
		return [self eraseFinishedForDisk:fp8 ];
	}
}

- (void)eraseVolume:(id)fp8
{
		//mfcr	r24
	if ([[DUDiskController sharedDiskController] diskIsPartOfRAID:fp8 ] != 0) {
		UNKNOWN_RES_TYPE result_36 = [[DUDiskController sharedDiskController] rootDiskWithRAIDSetSlicePartition:fp8 ];
			//mfcr	r24
		if (UNKNOWN_CONDITION) {
	}
	UNKNOWN_RES_TYPE * result_51 = [[DMPartitionDisk ] init];
	UNKNOWN_RES_TYPE result_57 = [result_51 isPartitionBootable:fp8 ];
		//rlwinm	r26,r28,30,31,31
	UNKNOWN_RES_TYPE result_69 = [[DUDiskController sharedDiskController] partitionMapTypeForDisk:fp8 ];
	id result_75 = [self safeName];
	__strong const char * result_84 = [[fp8 diskIdentifier] UTF8String];
	__strong const char * result_89 = [result_75 UTF8String];
	du_log()
	if (result_57 == 0) {
	id result_118 = [[formatTypeMenu selectedItem] representedObject];
	[self setRunType:2 ];
	NSBundle * result_136 = [NSBundle bundleForClass:[self class] ];
	NSString * result_145 = [result_136 localizedStringForKey:@"Preparing to erase" value:@"" table:nil ];
	[self logHeader:fp8 msg:result_145 withFS:result_118 withName:result_75 withMap:result_69 withType:2 withOptions:0 ];
	if (UKNOWN_OBJECT != 0) {
		if (result_69 == 0) {
			UNKNOWN_RES_TYPE result_172 = [result_51 canPartitionBeMadeBootable:fp8 ];
		}
	}
		//mtocrf	0x80,r24
	if (UNKNOWN_CONDITION) {
			//b	0x631c
	}
	[self newEraseDiskDelegate];
	UNKNOWN_RES_TYPE result_194 = [fp8 theDMDisk];
	NSInteger result_213 = [[[ed eraseDisk:result_194 format:result_118 bootable:90229 name:result_75 synchronous:0 ] objectForKey:62652 ] integerValue];
	[result_51 release];
	if (result_213 != 0) {
		NSString * result_249 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Error with volume erase %@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_265 = [DULog log:[NSString stringWithFormat:result_249 ] ];
		NSString * result_284 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Volume Erase failed" value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_310 = [self simpleModuleAlert:result_284 msg:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Volume Erase failed with the error:\n\n%@" value:@"" table:nil ] err:result_213 ];
		[self setRunType:-1 ];
		return [self eraseFinishedForDisk:fp8 ];
	}
}

- (void)zeroDisk:(id)fp8
{
	__strong const char * result_24 = [[fp8 diskIdentifier] UTF8String];
	du_log()
	[self setRunType:3 ];
	NSBundle * result_48 = [NSBundle bundleForClass:[self class] ];
	NSString * result_57 = [result_48 localizedStringForKey:@"Preparing to zero disk" value:@"" table:nil ];
	[self logHeader:fp8 msg:result_57 withFS:nil withName:nil withMap:-3 withType:3 withOptions:0 ];
	[self newEraseDiskDelegate];
	UNKNOWN_RES_TYPE result_91 = [ed zeroDisk:[fp8 theDMDisk] random:0 howMany:0 ];
	if (UNKNOWN_CONDITION) {
		NSString * result_120 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Error with zero disk erase %@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_136 = [DULog log:[NSString stringWithFormat:result_120 ] ];
		NSString * result_155 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Zero Disk failed" value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_181 = [self simpleModuleAlert:result_155 msg:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Zero Disk failed with the error:\n\n%@" value:@"" table:nil ] err:result_91 ];
		[self setRunType:-1 ];
		return [self eraseFinishedForDisk:fp8 ];
	}
	_canSkipJob = result_91;
}

- (void)randomWriteDisk:(id)fp8
{
	__strong const char * result_24 = [[fp8 diskIdentifier] UTF8String];
	du_log()
	[self setRunType:4 ];
	NSBundle * result_48 = [NSBundle bundleForClass:[self class] ];
	NSString * result_57 = [result_48 localizedStringForKey:@"Preparing to write random data to disk" value:@"" table:nil ];
	[self logHeader:fp8 msg:result_57 withFS:nil withName:nil withMap:-3 withType:4 withOptions:0 ];
	[self newEraseDiskDelegate];
	UNKNOWN_RES_TYPE result_91 = [ed zeroDisk:[fp8 theDMDisk] random:1 howMany:7 ];
	if (UNKNOWN_CONDITION) {
		NSString * result_120 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Error with random write disk erase %@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_136 = [DULog log:[NSString stringWithFormat:result_120 ] ];
		NSString * result_155 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Random Write failed" value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_181 = [self simpleModuleAlert:result_155 msg:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Random Write failed with the error:\n\n%@" value:@"" table:nil ] err:result_91 ];
		[self setRunType:-1 ];
		return [self eraseFinishedForDisk:fp8 ];
	}
	_canSkipJob = result_91;
}

- (void)secureDisk:(id)fp8 withJobType:(int)fp12
{
	[self setRunType:fp12 ];
	__strong const char * result_30 = [[fp8 diskIdentifier] UTF8String];
	du_log()
	Class result_44 = [self class];
	NSBundle * result_50 = [NSBundle bundleForClass:result_44 ];
	NSString * result_59 = [result_50 localizedStringForKey:@"Preparing to securely remove data from disk" value:@"" table:nil ];
	[self logHeader:fp8 msg:result_59 withFS:nil withName:nil withMap:-3 withType:fp12 withOptions:0 ];
	[self newEraseDiskDelegate];
	_currentPassCount = nil;
	UNKNOWN_RES_TYPE result_100 = [ed securelyEraseDisk:[fp8 theDMDisk] level:2 zeroFill:0 ];
	if (UNKNOWN_CONDITION) {
		NSString * result_129 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Error with secure disk erase %@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_145 = [DULog log:[NSString stringWithFormat:result_129 ] ];
		NSString * result_164 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Disk Erase failed" value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_190 = [self simpleModuleAlert:result_164 msg:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Disk Erase failed with the error:\n\n%@" value:@"" table:nil ] err:result_100 ];
		[self setRunType:-1 ];
		return [self eraseFinishedForDisk:fp8 ];
	}
	_canSkipJob = result_100;
}

- (void)secureFreeSpace:(id)fp8 withJobType:(int)fp12
{
	[self setRunType:fp12 ];
	__strong const char * result_30 = [[fp8 diskIdentifier] UTF8String];
	du_log()
	Class result_44 = [self class];
	NSBundle * result_50 = [NSBundle bundleForClass:result_44 ];
	NSString * result_59 = [result_50 localizedStringForKey:@"Preparing to secure free space" value:@"" table:nil ];
	[self logHeader:fp8 msg:result_59 withFS:nil withName:nil withMap:-3 withType:fp12 withOptions:0 ];
	[self newEraseDiskDelegate];
	if (fp12 != 14) {
		if (fp12 != 15) {
			if (fp12 != 16) {
		}
	}
	_currentPassCount = nil;
	UNKNOWN_RES_TYPE result_111 = [ed securelyEraseFreespace:[fp8 theDMDisk] level:0 zeroFill:0 ];
	if (UNKNOWN_CONDITION) {
		NSString * result_140 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Error with secure erase free space %@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_156 = [DULog log:[NSString stringWithFormat:result_140 ] ];
		NSString * result_175 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Erase Free Space failed" value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_201 = [self simpleModuleAlert:result_175 msg:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Erase Free Space failed with the error:\n\n%@" value:@"" table:nil ] err:result_111 ];
		[self setRunType:-1 ];
		return [self eraseFinishedForDisk:fp8 ];
	}
	_canSkipJob = result_111;
}

- (void)secureVolume:(id)fp8
{
	[self setRunType:6 ];
	__strong const char * result_28 = [[fp8 diskIdentifier] UTF8String];
	du_log()
	NSBundle * result_47 = [NSBundle bundleForClass:[self class] ];
	NSString * result_56 = [result_47 localizedStringForKey:@"Preparing to securely remove data from volume" value:@"" table:nil ];
	[self logHeader:fp8 msg:result_56 withFS:nil withName:nil withMap:-3 withType:6 withOptions:0 ];
	[self newEraseDiskDelegate];
	id result_80 = [self safeName];
	id result_91 = [[formatTypeMenu selectedItem] representedObject];
	UNKNOWN_RES_TYPE result_108 = [ed eraseDisk:[fp8 theDMDisk] format:result_91 name:result_80 synchronous:0 ];
	if (UNKNOWN_CONDITION) {
		NSString * result_137 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Error with secure volume erase %@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_153 = [DULog log:[NSString stringWithFormat:result_137 ] ];
		NSString * result_172 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Volume Erase failed" value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_198 = [self simpleModuleAlert:result_172 msg:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Volume Erase failed with the error:\n\n%@" value:@"" table:nil ] err:result_108 ];
		[self setRunType:-1 ];
		return [self eraseFinishedForDisk:fp8 ];
	}
}

- (void)partitionDisk:(id)fp8
{
	double result_19 = [[fp8 ioKitSize] doubleValue];
		//fmr	f31,f1
	NSInteger result_26 = [os9DriverCheckBox state];
	id result_37 = [[formatTypeMenu selectedItem] representedObject];
	double result_45 = [[result_37 maximumSize] doubleValue];
		//fcmpu	cr7,f1,f0
	if (UNKNOWN_CONDITION) {
			//fcmpu	cr7,f31,f1
		if (UNKNOWN_CONDITION) {
				//fmr	f31,f1
		}
	}
	id result_61 = [self safeName];
	 * result_67 = [DMPartitionEntry alloc];
		//fmr	f1,f31
	NSMutableArray * result_90 = [NSMutableArray arrayWithObject:[result_67 initWithName:result_61 size:[NSNumber numberWithDouble:fp8 ] filesystem:result_37 ] ];
	id result_105 = [[[DMPartitionMap alloc] initWithPartitions:result_90 ] retain];
	if (UNKNOWN_CONDITION) {
			//b	0x7910
	}
	UNKNOWN_RES_TYPE result_131 = [[[DUDiskController sharedDiskController] dm] preBootEnvironment];
	if (UNKNOWN_CONDITION) {
	UNKNOWN_RES_TYPE result_144 = [[DUDiskController sharedDiskController] partitionMapTypeForDisk:fp8 ];
		//cmplwi	cr7,r3,0x2
	if (UNKNOWN_CONDITION) {
		if ([fp8 isInternal] == 0) {
			if ([[result_37 filesystemType] isEqualToString:@"msdos" ] != 0) {
					//b	0x77c4
			}
		}
			//rlwinm	r26,r0,1,0,30
	}
	UNKNOWN_RES_TYPE result_194 = [result_105 setFormatType:result_144 ];
	[self setRunType:10 ];
	__strong const char * result_208 = [[fp8 diskIdentifier] UTF8String];
	du_log()
	Class result_222 = [self class];
	NSBundle * result_228 = [NSBundle bundleForClass:result_222 ];
	NSString * result_237 = [result_228 localizedStringForKey:@"Preparing to erase" value:@"" table:nil ];
	[self logHeader:fp8 msg:result_237 withFS:result_37 withName:result_61 withMap:result_144 withType:10 withOptions:0 ];
	[self newPartitionDiskDelegate];
	if ([fp8 theDMDisk] != 0) {
		UNKNOWN_RES_TYPE result_279 = [dp partitionDisk:[fp8 theDMDisk] withMap:result_105 includeDrivers:0 formatVolumes:1 ];
		if (UNKNOWN_CONDITION) {
	}
	NSString * result_308 = [[NSBundle bundleForClass:[self theDMDisk] ] localizedStringForKey:@"Error with partition %@" value:@"" table:nil ];
	localizedDiskErrorString()
	UNKNOWN_RES_TYPE result_324 = [DULog log:[NSString stringWithFormat:result_308 ] ];
	NSString * result_343 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Disk Erase failed" value:@"" table:nil ];
	UNKNOWN_RES_TYPE result_369 = [self simpleModuleAlert:result_343 msg:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Disk Erase failed with the error:\n\n%@" value:@"" table:nil ] err:-1 ];
	[self setRunType:-1 ];
	return [self eraseFinishedForDisk:fp8 ];
}

- (void)queueJob:(id)fp8 jobType:(int)fp12
{
	if ([fp8 isKindOfClass:[DUDisk class] ] != 0) {
		NSUInteger result_34 = [jobQueue count];
		__strong const char * result_44 = [[fp8 diskIdentifier] UTF8String];
			//b	0x5990
	}
	NSUInteger result_54 = [jobQueue count];
	__strong const char * result_68 = [[[fp8 device] displayName] UTF8String];
	du_log()
	if (fp8 != 0) {
		if (jobQueue == 0) {
			jobQueue = [[NSMutableArray array] retain];
		}
		NSMutableDictionary * result_107 = [NSMutableDictionary dictionary];
		[result_107 setObject:[NSNumber numberWithInteger:fp12 ] forKey:@"kDU_ERASE_JOBTYPE" ];
		if ([fp8 isKindOfClass:[DUDisk class] ] != 0) {
			[result_107 setObject:[fp8 diskIdentifier] forKey:@"kDU_ERASE_JOBID" ];
			[result_107 setObject:fp8 forKey:@"kDU_ERASE_JOBDISK" ];
			return [jobQueue addObject:result_107 ];
		}
		if ([fp8 isKindOfClass:[DRErase class] ] != 0) {
			[result_107 setObject:fp8 forKey:@"kDU_ERASE_JOBDEVICE" ];
		}
		return [jobQueue addObject:result_107 ];
	}
}

- (id)getQueuedJob
{
	NSEnumerator * result_15 = [jobQueue objectEnumerator];
	id result_22 = [result_15 nextObject];
	if (UNKNOWN_CONDITION) {
		if ([result_22 objectForKey:63116 ] == 0) {
		UNKNOWN_RES_TYPE result_48 = [result_22 setObject:[NSNumber numberWithBool:YES ] forKey:63116 ];
		return result_22;
	}
	[jobQueue release];
	jobQueue = result_22;
	return nil;
}

- (void)eatRemainingJobs
{
	[jobQueue release];
	jobQueue = nil;
}

- (int)diskOptions
{
	int result_10 = [self getOptionsRadioButtonSelection];
		//cmplwi	cr7,r3,0x3
	if (UNKNOWN_CONDITION) {
	return result_10;
}

- (void)optionsRadioButtonAction:(id)fp8
{
	if (optionsZeroDiskRadioButton == fp8) {
		return [self setSpecificOptionsRadioButton:1 ];
	}
	if (fp8 == options7PassRadioButton) {
		return [self setSpecificOptionsRadioButton:2 ];
	}
	if (fp8 == options35PassRadioButton) {
		return [self setSpecificOptionsRadioButton:3 ];
	}
	return [self setSpecificOptionsRadioButton:0 ];
}

- (void)setSpecificOptionsRadioButton:(int)fp8
{
	[optionsNoEraseRadioButton setState:nil ];
	[optionsZeroDiskRadioButton setState:nil ];
	[options7PassRadioButton setState:nil ];
	return [options35PassRadioButton setState:nil ];
}

- (int)getOptionsRadioButtonSelection
{
	if ([optionsZeroDiskRadioButton integerValue] == 0) {
		if ([options7PassRadioButton integerValue] == 0) {
			if ([options35PassRadioButton integerValue] == 0) {
		}
	}
	return 1;
}

- (void)optionsButton:(id)fp8
{
	int result_13 = [self diskOptions];
	lastDiskOptions = result_13;
	UNKNOWN_RES_TYPE result_28 = [[DUPreferences sharedPreferences] runningFromCD];
	[optionsHelpButton setEnabled:NO ];
	NSWindow * result_50 = [eraseButton window];
	return [NSApp beginSheet:optionsPanel modalForWindow:result_50 modalDelegate:self didEndSelector:nil contextInfo:nil ];
}

- (void)optionsOKButton:(id)fp8
{
	[NSApp endSheet:optionsPanel ];
	[optionsPanel orderOut:self ];
	return [self enableButtons];
}

- (void)os9DriverCheckBoxSelected:(id)fp8
{
	lastOS9ButtonSetting = [os9DriverCheckBox integerValue];
}

- (void)optionsCancelButton:(id)fp8
{
	[self setSpecificOptionsRadioButton:lastDiskOptions ];
	[NSApp endSheet:optionsPanel ];
	[optionsPanel orderOut:self ];
	return [self enableButtons];
}

- (void)optionsHelpButton:(id)fp8
{
	NSHelpManager * result_16 = [NSHelpManager sharedHelpManager];
	return [result_16 openHelpAnchor:@"dskutl1033" inBook:[[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Disk Utility Help" value:@"" table:nil ] ];
}

- (void)eraseDiskButton:(id)fp8
{
		//mfcr	r2
	if (_canSkipJob != 0) {
		[eraseButton setEnabled:NO ];
		NSBundle * result_43 = [NSBundle bundleForClass:[self class] ];
		NSString * result_52 = [result_43 localizedStringForKey:@"Skipping\U2026" value:@"" table:nil ];
		[eraseButton setTitle:result_52 ];
			//lwz	r25,0xc(r30)
		UNKNOWN_RES_TYPE result_83 = [bundleForClass: setGlobalProgressText:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Skipping\U2026 " value:@"" table:nil ] ];
		_skipping = 1;
		[eraseButton setNeedsDisplay:1 ];
		[eraseButton performSelectorOnMainThread:@selector(displayIfNeeded) withObject:nil waitUntilDone:YES ];
		UNKNOWN_RES_TYPE result_109 = [DUDiskController sharedDiskController];
			//mtocrf	0x08,r11
		return [result_109 stopProcessWithRef:_canSkipJob ];
	}
	UNKNOWN_RES_TYPE result_131 = [self workingDisk];
	UNKNOWN_RES_TYPE result_142 = [[self diskController] viewablePartitions:result_131 ];
	if ([[DUDiskController sharedDiskController] diskIsPartOfRAID:result_131 ] == 0) {
		if ([result_131 partitionNumber] == 0) {
			if ([[[DUDiskController sharedDiskController] childrenOfRAID:result_131 ] count] != 0) {
					//b	0x4884
			}
		}
	}
	if ([result_131 isRootDisk] != 0) {
			//b	0x4908
	}
	UNKNOWN_RES_TYPE result_218 = [DUDiskController sharedDiskController];
	if ([result_218 diskWithDiskNumber:[result_131 diskNumber] ] != 0) {
		UNKNOWN_RES_TYPE result_240 = [[result_218 diskWithDiskNumber:[result_131 diskNumber] ] diskPropertyForKey:63180 ];
	}
	if ([[DUDiskController sharedDiskController] diskIsPartOfRAID:result_131 ] != 0) {
		NSBundle * result_262 = [NSBundle bundleForClass:[self class] ];
		NSString * result_271 = [result_262 localizedStringForKey:@"WARNING: One or more of the selected volumes is part of a RAID set. Erasing the RAID volume may leave the RAID set unusable.\n\n" value:@"" table:nil ];
			//b	0x49f8
	}
}

- (void)prepareForPacketWritingButton:(id)fp8
{
}

- (void)formatMenuChanged:(id)fp8
{
	BOOL result_28 = [[[[formatTypeMenu selectedItem] representedObject] filesystemType] isEqualToString:@"msdos" ];
	if (UNKNOWN_CONDITION) {
		fsIsFAT = 1;
			//b	0x882c
	}
	fsIsFAT = result_28;
	UNKNOWN_RES_TYPE result_47 = [namer name:fsIsFAT ];
	if (UNKNOWN_CONDITION) {
		if ([[volumeName stringValue] isEqualToString:result_47 ] == 0) {
			[volumeName setStringValue:result_47 ];
		}
	}
	return [self enableButtons];
}

- (void)alertDidEnd:(id)fp8 returnCode:(int)fp12 contextInfo:(void *)fp16
{
		//lfs	f0,0x9ce4(r2)
	_currentJob = nil;
		//stfs	f0,0xe8(r3)
	_totalJobs = nil;
	if (fp12 == 1000) {
		[self setRunning:YES ];
		[[fp8 window] orderOut:self ];
		[eraseButton setEnabled:NO ];
		UNKNOWN_RES_TYPE result_50 = [self workingDisk];
		if ([self diskOptions] == 1) {
			[self queueJob:result_50 jobType:3 ];
				//lfs	f0,0x9ce8(r2)
				//b	0x540c
		}
		if ([self diskOptions] == 2) {
			[self queueJob:result_50 jobType:12 ];
				//lfs	f0,0x9cec(r2)
				//b	0x540c
		}
		if ([self diskOptions] != 3) {
				//b	0x5410
		}
		[self queueJob:result_50 jobType:13 ];
			//lfs	f0,0x9cf0(r2)
			//stfs	f0,0xe8(r30)
			//lwz	r3,0x2c(r30)
		if ([result_97 isWhole] == 0) {
			[self queueJob:result_50 jobType:2 ];
			_totalJobs = [jobQueue count];
			_currentJob = nil;
			return [self eraseFinishedForDisk:nil ];
		}
			//lwz	r5,0x2c(r30)
		if ([self isBelowPartitionThreshold:result_50 ] != 0) {
			[self queueJob:result_50 jobType:1 ];
			_totalJobs = [jobQueue count];
			_currentJob = nil;
			return [self eraseFinishedForDisk:nil ];
		}
		[self queueJob:result_50 jobType:10 ];
		_totalJobs = [jobQueue count];
		_currentJob = nil;
		return [self eraseFinishedForDisk:nil ];
	}
}

- (void)warningOKButton:(id)fp8
{
}

- (void)warningCancelButton:(id)fp8
{
}

- (void)fsOptionsButton:(id)fp8
{
	BOOL result_16 = [fsOptionsButtonMatrix selectCellWithTag:nil ];
	UNKNOWN_RES_TYPE result_29 = [[DUPreferences sharedPreferences] runningFromCD];
	[fsOptionsHelpButton setEnabled:NO ];
	NSWindow * result_51 = [eraseButton window];
	return [NSApp beginSheet:fsOptionsPanel modalForWindow:result_51 modalDelegate:self didEndSelector:nil contextInfo:nil ];
}

- (void)fsOptionsOKButton:(id)fp8
{
	NSInteger result_14 = [fsOptionsButtonMatrix selectedRow];
		//cmplwi	cr7,r3,0x2
	if (UNKNOWN_CONDITION) {
		//lfs	f0,0x5b88(r2)
	_currentJob = nil;
	_totalJobs = nil;
		//stfs	f0,0xe8(r30)
	[self setRunning:YES ];
	[NSApp endSheet:fsOptionsPanel ];
	[fsOptionsPanel orderOut:self ];
	if (result_14 != 1) {
		if (result_14 != 2) {
	}
	[self queueJob:[self workingDisk] jobType:15 ];
	_totalJobs = [jobQueue count];
	return [self eraseFinishedForDisk:nil ];
}

- (void)fsOptionsCancelButton:(id)fp8
{
	[NSApp endSheet:fsOptionsPanel ];
	return [fsOptionsPanel orderOut:self ];
}

- (void)fsOptionsHelpButton:(id)fp8
{
	NSHelpManager * result_16 = [NSHelpManager sharedHelpManager];
	return [result_16 openHelpAnchor:@"dskutl1032" inBook:[[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Disk Utility Help" value:@"" table:nil ] ];
}

- (void)unmountNotification:(id)fp8
{
}

- (void)mountNotification:(id)fp8
{
		//lwz	r26,0xc(r3)
	return [UKNOWN_OBJECT setGlobalProgressText:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Mounting disk" value:@"" table:nil ] ];
}

- (void)ejectFailedNotification:(id)fp8
{
	du_log()
	return [self eraseError:-10000 forDisk:nil ];
}

- (void)unmountFailedNotification:(id)fp8
{
	du_log()
	return [self eraseError:-10000 forDisk:nil ];
}

- (void)setWorkingDisk:(id)fp8
{
	UNKNOWN_RES_TYPE result_14 = [fp8 diskType];
		//cmplwi	cr7,r3,0x1
	if (UNKNOWN_CONDITION) {
		UNKNOWN_RES_TYPE result_26 = [DUDiskController sharedDiskController];
		UNKNOWN_RES_TYPE result_38 = [result_26 diskWithDiskNumber:[fp8 diskNumber] ];
		if ([result_38 isErasableOpticalMedia] != 0) {
	}
		//lwz	r3,0x2c(r27)
	if (fp8 != ([fp8 diskType]-2)) {
		[([fp8 diskType]-2) release];
		id result_62 = [fp8 retain];
		lastOS9ButtonSetting = 1;
			//stw	r3,0x2c(r27)
	}
}

- (void)controlTextDidChange:(id)fp8
{
	if ([fp8 object] == volumeName) {
		id result_29 = [[formatTypeMenu selectedItem] representedObject];
		if (UNKNOWN_CONDITION) {
			UNKNOWN_RES_TYPE result_51 = [namer setUserEnteredName:[volumeName stringValue] ];
			UNKNOWN_RES_TYPE result_64 = [result_29 isValidName:[volumeName stringValue] correctedName:0 ];
			if (UNKNOWN_CONDITION) {
				UNKNOWN_RES_TYPE result_76 = [namer name:fsIsFAT ];
				if ([[volumeName stringValue] isEqualToString:result_76 ] == 0) {
					NSText * result_98 = [volumeName currentEditor];
					UNKNOWN_RES_TYPE result_106 = [result_98 ];
					NSUInteger result_122 = [[volumeName stringValue] length];
					if (result_122 != [result_76 length]) {
						NSBeep();
							//addi	r2,r2,0xffff
					}
					[result_98 setSelectedRange:UKNOWN_OBJECT ];
					[volumeName setStringValue:result_76 ];
					[self enableButtons];
				}
			}
			UNKNOWN_RES_TYPE result_178 = [volumeName ];
			UNKNOWN_RES_TYPE result_184 = [iGv	þôk.@¦÷G^0U#0+ÐiGv	þôk.@¦÷G^0U 00 ];
				//addi	r2,r2,0xffff
			[result_178 setSelectedRange:UKNOWN_OBJECT ];
			NSBeep();
			[volumeName setStringValue:UKNOWN_OBJECT ];
			UNKNOWN_RES_TYPE result_226 = [result_29 isValidName:[namer name:fsIsFAT ] correctedName:0 ];
			if ([UKNOWN_OBJECT isEqualToString:UKNOWN_OBJECT ] == 0) {
				UNKNOWN_RES_TYPE result_243 = [iGv	þôk.@¦÷G^0U#0+ÐiGv	þôk.@¦÷G^0U 00 ];
					//addi	r28,r2,0x1
				if (result_64 <= [[result_178 string] length]) {
				[result_178 setSelectedRange:UKNOWN_OBJECT ];
				[volumeName setStringValue:UKNOWN_OBJECT ];
			}
		}
	}
	UNKNOWN_RES_TYPE result_287 = [self ];
}

- (BOOL)parsePassString:(id)fp8
{
	if ([[fp8 substringToIndex:[@"Pass: " length] ] isEqualToString:@"Pass: " ] != 0) {
		UNKNOWN_RES_TYPE result_39 = [@"Pass: " length];
		UNKNOWN_RES_TYPE result_44 = [fp8 length];
		UNKNOWN_RES_TYPE result_49 = [@"Pass: " length];
			//subf	r29,r3,r29
		_currentPassCount = [[fp8 substringWithRange:result_39 ] integerValue];
		du_log()
	}
	return nil;
}

- (BOOL)isMultiPassJobType
{
	return nil;
}

- (void)updateSinglePassProgressWithTime:(id)fp8
{
	if (UNKNOWN_CONDITION) {
		id result_15 = [self runTypeDescription];
			//lwz	r3,0xc(r30)
		return [result_15 setGlobalProgressText:result_15 ];
	}
	NSString * result_55 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"%@. Estimated time: %@" value:@"" table:nil ];
	id result_61 = [self runTypeDescription];
	NSString * result_68 = [NSString stringWithFormat:result_55 ];
		//lwz	r3,0xc(r30)
	return [result_68 setGlobalProgressText:result_68 ];
}

- (void)updateMultiPassProgressWithTime:(id)fp8
{
	if ([self runType] != 12) {
	if (fp8 == 0) {
		NSString * result_50 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"%@. Pass %ld of %ld." value:@"" table:nil ];
		id result_56 = [self runTypeDescription];
		NSString * result_65 = [NSString stringWithFormat:result_50 ];
			//lwz	r3,0xc(r30)
		return [result_65 setGlobalProgressText:result_65 ];
	}
	NSString * result_106 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"%@. Pass %ld of %ld. Estimated time: %@" value:@"" table:nil ];
	id result_112 = [self runTypeDescription];
	NSString * result_122 = [NSString stringWithFormat:result_106 ];
		//lwz	r3,0xc(r30)
	return [result_122 setGlobalProgressText:result_122 ];
}

- (void)eraseOutput:(id)fp8 forDisk:(id)fp12
{
	if (UNKNOWN_CONDITION) {
		if ([self parsePassString:fp8 ] == 0) {
			UNKNOWN_RES_TYPE result_27 = [DULog log:fp8 ];
				//lwz	r3,0xc(r29)
			return [result_27 setGlobalProgressText:fp8 ];
		}
	}
}

- (void)eraseStartedForDisk:(id)fp8
{
	__strong const char * result_16 = [[fp8 diskIdentifier] UTF8String];
}

- (void)startJob:(id)fp8
{
	UNKNOWN_RES_TYPE result_16 = [fp8 objectForKey:63084 ];
	UNKNOWN_RES_TYPE result_23 = [fp8 objectForKey:63100 ];
	NSInteger result_34 = [[fp8 objectForKey:63052 ] integerValue];
	du_log()
		//cmplwi	cr7,r29,0x10
	if (UNKNOWN_CONDITION) {
			//rlwinm	r0,r29,2,0,29
			//lwzx	r9,r2,r0
			//add	r9,r9,r2
			//bctr
			//.long 0x00000104
			//.long 0x00000044
			//.long 0x00000058
			//.long 0x00000070
			//.long 0x00000084
			//.long 0x00000070
			//.long 0x00000098
			//.long 0x000000ac
			//.long 0x000000ac
			//.long 0x00000104
			//.long 0x000000c0
			//.long 0x00000070
			//.long 0x000000d4
			//.long 0x000000d4
			//.long 0x000000ec
			//.long 0x000000ec
			//.long 0x000000ec
		[self eraseDisk:result_16 ];
			//b	0x6054
		[self eraseVolume:result_16 ];
		return [self enableButtons];
[self zeroDisk:result_16 ];
			//b	0x6054
		[self randomWriteDisk:result_16 ];
			//b	0x6054
		[self secureVolume:result_16 ];
			//b	0x6054
		[self eraseOptical:result_23 ];
			//b	0x6054
		[self partitionDisk:result_16 ];
			//b	0x6054
		[self secureDisk:result_16 withJobType:result_34 ];
		return [self enableButtons];
[self secureFreeSpace:result_16 withJobType:result_34 ];
	}
	return [self enableButtons];
}

- (void)postEraseHandling:(id)fp8
{
	int result_14 = [self runType];
		//cmplwi	cr7,r0,0x11
	if (UNKNOWN_CONDITION) {
			//rlwinm	r0,r0,2,0,29
			//lwzx	r9,r2,r0
			//add	r9,r9,r2
			//bctr
			//.long 0x00000048
			//.long 0x00000378
			//.long 0x00000378
			//.long 0x00000378
			//.long 0x000000c4
			//.long 0x000000c4
			//.long 0x00000378
			//.long 0x00000378
			//.long 0x00000378
			//.long 0x00000378
			//.long 0x00000378
			//.long 0x0000006c
			//.long 0x000000c4
			//.long 0x000000c4
			//.long 0x000000c4
			//.long 0x00000224
			//.long 0x00000224
			//.long 0x00000224
		return [self eatRemainingJobs];
if (fp8 != 0) {
if (getuid() == 0) {
[timeEstimator taskDuration];
					//fmr	f31,f1
				if (_skipping != 0) {
					NSString * result_132 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Erase skipped after %@.\n		 %.1f%% complete." value:@"" table:nil ];
						//fmr	f1,f31
					DUTimeElapsedString()
						//lfs	f0,0xf4(r30)
						//fmr	f1,f0
					NSString * result_152 = [NSString stringWithFormat:result_132 ];
						//b	0x718c
				}
				NSString * result_184 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Erase completed successfully in %@.\n" value:@"" table:nil ];
					//fmr	f1,f31
				DUTimeElapsedString()
				return [DULog log:[NSString stringWithFormat:result_184 ] ];
[timeEstimator taskDuration];
					//fmr	f31,f1
				if (_skipping != 0) {
					NSString * result_253 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Erase Free Space stopped after %@.\n		 %.1f%% complete." value:@"" table:nil ];
						//fmr	f1,f31
					DUTimeElapsedString()
						//lfs	f0,0xf4(r30)
						//fmr	f1,f0
					return [DULog log:[NSString stringWithFormat:result_253 ] ];
				}
				NSString * result_317 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Erase Free Space completed successfully in %@." value:@"" table:nil ];
					//fmr	f1,f31
				DUTimeElapsedString()
				return [DULog log:[NSString stringWithFormat:result_317 ] ];
			}
		}
	}
}

- (BOOL)isBelowPartitionThreshold:(id)fp8
{
	unsigned long long result_16 = [[fp8 ioKitSize] unsignedLongLongValue];
	if (__cmpdi2() > 0) {
		__floatdidf()
			//fcmpu	cr7,f1,f0
		return result_30;
	//mfcr	r3
	//rlwinm	r3,r3,29,31,31
	}
		//rlwinm	r0,r29,31,0,0
		//rlwinm	r10,r30,31,1,31
		//rlwinm	r9,r29,31,1,31
		//or	r10,r0,r10
		//rlwinm	r4,r30,0,31,31
	__floatdidf()
		//fadd	f1,f1,f1
		//fcmpu	cr7,f1,f0
	return result_55;
	//mfcr	r3
	//rlwinm	r3,r3,29,31,31
}

- (void)eraseFinishedForDisk:(id)fp8
{
		//mfcr	r2
	_canSkipJob = nil;
	_currentJob = (_currentJob+1);
	UNKNOWN_RES_TYPE result_29 = [timeEstimator setTaskComplete];
	du_log()
	if (fp8 != 0) {
		[self postEraseHandling:fp8 ];
	}
	id result_50 = [self getQueuedJob];
	if (UNKNOWN_CONDITION) {
		[self startJob:result_50 ];
			//mtocrf	0x08,r11
		return [result_50 release];
	}
	[self setRunning:NO ];
	NSBundle * result_101 = [NSBundle bundleForClass:[self class] ];
	UNKNOWN_RES_TYPE result_115 = [DULog log:[result_101 localizedStringForKey:@"Erase complete." value:@"" table:nil ] ];
	UNKNOWN_RES_TYPE result_120 = [DULog log:61564 ];
		//lwz	r24,0xc(r30)
	UNKNOWN_RES_TYPE result_144 = [nil(0x15b14) setGlobalProgressText:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Erase complete." value:@"" table:nil ] ];
	if (fp8 == 0) {
		UNKNOWN_RES_TYPE result_155 = [[self workingDisk] theDMDisk];
	}
	__strong const char * result_166 = [[fp8 diskIdentifier] UTF8String];
	du_log()
	[self sendCompletionReport:[fp8 diskIdentifier] ];
	UNKNOWN_RES_TYPE result_190 = [DUDiskController sharedDiskController];
	NSNotification * result_204 = [NSNotification notificationWithName:DMDiskChangedNotification object:fp8 ];
		//mtocrf	0x08,r11
	return [result_190 diskChanged:result_204 ];
}

- (void)sendCompletionReport:(id)fp8
{
	NSMutableDictionary * result_15 = [NSMutableDictionary dictionary];
		//lwz	r3,0x2c(r28)
	UNKNOWN_RES_TYPE result_21 = [result_15 diskIdentifier];
	if (UNKNOWN_CONDITION) {
		if (fp8 != 0) {
	}
		//lwz	r4,0x9014(r30)
	UNKNOWN_RES_TYPE result_38 = [result_15 ];
		//b	0x73e0
}

- (void)erasePercentageComplete:(float)fp8 forDisk:(id)fp12
{
		//lfs	f0,0x62e0(r2)
		//fmr	f31,f1
		//fcmpu	cr7,f1,f0
	if (UNKNOWN_CONDITION) {
			//lfs	f0,0x62f8(r28)
			//fcmpu	cr7,f1,f0
		if (UNKNOWN_CONDITION) {
				//b	0x8d24
		}
	}
	if (_skipping == 0) {
			//stfs	f31,0xf4(r30)
		if (isDeterminate == 0) {
			[timeEstimator release];
			 * result_53 = [[DUTimeEstimator alloc] init];
			doDisplay = 1;
			timeEstimator = result_53;
				//lwz	r3,0xc(r30)
			UNKNOWN_RES_TYPE result_63 = [result_53 setGlobalProgressBarIndeterminate:0 ];
			isDeterminate = 1;
			if (_canSkipJob != 0) {
				[eraseButton setEnabled:YES ];
			}
			if ([self isMultiPassJobType] != 0) {
				[self updateMultiPassProgressWithTime:nil ];
					//b	0x8e84
			}
			[self updateSinglePassProgressWithTime:nil ];
				//b	0x8e84
		}
		if (_currentJob == 1) {
				//cmplwi	cr7,r0,0x1
			if (_currentJob <= 1) {
				doDisplay = úÎ;
					//lfs	f0,0xe8(r30)
					//fmuls	f1,f31,f0
					//b	0x8ebc
			}
				//fmr	f1,f31
			UNKNOWN_RES_TYPE result_132 = [timeEstimator timeEstimateString:fp8 ];
			if ([self isMultiPassJobType] != 0) {
				[self updateMultiPassProgressWithTime:result_132 ];
					//b	0x8e84
			}
			[self updateSinglePassProgressWithTime:result_132 ];
				//b	0x8e84
		}
	}
	if (_skipping == 1) {
			//lfs	f0,0xe8(r30)
			//fmuls	f1,f31,f0
			//b	0x8ebc
	}
		//lfs	f13,0xe8(r30)
		//lfs	f0,0x62f8(r28)
		//fmr	f11,f13
		//fmuls	f13,f13,f0
		//fsub	f0,f0,f11
		//fmadd	f12,f31,f0,f13
		//frsp	f1,f12
		//lwz	r3,0xc(r30)
	UNKNOWN_RES_TYPE result_183 = [self setGlobalProgressBarValue:fp8 ];
		//lfs	f0,0x62f8(r28)
		//fcmpu	cr7,f31,f0
		//cror	30,29,30
	if (_skipping == 1) {
		return [timeEstimator setTaskComplete];
	}
}

- (void)eraseError:(int)fp8 forDisk:(id)fp12
{
		//lwz	r26,0xc(r3)
	NSBundle * result_28 = [NSBundle bundleForClass:[self class] ];
	UNKNOWN_RES_TYPE result_42 = [UKNOWN_OBJECT setGlobalProgressText:[result_28 localizedStringForKey:@"Erase error occurred." value:@"" table:nil ] ];
	int result_47 = [self runType];
		//cmplwi	cr7,r3,0x10
	if (UNKNOWN_CONDITION) {
			//rlwinm	r0,r3,2,0,29
			//lwzx	r9,r2,r0
			//add	r9,r9,r2
			//bctr
			//.long 0x000007a4
			//.long 0x00000044
			//.long 0x00000130
			//.long 0x0000021c
			//.long 0x00000308
			//.long 0x0000021c
			//.long 0x000003f4
			//.long 0x000004e0
			//.long 0x000004e0
			//.long 0x000007a4
			//.long 0x00000044
			//.long 0x0000021c
			//.long 0x000005cc
			//.long 0x000005cc
			//.long 0x000006b8
			//.long 0x000006b8
			//.long 0x000006b8
		Class result_88 = [self class];
		NSBundle * result_94 = [NSBundle bundleForClass:result_88 ];
		NSString * result_101 = [result_94 localizedStringForKey:@"Disk Erase failed with the error:\n\n%@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_117 = [DULog log:[NSString stringWithFormat:result_101 ] ];
		NSString * result_136 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Disk Erase failed" value:@"" table:nil ];
			//b	0x8698
		Class result_156 = [self class];
		NSBundle * result_162 = [NSBundle bundleForClass:result_156 ];
		NSString * result_169 = [result_162 localizedStringForKey:@"Volume Erase failed with the error:\n\n%@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_185 = [DULog log:[NSString stringWithFormat:result_169 ] ];
		NSString * result_204 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Volume Erase failed" value:@"" table:nil ];
			//b	0x8698
		Class result_224 = [self class];
		NSBundle * result_230 = [NSBundle bundleForClass:result_224 ];
		NSString * result_237 = [result_230 localizedStringForKey:@"Zero Disk failed with the error:\n\n%@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_253 = [DULog log:[NSString stringWithFormat:result_237 ] ];
		NSString * result_272 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Zero Disk failed" value:@"" table:nil ];
			//b	0x8698
		Class result_292 = [self class];
		NSBundle * result_298 = [NSBundle bundleForClass:result_292 ];
		NSString * result_305 = [result_298 localizedStringForKey:@"Random Write failed with the error:\n\n%@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_321 = [DULog log:[NSString stringWithFormat:result_305 ] ];
		NSString * result_340 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Random Write failed" value:@"" table:nil ];
			//b	0x8698
		Class result_360 = [self class];
		NSBundle * result_366 = [NSBundle bundleForClass:result_360 ];
		NSString * result_373 = [result_366 localizedStringForKey:@"Secure Volume Erase failed with the error:\n\n%@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_389 = [DULog log:[NSString stringWithFormat:result_373 ] ];
		NSString * result_408 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Volume Erase failed" value:@"" table:nil ];
			//b	0x8698
		Class result_428 = [self class];
		NSBundle * result_434 = [NSBundle bundleForClass:result_428 ];
		NSString * result_441 = [result_434 localizedStringForKey:@"Optical Erase failed with the error:\n\n%@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_457 = [DULog log:[NSString stringWithFormat:result_441 ] ];
		NSString * result_476 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Optical Erase failed" value:@"" table:nil ];
			//b	0x8698
		Class result_496 = [self class];
		NSBundle * result_502 = [NSBundle bundleForClass:result_496 ];
		NSString * result_509 = [result_502 localizedStringForKey:@"Secure Disk Erase failed with the error:\n\n%@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_525 = [DULog log:[NSString stringWithFormat:result_509 ] ];
		NSString * result_544 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Disk Erase failed" value:@"" table:nil ];
			//b	0x8698
		Class result_564 = [self class];
		NSBundle * result_570 = [NSBundle bundleForClass:result_564 ];
		NSString * result_577 = [result_570 localizedStringForKey:@"Secure Erase Free Space failed with the error:\n\n%@" value:@"" table:nil ];
		localizedDiskErrorString()
		UNKNOWN_RES_TYPE result_593 = [DULog log:[NSString stringWithFormat:result_577 ] ];
		NSString * result_612 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Secure Erase Free Space failed" value:@"" table:nil ];
			//b	0x8698
	}
	Class result_632 = [self class];
	NSBundle * result_638 = [NSBundle bundleForClass:result_632 ];
	NSString * result_645 = [result_638 localizedStringForKey:@"Disk Utility failed during an unspecified action with the error:\n\n%@" value:@"" table:nil ];
	localizedDiskErrorString()
	UNKNOWN_RES_TYPE result_661 = [DULog log:[NSString stringWithFormat:result_645 ] ];
	NSString * result_680 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Disk Utility failed" value:@"" table:nil ];
	UNKNOWN_RES_TYPE result_705 = [self simpleModuleAlert:result_680 msg:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Disk Utility failed during an unspecified action with the error:\n\n%@" value:@"" table:nil ] err:fp8 ];
	[self setRunType:-1 ];
	return [self eraseFinishedForDisk:fp12 ];
}

- (void)eraseOutputData:(id)fp8 forDisk:(id)fp12
{
	UNKNOWN_RES_TYPE result_16 = [DULog log:fp8 ];
		//lwz	r3,0xc(r28)
	return [result_16 setGlobalProgressText:fp8 ];
}

- (void)updatePermissions:(id)fp8
{
}

- (void)partitionOutput:(id)fp8 forDisk:(id)fp12
{
	return [self eraseOutput:fp8 forDisk:fp12 ];
}

- (void)partitionStartedForDisk:(id)fp8
{
	return [self eraseStartedForDisk:fp8 ];
}

- (void)partitionFinishedForDisk:(id)fp8
{
	return [self eraseFinishedForDisk:fp8 ];
}

- (void)partitionPercentageComplete:(float)fp8 forDisk:(id)fp12
{
	return [self erasePercentageComplete:fp8 forDisk:fp12 ];
}

- (void)partitionError:(int)fp8 forDisk:(id)fp12
{
	return [self eraseError:fp8 forDisk:fp12 ];
}

- (BOOL)supportsContextMenuForDiskType:(int)fp8
{
		//cmplwi	cr7,r5,0xb
	if (UNKNOWN_CONDITION) {
			//slw	r0,r0,r5
			//andi.	r2,r0,0x99e
			//bnelr
	}
	return nil;
}

- (BOOL)displayPanelForDiskType:(int)fp8 andDisk:(id)fp12
{
		//cmplwi	cr7,r5,0xb
	if (UNKNOWN_CONDITION) {
			//slw	r0,r0,r5
			//andi.	r2,r0,0x914
		if (UNKNOWN_CONDITION) {
				//andi.	r2,r0,0xa
			if (UNKNOWN_CONDITION) {
					//andi.	r2,r0,0x80
				if (UNKNOWN_CONDITION) {
			}
		}
	}
	return self;
}


@end
