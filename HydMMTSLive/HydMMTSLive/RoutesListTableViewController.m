//
//  RoutesListTableViewController.m
//  HydMMTSLive
//
//  Created by AUREK on 08/10/14.
//  Copyright (c) 2014 TheAteam. All rights reserved.
//

#import "RoutesListTableViewController.h"
#import "LiveStatusForSelectedRouteTableViewController.h"
#import "RouteCell.h"

#define RGB(r, g, b) \
[UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA(r, g, b, a) \
[UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


@interface RoutesListTableViewController ()
@property (nonatomic, retain) NSMutableArray *routes;
@end

@implementation RoutesListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.routes = [NSMutableArray array];
    [self.routes addObject:@{@"Origin":@"LPI", @"Destination":@"FM", @"RouteName":@"LF"}];
    [self.routes addObject:@{@"Origin":@"FM", @"Destination":@"LPI", @"RouteName":@"FL"}];
    [self.routes addObject:@{@"Origin":@"LPI", @"Destination":@"HYD", @"RouteName":@"LH"}];
    [self.routes addObject:@{@"Origin":@"HYD", @"Destination":@"LPI", @"RouteName":@"HL"}];
    [self.routes addObject:@{@"Origin":@"HYD", @"Destination":@"FM", @"RouteName":@"HF"}];
    [self.routes addObject:@{@"Origin":@"FM", @"Destination":@"HYD", @"RouteName":@"FH"}];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RouteCell"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.routes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"RouteCellIdentifier";
    
    RouteCell *cell = (RouteCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    

    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RouteCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *route = [self.routes objectAtIndex:indexPath.row];

    cell.lbl_origin.text = route[@"Origin"];
    cell.lbl_destination.text = route[@"Destination"];

    //cell.textLabel.text =[NSString stringWithFormat:@"%@ -> %@",route[@"Origin"],route[@"Destination"]];
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //255,99,71
    switch (indexPath.row) {
        case 0:
            cell.contentView.backgroundColor=RGB(255, 99, 71);
            break;
        case 1:
            cell.contentView.backgroundColor=RGB(64, 224, 208);
            break;
        case 2:
            cell.contentView.backgroundColor=RGB(238, 130, 238);
            break;
        case 3:
            cell.contentView.backgroundColor=RGB(135, 206, 250);
            break;
        case 4:
            cell.contentView.backgroundColor=RGB(60, 179, 113);
            break;
        case 5:
            cell.contentView.backgroundColor=RGB(165, 42, 42);
            break;

        default:
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *route = [self.routes objectAtIndex:indexPath.row];
    LiveStatusForSelectedRouteTableViewController *liveStatusView = [self.storyboard instantiateViewControllerWithIdentifier:@"LiveStatusView"];
    liveStatusView.routeIdentifier = route[@"RouteName"];
    [self.navigationController pushViewController:liveStatusView animated:YES];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
