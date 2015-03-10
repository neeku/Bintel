//
//  ViewController.m
//  Bintel
//
//  Created by Neeku Shamekhi on 08/03/15.
//  Copyright (c) 2015 Neeku Shamekhi. All rights reserved.
//
// This app uses https://github.com/prateekvjoshi 's MapView Demo.

#import "ViewController.h"
#import "MyAnnotation.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapView;


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.mapView setDelegate:self];
	[self.mapView setMapType:MKMapTypeStandard];
	[self.mapView setZoomEnabled:YES];
	[self.mapView setScrollEnabled:YES];
    self.mapView.showsUserLocation = YES;


    CLLocation *userLoc = mapView.userLocation.location;
    CLLocationCoordinate2D userCoordinate = userLoc.coordinate;
	
	NSLog(@"user latitude = %f",userCoordinate.latitude);
	NSLog(@"user longitude = %f",userCoordinate.longitude);
	
	mapView.delegate=self;
	
	NSMutableArray* annotations=[[NSMutableArray alloc] init];
	
	CLLocationCoordinate2D theCoordinate1;

    theCoordinate1.latitude =53.346398;
    theCoordinate1.longitude = -6.268085;
	
	CLLocationCoordinate2D theCoordinate2;
    theCoordinate2.latitude = 53.344194;
    theCoordinate2.longitude = -6.284914;
	
	CLLocationCoordinate2D theCoordinate3;
    theCoordinate3.latitude = 53.343733;
    theCoordinate3.longitude = -6.279936;
	
	CLLocationCoordinate2D theCoordinate4;
    theCoordinate4.latitude = 53.344092;
    theCoordinate4.longitude = -6.287146;
	
	MyAnnotation* myAnnotation1=[[MyAnnotation alloc] init];
    
	myAnnotation1.coordinate=theCoordinate1;
	myAnnotation1.title=@"Capel St. 1";
	myAnnotation1.subtitle=@"Used since last collection: 38 times\n\n Weight: 21 KG; Mind your back!";
	
	MyAnnotation* myAnnotation2=[[MyAnnotation alloc] init];
	
	myAnnotation2.coordinate=theCoordinate2;
	myAnnotation2.title=@"Walting St. 4";
	myAnnotation2.subtitle=@"Used since last collection: 3 times \n\n Weight: 1 KG";
	
	MyAnnotation* myAnnotation3=[[MyAnnotation alloc] init];
	
	myAnnotation3.coordinate=theCoordinate3;
	myAnnotation3.title=@"Oliver Bond St. 3";
	myAnnotation3.subtitle=@"Used since last collection: 10 times\n\n Weight: 8 KG";
	
	MyAnnotation* myAnnotation4=[[MyAnnotation alloc] init];
	
	myAnnotation4.coordinate=theCoordinate4;
	myAnnotation4.title=@"Guiness!";
	myAnnotation4.subtitle=@"Used since last collection: 11 times\n Weight: 8 KG";
	
	[mapView addAnnotation:myAnnotation1];
	[mapView addAnnotation:myAnnotation2];
	[mapView addAnnotation:myAnnotation3];
	[mapView addAnnotation:myAnnotation4];
	
	[annotations addObject:myAnnotation1];
	[annotations addObject:myAnnotation2];
	[annotations addObject:myAnnotation3];
	[annotations addObject:myAnnotation4];
	
	NSLog(@"%d",[annotations count]);
	//[self gotoLocation];//to catch perticular area on screen
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	// Walk the list of overlays and annotations and create a MKMapRect that
    // bounds all of them and store it into flyTo.
    MKMapRect flyTo = MKMapRectNull;
	for (id <MKAnnotation> annotation in annotations) {
		NSLog(@"fly to on");
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
        if (MKMapRectIsNull(flyTo)) {
            flyTo = pointRect;
        } else {
            flyTo = MKMapRectUnion(flyTo, pointRect);
			//NSLog(@"else-%@",annotationPoint.x);
        }
    }
    
    // Position the map so that all overlays and annotations are visible on screen.
    mapView.visibleMapRect = flyTo;
	


    [self findCurrentLocation];

}

- (void)gotoLocation
{
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 18.964700;
    newRegion.center.longitude = 72.825800;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
	
    [self.mapView setRegion:newRegion animated:YES];
}

-(void)findCurrentLocation
{
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    if ([locationManager locationServicesEnabled])
    {
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        [locationManager startUpdatingLocation];
    }
    
    
    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    
    NSString *str=[[NSString alloc] initWithFormat:@"%f,%f",coordinate.latitude,coordinate.longitude];
    NSLog(@"userLocation::%@",str);
    
    NSString *userLatitude = [str substringToIndex:9];
    NSLog(@"userLatitude::%@",userLatitude);
    
    NSString *userLongitude = [str  substringFromIndex:10];
    NSLog(@"userLongitude::%@",userLongitude);
    
//    float n=[userLongitude floatValue];
//    NSLog(@"userLongitudeFloat::%f",n);
    
//    for (int i = 0 ; i < [latitudeArray count] ; i++) {
//        if ([userLatitude isEqualToString:[latitudeArray objectAtIndex:i]]) {
//            NSLog(@"Bingo!");
//            break;
//        }
//    }
//    
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
	NSLog(@"welcome into the map view annotation");
	
	// if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
	// try to dequeue an existing pin view first
	static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
	MKPinAnnotationView* pinView = [[MKPinAnnotationView alloc]
									 initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
	pinView.animatesDrop=YES;
	pinView.canShowCallout=YES;
	pinView.pinColor=MKPinAnnotationColorGreen;
	
	
	UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	[rightButton setTitle:annotation.title forState:UIControlStateNormal];
	[rightButton addTarget:self
					action:@selector(showDetails:)
		  forControlEvents:UIControlEventTouchUpInside];
	pinView.rightCalloutAccessoryView = rightButton;
	
    return pinView;
//	UIImageView *profileIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profile.png"]];
//	pinView.leftCalloutAccessoryView = profileIconView;
	
}

-(IBAction)showDetails:(id)sender{
    
	NSLog(@"Annotation Click");
  
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view
calloutAccessoryControlTapped:(UIControl *)control
{
    
	NSString* title = view.annotation.title;
	NSString* detail = view.annotation.subtitle;
    
	
    DetailViewController *detailoffavorite=[[DetailViewController alloc]initWithTitle:title detail:detail];
    [self presentViewController:detailoffavorite animated:YES completion:nil];
    
    NSLog(@"title::%@",title);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
