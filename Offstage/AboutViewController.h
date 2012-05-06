//
//  AboutViewController.h
//  Offstage
//
//  Created by matt weppler on 12/2/11.
//  Copyright (c) 2011 matt weppler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *cpAvatar;

- (IBAction)offstageLink:(id)sender;

@end
