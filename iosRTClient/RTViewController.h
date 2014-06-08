//
//  RTViewController.h
//  iosRTClient
//
//  Created by Ashish Nagavaram on 6/7/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SerializedRTClient.h"

@interface RTViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
-(void) updateTableContents;
@property (strong,nonatomic) MovieList *movieList;

-(id) initWithName:(NSString *)_type;
-(void)setErrorMessage:(NSString*)errorMessage;

@end
