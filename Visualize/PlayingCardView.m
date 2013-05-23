//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Corinne Krych on 5/21/13.
//  Copyright (c) 2013 corinne Krych. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

- (void) setup {
}

- (void) awakeFromNib {
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setSuit:(NSString *) suit {
    _suit = suit;
    [self setNeedsDisplay];
}

- (void) setRank:(NSUInteger) rank {
    _rank = rank;
    [self setNeedsDisplay];
}

- (void) setFaceUp:(BOOL)faceUp {
    _faceUp = faceUp;
    [self setNeedsDisplay];
}



- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:12.0];
    [roundedRect addClip];
    if (self.faceUp) {
        [[UIColor whiteColor] setFill];
        [roundedRect fill];
    
        [[UIColor blackColor] setStroke];
        [roundedRect stroke];
    
        //UIImage *faceImage = [UIImage imageNamed: []]
    
        [self drawCorners];
    } else {
        [[UIColor blackColor] setFill];
        [roundedRect fill];
        
        [[UIColor blackColor] setStroke];
        [roundedRect stroke];
    }
}

- (void) drawCorners {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *cornerFont = [UIFont systemFontOfSize:self.bounds.size.width * 0.2];
    
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@", [self rankAsString], self.suit] attributes:@{NSParagraphStyleAttributeName: paragraphStyle, NSFontAttributeName: cornerFont}];
    CGRect textBounds;
    textBounds.origin = CGPointMake(2.0, 2.0);
    textBounds.size = [cornerText size];
    [cornerText drawInRect:textBounds];
    
    [self pushContextAndRotateUpsideDown];
    [cornerText drawInRect:textBounds];
    [self popContext]; //ctxt back
    
}

-(void) popContext {
    UIGraphicsPopContext();
}

-(void) pushContextAndRotateUpsideDown {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
}

- (NSString *) rankAsString {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"][self.rank];
}

@end
