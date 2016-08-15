//
//  ViewController.m
//  CustomAnnotion
//
//  Created by 高盼盼 on 16/8/15.
//  Copyright © 2016年 高盼盼. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotion.h"

@interface ViewController ()<MKMapViewDelegate>

//地图显示类
@property (nonatomic, weak) MKMapView *mapView;

@end

@implementation ViewController

- (MKMapView *)mapView
{
    if (!_mapView)
    {
        MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:mapView];
        
        CLLocationCoordinate2D coordinate2D = {39.9087607478,116.3975780499};
        MKCoordinateSpan span = {.01,.01};
        
        MKCoordinateRegion region = MKCoordinateRegionMake(coordinate2D, span);
        
        //设置范围
        [mapView setRegion:region];
        
        mapView.delegate = self;
        
        _mapView = mapView;
    }
    
    return _mapView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CLLocationCoordinate2D coordinate2D = {39.9087607478,116.3975780499};
    
    //添加标注
    MyAnnotion *annotion = [[MyAnnotion alloc] initWithCoordinate2D:coordinate2D title:@"北京市" subtitle:@"天安门"];
    [self.mapView addAnnotation:annotion];
    
    
    CLLocationCoordinate2D coordinate2D2 = {39.9097607478,116.39875780499};
    MyAnnotion *annotion2 = [[MyAnnotion alloc] initWithCoordinate2D:coordinate2D2 title:@"北京市" subtitle:@"天安门"];
    [self.mapView addAnnotation:annotion2];
    
    
    //计算两个经纬度之间的距离
    
    //保存地理信息
    CLLocation *l1 = [[CLLocation alloc] initWithLatitude:coordinate2D.latitude longitude:coordinate2D.longitude];
    CLLocation *l2 = [[CLLocation alloc] initWithLatitude:coordinate2D2.latitude longitude:coordinate2D2.longitude];
    
    //计算两个经纬度之间的距离(单位是米)
    CLLocationDistance distance = [l1 distanceFromLocation:l2];
    NSLog(@"---%f",distance);
}

#pragma mark - MKMapViewDelegate
/**
 *  添加标注的时候会触发(addAnnotation:)
 *
 *  @param mapView <#mapView description#>
 *  @param views   <#views description#>
 */
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    
    NSLog(@"----%@",views);
}

/**
 *  返回大头针视图
 *
 *  @param mapView    <#mapView description#>
 *  @param annotation <#annotation description#>
 *
 *  @return <#return value description#>
 */
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    
    //1.从复用队列里面通过标示符找可用的标注
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotation"];
    
    
    if (!annotationView)
    {
        //2.如果没有找到，就创建
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
        //显示气泡(三角视图)
        annotationView.canShowCallout = YES;
        
        //修改大头针图片
        annotationView.image = [UIImage imageNamed:@"map 2"];
        
        //添加左视图
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"01d19f55a2fa5532f8758bedacd89b"]];
        imageView.frame = CGRectMake(0, 0, 40, 40);
        
        //设置标注的左视图
        annotationView.leftCalloutAccessoryView = imageView;
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoDark];
        button.frame = CGRectMake(0, 0, 40, 40);
        [button addTarget:self action:@selector(detailInfo) forControlEvents:UIControlEventTouchUpInside];
        //设置标注右视图
        annotationView.rightCalloutAccessoryView = button;
        
    }
    
    return annotationView;
    
}

- (void)detailInfo
{
    NSLog(@"按钮点击了");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
