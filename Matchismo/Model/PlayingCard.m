//
//  PlayingCard.m
//  Matchismo
//
//  Created by Charlie Fierro on 4/22/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

// TODO
- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        } else if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
    }
    
    return score;
}

// Getter. Gets the string to be displayed on a PlayingCard instance.
- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; // Setter and getter are defined below.

// Class method returning the list of valid suit strings for a PlayingCard.
+ (NSArray *)validSuits {
    return @[@"♠", @"♣", @"♥", @"♦"];
}

// Setter. Sets the suit for a PlayingCard instance. Only a suit in validSuits
// is allowed.
- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

// Getter. Gets the suit of a PlayingCard instance or "?" if it has no suit.
- (NSString *)suit {
    return _suit ? _suit : @"?";
}

// Class method returning the list of valid ranks for a PlayingCard.
+ (NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
             @"J", @"Q", @"K"];
}

// Class method returning the highest rank possible for a PlayingCard.
+ (NSUInteger)maxRank {
    return [[self rankStrings] count] - 1;
}

// Setter. Sets the rank for a PlayingCard instance.
- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

@end
