//
//  BlueToothCommTool.m
//  BodyTech
//
//  Created by gt on 2019/5/8.
//  Copyright © 2019 gt. All rights reserved.
//

#import "BlueToothCommTool.h"

@interface BlueToothCommTool ()
@property(nonatomic,strong) CommandModel *controRegControl;//电极开关指令
@property(nonatomic,strong) CommandModel *controRegReset;//电极复位
@property(nonatomic,strong) CommandModel *controRegPause;//暂停运动
@property(nonatomic,strong) CommandModel *controRegProtect;//暂停运动

@property(nonatomic,strong) CommandModel *timeRegControl;//电极时间控制
@property(nonatomic,strong) CommandModel *climbAndDownRegControl;//上升步数控制 T/t/value
@property(nonatomic,strong) CommandModel *maxRegControl;//脉冲峰值控制
@property(nonatomic,strong) CommandModel *wideRegControl;//脉冲宽度控制
@property(nonatomic,strong) CommandModel *climbTimeRegControl;//上升时间控制
@property(nonatomic,strong) CommandModel *downTimeRegControl;//下降时间控制
@property(nonatomic,strong) CommandModel *onTimeRegControl;//持续时间控制
@property(nonatomic,strong) CommandModel *pauseTimeRegControl;//暂停时间控制
@property(nonatomic,strong) CommandModel *valueAddRegControl;//递增电压控制
@property(nonatomic,strong) CommandModel *valueMinusRegControl;//电压递减控制
@property(nonatomic,strong) NSMutableArray *stepComms;
@property(nonatomic,strong) NSMutableArray *stepAddComms;
@property(nonatomic,strong) NSMutableArray *stepMinusComms;

@property(nonatomic,assign) int frequency;
@end

@implementation BlueToothCommTool
-(instancetype)initWithTrainModel:(TrainModel *)model{
    self = [super init];
    [self configCommWithMode:model];
    self.stepComms = [[NSMutableArray alloc] init];
    self.stepAddComms = [[NSMutableArray alloc] init];
    self.stepMinusComms = [[NSMutableArray alloc] init];
    return self;
}

-(void)configCommWithMode:(TrainModel *)model; {
    _controRegReset = [[CommandModel alloc] init];
    _controRegReset.regDesLow = 0x00;
    _controRegReset.regControlData = 0x01;
    _controRegControl = [[CommandModel alloc] init];
    _controRegControl.regDesLow = 0x03;
    _controRegControl.regControlData = 0x00;
    _controRegPause = [[CommandModel alloc] init];
    _controRegPause.regDesLow = 0x03;
    _controRegPause.regControlData = 0x00FF0000;
    _controRegProtect = [[CommandModel alloc] init];
    _controRegProtect.regDesLow = 0x05;
    _controRegProtect.regControlData = 0x03938700;
    
    _timeRegControl = [[CommandModel alloc] init];
    _timeRegControl.regDesLow = 0x10;
    _frequency = model.mode_value_frequency;
    _timeRegControl.regControlData = 1000*1000/_frequency;
    _climbAndDownRegControl = [[CommandModel alloc] init];
    _climbAndDownRegControl.regDesLow =0x11;
    _climbAndDownRegControl.regControlData = 0x01010101;
    _maxRegControl = [[CommandModel alloc] init];
    _maxRegControl.regDesLow = 0x12;
    _maxRegControl.regControlData = 0x00;
    _wideRegControl = [[CommandModel alloc] init];
    _wideRegControl.regDesLow = 0x13;
    _wideRegControl.regControlData = model.mode_value_wide*10/2;
    _climbTimeRegControl = [[CommandModel alloc] init];
    _climbTimeRegControl.regDesLow = 0x17;
    _climbTimeRegControl.regControlData = model.mode_value_climb*100*1000/102.4;
    _onTimeRegControl = [[CommandModel alloc] init];
    _onTimeRegControl.regDesLow = 0x18;
    _onTimeRegControl.regControlData = model.mode_value_on*1000*1000/102.4;
    _downTimeRegControl = [[CommandModel alloc] init];
    _downTimeRegControl.regDesLow = 0x19;
    _downTimeRegControl.regControlData = model.mode_value_dowm*100*1000/102.4;
    _pauseTimeRegControl = [[CommandModel alloc] init];
    _pauseTimeRegControl.regDesLow = 0x1A;
    _pauseTimeRegControl.regControlData = model.mode_value_off*1000*1000/102.4;
    _valueAddRegControl = [[CommandModel alloc] init];
    _valueAddRegControl.regDesLow = 0x1B;
    _valueAddRegControl.regControlData =  0x01;
    _valueMinusRegControl = [[CommandModel alloc] init];
    _valueMinusRegControl.regDesLow = 0x1D;
    _valueMinusRegControl.regControlData = 0x01;
    
}

-(NSArray *)initialInstructs{
    NSMutableArray * instructsArray = [[NSMutableArray alloc] init];
    [instructsArray addObject:_controRegReset];
    int maxReg = 8;
    for (int i=0; i<maxReg; i++) {
        CommandModel *timeTemp =[[CommandModel alloc] init];
        timeTemp.regDesLow = _timeRegControl.regDesLow + 16*i;
        timeTemp.regControlData = _timeRegControl.regControlData;
        [instructsArray addObject:timeTemp];
        CommandModel *climbAndDownTemp =[[CommandModel alloc] init];
        climbAndDownTemp.regDesLow = _climbAndDownRegControl.regDesLow + 16*i;
        climbAndDownTemp.regControlData = _climbAndDownRegControl.regControlData;
        [self.stepComms addObject:climbAndDownTemp];
        [instructsArray addObject:climbAndDownTemp];
        CommandModel *maxTemp =[[CommandModel alloc] init];
        maxTemp.regDesLow = _maxRegControl.regDesLow + 16*i;
        maxTemp.regControlData = _maxRegControl.regControlData;
        [instructsArray addObject:maxTemp];
        CommandModel *wideTemp =[[CommandModel alloc] init];
        wideTemp.regDesLow = _wideRegControl.regDesLow +16*i;
        wideTemp.regControlData = _wideRegControl.regControlData;
        [instructsArray addObject:wideTemp];
        CommandModel *shortWide =[[CommandModel alloc] init];
        shortWide.regDesLow = 0x16 + 16*i;
        shortWide.regControlData = 0x00;
        [instructsArray addObject:shortWide];
        CommandModel *climbTimeTemp = [[CommandModel alloc] init];
        climbTimeTemp.regDesLow = _climbTimeRegControl.regDesLow +16*i;
        climbTimeTemp.regControlData = _climbTimeRegControl.regControlData;
        [instructsArray addObject:climbTimeTemp];
        CommandModel *onTimeTemp = [[CommandModel alloc] init];
        onTimeTemp.regDesLow = _onTimeRegControl.regDesLow +16*i;
        onTimeTemp.regControlData = _onTimeRegControl.regControlData;
        [instructsArray addObject:onTimeTemp];
        CommandModel *downTimeTemp = [[CommandModel alloc] init];
        downTimeTemp.regDesLow = _downTimeRegControl.regDesLow +16*i;
        downTimeTemp.regControlData = _downTimeRegControl.regControlData;
        [instructsArray addObject:downTimeTemp];
        CommandModel *pauseTimeTemp = [[CommandModel alloc] init];
        pauseTimeTemp.regDesLow = _pauseTimeRegControl.regDesLow +16*i;
        pauseTimeTemp.regControlData = _pauseTimeRegControl.regControlData;
        [instructsArray addObject:pauseTimeTemp];
        CommandModel *valueAddTemp = [[CommandModel alloc] init];
        valueAddTemp.regDesLow = _valueAddRegControl.regDesLow +16*i;
        valueAddTemp.regControlData = _valueAddRegControl.regControlData;\
        [self.stepAddComms addObject:valueAddTemp];
        [instructsArray addObject:valueAddTemp];
        CommandModel *climbWideSetp =[[CommandModel alloc] init];
        climbWideSetp.regDesLow = 0x1C + 16*i;
        climbWideSetp.regControlData = 0x00;
        [instructsArray addObject:climbWideSetp];
        CommandModel *valueMinusTemp = [[CommandModel alloc] init];
        valueMinusTemp.regDesLow = _valueMinusRegControl.regDesLow +16*i;
        valueMinusTemp.regControlData = _valueMinusRegControl.regControlData;
        [self.stepMinusComms addObject:valueMinusTemp];
        [instructsArray addObject:valueMinusTemp];
        CommandModel *downWideSetp =[[CommandModel alloc] init];
        downWideSetp.regDesLow = 0x1E + 16*i;
        downWideSetp.regControlData = 0x00;
        [instructsArray addObject:downWideSetp];
    }
    [instructsArray addObject:_controRegPause];
    return instructsArray;
}
-(NSArray *)getCommandsWithPosition:(int)posi value:(int)valueNow{
    long long climbStep =0x01;
    long long downStep =0x01;
    long long climbAddStep = 0x01;
    long long downMinusStep = 0x01;
    if (_climbTimeRegControl.regControlData != 0 && valueNow != 0) {
        long long times = (_frequency*_climbTimeRegControl.regControlData)*102.4/1000/1000;
        if(valueNow > times){
            climbStep = 0x01;
            climbAddStep = valueNow/times;
        }else if(valueNow == times){
            climbStep = 0x01;
            climbAddStep = 0x01;
        }else{
            climbStep = times/valueNow;
            climbAddStep = 0x01;
        }
    }
    if (_downTimeRegControl.regControlData != 0 && valueNow != 0) {
        long long times = (_frequency*_downTimeRegControl.regControlData)*102.4/1000/1000;
        if(valueNow > times){
            downStep = 0x01;
            downMinusStep = valueNow/times;
        }else if(valueNow == times){
            downStep = 0x01;
            downMinusStep = 0x01;
        }else{
            downStep = times/valueNow;
            downMinusStep = 0x01;
        }
    }
    NSMutableArray *comms = [[NSMutableArray alloc] init];
    CommandModel *climbAndDownTemp = [[CommandModel alloc] init];
    climbAndDownTemp.regDesLow = _climbAndDownRegControl.regDesLow + 16*posi;
    downStep = (downStep>0xFF) ? 0xFF : downStep;
    climbStep = (climbStep>0xFF) ? 0xFF : climbStep;
    climbAndDownTemp.regControlData = (0x0101<<16)+(downStep<<8)+climbStep;
    CommandModel *cdCompare = (CommandModel *)self.stepComms[posi];
    if(climbAndDownTemp.regControlData != cdCompare.regControlData){
        [comms addObject:climbAndDownTemp];
        cdCompare.regControlData = climbAndDownTemp.regControlData;
    }
    CommandModel *maxTemp = [[CommandModel alloc] init];
    maxTemp.regDesLow = _maxRegControl.regDesLow+16*posi;
    maxTemp.regControlData = valueNow;
    [comms addObject:maxTemp];
    CommandModel *climbAdd = [[CommandModel alloc] init];
    climbAdd.regDesLow = _valueAddRegControl.regDesLow+16*posi;
    climbAdd.regControlData = climbAddStep;
    CommandModel *caCompare = (CommandModel *)self.stepAddComms[posi];
    if(climbAdd.regControlData != caCompare.regControlData){
        [comms addObject:climbAdd];
        caCompare.regControlData = climbAdd.regControlData;
    }
    CommandModel *downMinus = [[CommandModel alloc] init];
    downMinus.regDesLow = _valueMinusRegControl.regDesLow+16*posi;
    downMinus.regControlData = downMinusStep;
    CommandModel *dmCompare = (CommandModel *)self.stepMinusComms[posi];
    if(downMinus.regControlData != dmCompare.regControlData){
        [comms addObject:downMinus];
        dmCompare.regControlData = downMinus.regControlData;
    }
    return comms;
}

-(CommandModel *)getPauseComm{
    return  self.controRegPause;
}

-(CommandModel *)getStartComm{
    return self.controRegControl;
}

-(CommandModel *)enablePosition:(int)posi{
    if(((self.controRegControl.regControlData)&(0x00+(1<<posi)))==0){
        self.controRegControl.regControlData = self.controRegControl.regControlData+(1<<posi);
    }
    if(((self.controRegControl.regControlData>>16)&(0x00+(1<<posi)))>0){
        self.controRegControl.regControlData = self.controRegControl.regControlData-(1<<(posi+16));
    }
    return self.controRegControl;
}

-(CommandModel *)unablePosition:(int)posi{
    if(((self.controRegControl.regControlData)&(0x00+(1<<posi)))>0){
        self.controRegControl.regControlData = self.controRegControl.regControlData-(1<<posi);
    }
    if(((self.controRegControl.regControlData>>16)&(0x00+(1<<posi)))==0){
        self.controRegControl.regControlData = self.controRegControl.regControlData+(1<<(posi+16));
    }
//    self.controRegControl.regControlData = self.controRegControl.regControlData-(1<<posi)+(1<<(posi+16));
    return self.controRegControl;
}
@end
