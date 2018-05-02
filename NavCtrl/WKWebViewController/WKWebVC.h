//
//  WKWebVC.h
//  NavCtrl
//
//  Created by Wilmer sinchi on 2/15/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "DataAccess.h"
#import "Product.h"
@interface WKWebVC : UIViewController <UIWebViewDelegate>


//@property (nonatomic, retain) NSString *site;
@property (nonatomic, retain) NSString *apple;
//@property (nonatomic, retain) NSArray *website;
//@property (nonatomic, retain) NSArray *website2;
//@property (nonatomic, retain) NSArray *website3;
//@property (nonatomic, retain) NSArray *website4;
@property (nonatomic) NSInteger path2;

@property (nonatomic, retain) NSString *sites;

@property (nonatomic, strong)  Product *selectedProduct;


@property (nonatomic) NSInteger *currentProduct;









@end
