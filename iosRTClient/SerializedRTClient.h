//
//  RTClient.h
//  iosRTClient
//
//  Created by Ashish Nagavaram on 6/7/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "MovieList.h"
#import "RTViewController.h"


@interface SerializedRTClient : NSObject
- (MovieList *)jsonTapped:(id)sender;
- (MovieList *)inTheater:(id)sender;

@end
