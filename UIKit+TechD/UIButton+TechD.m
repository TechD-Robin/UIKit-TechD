//
//  UIButton+TechD.m
//  UIKit+TechD
//
//  Created by Robin Hsu on 2015/5/27.
//  Copyright (c) 2015年 TechD. All rights reserved.
//
//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------


#import "UIButton+TechD.h"

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

@implementation UIButton (TechD)

//  --------------------------------
//  ------------------------------------------------------------------------------------------------
+ ( instancetype ) buttonWithImage:(UIImage *)image highlighted:(UIImage *)highlighted origin:(CGPoint)offset
{
    NSParameterAssert( nil != image );
    NSParameterAssert( nil != highlighted );
    
    UIButton                      * button;
    CGRect                          buttonFrame;
    
    button                          = [UIButton buttonWithType: UIButtonTypeCustom];
    NSParameterAssert( nil != button );
    
    buttonFrame.origin              = offset;
    buttonFrame.size.width          = MAX( [image size].width, [highlighted size].width );
    buttonFrame.size.height         = MAX( [image size].height, [highlighted size].height );
    [button                         setFrame: buttonFrame];
    [button                         setImage: image forState: UIControlStateNormal];
    [button                         setImage: highlighted forState: UIControlStateHighlighted];
    
    return button;
}

//  ------------------------------------------------------------------------------------------------
+ ( instancetype ) buttonWithImage:(UIImage *)image highlighted:(UIImage *)highlighted
                          disabled:(UIImage *)disabled selected:(UIImage *)selected origin:(CGPoint)offset
{
    NSParameterAssert( nil != image );
    
    UIButton                      * button;
    CGRect                          buttonFrame;
    
    button                          = [UIButton buttonWithType: UIButtonTypeCustom];
    NSParameterAssert( nil != button );
    
    buttonFrame.origin              = offset;
    buttonFrame.size                = [image size];
    [button                         setFrame: buttonFrame];
    [button                         setImage: image forState: UIControlStateNormal];

    if ( nil != highlighted )
    {
        [button                     setImage: highlighted forState: UIControlStateHighlighted];
    }
    if ( nil != disabled )
    {
        [button                     setImage: disabled forState: UIControlStateDisabled];
    }
    if ( nil != selected )
    {
        [button                     setImage: selected forState: UIControlStateSelected];
    }
    return button;
}

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
- ( BOOL ) moveImageToTitleRightSide:(CGFloat)offsetX
{
    if ( [self imageView] == nil )
    {
        return NO;
    }
    
    CGFloat                         titleWidth;
    CGFloat                         imageWidth;
    CGFloat                         gapWidth;
    UIEdgeInsets                    titleEdgeInsets;
    UIEdgeInsets                    imageEdgeInsets;
    
    [self                           sizeToFit];
    titleWidth                      = ( ( [self titleLabel] != nil ) ? [[self titleLabel] frame].size.width : 0.0f );
    imageWidth                      = [[self imageView] frame].size.width;
    gapWidth                        = ( [self frame].size.width - ( titleWidth + imageWidth ) );
    
    titleEdgeInsets                 = ( ( [self titleLabel] != nil ) ? [self titleEdgeInsets] : UIEdgeInsetsZero );
    imageEdgeInsets                 = [self imageEdgeInsets];
    
    titleEdgeInsets.left            -= imageWidth;
    titleEdgeInsets.right           = ( imageWidth - titleEdgeInsets.right );
    
    imageEdgeInsets.left            += ( titleWidth + gapWidth + offsetX );
    imageEdgeInsets.right           -= ( titleWidth + gapWidth + offsetX );
    
    [self                           setTitleEdgeInsets: titleEdgeInsets];
    [self                           setImageEdgeInsets: imageEdgeInsets];
    return YES;
}

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

@end

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------





