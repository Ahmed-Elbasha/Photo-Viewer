//
//  PhotosTableViewController.m
//  PhotoViewer_Step5
//
//  Created by Ahmed Elbasha on 9/16/17.
//  Copyright © 2017 Ahmed Elbasha. All rights reserved.
//

#import "PhotosTableViewController.h"

@interface PhotosTableViewController () {
    NSMutableArray *photos;
}

@end

@implementation PhotosTableViewController


// Function: addPhoto:(Photo*)photo withName:(NSString*)photoName fileName:(NSString*)fileName notes:(NSString*)notes toMutableArray:(NSMutableArray*)mutableArray
//-----------------------------------------------------------------------------------------------------
// This function to create Photo objects.
//-------------------------

-(void) addPhoto:(Photo*)photo withName:(NSString*)photoName fileName:(NSString*)fileName notes:(NSString*)notes toMutableArray:(NSMutableArray*)mutableArray {
    
    photo = [[Photo alloc]init];
    [photo setName:photoName];
    [photo setFileName:fileName];
    [photo setNotes:notes];
    [mutableArray addObject:photo];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Changing the title of the navigation bar to Photos
    self.title = @"Photos";
    
    // creates an array of Photo Objects
    photos = [[NSMutableArray alloc] init];
    
    // Instantiate a main Photo Object pointer.
    Photo *picture = [[Photo alloc] init];
    
    // Creating and adding bunch of Photo Objects based on the original pointer and adding them to photos array.
    [self addPhoto:picture
          withName:@"Emerald Bay"
          fileName:@"emeraldbay"
          notes:@"Emerald Bay, One of the most Tahoe's most popular and photogenic locations."
          toMutableArray:photos];
    
    [self addPhoto:picture
          withName:@"A Joshua Tree"
          fileName:@"joshuatree"
          notes:@"A joshua Tree in the Mojave Desert"
          toMutableArray:photos];
    
    [self addPhoto:picture
          withName:@"Sunset in Ventra"
          fileName:@"sunset"
          notes:@"Romantic sunset at the beach"
          toMutableArray:photos];
    
    [self addPhoto:picture
          withName:@"Snowman at Lake Tahoe"
          fileName:@"snowman"
          notes:@"Lake Tahoe gets 400 inches of snow every year"
          toMutableArray:photos];
    
    [self addPhoto:picture
          withName:@"Red Rock"
          fileName:@"redrock"
          notes:@"Spectacular formations at Red Rock Canyon State Park"
          toMutableArray:photos];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return photos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                       forIndexPath:indexPath];
    
     // Configure the cell...
    Photo *currentPhoto = [photos objectAtIndex:[indexPath row]];
    cell.textLabel.text = [currentPhoto name];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    DisplayViewController *displayVc = [segue destinationViewController];
    // Pass the selected object to the new view controller.
    // what is the selected cell...
    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    Photo *sPhoto = photos[index.row];
    [displayVc setCurrentPhoto:sPhoto];
}


@end
