//
//  WinningTicketViewController.h
//  Jackpot
//
//  Created by Jorge Catalan on 4/21/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tickets.h"

@protocol WinningTicketViewControllerDelagete <NSObject>
@required
-(void)returnThePickedNumbers:(NSArray*)numbersPicked;

@optional
-(void)sayThanksForTheNumbers;
-(void)winningTicketWasAdded:(Ticket *)ticket;

@end

@interface WinningTicketViewController : UIViewController

@property(weak,nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIButton *checkTicketButton;
@property(weak,nonatomic) IBOutlet id <WinningTicketViewControllerDelagete>delegate;

-(IBAction)checkTicket:(UIButton*)sender;
-(IBAction)randomWinner:(UIButton*)sender;

@end
