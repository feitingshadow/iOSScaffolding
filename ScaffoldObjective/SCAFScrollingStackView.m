//
//  SCAFScrollingStackView.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 1/15/18.
//  Copyright © 2018 Stephen Johnson. All rights reserved.
//

#import "SCAFScrollingStackView.h"

@interface SCAFScrollingStackView() {
    
}
@property (nonatomic, retain) NSMutableArray<UIView*> * addedViews;

@end

@implementation SCAFScrollingStackView

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        //Init from Nib or do manual set up.
    }
    return self;
}

- (void) privateInit; {
    if(self.scrollingView == nil) {
        self.addedViews = (NSMutableArray<UIView*>*)[[NSMutableArray alloc] initWithCapacity:5];
        self.scrollingView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scrollingView.backgroundColor = [UIColor clearColor];
        
        UIView * v;
        while(self.subviews.count > 0) {
            v = self.subviews[0];
            [self.scrollingView addSubview:v];
            [self.addedViews addObject:v];
        }
        [self addSubview:self.scrollingView];
        self.scrollingView.backgroundColor = [UIColor redColor];
        [self.scrollingView setAutoresizingMask: UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    }
    [self setNeedsLayout];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self privateInit];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat lastX = 0;
    CGFloat lastY = 0;
    CGFloat maxWidth = 0;
    CGFloat maxHeight = 0;
    
    //Add Align, left/right/ctr
    for (UIView * subV in self.addedViews) {
        
        if(self.isHorizontal) {
            subV.frame = CGRectMake(lastX + subV.leftMargin, lastY + subV.topMargin, subV.frame.size.width, subV.frame.size.height);
            lastX = subV.right + subV.rightMargin;
            maxWidth = lastX;
        }
        else {
            subV.frame = CGRectMake(lastX + subV.leftMargin, lastY + subV.topMargin, subV.frame.size.width, subV.frame.size.height);
            lastY = subV.bottom + subV.bottomMargin;
            maxHeight = lastY;
        }
        [UIView animateWithDuration:(NSTimeInterval)2 animations:^{
            self.frame = CGRectMake(0,0,100,100);
        }];
    }
    if(self.isHorizontal) {
        self.scrollingView.contentSize = CGSizeMake(maxWidth, self.bounds.size.height);
    }
    else {
        self.scrollingView.contentSize = CGSizeMake(self.bounds.size.width, maxHeight);
    }
//    if(self.sizeToMatchSubviews == YES) {
//        if(self.isHorizontal) {
//            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, maxWidth, self.bounds.size.height);
//        }
//        else {
//            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.bounds.size.width, maxHeight);
//        }
//    }
    
}

@end
