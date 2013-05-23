//
//  VisualizeViewController.h
//  Visualize
//
//  Created by Corinne Krych on 5/16/13.
//  Copyright (c) 2013 Corinne Krych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface VisualizeViewController : UIViewController
- (Deck *) createDeck; //abstract
@property(nonatomic) NSUInteger startingCardcount; //abstract
- (void) updateCell: (UICollectionViewCell *) cell usingCard: (Card *) card; //abstract
@end
