//
//  WKWebVC.m
//  NavCtrl
//
//  Created by Wilmer sinchi on 2/15/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "WKWebVC.h"
#import "ProductVC.h"
#import "ProductConf.h"
#import "Company.h"
@import WebKit;

@interface WKWebVC () <WKNavigationDelegate,WKUIDelegate>{
    
    ProductConf *productController;
    DataAccess *dataccess5;
    Company *existingProduct;
    Product *listOfProd;
}

@property (retain,nonatomic)  WKWebView *webview;
@property (nonatomic, strong) NSMutableArray *products3;
@end

@implementation WKWebVC



- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode:)];
    self.navigationItem.rightBarButtonItem = editButton;
//    // Do any additional setup after loading the view from its nib.
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    // Do any additional setup after loading the view from its nib.
//
    //this below is an array of site that we need for each product
//    _website = [NSArray arrayWithObjects:@"https://www.apple.com/ipod-touch/",@"https://www.apple.com/ipod-touch/",@"https://www.apple.com/iphone/",nil];
//this is one way of displaying the webpage using UIWebView, but in this one it takes time to load page unlike the Webkit***
//    UIWebView *webView = [[UIWebView alloc] init];
//    webView.scalesPageToFit = YES;
//    self.view = webView;
//
//    NSURL *nsurl=[NSURL URLWithString:_site];
//
//
//    NSURLRequest *req = [NSURLRequest requestWithURL:nsurl];
//
////    this is how you load the website in the UIwebview
//    [webView loadRequest:req];

  //  CGRect rect = self.view.frame;
    productController = [[ProductConf alloc] init];
    
    

    
}
- (void)toggleEditMode:(id)sender {
    
//  existingProduct = [[ Company alloc] init];
    
        self.navigationItem.rightBarButtonItem.title = @"Edit";
    productController.title = @"Edit Product";
//    listOfProd
//    dataccess5 *prod222 = dataccess5.listOfCompanies;
//    Product *listFromProduct= [self.listOfProduct objectAtIndex:[indexPath row]];
//    existingProduct.products = _listOfProduct2.
    
   
    
//    webcontroller.selectedProduct = productFromList;
//    Company* currentCompany = [dataccess5.listOfCompanies objectAtIndex: _path2];
//    Company *listOfProduct =
    
    //NSMutableArray<Product*> *listofPro = currentCompany.products;
    //setting the NSMUTable arrauy to the this array self.selectprodut when it reference back to ProductVC
    
    productController.selectedProduct =  self.selectedProduct;
    
     
  //  productController.productId = _path2;

//    [webcontroller.selectedProduct =
//    webcontrolle
    
    
//    webcontroller.selectedProduct = existingProduct.
//    existingProduct.products;
//    dataccess5.listOfCompanies = _products3;
    
//    webcontroller.selectedProduct = self.products3;
//    webcontroller.selectedProduct = existingProduct.products;
    //    existingProduct.products = dataccess5.listOfCompanies;
    
    [self.navigationController pushViewController: productController animated:YES];
    
    }
    

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
    
//    Company *companyFromList = dataAccess3.listOfCompanies[indexPath.row];
//    WKWebVC.navigationItem.title = [dataAccess3.listOfCompanies];
    //    dataacc.listOfCompanies[indexPath.row];

    // Do any additional setup after loading the view from its nib.
    
 
    
    
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    //    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];/////////
    //webView.scalesPageToFit = YES;
    //    webView.UIDelegate = self;
    //    webView.navigationDelegate = self;
    //    webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    
    
    NSURL *nsurl=[NSURL URLWithString: _sites];
    
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    
    //allocating the web page view here below
    self.webview = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];
    
    _webview.UIDelegate = self;
    
    _webview.navigationDelegate = self;
    
    [_webview loadRequest:nsrequest];
    
    // self.webview.frame = CGRectMake(0.0f, 0.0f, 415.0f, 215.0f);
    
    //    [self.view addSubview:_webView];
    [self.view addSubview:_webview];
    //calling the webiewframe
    _webview.frame = self.view.frame;
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



@end
