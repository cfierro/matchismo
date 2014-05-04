//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Charlie Fierro on 5/3/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

// Creates a deck with the standard fifty-two playing cards.
- (instancetype)init {
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    
    return self;
}
@end
