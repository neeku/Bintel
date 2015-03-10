//
//  MyAnnotation.h
//  Bintel
//
//  Created by Neeku Shamekhi on 08/03/15.
//  Copyright (c) 2015 Neeku Shamekhi. All rights reserved.
//
// This app uses https://github.com/prateekvjoshi 's MapView Demo.

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface MyAnnotation : NSObject<MKAnnotation> {
	
	CLLocationCoordinate2D	coordinate;
	NSString*				title;
	NSString*				subtitle;
}

@property (nonatomic, assign)	CLLocationCoordinate2D	coordinate;
@property (nonatomic, copy)		NSString*				title;
@property (nonatomic, copy)		NSString*				subtitle;

@end