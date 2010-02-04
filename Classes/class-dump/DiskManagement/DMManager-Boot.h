/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import <DiskManagement/DMManager.h>

@interface DMManager (Boot)
- (int)preBootEnvironment;
- (unsigned int)supportedNetBootProtocols;
- (int)checkLegacyBootSupport:(char *)arg1;
- (int)setNVRAM:(id)arg1 forKey:(id)arg2;
- (int)setNetBootPreference:(unsigned int)arg1 withServer:(id)arg2 forInterface:(id)arg3;
- (int)getNetBootPreference:(unsigned int *)arg1 withServer:(id *)arg2 forInterface:(id *)arg3;
- (int)setDiskForBootPreference:(struct __DADisk *)arg1 atFolderLocation:(id)arg2 isOS9:(BOOL)arg3;
- (int)setLegacyDiskForBootPreference:(struct __DADisk *)arg1 withDriveHint:(struct __DADisk *)arg2;
- (int)getDiskForBootPreference:(struct __DADisk **)arg1;
- (int)checkOpticalDiscBootability:(struct __DADisk *)arg1 isBootable:(char *)arg2;
- (int)checkAbilityToMakeBootable_actualsimplepartition_:(struct __DADisk *)arg1 onAnyMachine:(BOOL)arg2 atAll:(char *)arg3 yesButDestructively:(char *)arg4;
- (int)checkBootabilityOnThisMachine_actualsimplepartition_:(struct __DADisk *)arg1 isBootable:(char *)arg2;
- (int)checkBootabilityOnThisMachine:(struct __DADisk *)arg1 isBootable:(char *)arg2;
- (int)checkAbilityToMakeBootable:(struct __DADisk *)arg1 onAnyMachine:(BOOL)arg2 atAll:(char *)arg3 yesButDestructively:(char *)arg4;
- (int)makeBootable:(struct __DADisk *)arg1 filesystem:(id)arg2 newDisk:(struct __DADisk **)arg3;
@end
