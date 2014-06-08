//
//  RTDataModel.h
//  iosRTClient
//
//  Created by Ashish Nagavaram on 6/7/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MovieList.h"



//@interface MovieList : JSONModel
//@property (strong, nonatomic) NSArray<MovieModel>* movies;
//@end




@interface ParsedRTDataModel : JSONModel
    +(MovieList*) fromJson:(NSString *)_json;
@end
