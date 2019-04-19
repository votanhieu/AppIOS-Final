//
//  MapAnnotation.h
//  Final
//
//  Created by RUN on 4/3/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface MapAnnotation : NSObject<MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)title andCoordinate:
(CLLocationCoordinate2D)coordinate2d;

@end

NS_ASSUME_NONNULL_END
