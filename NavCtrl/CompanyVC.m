//
//  CompanyVC.m
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "CompanyVC.h"
#import "ProductVC.h"
#import "Company.h"
#import "Product.h"
#import "DataAccess.h"
#import "CompanyInfo.h"
#import "StockFetcher.h"
#import "StockFetcherDelegate.h"

@interface CompanyVC (){
    StockFetcher *stockfetcher;
    DataAccess *dataAccess;

    CompanyInfo *companyInfoViewController;

   ProductVC *productViewController;
    

}
@end

@implementation CompanyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *bar = [self.navigationController navigationBar];
    [bar setBarTintColor:[UIColor colorWithRed:0.500 green:0.926 blue:0.000 alpha:5.000]];
    NSLog(@"CompanyVC viewDidLoad called" );
//[self.view addSubview:bar]
    dataAccess = [DataAccess dataAccess];

    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //setting up the edit and done button with text
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
    self.navigationItem.leftBarButtonItem = editButton;
    
    //setting up the button with the image included
    UIBarButtonItem *add = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Add.png"] style:UIBarButtonItemStylePlain target:self action:@selector(addingButton:)];
    self.navigationItem.rightBarButtonItem = add;

    
    
    // this is where you add name in the table cell
   // self.companyList = [NSMutableArray arrayWithObjects: @"Apple mobile devices",@"Samsung mobile devices", @"Nike", @"Adidas",nil];
    // this format is easier than the one below it
//    Company *apple = [[Company alloc]initWithName:@"Apple mobile devices" andLogo:@"apple.png"];
////    apple.name = @"Apple mobile devices";
////    apple.logo = @"apple.png";
//
//    Company *samsung = [[Company alloc]initWithName:@"Samsung mobile devices" andLogo:@"samsung.png"];
//
//
//    Company *nike =[[[Company alloc] init]initWithName:@"Nike" andLogo:@"nike.png"];
//
//    Company *adidas = [[Company alloc] initWithName:@"Adidas" andLogo:@"adidas.png"];
//
//
//    self.listOfCompanies = [NSMutableArray arrayWithObjects:apple, samsung, nike, adidas, nil];
//
    
    
    
 
    //the title inthe tableview on the top of the screen
    self.title = @"Stock Tracker";
    // Do any additional setup after loading the view from its nib.
    
    
    
    
    
    productViewController = [[ProductVC alloc] init];
    [productViewController view];

    companyInfoViewController = [[CompanyInfo alloc] init];
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // always make sure you have this code;
    // this way the stockprice can be generetae at the start of the launchscreen
    
    
    StockFetcher *stockFetcher = [[StockFetcher alloc]init];
    stockFetcher.delegate = self;
    
    
    
    //ask koshi
    // its calling the function from the stockfecther
    
    for(Company *company in dataAccess.listOfCompanies){
        [stockFetcher fetchStockPriceForTicker: company];
    }
    
//    for(int i=0;i<dataAccess.listOfCompanies.count;i++){
//        Company *company = dataAccess.listOfCompanies[i];
//        [stockFetcher fetchStockPriceForTicker: company.ticker];
//    }
    
}

-(void)stockFetchSuccess{
    //reloading the data
     [self.tableView reloadData];
}

-(void) addingButton:(id)sender
{
    // dont forget to intailize the other viewcontroller otherwise it wont work.
    //self.navigationItem.rightBarButtonItem.image = [UIImage imageNamed:@"Add.png"];
    companyInfoViewController.title = @"Add New Company";
//    companyInfoViewController
    //so the textfield should have nothing written in it when it goes to that viewcontroller and checking if it nill so it can load nothing on the textfield in the Adding View Controller
    
    companyInfoViewController.selectedCompany = nil;
//    companyInfoViewController.deleteCompany.hidden = YES;

    [self.navigationController pushViewController: companyInfoViewController animated:YES];
    
//    [self viewWillAppear:YES];
    
}



- (void)toggleEditMode {
    
    if (self.tableView.editing) {
        [self.tableView setEditing:NO animated:YES];
        self.navigationItem.leftBarButtonItem.title = @"Edit";
      
    } else {
        [self.tableView setEditing:YES animated:NO];
        self.navigationItem.leftBarButtonItem.title = @"Done";
    }
       
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
    //it was retunr 1; before
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return [self.companyList count];
    NSInteger count = dataAccess.listOfCompanies.count;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        
    }
    
    
    // this code below here is another way of setting up the image but its a bit time to configure it
    
    // Configure the cell...

    //Creating the images
//    cell.imageView.frame = CGRectMake(0.0f, 0.0f, 26.0f, 10.0f);
//    cell.imageView.layer.cornerRadius = 8.0;
//    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    cell.imageView.layer.masksToBounds = YES;
//    cell.imageView.clipsToBounds = YES;
//
//    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    CGSize itemSize = CGSizeMake(40, 40);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(10, 10, itemSize.width, itemSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    
//    DataAccess *companyFromList =  [self.listOfCompanies objectAtIndex:[indexPath row]];
     Company *companyFromList = [dataAccess.listOfCompanies objectAtIndex:[indexPath row]];
//  NSString *dollarSignPrice = [NSString stringWithFormat:@"askPrice:%@", priceString];
//    companyFromList.stockPrice
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", companyFromList.price];
    
    cell.textLabel.text = companyFromList.name;
    //cell.
    //put the code upp in here
//    cell.imageView.image =  [UIImage imageNamed:companyFromList.logo] ;
    
    
    cell.imageView.image =  [UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString:companyFromList.logo ]]];
    
//    [_compnayLogos objectAtIndex:indexPath.row];
//    resixe uiimage

//    tableView.rowHeight = UITableViewAutomaticDimension;
//    tableView.estimatedRowHeight = 177;
//
    
    
    
    
    return cell;
}




 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }


#pragma mark - Header Color

//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)] autorelease];
//
//        [headerView setBackgroundColor:[UIColor redColor]];
//
//    return headerView;
//}


 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
     [dataAccess.listOfCompanies removeObjectAtIndex:indexPath.row];
     // Delete the row from the data so
     
     [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
     
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
     [self.tableView reloadData];
 }


//this is the different code to move the cell in other area in the tableview

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //[_listOfCompanies exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    
    Company *temp = dataAccess.listOfCompanies[sourceIndexPath.row];
    [dataAccess.listOfCompanies removeObjectAtIndex:sourceIndexPath.row];
    [dataAccess.listOfCompanies insertObject:temp atIndex:destinationIndexPath.row];
    
    
    [self.tableView reloadData];
    
}



 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }



#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Company *companyFromList = dataAccess.listOfCompanies[indexPath.row];
    
    if (self.tableView.editing){
        
        
        companyInfoViewController.title = @"Edit Company";
        
        
        
        
        
        //you made a variable to connect the two viewcontroller toghter in editing mode
        // the companylsit comes from company viewcontroller
        companyInfoViewController.selectedCompany = companyFromList;
        //(int)indexPath.row -
        [self.navigationController
         pushViewController:companyInfoViewController
         animated:YES];
        
        
        
        
    } else {
        
    
        
    productViewController.navigationItem.title = companyFromList.name;
    // this is where th
    productViewController.listOfProduct = companyFromList.products;
    
//    dataAccess.listOfProduct = companyFromList.products;
    
    productViewController.dataAccess = dataAccess;
    
    productViewController.path = [indexPath row];
    
    [self.navigationController
     pushViewController:productViewController
     animated:YES];
    
    
    }
    
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//
//    // Get the new view controller using [segue destinationViewController].
//    [segue destinationViewController];
//
//
//    // Pass the selected object to the new view controller.
//
//
//}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"CompanyVC viewDidDisappear called");
    
}





- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end







// NSArray *_tempArray = @[@"iPad", @"iPod Touch",@"iPhone"];

// productViewController.products =  [NSMutableArray arrayWithArray:productViewController.item];
    // this code up here is a way to convert NSArray to NSMutableArray but it alos creat a seperate array, so keep that in mind

