//
//  SCAFGradientView.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import "SCAFView.h"

IB_DESIGNABLE

@interface SCAFGradientView : SCAFView

@property (nonatomic, retain) IBInspectable UIColor * fromColor;
@property (nonatomic, retain) IBInspectable UIColor * toColor;

@property (nonatomic, assign) IBInspectable BOOL isVertical;
@property (nonatomic, assign) IBInspectable BOOL isHorizontal; //Overrides

@end
