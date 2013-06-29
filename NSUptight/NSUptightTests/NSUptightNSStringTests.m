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

static NSString *kValidCreditCardNumber1  = @"4111111111111111";
static NSString *kValidCreditCardNumber2  = @"4111 1111 1111 1111";
static NSString *kValidCreditCardNumber3  = @"4111-1111-1111-1111";
static NSString *kInvalidCreditCardNumber = @"4111111111111112";


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
    
    NSArray *invalids = @[@"0" , @"00" , @"42" , @"-1" , @"monday" , @"whatever" , @"hello world"];
    
    for (NSString *valid in valids)
    {
        XCTAssertTrue([valid isValidDay], @"%@ should be a valid day" , valid);
    }
    
    for (NSString *invalid in invalids)
    {
        XCTAssertFalse([invalid isValidDay], @"%@ should not be a valid day" , invalid);
    }
}

- (void)testIsValidMonth
{
    NSArray *valids   = @[@"1"  , @"2"  , @"3"  , @"4"  , @"5"  , @"6"  , @"7"  , @"8"  , @"9"  ,
                          @"01" , @"02" , @"03" , @"04" , @"05" , @"06" , @"07" , @"08" , @"09" ,
                          @"10" , @"11" , @"12"];
    
    NSArray *invalids = @[@"0" , @"00" , @"42" , @"-1" , @"january" , @"whatever" , @"hello world"];
    
    for (NSString *valid in valids)
    {
        XCTAssertTrue([valid isValidMonth], @"%@ should be a valid month" , valid);
    }
    
    for (NSString *invalid in invalids)
    {
        XCTAssertFalse([invalid isValidMonth], @"%@ should not be a valid month" , invalid);
    }
}

//- (void)testIsValidYear
//{
//    NSArray *valids   = @[@"-500"  , @"0"  , @"00"  , @"1492"  , @"2001"  , @"1983"];
//    
//    NSArray *invalids = @[@"2013 AC" , @"two thousand thirtheen" , @"whatever" , @"hello world"];
//    
//    for (NSString *valid in valids)
//    {
//        XCTAssertTrue([valid isValidYear], @"%@ should be a valid year" , valid);
//    }
//    
//    for (NSString *invalid in invalids)
//    {
//        XCTAssertFalse([invalid isValidYear], @"%@ should not be a valid year" , invalid);
//    }
//}

- (void)testIsValidCreditCardNumber
{
    XCTAssertTrue([kValidCreditCardNumber1 isValidCreditCardNumber], @"%@ should be a valid credit card number" , kValidCreditCardNumber1);
    XCTAssertTrue([kValidCreditCardNumber2 isValidCreditCardNumber], @"%@ should be a valid credit card number" , kValidCreditCardNumber2);
    XCTAssertTrue([kValidCreditCardNumber3 isValidCreditCardNumber], @"%@ should be a valid credit card number" , kValidCreditCardNumber3);
    
    XCTAssertFalse([kInvalidCreditCardNumber isValidCreditCardNumber], @"%@ should not be a valid credit card number" , kInvalidCreditCardNumber);

}

@end
