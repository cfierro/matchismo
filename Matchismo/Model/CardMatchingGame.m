//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Charlie Fierro on 5/3/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

// Private writable score for the game.
@property (nonatomic, readwrite) NSInteger score;

// Card instances in the current game.
@property (strong, nonatomic) NSMutableArray *cards;

@property (nonatomic, readwrite) BOOL started;

@end

@implementation CardMatchingGame

// Getter. Initializes and returns the array of cards currently in the game.
- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

// Designated initializer.
// Creates a new matching game with count number of cards in the game.
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    self.started = NO;

    return self;
}

// Returns the Card instance at the given index in cards.
- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

// Penalty for flipping over two cards and they don't match.
static const int MISMATCH_PENALTY = 2;

// Bonus multipled to the score returned by a card match.
static const int MATCH_BONUS = 4;

// Cost to flip over a card.
static const int COST_TO_CHOOSE = 1;

// Selects and flips or unflips a card for matching.
- (void)chooseCardAtIndex:(NSUInteger)index {
    self.started = YES;

    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            NSMutableArray *otherChosenCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [otherChosenCards addObject:otherCard];
                }
            }
            if ([otherChosenCards count] == self.matchMode - 1) {
                int matchScore = [card match:otherChosenCards];
                if (matchScore) {
                    for (Card *otherCard in otherChosenCards) {
                        otherCard.matched = YES;
                    }
                    card.matched = YES;
                    self.score += matchScore * MATCH_BONUS;
                } else {
                    for (Card *otherCard in otherChosenCards) {
                        otherCard.chosen = NO;
                    }
                    self.score -= MISMATCH_PENALTY;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

@end
