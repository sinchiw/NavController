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

@interface CompanyVC (){

    DataAccess *dataAccess;

  

   ProductVC *productViewController;

}
@end

@implementation CompanyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"CompanyVC viewDidLoad called");
    
    dataAccess = [DataAccess dataAccess];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
    self.navigationItem.rightBarButtonItem = editButton;
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
    
    
    
    
    //contraint for the text label
//    NSLayoutConstraint *horizantal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[apple]-7-|"
//                                                                            options:0
//                                                                            metrics:nil
//                                                                              views:_companyList];
//    
    
    
    productViewController = [[ProductVC alloc] init];
    [productViewController view];

    
    
}

- (void)toggleEditMode {
    
    if (self.tableView.editing) {
        [self.tableView setEditing:NO animated:YES];
        self.navigationItem.rightBarButtonItem.title = @"Edit";
    } else {
        [self.tableView setEditing:YES animated:NO];
        self.navigationItem.rightBarButtonItem.title = @"Done";
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

 
    
    cell.imageView.frame = CGRectMake(0.0f, 0.0f, 26.0f, 10.0f);
    cell.imageView.layer.cornerRadius = 8.0;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.clipsToBounds = YES;

    
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
//    DataAccess *companyFromList =  [self.listOfCompanies objectAtIndex:[indexPath row]];
     Company *companyFromList = [dataAccess.listOfCompanies objectAtIndex:[indexPath row]];
    
    
    
    cell.textLabel.text = companyFromList.name;
    
    //put the code upp in here
    cell.imageView.image =  [UIImage imageNamed:companyFromList.logo] ;  // [_compnayLogos objectAtIndex:indexPath.row];
    //resixe uiimage

    
    
    
    
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
//    NSArray *listOfProd = [[dataAccess data]createProduct];
//    Product *productFromList = [[Product alloc]productName];

//
    
    // you dont need all this code belowe you since you have the other one implemented after this one
    
    //    subItems.view;
//    if (indexPath.row == 0 ){
//
////        [productViewController.products removeObjectAtIndex:0];
//        productViewController.products = [dataAccess listOfProduct];
////        productViewController.products =
////        productViewController.products = [
//    }
//    if (indexPath.row == 1){
////        productViewController.products =  dataAccess.listOfProduc  ;
//    }
//
//

    
    
    
    Company *companyFromList = dataAccess.listOfCompanies[indexPath.row];
    
    
    
    productViewController.navigationItem.title = companyFromList.name;
    
    productViewController.listOfProduct = companyFromList.products;
    
//    dataAccess.listOfProduct = companyFromList.products;
    
    productViewController.dataAccess = dataAccess;
    
    [self.navigationController
     pushViewController:productViewController
     animated:YES];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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

