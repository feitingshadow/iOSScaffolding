//
//  SCAFScrollingStackView.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 1/15/18.
//  Copyright © 2018 Stephen Johnson. All rights reserved.
//

#import "SCAFView.h"

@interface SCAFScrollingStackView : SCAFView
{
    
}

@property (nonatomic, strong) UIScrollView * scrollingView;

@property (nonatomic, assign) IBInspectable BOOL isVertical;
@property (nonatomic, assign) IBInspectable BOOL isHorizontal; //Overrides
//@property (nonatomic, assign) IBInspectable BOOL sizeToMatchSubviews;

@end
