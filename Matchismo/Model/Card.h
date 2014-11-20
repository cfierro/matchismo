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

// The string to be displayed on a Card instance.
@property (strong, nonatomic) NSString *contents;

// Card is faceup if true and facedown if false.
@property (nonatomic, getter=isChosen) BOOL chosen;

// Card has been matched if true and unmatched if false.
@property (nonatomic, getter=isMatched) BOOL matched;

// Returns a non-zero value if the Card instance's contents exactly matches a
// card's contents in otherCards.
- (int)match:(NSArray *)otherCards;

@end