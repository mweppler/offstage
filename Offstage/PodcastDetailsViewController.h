//
//  PodcastDetailsViewController.h
//  Offstage
//
//  Created by matt weppler on 12/3/11.
//  Copyright (c) 2011 matt weppler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Podcast.h"

@interface PodcastDetailsViewController : UIViewController

@property (nonatomic, strong) Podcast *currentPodcast;
@property (weak, nonatomic) IBOutlet UITextView *descText;
@property (weak, nonatomic) IBOutlet UILabel *pubDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
