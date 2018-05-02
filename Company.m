//
//  Company.m
//  NavCtrl
//
//  Created by Wilmer sinchi on 3/12/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "Company.h"
#import "CompanyInfo.h"
#import "StockFetcher.h"

@implementation Company

-(instancetype) initWithName:(NSString*)name andLogo:(NSString*) logo andTicker:(NSString *)ticker{
    self =[super init];
    self.name = name;
    self.logo = logo;
    self.ticker = ticker;
    
      
    return self;
}
// set up the variabel to equal to the function the genreate stockprice 
-(void)stockFetchSuccessWithPrice: (double) price {
    _price = price;
}


@end
