//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Michal Czapko on 20.10.2013.
//  Copyright (c) 2013 Michal Czapko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@end
