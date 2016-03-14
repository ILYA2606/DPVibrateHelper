//
//  VibrateHelper.m
//  CameraOllieTest
//
//  Created by ILYA2606 on 14.03.16.
//  Copyright © 2016 Darkness Production. All rights reserved.
//

#import "DPVibrateHelper.h"

void AudioServicesPlaySystemSoundWithVibration(SystemSoundID inSystemSoundID, id arg, NSDictionary* vibratePattern);

@implementation DPVibrateHelper

+(void)vibrateWithDuration:(long)duration{
    [DPVibrateHelper vibrateWithVibration:[Vibration vibrationWithDuration:duration]];
}

+(void)vibrateWithVibration:(Vibration*)vibration{
    [DPVibrateHelper vibrateWithVibrations:vibration, nil];
}

+(void)vibrateWithVibrations:(Vibration*)vibrations, ... NS_REQUIRES_NIL_TERMINATION{
    va_list argumentList;
    va_start(argumentList, vibrations);
    NSMutableArray *arguments = [NSMutableArray array];
    for (Vibration *argument = vibrations; argument != nil; argument = va_arg(argumentList, Vibration*)){
        [arguments addObject:argument];
    }
    va_end(argumentList);
    
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    NSMutableArray* arr = [NSMutableArray array ];
    
    for(Vibration *vibration in arguments){
        if(vibration.duration <= 0){
            continue;
        }
        if(vibration.delayDuration > 0){
            [arr addObject:@NO];
            [arr addObject:@(vibration.delayDuration)];
        }
        [arr addObject:@YES];
        [arr addObject:@(vibration.duration)];
    }
    
    [dict setObject:arr forKey:@"VibePattern"];
    [dict setObject:[NSNumber numberWithInt:1] forKey:@"Intensity"];
    
    
    AudioServicesPlaySystemSoundWithVibration(4095,nil,dict);
}

@end


@implementation Vibration

+(instancetype)vibrationWithDuration:(long)duration{
    return [Vibration vibrationWithDuration:duration delayDuration:0];
}

+(instancetype)vibrationWithDuration:(long)duration delayDuration:(long)delayDuration{
    Vibration *vibration = [Vibration new];
    vibration.duration = duration;
    vibration.delayDuration = delayDuration;
    return vibration;
}

@end