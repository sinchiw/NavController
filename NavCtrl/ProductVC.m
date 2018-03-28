//
//  ProductVC.m
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "ProductVC.h"
#import "CompanyVC.h"
#import "WKWebVC.h"
#import "Product.h"
#import "DataAccess.h"
#import "Company.h"


@interface ProductVC (){

    WKWebVC *detailViewController;
    
    DataAccess *dataAccess2;
}



@end

@implementation ProductVC

- (void)viewDidLoad {
    [super viewDidLoad];
    dataAccess2 = [DataAccess dataAccess];

    NSLog(@"ProductVC viewDidLoad called");
    
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
    self.navigationItem.rightBarButtonItem = editButton;

    //self.dataAccess

    // Do any additional setup after loading the view from its nib.
    
  
#pragma mark - init
    

    
    
    detailViewController = [[WKWebVC alloc] init];
    [detailViewController view];
    
    

    
    
    
    
    
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


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
  //  self.listOfProduct = self.dataAccess.listOfProduct;
    
    [self.tableView reloadData];
    
    NSLog(@"ProductVC viewWillAppear called");
    
//    [self cells];
  
//    [self.removeTempArray:_tempArray];
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
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.listOfProduct count];
    //return [self.dataAccess.listOfProduct count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Product";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    Product *listFromProduct= [self.listOfProduct objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = listFromProduct.productName;
    
//    cell.textLabel.text = [self.products objectAtIndex:[indexPath row]];
    return cell;
    // setting up the image for each row of the product
    
//    cell.imageView.frame = CGRectMake(0.0f, 0.0f, 26.0f, 10.0f);
//    cell.imageView.layer.cornerRadius = 8.0;
//    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    cell.imageView.layer.masksToBounds = YES;
//    cell.imageView.clipsToBounds = YES;
//
//    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
//
//    cell.textLabel.text = [self.products objectAtIndex:[indexPath row]];
//    cell.imageView.image = [_appleLogo objectAtIndex:indexPath.row];
    
//    return cell;











}


 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 
//-(void)removeTempArray:(NSSet *)objects{
//    [self.products removeObjectsInArray:_products];
//}


 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
     
     
     
    // _tempArray *item = productsss[indexPath.row];
//     [[ProductVC alloc] removeTempArray: productsss];
     
//     ProductVC *prodcuts =_tempArray[indexPath.row];
//     [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
     
     // this is to delete a row from the tableview,
     
     [_listOfProduct removeObjectAtIndex:indexPath.row];

//
//      [self.listOfProduct removeObjectAtIndex:indexPath.row];
     
     
     // The reason why the deleted item still appears is the view hasn’t been refreshed to reflect the update of the data model. so implement this method
     
     
     
      // Delete the row from the data source
     
         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     
     //[self.products removeObjectsInArray:_products];
     
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     
 }
     [self.tableView reloadData];
 }




#pragma mark - move table cell
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    Product *temp2 = _listOfProduct[sourceIndexPath.row];
    [_listOfProduct removeObjectAtIndex:sourceIndexPath.row];
    [_listOfProduct insertObject:temp2 atIndex:destinationIndexPath.row];
    [self.tableView reloadData];
}




- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}






 #pragma mark - Table view delegate
 
//  In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
     
     
     
     Product *listFromProduct= [self.listOfProduct objectAtIndex:[indexPath row]];
     
     
     detailViewController.sites = listFromProduct.productURL;
     
     NSLog(@"YI site %@", listFromProduct.productURL);
     
     
//  Navigation logic may go here, for example:
//  Create the next view controller.
//
     
     
 //    Product *companyurl = [dataAccess2.listOfProduct objectAtIndex:[indexPath row]];
//     companyurl *apple = _products.
     
     

  //   dataAccess2.listOfProduct[indexPath.row].productURL;
     
     //     productFromList *url= productFromList.productURL;
//
// //    setting the site to each prduct based om the title
////     detailViewController.site = [_item objectAtIndex:indexPath.row];
//     if ([  self.navigationItem.title isEqualToString:@"Apple mobile devices"])
//     {
     
         
//
//        detailViewController.sites =
//
//
         
//         [self.listOfProduct objectAtIndex:[indexPath row]];
//         Product *listFromProduct= [self.listOfProduct objectAtIndex:[indexPath row]];
//
//
//        detailViewController.sites = listFromProduct.productURL;
//
//         NSLog(@"YI site %@", listFromProduct.productURL);
        
 //        detailViewController.sites = companyurl.productURL;
         
//
//
//
         
//     }
     
     

     
  
     
//  Pass the selected object to the new view controller.
 
//  Push the view controller.
     
 
     

 [self.navigationController pushViewController:detailViewController animated:YES];
 
 
 }
 
//-(void)removeTempArray:(NSArray *)objects; {
//
//    [self.products removeObjectAtIndex:_tempArray];
//
//}
-(void)viewDidDisappear:(BOOL)animated

{
    [super viewDidDisappear:animated];
    NSLog(@"ProductVC viewDidDisappear called");
    
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}

#pragma mark  - products
//-(void)cells{
//    if ([self.title isEqualToString:@"Apple mobile devices"]) {
//
//        _tempArray = @[@"iPad", @"iPod Touch",@"iPhone"];
//        //this is where you convert your array into NSmutableArray
//        //        self.products = [NSMutableArray arrayWithArray:tempArray];
//    }
//
//    if ([self.title isEqualToString:@"Samsung mobile devices"]) {
//        _tempArray =@[@"Galaxy S4", @"Galaxy Note", @"Galaxy Tab"];
//        //        self.products = [NSMutableArray arrayWithArray:tempArray];
//    }
//    if ([self.title isEqualToString:@"Adidas"]) {
//        _tempArray = @[@"Yeezy", @"Jersey", @"Bags"];
//        //        self.products = [NSMutableArray arrayWithArray:tempArray];
//    }
//    if ([self.title isEqualToString:@"Nike"]){
//        _tempArray = @[@"Jordans", @"Gears", @"Clothes"];
//        //        self.products = [NSMutableArray arrayWithArray:tempArray];
//
//    }
//
//
//    self.products = [NSMutableArray arrayWithArray:_tempArray];
//    [self.tableView reloadData];
//
//    //_tableView.delegate = self;
//  //  _tableView.dataSource = self;
//
//    //    [self.removeTempArray:_tempArray];
//
//
//}
@end
