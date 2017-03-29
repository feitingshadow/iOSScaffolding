//
//  SCAFView.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/28/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCAFDataLoadingState.h"
#import "UIView+SCAFView.h"

@interface SCAFView : UIView

@property (nonatomic, assign) SCAFDataLoadingState state;

@end
