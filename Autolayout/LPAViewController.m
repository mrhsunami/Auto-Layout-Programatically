//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                   options:NSLayoutFormatAlignAllCenterY
                                                                    metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:500.0];
    self.framingViewWidthConstraint.active = YES;

    
    
    //Purple Box
    UIView *purpleBox = [[UIView alloc]initWithFrame:CGRectZero];
    purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBox.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleBox];
    
    NSLayoutConstraint *purpleBoxRightMargin = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                            attribute:NSLayoutAttributeRightMargin
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:framingView
                                                                            attribute:NSLayoutAttributeRightMargin
                                                                           multiplier:1
                                                                             constant:-20];
    purpleBoxRightMargin.active = YES;
    
    NSLayoutConstraint *purpleBoxBottomMargin = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                             attribute:NSLayoutAttributeBottomMargin
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:framingView
                                                                             attribute:NSLayoutAttributeBottomMargin
                                                                            multiplier:1
                                                                              constant:-20];
    purpleBoxBottomMargin.active = YES;
    
    NSLayoutConstraint *purpleBoxWidth = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                      attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:framingView
                                                                      attribute:NSLayoutAttributeWidth
                                                                     multiplier:0.61
                                                                       constant:1];
    purpleBoxWidth.active = YES;
    
    NSLayoutConstraint *purpleBoxHeight =  [NSLayoutConstraint constraintWithItem:purpleBox
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier:1
                                                                              constant:50];
    purpleBoxHeight.active = YES;
    
    
    
    
    
    
    
    // Red Box
    UIView *redBox = [[UIView alloc]initWithFrame:CGRectZero];
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    redBox.backgroundColor = [UIColor redColor];
    [self.framingView addSubview:redBox];
    
    
    NSLayoutConstraint *redBoxRightMargin = [NSLayoutConstraint constraintWithItem:redBox
                                                                                 attribute:NSLayoutAttributeRightMargin
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:framingView
                                                                                 attribute:NSLayoutAttributeRightMargin
                                                                                multiplier:1
                                                                                  constant:-20];
    redBoxRightMargin.active = YES;
    
    NSLayoutConstraint *redBoxTopMargin = [NSLayoutConstraint constraintWithItem:redBox
                                                                               attribute:NSLayoutAttributeTopMargin
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:framingView
                                                                               attribute:NSLayoutAttributeTopMargin
                                                                              multiplier:1
                                                                                constant:20];
    redBoxTopMargin.active = YES;
    
    NSLayoutConstraint *redBoxWidth = [NSLayoutConstraint constraintWithItem:redBox
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1
                                                                            constant:150];
    redBoxWidth.active = YES;
    
    NSLayoutConstraint *redBoxHeight =  [NSLayoutConstraint constraintWithItem:redBox
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier:1
                                                                              constant:50];
    redBoxHeight.active = YES;
    
    
    
    
    // Orange Boxes
    UIView *orangeBoxSmall = [[UIView alloc]initWithFrame:CGRectZero];
    orangeBoxSmall.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBoxSmall.backgroundColor = [UIColor orangeColor];
    [self.framingView addSubview:orangeBoxSmall];
    
    
    NSLayoutConstraint *orangeBoxSmallCenterY = [NSLayoutConstraint constraintWithItem:orangeBoxSmall
                                                                            attribute:NSLayoutAttributeCenterY
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:redBox
                                                                            attribute:NSLayoutAttributeCenterY
                                                                           multiplier:1
                                                                             constant:1];
    orangeBoxSmallCenterY.active = YES;
    
    NSLayoutConstraint *orangeBoxSmallRightMargin = [NSLayoutConstraint constraintWithItem:orangeBoxSmall
                                                                             attribute:NSLayoutAttributeRightMargin
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:redBox
                                                                             attribute:NSLayoutAttributeRightMargin
                                                                            multiplier:1
                                                                              constant:-10];
    orangeBoxSmallRightMargin.active = YES;

    NSLayoutConstraint *orangeBoxSmallWidth = [NSLayoutConstraint constraintWithItem:orangeBoxSmall
                                                                      attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:nil
                                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                                     multiplier:1
                                                                       constant:50];
    orangeBoxSmallWidth.active = YES;
    
    NSLayoutConstraint *orangeBoxSmallHeight =  [NSLayoutConstraint constraintWithItem:orangeBoxSmall
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1
                                                                         constant:30];
    orangeBoxSmallHeight.active = YES;
    
    
    UIView *orangeBoxLarge = [[UIView alloc]initWithFrame:CGRectZero];
    orangeBoxLarge.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBoxLarge.backgroundColor = [UIColor orangeColor];
    [self.framingView addSubview:orangeBoxLarge];
    
    NSLayoutConstraint *orangeBoxLargeCenterY = [NSLayoutConstraint constraintWithItem:orangeBoxLarge
                                                                             attribute:NSLayoutAttributeCenterY
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:redBox
                                                                             attribute:NSLayoutAttributeCenterY
                                                                            multiplier:1
                                                                              constant:1];
    orangeBoxLargeCenterY.active = YES;
    
    NSLayoutConstraint *orangeBoxLargeRightMargin = [NSLayoutConstraint constraintWithItem:orangeBoxLarge
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:orangeBoxSmall
                                                                                 attribute:NSLayoutAttributeLeft
                                                                                multiplier:1
                                                                                  constant:-10];
    orangeBoxLargeRightMargin.active = YES;
//
//    NSLayoutConstraint *orangeBoxLargeTopMargin = [NSLayoutConstraint constraintWithItem:orangeBoxLarge
//                                                                               attribute:NSLayoutAttributeTopMargin
//                                                                               relatedBy:NSLayoutRelationEqual
//                                                                                  toItem:framingView
//                                                                               attribute:NSLayoutAttributeTopMargin
//                                                                              multiplier:1
//                                                                                constant:20];
//    orangeBoxLargeTopMargin.active = YES;
    
    NSLayoutConstraint *orangeBoxLargeWidth = [NSLayoutConstraint constraintWithItem:orangeBoxLarge
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1
                                                                            constant:70];
    orangeBoxLargeWidth.active = YES;
    
    NSLayoutConstraint *orangeBoxLargeHeight =  [NSLayoutConstraint constraintWithItem:orangeBoxLarge
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier:1
                                                                              constant:30];
    orangeBoxLargeHeight.active = YES;
 
    
    
    
    
    //Blue Boxes
    
    UIView *blueBox1 = [[UIView alloc]initWithFrame:CGRectZero];
    blueBox1.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox1.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBox1];
    
    NSLayoutConstraint *blueBox1CenterX = [NSLayoutConstraint constraintWithItem:blueBox1
                                                                             attribute:NSLayoutAttributeCenterX
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:framingView
                                                                             attribute:NSLayoutAttributeCenterX
                                                                            multiplier:1
                                                                              constant:1];
    blueBox1CenterX.active = YES;
    
//    NSLayoutConstraint *orangeBoxLargeRightMargin = [NSLayoutConstraint constraintWithItem:orangeBoxLarge
//                                                                                 attribute:NSLayoutAttributeRight
//                                                                                 relatedBy:NSLayoutRelationEqual
//                                                                                    toItem:orangeBoxSmall
//                                                                                 attribute:NSLayoutAttributeLeft
//                                                                                multiplier:1
//                                                                                  constant:-10];
//    orangeBoxLargeRightMargin.active = YES;
    //
    NSLayoutConstraint *blueBox1CenterY  = [NSLayoutConstraint constraintWithItem:blueBox1
                                                                               attribute:NSLayoutAttributeCenterY
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:framingView
                                                                               attribute:NSLayoutAttributeCenterY
                                                                              multiplier:1
                                                                                constant:1];
    blueBox1CenterY.active = YES;
    
    NSLayoutConstraint *blueBox1Width = [NSLayoutConstraint constraintWithItem:blueBox1
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1
                                                                            constant:50];
    blueBox1Width.active = YES;

    NSLayoutConstraint *blueBox1Height =  [NSLayoutConstraint constraintWithItem:blueBox1
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier:1
                                                                              constant:50];
    blueBox1Height.active = YES;
    
    
    
    
    
    
    
    
    
    
    UIView *blueBox2 = [[UIView alloc]initWithFrame:CGRectZero];
    blueBox2.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox2.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBox2];
    
    NSLayoutConstraint *blueBox2CenterX = [NSLayoutConstraint constraintWithItem:blueBox2
                                                                       attribute:NSLayoutAttributeCenterX
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:framingView
                                                                       attribute:NSLayoutAttributeCenterX
                                                                      multiplier:1
                                                                        constant:1];
    blueBox2CenterX.active = YES;
    
    
    NSLayoutConstraint *blueBox2CenterY  = [NSLayoutConstraint constraintWithItem:blueBox2
                                                                        attribute:NSLayoutAttributeCenterY
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:framingView
                                                                        attribute:NSLayoutAttributeCenterY
                                                                       multiplier:1.5
                                                                         constant:1];
    blueBox2CenterY.active = YES;
    
    NSLayoutConstraint *blueBox2Width = [NSLayoutConstraint constraintWithItem:blueBox2
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1
                                                                      constant:50];
    blueBox2Width.active = YES;
    
    NSLayoutConstraint *blueBox2Height =  [NSLayoutConstraint constraintWithItem:blueBox2
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1
                                                                        constant:50];
    blueBox2Height.active = YES;
    
    
    
    
    
    
    
    
    UIView *blueBox3 = [[UIView alloc]initWithFrame:CGRectZero];
    blueBox3.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox3.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBox3];
    
    NSLayoutConstraint *blueBox3CenterX = [NSLayoutConstraint constraintWithItem:blueBox3
                                                                       attribute:NSLayoutAttributeCenterX
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:framingView
                                                                       attribute:NSLayoutAttributeCenterX
                                                                      multiplier:1
                                                                        constant:1];
    blueBox3CenterX.active = YES;
    
    
    NSLayoutConstraint *blueBox3CenterY  = [NSLayoutConstraint constraintWithItem:blueBox3
                                                                        attribute:NSLayoutAttributeCenterY
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:framingView
                                                                        attribute:NSLayoutAttributeCenterY
                                                                       multiplier:0.5
                                                                         constant:1];
    blueBox3CenterY.active = YES;
    
    NSLayoutConstraint *blueBox3Width = [NSLayoutConstraint constraintWithItem:blueBox3
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1
                                                                      constant:50];
    blueBox3Width.active = YES;
    
    NSLayoutConstraint *blueBox3Height =  [NSLayoutConstraint constraintWithItem:blueBox3
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1
                                                                        constant:50];
    blueBox3Height.active = YES;
    
    
    
    
    
    
    
    
    
    
    
    
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
