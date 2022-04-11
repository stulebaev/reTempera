//
//  ColorTemperatureWrapper.h
//  Tempera
//
//  Created by Tulebaev on 11.04.2022.
//
#ifndef ColorTemperatureWrapper_h
#define ColorTemperatureWrapper_h

#import <Foundation/Foundation.h>

@interface ColorTemperatureWrapper : NSObject
- (NSData*) getColorTemperature :(NSUInteger) temperature;
@end

#endif /* ColorTemperatureWrapper_h */
