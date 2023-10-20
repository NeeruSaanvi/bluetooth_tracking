//
//  TrainModel.m
//  BodyTech
//
//  Created by gt on 2019/4/29.
//  Copyright © 2019 gt. All rights reserved.
//

#import "TrainModel.h"
//#include "Constant.h"
@interface TrainModel()
@property(nonatomic,assign) int modeNum;
@end

@implementation TrainModel

+(instancetype)sharedInstance {
    static TrainModel *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TrainModel alloc] init];
    });
    return instance;
}

-(instancetype)init{
    self = [super init];
    [self resetModel];
    _period_selected = YES;
    return self;
}

-initWithDict:(NSDictionary *)dict{
    self = [super init];
    _period_selected = YES;
    self.trainId = dict[@"training_id"];
    self.trainTypeStr = dict[@"training_mode"];
    self.body_value_arm = [dict[@"body_value_arm"] intValue];
    self.body_value_shoulder = [dict[@"body_value_shoulder"] intValue];
    self.body_value_chest = [dict[@"body_value_chest"] intValue];
    self.body_value_back = [dict[@"body_value_back"] intValue];
    self.body_value_ab = [dict[@"body_value_ab"] intValue];
    self.body_value_waist = [dict[@"body_value_waist"] intValue];
    self.body_value_hip = [dict[@"body_value_hip"] intValue];
    self.body_value_leg = [dict[@"body_value_leg"] intValue];
    self.mode_value_on = [dict[@"mode_value_on"] intValue];
    self.mode_value_off = [dict[@"mode_value_off"] intValue];
    self.mode_value_frequency = [dict[@"mode_value_frequency"] intValue];
    self.mode_value_wide = [dict[@"mode_value_wide"] intValue];
    self.mode_value_climb = [dict[@"mode_value_climb"] doubleValue];
    self.mode_value_dowm = [dict[@"mode_value_dowm"] doubleValue];
    self.update_time = dict[@"update_time"];
    self.period = [dict[@"period"] doubleValue];
    self.calories = [dict[@"calories"] doubleValue];
    
    if(self.modeType){
        if([_trainTypeStr isEqualToString:@"M1"]){
            _trainType = TrainTypeDiet;
            _typeStr = NSLocalizedString(@"mode_slim", nil);
        }else if([_trainTypeStr isEqualToString:@"M2"]){
            _trainType = TrainTypeRelax;
            _typeStr = NSLocalizedString(@"mode_relax", nil);
        }else if([_trainTypeStr isEqualToString:@"M3"]){
            _trainType = TrainTypeDetox;
            _typeStr = NSLocalizedString(@"mode_detox", nil);
        }else if([_trainTypeStr isEqualToString:@"M4"]){
            _trainType = TrainTypeRecuperate;
            _typeStr = NSLocalizedString(@"mode_recu", nil);
        }else if([_trainTypeStr isEqualToString:@"M5"]){
            _trainType = TrainTypeMassage;
            _typeStr = NSLocalizedString(@"mode_massage", nil);
        }
    }else{
        if([_trainTypeStr isEqualToString:@"M1"]){
            _trainType = TrainTypeDiet;
            _typeStr = NSLocalizedString(@"mode_slim", nil);
        }else if([_trainTypeStr isEqualToString:@"M2"]){
            _trainType = TrainTypeAerobic;
            _typeStr = NSLocalizedString(@"mode_muscle", nil);
        }else if([_trainTypeStr isEqualToString:@"M3"]){
            _trainType = TrainTypeMucle;
            _typeStr = NSLocalizedString(@"mode_fit", nil);
        }else if([_trainTypeStr isEqualToString:@"M4"]){
            _trainType = TrainTypeRelax;
            _typeStr = NSLocalizedString(@"mode_relax", nil);
        }else if([_trainTypeStr isEqualToString:@"M5"]){
            _trainType = TrainTypePerfesion;
            _typeStr = NSLocalizedString(@"mode_treatment", nil);
        }else if([_trainTypeStr isEqualToString:@"M6"]){
            _trainType = TrainTypeVIP;
            _typeStr = NSLocalizedString(@"mode_professional", nil);
        }
    }
    
    int valueScore = 0;
    int avgValue = self.averageValue;
    if(avgValue<10)
        valueScore = 5;
    else if(avgValue >= 10 && avgValue<25)
        valueScore =10;
    else if(avgValue >= 25 && avgValue<40)
        valueScore =12;
    else if(avgValue >= 40 && avgValue<50)
        valueScore =14;
    else if(avgValue >= 50)
        valueScore =15;
    self.score = 70+(self.period/5)*5+valueScore;
    return self;
}

- (void)setTrainType:(TrainType)model{
    NSArray *config;
    if(self.modeType){
        if (model == TrainTypeDiet) {//436
            config = @[@85,@"NO",@350,@"NO",@1,@"YES",@0,@"YES",@0,@"NO",@0,@"NO",@20];
            _typeStr = NSLocalizedString(@"mode_slim", nil);
            _trainTypeStr = @"M1";
        }else if(model == TrainTypeRelax){//252
            config = @[@100,@"NO",@150,@"NO",@1,@"YES",@1,@"YES",@0,@"NO",@0,@"NO",@20];
            _typeStr = NSLocalizedString(@"mode_relax", nil);
            _trainTypeStr = @"M2";
        }else if(model == TrainTypeDetox){//358
            config = @[@7,@"NO",@350,@"NO",@1,@"YES",@0,@"YES",@0,@"NO",@0,@"NO",@20];
            _typeStr = NSLocalizedString(@"mode_detox", nil);
            _trainTypeStr = @"M3";
        }else if(model == TrainTypeRecuperate){//443
            config = @[@85,@"NO",@350,@"NO",@4,@"YES",@4,@"YES",@4,@"NO",@4,@"NO",@20];
            _typeStr = NSLocalizedString(@"mode_recu", nil);
            _trainTypeStr = @"M4";
        }else if(model == TrainTypeMassage){//437
            config = @[@85,@"NO",@350,@"NO",@2,@"YES",@0,@"YES",@30,@"YES",@30,@"YES",@20];
            _typeStr = NSLocalizedString(@"mode_massage", nil);
            _trainTypeStr = @"M5";
        }
    }else{
        if (model == TrainTypeDiet) {//433
            config = @[@65,@"NO",@360,@"NO",@4,@"YES",@4,@"YES",@4,@"NO",@4,@"NO",@20];
            _typeStr = NSLocalizedString(@"mode_slim", nil);
            _trainTypeStr = @"M1";
        }else if(model == TrainTypeAerobic){//368
            config = @[@7,@"NO",@360,@"NO",@1,@"YES",@0,@"YES",@0,@"NO",@0,@"NO",@20];
            _typeStr = NSLocalizedString(@"mode_muscle", nil);
            _trainTypeStr = @"M2";
        }else if(model == TrainTypeMucle){//453
            config = @[@85,@"NO",@360,@"NO",@4,@"YES",@4,@"YES",@0,@"NO",@0,@"NO",@20];
            _typeStr = NSLocalizedString(@"mode_fit", nil);
            _trainTypeStr = @"M3";
        }else if(model == TrainTypeRelax){//262
            config = @[@100,@"NO",@160,@"NO",@1,@"YES",@1,@"YES",@0,@"NO",@0,@"NO",@20];
            _typeStr = NSLocalizedString(@"mode_relax", nil);
            _trainTypeStr = @"M4";
        }else if(model == TrainTypePerfesion){//447
            config = @[@85,@"NO",@360,@"NO",@1,@"YES",@1,@"YES",@40,@"YES",@40,@"YES",@20];
            _typeStr = NSLocalizedString(@"mode_treatment", nil);
            _trainTypeStr = @"M5";
        }else if(model == TrainTypeVIP){//449
            config = @[@85,@"YES",@360,@"YES",@2,@"YES",@2,@"YES",@30,@"YES",@30,@"YES",@20];
            _typeStr = NSLocalizedString(@"mode_professional", nil);
            _trainTypeStr = @"M6";
        }
    }
    [self configDetailValueWithArray:config];
    _trainType = model;
}

-(void)configDetailValueWithArray:(NSArray *)values{
    _mode_value_frequency = [[values objectAtIndex:0] intValue];
    _value_frequency_selected = [(NSString *)values[1] isEqualToString:@"YES"];
    _mode_value_wide = [[values objectAtIndex:2] intValue];
    _value_wide_selected = [(NSString *)values[3] isEqualToString:@"YES"];
    _mode_value_on = [[values objectAtIndex:4] intValue];
    _value_on_selected = [(NSString *)values[5] isEqualToString:@"YES"];
    _mode_value_off = [[values objectAtIndex:6] intValue];
    _value_off_selected = [(NSString *)values[7] isEqualToString:@"YES"];
    _mode_value_climb = [[values objectAtIndex:8] intValue];
    _value_climb_selected = [(NSString *)values[9] isEqualToString:@"YES"];
    _mode_value_dowm = [[values objectAtIndex:10] intValue];
    _value_dowm_selected = [(NSString *)values[11] isEqualToString:@"YES"];
    _periodTotal = [[values objectAtIndex:12] intValue];
}

-(int)averageValue{
    int num = self.modeType ? 4 : 8;
    return (self.body_value_arm+self.body_value_shoulder+self.body_value_chest+self.body_value_back+self.body_value_ab+self.body_value_waist+self.body_value_hip+self.body_value_leg)/num;
}

-(void)resetModel{
    self.body_value_arm = 0;
    self.body_value_shoulder = 0;
    self.body_value_chest = 0;
    self.body_value_back = 0;
    self.body_value_waist = 0;
    self.body_value_hip = 0;
    self.body_value_leg = 0;
    self.body_value_ab = 0;
    self.calories = 0;
    self.period = 0;
}

- (int)modeNum{
    return _mode_value_frequency + _mode_value_wide + _mode_value_on + _mode_value_off;
}

-(int)typeMode{
    if(self.modeNum == 436 || self.modeNum == 252||self.modeNum == 358||self.modeNum == 443||self.modeNum == 437){
        return 1;
    }else{
        return 0;
    }
}
@end
