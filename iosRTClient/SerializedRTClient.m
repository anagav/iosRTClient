//
//  RTClient.m
//  iosRTClient
//
//  Created by Ashish Nagavaram on 6/7/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

#import "SerializedRTClient.h"
#import "AFNetworking.h"
#import "ParsedRTDataModel.h"

@implementation SerializedRTClient


static NSString * const BaseURLString = @"http://api.rottentomatoes.com/api/public/v1.0/";


- (MovieList *)inTheater :(id) sender
{
    // 1
    NSString *string = [NSString stringWithFormat:@"%@lists/movies/in_theaters.json?apikey=8m35686f5quhtg9yuvg48sjk", BaseURLString];
    
    NSLog(@"trying to hit url=%@",string);
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    __block MovieList *model = NULL;
    
    //AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        NSData *result = [NSJSONSerialization dataWithJSONObject:(NSDictionary*)responseObject
                                                         options:0
                                                           error:&error];
        NSString *result_str =[[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
        
        // 3
        //NSString *result =[NSString stringWithFormat:@"%@", (NSDictionary*)responseObject];
        model = [ParsedRTDataModel fromJson:result_str];
        RTViewController *viewc = (RTViewController *)sender;
        //NSLog(@"data=%@",model.movies);
        viewc.movieList = model;
        [viewc updateTableContents];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        
        
        
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        
        NSString *sampledata =@"{\"movies\":[{\"id\":\"770687943\",\"title\":\"Harry Potter and the Deathly Hallows - Part 2\",\"year\":2011,\"mpaa_rating\":\"PG-13\",\"runtime\":130,\"critics_consensus\":\"Thrilling, powerfully acted, and visually dazzling, Deathly Hallows Part II brings the Harry Potter franchise to a satisfying -- and suitably magical -- conclusion.\",\"release_dates\":{\"theater\":\"2011-07-15\"},\"ratings\":{\"critics_rating\":\"Certified Fresh\",\"critics_score\":97,\"audience_rating\":\"Upright\",\"audience_score\":93},\"synopsis\":\"Harry Potter and the Deathly Hallows - Part 2, is the final adventure in the Harry Potter film series. The much-anticipated motion picture event is the second of two full-length parts. In the epic finale, the battle between the good and evil forces of the wizarding world escalates into an all-out war. The stakes have never been higher and no one is safe. But it is Harry Potter who may be called upon to make the ultimate sacrifice as he draws closer to the climactic showdown with Lord Voldemort. It all ends here. -- (C) Warner Bros\",\"posters\":{\"thumbnail\":\"http://content8.flixster.com/movie/11/15/86/11158674_mob.jpg\",\"profile\":\"http://content8.flixster.com/movie/11/15/86/11158674_pro.jpg\",\"detailed\":\"http://content8.flixster.com/movie/11/15/86/11158674_det.jpg\",\"original\":\"http://content8.flixster.com/movie/11/15/86/11158674_ori.jpg\"},\"abridged_cast\":[{\"name\":\"Daniel Radcliffe\",\"characters\":[\"Harry Potter\"]},{\"name\":\"Rupert Grint\",\"characters\":[\"Ron Weasley\",\"Ron Wesley\"]},{\"name\":\"Emma Watson\",\"characters\":[\"Hermione Granger\"]},{\"name\":\"Helena Bonham Carter\",\"characters\":[\"Bellatrix Lestrange\"]},{\"name\":\"Ralph Fiennes\",\"characters\":[\"Lord Voldemort\"]}],\"alternate_ids\":{\"imdb\":\"1201607\"},\"links\":{\"self\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/770687943.json\",\"alternate\":\"http://www.rottentomatoes.com/m/harry_potter_and_the_deathly_hallows_part_2/\",\"cast\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/770687943/cast.json\",\"clips\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/770687943/clips.json\",\"reviews\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/770687943/reviews.json\",\"similar\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/770687943/similar.json\"}}],\"links\":{\"self\":\"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?limit=1&country=us\",\"alternate\":\"http://www.rottentomatoes.com/movie/box_office.php\"},\"link_template\":\"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?limit={num-results}&country={country-code}\"}";
        ;
        
        model = [ParsedRTDataModel fromJson:sampledata];
        RTViewController *viewc = (RTViewController *)sender;
        NSLog(@"error data=%@",model.movies);
        viewc.movieList = model;
        [viewc updateTableContents];
        
        
    }];
    
    // 5
    [operation start];
    //NSLog(@"json string=%@",model);
    return model;
}







- (MovieList *)jsonTapped :(id) sender
{
    // 1
    NSString *string = [NSString stringWithFormat:@"%@lists/movies/box_office.json?apikey=8m35686f5quhtg9yuvg48sjk", BaseURLString];
    
    NSLog(@"trying to hit url=%@",string);
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    __block MovieList *model = NULL;
    
    //AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    

    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        NSData *result = [NSJSONSerialization dataWithJSONObject:(NSDictionary*)responseObject
                                                           options:0
                                                             error:&error];
        NSString *result_str =[[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
        
        // 3
        //NSString *result =[NSString stringWithFormat:@"%@", (NSDictionary*)responseObject];
        model = [ParsedRTDataModel fromJson:result_str];
        RTViewController *viewc = (RTViewController *)sender;
        //NSLog(@"data=%@",model.movies);
        viewc.movieList = model;
        [viewc updateTableContents];
       
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        
        RTViewController *viewc = (RTViewController *)sender;
        
        [viewc setErrorMessage:[error localizedDescription]];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        
        //NSString *sampledata =@"{\"movies\":[{\"id\":\"770687943\",\"title\":\"Harry Potter and the Deathly Hallows - Part 2\",\"year\":2011,\"mpaa_rating\":\"PG-13\",\"runtime\":130,\"critics_consensus\":\"Thrilling, powerfully acted, and visually dazzling, Deathly Hallows Part II brings the Harry Potter franchise to a satisfying -- and suitably magical -- conclusion.\",\"release_dates\":{\"theater\":\"2011-07-15\"},\"ratings\":{\"critics_rating\":\"Certified Fresh\",\"critics_score\":97,\"audience_rating\":\"Upright\",\"audience_score\":93},\"synopsis\":\"Harry Potter and the Deathly Hallows - Part 2, is the final adventure in the Harry Potter film series. The much-anticipated motion picture event is the second of two full-length parts. In the epic finale, the battle between the good and evil forces of the wizarding world escalates into an all-out war. The stakes have never been higher and no one is safe. But it is Harry Potter who may be called upon to make the ultimate sacrifice as he draws closer to the climactic showdown with Lord Voldemort. It all ends here. -- (C) Warner Bros\",\"posters\":{\"thumbnail\":\"http://content8.flixster.com/movie/11/15/86/11158674_mob.jpg\",\"profile\":\"http://content8.flixster.com/movie/11/15/86/11158674_pro.jpg\",\"detailed\":\"http://content8.flixster.com/movie/11/15/86/11158674_det.jpg\",\"original\":\"http://content8.flixster.com/movie/11/15/86/11158674_ori.jpg\"},\"abridged_cast\":[{\"name\":\"Daniel Radcliffe\",\"characters\":[\"Harry Potter\"]},{\"name\":\"Rupert Grint\",\"characters\":[\"Ron Weasley\",\"Ron Wesley\"]},{\"name\":\"Emma Watson\",\"characters\":[\"Hermione Granger\"]},{\"name\":\"Helena Bonham Carter\",\"characters\":[\"Bellatrix Lestrange\"]},{\"name\":\"Ralph Fiennes\",\"characters\":[\"Lord Voldemort\"]}],\"alternate_ids\":{\"imdb\":\"1201607\"},\"links\":{\"self\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/770687943.json\",\"alternate\":\"http://www.rottentomatoes.com/m/harry_potter_and_the_deathly_hallows_part_2/\",\"cast\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/770687943/cast.json\",\"clips\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/770687943/clips.json\",\"reviews\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/770687943/reviews.json\",\"similar\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/770687943/similar.json\"}}],\"links\":{\"self\":\"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?limit=1&country=us\",\"alternate\":\"http://www.rottentomatoes.com/movie/box_office.php\"},\"link_template\":\"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?limit={num-results}&country={country-code}\"}";
;
        
        //model = [ParsedRTDataModel fromJson:sampledata];
       // RTViewController *viewc = (RTViewController *)sender;
        //NSLog(@"error data=%@",model.movies);
        //viewc.movieList = model;
        //[viewc updateTableContents];
        
        
    }];
    
    // 5
    [operation start];
    //NSLog(@"json string=%@",model);
    return model;
}


@end
