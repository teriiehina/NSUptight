//
//  NSString+NSUptight.m
//  NSUptight
//
//  Created by Peter MEUEL on 29/06/13.
//  Copyright (c) 2013 teriiehina. All rights reserved.
//

#import "NSString+NSUptight.h"

@implementation NSString (NSUptight)

- (BOOL)isDigitsOnly
{
    NSCharacterSet* nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange r = [self rangeOfCharacterFromSet: nonNumbers];
    return r.location == NSNotFound;
}

- (BOOL)isValidEmail
{
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidDay
{
    if ( ! [self isDigitsOnly]) return NO;
    if (self.length > 2)        return NO;
    if (self.intValue < 1)      return NO;
    if (self.intValue > 31)     return NO;
    
    return YES;
}

- (BOOL)isValidMonth
{
    if ( ! [self isDigitsOnly]) return NO;
    if (self.length > 2)        return NO;
    if (self.intValue > 12)     return NO;
    
    return YES;
}

- (BOOL)isValidYear
{
    NSUInteger length = self.length;
    int intValue      = self.intValue;
    
    if ( ! [self isDigitsOnly]) return NO;
    if (length > 4)             return NO;
    
    BOOL isValid = YES;
    
    switch (length) {
        case 1:
            if (intValue < 0) isValid = NO;
            if (intValue > 2) isValid = NO;
            break;
        case 2:
            if (intValue < 19) isValid = NO;
            if (intValue > 20) isValid = NO;
            break;
        case 3:
            if (intValue < 190) isValid = NO;
            if (intValue > 201) isValid = NO;
            break;
        case 4:
            if (intValue < 1900) isValid = NO;
            if (intValue > 2013) isValid = NO;
            break;
            
        default:
            break;
    }
    
    return isValid;
}

- (BOOL)isValidCreditCardNumber
{
    NSString *pass_value = [NSString stringWithString:self];
    NSMutableArray *character;
    
    unsigned long long odd_no;
    unsigned long long new_odd_no;
    unsigned long long even_no;
    unsigned long long new_even_no;
    unsigned long long multiplied_even_no;
    unsigned long long changed_even_no;
    unsigned long long final_value;
    unsigned long long revers_card_no;
    unsigned long long card_no;
    unsigned long long check_reverse;
    new_odd_no = 0;
    new_even_no = 0;
    
    card_no = [pass_value longLongValue];
    
    character = [[NSMutableArray alloc]init];
    
    //-------reversing order of entered card number---------
    for(int i = 0; i<[pass_value length];i++)
    {
        check_reverse =(card_no % 10);
        card_no = (card_no / 10);
        
        [character addObject:[NSString stringWithFormat:@"%qu",check_reverse]];
        
        revers_card_no=revers_card_no*10+check_reverse;
        check_reverse=card_no;
        
    }
    pass_value = [NSString stringWithFormat:@"%qu",revers_card_no];
    
    //--------checking for even and odd numbers--------
    for(int j=0;j<[character count];j++)
    {
        if(j % 2 == 0)
        {
            odd_no = [[character objectAtIndex:j]longLongValue];
            
            new_odd_no = new_odd_no+odd_no;
        }
        else
        {
            //------doubling the value of even no's--------
            even_no = [[character objectAtIndex:j]longLongValue];
            multiplied_even_no=even_no*2;
            
            //            NSLog(@"%qu",multiplied_even_no);
            
            //-------if even is a single digit--------
            if((multiplied_even_no % 10) == 0)
            {
                if(multiplied_even_no == 10)
                {
                    new_even_no = 1+new_even_no;
                }
                else
                {
                    new_even_no = multiplied_even_no + new_even_no;
                }
            }
            //----------if there is multiple digits in even no---------
            else
            {
                int x=(multiplied_even_no % 10);
                int y=multiplied_even_no /10;
                
                changed_even_no = x+y;
                
                new_even_no = new_even_no + changed_even_no;
                
            }
        }
    }
    
    //--------calculating final value--------
    final_value = new_even_no + new_odd_no;
    
    //    NSLog(@"%qu",final_value);
    
    
    return (final_value % 10) == 0;
}

@end
