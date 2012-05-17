//
//  PodcastDetailsViewController.m
//  Offstage
//
//  Created by matt weppler on 12/3/11.
//  Copyright (c) 2011 matt weppler. All rights reserved.
//

#import "PodcastDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <Twitter/Twitter.h>

@interface PodcastDetailsViewController ()

@end

@implementation PodcastDetailsViewController

@synthesize currentPodcast, descText, mediaPlayer, playButton, playerView, podCastTitleLabel, pubDateLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
     
    [self setTitle:currentPodcast.title];
    
    podCastTitleLabel.text = currentPodcast.title;
    podCastTitleLabel.layer.cornerRadius = 2;

    descText.text = [Podcast scrubHtml:currentPodcast.description];
    descText.layer.cornerRadius = 10;
    
    pubDateLabel.text = currentPodcast.pubDate;
    pubDateLabel.layer.cornerRadius = 2;
    

    mediaPlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:currentPodcast.link]];
    [mediaPlayer setControlStyle:MPMovieControlStyleEmbedded];
    [mediaPlayer setScalingMode:MPMovieScalingModeAspectFill];
    [mediaPlayer setFullscreen:FALSE];
    mediaPlayer.view.frame = self.playerView.bounds; // CGRectMake(0, 340, 320, 20);
    mediaPlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;  	
    [self.playerView addSubview:mediaPlayer.view];

    mediaPlayer.movieSourceType = MPMovieSourceTypeStreaming;

    //    [[NSNotificationCenter defaultCenter]
    //     addObserver:self
    //     selector:@selector(movieFinishedCallback:)
    //     name:MPMoviePlayerPlaybackDidFinishNotification
    //     object:mediaPlayer];
    
//    mediaPlayer.initialPlaybackTime = 0;
//    NSLog(@"duration: %@", mediaPlayer.duration);
//    mediaPlayer.currentPlaybackTime = 0; // crashes the simulator
//    [mediaPlayer prepareToPlay]; // Preloads the buffer and prepares the audio for playing. // crashes the simulator

}

- (void)viewDidUnload
{
    [self setDescText:nil];
    [self setPlayButton:nil];
    [self setPlayerView:nil];
    [self setPodCastTitleLabel:nil];
    [self setPubDateLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)tweetTouched:(id)sender {
    if ([TWTweetComposeViewController canSendTweet])
    {
        NSString *theTweet = [NSString stringWithFormat:@"%@\n #OffstagePod \n #chrispolanco", currentPodcast.title];
        TWTweetComposeViewController *tweetSheet = 
        [[TWTweetComposeViewController alloc] init];
        [tweetSheet setInitialText:theTweet];
	    [self presentModalViewController:tweetSheet animated:YES];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] 
                                  initWithTitle:@"Sorry"                                                             
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"                                                         
                                  delegate:self                                              
                                  cancelButtonTitle:@"OK"                                                   
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (IBAction)play:(id)sender
{
    if ([mediaPlayer playbackState] == MPMusicPlaybackStatePlaying) {
        [playButton setTitle:@"play" forState:UIControlStateNormal];
        [mediaPlayer pause];
    } else {
        [playButton setTitle:@"pause" forState:UIControlStateNormal];
        [mediaPlayer play];
    }
}

@end
