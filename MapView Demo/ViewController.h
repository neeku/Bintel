//
//  ViewController.h
//  Bintel
//
//  Created by Neeku Shamekhi on 08/03/15.
//  Copyright (c) 2015 Neeku Shamekhi. All rights reserved.
//
// This app uses https://github.com/prateekvjoshi 's MapView Demo.


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
{
     IBOutlet MKMapView *mapView;

}

@property (nonatomic,retain) IBOutlet MKMapView *mapView;

@end
