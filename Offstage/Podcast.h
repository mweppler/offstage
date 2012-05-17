//
//  Podcast.h
//  Offstage
//
//  Created by matt weppler on 11/6/11.
//  Copyright (c) 2011 matt weppler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Podcast : NSObject

@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *enclosure;
@property (nonatomic, strong) NSString *guid;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *pubDate;
@property (nonatomic, strong) NSString *title;

+ (NSString *) scrubHtml: (NSString *)html;

@end
