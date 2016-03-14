//
//  Teacher.h
//  NSRegularExpressionAndNSPredicate
//
//  Created by FrankLiu on 16/3/11.
//  Copyright © 2016年 FrankLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Info.h"
#import "Address.h"

@interface Teacher : NSObject

@property (nonatomic, strong) NSString   *m_name;
@property (nonatomic, strong) Info       *m_info;
@property (nonatomic, strong) Address    *m_address;
@property (nonatomic, assign) NSInteger   m_age;

@end
