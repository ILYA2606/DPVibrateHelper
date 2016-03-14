//
//  ViewController.m
//  VibrateExample
//
//  Created by ILYA2606 on 14.03.16.
//  Copyright © 2016 Darkness Production. All rights reserved.
//

#import "ViewController.h"
#import "DPVibrateHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - IBActions

- (IBAction)vibrate:(UIButton *)sender {
    [DPVibrateHelper vibrateWithVibrations:
     [Vibration vibrationWithDuration:200],
     [Vibration vibrationWithDuration:200 delayDuration:200],
     [Vibration vibrationWithDuration:100 delayDuration:300],
     [Vibration vibrationWithDuration:100 delayDuration:100],
     [Vibration vibrationWithDuration:100 delayDuration:100],
     [Vibration vibrationWithDuration:100 delayDuration:300],
     [Vibration vibrationWithDuration:100 delayDuration:100],
     [Vibration vibrationWithDuration:100 delayDuration:100],
     [Vibration vibrationWithDuration:100 delayDuration:100],
     [Vibration vibrationWithDuration:150 delayDuration:300],
     [Vibration vibrationWithDuration:150 delayDuration:100],
     nil];
}

@end
