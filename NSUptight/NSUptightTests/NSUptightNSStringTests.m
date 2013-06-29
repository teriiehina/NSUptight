//
//  NSUptightNSStringTests.m
//  NSUptight
//
//  Created by Peter MEUEL on 29/06/13.
//  Copyright (c) 2013 teriiehina. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSString+NSUptight.h"

static NSString *kNonAllocatedString  = nil;
static NSString *kEmptyString         = @"";

static NSString *kAlphabeticString    = @"Hello world!";
static NSString *kNumericString       = @"1234567890";
static NSString *kAlphaNumericString  = @"Lorem 123456";

static NSString *kValidFullNameString = @"Peter MEUEL";

static NSString *kValidEmailAddress   = @"tim@apple.com";
static NSString *kInvalidEmailAddress = @"tim@microsoft";

@interface NSUptightNSStringTests : XCTestCase

@end

@implementation NSUptightNSStringTests

- (void)setUp
{
    [super setUp];    
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testIsDigitsOnly
{
    XCTAssertTrue([kNumericString isDigitsOnly], @"%@ should be a number-only string" , kNumericString);
    XCTAssertTrue([kEmptyString isDigitsOnly], @"an empty NSString should be considered digits-only");

    XCTAssertFalse([kNonAllocatedString isDigitsOnly], @"a nil NSString should not be considered digits-only");
    XCTAssertFalse([kAlphabeticString isDigitsOnly], @"a letters-only NSString should not be considered digits-only");
    XCTAssertFalse([kAlphaNumericString isDigitsOnly], @"a alphanumeric NSString should not be considered digits-only");
}

- (void)testIsValidEmail
{
    XCTAssertTrue(kValidEmailAddress, @"%@ should be a valid email address" , kValidEmailAddress);

    XCTAssertFalse([kInvalidEmailAddress isValidEmail], @"%@ should be a valid email address" , kInvalidEmailAddress);
    XCTAssertFalse([kNonAllocatedString isValidEmail], @"a nil NSString should not be a valid email address");
    XCTAssertFalse([kEmptyString isValidEmail], @"an empty string should not be a valid email address");
}

- (void)testIsValidDay
{
    NSArray *valids   = @[@"1"  , @"2"  , @"3"  , @"4"  , @"5"  , @"6"  , @"7"  , @"8"  , @"9"  ,
                          @"01" , @"02" , @"03" , @"04" , @"05" , @"06" , @"07" , @"08" , @"09" ,
                          @"10" , @"11" , @"12" , @"13" , @"14" , @"15" , @"16" , @"17" , @"18" , @"19" ,
                          @"20" , @"21" , @"22" , @"23" , @"24" , @"25" , @"26" , @"27" , @"28" , @"29" ,
                          @"30" , @"31"];
    
    NSArray *invalids = @[@"0" , @"00" , @"42" , @"-1" , @"monday" , @"whatever" , @"hello world" ,];
    
    for (NSString *valid in valids)
    {
        XCTAssertTrue([valid isValidDay], @"%@ should be a valid day" , valid);
    }
    
    for (NSString *invalid in invalids)
    {
        XCTAssertFalse([invalid isValidDay], @"%@ should not be a valid day" , invalid);
    }

}

//- (BOOL)isValidMonth;
//- (BOOL)isValidYear;
//
//- (BOOL)isValidCreditCardNumber;

@end
