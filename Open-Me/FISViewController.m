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

@property (strong, nonatomic) NSDictionary *calcElements;

@end

@implementation FISViewController

- (void)viewDidLoad
{                                                                           NSLog(@"line 40");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /**
     Apple Docs: "Views"
     A dictionary of views that appear in the visual format string. The keys must be the string values used in the visual format string, and the values must be the view objects.
     */
NSLog(@"line 48");
    self.calcElements = @{@"zeroButton":self.zeroButton,
                          @"oneButton":self.oneButton,
                          @"twoButton":self.twoButton,
                          @"threeButton":self.threeButton,
                          @"fourButton":self.fourButton,
                          @"fiveButton":self.fiveButton,
                          @"sixButton":self.sixButton,
                          @"sevenButton":self.sevenButton,
                          @"eightButton":self.eightButton,
                          @"nineButton":self.nineButton,
                          @"divideButton":self.divideButton,
                          @"multiplyButton":self.multiplyButton,
                          @"subtractionButton":self.subtractionButton,
                          @"additionButton":self.additionButton,
                          @"equalButton":self.equalButton,
                          @"decimalButton":self.decimalButton,
                          @"inputField":self.inputField,
                          @"inputFieldContainer":self.inputFieldContainer,
                          @"buttonsContainer":self.buttonsContainer,
                          @"superview": self.view
                          }; NSLog(@"line 68");
    for (UIView *viewElement in self.calcElements.allValues) {
        [self stripConstraintsFrom:viewElement];
    }
    [self.view removeConstraints:self.view.constraints];
NSLog(@"line 73");
    [self addContainerConstraints];
NSLog(@"line 75");
    [self addInputFieldConstraints];
NSLog(@"line 77");
    [self addButtonsConstraints];
NSLog(@"line 79");
        /**
    Metrics    A dictionary of constants that appear in the visual format string. The dictionary’s keys must be the string values used in the  visual format string. Their values must be NSNumber objects.
         */
    
}


-(void)stripConstraintsFrom:(UIView*)viewElement {
    [viewElement removeConstraints:viewElement.constraints];
    [viewElement setTranslatesAutoresizingMaskIntoConstraints:NO];
}

-(void)addContainerConstraints {
    NSArray *hInputFieldContainerConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[inputFieldContainer]|" options:0 metrics:nil views:self.calcElements];
    [self.view addConstraints:hInputFieldContainerConstraints];
    
    NSArray *hButtonsContainerConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[buttonsContainer]|" options:0 metrics:nil views:self.calcElements];
    [self.view addConstraints:hButtonsContainerConstraints];
    
    NSArray *vContainerConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[inputFieldContainer][buttonsContainer(==inputFieldContainer)]|" options:0 metrics:nil views:self.calcElements];
    [self.view addConstraints:vContainerConstraints];
    
    
}

#pragma mark - addInputFieldConstraints

-(void)addInputFieldConstraints {
    NSArray *hInputFieldConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[inputField]-|" options:0 metrics:nil views:self.calcElements];
    [self.view addConstraints:hInputFieldConstraints];
    
    NSArray *vInputFieldConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[superview]-30-[inputField]" options:0 metrics:nil views:self.calcElements];
    [self.view addConstraints:vInputFieldConstraints];
}

#pragma mark = addButtonsConstraints

    /// Add 4 row constraints, and 4 column constraints. Or make a row and column constraint, for all 4 rows...
-(void) addButtonsConstraints {
    NSArray *allButtonsByRow = @[
                                 @[@"oneButton", @"twoButton", @"threeButton", @"divideButton"],
                                 @[@"fourButton", @"fiveButton", @"sixButton", @"multiplyButton"],
                                 @[@"sevenButton", @"eightButton", @"nineButton", @"subtractionButton"],
                                 @[@"zeroButton", @"decimalButton", @"equalButton", @"additionButton"]
                                 ];
    
    NSArray *allButtonsByCol = @[
                                 @[@"oneButton", @"fourButton", @"sevenButton", @"zeroButton"], 
                                 @[@"twoButton", @"fiveButton", @"eightButton", @"decimalButton"],
                                 @[@"threeButton", @"sixButton", @"nineButton", @"equalButton"],
                                 @[@"divideButton", @"multiplyButton", @"subtractionButton", @"additionButton"]
                                 ];
        ///This string is in Visual Format Language (see helper functions below).                        
    for (NSArray *buttonRow in allButtonsByRow) {
        NSString *currentRowConstraintString = [self genericRowConstraints:buttonRow];
        NSArray *buttonRowConstraint = [NSLayoutConstraint constraintsWithVisualFormat:currentRowConstraintString options:0 metrics:nil views:self.calcElements];
        [self.buttonsContainer addConstraints:buttonRowConstraint];
    }

    for (NSArray *buttonCol in allButtonsByCol) {
        NSString *currentColConstraintString = [self genericColConstraints:buttonCol];
        NSArray *buttonColConstraint = [NSLayoutConstraint constraintsWithVisualFormat:currentColConstraintString options:0 metrics:nil views:self.calcElements];
        [self.buttonsContainer addConstraints:buttonColConstraint];
    }
}
    
-(NSString*) genericRowConstraints:(NSArray*)row {
    NSString *hGenericRowConstraints = [NSString stringWithFormat:@"H:|[%@][%@(==%@)][%@(==%@)][%@(==%@)]|", row[0], row[1], row[0], row[2], row[0], row[3], row[0]];
    return hGenericRowConstraints;
}

-(NSString*) genericColConstraints:(NSArray*)col {
    NSString *vGenericColConstraints = [NSString stringWithFormat:@"V:|[%@][%@(==%@)][%@(==%@)][%@(==%@)]|", col[0], col[1], col[0], col[2], col[0], col[3], col[0]];
    return vGenericColConstraints;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
