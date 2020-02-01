//
//  ViewController.m
//  BulleEye
//
//  Created by admin on 2020/1/18.
//  Copyright © 2020 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int currentValue;
    int targetValue;
    int score;
    int round;
}
@end

@implementation ViewController

@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;
@synthesize roundLabel;

- (void)startNewRound {
    //  回合数
    round += 1;
    currentValue = 50;
    self.slider.value = currentValue;
    targetValue = 1 + (arc4random() % 100);
}

- (void)updateLabels{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",round];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)showAlert{
    //  差距
    int difference = abs(currentValue - targetValue);
    //  得分
    int points = 100 - difference;
    //  计算总分
    score += points;
    //  提示文本
    NSString *message;
    if (currentValue == targetValue) message = @"恭喜你猜中了！";
    else message = [NSString stringWithFormat:@"你的得分为%d",points];
    //初始化提示框；
      UIAlertController *alert = [UIAlertController
                                  alertControllerWithTitle:@"提示"
                                  message:message
                                  preferredStyle:  UIAlertControllerStyleAlert];
     
      [alert addAction:[UIAlertAction
                        actionWithTitle:@"确定"
                        style:UIAlertActionStyleDefault
                        handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
      }]];
     
      //弹出提示框；
      [self presentViewController:alert animated:true completion:nil];
    
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)sliderMoved:(id)sender {
    UISlider *slider = (UISlider*)sender;
    currentValue = (int)lroundf(slider.value);
//    NSLog(@"滑动条的当前数值是：%d",currentValue);
}
@end
