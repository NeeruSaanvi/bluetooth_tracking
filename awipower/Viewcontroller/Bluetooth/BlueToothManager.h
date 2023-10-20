//
//  BlueToothManager.h
//  BodyTech
//
//  Created by gt on 2019/5/2.
//  Copyright © 2019 gt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "CommandModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol BluetoothManagerConnectDelegate <NSObject>
- (void) bluetoothDevices:(NSMutableArray *)devices;
- (void) bluetoothDeviceConnectedSucc:(CBPeripheral *)device;
- (void) bluetoothDeviceDiscoveredService:(CBPeripheral *)device;
- (void) bluetoothDeviceDisConnectedSucc:(CBPeripheral *)device;
- (void) bluetoothDeviceDisConnectedSucc;
@end

@interface BlueToothManager : NSObject
@property (nonatomic, weak) id<BluetoothManagerConnectDelegate> connectDelegate;
@property (nonatomic, weak) id<BluetoothManagerConnectDelegate> disconDelegate;
@property (nonatomic,strong) CBPeripheral *connectedDevice;
@property (nonatomic,strong) NSOperationQueue *btQueue;//蓝牙操作队列
@property (nonatomic,strong) CommandModel *heartBeatComm;

- (void)stopScan;
- (void) scanForPeripheralsWithSerices;
- (void) connectPeripheral:(CBPeripheral *)device;
- (void) disConnectPeripheral:(CBPeripheral *)device;
-(void)sendDataToPeripheral:(CBPeripheral *)peripheral;
-(void)sendData:(long long)data ToPeripheral:(CBPeripheral *)peripheral;
+ (BlueToothManager *)sharedInstance;
@end

NS_ASSUME_NONNULL_END
