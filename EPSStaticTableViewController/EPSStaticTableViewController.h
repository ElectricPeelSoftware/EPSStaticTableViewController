//
//  EPSStaticTableViewController.h
//  EPSStaticTableViewController
//
//  Created by Justin Stuart on 10/18/13.
//  Copyright (c) 2013 Electric Peel, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPSStaticTableViewController : UITableViewController

/*! Returns the index path of the given identifier. Will only work if each identifier provided in `identifiers` is unique.
 \param identifier The identifier whose index path will be returned
 \return The index path of the given identifier. \c nil if the identifier is not found.
 */
- (NSIndexPath *)indexPathForIdentifier:(NSString *)identifier;

// Methods to override:

/*! Asks for an array of arrays of NSString objects, which will be used to determine the number of rows and sections in the table view. For example: \code return @[ @[ @"One", @"Two" ], @[ @"Three", @"Four" ] ]\endcode
 \returns An array of arrays of identifiers. Defaults to \c nil.
 */
- (NSArray *)identifiers;

/*! Asks for a cell for use in the row corresponding to the given identifier.
 \param identifier An \c NSString object provided in the identifiers method
 \param tableView A table-view object requesting the cell
 \returns An object inheriting from UITableViewCell that the table view can use for the specified identifier.
 */
- (UITableViewCell *)cellForIdentifier:(NSString *)indentifier withTableView:(UITableView *)tableView;

/*! Tells the view controller that the row corresponding to the specified identifier is now selected.
 \param identifier An \c NSString object provided in the identifiers method
 \param tableView A table-view object informing the view controller about the new row selection
 */
- (void)didSelectRowWithIdentifier:(NSString *)identifier withTableView:(UITableView *)tableView;

@end
