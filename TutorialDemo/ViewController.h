//
//  ViewController.h
//  TutorialDemo
//
//  Created by Samu András on 3/31/13.
//  Copyright (c) 2013 Samu Andras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>{
    IBOutlet UIScrollView *scrollView;
}
-(IBAction)pressme:(id)sender;
@end
