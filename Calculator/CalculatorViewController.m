//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Michal Czapko on 19.10.2013.
//  Copyright (c) 2013 Michal Czapko. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = sender.currentTitle; // same as: [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber) {
        // NSLog(@"digit pressed = %@", digit); // Logging to console
        
        /*
         * The following code is a long version of what we will do after
         * the comment.
         
         UILabel *myDisplay = self.display; // same as: [self display];
         NSString *currentText = myDisplay.text; // same as: [myDisplay text];
         NSString *newText = [currentText stringByAppendingString:digit];
         myDisplay.text = newText; // same as: [myDisplay text:newText];
         */
        
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}

@end
