//
//  WinningTicketViewController.m
//  Jackpot
//
//  Created by Jorge Catalan on 4/21/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import "WinningTicketViewController.h"
#import "TicketsTableViewController.h"
#import "Tickets.h"
//delagetes and datasources here!!!!!
@interface WinningTicketViewController () <UIPickerViewDelegate, UIPickerViewDataSource>{
    NSMutableArray * pickedNumbers;
    BOOL hasPickedAllNumbers;
}
-(BOOL)numbersPicked;

@end

@implementation WinningTicketViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.checkTicketButton.enabled = NO;
    hasPickedAllNumbers = NO;
    // Do any additional setup after loading the view.
    pickedNumbers = [@[[NSNumber numberWithInt:0],
                      [NSNumber numberWithInt:0],
                      [NSNumber numberWithInt:0],
                      [NSNumber numberWithInt:0],
                      [NSNumber numberWithInt:0],
                      [NSNumber numberWithInt:0]] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)numbersPicked{
    for (NSNumber *pickedNumber in pickedNumbers) {
        if ([pickedNumber isEqualToNumber:@0]) {
            return NO;
        }
    }
    return YES;
}


    -(IBAction)randomWinner:(UIButton *)sender{
        Ticket * randomTicket = [Ticket ticketUsingQuickPick];
        int index = 0;
        
        do {
            NSInteger getNumber = [randomTicket.picks[index] integerValue];
            [_pickerView selectRow:getNumber inComponent:index animated:YES];
            index += 1;
        } while (index < 6);
        
         pickedNumbers = [randomTicket.picks mutableCopy];
        //checked if all numbers have been picked and activate check button.
        
        if ([self numbersPicked]) {
            self.checkTicketButton.enabled = YES;
            hasPickedAllNumbers = YES;
        } else {
            self.checkTicketButton.enabled = NO;
            hasPickedAllNumbers = NO;
        }
    }
-(IBAction)checkTicket:(UIButton*)sender;{
            if (hasPickedAllNumbers){
                [self.delegate returnThePickedNumbers:pickedNumbers];}
}
//what are the numbers exactly?

//check if all numbers have been picked!!


#pragma mark UIPickerView

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 6;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;{
    return 54;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%ld", (long)row + 1];

}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    pickedNumbers[component] = [NSNumber numberWithLong:row +1];
    
    
    if ([self numbersPicked]) {
        self.checkTicketButton.enabled = YES;
        hasPickedAllNumbers = YES;
    } else {
        self.checkTicketButton.enabled = NO;
        hasPickedAllNumbers = NO;
}


}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
      
    
    


@end
