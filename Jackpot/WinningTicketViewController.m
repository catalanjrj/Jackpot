//
//  WinningTicketViewController.m
//  Jackpot
//
//  Created by Jorge Catalan on 4/21/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import "WinningTicketViewController.h"
#import "TicketsTableViewController.h"
//delagetes and datasources here!!!!!
@interface WinningTicketViewController () <UIPickerViewDelegate, UIPickerViewDataSource>{
    NSMutableArray * pickedNumbers;
    BOOL hasPickedAllNumbers;
}

@end

@implementation WinningTicketViewController
-(void)returnThePickedNumbers{
}
- (void)viewDidLoad {
    [super viewDidLoad];
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


-(IBAction)checkTicket:(UIButton*)sender;{
    if (hasPickedAllNumbers){
        [self.delegate returnThePickedNumbers:0];}
}//what are the numbers exactly?







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
    
    NSLog(@"%ld was chosen in component %ld",(long)row+1,(long)component+1);
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
      
    
    


@end
