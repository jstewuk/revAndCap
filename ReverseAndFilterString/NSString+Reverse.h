//
//  NSString+Reverse.h
//  ReverseAndFilterString
//
//  Created by James Stewart on 8/30/13.
//  Copyright (c) 2013 StewartStuff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ReverseAndFilter)
/**
 Reverse receiver
 */
- (NSString *)reverse;

/**
 Capitalize vowels and make all consonants lowercase in receiver
 */
- (NSString *)capitalizeVowels;

/**
 Reverse, capitalize vowels and lowercase consonants in receiver
 */
- (NSString *)reverseAndCapitalizeVowels;

@end
