//
//  NSString+NSUptight.h
//  NSUptight
//
//  Created by Peter MEUEL on 29/06/13.
//  Copyright (c) 2013 teriiehina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSUptight)

- (BOOL)isDigitsOnly;
- (BOOL)isValidEmail;

- (BOOL)isValidDay;
- (BOOL)isValidMonth;
- (BOOL)isValidYear;

- (BOOL)isValidCreditCardNumber;

@end
