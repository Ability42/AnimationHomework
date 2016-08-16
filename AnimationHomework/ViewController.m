//
//  ViewController.m
//  AnimationHomework
//
//  Created by Stepan Paholyk on 5/15/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (strong, nonatomic) UIView* view1;
@property (strong, nonatomic) UIView* view2;
@property (strong, nonatomic) UIView* view3;
@property (strong, nonatomic) UIView* view4;

@property (strong, nonatomic) NSArray* cornerViews;

@property (strong, nonatomic) NSArray* imageNames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
    self.view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.view1];
    
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 100, 100)];
    self.view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.view2];
    
    self.view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 400, 100, 100)];
    self.view3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.view3];
    
    self.view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 500, 100, 100)];
    self.view4.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.view4];
    
    CGFloat sideBarHeight = 20;
    CGRect cornerRecr;
    cornerRecr.size.height = 100;
    cornerRecr.size.width = 100;
    
    UIView *topLeft = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.view.bounds),
                                                            CGRectGetMinY(self.view.bounds) + sideBarHeight,
                                                            CGRectGetWidth(cornerRecr), CGRectGetHeight(cornerRecr))];
    topLeft.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:topLeft];
    
    UIView *topRight = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.bounds) - CGRectGetWidth(cornerRecr),
                                                             CGRectGetMinY(self.view.bounds) + sideBarHeight,
                                                             CGRectGetWidth(cornerRecr), CGRectGetHeight(cornerRecr))];
    topRight.backgroundColor = [UIColor redColor];
    [self.view addSubview:topRight];
    
    UIView *bottomRight = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.bounds) - CGRectGetWidth(cornerRecr),
                                                                CGRectGetMaxY(self.view.bounds) - CGRectGetHeight(cornerRecr),
                                                                CGRectGetWidth(cornerRecr), CGRectGetHeight(cornerRecr))];
    bottomRight.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bottomRight];
    
    UIView *bottomLeft = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.view.bounds),
                                                                CGRectGetMaxY(self.view.bounds) - CGRectGetHeight(cornerRecr),
                                                                CGRectGetWidth(cornerRecr), CGRectGetHeight(cornerRecr))];
    bottomLeft.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bottomLeft];

    /*
    self.cornerViewPoints = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:(self.topLeft.center)],
                                    [NSValue valueWithCGPoint:(self.topRight.center)],
                                    [NSValue valueWithCGPoint:(self.bottomRight.center)],
                                    [NSValue valueWithCGPoint:(self.bottomLeft.center)],
                                    nil];
    
    self.cornerViewColors = [NSArray arrayWithObjects:self.topLeft.backgroundColor, self.topRight.backgroundColor, self.bottomRight.backgroundColor, self.bottomLeft.backgroundColor, nil];
     */
    
    // Add corner view's in array
    
    self.cornerViews = [NSArray arrayWithObjects:topLeft, topRight, bottomRight, bottomLeft, nil];
    
    /* ANIMATED from IMAGES */
    
    self.imageNames = @[@"win_1.png", @"win_2.png", @"win_3.png", @"win_4.png",
                            @"win_5.png", @"win_6.png", @"win_7.png", @"win_8.png",
                            @"win_9.png", @"win_10.png", @"win_11.png", @"win_12.png",
                            @"win_13.png", @"win_14.png", @"win_15.png", @"win_16.png"];
}

- (void) viewDidAppear:(BOOL)animated {
    [self moveView:_view1 withAnimationOption:UIViewAnimationOptionCurveLinear];
    [self moveView:_view2 withAnimationOption:UIViewAnimationOptionCurveEaseIn];
    [self moveView:_view3 withAnimationOption:UIViewAnimationOptionCurveEaseOut];
    [self moveView:_view4 withAnimationOption:UIViewAnimationOptionCurveEaseInOut];
    
    [self moveCornerViews:self.cornerViews withClockwiseDirection:arc4random() % 2];
    
    [self animationFromImages:self.imageNames];

}

- (void) animationFromImages:(NSArray *) arrayOfImages {
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < arrayOfImages.count; i++) {
        [images addObject:[UIImage imageNamed:[arrayOfImages objectAtIndex:i]]];
    }
    
    // Normal Animation
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame)- 43, 700, 86, 193)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.7;
    
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];

}

- (void) moveView:(UIView*)view withAnimationOption:(UIViewAnimationOptions)option {
    [UIView animateWithDuration:3
                          delay:1
                        options:option | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         view.center = CGPointMake(CGRectGetWidth(self.view.frame) - CGRectGetWidth(view.bounds)/2, CGRectGetMidY(view.frame));
                         view.backgroundColor = [self randomColor];
                     } completion:^(BOOL finished) {
                         NSLog(@"Basic animation complete: %d", finished);
                     }];
     
}

// Is it method valid ?

- (void) moveCornerViews:(NSArray *)views withClockwiseDirection:(BOOL) clockwiseDirection  {

        [UIView animateWithDuration:2
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             
                             
                             UIView* firstView = views[0];
                             UIView* lastView = views[[views count] - 1];
                             
                             if (clockwiseDirection) {

                                 CGPoint center = firstView.center;
                                 UIColor *color = firstView.backgroundColor;
                                 
                                 for (int i = 0; i < [views count] - 1; i++) {
                                     UIView* currentView = views[i];
                                     UIView* nextView = views[i+1];
                                     
                                     currentView.center = nextView.center;
                                     currentView.backgroundColor = nextView.backgroundColor;
                                     currentView.transform = CGAffineTransformMakeRotation(M_PI); // ROTATION BAD(
                                     
                                 }
                                 
                                 lastView.center = center;
                                 lastView.backgroundColor = color;
                                 lastView.transform =  CGAffineTransformMakeRotation(-M_PI); // ROTATION BAD(
                                 
                             } else {
                                 
                                 CGPoint center = lastView.center;
                                 UIColor *color = lastView.backgroundColor;
                                 
                                 for (int i = [views count] - 1; i > 0 ; i--) {
                                     UIView* currentView = views[i];
                                     UIView* previousView = views[i-1];
                                     
                                     currentView.center = previousView.center;
                                     currentView.backgroundColor = previousView.backgroundColor;
                                     currentView.transform = CGAffineTransformMakeRotation(M_PI); // ROTATION BAD(
                                 }
                                 
                                 firstView.center = center;
                                 firstView.backgroundColor = color;
                                 firstView.transform = CGAffineTransformMakeRotation(M_PI);
                                 
                             }
                             
                         } completion:^(BOOL finished) {
                             NSLog(@"Corner view's animation is finished with Clockwise direction: %hhd", clockwiseDirection);
                             for (UIView * view in views) {
                                 view.transform = CGAffineTransformIdentity;
                             }
                             [self moveCornerViews:self.cornerViews withClockwiseDirection:arc4random() % 2];
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
