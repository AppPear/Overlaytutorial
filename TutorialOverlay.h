//
//  TutorialOverlay.h
//  testCollectionViewScroll
//
//  Created by Samu András on 3/14/13.
//  Copyright (c) 2013 Quy Sang Le. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString * const OverlayNotificationKey;

@interface TutorialOverlay : UIView
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIView *viewToRemove;

+ (id)addOverlayInView:(UIView *)view withImageNamed:(NSString *)imageName withAnimation:(BOOL)animation withUserInteraction:(BOOL)userInteraction;

+ (NSArray *)OverlaysInView:(UIView *)view;

- (NSArray *)OverlaysInView:(UIView *)view;

+ (void)removeOverlaysInView:(UIView *)view;

+ (id)OverlayWithFrame:(CGRect)frame withImageNamed:(NSString *)imageName withUserInteraction:(BOOL)userInteraction;;
-(void) initView:(UIView *)view;


- (id)initWithFrame:(CGRect)frame withImageNamed:(NSString *)imageName withUserInteraction:(BOOL)userInteraction;
@end
