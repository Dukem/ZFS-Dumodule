/*
 *     Generated by class-dump 3.3.1 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2009 by Steve Nygard.
 */

#import "NSObject.h"

@class NSArray;

@interface DiskSizesHelper : NSObject
{
    NSArray *_sizeArray;
}

+ (id)sharedInstance;
- (id)init;
- (void)dealloc;
- (id)loadData;
- (id)allDescriptions;
- (id)dictionaryFromDescription:(id)arg1;
- (long long)sectorsFromDescription:(id)arg1;
- (long long)unitsFromDescription:(id)arg1;
- (id)layoutFromDescription:(id)arg1;
- (id)descriptionFromCustomSectors:(long long)arg1 units:(long long)arg2;
- (id)descriptionFromSectors:(long long)arg1;
- (long long)countSizeInfo;
- (id)sizeInfoForIndex:(long long)arg1;
- (long long)indexForDescription:(id)arg1;
- (long long)indexForSectors:(long long)arg1;
- (long long)sectorsFromDictionary:(id)arg1;
- (id)descriptionFromDictionary:(id)arg1;
- (id)layoutFromDictionary:(id)arg1;
- (long long)unitsFromDictionary:(id)arg1;

@end
