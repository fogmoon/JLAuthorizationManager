//
//  ViewController.m
//  JLAuthorizationDemo
//
//  Created by Sunxiaolin on 17/3/27.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import "ViewController.h"
#import "JLAuthorizationManager.h"
@import HealthKit;
@import Accounts;

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NSArray *_authDataArray;
    NSArray *_authTypeArray;
}

@property (nonatomic, strong) UITableView *authTableView;

@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"权限集锦";
    _authDataArray = @[@"相册/PhotoLibrary",
                       @"网络/Cellular Network",
                       @"相机/Camera",
                       @"麦克风/Audio",
                       @"通讯录/AddressBook",
                       @"日历/Calendar",
                       @"提醒事项/Reminder",
                       @"一直请求定位权限/RequestMapAlways",
                       @"使用时请求定位权限/RequestWhenInUse",
                       @"媒体资料库/AppleMusic",
                       @"语音识别/SpeechRecognizer",
                       @"Siri",
                       @"健康数据/HealthData",
                       @"蓝牙共享/Bluetooth",
                       @"推特/Twitter",
                       @"脸书/Facebook",
                       @"新浪微博/SinaWeibo",
                       @"腾讯微博/TencentWeibo"];
    
    _authTypeArray = @[@(JLAuthorizationTypePhotoLibrary),
                       @(JLAuthorizationTypeNetWork),
                       @(JLAuthorizationTypeVideo),
                       @(JLAuthorizationTypeAudio),
                       @(JLAuthorizationTypeAddressBook),
                       @(JLAuthorizationTypeCalendar),
                       @(JLAuthorizationTypeReminder)];
    
    [self.view addSubview:self.authTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getters
- (UITableView *)authTableView{
    if (!_authTableView) {
        _authTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
        _authTableView.dataSource = self;
        _authTableView.delegate = self;
        _authTableView.tableFooterView = [UIView new];
    }
    return _authTableView;
}
#pragma mark - Action
#pragma mark - Private
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _authDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"AuthorizationManageCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = _authDataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypePhotoLibrary authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 1:{
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeNetWork authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 2:{
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeVideo authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 3:{
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeAudio authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 4:{
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeAddressBook authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 5:{
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeCalendar authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 6:{
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeReminder authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 7:{
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeMapAlways authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 8:{
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeMapWhenInUse authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 9:{
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeAppleMusic authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 10:{
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeSpeechRecognizer authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 11:{
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeSiri authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 12:{
            HKObjectType *type = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning];
            HKObjectType *type1 = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
            NSSet *shareSet = [NSSet setWithObjects:type, type1, nil];
            [[JLAuthorizationManager defaultManager] JL_requestHealthAuthorizationWithShareTypes:shareSet readTypes:shareSet authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                 NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
            
        }
            break;
        case 13:{
            [[JLAuthorizationManager defaultManager] JL_requestAuthorizationWithAuthorizationType:JLAuthorizationTypeBluetooth authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }];
        }
            break;
        case 14:{
            [[JLAuthorizationManager defaultManager] JL_requestAccountAuthorizationWithAuthorizationType:JLAuthorizationTypeTwitter options:nil authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } errorHandler:^(NSError *error) {
                NSLog(@"error:%@", error);
            }];
        }
            break;
        case 15:{
            NSDictionary *options = @{ ACFacebookAppIdKey: @"MY_CODE",
                                       ACFacebookPermissionsKey: @[@"email", @"user_about_me"],
                                      ACFacebookAudienceKey: ACFacebookAudienceFriends };
            [[JLAuthorizationManager defaultManager] JL_requestAccountAuthorizationWithAuthorizationType:JLAuthorizationTypeFacebook options:options authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }errorHandler:^(NSError *error) {
                NSLog(@"error:%@", error);
            }];
        }
            break;
        case 16:{
            [[JLAuthorizationManager defaultManager] JL_requestAccountAuthorizationWithAuthorizationType:JLAuthorizationTypeSinaWeibo options:nil authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }errorHandler:^(NSError *error) {
                NSLog(@"error:%@", error);
            }];
        }
            break;
        case 17:{
            NSDictionary *options = @{ACTencentWeiboAppIdKey: @"123"};
            [[JLAuthorizationManager defaultManager] JL_requestAccountAuthorizationWithAuthorizationType:JLAuthorizationTypeTencentWeibo options:options authorizedHandler:^{
                NSLog(@"Has granted:%@", _authDataArray[indexPath.row]);
            } unAuthorizedHandler:^{
                NSLog(@"Not granted:%@", _authDataArray[indexPath.row]);
            }errorHandler:^(NSError *error) {
                NSLog(@"error:%@", error);
            }];
        }
            break;
            
            
        default:
            break;
    }
}

@end
