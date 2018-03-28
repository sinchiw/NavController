//
//  DataAccess.h
//  NavCtrl
//
//  Created by Wilmer sinchi on 3/16/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "Company.h"

@interface DataAccess : NSObject


@property (nonatomic, retain) NSMutableArray<Company*> *listOfCompanies;
//@property (nonatomic, retain) NSMutableArray<Product*> *listOfProduct;
+(DataAccess *) dataAccess;

//-(instancetype) initWithName:(NSString*)name andLogo:(NSString*) logo;
//
//-(instancetype) initWithProductName:(NSString*)productName andProductURL:(NSString*) productURL;


//+(instancetype)productsNames;



@end
