//
//  MapAnnotation.m
//  Final
//
//  Created by RUN on 4/3/19.
//  Copyright © 2019 RUN. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation
-(id)initWithTitle:(NSString *)title andCoordinate:
(CLLocationCoordinate2D)coordinate2d {
    
    self.title = title;
    self.coordinate =coordinate2d;
    return self;
}
@end
