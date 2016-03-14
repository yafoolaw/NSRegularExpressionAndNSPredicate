//
//  Teacher.m
//  NSRegularExpressionAndNSPredicate
//
//  Created by FrankLiu on 16/3/11.
//  Copyright © 2016年 FrankLiu. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        self.m_info    = [Info new];
        self.m_address = [Address new];
    }
    
    return self;
}

@end
