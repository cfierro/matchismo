//
//  PlayingCard.h
//  Matchismo
//
//  Created by Charlie Fierro on 4/22/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "Card.h"

// Class expanding the Card model to better represent a standard playing card.
@interface PlayingCard : Card

// A valid suit as defined in validSuits.
@property (strong, nonatomic) NSString *suit;

// A rank between 0 and maxRank.
@property (nonatomic) NSUInteger rank;

// Class method returning the list of valid suit strings for a PlayingCard.
+ (NSArray *)validSuits;

// Class method returning the highest rank possible for a PlayingCard.
+ (NSUInteger)maxRank;

@end
