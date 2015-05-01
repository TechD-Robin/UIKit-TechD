//
//  UIDevice+TechD.m
//  UIKit+TechD
//
//  Created by Robin Hsu on 2015/4/30.
//  Copyright (c) 2015年 TechD. All rights reserved.
//
//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

#import "UIDevice+TechD.h"

#import <sys/sysctl.h>

//  ------------------------------------------------------------------------------------------------
#pragma mark define constant string.
//  ------------------------------------------------------------------------------------------------
static  NSString  * const UIDevice_TechDHWInfoKeyModelName          = @"Model Name";
static  NSString  * const UIDevice_TechDHWInfoKeyPhysicalPixels     = @"Physical Pixels";


//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
#pragma mark -
#pragma mark class UIDevice


//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
#pragma mark -
#pragma mark declare private category (Private)
//  ------------------------------------------------------------------------------------------------
@interface UIDevice (Private)

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
+ ( NSDictionary * ) _DeviceHardwareInformation;

+ ( NSDictionary * ) _GetDeviceHardwareInformationByIdentifiter:(NSString *)deviceIdentifiter;

+ ( NSDictionary * ) _GetDeviceHardwareInformation;

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
+ ( NSString * ) _GetSysInfoByName:(char *)levelIdentifier;

//  ------------------------------------------------------------------------------------------------

@end


//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------


//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
#pragma mark -
#pragma mark implementation private category (Private)
//  ------------------------------------------------------------------------------------------------
@implementation UIDevice (Private)
//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

//  http://theiphonewiki.com/wiki/Models
//  http://www.everyi.com/by-identifier/ipod-iphone-ipad-specs-by-model-identifier.html

//  { aKey: { show string, asset scale } }
+ ( NSDictionary * ) _DeviceHardwareInformation
{
    return @{
             @"iPhone1,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 320, 480 }",
                     @"Asset Scale": @(1) },
             
             @"iPhone1,2" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 3G",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 320, 480 }",
                     @"Asset Scale": @(1) },
            
             @"iPhone2,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 3GS",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 320, 480 }",
                     @"Asset Scale": @(1) },
            
             @"iPhone3,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 4",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 640, 960 }",
                     @"Asset Scale": @(2) },
             @"iPhone3,2" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 4",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 640, 960 }",
                     @"Asset Scale": @(2) },
             @"iPhone3,3" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 4 (Verizon)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 640, 960 }",
                     @"Asset Scale": @(2) },
            
             @"iPhone4,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 4S",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 640, 960 }",
                     @"Asset Scale": @(2) },
            
             @"iPhone5,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 5 (GSM)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 640, 1136 }",
                     @"Asset Scale": @(2) },
             @"iPhone5,2" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 5 (GSM+CDMA)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 640, 1136 }",
                     @"Asset Scale": @(2) },
             @"iPhone5,3" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 5C (GSM)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 640, 1136 }",
                     @"Asset Scale": @(2) },
             @"iPhone5,4" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 5C (GSM+CDMA)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 640, 1136 }",
                     @"Asset Scale": @(2) },
            
             @"iPhone6,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 5S (GSM)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 640, 1136 }",
                     @"Asset Scale": @(2) },
             @"iPhone6,2" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 5S (GSM+CDMA)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 640, 1136 }",
                     @"Asset Scale": @(2) },
            
             @"iPhone7,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 6 Plus",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1080, 1920 }",
                     @"Asset Scale": @(3) },
             @"iPhone7,2" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPhone 6",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 750, 1334 }",
                     @"Asset Scale": @(2) },
            
            //@"iPhone7,1" : @{ @"Show String": @"iPhone 6 (GSM)",            @"Asset Scale": @(2) },
            //@"iPhone7,2" : @{ @"Show String": @"iPhone 6 (GSM+CDMA)",       @"Asset Scale": @(2) },
            
            //@"iPhone8,1" : @{ @"Show String": @"iPhone 6 Plus (GSM)",       @"Asset Scale": @(3) },
            //@"iPhone8,2" : @{ @"Show String": @"iPhone 6 Plus (Global)",    @"Asset Scale": @(3) },

            //  iPod
             @"iPod1,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPod Touch 1G",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 320, 480 }",
                     @"Asset Scale": @(1) },
             @"iPod2,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPod Touch 2G",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 320, 480 }",
                     @"Asset Scale": @(1) },
             @"iPod3,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPod Touch 3G",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 320, 480 }",
                     @"Asset Scale": @(1) },
             @"iPod4,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPod Touch 4G",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 640, 960 }",
                     @"Asset Scale": @(2) },
             @"iPod5,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPod Touch 5G",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 640, 1136 }",
                     @"Asset Scale": @(2) },

            //  iPad
             @"iPad1,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 768, 1024 }",
                     @"Asset Scale": @(1) },

             @"iPad2,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad 2 (WiFi)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 768, 1024 }",
                     @"Asset Scale": @(1) },
             @"iPad2,2" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad 2 (GSM)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 768, 1024 }",
                     @"Asset Scale": @(1) },
             @"iPad2,3" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad 2 (CDMA)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 768, 1024 }",
                     @"Asset Scale": @(1) },
             @"iPad2,4" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad 2 (WiFi)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 768, 1024 }",
                     @"Asset Scale": @(1) },
             @"iPad2,5" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Mini 1G (WiFi)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 768, 1024 }",
                     @"Asset Scale": @(1) },
             @"iPad2,6" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Mini 1G (GSM)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 768, 1024 }",
                     @"Asset Scale": @(1) },
             @"iPad2,7" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Mini 1G (GSM+CDMA)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 768, 1024 }",
                     @"Asset Scale": @(1) },

             @"iPad3,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad 3 (WiFi)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad3,2" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad 3 (GSM+CDMA)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad3,3" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad 3 (GSM)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad3,4" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad 4 (WiFi)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad3,5" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad 4 (GSM)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad3,6" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad 4 (GSM+CDMA)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },

             @"iPad4,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Air (WiFi)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad4,2" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Air (Cellular)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad4,3" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Air",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad4,4" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Mini 2 (WiFi)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad4,5" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Mini 2 (Cellular)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad4,6" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Mini 2",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
            
             @"iPad4,7" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Mini 3 (WiFi)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad4,8" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Mini 3 (Cellular)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad4,9" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Mini 3",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },

             @"iPad5,3" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Air 2 (WiFi)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },
             @"iPad5,4" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"iPad Air 2 (Cellular)",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :    @"{ 1536, 2048 }",
                     @"Asset Scale": @(2) },

            
            //  Appple TV ...
             @"AppleTV2,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"Apple TV 2G",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :     [NSNull null],
                     @"Asset Scale": @(2) },
            
             @"AppleTV3,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"Apple TV 3G",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :     [NSNull null],
                     @"Asset Scale": @(2) },
             @"AppleTV3,2" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"Apple TV 3G Rev A",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :     [NSNull null],
                     @"Asset Scale": @(2) },
            
            //  Apple Watch
             @"Watch1,1" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"Apple Watch",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :     [NSNull null],
                     @"Asset Scale": @(2) },
             @"Watch1,2" : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"Apple Watch",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :     [NSNull null],
                     @"Asset Scale": @(2) },
            
            
            //  simulator.
             @"i386"     : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"Simulator",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :     NSStringFromCGSize( [[UIScreen mainScreen] bounds].size ),
                             @"Asset Scale": @(2) },
             @"x86_64"   : @{
                     UIDevice_TechDHWInfoKeyModelName :         @"Simulator",
                     UIDevice_TechDHWInfoKeyPhysicalPixels :     NSStringFromCGSize( [[UIScreen mainScreen] bounds].size ),
                             @"Asset Scale": @(2) },
             };
}

//  ------------------------------------------------------------------------------------------------
+ ( NSDictionary * ) _GetDeviceHardwareInformationByIdentifiter:(NSString *)deviceIdentifiter
{
    return [[[self class] _DeviceHardwareInformation] objectForKey: deviceIdentifiter];
}

//  ------------------------------------------------------------------------------------------------
+ ( NSDictionary * ) _GetDeviceHardwareInformation
{
    return [[self class] _GetDeviceHardwareInformationByIdentifiter: [[self class] _GetSysInfoByName: "hw.machine"]];
}

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
+ ( NSString * ) _GetSysInfoByName:(char *)levelIdentifier
{
    NSParameterAssert( NULL != levelIdentifier );
    
    size_t                          size;
    char                          * answer;
    NSString                      * result;
    
    answer                          = NULL;
    sysctlbyname(levelIdentifier, NULL, &size, NULL, 0);
    
    answer                          = (char *)malloc( size );
    sysctlbyname(levelIdentifier, answer, &size, NULL, 0);
    
    result                          = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    free(answer);
    return result;
}


//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

@end

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------


@implementation UIDevice (TechD)

//  --------------------------------
//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
+ ( BOOL ) isSimulator
{
    NSString                      * model;
    
    model                           = [[UIDevice currentDevice] model];
    NSParameterAssert( nil != model );
    return [model hasSuffix: @"Simulator"];
}

//  ------------------------------------------------------------------------------------------------
+ ( NSString * ) devicePlatform
{
    NSDictionary                  * hardwareInfo;
    
    hardwareInfo                    = [[self class] _GetDeviceHardwareInformation];
    if ( nil == hardwareInfo )
    {
        return nil;
    }
    return [hardwareInfo objectForKey: UIDevice_TechDHWInfoKeyModelName];
}

//  ------------------------------------------------------------------------------------------------
+ ( CGSize ) devicePhysicalPixels
{
    NSString                      * physicalPixels;
    NSDictionary                  * hardwareInfo;

    physicalPixels                  = nil;
    hardwareInfo                    = [[self class] _GetDeviceHardwareInformation];
    if ( nil == hardwareInfo )
    {
        return CGSizeZero;
    }
    
    physicalPixels                  = [hardwareInfo objectForKey: UIDevice_TechDHWInfoKeyPhysicalPixels];
    if ( nil == physicalPixels )
    {
        return CGSizeZero;
    }
    return CGSizeFromString( physicalPixels );
}

//  ------------------------------------------------------------------------------------------------
+ ( UIDevicePlatformFamily ) devicePlatformFamily
{
    NSString                      * devicePlatform;
    
    devicePlatform                  = [[self class] devicePlatform];
    NSParameterAssert( nil != devicePlatform );
    
    if ( [devicePlatform hasPrefix: @"Simulator"] == YES )      return UIDevicePlatformFamilySimulator;
    if ( [devicePlatform hasPrefix: @"iPhone"] == YES )         return UIDevicePlatformFamilyiPhone;
    if ( [devicePlatform hasPrefix: @"iPod"] == YES )           return UIDevicePlatformFamilyiPod;
    if ( [devicePlatform hasPrefix: @"iPad"] == YES )           return UIDevicePlatformFamilyiPad;
    if ( [devicePlatform hasPrefix: @"Apple TV"] == YES )       return UIDevicePlatformFamilyAppleTV;
    if ( [devicePlatform hasPrefix: @"Apple Watch"] == YES )    return UIDevicePlatformFamilyAppleWatch;
    
    return UIDevicePlatformFamilyUnknown;
}


//  ------------------------------------------------------------------------------------------------
+ ( NSArray * ) knownDevicePlatforms
{
    NSMutableArray                * modelNameList;
    NSArray                       * platforms;
    NSString                      * modelName;
    NSDictionary                  * info;
    
    info                            = nil;
    modelName                       = nil;
    platforms                       = [[[self class] _DeviceHardwareInformation] allValues];
    NSParameterAssert( nil != platforms );

    modelNameList                   = [NSMutableArray arrayWithCapacity: [platforms count]];
    for ( NSDictionary * info in platforms )
    {
        if ( nil == info )
        {
            continue;
        }
        
        modelName                   = [info objectForKey: UIDevice_TechDHWInfoKeyModelName];
        if ( nil == modelName )
        {
            continue;
        }
        
        [modelNameList              addObject: modelName];
    }
    platforms                       = nil;
    return modelNameList;
}

#ifdef DEBUG
//  ------------------------------------------------------------------------------------------------
+ ( NSArray * ) knownDeviceIdentifiers
{
    return [[[self class] _DeviceHardwareInformation] allKeys];
}

#endif  //  End of  DEBUG.

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------
+ ( NSString * ) hwModel
{
    return [[self class] _GetSysInfoByName: "hw.model"];
}

//  ------------------------------------------------------------------------------------------------
+ ( NSString * ) hwMachine
{
    return [[self class] _GetSysInfoByName: "hw.machine"];
}

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

@end

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------





















