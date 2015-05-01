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
    CGSize                      PhysicalPixelsSize;
    
    info                        = [UIDevice devicePlatform];
    XCTAssertNotNil( info , @"device platform string should not be nil");
    
    PhysicalPixelsSize          = CGSizeZero;
    PhysicalPixelsSize          = [UIDevice devicePhysicalPixels];
    XCTAssertTrue( !CGSizeEqualToSize( PhysicalPixelsSize, CGSizeZero )  ,@"device physical pixels size should not be Zero" );
    
    list                        = [UIDevice knownDevicePlatforms];
    XCTAssertNotNil( list , @"platforms list should not be nil");

    list                        = [UIDevice knownDeviceIdentifiers];
    XCTAssertNotNil( list , @"identifiers list should not be nil");
}

//  ------------------------------------------------------------------------------------------------

- ( void ) testUIInfo
{
    UIScreen                  * screen;
    
    screen                      = [UIScreen mainScreen];
    
    NSLog( @"now screen scale : %f", [screen scale] );
    NSLog( @"now screen nativeScale : %f", [screen nativeScale] );
    
    NSLog( @"canvas bounds : %@", NSStringFromCGRect( [[UIScreen mainScreen] bounds] ) );
    NSLog( @"native bounds : %@", NSStringFromCGRect( [[UIScreen mainScreen] nativeBounds] ) );

    NSLog( @"applicationFrame : %@", NSStringFromCGRect( [[UIScreen mainScreen] applicationFrame] ) );

    
    [screen coordinateSpace];
    
    NSString                  * test;
    CGSize                      size;
    
    test                        = NSStringFromCGSize( CGSizeMake( 240.0f, 320.0f ) );
    test                        = @"{ 240.0f, 320.0f }";
    test                        = @"{}";
    size                        = CGSizeFromString( test );
    
    
    
}



//  ------------------------------------------------------------------------------------------------


@end

































