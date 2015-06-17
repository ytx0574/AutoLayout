//
//  TableViewCell.m
//  AutoLayout
//
//  Created by Johnson on 6/17/15.
//  Copyright (c) 2015 Johnson. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()



@end

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
    //这个b玩意儿一定要算对
//    self.label.preferredMaxLayoutWidth = 277;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.label sizeToFit];
}

- (void)setInfo:(NSString *)info
{
    self.label.text = info;
}

@end
