//
//  SCAFStackingView.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "SCAFView.h"

@interface SCAFStackingView : SCAFView

@property (nonatomic, assign) IBInspectable BOOL isVertical;
@property (nonatomic, assign) IBInspectable BOOL isHorizontal; //Overrides
@property (nonatomic, assign) IBInspectable BOOL sizeToMatchSubviews;

@end
