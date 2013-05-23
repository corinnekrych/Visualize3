//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Corinne Krych on 5/21/13.
//  Copyright (c) 2013 corinne Krych. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView
@property (nonatomic)   NSUInteger rank;
@property(strong, nonatomic) NSString *suit;
@property(nonatomic) BOOL faceUp;
@end
