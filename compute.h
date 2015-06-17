//
//  compute.h
//  Project 1
//
//  Created by Tyler Hunnefeld on 6/15/15.
//  Copyright (c) 2015 Tyler Hunnefeld. All rights reserved.
//

#ifndef Project_1_compute_h
#define Project_1_compute_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//Compute
@interface Compute : NSObject
@property (nonatomic, strong) NSMutableArray *programStack;

- (NSMutableArray *) programStack;
- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;
- (double)popOperand;
- (void)removeAll;
@end



#endif
