//
//  CyhExcelSimple.h
//  SwiftCocopods
//
//  Created by 陈海哥 on 2017/10/17.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CyhExcelSimple : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/**
 创建单个表
 @param Title 表主题
 @param listTitles 行主题
 @param valuesTitle 数据值名称
 @param Values 数据值
 */
- (void)setExcelTitle:(NSString *)Title excelListTitle:(NSArray *)listTitles excelValueTitle:(NSArray *)valuesTitle excelValues:(NSArray *)Values;

/**
 修改表格样式
 */
- (void)setExcelType:(void (^)(UILabel * ExcelTileLabel,UILabel * listTitleLabel,UILabel * valuesTitleLabel,UILabel * ValuesLable))fixExcelTypeBloack;

@end
