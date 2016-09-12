//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Natalie(Yuanyuan) Zhang on 9/11/16.
//  Copyright © 2016 Natalie(Yuanyuan) Zhang. All rights reserved.
//

#import "SettingsViewController.h"

static NSString *const tipOne = @"tip1";
static NSString *const tipTwo = @"tip2";
static NSString *const tipThree = @"tip3";

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tip1;
@property (weak, nonatomic) IBOutlet UITextField *tip2;
@property (weak, nonatomic) IBOutlet UITextField *tip3;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
    [self getUserSettings];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self getUserSettings];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self saveTipSettings];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getUserSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:tipOne] == nil) {
        self.tip1.text = @"0.15";
        self.tip2.text = @"0.20";
        self.tip3.text = @"0.25";
    } else {
        self.tip1.text = [NSString stringWithFormat:@"%0.2f", [defaults floatForKey:tipOne]];
        self.tip2.text = [NSString stringWithFormat:@"%0.2f", [defaults floatForKey:tipTwo]];
        self.tip3.text = [NSString stringWithFormat:@"%0.2f", [defaults floatForKey:tipThree]];
    }
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    
}

- (IBAction)tip1Updated:(UITextField *)sender {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setFloat:[self.tip1.text floatValue] forKey:tipOne];
    [userDef synchronize];
}

- (IBAction)tip2Updated:(UITextField *)sender {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setFloat:[self.tip2.text floatValue] forKey:tipTwo];
    [userDef synchronize];
}

- (IBAction)tip3Updated:(UITextField *)sender {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setFloat:[self.tip3.text floatValue] forKey:tipThree];
    [userDef synchronize];
}

- (void) saveTipSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:[self.tip1.text floatValue] forKey:tipOne];
    [defaults setFloat:[self.tip2.text floatValue] forKey:tipTwo];
    [defaults setFloat:[self.tip3.text floatValue] forKey:tipThree];
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
