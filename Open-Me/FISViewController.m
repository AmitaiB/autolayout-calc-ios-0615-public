//
//  FISViewController.m
//  Open-Me
//
//  Created by Joe Burgess on 3/4/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIButton *zeroButton;
@property (strong, nonatomic) IBOutlet UIButton *oneButton;
@property (strong, nonatomic) IBOutlet UIButton *twoButton;
@property (strong, nonatomic) IBOutlet UIButton *threeButton;
@property (strong, nonatomic) IBOutlet UIButton *fourButton;
@property (strong, nonatomic) IBOutlet UIButton *fiveButton;
@property (strong, nonatomic) IBOutlet UIButton *sixButton;
@property (strong, nonatomic) IBOutlet UIButton *sevenButton;
@property (strong, nonatomic) IBOutlet UIButton *eightButton;
@property (strong, nonatomic) IBOutlet UIButton *nineButton;
@property (strong, nonatomic) IBOutlet UIButton *divideButton;
@property (strong, nonatomic) IBOutlet UIButton *multiplyButton;
@property (strong, nonatomic) IBOutlet UIButton *subtractionButton;
@property (strong, nonatomic) IBOutlet UIButton *additionButton;
@property (strong, nonatomic) IBOutlet UIButton *equalButton;
@property (strong, nonatomic) IBOutlet UIButton *decimalButton;

@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (strong, nonatomic) IBOutlet UIView *inputFieldContainer;
@property (strong, nonatomic) IBOutlet UIView *buttonsContainer;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *calcElements = @{@"0":self.zeroButton,
                                   @"1":self.oneButton,
                                   @"2":self.twoButton,
                                   @"3":self.threeButton,
                                   @"4":self.fourButton,
                                   @"5":self.fiveButton,
                                   @"6":self.sixButton,
                                   @"7":self.sevenButton,
                                   @"8":self.eightButton,
                                   @"9":self.nineButton,
                                   @"10":self.divideButton,
                                   @"11":self.multiplyButton,
                                   @"12":self.subtractionButton,
                                   @"13":self.additionButton,
                                   @"14":self.equalButton,
                                   @"15":self.decimalButton,
                                   @"16":self.inputField,
                                   @"17":self.inputFieldContainer,
                                   @"18":self.buttonsContainer
                                   };
                                   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
