//
//  TutorialOverlay.m
//  testCollectionViewScroll
//
//  Created by Samu András on 3/14/13.
//  Copyright (c) 2013 Quy Sang Le. All rights reserved.
//

#import "TutorialOverlay.h"

NSString * const OverlayNotificationKey	= @"OverlayRemoved";

@implementation TutorialOverlay
@synthesize imageView;
@synthesize button,viewToRemove;
#pragma mark - Static Methods

+ (id)OverlayWithFrame:(CGRect)frame withImageNamed:(NSString *)imageName withUserInteraction:(BOOL)userInteraction
{
    TutorialOverlay *newOverlay = [[TutorialOverlay alloc] initWithFrame:frame
                                                withImageNamed:imageName withUserInteraction:userInteraction];

    return newOverlay;
}

+ (id)addOverlayInView:(UIView *)view withImageNamed:(NSString *)imageName withAnimation:(BOOL)animation withUserInteraction:(BOOL)userInteraction;
{
    TutorialOverlay *newOverlay = [[self class] OverlayWithFrame:view.frame withImageNamed:imageName withUserInteraction:userInteraction];
    [view addSubview:newOverlay];
    if (animation == YES) {
    [newOverlay setAlpha:0];
    [UIView animateWithDuration:0.4
                          delay:0
                        options:UIViewAnimationCurveEaseOut|
     UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [newOverlay setAlpha:1];
                     }
                     completion:nil];
    }
    return newOverlay;
}

+ (NSArray *)OverlaysInView:(UIView *)view;
{
    NSMutableArray *Overlays = [NSMutableArray array];
    for(UIView *subview in view.subviews){
        if([subview isKindOfClass:[self class]]){
            [Overlays addObject:subview];
        }
    }
    return [NSArray arrayWithArray:Overlays];
}

+ (void)removeOverlaysInView:(UIView *)view
{
    NSArray *OverlaysInView = [[self class] OverlaysInView:view];
    for(TutorialOverlay *Overlay in OverlaysInView){
        if([Overlay isKindOfClass:[self class]]){
            [UIView animateWithDuration:0.2
                                  delay:0
                                options:UIViewAnimationCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState
                             animations:^{
                                 [Overlay setAlpha:0];
                             }
                             completion:^(BOOL finished){
                                 [Overlay removeFromSuperview];
                             }];
        }
    }
}


#pragma mark - Init
-(void)removeOverlay{
    [UIView animateWithDuration:0.4
                          delay:0
                        options:UIViewAnimationCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [self setAlpha:0];
                     }
                     completion:^(BOOL finished){
                         [[NSNotificationCenter defaultCenter] postNotificationName:OverlayNotificationKey object:self userInfo:nil];
                         [self removeFromSuperview];
                     }];
}
- (id)initWithFrame:(CGRect)frame withImageNamed:(NSString *)imageName withUserInteraction:(BOOL)userInteraction
{
    if (![UIApplication sharedApplication].statusBarHidden){
        frame.origin.y = frame.origin.y-20;
    }
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setUserInteractionEnabled:userInteraction];
        [self setBackgroundColor:[UIColor clearColor]];
        imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:imageView];
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:frame];
        [button addTarget:self action:@selector(removeOverlay) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}




@end
