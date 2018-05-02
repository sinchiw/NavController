//
//  ProductConf.m
//  NavCtrl
//
//  Created by Wilmer sinchi on 4/5/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "ProductConf.h"
#import "WKWebVC.h"
#import "DataAccess.h"
#import "Product.h"
#import "Company.h"

@interface ProductConf ()
{
    WKWebVC *webViewController;
 DataAccess *dataAccess2;
    Product *products;
    CompanyVC *prodcutslist;
    
    
//    int *index_path1;
}
@property (retain,nonatomic) DataAccess *companyInfo;
@end

@implementation ProductConf
- (IBAction)deletefunction:(id)sender {
//    Company *companyFromList = dataAccess.listOfCompanies[indexPath.row];
    
//    [[removeObject: webViewController. ];
    
    
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    products = [[Product alloc] init];
    prodcutslist =[[CompanyVC alloc]init];
//    [Product *listofParoduct] = self.
    
//    dataAccess3 = [[DataAccess alloc] init];

    UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButton:)];
    self.navigationItem.leftBarButtonItem = cancel;
    
    UIBarButtonItem *save = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButton:)];
    self.navigationItem.rightBarButtonItem = save;
    self.title = @"Edit Product";
    webViewController  =[[WKWebVC alloc] init];
    // Do any additional setup after loading the view from its nib.
}
-(void) cancelButton:(id)sender{
    self.navigationItem.leftBarButtonItem.title = @"Cancel";
    [self.navigationController popViewControllerAnimated:YES];
}
-(void) saveButton:(id)sender {
    self.navigationItem.rightBarButtonItem.title = @"Save";
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_productNames1 resignFirstResponder];
    [_productURLs resignFirstResponder];
    [_productsImage resignFirstResponder];
     return true;
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   // Company *companyFromList2 = [dataAccess2.listOfCompanies objectAtIndex: _path];
//    Product *listFromProduct= [self.listOfProduct objectAtIndex:path];
    
    
//    self.productURLs.text = [_companyInfo.listOfCompanies ];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    if(self.selectedProduct){
        self.productNames1.text = _selectedProduct.productName;
        self.productURLs.text = _selectedProduct.productURL;
        self.productsImage.text = _selectedProduct.productLogo;
    }
    // setting the textfield cleared when you hit the add button
    else{
        self.productNames1.text = @"";
        self.productURLs.text = @"";
        self.productsImage.text = @"";
    

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)productNames1:(id)sender {
}
- (void)dealloc {
    [_productNames1 release];
    [_productURLs release];
    [_productsImage release];
//    [_deleteProduct release];
    [_deletefunction release];
    [super dealloc];
}
@end
