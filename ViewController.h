//
//  ViewController.h
//  Project 1
//
//  Created by Tyler Hunnefeld on 6/9/15.
//  Copyright (c) 2015 Tyler Hunnefeld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "compute.h"

//ViewController
@interface ViewController : UIViewController

@property (nonatomic, strong) Compute * comp;
@property (nonatomic, weak) NSString * operationUserHasPressed;
@property (nonatomic, strong) NSNumber *input;
@property (nonatomic) BOOL stillEntering, firstOperation;
@property (weak, nonatomic) IBOutlet UITextField *outputText;
@property (nonatomic) int numInput;

- (IBAction)equalsPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;
- (IBAction)numberPressed:(UIButton *)sender;
- (IBAction)clearPressed:(UIButton *)sender;


@end


