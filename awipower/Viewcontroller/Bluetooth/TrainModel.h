//
//  TrainModel.h
//  BodyTech
//
//  Created by gt on 2019/4/29.
//  Copyright © 2019 gt. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TrainType) {
    TrainTypeDiet = 0,
    TrainTypeAerobic,
    TrainTypeMucle,
    TrainTypeRelax,
    TrainTypePerfesion,
    TrainTypeVIP,
    TrainTypeDetox,
    TrainTypeRecuperate,
    TrainTypeMassage
};

NS_ASSUME_NONNULL_BEGIN
@interface TrainModel : NSObject
//"M1"-减肥模式，"M2"-心肺模式，"M3"-增肌模式，"M4"-放松模式，"M5"-专业模式，"M6"-VIP模式
@property(nonatomic,assign) TrainType trainType;
@property(nonatomic,copy) NSString *trainTypeStr;
@property(nonatomic,assign) int mode_value_on;//脉冲持续       下述5个参数 int
@property(nonatomic,assign) int mode_value_off;//脉冲暂停
@property(nonatomic,assign) int mode_value_frequency;//频率
@property(nonatomic,assign) int mode_value_wide;//脉宽
@property(nonatomic,assign) int mode_value_climb;//爬升
@property(nonatomic,assign) int mode_value_dowm;//滑落
@property(nonatomic,assign) int body_value_arm;//手臂强度       下述强度数值 0-100 int
@property(nonatomic,assign) int body_value_shoulder;//肩部强度
@property(nonatomic,assign) int body_value_chest;//胸部强度
@property(nonatomic,assign) int body_value_back;//背部强度
@property(nonatomic,assign) int body_value_ab;//腹部强度
@property(nonatomic,assign) int body_value_waist;//腰部强度
@property(nonatomic,assign) int body_value_hip;//臀部强度
@property(nonatomic,assign) int body_value_leg;//腿部强度
@property(nonatomic,assign) double calories;
@property(nonatomic,assign) double period;
@property(nonatomic,assign) int periodTotal;
@property(nonatomic,assign) BOOL value_on_selected;
@property(nonatomic,assign) BOOL value_off_selected;
@property(nonatomic,assign) BOOL value_frequency_selected;
@property(nonatomic,assign) BOOL value_wide_selected;
@property(nonatomic,assign) BOOL value_climb_selected;
@property(nonatomic,assign) BOOL value_dowm_selected;
@property(nonatomic,assign) BOOL period_selected;
@property(nonatomic,copy) NSString *update_time;
@property(nonatomic,copy) NSString *typeStr;
@property(nonatomic,copy) NSString *trainId;
@property(nonatomic,assign) int score;
@property(nonatomic,assign) int averageValue;
@property(nonatomic,assign) int modeType;

-initWithDict:(NSDictionary *)dict;
-(void)resetModel;
+(instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
