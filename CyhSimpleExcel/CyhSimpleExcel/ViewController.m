//
//  ViewController.m
//  CyhSimpleExcel
//
//  Created by 陈海哥 on 2017/10/17.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import "ViewController.h"
#import <CyhExcelSimple.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Excel" ofType:@"plist"];
    NSDictionary * dataSource = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    //    NSLog(@"plist文件数据:\n%@",dataSource[@"data"]);
    CyhExcelSimple * excelView = [[CyhExcelSimple alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, 200)];
    [self.view addSubview:excelView];
    NSArray * excelSource = dataSource[@"data"];
    NSDictionary * excel01Data = excelSource[0];
    [excelView setExcelTitle:excel01Data[@"ExcelTitle"] excelListTitle:excel01Data[@"ExcelListTitle"] excelValueTitle:excel01Data[@"ExcelValueTitle"] excelValues:excel01Data[@"ExcelListValues"]];
    [excelView setExcelType:^(UILabel *ExcelTileLabel, UILabel *listTitleLabel, UILabel *valuesTitleLabel, UILabel *ValuesLable) {
        ExcelTileLabel.backgroundColor = [UIColor orangeColor];
        listTitleLabel.backgroundColor = [UIColor blueColor];
        valuesTitleLabel.backgroundColor = [UIColor yellowColor];
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
