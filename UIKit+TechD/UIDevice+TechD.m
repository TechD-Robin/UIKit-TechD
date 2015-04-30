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

+ ( NSDictionary * ) _GetDeviceHardwareInformation:(NSString *)deviceIdentifiter;


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
    NSDictionary                  * infos;
    
    infos                           = @{
                                        @"iPhone1,1" : @{ @"Show String": @"iPhone",                    @"Asset Scale": @(2) },
                                        @"iPhone1,2" : @{ @"Show String": @"iPhone 3G",                 @"Asset Scale": @(2) },
                                        
                                        @"iPhone2,1" : @{ @"Show String": @"iPhone 3GS",                @"Asset Scale": @(2) },
                                        
                                        @"iPhone3,1" : @{ @"Show String": @"iPhone 4",                  @"Asset Scale": @(2) },
                                        @"iPhone3,2" : @{ @"Show String": @"iPhone 4",                  @"Asset Scale": @(2) },
                                        @"iPhone3,3" : @{ @"Show String": @"Verizon iPhone 4",          @"Asset Scale": @(2) },
                                        
                                        @"iPhone4,1" : @{ @"Show String": @"iPhone 4S",                 @"Asset Scale": @(2) },
                                        
                                        @"iPhone5,1" : @{ @"Show String": @"iPhone 5 (GSM)",            @"Asset Scale": @(2) },
                                        @"iPhone5,2" : @{ @"Show String": @"iPhone 5 (GSM+CDMA)",       @"Asset Scale": @(2) },
                                        @"iPhone5,3" : @{ @"Show String": @"iPhone 5C (GSM)",           @"Asset Scale": @(2) },
                                        @"iPhone5,4" : @{ @"Show String": @"iPhone 5C (GSM+CDMA)",      @"Asset Scale": @(2) },
                                        
                                        @"iPhone6,1" : @{ @"Show String": @"iPhone 5S (GSM)",           @"Asset Scale": @(2) },
                                        @"iPhone6,2" : @{ @"Show String": @"iPhone 5S (GSM+CDMA)",      @"Asset Scale": @(2) },
                                        
                                        @"iPhone7,1" : @{ @"Show String": @"iPhone 6 Plus",             @"Asset Scale": @(3) },
                                        @"iPhone7,2" : @{ @"Show String": @"iPhone 6",                  @"Asset Scale": @(2) },
                                        
                                        //@"iPhone7,1" : @{ @"Show String": @"iPhone 6 (GSM)",            @"Asset Scale": @(2) },
                                        //@"iPhone7,2" : @{ @"Show String": @"iPhone 6 (GSM+CDMA)",       @"Asset Scale": @(2) },
                                        
                                        //@"iPhone8,1" : @{ @"Show String": @"iPhone 6 Plus (GSM)",       @"Asset Scale": @(3) },
                                        //@"iPhone8,2" : @{ @"Show String": @"iPhone 6 Plus (Global)",    @"Asset Scale": @(3) },

                                        //  iPod
                                        @"iPod1,1" : @{ @"Show String": @"iPod Touch 1G",               @"Asset Scale": @(2) },
                                        @"iPod2,1" : @{ @"Show String": @"iPod Touch 2G",               @"Asset Scale": @(2) },
                                        @"iPod3,1" : @{ @"Show String": @"iPod Touch 3G",               @"Asset Scale": @(2) },
                                        @"iPod4,1" : @{ @"Show String": @"iPod Touch 4G",               @"Asset Scale": @(2) },
                                        @"iPod5,1" : @{ @"Show String": @"iPod Touch 5G",               @"Asset Scale": @(2) },

                                        //  iPad
                                        @"iPad1,1" : @{ @"Show String": @"iPad",                        @"Asset Scale": @(2) },
//                                        @"iPad1,2" : @{ @"Show String": @"iPad 3G",                     @"Asset Scale": @(2) },

                                        @"iPad2,1" : @{ @"Show String": @"iPad 2 (WiFi)",               @"Asset Scale": @(1) },
                                        @"iPad2,2" : @{ @"Show String": @"iPad 2 (GSM)",                @"Asset Scale": @(1) },
                                        @"iPad2,3" : @{ @"Show String": @"iPad 2 (CDMA)",               @"Asset Scale": @(1) },
                                        @"iPad2,4" : @{ @"Show String": @"iPad 2 (WiFi)",               @"Asset Scale": @(1) },
                                        @"iPad2,5" : @{ @"Show String": @"iPad Mini 1G (WiFi)",         @"Asset Scale": @(2) },
                                        @"iPad2,6" : @{ @"Show String": @"iPad Mini 1G (GSM)",          @"Asset Scale": @(2) },
                                        @"iPad2,7" : @{ @"Show String": @"iPad Mini 1G (GSM+CDMA)",     @"Asset Scale": @(2) },

                                        @"iPad3,1" : @{ @"Show String": @"iPad 3 (WiFi)",               @"Asset Scale": @(2) },
                                        @"iPad3,2" : @{ @"Show String": @"iPad 3 (GSM+CDMA)",           @"Asset Scale": @(2) },
                                        @"iPad3,3" : @{ @"Show String": @"iPad 3 (GSM)",                @"Asset Scale": @(2) },
                                        @"iPad3,4" : @{ @"Show String": @"iPad 4 (WiFi)",               @"Asset Scale": @(2) },
                                        @"iPad3,5" : @{ @"Show String": @"iPad 4 (GSM)",                @"Asset Scale": @(2) },
                                        @"iPad3,6" : @{ @"Show String": @"iPad 4 (GSM+CDMA)",           @"Asset Scale": @(2) },

                                        @"iPad4,1" : @{ @"Show String": @"iPad Air (WiFi)",             @"Asset Scale": @(2) },
                                        @"iPad4,2" : @{ @"Show String": @"iPad Air (Cellular)",         @"Asset Scale": @(2) },
                                        @"iPad4,3" : @{ @"Show String": @"iPad Air",                    @"Asset Scale": @(2) },
                                        @"iPad4,4" : @{ @"Show String": @"iPad Mini 2 (WiFi)",          @"Asset Scale": @(2) },
                                        @"iPad4,5" : @{ @"Show String": @"iPad Mini 2 (Cellular)",      @"Asset Scale": @(2) },
                                        @"iPad4,6" : @{ @"Show String": @"iPad Mini 2",                 @"Asset Scale": @(2) },
                                        
                                        @"iPad4,7" : @{ @"Show String": @"iPad Mini 3 (WiFi)",          @"Asset Scale": @(2) },
                                        @"iPad4,8" : @{ @"Show String": @"iPad Mini 3 (Cellular)",      @"Asset Scale": @(2) },
                                        @"iPad4,9" : @{ @"Show String": @"iPad Mini 3",                 @"Asset Scale": @(2) },

                                        @"iPad5,3" : @{ @"Show String": @"iPad Air 2 (WiFi)",           @"Asset Scale": @(2) },
                                        @"iPad5,4" : @{ @"Show String": @"iPad Air 2 (Cellular)",       @"Asset Scale": @(2) },

                                        
                                        //  Appple TV ...
                                        @"AppleTV2,1" : @{ @"Show String": @"Apple TV 2G",              @"Asset Scale": @(2) },
                                        
                                        @"AppleTV3,1" : @{ @"Show String": @"Apple TV 3G",              @"Asset Scale": @(2) },
                                        @"AppleTV3,2" : @{ @"Show String": @"Apple TV 3G Rev A",        @"Asset Scale": @(2) },
                                        
                                        //  Apple Watch
                                        @"Watch1,1" : @{ @"Show String": @"Apple Watch",                @"Asset Scale": @(2) },
                                        @"Watch1,2" : @{ @"Show String": @"Apple Watch",                @"Asset Scale": @(2) },
                                        
                                        
                                        //  simulator.
                                        @"i386"    : @{ @"Show String": @"Simulator",                   @"Asset Scale": @(2) },
                                        @"x86_64"  : @{ @"Show String": @"Simulator",                   @"Asset Scale": @(2) },
                                        };
    
    return infos;
}

//  ------------------------------------------------------------------------------------------------
+ ( NSDictionary * ) _GetDeviceHardwareInformation:(NSString *)deviceIdentifiter
{
    return [[[self class] _DeviceHardwareInformation] objectForKey: deviceIdentifiter];
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
//  ------------------------------------------------------------------------------------------------
+ ( NSString * ) hwModel
{
    return [[self class] _GetSysInfoByName: "hw.model"];
}

//  ------------------------------------------------------------------------------------------------
+ ( NSString * ) hwPlatform
{
    return [[self class] _GetSysInfoByName: "hw.machine"];
}

//  ------------------------------------------------------------------------------------------------
+ ( NSString * ) platformName
{
    NSDictionary                  * hardwareInfo;
    
    hardwareInfo                    = [[self class] _GetDeviceHardwareInformation: [[self class] _GetSysInfoByName: "hw.machine"]];
    if ( nil == hardwareInfo )
    {
        return nil;
    }
    
    return [hardwareInfo objectForKey: @"Show String"];
}


//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------

@end

//  ------------------------------------------------------------------------------------------------
//  ------------------------------------------------------------------------------------------------





















