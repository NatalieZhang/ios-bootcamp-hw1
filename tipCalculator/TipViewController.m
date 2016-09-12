//
//  ViewController.m
//  tipCalculator
//
//  Created by Natalie(Yuanyuan) Zhang on 9/7/16.
//  Copyright (c) 2016 Natalie(Yuanyuan) Zhang. All rights reserved.
//

#import "TipViewController.h"

static NSString *const tipOne = @"tip1";
static NSString *const tipTwo = @"tip2";
static NSString *const tipThree = @"tip3";

@interface TipViewController () {
    float tip1;
    float tip2;
    float tip3;
}

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getUserSettings];
    self.title = @"Tip Calculator";
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
}

- (IBAction)onBillValueChanged:(UITextField *)sender {
    [self updateValues];
}

- (void)updateValues {
    // get the bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    // compute the tip and total
    NSArray *tipValues = @[@(tip1), @(tip2), @(tip3)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    // update the ui
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)getUserSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:tipOne] == nil) {
        tip1 = 0.15;
        tip2 = 0.20;
        tip3 = 0.25;
    } else {
        tip1 = [defaults floatForKey:tipOne];
        tip2 = [defaults floatForKey:tipTwo];
        tip3 = [defaults floatForKey:tipThree];
    }
    
    [self.tipControl setTitle:[NSString stringWithFormat:@"%1.0f%%", (tip1 * 100)] forSegmentAtIndex:0];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%1.0f%%", (tip2 * 100)] forSegmentAtIndex:1];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%1.0f%%", (tip3 * 100)] forSegmentAtIndex:2];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self getUserSettings];
//    [self updateValues];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}


@end












