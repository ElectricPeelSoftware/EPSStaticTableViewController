//
//  Tests.m
//  Tests
//
//  Created by Peter Stuart on 7/3/14.
//  Copyright (c) 2014 Electric Peel, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <EPSStaticTableViewController/EPSStaticTableViewController.h>
#import "EPSTestViewController.h"

@interface Tests : XCTestCase

@property (nonatomic) EPSTestViewController *viewController;

@end

@implementation Tests

- (void)setUp {
    [super setUp];
    
    self.viewController = [EPSTestViewController new];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testNumberOfSections {
    self.viewController.testIdentifiers = @[ @[], @[], @[] ];
    XCTAssertEqual([self.viewController numberOfSectionsInTableView:self.viewController.tableView], 3, @"");
}

- (void)testNumberOfRows {
    self.viewController.testIdentifiers = @[ @[], @[ @"1", @"2", @"3", @"4"], @[] ];
    XCTAssertEqual([self.viewController tableView:self.viewController.tableView numberOfRowsInSection:1], 4, @"");
}

@end
