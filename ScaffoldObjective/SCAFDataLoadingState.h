//
//  SCAFDataLoadingState.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 3/16/17.
//  Copyright © 2017 Stephen Johnson. All rights reserved.
//

#ifndef SCAFDataLoadingState_h
#define SCAFDataLoadingState_h


typedef NS_ENUM(NSInteger, SCAFDataLoadingState) {
    SCAFDataLoadingStateInitial, //Unknown state in most languages. Initial makes more sense.
    SCAFDataLoadingStateLoading,
    SCAFDataLoadingStateLoaded,
    SCAFDataLoadingStateError
};
#endif /* SCAFDataLoadingState_h */
