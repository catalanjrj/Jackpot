//
//  TicketsTableViewController.m
//  Jackpot
//
//  Created by Jorge Catalan on 4/20/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import "TicketsTableViewController.h"
#import "Tickets.h"

@interface TicketsTableViewController (){
/// on root view total number of winnins and cost of total number of winnings
NSMutableArray *tickets;
    int totalWon;
    int totalSpent;
}
-(IBAction)createTicket:(id)sender;
-(IBAction)checkWinners:(id)sender;

@end

@implementation TicketsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    tickets = [[NSMutableArray alloc]init];
    totalWon = 0;
    totalSpent = 0;
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
      return tickets.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lottoTicket" forIndexPath:indexPath];
    
    // Configure the cell...
    Ticket * aTicket = tickets[indexPath.row];
    cell.textLabel.text = [aTicket description];
    
    cell.detailTextLabel.text = aTicket.payout;
    
    if (aTicket.winner) {
        cell.detailTextLabel.textColor = [UIColor greenColor];
    }else{ cell.detailTextLabel.textColor = [UIColor redColor];
    }
   
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)createTicket:(id)sender{
    Ticket * aTicket = [Ticket ticketUsingQuickPick];
    [tickets addObject:aTicket];
    totalSpent += aTicket.priceOFOneTicket;
     self.title = [NSString stringWithFormat:@"%d spent, %d won",totalSpent, totalWon];
    [self.tableView reloadData];

}

-(IBAction)checkWinners:(id)sender{
    Ticket * aWinningTicket = [Ticket ticketUsingQuickPick];
    totalWon = 0;
    for(Ticket *lottoTicket in tickets){
        
        [lottoTicket compareWithTicket:aWinningTicket];
        totalWon += [lottoTicket.payout intValue];
       
        
    }
     self.title = [NSString stringWithFormat:@"%d spent %d won", totalSpent, totalWon];
    
    [self.tableView reloadData];
    

}

@end
