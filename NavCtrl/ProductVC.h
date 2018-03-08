//
//  ProductVC.h
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyVC.h"

@class CompanyVC;

@interface ProductVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *products;

@property (nonatomic, retain) NSMutableArray *website;
@property (nonatomic, retain) NSMutableArray *website2;
@property (nonatomic, retain) NSMutableArray *website3;
@property (nonatomic, retain) NSMutableArray *website4;

//WHen you want to remove an object from the array you must set it up as an NSMutable array so it can be modified.
@property (nonatomic, retain) NSMutableArray *item;
@property (nonatomic, retain) NSMutableArray *item2;
@property (nonatomic, retain) NSMutableArray *item3;
@property (nonatomic, retain) NSMutableArray *item4;

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@property (nonatomic,strong, readonly)  NSArray *tempArray;
//-(void)removeTempArray:(NSArray *)objects;

@end
