//
//  ViewController.m
//  NSRegularExpressionAndNSPredicate
//
//  Created by FrankLiu on 16/3/11.
//  Copyright © 2016年 FrankLiu. All rights reserved.
//

#import "ViewController.h"
#import "Info.h"
#import "Address.h"
#import "Teacher.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 使用正则表达式
    [self useRegularExpression];
    
    // 使用谓词
    [self usePredicate];
}

- (void)useRegularExpression {

    NSString *string = @"46.5";
    
    NSError *error = NULL;
    
    // 创建正则表达式(例子中为">= 5 <= 50的整数")
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[1-4]\\d$|^[5-9]$|^50$"
                                                                           options:NSRegularExpressionAnchorsMatchLines
                                                                             error:&error];
    // 匹配数
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string
                                                        options:NSMatchingReportProgress
                                                          range:NSMakeRange(0, [string length])];
    
    NSLog(@"Match numbers = %lu",(unsigned long)numberOfMatches);
    
    // 匹配范围
    NSArray *resultArray = [regex matchesInString:string
                                          options:NSMatchingReportProgress
                                            range:NSMakeRange(0, [string length])];
    
    for (NSTextCheckingResult *match in resultArray) {
        
        NSRange matchRange = [match range];
        
        NSLog(@"Match string = %@",[string substringWithRange:matchRange]);
    }
}

- (void)usePredicate {

    //初始化数据
    Teacher *teacher1                  = [[Teacher alloc] init];
    teacher1.m_info.m_classNum         = @"11班";
    teacher1.m_address.m_detailAddress = @"海淀区";
    teacher1.m_name                    = @"L.D.S.";
    teacher1.m_age                     = 11;

    Teacher *teacher2                  = [[Teacher alloc] init];
    teacher2.m_info.m_classNum         = @"12班";
    teacher2.m_address.m_detailAddress = @"立水桥";
    teacher2.m_name                    = @"P.K.";
    teacher2.m_age                     = 20;

    Teacher *teacher3                  = [[Teacher alloc] init];
    teacher3.m_info.m_classNum         = @"11班";
    teacher3.m_address.m_detailAddress = @"万盛路";
    teacher3.m_name                    = @"Y.X.";
    teacher3.m_age                     = 22;
    
    NSMutableArray *teachers =
    [[NSMutableArray alloc] initWithObjects:teacher1, teacher2, teacher3, nil];
    
    // [1] 比较操作 (>,<,>=,<=,=)
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"m_age > 15"];
    
    NSArray *resultArray1 = [teachers filteredArrayUsingPredicate:predicate1];
    
    for (Teacher *tmp in resultArray1) {
        
        NSLog(@"[1] Age > 15 match teacher = %@",tmp.m_name);
    }
    
    // [2] 字符串常规操作 (beginswith,endswith,contains)
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"m_name beginswith[cd] 'L'"];
    
    NSArray *resultArray2 = [teachers filteredArrayUsingPredicate:predicate2];
    
    for (Teacher *tmp in resultArray2) {
        
        NSLog(@"[2] Name beginswith[cd] 'L' match teacher = %@",tmp.m_name);
    }
    
    // [3] 范围 (between,in)
    NSPredicate *predicate3 = [NSPredicate predicateWithFormat:@"m_age in {11,20,22}"];
    
    NSArray *resultArray3 = [teachers filteredArrayUsingPredicate:predicate3];
    
    for (Teacher *tmp in resultArray3) {
        
        NSLog(@"[3] Age in {11,20,22} match teacher = %@",tmp.m_name);
    }
    
    // [4] 通配符 (like)
    NSPredicate *predicate4 = [NSPredicate predicateWithFormat:@"m_name like[cd] '*D*'"];
    
    NSArray *resultArray4 = [teachers filteredArrayUsingPredicate:predicate4];
    
    for (Teacher *tmp in resultArray4) {
        
        NSLog(@"[4] Name like[cd] '*D*' match teacher = %@",tmp.m_name);
    }
    
    // [5] 逻辑运算 (AND,OR,NOT)
    NSPredicate *predicate5 = [NSPredicate predicateWithFormat:@"m_age <= 22 AND m_name like[cd] '*X*'"];
    
    NSArray *resultArray5 = [teachers filteredArrayUsingPredicate:predicate5];
    
    for (Teacher *tmp in resultArray5) {
        
        NSLog(@"[5] Age <= 22 AND name like[cd] '*X*' match teacher = %@",tmp.m_name);
    }
              
    // [6] 正则表达式
    NSPredicate *predicate6 = [NSPredicate predicateWithFormat:@"m_name matches '^L.*$'"];
    
    NSArray *resultArray6 = [teachers filteredArrayUsingPredicate:predicate6];
    
    for (Teacher *tmp in resultArray6) {
        
        NSLog(@"[6] Name matches '^L.*$' match teacher = %@",tmp.m_name);
    }
    
    // [7] keypath
    NSPredicate *predicate7 = [NSPredicate predicateWithFormat:@"m_info.m_classNum contains '班'"];
    
    NSArray *resultArray7 = [teachers filteredArrayUsingPredicate:predicate7];
    
    for (Teacher *tmp in resultArray7) {
        
        NSLog(@"[7] Info.classNum contains '班' match teacher = %@",tmp.m_name);
    }
}

@end
