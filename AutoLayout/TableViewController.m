//
//  TableViewController.m
//  AutoLayout
//
//  Created by Johnson on 6/17/15.
//  Copyright (c) 2015 Johnson. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray *arrayWithDataSourse;

@property (nonatomic, strong) TableViewCell *cell;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *string = @"放假啊离开放假快疯;了姐啊事发路口;附近放假了;看时间浪费健康;减肥离;开撒娇菲卡;嘉咖啡的机票;好突然诶破题怕就离开减肥放假啊离开放;假快疯了姐啊事发路口附近放假了看时间浪费健康减肥离开撒娇菲卡嘉咖啡的机票好突然诶破题怕就离开减肥放假啊离开放假快疯了;姐啊事发路口附近放假了看时间浪费健康减肥离开撒娇菲卡嘉咖啡的机票好突然诶破题怕就离开减肥放假啊离开放假快疯了姐啊事发路口附近放假;了看时间浪费健康减肥离开撒娇菲卡嘉咖啡的机票好突然诶破题怕就离开减肥放假啊离开放假快疯了姐啊;事发路口附近放假;了看时间浪费健康减肥离开撒娇菲卡嘉咖啡的机票好突然诶破题怕就离开减肥放假啊离开放假快疯了姐啊事发路口附近放假了看;时间浪费健康减肥离开撒娇菲卡嘉咖啡的机票好突然诶破题怕就离开减肥放假啊离开放假快疯了姐啊事发路口附近放假了看时间浪费健康减肥离开撒娇菲卡嘉咖啡的机票好突然诶破题怕就离开减肥放假啊离开放假快疯了姐啊事发路;口附近放假了看时间浪费健康减肥离开撒娇菲卡嘉咖啡的机票好突然诶破题怕就离开减肥放假啊离开放假快疯了姐啊事发路口附近放假了看时间浪费健康减肥离开撒娇菲卡嘉咖啡的机票好突然诶破题怕就离开减肥放假啊离开放假快疯了姐啊事发路口附近放假了;看时间浪费;健康减肥离开撒娇菲卡嘉咖啡的机票好突然诶破题怕就离开减肥放假啊离开放假快疯了姐啊事;发路口附近放假了看时间浪费健康减肥;离开撒娇菲卡嘉;咖啡的机票好突然诶破题怕就离开减肥放假啊离开放假快疯了姐啊事发路口附近放假了看时间浪费健康减肥离开;撒娇菲卡;嘉咖啡的机票好突然诶破题怕就离开减肥                   发   ";
    self.arrayWithDataSourse = [string componentsSeparatedByString:@";"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.arrayWithDataSourse.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    [cell setInfo:self.arrayWithDataSourse[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    typeof(self) __weak wself = self;
    return [self calculateCellHeightWithCellWidth:CGRectGetWidth([[UIScreen mainScreen] bounds]) initCellBlock:^UITableViewCell *{
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
        [cell setInfo:wself.arrayWithDataSourse[indexPath.row]];
        return cell;
    }];
}

- (CGFloat)calculateCellHeightWithCellWidth:(CGFloat)cellWidth initCellBlock:(UITableViewCell * (^)())initCellBlock
{
    if (!initCellBlock) return 44;
    UITableViewCell *cell = initCellBlock ? initCellBlock() : nil;
    
    cell.contentView.bounds = CGRectMake(0, 0, cellWidth, 0);
    
    [cell prepareForReuse];
    
    NSLayoutConstraint *tempWidthConstraint =
    [NSLayoutConstraint constraintWithItem:cell.contentView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0f
                                  constant:cellWidth];
    [cell.contentView addConstraint:tempWidthConstraint];
    
    CGSize fittingSize = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    [cell.contentView removeConstraint:tempWidthConstraint];
    
    return fittingSize.height + 1;
}

@end
