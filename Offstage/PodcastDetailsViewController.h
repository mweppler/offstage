//
//  PodcastDetailsViewController.h
//  Offstage
//
//  Created by matt weppler on 12/3/11.
//  Copyright (c) 2011 matt weppler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Podcast.h"
#import <MediaPlayer/MediaPlayer.h>

@interface PodcastDetailsViewController : UIViewController

@property (strong, nonatomic) Podcast *currentPodcast;
@property (weak,   nonatomic) IBOutlet UITextView *descText;
@property (strong, nonatomic) MPMoviePlayerController *mediaPlayer;
@property (weak,   nonatomic) IBOutlet UIButton *playButton;
@property (weak,   nonatomic) IBOutlet UIView *playerView;
@property (weak,   nonatomic) IBOutlet UILabel *podCastTitleLabel;
@property (weak,   nonatomic) IBOutlet UILabel *pubDateLabel;

- (IBAction)tweetTouched:(id)sender;

- (IBAction)play:(id)sender;

@end
