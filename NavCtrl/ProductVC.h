//
//  ProductVC.h
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyVC.h"

#import "DataAccess.h"

@class CompanyVC;

@interface ProductVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *products;
//@property (nonatomic, retain) NSArray *appleLogo;
@property (nonatomic, retain) NSMutableArray<Product*> *listOfProduct;



//
//- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@property (nonatomic,strong, readonly)  NSArray *tempArray;
//-(void)removeTempArray:(NSArray *)objects;

@property (nonatomic, retain) DataAccess *dataAccess;

@end
