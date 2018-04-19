//
//  CompanyInfo.m
//  NavCtrl
//
//  Created by Wilmer sinchi on 4/3/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "CompanyInfo.h"
#import "CompanyVC.h"
#import "DataAccess.h"
#import "Company.h"
#import "Product.h"

@interface CompanyInfo ()
{
    
    IBOutlet UIStackView *custom;
    CompanyVC *mainViewController;
}
@end

@implementation CompanyInfo
- (IBAction)cName:(id)sender {
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButton:)];
    self.navigationItem.leftBarButtonItem = cancel;
    
    UIBarButtonItem *save = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButton:)];
    self.navigationItem.rightBarButtonItem = save;
    
    mainViewController = [[CompanyVC alloc] init];
    
    
    // Do any additional setup after loading the view from its nib.
    self.title = @"New Company";
    
}

-(void) saveButton:(id)sender {
    
    //make a a temp arrar to alloc and creat an object
    Company *tempCompany = [[Company alloc] initWithName:[_companyName text] andLogo:[_url text] andStockPrice:[_stockPrices text]];
    
    [[DataAccess dataAccess] addCompany:tempCompany];
    
//    DataAccess *companiesArray = [[DataAccess alloc] init];
//
//
//    newCompany = companiesArray.listOfCompanies;
//    
//    newCompany = [NSMutableArray arrayWithObjects:[_companyName text],[_stockPrices text],[_url text],nil];
//
//
//    
    
//    [companiesArray.listOfCompanies addObjectsFromArray:newCompany];
    
//    Company *newCompany = self.newCompany1;
//
//
//
//    self.companyName.text = newCompany.name;
//    self.stockPrices.text = newCompany.stockPrice;
//    self.url.text = newCompany.logo;
//    [companiesArray.listOfCompanies addObject:newCompany];
    
    self.navigationItem.rightBarButtonItem.title = @"Save";
    
    
    // Create a new BNRItem and add it to the store
//    Company *newItem = [[DataAccess dataAccess] listOfCompanies];
    
}

-(void) cancelButton:(id)sender{
    self.navigationItem.leftBarButtonItem.title = @"Cancel";
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    
    
    
    }
//- (BOOL)textField:(UITextField *)textFieldshouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    _url.returnKeyType = UIReturnKeyDone;
//    _stockPrices.returnKeyType = UIReturnKeyDone;
//    
//}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_url resignFirstResponder];
    [_stockPrices resignFirstResponder];
    [_companyName resignFirstResponder];

    return true;

}


- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    
    [super viewWillDisappear:animated];
    // Clear first responder
    [self.view endEditing:YES];
    // "Save" changes to item
//    Company *newCompany2 = self.newCompany1;
//    newCompany2.name = self.companyName.text;
//    newCompany2.stockPrice = self.stockPrices.text;
//    newCompany2.logo = self.url.text;
}






//thie keybpard show button 5
#pragma mark - keyboard movements
- (void)keyboardWillShow:(NSNotification *)notification
{
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        //this is where you fixed the postion of the keybad
        f.origin.y = -keyboardSize.height + (keyboardSize.height / 1.5) ;
        self.view.frame = f;
    }];
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = 0.0f;
        self.view.frame = f;
    }];
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//

- (void)dealloc {
    [_companyName release];
    [_stockPrices release];
    [_url release];
    [custom release];
    [super dealloc];
}
@end
