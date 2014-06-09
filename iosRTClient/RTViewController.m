//
//  RTViewController.m
//  iosRTClient
//
//  Created by Ashish Nagavaram on 6/7/14.
//  Copyright (c) 2014 personal. All rights reserved.
//

#import "RTViewController.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"
#import "MovieViewController.h"



@interface RTViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *ErrorView;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;





@end

@implementation RTViewController{
SerializedRTClient *client;
NSString* type;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    NSLog(@"initializing with rows:%lu",(unsigned long)_movieList.movies.count);
    return _movieList.movies.count;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   NSString *synopsys = [[self.movieList.movies objectAtIndex:indexPath.row] synopsis];
   PosterModel *posters = [[self.movieList.movies objectAtIndex:indexPath.row] posters];
   MovieViewController *vc = [[MovieViewController alloc] initWithName:synopsys :posters.original];
   [self.navigationController pushViewController:vc animated:YES];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
    MovieCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    NSString *title = [[self.movieList.movies objectAtIndex:indexPath.row] title];
    cell.movTitleLabel.text=title;
    cell.movSynopsisLabel.text = [[self.movieList.movies objectAtIndex:indexPath.row] synopsis];
    PosterModel *posters = [[self.movieList.movies objectAtIndex:indexPath.row] posters];
    
    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:posters.thumbnail]];
    
    UIActivityIndicatorView *loadingIndicator =[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

    
    [cell.movImageView setImageWithURLRequest :imageRequest placeholderImage:nil success:^(NSURLRequest *request,NSHTTPURLResponse *response,UIImage *image){
        [loadingIndicator setHidden:YES];
        [loadingIndicator stopAnimating];
        cell.movImageView.image = image;
           }failure:^(NSURLRequest *request,NSHTTPURLResponse *response, NSError *error){
        [loadingIndicator setHidden:YES];
        [loadingIndicator stopAnimating];
    }];

    self.tableView.rowHeight = 250;
    return cell;
    }



-(void)setErrorMessage:(NSString*)errorMessage{
    _errorLabel.textColor = [UIColor redColor];
    _errorLabel.text = errorMessage;
    [_ErrorView setHidden:false];
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
   
        
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    //self.view.bounds=367;

}





-(void) updateTableContents{
    NSLog(@"Reloaded ------ Movies data=%@",_movieList.movies);
   [_tableView reloadData];
     self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];

}

-(id) initWithName:(NSString *)_type{
    self = [super init];
    if (self){
        NSLog(@"Setting type to %@",_type);
        self.title = _type;
        type = _type;
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    client = [[SerializedRTClient alloc] init];
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    
    NSLog(@"type = %@",type);
    
    if([type isEqual:@"BoxOffice"]){
        _movieList = [client jsonTapped:self];
    }
    if([type isEqualToString:@"inTheater"]){
        NSLog(@"making call to intheater movies");
        _movieList = [client inTheater:self];
    }
    
    NSLog(@"Movies data=%@",_movieList.movies);
    //self.view = _tableView;
    [self.tableView reloadData];
     //self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    //if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    //}
    
    //_movieList = [client jsonTapped:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
