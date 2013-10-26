//
//  EPSTestTableViewController.h
//  EPSStaticTableViewControllerTests
//
//  Created by Peter Stuart on 10/26/13.
//  Copyright (c) 2013 Electric Peel, LLC. All rights reserved.
//

#import "EPSStaticTableViewController.h"

@protocol EPSTestTableViewControllerDelegate;

@interface EPSTestTableViewController : EPSStaticTableViewController

@property (nonatomic) NSArray *testIdentifiers; // Used in the identifiers method
@property (weak, nonatomic) id <EPSTestTableViewControllerDelegate> delegate;

@end

@protocol EPSTestTableViewControllerDelegate <NSObject>

- (void)testTableViewController:(EPSTestTableViewController *)viewController wasAskedForCellForIdentifier:(NSString *)identifier;
- (void)testTableViewController:(EPSTestTableViewController *)viewController wasToldViewRowWasSelectedForIdentifier:(NSString *)identifier;

@end