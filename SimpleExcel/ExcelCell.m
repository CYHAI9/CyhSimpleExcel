//
//  ExcelCell.m
//  SwiftCocopods
//
//  Created by 陈海哥 on 2017/10/17.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import "ExcelCell.h"

@implementation ExcelCell

- (UILabel *)ExcelTextLabel
{
    if (!_ExcelTextLabel) {
        _ExcelTextLabel = [[UILabel alloc] initWithFrame:self.contentView.frame];
        _ExcelTextLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return  _ExcelTextLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
//        self.ExcelTextLabel.backgroundColor = [UIColor orangeColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.ExcelTextLabel];
    }
    
    return self;
}

- (void)setExcelText:(NSString *)excelText
{
    _excelText = excelText;
    self.ExcelTextLabel.text = excelText;
}

@end
