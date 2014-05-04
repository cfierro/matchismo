//
//  Deck.m
//  Matchismo
//
//  Created by Charlie Fierro on 4/27/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "Deck.h"

@interface Deck()

// The deck containing Card objects.
@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

// Getter. Initializes and returns the deck containing Card objects.
- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

// Adds a Card object to the bottom or top of the deck.
- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

// Adds a Card object to the bottom of the deck.
- (void)addCard:(Card *)card {
    [self addCard:card atTop:NO];
}

// Returns a random card from the deck. The card is removed the deck.
- (Card *)drawRandomCard {
    Card *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

@end
