//
//  Deck.h
//  Matchismo
//
//  Created by Charlie Fierro on 4/27/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

// Class that models a basic deck with Card objects.
@interface Deck : NSObject

// Adds a Card object to the bottom or top of the deck.
- (void)addCard:(Card *)card atTop:(BOOL)atTop;

// Adds a Card object to the bottom of the deck.
- (void)addCard:(Card *)card;

// Returns a random card from the deck. The card is removed the deck.
- (Card *)drawRandomCard;

@end
