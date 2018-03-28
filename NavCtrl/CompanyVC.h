//
//  CompanyVC.h
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ProductVC;

@interface CompanyVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
//@property (nonatomic, retain) NSMutableArray *companyList;
//@property (nonatomic, retain) NSArray *compnayLogos;

//@property (nonatomic, retain) NSMutableArray *listOfCompanies;


@end
