/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "NSObject.h"

@class NSArray;

@interface VolumeFormatsHelper : NSObject
{
    NSArray *_personalityArray;
}

+ (id)sharedInstance;
+ (BOOL)personality:(id)arg1 supportsScheme:(id)arg2;
+ (id)defaultLayoutSchemeForPersonality:(id)arg1;
- (id)init;
- (void)dealloc;
- (id)getWriteableFileSystemsArray;
- (id)allDescriptions;
- (id)descriptionFromKey:(id)arg1;
- (id)keyFromDescription:(id)arg1;
- (id)personalityFromKey:(id)arg1;
- (id)personalityFromDescription:(id)arg1;

@end

