//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Charlie Fierro on 5/3/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

// Card game with the objective of matching cards by flipping them over.
@interface CardMatchingGame : NSObject

// Designated initializer.
// Creates a new matching game with count number of cards in the game.
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

// Selects and flips or unflips a card for matching.
- (void)chooseCardAtIndex:(NSUInteger)index;

// Returns Card instance at the specified index.
- (Card *)cardAtIndex:(NSUInteger)index;

// Public read only score for the game.
@property (nonatomic, readonly) NSInteger score;

@end
