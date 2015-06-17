//
//  TableViewCell.h
//  AutoLayout
//
//  Created by Johnson on 6/17/15.
//  Copyright (c) 2015 Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;
- (void)setInfo:(NSString *)info;

@end
