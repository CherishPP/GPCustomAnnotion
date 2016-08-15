//
//  MyAnnotion.m
//  CustomAnnotion
//
//  Created by 高盼盼 on 16/8/15.
//  Copyright © 2016年 高盼盼. All rights reserved.
//

#import "MyAnnotion.h"

@interface MyAnnotion ()
{
    CLLocationCoordinate2D _coordinate2D;
    NSString *_title;
    NSString *_subtitle;
}

@end


@implementation MyAnnotion

- (instancetype)initWithCoordinate2D:(CLLocationCoordinate2D)coordinate2D title:(NSString *)title subtitle:(NSString *)subtitle{
    if (self = [super init])
    {
        _coordinate2D = coordinate2D;
        _title = title;
        _subtitle = subtitle;
    }
    
    return self;
}

#pragma mark - MKAnnotation
/**
 *  重写协议里面coordinate方法
 *
 *  @return <#return value description#>
 */
- (CLLocationCoordinate2D)coordinate
{
    return _coordinate2D;
}

- (NSString *)title
{
    return _title;
}

- (NSString *)subtitle
{
    return _subtitle;
}

@end
