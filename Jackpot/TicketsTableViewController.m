//
//  TicketsTableViewController.m
//  Jackpot
//
//  Created by Jorge Catalan on 4/20/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import "TicketsTableViewController.h"
#import "Tickets.h"
#import "WinningTicketViewController.h"

@interface TicketsTableViewController () <WinningTicketViewControllerDelagete>{
/// on root view total number of winnins and cost of total number of winnings
NSMutableArray *tickets;
    int totalWon;
    int totalSpent;
    int totalWinnings;
    
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
    totalWinnings = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)returnThePickedNumbers:(NSArray *)pickedNumbers {
    [self checkWinners:pickedNumbers];
    
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"winners"]){
        WinningTicketViewController * wtvc =(WinningTicketViewController *)segue.destinationViewController;wtvc.delegate = self;}
    }
- (IBAction)returnToTickets:(UIStoryboardSegue *)segue {
    
}



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
        
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"payout" ascending:NO];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        tickets = [[tickets sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];

       
        
    }
     self.title = [NSString stringWithFormat:@"%d spent %d won", totalSpent, totalWon];
    
    [self.tableView reloadData];
    
    

}



@end
