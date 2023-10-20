
//
//  CommandModel.m
//  BodyTech
//
//  Created by gt on 2019/5/8.
//  Copyright © 2019 gt. All rights reserved.
//

#import "CommandModel.h"
@interface CommandModel()
@property(nonatomic,assign) long long start;
@property(nonatomic,assign) long long end;
@end
@implementation CommandModel

-(instancetype)init{
    self = [super init];
    _start=0x36;
    _end=0xc9;
    _regDesHigh=0x00;
    _regDesLow=0x00;
    _regControlData =0x00;
    return self;
}

-(long long)instruct{
    Byte * temp = [self longlongToByte:(_start<<(8*7))+(_regDesHigh<<(8*6))+(_regDesLow<<(8*5))+(_regControlData<<(8*1))+_end];
    return [self byteToLongLong:temp];
}

-(Byte*)longlongToByte:(long long)value{
    Byte * byte = malloc(8);
    byte[0] = ((value>>56) & 0xFF);
    byte[1] = ((value>>48) & 0xFF);
    byte[2] = ((value>>40) & 0xFF);
    byte[3] = ((value>>32) & 0xFF);
    byte[4] = ((value>>24) & 0xFF);
    byte[5] = ((value>>16) & 0xFF);
    byte[6] = ((value>>8) & 0xFF);
    byte[7] = (value & 0xFF);
    return byte;
}
-(long long)byteToLongLong:(Byte*)byte{
    long long value =0;
    value = (((long long)byte[7] <<56&0xFF00000000000000L)|
                 ((long long)byte[6] <<48&0xFF000000000000L)|
                 ((long long)byte[5] <<40&0xFF0000000000L)|
                 ((long long)byte[4] <<32&0xFF00000000L)|
                 ((long long)byte[3] <<24&0xFF000000L)|
                 ((long long)byte[2] <<16&0xFF0000L)|
                 ((long long)byte[1] <<8&0xFF00L)|
                 ((long long)byte[0] &0xFFL));
    free(byte);
    return value;
}
@end
