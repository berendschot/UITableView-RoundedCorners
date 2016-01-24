//
//  UITableView+RoundedCorners.m
//
//  Copyright © 2016 Maarten Berendschot. All rights reserved.
//  Version 0.1
//

#import "UITableView+RoundedCorners.h"

@implementation UITableView (RoundedCorners)

static BOOL shouldAddSeperator = YES;

- (void)addSeperator:(BOOL)addSeperator {
    shouldAddSeperator = addSeperator;
}

- (void)displayCell:(UITableViewCell *)cell withRoundedCornersAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger rows = [self numberOfRowsInSection:indexPath.section] - 1;
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CGRect cellBounds = CGRectMake(0, 0, self.bounds.size.width, cell.bounds.size.height);
    
    BOOL addSeperator = NO;
    
    if (indexPath.row == 0 && indexPath.row == rows) {
        [layer setPath:[UIBezierPath bezierPathWithRoundedRect:cellBounds cornerRadius:5.0f].CGPath];
    } else if (indexPath.row == 0) {
        [layer setPath:[UIBezierPath bezierPathWithRoundedRect:cellBounds
                                               byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                                     cornerRadii:CGSizeMake(5.0f, 5.0f)].CGPath];
        addSeperator = YES;
    } else if (indexPath.row == rows) {
        [layer setPath:[UIBezierPath bezierPathWithRoundedRect:cellBounds
                                               byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                     cornerRadii:CGSizeMake(5.0f, 5.0f)].CGPath];
    } else {
        [layer setPath:[UIBezierPath bezierPathWithRect:cell.bounds].CGPath];
        addSeperator = YES;
    }
    
    [cell setMaskView:[[UIView alloc] initWithFrame:cell.bounds]];
    [cell.maskView.layer insertSublayer:layer atIndex:0];
    
    if (shouldAddSeperator == YES && addSeperator == YES) {
        CGFloat seperator = (1.0f / [UIScreen mainScreen].scale);
        CALayer *cellSeperator = [[CALayer alloc] init];
        
        [cellSeperator setFrame:CGRectMake(15.0f, cell.bounds.size.height - seperator, cell.bounds.size.width - 15.0f, seperator)];
        [cellSeperator setBackgroundColor:self.separatorColor.CGColor];
        [cell.layer addSublayer:cellSeperator];
    }
    
    [cell.maskView.layer setMasksToBounds:YES];
    [cell setClipsToBounds:YES];
}

@end