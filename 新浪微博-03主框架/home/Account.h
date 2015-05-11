//
//  Account.h
//  新浪微博-01OAuth认证
//
//  Created by yang on 15-5-6.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject<NSCoding>
@property(strong,nonatomic)NSString *access_token;
@property(assign,nonatomic)long long expires_in;
@property(assign,nonatomic)long long remind_in;
@property(assign,nonatomic)long long uid;
@property(strong,nonatomic)NSDate *createDate;
+(instancetype)accountWithDic:(NSDictionary *)dic;
@end
