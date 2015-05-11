//
//  Account.m
//  新浪微博-01OAuth认证
//
//  Created by yang on 15-5-6.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import "Account.h"

@implementation Account
+(instancetype)accountWithDic:(NSDictionary *)dic
{
    Account *account = [[Account alloc]init];
    account.access_token = dic[@"access_token"];
    account.expires_in = [dic[@"expires_in"] longLongValue];
    account.remind_in = [dic[@"remind_in"] longLongValue];
    account.uid = [dic[@"uid"] longLongValue];
    account.createDate = [NSDate date];
    return account;
}
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:@(self.expires_in) forKey:@"expires_in"];
    [aCoder encodeObject:@(self.remind_in) forKey:@"remind_in"];
    [aCoder encodeObject:@(self.uid) forKey:@"uid"];
    [aCoder encodeObject:self.createDate forKey:@"createDate"];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [[aDecoder decodeObjectForKey:@"expires_in"]longValue];
        self.remind_in = [[aDecoder decodeObjectForKey:@"remind_in"]longValue];
        self.uid = [[aDecoder decodeObjectForKey:@"uid"]longValue];
        self.createDate = [aDecoder decodeObjectForKey:@"createDate"];
    }
    return self;
}
@end
