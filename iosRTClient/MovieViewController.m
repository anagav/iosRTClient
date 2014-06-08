//
//  MovieViewController.m
//  iosRTClient
//
//  Created by Ashish Nagavaram on 6/8/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

#import "MovieViewController.h"
#import "UIImageView+AFNetworking.h"


@interface MovieViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *movFullImageView;
@property (weak, nonatomic) IBOutlet UILabel *movFullsynopsisView;


@end

@implementation MovieViewController{
    NSString *content;
    NSString *imageurl;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id) initWithName:(NSString *)synopsis :(NSString*)imageUrl{
    self = [super init];
    if (self){
        content = synopsis;
        imageurl = imageUrl;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.movFullsynopsisView.text = content;
    self.movFullsynopsisView.textColor = [UIColor whiteColor];
    
    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:imageurl]];
    
    UIActivityIndicatorView *loadingIndicator =[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [_movFullImageView setImageWithURLRequest :imageRequest placeholderImage:nil success:^(NSURLRequest *request,NSHTTPURLResponse *response,UIImage *image){
        [loadingIndicator setHidden:YES];
        [loadingIndicator stopAnimating];
        _movFullImageView.image = image;
    }failure:^(NSURLRequest *request,NSHTTPURLResponse *response, NSError *error){
        [loadingIndicator setHidden:YES];
        [loadingIndicator stopAnimating];
    }];
    


    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
