//
//  EPSStaticTableViewController.m
//  EPSStaticTableViewController
//
//  Created by Justin Stuart on 10/18/13.
//  Copyright (c) 2013 Electric Peel, LLC. All rights reserved.
//

#import "EPSStaticTableViewController.h"

@interface EPSStaticTableViewController ()

@end

@implementation EPSStaticTableViewController

#pragma mark - Public Methods

- (NSIndexPath *)indexPathForIdentifier:(NSString *)identifier {
    for (NSInteger section = 0; section < [self numberOfSectionsInTableView:self.tableView]; section++) {
        for (NSInteger row = 0; row < [self tableView:self.tableView numberOfRowsInSection:section]; row++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            NSString *anIdentifier = [self identifierForIndexPath:indexPath];
            
            if ([anIdentifier isEqualToString:identifier]) return indexPath;
        }
    }
    
    return nil;
}

- (NSArray *)identifiers {
    return nil;
}

- (UITableViewCell *)cellForIdentifier:(NSString *)indentifier withTableView:(UITableView *)tableView {
    return nil;
}

- (void)didSelectRowWithIdentifier:(NSString *)identifier withTableView:(UITableView *)tableView {
}

#pragma mark - Private Methods

- (NSString *)identifierForIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = [self identifiers][indexPath.section][indexPath.row];
    
    return identifier;
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self identifiers] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self identifiers][section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = [self identifierForIndexPath:indexPath];
    
    UITableViewCell *cell = [self cellForIdentifier:identifier withTableView:self.tableView];
    
    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = [self identifierForIndexPath:indexPath];
    [self didSelectRowWithIdentifier:identifier withTableView:self.tableView];
}

@end
