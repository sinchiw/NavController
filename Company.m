//
//  Company.m
//  NavCtrl
//
//  Created by Wilmer sinchi on 3/12/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "Company.h"

@implementation Company

-(instancetype) initWithName:(NSString*)name andLogo:(NSString*) logo{
    self =[super init];
    self.name = name;
    self.logo = logo;
   // self.logo = logo
    
    return self;
}

@end
