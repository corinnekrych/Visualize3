//
//  PlayingVisualizeViewController.m
//  Visualize
//
//  Created by Corinne Krych on 5/22/13.
//  Copyright (c) 2013 Corinne Krych. All rights reserved.
//

#import "PlayingVisualizeViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "PlayinCardCollectionViewCell.h"
#import "PlayingCardView.h" 

@interface PlayingVisualizeViewController ()

@end

@implementation PlayingVisualizeViewController
- (PlayingCardDeck *) createDeck {
    return [[PlayingCardDeck alloc] init];
}

-(NSUInteger) startingCardcount {
    return 20;
}

- (void) updateCell: (UICollectionViewCell *) cell usingCard: (PlayingCard *) card {
    NSLog(@"updatecell:usingcard:1");
    if([cell isKindOfClass:[PlayinCardCollectionViewCell class]]) {
         NSLog(@"updatecell:usingcard:2");
        PlayingCardView *playingCardView = ((PlayinCardCollectionViewCell *)cell).playingCardView;
        if ([card isKindOfClass:[PlayingCard class]]) {
             NSLog(@"updatecell:usingcard:3");
            PlayingCard *playingCard = (PlayingCard *)card;
            playingCardView.rank = playingCard.rank;
            playingCardView.suit = playingCard.suit;
            playingCardView.faceUp = playingCard.faceUp;
            playingCardView.alpha = playingCard.isUnplayable ? 0.3 : 1.0;
            
        }
    }
}

@end
