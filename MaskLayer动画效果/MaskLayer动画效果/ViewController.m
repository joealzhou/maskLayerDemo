//
//  ViewController.m
//  MaskLayer动画效果
//
//  Created by 周强 on 16/3/21.
//  Copyright © 2016年 周强. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()
@property(nonatomic,strong)UIImageView *img;
@property(nonatomic,strong)UIImageView *imgRabbit;
@property(nonatomic,strong)UIBezierPath *orignPath;
@property(nonatomic,strong)UIBezierPath *finalPath;
@property(nonatomic,strong)CAShapeLayer *maskLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.hidden=YES;
    
    
    _img=[[UIImageView alloc]initWithFrame:self.view.bounds];
    _img.image=[UIImage imageNamed:@"fox.png"];
    [self.view addSubview:_img];
    
    
    
    _imgRabbit=[[UIImageView alloc]initWithFrame:self.view.bounds];
    _imgRabbit.image=[UIImage imageNamed:@"rabbit.png"];
    [self.view addSubview:_imgRabbit];
    
   
   
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(336, 20, 44, 44)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _orignPath=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 0, 0)];
    
    CGPoint tmpPoint=CGPointMake(375, 667);
    
    CGFloat radius=sqrtf(tmpPoint.x*tmpPoint.x+tmpPoint.y*tmpPoint.y);
    
    _finalPath=[UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(0, 0, 100, 100), -radius, -radius)];
    
    
    _maskLayer = [CAShapeLayer layer];
    _maskLayer.path = _orignPath.CGPath;
    _imgRabbit.layer.mask = _maskLayer;
    
    
}
-(void)btnAction
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id _Nullable)(_orignPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(_finalPath.CGPath);
    animation.duration = 3;
    animation.delegate = self;
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [_maskLayer addAnimation:animation forKey:@"path"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
