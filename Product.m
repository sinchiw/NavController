//
//  Product.m
//  NavCtrl
//
//  Created by Wilmer sinchi on 3/12/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "Product.h"

@implementation Product

-(instancetype) initWithProductName:(NSString*)productName andProductURL:(NSString*)productURL andProductLogo:(NSString *)productLogo {
    self =[super init];
    self.productName = productName;
    self.productURL = productURL;
    self.productLogo = productLogo;
    
    
    return self;
}

@end
