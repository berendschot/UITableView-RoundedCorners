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

## License
Copyright (c) 2016 Maarten Berendschot

Apache License 2.0
