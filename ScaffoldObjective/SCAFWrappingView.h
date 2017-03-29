//
//  SCAFWrappingView.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

//When a collection is just too complicated for what you want

#import "SCAFView.h"

@interface SCAFWrappingView : SCAFView

@property (nonatomic, assign) IBInspectable BOOL isVertical;
@property (nonatomic, assign) IBInspectable BOOL isHorizontal; //Default

@end
