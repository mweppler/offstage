//
//  AboutViewController.m
//  Offstage
//
//  Created by matt weppler on 12/2/11.
//  Copyright (c) 2011 matt weppler. All rights reserved.
//

#import "AboutViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AboutViewController ()

@end

@implementation AboutViewController
@synthesize cpAvatar, descLabel;

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
    
    [cpAvatar.layer setCornerRadius: 10.0f];
    [cpAvatar.layer setMasksToBounds:YES];
    [cpAvatar.layer setBorderColor:  [UIColor lightGrayColor].CGColor];
    [cpAvatar.layer setBorderWidth:  1.0f];
    
    UIView *shadowView = [[UIView alloc] init];
    shadowView.layer.cornerRadius  = 8.0;
    shadowView.layer.shadowColor   = [[UIColor blackColor] CGColor];
    shadowView.layer.shadowOffset  = CGSizeMake(1.0f, 5.0f);
    shadowView.layer.shadowOpacity = 0.8f;
    shadowView.layer.shadowRadius  = 3.0f;
    [shadowView addSubview:self.cpAvatar];
    
    [self.view addSubview:shadowView];
    
    UIImage *image = [UIImage imageNamed:@"avatar_new.jpg"];
    [cpAvatar setImage:image];
    
    
    descLabel.layer.cornerRadius = 10;
}

- (void)viewDidUnload
{
    [self setCpAvatar:nil];
    [self setDescLabel:nil];
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
