//
//  ViewController.h
//  touch
//
//  Created by 西林咲音 on 2015/02/25.
//  Copyright (c) 2015年 西林咲音. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIImageView *imageView;
    
    int index;
    UIImageView *stamps[100];
    int stampNum;
    
    BOOL traceMode;
    float tranceNumber;
    
    IBOutlet UIImageView *stampBaseView;
}

-(IBAction)clear;
-(IBAction)back;
-(IBAction)kaiten;
-(IBAction)kaitenkaijo;
@end

