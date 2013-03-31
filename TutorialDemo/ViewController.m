//
//  ViewController.m
//  TutorialDemo
//
//  Created by Samu András on 3/31/13.
//  Copyright (c) 2013 Samu Andras. All rights reserved.
//

#import "ViewController.h"
#import "TutorialOverlay.h"

@implementation ViewController

- (void)viewDidLoad
{
    [TutorialOverlay addOverlayInView:self.view withImageNamed:@"tut1.png" withAnimation:YES withUserInteraction:NO];
    [scrollView setContentSize:CGSizeMake(480, 128)];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)ascrollView{
    if (ascrollView.contentOffset.x > 0) {
        [TutorialOverlay removeOverlaysInView:self.view];
    }
}
-(IBAction)pressme:(id)sender{
    [TutorialOverlay addOverlayInView:self.view withImageNamed:@"tut2.png" withAnimation:YES withUserInteraction:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
