//
//  Company.m
//  NavCtrl
//
//  Created by Wilmer sinchi on 3/12/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "Company.h"
#import "CompanyInfo.h"

@implementation Company

-(instancetype) initWithName:(NSString*)name andLogo:(NSString*) logo andStockPrice:(NSString *)stockPrice{
    self =[super init];
    self.name = name;
    self.logo = logo;
    self.stockPrice = stockPrice;
    return self;
}

@end
