//
//  BlueToothCommTool.h
//  BodyTech
//
//  Created by gt on 2019/5/8.
//  Copyright © 2019 gt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrainModel.h"
#import "CommandModel.h"
//#import "Constant.h"
NS_ASSUME_NONNULL_BEGIN

@interface BlueToothCommTool : NSObject
@property(nonatomic,strong,readonly) NSArray *initialInstructs;
-(NSArray *)getCommandsWithPosition:(int)posi value:(int)valueNow;
-(CommandModel *)getPauseComm;
-(CommandModel *)getStartComm;
-(CommandModel *)enablePosition:(int)posi;
-(CommandModel *)unablePosition:(int)posi;
-(instancetype)initWithTrainModel:(TrainModel *)model;;
@end

NS_ASSUME_NONNULL_END
