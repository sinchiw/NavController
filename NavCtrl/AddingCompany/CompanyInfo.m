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
    DataAccess *dataaccess3;
}
@end

@implementation CompanyInfo
//- (IBAction)cName:(id)sender {
//
//}
//

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButton:)];
    self.navigationItem.leftBarButtonItem = cancel;
    
    UIBarButtonItem *save = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButton:)];
    self.navigationItem.rightBarButtonItem = save;
    
    mainViewController = [[CompanyVC alloc] init];
    
    
    // Do any additional setup after loading the view from its nib.
   // self.title = @"New Company";
    
}

-(void) hidebutton
{
    
    if ([self.navigationItem.title isEqualToString:@"Add New Company"]){
        //        companyInfoViewController.deleteCompany.hidden =YES;
        _deleteCompany.hidden = YES;
        
    }
    else {
        _deleteCompany.hidden = NO;
    }
}

-(void) saveButton:(id)sender {
    
    //make a a temp arrar to alloc and creat an object
    if([self.navigationItem.title isEqualToString: @"Edit Company"])    {
          [[DataAccess dataAccess] edditingCompanyWithID:_companyId withNewName:_companyName.text andCompanyStokSymbol:_stockPrices.text andCompanyLogo:_url.text];
        
    } else {
        Company *tempCompany = [[Company alloc] initWithName:[_companyName text] andLogo:[_url text] andTicker:[_stockPrices text]];
        
        [[DataAccess dataAccess] addCompany:tempCompany];
        //    [self.view endEditing: YES];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
//STILL WORKING ON THE IF AND ELSE STATEMETN TO UPDATE THE CURRENT COMPANY.


//    else
//    {
////        _selectedCompany = dataaccess3.listOfCompanies;
//    }
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
//    [self.url resignFirstResponder];
//    [self.stockPrices resignFirstResponder];
//    [self.companyName resignFirstResponder];

    
    //self.navigationItem.leftBarButtonItem.title = @"Cancel";
    
    [self.view endEditing:YES];

    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
 
 
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self hidebutton];

//    _url.text = @"";
//    _stockPrices.text = @"";
//    _companyName.text = @"";
    
    
//here where you connect the textfield to corresponding company, existing company.
    if(self.selectedCompany){
        self.companyName.text = _selectedCompany.name;
        self.stockPrices.text = _selectedCompany.ticker;
        self.url.text = _selectedCompany.logo;
        _deleteCompany.hidden = NO;
    }
    // setting the textfield cleared when you hit the add button
    else{
        self.companyName.text = @"";
        self.stockPrices.text = @"";
        self.url.text = @"";
        _deleteCompany.hidden = YES;
    }
 // moving the view around when the keyboard shows up.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    
    
    
    }
//- (BOOL)textField:(UITextField *)textFieldshouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    _url.returnKeyType = UIReturnKeyDone;
//    _stockPrices.returnKeyType = UIReturnKeyDone;
//    
//}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //when you hit the return button the keyboard will hide itslef and the view goes back to normal.
    [_url resignFirstResponder];
    [_stockPrices resignFirstResponder];
    [_companyName resignFirstResponder];

    return true;

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // when you touch anywhere outside the textfield so the keyboard can hide.
    [self.url resignFirstResponder];
    [self.stockPrices resignFirstResponder];
    [self.companyName resignFirstResponder];
    
}

//-(BOOL)textFieldShouldClear:(UITextField *)textField {
//    return YES;
//}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    
    
     // Clear first responder
 
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];

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
    
    [super dealloc];
}
- (IBAction)deletingCompany:(id)sender {
    
//    if( [self.navigationItem.title isEqualToString:@"Edit Company"])
//       {
////           _deleteCompany.hidden = YES;
////           trying to hide the button
//
//       }

//    mainViewController tableView:(UITableView *) canEditRowAtIndexPath:(NSIndexPath*)NSIndexPath
//    {
//
    //NSIndexPath *deletingRows = [ mainViewController.tableView indexPathForCell:];
    
    //self.companyId
    //[dataaccess3.listOfCompanies removeObjectAtIndex:self.companyId];
    //since you already  have the selected Compnany as the NSindexpath you just need this code below to remove the row and the cell togh3err
    
    [[DataAccess dataAccess].listOfCompanies removeObject:_selectedCompany];
    [self.navigationController popToRootViewControllerAnimated:YES];

}


    
    @end
    
