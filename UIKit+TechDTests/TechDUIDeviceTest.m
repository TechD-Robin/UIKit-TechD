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
    
    info                        = [UIDevice hwPlatform];
    NSLog( @" %@", info );
    XCTAssertNotNil( info , @"information string should not be nil");

    
    
    NSLog( @"model : %@", [[UIDevice currentDevice] model] );
    
}

//  ------------------------------------------------------------------------------------------------
- ( void ) testPlatformInformation
{
    NSString                  * info;
    
    info                        = [UIDevice platformName];
    NSLog( @"platform name :%@", info );
    XCTAssertNotNil( info , @"information string should not be nil");
    
}



//  ------------------------------------------------------------------------------------------------


@end

































