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



//you need this add an object to your array
-(void)addCompany:(Company*) company;
-(void)addProduct:(Product *)products withInde:(NSInteger) index;
//-(void)addProduct:(Company*) products;

//-(instancetype) initWithName:(NSString*)name andLogo:(NSString*) logo;
//
//-(instancetype) initWithProductName:(NSString*)productName andProductURL:(NSString*) productURL;


//+(instancetype)productsNames;



@end
