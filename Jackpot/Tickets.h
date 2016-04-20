//
//  Tickets.h
//  Jackpot
//
//  Created by Jorge Catalan on 4/20/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject
//get in habit add nonatomic inside property

@property (assign) BOOL winner;
@property (copy, nonatomic) NSString *payout;
@property (assign) int priceOFOneTicket;
//-(returntype)methodName
+(instancetype)ticketUsingQuickPick;
+(instancetype)ticketUsingArray:(NSArray*)picks;


- (void)compareWithTicket:(Ticket*)anotherTicket;

-(NSArray*) picks;







@end
