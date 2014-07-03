//
//  EPSTestTableViewController.m
//  EPSStaticTableViewControllerTests
//
//  Created by Peter Stuart on 10/26/13.
//  Copyright (c) 2013 Electric Peel, LLC. All rights reserved.
//

#import "EPSTestTableViewController.h"

@interface EPSTestTableViewController ()

@end

@implementation EPSTestTableViewController

- (NSArray *)identifiers {
    return self.testIdentifiers;
}

- (UITableViewCell *)cellForIdentifier:(NSString *)identifier withTableView:(UITableView *)tableView {
    [self.delegate testTableViewController:self wasAskedForCellForIdentifier:identifier];
    
    return nil;
}

- (void)didSelectRowWithIdentifier:(NSString *)identifier withTableView:(UITableView *)tableView {
    [self.delegate testTableViewController:self wasToldViewRowWasSelectedForIdentifier:identifier];
}

@end
