//
//  WebScheduleViewController.m
//  Offstage
//
//  Created by matthew weppler on 5/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebScheduleViewController.h"

@interface WebScheduleViewController ()

@end

@implementation WebScheduleViewController
@synthesize webSchedule;

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
    
    [webSchedule loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.christianpolanco.com/?page_id=26"]]];
    
}

- (void)viewDidUnload
{
    [self setWebSchedule:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
