//
//  UITableView+RoundedCorners.h
//
//  Copyright © 2016 Maarten Berendschot. All rights reserved.
//  Version 0.1
//

#import <UIKit/UIKit.h>

@interface UITableView (RoundedCorners)

- (void)displayCell:(UITableViewCell *)cell withRoundedCornersAtIndexPath:(NSIndexPath *)indexPath;

@end
