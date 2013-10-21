//
//  EPSExampleViewController.m
//  StaticTableViewExample
//
//  Created by Peter Stuart on 10/21/13.
//  Copyright (c) 2013 Electric Peel, LLC. All rights reserved.
//

#import "EPSExampleViewController.h"

NSString * const EPSExampleViewControllerCellIdentifier = @"Cell";

@interface EPSExampleViewController ()

@end

@implementation EPSExampleViewController

- (NSArray *)identifiers {
    return @[ @[ @"One", @"Two" ], @[ @"Three", @"Four" ] ];
}

- (UITableViewCell *)cellForIdentifier:(NSString *)identifier  indexPath:(NSIndexPath *)indexPath withTableView:(UITableView *)tableView {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EPSExampleViewControllerCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:EPSExampleViewControllerCellIdentifier];
    }
    
    NSString *title;
    if ([identifier isEqualToString:@"One"]) title = NSLocalizedString(@"Cell One", nil);
    else if ([identifier isEqualToString:@"Two"]) title = NSLocalizedString(@"Cell Two", nil);
    else if ([identifier isEqualToString:@"Three"]) title = NSLocalizedString(@"Cell Three", nil);
    else title = NSLocalizedString(@"Cell Four", nil);
    
    cell.textLabel.text = title;
    
    return cell;
}

- (void)didSelectRowWithIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)indexPath withTableView:(UITableView *)tableView {
    NSString *title;
    if ([identifier isEqualToString:@"One"]) title = NSLocalizedString(@"Alert One", nil);
    else if ([identifier isEqualToString:@"Two"]) title = NSLocalizedString(@"Alert Two", nil);
    else if ([identifier isEqualToString:@"Three"]) title = NSLocalizedString(@"Alert Three", nil);
    else title = NSLocalizedString(@"Alert Four", nil);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
