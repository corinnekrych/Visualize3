//
//  VisualizeViewController.m
//  Visualize
//
//  Created by Corinne Krych on 5/16/13.
//  Copyright (c) 2013 Corinne Krych. All rights reserved.
//

#import "VisualizeViewController.h"
#import "CardMatchingGame.h"


@interface VisualizeViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *score;

@property (weak, nonatomic) IBOutlet UICollectionView *cardcollectionView;
@end

@implementation VisualizeViewController

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.startingCardcount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard" forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell: cell usingCard:card];
    
    return cell;
}

- (void) updateCell: (UICollectionViewCell *) cell usingCard: (Card *) card {
    // abstract
}

- (CardMatchingGame *)game {
    //NSLog(@"Init game");
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.startingCardcount usingDeck:[self createDeck]];
    return _game;
}

- (Deck *) createDeck { //abstract
    return nil;
}

-(void) updateUI {
    NSLog(@"updateUI..");
    for (UICollectionViewCell *cell in [self.cardcollectionView visibleCells]) {
        NSLog(@"inside");
        NSIndexPath *indexPath = [self.cardcollectionView indexPathForCell:cell];
        Card * card = [self.game cardAtIndex:indexPath.item];
        [self updateCell:cell usingCard:card];
    }
    [self.score setText:[NSString stringWithFormat:@"Score : %d", self.game.score]];
}

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips : %d", self.flipCount];
}

- (IBAction)flipCard:(UITapGestureRecognizer *)gesture {
    NSLog(@"flipcard..");
    CGPoint tapLocation = [gesture locationInView:self.cardcollectionView];
    NSIndexPath *indexPath = [self.cardcollectionView indexPathForItemAtPoint:tapLocation];
    
    if(indexPath) {
        [self.game flipCardAtIndex:indexPath.item];
        self.flipCount++;
        [self updateUI];
        
    }


}



@end
