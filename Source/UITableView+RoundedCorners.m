//
//  UITableView+RoundedCorners.m
//
//  Copyright © 2016 Maarten Berendschot. All rights reserved.
//  Version 0.1
//

#import "UITableView+RoundedCorners.h"

@implementation UITableView (RoundedCorners)

- (void)displayCell:(UITableViewCell *)cell withRoundedCornersAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger rows = [self numberOfRowsInSection:indexPath.section] - 1;
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CGRect cellBounds = CGRectMake(0, 0, self.bounds.size.width, cell.bounds.size.height);
    
    if (indexPath.row == 0 && indexPath.row == rows) {
        [layer setPath:[UIBezierPath bezierPathWithRoundedRect:cellBounds cornerRadius:5.0f].CGPath];
    } else if (indexPath.row == 0) {
        [layer setPath:[UIBezierPath bezierPathWithRoundedRect:cellBounds
                                               byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                                     cornerRadii:CGSizeMake(5.0f, 5.0f)].CGPath];
    } else if (indexPath.row == rows) {
        [layer setPath:[UIBezierPath bezierPathWithRoundedRect:cellBounds
                                               byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                     cornerRadii:CGSizeMake(5.0f, 5.0f)].CGPath];
    } else {
        [layer setPath:[UIBezierPath bezierPathWithRect:cell.bounds].CGPath];
    }
    
    [cell setMaskView:[[UIView alloc] initWithFrame:cell.bounds]];
    [cell.maskView.layer insertSublayer:layer atIndex:0];
    [cell.maskView.layer setMasksToBounds:YES];
    [cell setClipsToBounds:YES];
}

@end