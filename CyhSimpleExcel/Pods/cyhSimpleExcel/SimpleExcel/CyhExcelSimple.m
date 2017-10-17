//
//  CyhExcelSimple.m
//  SwiftCocopods
//
//  Created by 陈海哥 on 2017/10/17.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import "CyhExcelSimple.h"
#import "ExcelCell.h"
#import "ExcelLayout.h"
@interface CyhExcelSimple()
@property (nonatomic , strong)NSMutableDictionary * excelListDicton;
@property (nonatomic , strong)UICollectionView * excelCollectionview;
@property (nonatomic , copy)NSString * exTitle;
@property (nonatomic , copy)void(^fixEceltype)(UILabel *,UILabel*,UILabel*,UILabel *);

@end

@implementation CyhExcelSimple
{
    NSInteger rowNum;
    NSInteger groupNum;
}
- (UICollectionView *)excelCollectionview
{
    if (!_excelCollectionview) {
        ExcelLayout * layout = [[ExcelLayout alloc] initcollectionlayoutItemsize:CGSizeMake(self.frame.size.width/rowNum - 1, self.frame.size.height/groupNum - 1) minlineSP:0 mininterSP:0 sectionInset:UIEdgeInsetsMake(0, 0, 1, 1)];
        _excelCollectionview = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
        _excelCollectionview.delegate = self;
        _excelCollectionview.dataSource = self;
        [_excelCollectionview registerClass:[ExcelCell class] forCellWithReuseIdentifier:@"ExcelCell"];
    }
    
    return _excelCollectionview;
}

- (NSMutableDictionary *)excelListDicton
{
    if (!_excelListDicton) {
        _excelListDicton = [NSMutableDictionary new];
    }
    
    return _excelListDicton;
}

- (void)setExcelTitle:(NSString *)Title excelListTitle:(NSArray *)listTitles excelValueTitle:(NSArray *)valuesTitle excelValues:(NSArray *)Values
{
    self.exTitle = Title;
    groupNum = listTitles.count + 1;
    rowNum = valuesTitle.count + 1;
    [self.excelListDicton setValue:listTitles forKey:@"listTitles"];
    [self.excelListDicton setValue:valuesTitle forKey:@"valuesTile"];
    [self.excelListDicton setValue:Values forKey:@"Values"];
    [self addSubview:self.excelCollectionview];
    [self.excelCollectionview reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return groupNum;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return rowNum;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ExcelCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ExcelCell" forIndexPath:indexPath];
    if (indexPath.row == 0&&indexPath.section == 0) {
        cell.excelText = self.exTitle;
        self.fixEceltype?self.fixEceltype(cell.ExcelTextLabel, nil, nil,nil):nil;
    }
    else if (indexPath.row == 0&&indexPath.section != 0)
    {
        cell.excelText = self.excelListDicton[@"listTitles"][indexPath.section - 1];
        self.fixEceltype?self.fixEceltype(nil, cell.ExcelTextLabel, nil,nil):nil;

    }
    else if (indexPath.section == 0&&indexPath.row != 0)
    {
        cell.excelText = self.excelListDicton[@"valuesTile"][indexPath.row - 1];
        self.fixEceltype?self.fixEceltype(nil,nil, cell.ExcelTextLabel,nil):nil;

    }
    else
    {
        cell.excelText = self.excelListDicton[@"Values"][indexPath.section - 1][indexPath.row - 1];
        self.fixEceltype?self.fixEceltype(nil,nil,nil,cell.ExcelTextLabel):nil;

    }
    return cell;
}

- (void)setExcelType:(void (^)(UILabel *, UILabel *, UILabel *, UILabel *))fixExcelTypeBloack
{
    self.fixEceltype = fixExcelTypeBloack;
    
}


@end
