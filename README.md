# UITableView+RoundedCorners
Add rounded corners to UITableView sections.

### Usage
```obj-c
#import "UITableView+RoundedCorners.h"
```
```obj-c
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView displayCell:cell withRoundedCornersAtIndexPath:indexPath];
}
```

#### Version
0.1

### Todos
 - Rounded corners on cells with variable widths.

License
----

MIT
