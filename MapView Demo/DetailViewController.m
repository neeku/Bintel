//
//  DetailViewController.m
//  Bintel
//
//  Created by Neeku Shamekhi on 08/03/15.
//  Copyright (c) 2015 Neeku Shamekhi. All rights reserved.
//
// This app uses https://github.com/prateekvjoshi 's MapView Demo.


#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize nameLabel;
@synthesize detailLabel;
@synthesize doneButton;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.nameLabel.text = searchTitle;
	self.detailLabel.text = searchDetail;
	
	doneButton.layer.cornerRadius = 10;
	doneButton.layer.borderWidth = 2;
	doneButton.layer.borderColor = [UIColor blackColor].CGColor;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithTitle:(NSString*) title detail:(NSString*) detail{
    
    if (self) {
        // Custom initialization
         searchTitle = title;
        NSLog(@"searchTitle::%@",searchTitle);
		searchDetail = detail;
        
    }
    return self;
}




- (IBAction)backAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
