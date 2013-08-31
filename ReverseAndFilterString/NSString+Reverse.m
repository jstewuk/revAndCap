//
//  NSString+Reverse.m
//  ReverseAndFilterString
//
//  Created by James Stewart on 8/30/13.
//  Copyright (c) 2013 StewartStuff. All rights reserved.
//

#import "NSString+Reverse.h"

@implementation NSString(ReverseAndFilter)

- (NSString *)reverse {
    NSInteger length = [self length];
    if (length <= 1) return self;
    
    NSMutableString *rev = [NSMutableString stringWithCapacity:length];
    for (NSInteger loc = length - 1; loc >= 0; loc--) {
        [rev appendString:[self charAtLoc:loc]];
    }
    return [NSString stringWithString:rev];
}

- (NSString *)charAtLoc:(NSInteger)loc {
    NSRange range = NSMakeRange(loc, 1);
    return [self substringWithRange:range];
}



- (NSString *)capitalizeVowels {
    NSInteger length = [self length];
    if (length == 0 ) {
        return self;
    }
    
    NSMutableString *capString = [NSMutableString stringWithCapacity:length];
    for (NSInteger loc = 0; loc < length; ++loc) {
        NSString *c = [self charAtLoc:loc];
        c = [c isVowel] ? [c uppercaseString] : [c lowercaseString];
        [capString appendString:c];
    }
    return [NSString stringWithString:capString];
}

- (BOOL)isVowel{
    NSAssert([self length] == 1, @"Can only test if vowel for single character");
    return ([@"aeiou" rangeOfString:[self lowercaseString]].location != NSNotFound);
}

- (NSString *)reverseAndCapitalizeVowels {
    NSInteger length = [self length];
    if (length == 0) return self;
    
    NSMutableString *revCap = [NSMutableString stringWithCapacity:length];
    for (NSInteger loc = length - 1; loc >= 0; loc--) {
        NSString *c = [self charAtLoc:loc];
        c = [c isVowel] ? [c uppercaseString] : [c lowercaseString];
        [revCap appendString:c];
    }
    return [NSString stringWithString:revCap];
}

@end