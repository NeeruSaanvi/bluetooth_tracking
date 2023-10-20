//
//  CommandModel.h
//  BodyTech
//
//  Created by gt on 2019/5/8.
//  Copyright © 2019 gt. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommandModel : NSObject
@property(nonatomic,assign,readonly) long long instruct;
@property(nonatomic,assign) long long regDesHigh;
@property(nonatomic,assign) long long regDesLow;
@property(nonatomic,assign) long long regControlData;
@end

NS_ASSUME_NONNULL_END
