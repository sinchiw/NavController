//
//  CompanyVC.m
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "CompanyVC.h"
#import "ProductVC.h"

@interface CompanyVC (){
    

  

   ProductVC *productViewController;

}
@end

@implementation CompanyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"CompanyVC viewDidLoad called");
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
    self.navigationItem.rightBarButtonItem = editButton;
    // this is where you add name in the table cell
    self.companyList = @[@"Apple mobile devices",@"Samsung mobile devices", @"Nike", @"Adidas"];
    
    
    
    //setting an array for image 
    _compnayLogos =[[NSArray arrayWithObjects:
                     
                      [UIImage imageNamed:@"apple.png"],
                      [UIImage imageNamed:@"samsung.png"],
                      [UIImage imageNamed:@"adidas.png"],
                      [UIImage imageNamed:@"nike.png"],
                      nil] retain];
    //the title inthe tableview on the top of the screen
    self.title = @"Mobile device makers";
    // Do any additional setup after loading the view from its nib.
    
//    NSDictionary *list = @{@"Companies"}
    
    
    //contraint for the text label
//    NSLayoutConstraint *horizantal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[apple]-7-|"
//                                                                            options:0
//                                                                            metrics:nil
//                                                                              views:_companyList];
//    
//    [self.view addConstraint:horizantal];
//                                     
//                                     
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
    return [self.companyList count];
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
    
//    UIImage *apple =[UIImage imageNamed:@"apple.png"];
//    UIImage *samsung = [UIImage imageNamed:@"samsung.png"];
//    UIImage *nike =[UIImage imageNamed:@"nike.png"];
//    UIImage *adidas =[UIImage imageNamed:@"adidas"];
//
    
    
    //setting up the images for each row
//    
//    
//    switch (indexPath.row) {
//        case 0:
//            cell.imageView.image = apple;
//            break;
//        case 1:
//            cell.imageView.image = samsung;
//            break;
//        case 2:
//            cell.imageView.image = nike;
//            break;
//        case 3:
//            cell.imageView.image = adidas;
//            break;
//        default:
//            break;
//    }
    
    cell.imageView.frame = CGRectMake(0.0f, 0.0f, 26.0f, 10.0f);
    cell.imageView.layer.cornerRadius = 8.0;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.clipsToBounds = YES;

    
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    cell.textLabel.text = [self.companyList objectAtIndex:[indexPath row]];
    
    //put the code upp in here
    cell.imageView.image = [_compnayLogos objectAtIndex:indexPath.row];
    //resixe uiimage

    
  //  cell.imageView.image = [UIImage imageNamed:  [self.companyListOfImages objectAtIndex:[indexPath row]] ];
    
    
//    cell.textLabel.textAlignment = NSTextAlignmentRight;
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    ProductVC *subItems =[[ProductVC alloc] init];
//    [subItems view];
  
   // productViewController = [[ProductVC alloc] init];
     
    
//    subItems.view;
    if (indexPath.row == 0 ){
        
       // [productViewController.products removeObjectAtIndex:0];
        
        productViewController.products = productViewController.item;
       // [productViewController.products removeObjectAtIndex:0];
        
    }
    if (indexPath.row == 1){
        productViewController.products =  productViewController.item2;
    }
    
    
    if (indexPath.row == 2){
        productViewController.products = productViewController.item3;
    }
    
    if (indexPath.row == 3) {
        productViewController.products = productViewController.item4;
    }
        //must have this line 243, otherwise you can't load a specific cell for different rows
    [productViewController.tableView reloadData];

    //    if (indexPath.row == 0){
//        self.productViewController.title = @"Apple mobile devices";
//    } else  if(indexPath.row ==1){
//        self.productViewController.title = @"Samsung mobile devices";
//
//    } else if(indexPath.row ==2) {
//        self.productViewController.title = @"Nike";
//    }
//    else if (indexPath.row ==3){
//        self.productViewController.title = @"Adidas";
//    }
    productViewController.navigationItem.title = self.companyList[indexPath.row];
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
