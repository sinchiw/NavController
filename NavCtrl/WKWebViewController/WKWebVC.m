//
//  WKWebVC.m
//  NavCtrl
//
//  Created by Wilmer sinchi on 2/15/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "WKWebVC.h"
#import "ProductVC.h"

@import WebKit;

@interface WKWebVC () <WKNavigationDelegate,WKUIDelegate>{
    



}

@property (retain,nonatomic)  WKWebView *webview;

@end

@implementation WKWebVC



- (void)viewDidLoad {
    [super viewDidLoad];
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

    
}

-(void)viewWillAppear:(BOOL)animated {
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
