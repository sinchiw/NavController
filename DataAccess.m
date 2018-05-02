//
//  DataAccess.m
//  NavCtrl
//
//  Created by Wilmer sinchi on 3/16/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "DataAccess.h"

@implementation DataAccess

+(DataAccess *) dataAccess
{
    static DataAccess *data = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [[self alloc] init];
    });
    return data;
}



//-(id) init
//{
//    self = [super init];
//    if (self) {
//        
//        //set ivariable
//    }
//    return self;
// this whole code above is the basic example of singleton Pattern


-(instancetype) init
{
    self = [super init];
    
    [self createCompanies];
    [self createProducts];

    
    return self;
    
    
}

-(void)addCompany:(Company *)company {
    [self.listOfCompanies addObject: company];
    
}

-(void)addProduct:(Product *)products withInde:(NSInteger) index {
    [[self.listOfCompanies[index] products] addObject: products];
}

-(void)edditingCompanyWithID:(int) companyID withNewName:(NSString*) newName andCompanyStokSymbol: (NSString*) newSymbol andCompanyLogo: (NSString*) newLogo{
    Company* updatedCompany = self.listOfCompanies[companyID];
    updatedCompany.name = newName;
    updatedCompany.ticker = newSymbol;
    updatedCompany.logo = newLogo;
    
    [self.listOfCompanies replaceObjectAtIndex:companyID withObject:updatedCompany];
}

-(void)editingProductWithID:(int) productID withCompanyId:(int) companyId withProductName:(NSString*) ProductName andProductLogo:(NSString*) productLogo andProductURL:(NSString*) productURL{
    
    Company* currentCompany = self.listOfCompanies[companyId];
    Product* updatedProducts = currentCompany.products[productID];
    
    updatedProducts.productName = ProductName;
    updatedProducts.productLogo = productLogo;
    updatedProducts.productURL = productURL;
    
    [self.listOfCompanies[companyId].products replaceObjectAtIndex:productID withObject:updatedProducts];
    
    
    
//    updatedProducts. = self.listOfCompanies[productID];
//    updatedproduct.products =
    
}

-(void) createCompanies {
    Company *apple = [[Company alloc]initWithName:@"Apple mobile devices" andLogo:@"http://pngimg.com/uploads/apple_logo/apple_logo_PNG19692.png" andTicker:@"AAPL"];
    //    apple.name = @"Apple mobile devices";
    //    apple.logo = @"apple.png";
    
    Company *samsung = [[Company alloc]initWithName:@"Samsung mobile devices" andLogo:@"https://cdn.iconverticons.com/files/png/fb1ec58e6682da83_256x256.png" andTicker:@"SAM"];
    
    
    Company *nike =[[Company alloc] initWithName:@"Nike" andLogo:@"http://pngimg.com/uploads/nike/nike_PNG18.png" andTicker:@"NKE"];
    
    Company *adidas = [[Company alloc] initWithName:@"Adidas" andLogo:@"http://pngimg.com/uploads/adidas/adidas_PNG16.png" andTicker:@"ADS"];
    
    self.listOfCompanies = [NSMutableArray arrayWithObjects:apple, samsung, nike, adidas, nil];

//
//
//        Company *newCompany = [[Company alloc]initWithName:@"" andLogo:@""];
//
//        [self.listOfCompanies addObject:newCompany ];
}


-(void)createProducts
{
    //Apple Product
Product *appleProduct1 = [[Product alloc]init];
    appleProduct1.productName =  @"iPad";
    appleProduct1.productURL  =  @"https://www.apple.com/ipod-touch/";
    appleProduct1.productLogo = @"http://www.scanlaninternational.com/wp-content/uploads/revslider/web-product-light-hero/macbookpro.png";
    Product *appleProduct2 = [[Product alloc]init];
    appleProduct2.productName  = @"ipodTouch";
    appleProduct2.productURL   = @"https://www.apple.com/";
    appleProduct2.productLogo = @"http://www.scanlaninternational.com/wp-content/uploads/revslider/web-product-light-hero/macbookpro.png";
    Product *appleProduct3 = [[Product alloc]init];
    appleProduct3.productName  = @"iPhone";
    appleProduct3.productURL   = @"https://www.apple.com/iphone/";
    appleProduct3.productLogo = @"http://www.scanlaninternational.com/wp-content/uploads/revslider/web-product-light-hero/macbookpro.png";
    
    self.listOfCompanies[0].products = [ NSMutableArray arrayWithObjects:appleProduct1, appleProduct2, appleProduct3,nil];
//    appleProduct1.productURL

// Samsung Products
    
Product *samsungProduct1 = [[Product alloc]init];
samsungProduct1.productName = @"Galaxy S4";
samsungProduct1.productURL  = @"https://www.samsung.com/us/mobile/galaxy/";
    samsungProduct1.productLogo =@"";

Product *samsungProduct2 = [[Product alloc]init];
samsungProduct2.productName = @"Galaxy Note";
samsungProduct2.productURL  = @"https://www.samsung.com/us/mobile/phones/galaxy-note/";
    samsungProduct1.productLogo =@"";

Product *samsungProduct3 = [[Product alloc]init];
samsungProduct3.productName = @"Galaxy Tab";
samsungProduct3.productURL  = @"https://www.samsung.com/us/mobile/tablets/";
    samsungProduct1.productLogo = @"";

self.listOfCompanies[1].products = [NSMutableArray arrayWithObjects: samsungProduct1, samsungProduct2, samsungProduct3, nil];

//nike product
Product *nikeProduct1 =[[Product alloc] init];
nikeProduct1.productName = @"Jordans";
nikeProduct1.productURL  = @"https://www.nike.com/us/en_us/c/jordan";

    Product *nikeProduct2 =[[Product alloc] init];

nikeProduct2.productName = @"Gears";
nikeProduct2.productURL  = @"https://store.nike.com/us/en_us/pw/mens-bags-backpacks/7puZof2";

    Product *nikeProduct3 =[[Product alloc] init];

nikeProduct3.productName = @"Clothes";
nikeProduct3.productURL  = @"https://store.nike.com/us/en_us/pw/mens-clothing/";

    self.listOfCompanies[2].products = [ NSMutableArray arrayWithObjects:nikeProduct1, nikeProduct2, nikeProduct3,nil];

// adidas product
Product *adidasProduct1 = [[Product alloc] init];
adidasProduct1.productName = @"Yeezy";
adidasProduct1.productURL  = @"https://www.adidas.com/us/apps/yeezy/";

    Product *adidasProduct2 = [[Product alloc] init];

adidasProduct2.productName = @"Jersey";
adidasProduct2.productURL  = @"https://www.adidas.com/us/apps/yeezy/";
   
    Product *adidasProduct3 = [[Product alloc] init];

adidasProduct3.productName = @"Bags";
adidasProduct3.productURL  = @"http://www.adidas.com/us/men-bags";

    self.listOfCompanies[3].products = [ NSMutableArray arrayWithObjects: adidasProduct1, adidasProduct2, adidasProduct3, nil];
   
}


//+(instancetype)productsNames{
//    static DataAccess *names =nil;
//    if(!names) {
//        names = [ [Product alloc]initWithProductName];
//    }
//}

@end
