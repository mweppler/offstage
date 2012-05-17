//
//  PodcastsTableViewController.m
//  Offstage
//
//  Created by matt weppler on 12/2/11.
//  Copyright (c) 2011 matt weppler. All rights reserved.
//

#import "PodcastsTableViewController.h"
#import <SystemConfiguration/SystemConfiguration.h>

@interface PodcastsTableViewController ()

@end

@implementation PodcastsTableViewController

NSMutableArray *podcasts;

- (BOOL) canConnectToTheSite {
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithName(NULL, [@"christianpolanco.com" UTF8String]);
    SCNetworkReachabilityFlags flags;
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags( defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    if (!didRetrieveFlags) {
        printf("Could not recover network flags\n");
        return NO;
    }
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection) ? YES : NO;
}

- (void) showAlert: (NSString *) theMessage withTitle: (NSString *) theTitle {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:theTitle 
                                                 message:theMessage
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowPodcast"]) {
        PodcastDetailsViewController *podcastDetailsViewController = [segue destinationViewController];
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        Podcast *currentPodcast = [podcasts objectAtIndex:[path row]];
        [podcastDetailsViewController setCurrentPodcast:currentPodcast];
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (![self canConnectToTheSite]) {
        [self showAlert:@"This application requires network connectivity. Interaction will be limited." withTitle:@"Network Connectivity"];
        return;
    }
    
    // TODO: parse xml file for data...
    NSURL *url = [[NSURL alloc] initWithString:@"http://christianpolanco.com/podcast/xml/offstagepod.xml"];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    XMLParser *parser = [[XMLParser alloc] initXMLParser];
    [xmlParser setDelegate:parser];
    BOOL success = [xmlParser parse];
    if (success)
        NSLog(@"No Errors.");
    else
        NSLog(@"Error Loading XML File!");

//    podcasts = [[NSMutableArray alloc] init];
    podcasts = parser.podcasts;

//    NSLog(@"Podcasts from parser: %@", parser.podcasts);
//    NSLog(@"Podcasts local: %@", podcasts);

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [podcasts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PodcastCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    Podcast *podcast = [podcasts objectAtIndex:indexPath.row];
    cell.textLabel.text = podcast.title;
    cell.detailTextLabel.text = [Podcast scrubHtml:podcast.description];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
