//
//  Company.h
//  NavCtrl
//
//  Created by Wilmer sinchi on 3/12/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "CompanyVC.h"

@interface Company : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *logo;
@property (nonatomic, retain) NSString *stockPrice;

@property (nonatomic, retain) NSMutableArray<Product*> *products;

-(instancetype) initWithName:(NSString*)name andLogo:(NSString*) logo andStockPrice:(NSString*)stockPrice;



@end
