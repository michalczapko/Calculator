//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Michal Czapko on 20.10.2013.
//  Copyright (c) 2013 Michal Czapko. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *) operandStack
{
    // Lazy instatiation - do it as late as it's really needed.
    
    if (_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

- (double) popOperand
{
    // operandObject only points to last object
    NSNumber *operandObject = [self.operandStack lastObject];
    
    // if (operandObject) === if (operandObject != nil) - remove the last object from stack
    if (operandObject) [self.operandStack removeLastObject];

    return [operandObject doubleValue];
}

- (double)performOperation:(NSString *)operation
{
    double result = 0;

    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if ([@"*" isEqualToString:operation]) {  // We can also send a message to a constant string
        result = [self popOperand] * [self popOperand];
    } else if ([operation isEqualToString:@"-"]) {
        /*
         * It definitely does not gonna be like that:
         * 
         * result = [self popOperand] - [self popOperand];
         *
         */
    } else if ([operation isEqualToString:@"/"]) {
        /*
         * It definitely does not gonna be like that:
         *
         * result = [self popOperand] / [self popOperand];
         *
         */
    }

    return result;
}

- (void)pushOperand:(double)operand
{
    /* Longer version of what we're gonna do:
     *
     *   NSNumber *operandObject = [NSNumber numberWithDouble:operand];
     *   [self.operandStack addObject:operandObject];
     */
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

@end
