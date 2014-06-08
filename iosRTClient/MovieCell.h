//
//  MovieTableCellTableViewCell.h
//  iosRTClient
//
//  Created by Ashish Nagavaram on 6/7/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *movTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movSynopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *movImageView;


-(void)setTitle:(NSString*)title;
-(void)setSynopsis:(NSString*)synopsis;


@end
