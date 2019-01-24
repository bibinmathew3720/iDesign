//
//  UITextField+Animations.m
//  Tappa
//
//  Created by Safil Sunny on 11/11/15.
//  Copyright © 2015 Safil Sunny. All rights reserved.
//

#import "UITextField+Animations.h"
//#import "Config.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define TEXT_FIELD_FONT_DEFAULT_NAME @"Roboto-Medium"
#define TEXT_FIELD_FONT_DEFAULT_SIZE 14
#define TEXT_FIELD_FONT_DEFAULT_COLOUR 0xBDBDBD



@implementation UITextField (Animations)


-(void)initStyle{
    
    [self initStyleWithFont:TEXT_FIELD_FONT_DEFAULT_NAME size:TEXT_FIELD_FONT_DEFAULT_SIZE colour:TEXT_FIELD_FONT_DEFAULT_COLOUR];
    
}


-(void)initStyleWithFont :(NSString *)font size:(float)FontSize colour:(uint32_t)color{
    
    [self.layer setCornerRadius:2.0];
    [self.layer setBorderWidth:2.0];
    [self.layer setBorderColor:[UIColor clearColor].CGColor];
    [self setFont:[UIFont fontWithName:font size:FontSize]];
    [self setTextColor:UIColorFromRGB(color)];
    [self setValue:[UIColor lightGrayColor]
                    forKeyPath:@"_placeholderLabel.textColor"];
}
-(void)showError{
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = 1.0;
    animation.values = @[ @(-20), @(20), @(-20), @(20), @(-10), @(10), @(-5), @(5), @(0) ];
    
   
    CAKeyframeAnimation *colourChangeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"borderColor"];
    id redColor = (__bridge id)[UIColor redColor].CGColor;
    colourChangeAnimation.values = @[redColor];
    colourChangeAnimation.keyTimes = @[ @0, @(1/6.0), @(3/6.0), @(5/6.0), @1  ];
    colourChangeAnimation.duration = 1.0;
    colourChangeAnimation.additive = YES;
    colourChangeAnimation.removedOnCompletion =YES;
    CAAnimationGroup *gropAnimation = [[CAAnimationGroup alloc]init];
    gropAnimation.animations = @[ animation, colourChangeAnimation ];
    gropAnimation.duration = 1.0;
   
    [self.layer addAnimation:gropAnimation forKey:@"Shake"];
    [self.layer setBorderColor:[UIColor redColor].CGColor ];
}

-(BOOL)isEmpty
{
    return (self.text.length==0);
}

-(BOOL)isEmail{
    NSString *regex = @"[^@]+@[A-Za-z0-9.-]+\\.[A-Za-z]+";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailPredicate evaluateWithObject:self.text];
}

-(BOOL)isPassword{
    NSCharacterSet * characterSet = [NSCharacterSet uppercaseLetterCharacterSet] ;
    NSRange range = [self.text rangeOfCharacterFromSet:characterSet] ;
    if (range.location == NSNotFound) {
        return NO ;//Uppercase letter
    }
    characterSet = [NSCharacterSet lowercaseLetterCharacterSet] ;
    range = [self.text rangeOfCharacterFromSet:characterSet] ;
    if (range.location == NSNotFound) {
        return NO ;//Lowecase letter
    }
    NSString *specialCharacterString = @"!~`@#$%^&*-+();:={}[],.<>?\\/\"\'";
    NSCharacterSet *specialCharacterSet = [NSCharacterSet
                                           characterSetWithCharactersInString:specialCharacterString];
    
    if (![self.text.lowercaseString rangeOfCharacterFromSet:specialCharacterSet].length) {
        return NO; //Special Character
    }
    
    if ( [self.text length]<6 || [self.text length]>10 ) return NO;  // too long or too short
    NSRange rang;
    rang = [self.text rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]];
    if ( !rang.length ) return NO;  // no letter
    rang = [self.text rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
    if ( !rang.length )  return NO;  // no number;
    return YES;
}

- (BOOL)isPhoneNumber{
    NSString *phoneRegex = @"^([0-9]{1,}+)?(\\-([0-9]{1,})?)?$";
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return ([phonePredicate evaluateWithObject:self.text] && (self.text.length > 6 && self.text.length <= 12));
}


@end
