//
//  EPSStaticTableViewControllerTestsTests.m
//  EPSStaticTableViewControllerTestsTests
//
//  Created by Peter Stuart on 10/26/13.
//  Copyright (c) 2013 Electric Peel, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "EPSStaticTableViewController.h"
#import "EPSTestTableViewController.h"

@interface EPSStaticTableViewControllerTestsTests : XCTestCase <EPSTestTableViewControllerDelegate>

@property (nonatomic) NSString *cellIdentifier;
@property (nonatomic) NSString *rowIdentifier;

@end

@implementation EPSStaticTableViewControllerTestsTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
    
    self.cellIdentifier = nil;
    self.rowIdentifier = nil;
}

#pragma mark -

- (EPSTestTableViewController *)testTableViewController {
    return [[EPSTestTableViewController alloc] init];
}

#pragma mark -

- (void)testConformsToRequiredDataSourceMethods {
    EPSStaticTableViewController *tableViewController = [[EPSStaticTableViewController alloc] initWithStyle:UITableViewStylePlain];

    XCTAssertTrue([tableViewController respondsToSelector:@selector(tableView:numberOfRowsInSection:)] == YES, @"Should respond to tableView:numberOfRowsInSection:");
    XCTAssertTrue([tableViewController respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)] == YES, @"Should respond to tableView:cellForRowAtIndexPath:");
}

- (void)testCanGetIndexPathForIdentifier {
    EPSTestTableViewController *viewController = [self testTableViewController];
    viewController.testIdentifiers = @[ @[ @"1A", @"1B" ], @[ @"2A", @"2B", @"2C" ], @[ @"3A" ] ];
    
    NSIndexPath *indexPath1A = [viewController indexPathForIdentifier:@"1A"];
    XCTAssertEqual(indexPath1A.section, 0, @"");
    XCTAssertEqual(indexPath1A.row, 0, @"");
    
    NSIndexPath *indexPath2B = [viewController indexPathForIdentifier:@"2B"];
    XCTAssertEqual(indexPath2B.section, 1, @"");
    XCTAssertEqual(indexPath2B.row, 1, @"");
    
    NSIndexPath *indexPath3A = [viewController indexPathForIdentifier:@"3A"];
    XCTAssertEqual(indexPath3A.section, 2, @"");
    XCTAssertEqual(indexPath3A.row, 0, @"");
}

- (void)testCellForIndexPathIsCalled {
    EPSTestTableViewController *viewController = [self testTableViewController];
    viewController.testIdentifiers = @[ @[ @"1A", @"1B" ], @[ @"2A", @"2B", @"2C" ], @[ @"3A" ] ];
    viewController.delegate = self;
    
    UITableView *tableView = [[UITableView alloc] init];
    
    [viewController tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:1]];
    
    XCTAssertEqualObjects(self.cellIdentifier, @"2C", @"");
}

- (void)testDidSelectRowIsCalled {
    EPSTestTableViewController *viewController = [self testTableViewController];
    viewController.testIdentifiers = @[ @[ @"1A", @"1B" ], @[ @"2A", @"2B", @"2C" ], @[ @"3A" ] ];
    viewController.delegate = self;
    
    UITableView *tableView = [[UITableView alloc] init];
    
    [viewController tableView:tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:1]];
    
    XCTAssertEqualObjects(self.rowIdentifier, @"2C", @"");
}

#pragma mark - EPSTestTableViewControllerDelegate Methods

- (void)testTableViewController:(EPSTestTableViewController *)viewController wasAskedForCellForIdentifier:(NSString *)identifier {
    self.cellIdentifier = identifier;
}

- (void)testTableViewController:(EPSTestTableViewController *)viewController wasToldViewRowWasSelectedForIdentifier:(NSString *)identifier {
    self.rowIdentifier = identifier;
}

@end
