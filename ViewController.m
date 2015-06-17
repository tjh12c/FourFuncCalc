//
//  ViewController.m
//  Project 1
//
//  Created by Tyler Hunnefeld on 6/9/15.
//  Copyright (c) 2015 Tyler Hunnefeld. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *display;
@end

@implementation ViewController
@synthesize stillEntering, input, numInput, operationUserHasPressed,firstOperation, outputText, comp;
- (void)viewDidLoad {
    [super viewDidLoad];
    stillEntering=false;
    outputText.userInteractionEnabled = NO;
    comp = [[Compute alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

//works
- (IBAction)clearPressed:(UIButton *)sender {
    UIAlertView *message = [[UIAlertView alloc]
                            initWithTitle: @"Clear"
                            message: @"Are you sure you want to clear the display?"
                            delegate: self
                            cancelButtonTitle:@"No"
                            otherButtonTitles:@"Yes", nil
                            ];
    [message show];
}
//works
-(void) alertView: (UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [self.comp removeAll];
        stillEntering=false;
        self.operationUserHasPressed=nil;
        printf("Data reset \n");    //used to check program flow
        outputText.text = @"0";
        numInput=0;
    }
}

//works
-(IBAction)numberPressed:(UIButton *)sender {
    if(stillEntering==true){
        numInput = ((numInput*10)+[sender.currentTitle doubleValue]);
    }
    else{
        numInput = [sender.currentTitle doubleValue];
    }
    stillEntering = true;
    outputText.text = [NSString stringWithFormat:@"%d", numInput];
}

//flows correctly, problem is with arithmetic
- (IBAction)equalsPressed:(UIButton *)sender {
    double result = 0;
    if (!self.operationUserHasPressed) {
        result = (double)numInput;
        printf("num ");
    }
    else {
        [comp pushOperand:(double)numInput];
        result = [self.comp performOperation:self.operationUserHasPressed];
        [self.comp popOperand];
        [self.comp popOperand];
        printf("numFromStack ");
    }
    stillEntering=false;
    self.operationUserHasPressed=nil;
    numInput=0;
    [self.comp removeAll];
    outputText.text = [NSString stringWithFormat:@"%.02f", result];
    printf("solution\n");
}

- (IBAction)operationPressed:(UIButton *)sender {
    double result = 0;
    stillEntering=false;
    if (!self.operationUserHasPressed) {
        self.operationUserHasPressed = sender.currentTitle;
        [self.comp pushOperand:(double)numInput];
        result = (double)numInput;
    }
    else {
        [self.comp pushOperand:(double)numInput];
        result = [self.comp performOperation:self.operationUserHasPressed];
        self.operationUserHasPressed = sender.currentTitle;
        [self.comp pushOperand:result];
    }
    outputText.text = [NSString stringWithFormat:@"%.02f", result];
}


@end
