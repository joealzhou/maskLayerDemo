//
//  SecondViewController.m
//  MaskLayer动画效果
//
//  Created by 周强 on 16/3/21.
//  Copyright © 2016年 周强. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property(nonatomic,strong)UIImageView *img;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _img=[[UIImageView alloc]initWithFrame:self.view.bounds];
    _img.image=[UIImage imageNamed:@"rabbit.png"];
    
    [self.view addSubview:_img];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(336, 20, 44, 44)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)btnAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
