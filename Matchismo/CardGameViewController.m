//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Charlie Fierro on 4/13/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

// Displays the number of times the card has been flipped.
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

// Counts the number of times the card has been flipped.
@property (nonatomic) int flipCount;

// A Deck object containing PlayingCard objects.
@property (strong, nonatomic) Deck *deck;

// TODO
@property (strong, nonatomic) CardMatchingGame *game;

// TODO
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation CardGameViewController

// TODO
- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc]
                         initWithCardCount:[self.cardButtons count]
                         usingDeck:[self createDeck]];
    return _game;
}

// Getter. Initializes and returns the deck containing PlayingCard objects.
- (Deck *)deck {
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

// Setter. Sets the new flipCount and updates the flipsLabel.
- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",
                            self.flipCount];
    NSLog(@"flipCount changed to %d", self.flipCount);
}

// Action that makes the card (button) flip back and forth.
- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        Card *card = [self.deck drawRandomCard];
        NSString *contents = card.contents ? card.contents : @"Done!";
        [sender setBackgroundImage:nil
                          forState:UIControlStateNormal];
        [sender setTitle:contents forState:UIControlStateNormal];
    }
    self.flipCount++;
}

@end
