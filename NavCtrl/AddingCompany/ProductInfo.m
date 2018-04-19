//
//  ProductInfo.m
//  NavCtrl
//
//  Created by Wilmer sinchi on 4/5/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "ProductInfo.h"
#import "ProductVC.h"


@interface ProductInfo ()
{
    ProductVC *pViewController;
}

@end

@implementation ProductInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBarButtonItem *save = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButton:)];
    self.navigationItem.rightBarButtonItem = save;
    // Do any additional setup after loading the view from its nib.
    self.title = @"Edit Product";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)saveButton:(id)sender {
    
    
    Product *tempProduct = [[Product alloc] initWithProductName:[_productNames2 text] andProductURL:[_productsURL2 text] andProductLogo:[_productImages2 text]];
    //this one is different, where you are adding the index toooo
[[DataAccess dataAccess] addProduct: tempProduct withInde: _path];
    self.navigationItem.rightBarButtonItem.title = @"Save";
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_productNames2 resignFirstResponder];
    [_productImages2 resignFirstResponder];
    [_productsURL2 resignFirstResponder];
    return true;
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    
    [_productsURL2 release];
    [_productImages2 release];
    [_productNames2 release];
    [super dealloc];
}
@end
