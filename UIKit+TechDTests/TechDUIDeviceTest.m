//
//  TechDUIDeviceTest.m
//  UIKit+TechD
//
//  Created by Robin Hsu on 2015/4/30.
//  Copyright (c) 2015年 TechD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "UIDevice+TechD.h"

@interface TechDUIDeviceTest : XCTestCase

@end

@implementation TechDUIDeviceTest

//  ------------------------------------------------------------------------------------------------
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

//  ------------------------------------------------------------------------------------------------
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//  ------------------------------------------------------------------------------------------------
- ( void ) testGetHardwareInfo
{
    NSString                  * info;
 
    NSLog( @"is simulator : %d", [UIDevice isSimulator] );
    
    info                        = [UIDevice hwModel];
    NSLog( @" %@", info );
    XCTAssertNotNil( info , @"information string should not be nil");
    
    info                        = [UIDevice hwMachine];
    NSLog( @" %@", info );
    XCTAssertNotNil( info , @"information string should not be nil");

    
    
    NSLog( @"model : %@", [[UIDevice currentDevice] model] );
    
}

//  ------------------------------------------------------------------------------------------------
- ( void ) testPlatformInformation
{
    NSString                  * info;
    NSArray                   * list;
    CGSize                      physicalPixelsSize;
    CGSize                      renderedPixels;
    float                       aspectRatio;
    
    info                        = [UIDevice devicePlatform];
    XCTAssertNotNil( info , @"device platform string should not be nil");

    NSLog( @"family %ld", (long)[UIDevice devicePlatformFamily] );
    
    physicalPixelsSize          = CGSizeZero;
    physicalPixelsSize          = [UIDevice devicePhysicalPixels];
    XCTAssertTrue( !CGSizeEqualToSize( physicalPixelsSize, CGSizeZero ) ,@"device physical pixels size should not be Zero" );
    NSLog( @"physical pixels size : %@", NSStringFromCGSize( physicalPixelsSize ) );
    
    renderedPixels              = CGSizeZero;
    renderedPixels              = [UIDevice deviceRenderedPixels];
    XCTAssertTrue( !CGSizeEqualToSize( renderedPixels, CGSizeZero ) ,@"device rendered pixels size should not be Zero" );
    NSLog( @"rendered pixels size : %@", NSStringFromCGSize( renderedPixels ) );
    
    aspectRatio                 = 0.0f;
    aspectRatio                 = [UIDevice devicePhysicalAspectRatio];
    XCTAssertNotEqual( aspectRatio, 0.0f, @"device physical pixels's aspect ratio should not equal 0." );
    NSLog( @"device physical pixels's aspect ratio : %f", aspectRatio );

    aspectRatio                 = 0.0f;
    aspectRatio                 = [UIDevice deviceRenderedAspectRatio];
    XCTAssertNotEqual( aspectRatio, 0.0f, @"device rendered pixels's aspect ratio should not equal 0." );
    NSLog( @"device rendered pixels's aspect ratio : %f", aspectRatio );

    NSLog( @"device is iPhone4 Serials : %d", [UIDevice isIPhone4Serials] );
    NSLog( @"device is iPhone5 Serials : %d", [UIDevice isIPhone5Serials] );
    NSLog( @"device is iPhone6 : %d", [UIDevice isIPhone6] );
    NSLog( @"device is iPhone6 + : %d", [UIDevice isIPhone6Plus] );
    
    
    
    list                        = [UIDevice knownDevicePlatforms];
    XCTAssertNotNil( list , @"platforms list should not be nil");

#ifdef DEBUG
    list                        = [UIDevice knownDeviceIdentifiers];
    XCTAssertNotNil( list , @"identifiers list should not be nil");
    
#endif  //  End of  DEBUG.
    
}

//  ------------------------------------------------------------------------------------------------

- ( void ) testUIInfo
{
    UIScreen *mainScreen = [UIScreen mainScreen];
    NSLog(@"Screen bounds: %@, Screen resolution: %@, scale: %f, nativeScale: %f",
          NSStringFromCGRect(mainScreen.bounds), mainScreen.coordinateSpace, mainScreen.scale, mainScreen.nativeScale);
    
    UIScreen                  * screen;
    
    screen                      = [UIScreen mainScreen];
    
    NSLog( @"now screen scale : %f", [screen scale] );
    NSLog( @"now screen nativeScale : %f", [screen nativeScale] );
    
    NSLog( @"canvas bounds : %@", NSStringFromCGRect( [screen bounds] ) );
    NSLog( @"native bounds : %@", NSStringFromCGRect( [screen nativeBounds] ) );

    NSLog( @"applicationFrame : %@", NSStringFromCGRect( [screen applicationFrame] ) );
    
    //UIScreenMode
    NSLog( @"current mode %@", [screen currentMode] );
    NSLog( @"current mode %f", [screen currentMode].pixelAspectRatio );
    //<UIScreenMode: 0x17802f240; size = 1242.000000 x 2208.000000> // STANDARD
    //<UIScreenMode: 0x178226be0; size = 1125.000000 x 2001.000000> // ZOOMED ... maybe in physical machine ...
    
    
    
}



//  ------------------------------------------------------------------------------------------------


@end

































