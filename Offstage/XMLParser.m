//
//  XMLParser.m
//  Offstage
//
//  Created by matt weppler on 11/6/11.
//  Copyright (c) 2011 matt weppler. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser : NSObject

@synthesize currentElementValue, podcast, podcasts;

- (XMLParser *) initXMLParser
{
    self = [super init];
    if (!self)
        return nil;
    return self;
}


- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"channel"]) {
        // Initialize the array.
        self.podcasts = [[NSMutableArray alloc] init];
    } else if ([elementName isEqualToString:@"item"]) {
        // Initialize the item.
        podcast = [[Podcast alloc] init];
        // Extract the attribute here.
//        podcast.title = [[attributeDict objectForKey:@"id"] ];
//        NSLog(@"Reading Title Value: %@", podcast.title);
    }
//    NSLog(@"Processing Element: %@", elementName);
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (!currentElementValue) {
        string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    } else {
        string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [currentElementValue appendString:string];
    }
//    NSLog(@"Processing Value: %@", currentElementValue);
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"channel"])
        return;
    
    // There is nothing to do if we encounter the channel element here.
    // If we encounter the item element however, we want to add the item object to the array
    if ([elementName isEqualToString:@"channel"]) {
//        [podcasts addObject:podcast];
//        podcast = nil;
    } else if ([elementName isEqualToString:@"item"]) {
        [podcasts addObject:podcast];
        podcast = nil;
    } else {
        if ([elementName isEqualToString:@"itunes:subtitle"] ||
            [elementName isEqualToString:@"itunes:summary"] ||
            [elementName isEqualToString:@"itunes:duration"] ||
            [elementName isEqualToString:@"itunes:keywords"] ||
            [elementName isEqualToString:@"itunes:author"] ||
            [elementName isEqualToString:@"itunes:explicit"]) {
            // Ignore these.
        } else {
            [podcast setValue:currentElementValue forKey:elementName];
        }
    }
    currentElementValue = nil;
}

@end