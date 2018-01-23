//
//  SCAFSelectableView.h
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 1/18/18.
//  Copyright © 2018 Stephen Johnson. All rights reserved.
//

#import "SCAFView.h"

@protocol SCAFSelectableViewDelegate <NSObject>
@optional
- (void) selectNextSelection; //Sent when view is ready to give up the focus.
@end

@interface SCAFSelectableView : SCAFView

@property (nonatomic, assign, readonly) BOOL isResponding;
@property (nonatomic, assign) uint countOfSelections;
@property (nonatomic, assign, readonly) uint currentIndex;
@property (nonatomic, assign) int currentOptionIndex; //internal labels

@property (nonatomic, weak) id<SCAFSelectableViewDelegate> selectableViewDelegate;
@property (nonatomic, strong, readonly) NSArray<NSString*> * optionSelectionsArray;
@property (nonatomic, strong, readonly) NSArray<NSString*> * optionDescriptionsArray;

- (void) beginRespondingWithViewUpdate: (void(^)(void))beginRespondingChanges nextSelectionFunction:(void(^)(void))nextSelectionBlock endRespondingFunction:(void(^)(void))endRespondingBlock;
- (void) endResponding;
- (void) nextSelection;
- (void) setupOptionsWith:(NSArray<NSString*>*)selectableOptions descriptions:(NSArray<NSString*>*)matchingDescriptions;
- (void) forwardSignal;
- (void) backwardSignal;
@end
