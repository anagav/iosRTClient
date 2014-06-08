//
//  MovieList.h
//  iosRTClient
//
//  Created by Ashish Nagavaram on 6/7/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol MovieModel
@end

@protocol PosterModel
@end

@protocol MovieList
@end

@interface PosterModel : JSONModel
@property (strong, nonatomic) NSString* thumbnail;
@property (strong, nonatomic) NSString* profile;
@property (strong, nonatomic) NSString* detailed;
@property (strong, nonatomic) NSString* original;
@end

@interface MovieModel : JSONModel
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* synopsis;
@property (strong, nonatomic) PosterModel* posters;
@end



@interface MovieList : JSONModel
@property (strong, nonatomic) NSArray<MovieModel>* movies;
@end


