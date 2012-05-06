//
//  XMLParser.h
//  Offstage
//
//  Created by matt weppler on 11/6/11.
//  Copyright (c) 2011 matt weppler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Podcast.h"

@interface XMLParser : NSObject

@property (nonatomic, strong) NSMutableString *currentElementValue;
@property (nonatomic, strong) Podcast *podcast;
@property (nonatomic, strong) NSMutableArray *podcasts;

- (XMLParser *) initXMLParser;

@end