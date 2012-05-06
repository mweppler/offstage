//
//  PodcastDetailsViewController.m
//  Offstage
//
//  Created by matt weppler on 12/3/11.
//  Copyright (c) 2011 matt weppler. All rights reserved.
//

#import "PodcastDetailsViewController.h"

@interface PodcastDetailsViewController ()

@end

@implementation PodcastDetailsViewController

@synthesize currentPodcast;
@synthesize titleLabel;
@synthesize pubDateLabel;
@synthesize descText;

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

    titleLabel.text = currentPodcast.title;
    descText.text = currentPodcast.description;
    pubDateLabel.text = currentPodcast.pubDate;

}

- (void)viewDidUnload
{
    [self setTitleLabel:nil];
    [self setPubDateLabel:nil];
    [self setDescText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
