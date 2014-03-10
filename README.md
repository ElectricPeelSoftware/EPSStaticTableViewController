# EPSStaticTableViewController

`EPSStaticTableViewController` is a subclass of `UITableViewController` that makes it easy to set up table views with static content.

## Usage

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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowWithIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)indexPath
```

This method replaces the `UITableViewDelegate` method `tableView:cellForRowAtIndexPath:`, making it so that you can use `identifier` to decide how to set up the cell, instead of using `indexPath`.

```objective-c
- (void)tableView:(UITableView *)tableView didSelectRowWithIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)indexPath
```

This method replaces the `UITableViewDelegate` method `tableView:didSelectRowAtIndexPath:`, making it so that you can use `identifier` to decide what action to take, instead of using `indexPath`.

## Installation

EPSStaticTableVIewController is available through [CocoaPods](http://cocoapods.org), to install it simply add the following line to your Podfile:

```ruby
pod "EPSStaticTableViewController"
```

Alternatively, include `EPSStaticTableViewController.h` and `EPSStaticTableViewController.m` in your project.

## License

EPSStaticTableViewController is available under the MIT license. See the LICENSE file for more info.