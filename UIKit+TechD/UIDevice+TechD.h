//
//  UIDevice+TechD.h
//  UIKit+TechD
//
//  Created by Robin Hsu on 2015/4/30.
//  Copyright (c) 2015年 TechD. All rights reserved.
//
//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import <Availability.h>

#import <UIKit/UIKit.h>

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
//  reference code :
//  https://github.com/erica/uidevice-extension/blob/master/UIDevice-Hardware.h
//  https://github.com/erica/uidevice-extension/blob/master/UIDevice-Hardware.m
//
//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

//  ------------------------------------------------------------------------------------------------
#pragma mark declare enumeration.
//  ------------------------------------------------------------------------------------------------
typedef NS_ENUM( NSInteger, UIDevicePlatformFamily ) {
    UIDevicePlatformFamilyUnknown                   = -1,
    UIDevicePlatformFamilySimulator                 = 0,
    UIDevicePlatformFamilyiPhone,
    UIDevicePlatformFamilyiPod,
    UIDevicePlatformFamilyiPad,
    UIDevicePlatformFamilyAppleTV,
    UIDevicePlatformFamilyAppleWatch,
    
};


//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
@interface UIDevice (TechD)

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
+ ( BOOL ) isSimulator;

//  ------------------------------------------------------------------------------------------------
+ ( NSString * ) devicePlatform;

//  ------------------------------------------------------------------------------------------------
+ ( CGSize ) devicePhysicalPixels;

//  ------------------------------------------------------------------------------------------------
+ ( UIDevicePlatformFamily ) devicePlatformFamily;

//  ------------------------------------------------------------------------------------------------
+ ( NSArray * ) knownDevicePlatforms;

#ifdef DEBUG
//  ------------------------------------------------------------------------------------------------
+ ( NSArray * ) knownDeviceIdentifiers;

#endif  //  End of  DEBUG.



//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
+ ( NSString * ) hwModel;

//  ------------------------------------------------------------------------------------------------
+ ( NSString * ) hwMachine;

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------


@end

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
