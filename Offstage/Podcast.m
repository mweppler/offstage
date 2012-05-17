//
//  Podcast.m
//  Offstage
//
//  Created by matt weppler on 11/6/11.
//  Copyright (c) 2011 matt weppler. All rights reserved.
//

#import "Podcast.h"

@implementation Podcast

@synthesize description, enclosure, guid, link, pubDate, title;

+ (NSString *) scrubHtml: (NSString *)html {
    return [self replaceBrTagWithNewLine:html];
}

+ (NSString *) replaceBrTagWithNewLine: (NSString *)html {
    html = [html stringByReplacingOccurrencesOfString:@"<br />"
                                           withString:@"\n"];
    html = [html stringByReplacingOccurrencesOfString:@"<br >"
                                           withString:@"\n"];
    html = [html stringByReplacingOccurrencesOfString:@"<br/>"
                                           withString:@"\n"];
    html = [html stringByReplacingOccurrencesOfString:@"<br>"
                                           withString:@"\n"];
    return html;
}

+ (NSMutableString *) makeTwitterLinkable: (NSMutableString *)html {
    
}

@end
