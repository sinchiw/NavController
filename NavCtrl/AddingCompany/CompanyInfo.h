//
//  CompanyInfo.h
//  NavCtrl
//
//  Created by Wilmer sinchi on 4/3/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"

@interface CompanyInfo : UIViewController <UITextFieldDelegate>
- (IBAction)deletingCompany:(id)sender;
@property (nonatomic, retain) IBOutlet UIButton *deleteCompany;
@property (retain, nonatomic) IBOutlet UITextField *companyName;
@property (retain, nonatomic) IBOutlet UITextField *stockPrices;
@property (retain, nonatomic) IBOutlet UITextField *url;

@property (nonatomic, strong)  Company *selectedCompany;
@property  NSInteger companyId;

//@property (nonatomic, strong)  Company *newCompany1;
@end
