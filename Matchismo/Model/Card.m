//
//  Card.m
//  Matchismo
//
//  Created by Charlie Fierro on 4/13/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "Card.h"

@implementation Card

// Returns a non-zero value if the Card instance's contents exactly matches a
// card's contents in otherCards.
- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}
@end
