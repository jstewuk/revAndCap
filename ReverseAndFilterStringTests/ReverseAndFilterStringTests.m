//
//  ReverseAndFilterStringTests.m
//  ReverseAndFilterStringTests
//
//  Created by James Stewart on 8/30/13.
//  Copyright (c) 2013 StewartStuff. All rights reserved.
//

#import "ReverseAndFilterStringTests.h"

#import "NSString+Reverse.h"

/*
  “Write a subroutine, function, or method that takes an array of characters and returns an array of the same characters in reversed order with every consonant lower cased and every vowel upper cased. Prove your implementation works."
 */

/*
 Test cases:
 b => b
 bc => cb
 bcd => dcb
 bcdfgh => hgfdcb
 a => A
 "" => ""
 abCD efgHIJ => jIhgfE dcbA
 Every Good Goy Does Fine => EnIf sEOd yOb dOOg yrEvE
 */

@implementation ReverseAndFilterStringTests

// Reverse TDD

- (void)testStringReverserReturnsEmptyStringForAnEmptyString {
    STAssertTrue([[@"" reverse] isEqualToString:@""], @"Empty string reversed should return empty string");
}

- (void)testStringReverserReturnsStringForStringOfLength1 {
    STAssertTrue([[@"b" reverse] isEqualToString:@"b"], @"@b reversed should return @b");
}

- (void)testStringReverserReturns_cb_for_bc {
    STAssertTrue([[@"bc" reverse] isEqualToString:@"cb"], @"@bc reversed should be @cb");
}

- (void)test_bcd_reversedReturns_dcb {
    STAssertTrue([[@"bcd" reverse] isEqualToString:@"dcb"], @"bcd reversed should be @dcb");
}

- (void)test_bcd_fgh_reversedReturns_hgf_dcb {
    STAssertTrue([[@"bcd fgh" reverse] isEqualToString:@"hgf dcb"], @"bcd fgh reversed should be @hgf dcb");
}

// Capitalize TDD

- (void)test_a_capitalizeVowels_returns_A {
    STAssertTrue([[@"a" capitalizeVowels] isEqualToString:@"A"], @"a capitalizeVowel should be A");
}

- (void)test_abcdefg_capitalizeVowels_returns_AbcdEfg {
    STAssertTrue([[@"abcdefg" capitalizeVowels] isEqualToString:@"AbcdEfg"], @"abcdefg capitalizeVowels should be AbcdEfg");
}

- (void)test_abCD_efgHIJ_capitalizeVowels_returns_Abcd_EfghIj {
    STAssertTrue([[@"abCD efgHIJ" capitalizeVowels] isEqualToString:@"Abcd EfghIj"], @"abCD efgHIJ capitalizeVowels should be Abcd EfghIj");
}

// Capitalize and Reverse TDD and integration

- (void)test_a_reverseAndCapitalizeVowels_returns_A {
    STAssertTrue([[@"a" reverseAndCapitalizeVowels] isEqualToString:@"A"], @"a reverseAndCapitalizeVowels should be A");
}

- (void)test_emptyString_reverseAndCapitalizeVowels_returns_emptyString {
    STAssertTrue([[@"" reverseAndCapitalizeVowels] isEqualToString:@""], @" emptyString reverseAndCapitalizeVowels should be emptyString");
}

- (void)test_abCD_efgHIJ_reverseAndCapitalizeVowels_returns_jIhgfE_dcbA {
    STAssertTrue([[@"abCD efgHIJ" reverseAndCapitalizeVowels] isEqualToString:@"jIhgfE dcbA"], @"abCD efgHIJ reverseAndCapitalizeVowels should be jIhgfE dcbA");
}

// Acceptance Test:

- (void)test_EGBD_Phrase_reverseAndCapitalizeVowels_returns_right_result {
    NSString *input = @"Every Good Boy Does Fine";
    NSString *expectedOutput = @"EnIf sEOd yOb dOOg yrEvE";
    STAssertTrue([[input reverseAndCapitalizeVowels] isEqualToString:expectedOutput], @"Every Good Goy Does Fine => EnIf sEOd yOb dOOg yrEvE");
}

@end

