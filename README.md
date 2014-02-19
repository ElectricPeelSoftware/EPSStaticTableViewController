EPSStaticTableViewController
============================

`EPSStaticTableViewController` is a subclass of `UITableViewController` that makes it easy to set up table views with static content.

To use `EPSStaticTableViewController`, subclass it and override these methods:

```objective-c
- (NSArray *)identifiers
```

In this method, return an array of arrays of `NSString` objects. Each inner array represents one section of the table view. For example, returning

```objective-c
@[ @[ @"One", @"Two" ], @[ @"A" ], @[ @"X", @"Y", @"Z" ] ]
```

will result in a table view with three sections, containing two, one, and three rows, respectively.

```objective-c
- (UITableViewCell *)cellForIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)indexPath withTableView:(UITableView *)tableView
```

This method works pretty much like the `UITableViewDelegate` method `tableView:cellForRowAtIndexPath:`, but you can use `identifier` to decide how to set up the cell, instead of using `indexPath`.

```objective-c
- (void)didSelectRowWithIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)indexPath withTableView:(UITableView *)tableView
```

This method works like the `UITableViewDelegate` method `tableView:didSelectRowAtIndexPath:`, but you can use `identifier` to decide what action to take, instead of using `indexPath`.
