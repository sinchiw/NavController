//
//  ProductConf.h
//  NavCtrl
//
//  Created by Wilmer sinchi on 4/5/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"
#import "WKWebVC.h"
#import "Product.h"
@interface ProductConf : UIViewController
@property (retain, nonatomic) IBOutlet UIButton *deletefunction;
@property (retain, nonatomic) IBOutlet UITextField *productNames1;
@property (retain, nonatomic) IBOutlet UITextField *productURLs;
@property (retain, nonatomic) IBOutlet UITextField *productsImage;
@property (nonatomic, retain) NSMutableArray<Product*> *listOfProduct2;


@property (nonatomic, strong)  Product *selectedProduct;

@property int productId;

@end
