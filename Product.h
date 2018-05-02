//
//  Product.h
//  NavCtrl
//
//  Created by Wilmer sinchi on 3/12/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//
//Users/wilmersinchi/Documents/TurntoTech/NavCtrl_Obj-C 2/Product.h
#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic, strong) NSString *productName;
@property (nonatomic, strong) NSString *productLogo;
@property (nonatomic, strong) NSString *productURL;

-(instancetype) initWithProductName:(NSString*)productName andProductURL:(NSString*) productURL andProductLogo:(NSString*) productLogo;



@end
