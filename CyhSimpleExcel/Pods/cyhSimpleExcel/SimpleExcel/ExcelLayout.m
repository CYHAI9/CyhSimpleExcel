//
//  ExcelLayout.m
//  SwiftCocopods
//
//  Created by 陈海哥 on 2017/10/17.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import "ExcelLayout.h"

@implementation ExcelLayout

- (instancetype)initcollectionlayoutItemsize:(CGSize)itemsize minlineSP:(CGFloat)minlineSP mininterSP:(CGFloat)mininterSP sectionInset:(UIEdgeInsets)sectionInset
{
    if ([super init]) {
        
        self.itemSize = itemsize;
        self.minimumLineSpacing = minlineSP;
        self.minimumInteritemSpacing = mininterSP;
        self.sectionInset = sectionInset;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        
    }
    
    return self;
}

@end
