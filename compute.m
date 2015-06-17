//
//  compute.m
//  Project 1
//
//  Created by Tyler Hunnefeld on 6/15/15.
//  Copyright (c) 2015 Tyler Hunnefeld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "compute.h"

@interface Compute ()
@property (nonatomic) double operand1, operand2, val;
@end

@implementation Compute
@synthesize operand1, operand2, val, programStack;



-(NSMutableArray *)programStack {
    if (!programStack) {
        programStack = [[NSMutableArray alloc] init];
    }
    return programStack;
}

-(void)pushOperand:(double)operand {
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
    NSLog(@"%@", programStack);
}
-(double)performOperation:(NSString *)operation {
    //Perform Addition
    if ([operation isEqualToString:@"+"]) {
        NSLog(@"%@", programStack);
        operand1 = [self popOperand];
        operand2 = [self popOperand];
        val = operand1 + operand2;
        printf("\nadd\n");
    }
    //Perform subtraction
    else if ([operation isEqualToString:@"-"]){
        operand1 = [self popOperand];
        operand2 = [self popOperand];
        val = operand2 - operand1;
        printf("subtract ");
    }
    //Perform division
    else if ([operation isEqualToString:@"/"]){
        operand1 = [self popOperand];
        operand2 = [self popOperand];
        val = operand2 / operand1;
        printf("divide ");
    }
    //Perform multiplication
    else if ([operation isEqualToString:@"x"]){
        operand1 = [self popOperand];
        operand2 = [self popOperand];
        val = operand1 * operand2;
        printf("multiply ");
    }
    else {
        val = [self popOperand]; //if error, erase and start over
        printf("error");
    }
    NSLog(@"%f" , val);    //more code?
    return val;
}
-(double)popOperand {
    val = 0;
    NSNumber *res = [self.programStack lastObject];
    if (self.programStack) {
        val = [res doubleValue];
        [self.programStack removeLastObject];
    }
    return val;
}

-(void)removeAll {
    [self.programStack removeAllObjects];
}
@end
