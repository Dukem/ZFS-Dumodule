/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import <DiskManagement/DMManager.h>

@interface DMManager (Mount)
- (BOOL)doMountDisk:(struct __DADisk *)arg1 atPath:(id)arg2 readOnly:(BOOL)arg3 otherArguments:(id)arg4 errorDict:(id *)arg5;
- (BOOL)unmountDisk:(struct __DADisk *)arg1 entireDisk:(BOOL)arg2 force:(BOOL)arg3;
- (BOOL)unmountDisk:(struct __DADisk *)arg1 entireDisk:(BOOL)arg2 force:(BOOL)arg3 errorDict:(id *)arg4;
- (BOOL)ejectDisk:(struct __DADisk *)arg1;
- (BOOL)ejectDisk:(struct __DADisk *)arg1 errorDict:(id *)arg2;
- (BOOL)mountDisk:(struct __DADisk *)arg1 entireDisk:(BOOL)arg2 atPath:(id)arg3 readOnly:(BOOL)arg4 otherArguments:(id)arg5;
- (BOOL)mountDisk:(struct __DADisk *)arg1 entireDisk:(BOOL)arg2 atPath:(id)arg3 readOnly:(BOOL)arg4 otherArguments:(id)arg5 errorDict:(id *)arg6;
- (int)renameDisk:(struct __DADisk *)arg1 toName:(id)arg2;
- (int)renameDisk:(struct __DADisk *)arg1 toName:(id)arg2 errorDict:(id *)arg3;
@end
