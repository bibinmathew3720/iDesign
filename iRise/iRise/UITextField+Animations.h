//
//  UITextField+Animations.h
//  Tappa
//
//  Created by Safil Sunny on 11/11/15.
//  Copyright © 2015 Safil Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Animations)

-(void)initStyle;
-(void)initStyleWithFont :(NSString *)font size:(float)FontSize colour:(uint32_t)color;
-(BOOL)isEmpty;
-(void)showError;
-(BOOL)isEmail;
-(BOOL)isPassword;
-(BOOL)isPhoneNumber;


@end
