//
//  AboutViewController.m
//  Offstage
//
//  Created by matt weppler on 12/2/11.
//  Copyright (c) 2011 matt weppler. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController
@synthesize cpAvatar;

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
    UIImage *image = [UIImage imageNamed:@"avatar_new.jpg"];
    [self.cpAvatar setImage:image];
}

- (void)viewDidUnload
{
    [self setCpAvatar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)offstageLink:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://offstagepod.com"]];
}

@end
