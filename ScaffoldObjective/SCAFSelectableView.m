//
//  SCAFSelectableView.m
//  ScaffoldObjective
//
//  Created by Stephen Johnson on 1/18/18.
//  Copyright © 2018 Stephen Johnson. All rights reserved.
//

#import "SCAFSelectableView.h"

@interface SCAFSelectableView() {
}

//Options are the internal options while selections are which mini area, if not itself, is selected as a whole for input. Options change, selections are what changes. Fix vocab soon - SJ. (Or subclass for options vs selections, but still fix)
@property (nonatomic, assign) BOOL isResponding;
@property (nonatomic, assign) uint currentIndex;
@property (nonatomic, strong) NSArray<NSString*> * optionSelectionsArray;
@property (nonatomic, strong) NSArray<NSString*> * optionDescriptionsArray;
@property (nonatomic, strong) IBOutlet UILabel * titleLabel;
@property (nonatomic, strong) IBOutlet UILabel * optionLabel;
@property (nonatomic, copy) void (^nextSelectAction)(void) ;
@property (nonatomic, copy) void (^endSelectAction)(void) ;
@end

@implementation SCAFSelectableView

- (void) nextSelection; {
   self.nextSelectAction();
    self.currentIndex++;
    if(self.currentIndex >= self.countOfSelections) {
        [self endResponding];
    }
}

- (void) beginRespondingWithViewUpdate: (void(^)(void))beginRespondingChanges nextSelectionFunction:(void(^)(void))nextSelectionBlock endRespondingFunction:(void(^)(void))endRespondingBlock;
{
    if(self.countOfSelections == 0) {
        self.countOfSelections = 1;
    }
    self.currentIndex = 0;
    self.isResponding = YES;
    self.nextSelectAction = nextSelectionBlock;
    self.endSelectAction = endRespondingBlock;
    beginRespondingChanges(); //update the view here, border color, background, anims
    [self updateDisplay];
}

- (void) endResponding;
{
    self.isResponding = NO;
    self.endSelectAction();
    self.nextSelectAction = nil;
    self.endSelectAction = nil;
    self.selectableViewDelegate = nil;
    if(self.selectableViewDelegate != nil && [self.selectableViewDelegate respondsToSelector:@selector(selectNextSelection)]) {
            [self.selectableViewDelegate selectNextSelection];
    }
}

- (void)dealloc {
    self.selectableViewDelegate = nil;
    self.nextSelectAction = nil;
    self.endSelectAction = nil;
}

- (void) setupOptionsWith:(NSArray<NSString*>*)selectableOptions descriptions:(NSArray<NSString*>*)matchingDescriptions;
{
    self.optionSelectionsArray = selectableOptions;
    self.optionDescriptionsArray = matchingDescriptions;
}

- (void) forwardSignal;
{
    if(_isResponding && self.optionSelectionsArray != nil && self.optionSelectionsArray.count > 0) {
        self.currentOptionIndex++;
        if (self.currentOptionIndex >= self.optionSelectionsArray.count) {
            self.currentOptionIndex = 0;
        }
        [self updateDisplay];
    }
}

- (void) updateDisplay; {
    if(self.optionLabel != nil && self.optionSelectionsArray != nil && self.optionSelectionsArray.count > self.currentOptionIndex && self.currentOptionIndex >= 0) {
        self.optionLabel.text = self.optionSelectionsArray[self.currentOptionIndex];
    }
}

- (void) backwardSignal;
{
    if(_isResponding && self.optionSelectionsArray != nil && self.optionSelectionsArray.count > 0) {
        self.currentOptionIndex--;
        if (self.currentOptionIndex < 0) {
            self.currentOptionIndex = (int)self.optionSelectionsArray.count-1;
        }
        [self updateDisplay];
    }
}
@end
