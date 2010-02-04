@implementation DUASR

- (id)init
{
	DUASR * result_20 = [self init];
	if (UNKNOWN_CONDITION) {
			//stw	r0,0x64(r2)
			//stw	r0,0x68(r2)
			//stb	r0,0x6c(r2)
			//stw	r0,0x70(r2)
			//stw	r0,0x60(r2)
		BOOL result_43 = [NSBundle loadNibNamed:@"ASR" owner:result_20 ];
		[[NSNotificationCenter defaultCenter] addObserver:result_20 selector:@selector(interfaceLockChanged:) name:_DUInterfaceLockedNotification object:nil ];
		[[NSNotificationCenter defaultCenter] addObserver:result_20 selector:@selector(interfaceLockChanged:) name:_DUInterfaceUnlockedNotification object:nil ];
	}
	return nil;
}

- (void)awakeFromNib
{
	[sourceText registerForDraggedTypes:[NSArray arrayWithObjects:28744 ] ];
	[targetText registerForDraggedTypes:[NSArray arrayWithObjects:28744 ] ];
	[skipChecksumCheckbox setState:nil ];
	_skipState = [skipChecksumCheckbox state];
	NSString * result_82 = [instructionalTextField stringValue];
	if (UNKNOWN_CONDITION) {
		if ([result_82 length] == 0) {
	}
		//b	0x1078
}

- (void)cleanup
{
	[sourceText unregisterDraggedTypes];
	[targetText unregisterDraggedTypes];
	UNKNOWN_RES_TYPE result_25 = [sourceText setDragDelegate:0 ];
	UNKNOWN_RES_TYPE result_44 = [[targetText setDragDelegate:0 ] cleanup];
}

- (void)dealloc
{
	[_sourceFullName release];
	[_targetVol release];
	[_srcVol release];
	if (_doneTimer != 0) {
		[_doneTimer invalidate];
		_doneTimer = nil;
	}
	[_warnMsg release];
	[_stageEstimator release];
	[_globalEstimator release];
	[_stageString release];
	[[_restoreButtonTitle release] dealloc];
}

- (id)dataType
{
	return @"ASR";
}

- (id)displayName
{
	NSBundle * result_19 = [NSBundle bundleForClass:[self class] ];
	return [NSBundle bundleForClass:[self class] ];
}

- (BOOL)shouldRunOnThisConfig
{
	if ([[NSUserDefaults standardUserDefaults] objectForKey:&DUModule_ASR ] != 0) {
		BOOL result_35 = [[NSUserDefaults standardUserDefaults] boolForKey:&DUModule_ASR ];
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
	return [NSNumber numberWithInteger:nil(0x46) ];
}

- (void)helpButtonAction:(id)fp8
{
	NSHelpManager * result_16 = [NSHelpManager sharedHelpManager];
	return [result_16 openHelpAnchor:@"dskutl1036" inBook:[[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Disk Utility Help" value:@"" table:nil ] ];
}

- (void)selectionDidChange:(id)fp8
{
	if ([self currentActiveTab] != 0) {
			//lwz	r3,0xc(r30)
		UNKNOWN_RES_TYPE result_32 = [self setWorkingDisk:[[[self currentActiveTab] allSelectedItems] lastObject] ];
		return [self enableButtons];
	}
}

- (void)diskChangedHandler:(id)fp8
{
	if ([self currentActiveTab] != 0) {
		if (fp8 != 0) {
			if ([fp8 object] != 0) {
				id result_35 = [fp8 object];
				if ([result_35 isKindOfClass:[DUDisk class] ] != 0) {
					id result_56 = [fp8 object];
					if ([result_56 ejected] != 0) {
						UNKNOWN_RES_TYPE result_70 = [result_56 diskNumber];
						if (result_70 == [[self srcVol] diskNumber]) {
							[self setSourceVol:nil ];
						}
						UNKNOWN_RES_TYPE result_93 = [result_56 diskNumber];
						if (result_93 == [[self targetVol] diskNumber]) {
								//b	0x497c
						}
					}
					if ([result_56 ] != 0) {
						if ([[result_56 ] length] == 0) {
					}
					UNKNOWN_RES_TYPE result_141 = [result_56 diskIdentifier];
					if ([result_141 isEqualToString:[[self srcVol] diskIdentifier] ] != 0) {
						if (UKNOWN_OBJECT != 0) {
								//b	0x48f0
						}
						[self setSourceVol:result_56 ];
					}
					UNKNOWN_RES_TYPE result_179 = [result_56 diskIdentifier];
					if ([result_179 isEqualToString:[[self targetVol] diskIdentifier] ] != 0) {
						if ([eraseTargetCheckbox state] == 0) {
							if (UKNOWN_OBJECT != 0) {
								return [self setDestinationVol:nil ];
							}
						}
						return [self setDestinationVol:result_56 ];
					}
				}
			}
		}
	}
}

- (void)interfaceLockChanged:(id)fp8
{
	return [self enableButtons];
}

- (void)setRunning:(BOOL)fp8
{
	if (UNKNOWN_CONDITION) {
		if (_isRunning == 0) {
				//lwz	r3,0xc(r3)
			UNKNOWN_RES_TYPE result_22 = [self setInterfaceLock];
				//lfs	f1,0x3898(r2)
				//lwz	r3,0xc(r30)
			UNKNOWN_RES_TYPE result_29 = [result_22 setGlobalProgressBarValue:fp8 ];
				//lwz	r3,0xc(r30)
			UNKNOWN_RES_TYPE result_36 = [result_29 setGlobalProgressText:28776 ];
				//lwz	r3,0xc(r30)
			UNKNOWN_RES_TYPE result_42 = [result_36 activateGlobalProgressBar:1 ];
				//lwz	r3,0xc(r30)
			UNKNOWN_RES_TYPE result_48 = [result_42 activateGlobalProgressText:1 ];
				//lwz	r3,0xc(r30)
			UNKNOWN_RES_TYPE result_54 = [result_48 setGlobalProgressBarIndeterminate:1 ];
				//lwz	r3,0xc(r30)
			UNKNOWN_RES_TYPE result_60 = [result_54 startGlobalProgressBarAnimation:0 ];
			[self setCancelFlag:NO ];
			_isRunning = 1;
			return [self enableButtons];
		}
	}
		//lwz	r3,0xc(r3)
		//lwz	r4,0x4990(r4)
	UNKNOWN_RES_TYPE result_87 = [self ];
		//lwz	r3,0xc(r30)
	UNKNOWN_RES_TYPE result_93 = [result_87 activateGlobalProgressBar:0 ];
		//lwz	r3,0xc(r30)
	UNKNOWN_RES_TYPE result_99 = [result_93 activateGlobalProgressText:0 ];
	_isRunning = fp8;
	return [self enableButtons];
}

- (void)enableButtons
{
	if ([[[self utilityView] window] isMainWindow] != 0) {
			//lwz	r3,0xc(r30)
		if ([[[[self utilityView] window] isMainWindow] interfaceLock] != 0) {
			[self disableAllButtons];
			if (_cancelFlag != 0) {
				NSString * result_55 = [restoreButton title];
				NSBundle * result_68 = [NSBundle bundleForClass:[DUModule class] ];
				if ([result_55 isEqualToString:[result_68 localizedStringForKey:@"Stopping" value:@"" table:nil ] ] == 0) {
					[restoreButton setTitle:[[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Stopping" value:@"" table:nil ] ];
				}
				[restoreButton setEnabled:NO ];
					//lwz	r3,0x4(r30)
				return [result_121 setNeedsDisplay:YES ];
			}
			if (_isRunning != 0) {
				NSString * result_152 = [restoreButton title];
				NSBundle * result_165 = [NSBundle bundleForClass:[DUModule class] ];
				if ([result_152 isEqualToString:[result_165 localizedStringForKey:@"Stop" value:@"" table:nil ] ] == 0) {
					[restoreButton setTitle:[[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Stop" value:@"" table:nil ] ];
				}
				[restoreButton setEnabled:YES ];
			}
				//lwz	r3,0x4(r30)
			return [result_37 setNeedsDisplay:YES ];
		}
		if ([[self workingDisk] isXsanDisk] != 0) {
	}
		//lwz	r4,0x6dc8(r4)
	UNKNOWN_RES_TYPE result_248 = [self ];
		//lwz	r3,0x4(r30)
	return [result_248 setNeedsDisplay:YES ];
}

- (void)disableAllButtons
{
	[eraseTargetCheckbox setEnabled:NO ];
	[skipChecksumCheckbox setEnabled:NO ];
	[sourceText setEnabled:NO ];
	[targetText setEnabled:NO ];
	[restoreButton setEnabled:NO ];
	[sourceIcon setEnabled:NO ];
	[targetIcon setEnabled:NO ];
	return [chooseSourceButton setEnabled:NO ];
}

- (void)setTargetVol:(id)fp8
{
	if (_targetVol != fp8) {
		[_targetVol release];
		_targetVol = [fp8 retain];
	}
}

- (id)targetVol
{
	return _targetVol;
}

- (void)setSrcVol:(id)fp8
{
	if (_srcVol != fp8) {
		[_srcVol release];
		_srcVol = [fp8 retain];
	}
}

- (id)srcVol
{
	return _srcVol;
}

- (void)setSourceVol:(id)fp8
{
	if (UNKNOWN_CONDITION) {
		UNKNOWN_RES_TYPE result_17 = [sourceText setToolTip:fp8 ];
		[sourceText setStringValue:@"" ];
		[_sourceFullName release];
		_sourceFullName = fp8;
		[self setSrcVol:nil ];
		[sourceIcon setImage:nil ];
		return [self enableButtons];
	}
	if ([fp8 isKindOfClass:[NSMenuItem class] ] != 0) {
		UNKNOWN_RES_TYPE result_81 = [fp8 representedObject];
		if (UNKNOWN_CONDITION) {
	}
		//lwz	r3,0x6000(r3)
	if ([fp8 isKindOfClass:[UKNOWN_OBJECT class] ] != 0) {
		if ([fp8 needsPseudoPartitionDisk] != 0) {
			if ([fp8 volumeName] != 0) {
				if ([[fp8 volumeName] length] != 0) {
						//b	0x2464
				}
			}
		}
		[sourceText setStringValue:[fp8 displayName] ];
		if ([fp8 isKindOfClass:[DUDiskOfflineDiskImage class] ] != 0) {
			UNKNOWN_RES_TYPE result_178 = [fp8 diskImagePath];
				//b	0x24fc
		}
		UNKNOWN_RES_TYPE result_185 = [fp8 mountPoint];
		UNKNOWN_RES_TYPE result_192 = [fp8 deviceNode];
		UNKNOWN_RES_TYPE result_206 = [sourceText setToolTip:[result_185 stringByAppendingFormat:28872 ] ];
		[_sourceFullName release];
		if ([fp8 isDiskImage] != 0) {
				//b	0x2554
		}
		UNKNOWN_RES_TYPE result_230 = [fp8 mountPoint];
		_sourceFullName = [result_230 copy];
		[self setSrcVol:fp8 ];
		[sourceIcon setImage:[fp8 displayIcon] ];
		return [self enableButtons];
	}
}

- (void)setDestinationVol:(id)fp8
{
	if (UNKNOWN_CONDITION) {
		UNKNOWN_RES_TYPE result_17 = [targetText setToolTip:fp8 ];
		[targetText setStringValue:@"" ];
		[targetIcon setImage:nil ];
		[self setTargetVol:nil ];
		return [self enableButtons];
	}
	if ([fp8 isKindOfClass:[NSMenuItem class] ] != 0) {
		UNKNOWN_RES_TYPE result_73 = [fp8 representedObject];
		if (UNKNOWN_CONDITION) {
	}
		//lwz	r3,0x5ca8(r3)
	if ([fp8 isKindOfClass:[UKNOWN_OBJECT class] ] != 0) {
		if ([fp8 needsPseudoPartitionDisk] != 0) {
			if ([fp8 volumeName] != 0) {
				if ([[fp8 volumeName] length] != 0) {
						//b	0x27ac
				}
			}
		}
		[targetText setStringValue:[fp8 displayName] ];
		UNKNOWN_RES_TYPE result_156 = [fp8 mountPoint];
		UNKNOWN_RES_TYPE result_162 = [fp8 deviceNode];
		if (result_156 != 0) {
			if ([result_156 length] != 0) {
				UNKNOWN_RES_TYPE result_184 = [result_156 stringByAppendingFormat:28872 ];
					//b	0x2830
			}
		}
		UNKNOWN_RES_TYPE result_194 = [targetText setToolTip:result_162 ];
		[self setTargetVol:fp8 ];
		[targetIcon setImage:[fp8 displayIcon] ];
		return [self enableButtons];
	}
}

- (void)chooseSource:(id)fp8
{
	NSOpenPanel * result_15 = [NSOpenPanel openPanel];
	NSArray * result_28 = [NSArray arrayWithObjects:28888 ];
	UNKNOWN_RES_TYPE result_35 = [sourceText window];
	[result_15 beginSheetForDirectory:nil file:nil types:result_28 modalForWindow:result_35 modalDelegate:self didEndSelector:@selector(openPanelDidEnd:returnCode:contextInfo:) contextInfo:UKNOWN_OBJECT ];
}

- (void)openPanelDidEnd:(id)fp8 returnCode:(int)fp12 contextInfo:(void *)fp16
{
	if (fp12 == 1) {
		id result_25 = [[fp8 filenames] objectAtIndex:nil ];
		UNKNOWN_RES_TYPE result_37 = [[self diskController] addNotifyDiskImagePath:result_25 atIndex:-1 ];
		id result_42 = [result_25 retain];
		_sourceFullName = result_42;
		[sourceText setStringValue:[result_25 lastPathComponent] ];
		UNKNOWN_RES_TYPE result_66 = [sourceText setToolTip:_sourceFullName ];
		[sourceIcon setImage:GetDUIconByType() ];
	}
	return [self enableButtons];
}

- (void)restoreButton:(id)fp8
{
	if (_isRunning != 0) {
		[self setCancelFlag:YES ];
		[restoreButton setEnabled:NO ];
		NSString * result_55 = [[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Stopping" value:@"" table:nil ];
		[restoreButton setTitle:result_55 ];
			//lwz	r25,0xc(r30)
		NSBundle * result_74 = [NSBundle bundleForClass:[self class] ];
		NSString * result_83 = [result_74 localizedStringForKey:@"Stopping\U2026" value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_89 = [restoreButton setGlobalProgressText:result_83 ];
		UNKNOWN_RES_TYPE result_94 = [DULog log:28776 ];
		return [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Stopping\U2026" value:@"" table:nil ] ];
	}
	id result_131 = [self targetVol];
	NSInteger result_138 = [eraseTargetCheckbox state];
	partOfRAID = [[DUDiskController sharedDiskController] diskIsPartOfRAID:result_131 ];
	if ([[DUDiskController sharedDiskController] diskIsPartOfRAID:result_131 ] == 0) {
		if ([result_131 partitionNumber] == 0) {
			if ([[[DUDiskController sharedDiskController] childrenOfRAID:result_131 ] count] != 0) {
				partOfRAID = 1;
					//b	0x2b68
			}
			partOfRAID = [[DUDiskController sharedDiskController] diskHasRAIDSliceChildren:result_131 ];
		}
	}
	isIPod = nil;
	if ([result_131 isRootDisk] != 0) {
			//b	0x2bf0
	}
	UNKNOWN_RES_TYPE result_218 = [DUDiskController sharedDiskController];
	if ([result_218 diskWithDiskNumber:[result_131 diskNumber] ] != 0) {
		UNKNOWN_RES_TYPE result_240 = [[result_218 diskWithDiskNumber:[result_131 diskNumber] ] diskPropertyForKey:28936 ];
		isIPod = nil;
	}
	if (result_138 == 1) {
		NSString * result_276 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Erase and Restore to Disk" value:@"" table:nil ];
		NSString * result_295 = [[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Erase" value:@"" table:nil ];
		if (partOfRAID != 0) {
			NSString * result_321 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"WARNING: The volume is part of a RAID set. Erasing the RAID volume may leave the RAID set unusable." value:@"" table:nil ];
			NSBundle * result_333 = [NSBundle bundleForClass:[self class] ];
				//b	0x2ec0
		}
		if (isIPod != 0) {
			NSString * result_362 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"WARNING: This disk is an iPod. Erasing an iPod will disable some of the iPod functionality." value:@"" table:nil ];
		}
		NSBundle * result_374 = [NSBundle bundleForClass:[self class] ];
			//b	0x2ec0
	}
	NSString * result_401 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Restore to Disk" value:@"" table:nil ];
	NSString * result_420 = [[NSBundle bundleForClass:[DUModule class] ] localizedStringForKey:@"Restore" value:@"" table:nil ];
	if (partOfRAID != 0) {
		NSBundle * result_438 = [NSBundle bundleForClass:[self class] ];
			//b	0x2e80
	}
	if (isIPod != 0) {
		NSString * result_467 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"WARNING: This disk is an iPod. Restoring to an iPod may disable some of the iPod functionality." value:@"" table:nil ];
	}
	NSString * result_486 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Restoring will write all source volume data over the destination volume data with the same name and file location. All other data will be preserved on the destination volume.\n\n%@Are you sure you wish to restore the volume \U201C%@\U201D?" value:@"" table:nil ];
	if (nil == 0) {
			//b	0x2f0c
	}
	NSString * result_504 = [NSString stringWithFormat:@"%@\n\n" ];
	NSString * result_513 = [result_131 displayName];
	NSString * result_520 = [NSString stringWithFormat:result_486 ];
	NSBundle * result_536 = [NSBundle bundleForClass:[DUModule class] ];
	NSString * result_544 = [result_536 localizedStringForKey:@"Cancel" value:@"" table:nil ];
	NSAlert * result_554 = [NSAlert alertWithMessageText:result_401 defaultButton:result_420 alternateButton:result_544 otherButton:nil informativeTextWithFormat:result_520 ];
	NSArray * result_559 = [result_554 buttons];
	id result_564 = [result_559 objectAtIndex:nil ];
	[result_564 setKeyEquivalent:@"" ];
	[result_564 setTag:nil(0x3e8) ];
	id result_579 = [result_559 objectAtIndex:1 ];
" ];    [result_579 setKeyEquivalent:@"
	[result_579 setTag:nil(0x3e9) ];
	return [result_554 beginSheetModalForWindow:[[self utilityView] window] modalDelegate:self didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:) contextInfo:nil ];
}

- (void)alertDidEnd:(id)fp8 returnCode:(int)fp12 contextInfo:(void *)fp16
{
	if (fp12 == 1000) {
		[[fp8 window] orderOut:self ];
		return [self doRestore];
	}
}

- (void)logRestoreAction
{
		//mfcr	r2
	NSBundle * result_32 = [NSBundle bundleForClass:[self class] ];
	UNKNOWN_RES_TYPE result_46 = [DULog log:[result_32 localizedStringForKey:@"Restore Disk" value:@"" table:nil ] ];
	NSString * result_68 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	 Source: \U201C%@\U201D" value:@"" table:nil ];
	NSString * result_74 = [sourceText stringValue];
	UNKNOWN_RES_TYPE result_85 = [DULog log:[NSString stringWithFormat:result_68 ] ];
	NSString * result_107 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	 Destination: \U201C%@\U201D" value:@"" table:nil ];
	NSString * result_113 = [targetText stringValue];
	UNKNOWN_RES_TYPE result_124 = [DULog log:[NSString stringWithFormat:result_107 ] ];
	NSInteger result_129 = [eraseTargetCheckbox state];
	if (nil != 0) {
		NSBundle * result_151 = [NSBundle bundleForClass:[self class] ];
			//b	0x3adc
	}
	UNKNOWN_RES_TYPE result_178 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	 Erase Destination: No" value:@"" table:nil ] ];
	if ([skipChecksumCheckbox isHidden] == 0) {
		if ([skipChecksumCheckbox state] == 1) {
			NSBundle * result_210 = [NSBundle bundleForClass:[self class] ];
				//b	0x3b90
		}
		UNKNOWN_RES_TYPE result_237 = [DULog log:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"	 Skip Checksum: No" value:@"" table:nil ] ];
	}
	if (nil != 0) {
		if (partOfRAID != 0) {
			NSString * result_267 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"WARNING: The volume is part of a RAID set. Erasing the RAID volume may leave the RAID set unusable." value:@"" table:nil ];
			UNKNOWN_RES_TYPE result_279 = [DULog log:[NSString stringWithFormat:@"	 %@" ] ];
		}
		if (isIPod != 0) {
			NSString * result_307 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"WARNING: This disk is an iPod. Erasing an iPod will disable some of the iPod functionality." value:@"" table:nil ];
			UNKNOWN_RES_TYPE result_320 = [DULog log:[NSString stringWithFormat:@"	 %@" ] ];
				//mtocrf	0x08,r11
			return [DULog log:28776 ];
		}
	}
	if ((-([eraseTargetCheckbox state]^1)) != 0) {
		NSString * result_363 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"WARNING: The volume is part of a RAID set. Restoring data to the RAID volume may leave the RAID set unusable." value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_375 = [DULog log:[NSString stringWithFormat:@"	 %@" ] ];
	}
	if (isIPod != 0) {
		NSString * result_403 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"WARNING: This disk is an iPod. Restoring to an iPod may disable some of the iPod functionality." value:@"" table:nil ];
		UNKNOWN_RES_TYPE result_415 = [DULog log:[NSString stringWithFormat:@"	 %@" ] ];
	}
		//mtocrf	0x08,r11
	return [DULog log:28776 ];
}

- (void)doRestore
{
	[self disableAllButtons];
		//lwz	r3,0x4(r30)
	[result_11 setNeedsDisplay:YES ];
		//lwz	r3,0x4(r30)
	[result_17 performSelectorOnMainThread:@selector(displayIfNeeded) withObject:nil waitUntilDone:YES ];
	id result_31 = [self buildExecutionDictionary];
	RestoreOperation()
	if (UNKNOWN_CONDITION) {
		return [self error:result_38 ];
	}
	_globalEstimator = [[DUTimeEstimator alloc] init];
	[self setRunning:YES ];
	[self logRestoreAction];
	NSBundle * result_96 = [NSBundle bundleForClass:[self class] ];
	NSString * result_106 = [result_96 localizedStringForKey:@"Starting Restore\U2026" value:@"" table:nil ];
	UNKNOWN_RES_TYPE result_112 = [DULog log:result_106 ];
		//lwz	r28,0xc(r30)
	return [DULog setGlobalProgressText:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Starting Restore\U2026" value:@"" table:nil ] ];
}

- (void)controlTextDidChange:(id)fp8
{
	[_sourceFullName release];
	_sourceFullName = nil;
	UNKNOWN_RES_TYPE result_24 = [sourceText setToolTip:0 ];
	[sourceIcon setImage:nil ];
	return [self enableButtons];
}

- (void)eraseToggle:(id)fp8
{
	if ([self targetVol] != 0) {
		if ([eraseTargetCheckbox state] == 0) {
			if ([[self targetVol] mountPoint] == 0) {
				[targetText setStringValue:@"" ];
				UNKNOWN_RES_TYPE result_53 = [targetText setToolTip:0 ];
				[self setTargetVol:nil ];
				[targetIcon setImage:nil ];
			}
		}
	}
	return [self enableButtons];
}

- (void)skipToggle:(id)fp8
{
	_skipState = [skipChecksumCheckbox state];
}

- (void)validateSkipCheckbox
{
	NSInteger result_17 = [eraseTargetCheckbox state];
	[skipChecksumCheckbox setEnabled:NO ];
	if ([skipChecksumCheckbox isEnabled] != 0) {
		return [skipChecksumCheckbox setState:_skipState ];
	}
	return [skipChecksumCheckbox setState:1 ];
}

- (unsigned int)textField:(id)fp8 validateDrop:(id)fp12
{
	NSPasteboard * result_16 = [fp12 draggingPasteboard];
	id result_22 = [result_16 propertyListForType:@"DiskInfoType" ];
	if (UNKNOWN_CONDITION) {
		if ([result_22 count] == 1) {
			UNKNOWN_RES_TYPE result_40 = [DUDiskController sharedDiskController];
			id result_48 = [result_22 objectAtIndex:nil ];
				//b	0x1ec4
		}
	}
		//lwz	r2,0x58a0(r2)
		//lwz	r5,0x0(r2)
	id result_59 = [result_16 propertyListForType:UKNOWN_OBJECT ];
	if (UNKNOWN_CONDITION) {
		if ([result_59 count] == 1) {
			UNKNOWN_RES_TYPE result_78 = [DUDiskController sharedDiskController];
			UNKNOWN_RES_TYPE result_90 = [result_78 diskAtExactPath:[result_59 objectAtIndex:nil ] ];
			if (UNKNOWN_CONDITION) {
				id result_98 = [result_59 objectAtIndex:nil ];
				if ([DUDiskController isPotentiallyValidDiskImage:result_98 ] != 0) {
					if ([DUDiskController isPotentiallyValidDiskImageTryReallyHard:result_98 ] != 0) {
						UNKNOWN_RES_TYPE result_129 = [[self diskController] getDiskInListWithPath:result_98 ];
						if (UNKNOWN_CONDITION) {
							if ([result_129 isOfflineDiskImage] == 0) {
								if ([result_129 mountPoint] != 0) {
									if ([[result_129 mountPoint] length] != 0) {
								}
							}
						}
						return result_129;
					}
				}
					//lwz	r4,0x6690(r28)
			}
		}
			//lwz	r2,0x5894(r2)
	}
		//lwz	r5,0x0(r2)
	if ([result_59 propertyListForType:UKNOWN_OBJECT ] != 0) {
		id result_188 = [[result_59 propertyListForType:UKNOWN_OBJECT ] objectAtIndex:nil ];
		NSURL * result_196 = [NSURL URLWithString:result_188 ];
		if (DIHLDiskImageProbeURL() == 0) {
			return nil;
		}
	}
		//lwz	r2,0x5898(r2)
		//lwz	r5,0x0(r2)
	id result_223 = [result_16 propertyListForType:UKNOWN_OBJECT ];
	if ([DUDiskController isPotentiallyValidDiskImage:result_223 ] != 0) {
		if ([DUDiskController isPotentiallyValidDiskImageTryReallyHard:result_223 ] == 0) {
	}
	if ([DUDiskController isPotentiallyValidDiskImage:result_223 ] != 0) {
		if ([result_223 length] != 0) {
			UNKNOWN_RES_TYPE result_268 = [[DUDiskController sharedDiskController] diskWithIdentifier:result_223 ];
			if (UNKNOWN_CONDITION) {
				if ([[DUDiskController sharedDiskController] createDUDiskObjectFromPath:result_223 ] != 0) {
			}
			if (UKNOWN_OBJECT == fp8) {
					//b	0x1d90
			}
			if (fp8 == targetText) {
				NSInteger result_309 = [eraseTargetCheckbox state];
					//b	0x1d98
			}
		}
	}
	return nil;
}

- (BOOL)textField:(id)fp8 acceptDrop:(id)fp12
{
	NSPasteboard * result_16 = [fp12 draggingPasteboard];
	id result_22 = [result_16 propertyListForType:@"DiskInfoType" ];
	if (UNKNOWN_CONDITION) {
		if ([result_22 count] == 1) {
			UNKNOWN_RES_TYPE result_40 = [DUDiskController sharedDiskController];
			id result_48 = [result_22 objectAtIndex:nil ];
				//b	0x2204
		}
	}
		//lwz	r2,0x5484(r2)
		//lwz	r5,0x0(r2)
	id result_59 = [result_16 propertyListForType:UKNOWN_OBJECT ];
	if (UNKNOWN_CONDITION) {
		if ([result_59 count] == 1) {
			UNKNOWN_RES_TYPE result_78 = [DUDiskController sharedDiskController];
			UNKNOWN_RES_TYPE result_90 = [result_78 diskAtExactPath:[result_59 objectAtIndex:nil ] ];
			if (UNKNOWN_CONDITION) {
				id result_99 = [result_59 objectAtIndex:nil ];
				UNKNOWN_RES_TYPE result_109 = [[self diskController] getDiskInListWithPath:result_99 ];
				if (UNKNOWN_CONDITION) {
					UNKNOWN_RES_TYPE result_122 = [[self diskController] addNotifyDiskImagePath:result_99 atIndex:-1 ];
						//b	0x2208
				}
			}
				//lwz	r4,0x6274(r28)
		}
	}
		//lwz	r2,0x5478(r2)
		//lwz	r5,0x0(r2)
	if ([result_59 propertyListForType:UKNOWN_OBJECT ] != 0) {
			//b	0x219c
	}
	if ([result_16 propertyListForType:NSStringPboardType ] != 0) {
		if ([[result_16 propertyListForType:NSStringPboardType ] length] != 0) {
			UNKNOWN_RES_TYPE result_171 = [[DUDiskController sharedDiskController] diskWithIdentifier:[result_16 propertyListForType:NSStringPboardType ] ];
			if (UNKNOWN_CONDITION) {
				if ([[DUDiskController sharedDiskController] createDUDiskObjectFromPath:[result_16 propertyListForType:NSStringPboardType ] ] != 0) {
			}
			if (UKNOWN_OBJECT == fp8) {
				if ([result_171 canBeRestoreSource] != 0) {
					[self setSourceVol:result_171 ];
					[self enableButtons];
						//b	0x22d0
				}
			}
			if (fp8 == UKNOWN_OBJECT) {
				NSInteger result_231 = [eraseTargetCheckbox state];
				if ([result_171 canBeRestoreTarget:0 ] != 0) {
					[self setDestinationVol:result_171 ];
					[self enableButtons];
					return 1;
				}
			}
		}
	}
	return nil;
}

- (id)buildExecutionDictionary
{
	NSMutableDictionary * result_19 = [NSMutableDictionary dictionaryWithCapacity: ];
	[result_19 setObject:@"restore" forKey:@"restore-type" ];
	[result_19 setObject:[NSNumber numberWithBool:YES ] forKey:@"bless" ];
	[result_19 setObject:[NSURL fileURLWithPath:[[self targetVol] deviceNode] ] forKey:@"target" ];
	if (_sourceFullName != 0) {
			//b	0x3664
	}
	[result_19 setObject:[NSURL URLWithString:[sourceText stringValue] ] forKey:@"source" ];
	NSInteger result_103 = [skipChecksumCheckbox state];
	[result_19 setObject:[NSNumber numberWithBool:YES ] forKey:@"checksum" ];
	NSInteger result_127 = [eraseTargetCheckbox state];
	[result_19 setObject:[NSNumber numberWithBool:NO ] forKey:@"erase" ];
	[result_19 setObject:[NSNumber numberWithInt:120 ] forKey:@"timeout" ];
	return result_19;
}

- (void)resetUI
{
	[sourceText setStringValue:@"" ];
	UNKNOWN_RES_TYPE result_24 = [sourceText setToolTip:0 ];
	[_sourceFullName release];
	_sourceFullName = nil;
	[sourceIcon setImage:nil ];
	[targetText setStringValue:@"" ];
	UNKNOWN_RES_TYPE result_52 = [targetText setToolTip:0 ];
	[self setTargetVol:nil ];
	[targetIcon setImage:nil ];
	[NSApp endSheet:[restoreButton window] ];
		//lwz	r3,0xc(r28)
	UNKNOWN_RES_TYPE result_87 = [result_81 setGlobalProgressBarIndeterminate:1 ];
	return [self setRunning:NO ];
}

- (id)warnMsg
{
	return _warnMsg;
}

- (void)setWarnMsg:(id)fp8
{
	id result_14 = [fp8 retain];
	[_warnMsg release];
	_warnMsg = fp8;
}

- (id)windowController
{
		//lwz	r3,0xc(r3)
	return self;
}

- (id)stageEstimator
{
	return _stageEstimator;
}

- (void)setStageEstimator:(id)fp8
{
	id result_14 = [fp8 retain];
	[_stageEstimator release];
	_stageEstimator = fp8;
}

- (id)globalEstimator
{
	return _globalEstimator;
}

- (void)setGlobalEstimator:(id)fp8
{
	id result_14 = [fp8 retain];
	[_globalEstimator release];
	_globalEstimator = fp8;
}

- (id)stageString
{
	return _stageString;
}

- (void)setStageString:(id)fp8
{
	id result_14 = [fp8 retain];
	[_stageString release];
	_stageString = fp8;
}

- (BOOL)cancelFlag
{
	return _cancelFlag;
}

- (void)setCancelFlag:(BOOL)fp8
{
	_cancelFlag = fp8;
}

- (void)error:(int)fp8
{
	[self setRunning:NO ];
	id result_25 = [self findErrorString:fp8 ];
	UNKNOWN_RES_TYPE result_32 = [DULog log:result_25 ];
	NSString * result_54 = [[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Restore Failure" value:@"" table:nil ];
	return [self simpleModuleAlert:result_54 msg:[self findErrorString:fp8 ] err:0 ];
}

- (void)errorWithString:(id)fp8
{
	[self setRunning:NO ];
	UNKNOWN_RES_TYPE result_24 = [DULog log:fp8 ];
	return [self simpleModuleAlert:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Restore Failure" value:@"" table:nil ] msg:fp8 err:0 ];
}

- (id)findErrorString:(int)fp8
{
	if (fp8 != 106) {
		if (fp8 <= 106) {
			if (fp8 != 104) {
				if (fp8 <= 104) {
					if (fp8 != 0) {
						if (fp8 == 89) {
							NSBundle * result_45 = [NSBundle bundleForClass:[DUModule class] ];
								//b	0x4e58
						}
					}
					if (fp8 != 0) {
					if (fp8 >= 0) {
				}
				if (fp8 == 104) {
			}
		}
			//lwz	r4,0x32c4(r4)
		NSBundle * result_74 = [NSBundle bundleForClass:[self ] ];
			//b	0x4e58
		NSBundle * result_92 = [NSBundle bundleForClass:[result_74 class] ];
		return [NSBundle bundleForClass:[result_74 class] ];
[NSBundle bundleForClass:[[result_92 localizedStringForKey:@"Restore complete" value:@"" table:nil ] class] ];
		return [NSBundle bundleForClass:[[result_92 localizedStringForKey:@"Restore complete" value:@"" table:nil ] class] ];
[NSBundle bundleForClass:[[result_123 localizedStringForKey:@"Could not open connection to helper tool." value:@"" table:nil ] class] ];
		return [NSBundle bundleForClass:[[result_123 localizedStringForKey:@"Could not open connection to helper tool." value:@"" table:nil ] class] ];
	}
	NSBundle * result_184 = [NSBundle bundleForClass:[self class] ];
	return [NSBundle bundleForClass:[self class] ];
}

- (BOOL)validateMenuItem:(id)fp8
{
	UNKNOWN_RES_TYPE result_15 = [fp8 representedObject];
	if ([fp8 action] == setSourceVol:) {
		return result_15;
	}
	if ([fp8 action] == setDestinationVol:) {
		NSInteger result_57 = [eraseTargetCheckbox state];
		return result_15;
	}
	return nil;
}

- (id)contextualMenuForDisk:(id)fp8
{
	NSMutableArray * result_20 = [NSMutableArray array];
	[result_20 addObject:[self createMenuItem:[self displayName] withTarget:0 withObject:0 withAction:0 ] ];
	Class result_49 = [self class];
	NSBundle * result_55 = [NSBundle bundleForClass:result_49 ];
	[result_20 addObject:[self createMenuItem:[result_55 localizedStringForKey:@"Set as source" value:@"" table:nil ] withTarget:0 withObject:fp8 withAction:22916 ] ];
	[result_20 addObject:[self createMenuItem:[[NSBundle bundleForClass:[self class] ] localizedStringForKey:@"Set as destination" value:@"" table:nil ] withTarget:0 withObject:fp8 withAction:22896 ] ];
	return result_20;
}

- (BOOL)supportsContextMenuForDiskType:(int)fp8
{
		//cmplwi	cr7,r5,0x8
	if (UNKNOWN_CONDITION) {
			//slw	r0,r0,r5
			//andi.	r2,r0,0x13e
			//bnelr
	}
	return nil;
}

- (BOOL)displayPanelForDiskType:(int)fp8 andDisk:(id)fp12
{
		//cmplwi	cr7,r5,0x8
	if (UNKNOWN_CONDITION) {
			//slw	r0,r0,r5
			//andi.	r2,r0,0x134
		if (UNKNOWN_CONDITION) {
				//andi.	r2,r0,0xa
			if (UNKNOWN_CONDITION) {
		}
	}
	return self;
}


@end

@implementation DragTextField

- (unsigned int)draggingEntered:(id)fp8
{
	if (dragDelegate != 0) {
		if ([dragDelegate respondsToSelector:@selector(textField:validateDrop:) ] != 0) {
			return dragDelegate;
		}
	}
	return nil;
}

- (void)draggingExited:(id)fp8
{
}

- (BOOL)prepareForDragOperation:(id)fp8
{
	return 1;
}

- (BOOL)performDragOperation:(id)fp8
{
	if (dragDelegate != 0) {
		if ([dragDelegate respondsToSelector:@selector(textField:acceptDrop:) ] != 0) {
			return dragDelegate;
		}
	}
	return nil;
}

- (void)concludeDragOperation:(id)fp8
{
}

- (id)dragDelegate
{
	return dragDelegate;
}

- (void)setDragDelegate:(id)fp8
{
	if (dragDelegate != fp8) {
		[dragDelegate release];
		dragDelegate = [fp8 retain];
	}
}


@end

@implementation NoClickButton

- (BOOL)acceptsFirstMouse:(id)fp8
{
	return nil;
}


@end
