//
//  DetailViewController.h
//  Bintel
//
//  Created by Neeku Shamekhi on 08/03/15.
//  Copyright (c) 2015 Neeku Shamekhi. All rights reserved.
//
// This app uses https://github.com/prateekvjoshi 's MapView Demo.

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    NSString* searchTitle;
	NSString* searchDetail;
    IBOutlet UILabel *nameLabel;
	IBOutlet UILabel *detailLabel;
	IBOutlet UIButton *doneButton;
    
}
- (IBAction)backAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

@property (strong, nonatomic) IBOutlet	UIButton *doneButton;
-(id)initWithTitle:(NSString*) title detail:(NSString*) detail;

@end
