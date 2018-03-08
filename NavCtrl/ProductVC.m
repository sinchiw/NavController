//
//  ProductVC.m
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "ProductVC.h"
#import "WKWebVC.h"

@interface ProductVC (){

    WKWebVC *detailViewController;
    
    
}



@end

@implementation ProductVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"ProductVC viewDidLoad called");

    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    // Do any additional setup after loading the view from its nib.
    
  
    //it has to be NSMutableArray b/c otherwise you can't modified it unlike NSArray.
    self.item = [NSMutableArray arrayWithObjects: @"iPad", @"iPod Touch",@"iPhone", nil];
    
    self.item2 = [NSMutableArray arrayWithObjects: @"Galaxy S4", @"Galaxy Note", @"Galaxy Tab", nil];
    
    self.item3 = [NSMutableArray arrayWithObjects: @"Yeezy", @"Jersey", @"Bags",nil];
    
    self.item4 = [NSMutableArray arrayWithObjects: @"Jordans", @"Gears", @"Clothes",nil];
    
    self.website = [NSMutableArray arrayWithObjects:@"https://www.apple.com/ipod-touch/",@"https://www.apple.com/ipod-touch/",@"https://www.apple.com/iphone/",nil];
    
    //another way of doing this by allocating,,, read more about autorelease
    //_website = [[NSMutableArray alloc]initWithObjects:@"https://www.apple.com/ipod-touch/",@"https://www.apple.com/ipod-touch/",@"https://www.apple.com/iphone/",nil];
                  
    self.website2 = [NSMutableArray arrayWithObjects:@"https://www.samsung.com/us/mobile/galaxy/", @"https://www.samsung.com/us/mobile/phones/galaxy-note/",@"https://www.samsung.com/us/mobile/tablets/", nil];
    
    self.website3 = [NSMutableArray arrayWithObjects:@"https://www.adidas.com/us/apps/yeezy/", @"https://www.adidas.com/us/men-jerseys", @"http://www.adidas.com/us/men-bags", nil];
    
    self.website3 = [NSMutableArray arrayWithObjects:@"https://www.nike.com/us/en_us/c/jordan", @"https://store.nike.com/us/en_us/pw/mens-bags-backpacks/7puZof2", @"https://store.nike.com/us/en_us/pw/mens-clothing/1mdZ7pu",nil];
    
    
    detailViewController = [[WKWebVC alloc] init];
    [detailViewController view];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
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
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Product";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [self.products objectAtIndex:[indexPath row]];
    return cell;
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
     
     
     
      [self.products removeObjectAtIndex:indexPath.row];
     
     
     // The reason why the deleted item still appears is the view hasn’t been refreshed to reflect the update of the data model. so implement this method
     
     
     
      // Delete the row from the data source
     
      [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
     
     //[self.products removeObjectsInArray:_products];
     
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     
 }
     [self.tableView reloadData];
 }




#pragma mark - move table cell

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
//{
//    if(fromIndex == index){
//        return;
//    }
//}
// Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
 {
     [_products exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];

 }

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


 #pragma mark - Table view delegate
 
//  In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
//  Navigation logic may go here, for example:
//  Create the next view controller.
//

     
 //    setting the site to each prduct based om the title
//     detailViewController.site = [_item objectAtIndex:indexPath.row];
     if ([  self.navigationItem.title isEqualToString:@"Apple mobile devices"])
     {
//         NSInteger row = indexPath.row;
//         detailViewController.currentProduct = &(row);
//        detailViewController.site = detailViewController.website[indexPath.row];
      
   //     detailViewController.sites = sites[indexPath.row];
         
         
         detailViewController.sites = _website[indexPath.row];
         
         
     }
if ([ self.navigationItem.title isEqualToString:@"Samsung mobile devices"])
{
    detailViewController.sites = _website2[indexPath.row];
}
     
     if ([ self.navigationItem.title isEqualToString:@"Nike"])
     {
         detailViewController.sites = _website3[indexPath.row];
     }
     
     if ([ self.navigationItem.title isEqualToString:@"Adidas"])
     {
         detailViewController.sites = _website4[indexPath.row];
     }

     
  
     
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
