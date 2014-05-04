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

// The card matching game containing the logic for the Matchismo game.
@property (strong, nonatomic) CardMatchingGame *game;

// UIButtons representing and displaying the cards in the game.
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

// Label representing and displaying the score in the game.
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation CardGameViewController

// Getter. Initializes and returns the current Matchismo game.
- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc]
                         initWithCardCount:[self.cardButtons count]
                         usingDeck:[self createDeck]];
    return _game;
}

// Creates and returns a deck to play a game with.
- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

// Updates the cardButtons and scoreLabel using and depending on the game logic.
- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        cardButton.alpha = card.isMatched ? 0.7 : 1.0;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",
                                self.game.score];
    }
}

// Returns a string to display on the cardButton for the respective card.
- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
}

// Returns an image to display on the cardButton for the respecitive card.
- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? nil : @"cardback"];
}

// Action that makes the card (button) flip back and forth.
- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

@end
