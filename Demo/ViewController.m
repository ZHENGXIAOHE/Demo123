//
//  ViewController.m
//  Demo
//
//  Created by UNISK on 15/10/13.
//  Copyright © 2015年 ZYQ. All rights reserved.
//

#import "ViewController.h"

#define AppLanguage @"appLanguage"

#define CustomLocalizedString(key, comment) \
[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //显示文字
    UILabel *textlable = [[UILabel alloc]initWithFrame:CGRectMake(20, 84, CGRectGetWidth(self.view.frame)-40, 30)];
    textlable.tag = 101;
    textlable.backgroundColor = [UIColor lightGrayColor];
    textlable.textAlignment = NSTextAlignmentCenter;
    textlable.text= CustomLocalizedString(@"lan_text_title", nil);//@"中文";
    [self.view addSubview:textlable];
    
    //切换按钮
    UIButton *switchbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    switchbtn.frame = CGRectMake(20, CGRectGetMaxY(textlable.frame)+20, CGRectGetWidth(textlable.frame), 44);
    switchbtn.layer.cornerRadius = 5;
    switchbtn.clipsToBounds = YES;
    switchbtn.layer.borderWidth = 1.0f;
    switchbtn.layer.borderColor = [UIColor redColor].CGColor;
    switchbtn.backgroundColor = [UIColor grayColor];
    [switchbtn setTitle:CustomLocalizedString(@"lan_button_click", nil) forState:UIControlStateNormal];//点我
    [switchbtn addTarget:self action:@selector(switchbtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:switchbtn];

}

//button事件
- (void)switchbtnPressed:(UIButton *)button
{
    NSString *currentLanguage = [[NSUserDefaults standardUserDefaults]objectForKey:AppLanguage];
    if ([currentLanguage isEqualToString: @"en"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:AppLanguage];
    }else
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:AppLanguage];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [button setTitle:CustomLocalizedString(@"lan_button_click", nil) forState:UIControlStateNormal];//点我
    [(UILabel *)[self.view viewWithTag:101] setText:CustomLocalizedString(@"lan_text_title", nil)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
