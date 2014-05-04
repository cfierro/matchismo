//
//  Card.h
//  Matchismo
//
//  Created by Charlie Fierro on 4/13/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import <Foundation/Foundation.h>

// Class that models a basic card with an unrestricted content string.
@interface Card : NSObject

// Gets the string to be displayed on a Card instance.
@property (strong, nonatomic) NSString *contents;

// TODO
@property (nonatomic, getter=isChosen) BOOL chosen;

// TODO
@property (nonatomic, getter=isMatched) BOOL matched;

// TODO
- (int)match:(NSArray *)otherCards;

@end