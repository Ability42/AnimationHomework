//
//  ViewController.m
//  AnimationHomework
//
//  Created by Stepan Paholyk on 5/15/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 100, 100)];
    view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
    view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view2];
    
    UIView* view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 350, 100, 100)];
    view3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view3];
    
    UIView* view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 500, 100, 100)];
    view4.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view4];
    
    [self moveView:view1 withAnimationOption:UIViewAnimationOptionCurveLinear];
    [self moveView:view2 withAnimationOption:UIViewAnimationOptionCurveEaseIn];
    [self moveView:view3 withAnimationOption:UIViewAnimationOptionCurveEaseOut];
    [self moveView:view4 withAnimationOption:UIViewAnimationOptionCurveEaseOut];
    


}

- (void) moveView:(UIView*)view withAnimationOption:(UIViewAnimationOptions)option {

    [UIView animateWithDuration:5
                          delay:2
                        options:option | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         [view setBackgroundColor:[self randomColor]];
                         
                         CGAffineTransform moveViewRight = CGAffineTransformMakeTranslation(CGRectGetWidth(self.view.frame) - CGRectGetWidth(view.frame), 0);
                         //CGAffineTransform scaleView = CGAffineTransformMakeScale(1.f, 1.f);
                         //GAffineTransform combiteTransform = CGAffineTransformConcat(moveViewRight, scaleView);
                         view.transform = moveViewRight;
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
    
}

- (UIColor*) randomColor {
    CGFloat r = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
