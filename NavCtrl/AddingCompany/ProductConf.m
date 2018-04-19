//
//  ProductConf.m
//  NavCtrl
//
//  Created by Wilmer sinchi on 4/5/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "ProductConf.h"
#import "WKWebVC.h"

@interface ProductConf ()
{
    WKWebVC *webViewController;
}
@end

@implementation ProductConf

- (void)viewDidLoad {
    [super viewDidLoad];
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
    [super dealloc];
}
@end
