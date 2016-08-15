//
//  MyAnnotion.h
//  CustomAnnotion
//
//  Created by 高盼盼 on 16/8/15.
//  Copyright © 2016年 高盼盼. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotion : NSObject<MKAnnotation>

- (instancetype)initWithCoordinate2D:(CLLocationCoordinate2D)coordinate2D title:(NSString *)title subtitle:(NSString *)subtitle;

@end
