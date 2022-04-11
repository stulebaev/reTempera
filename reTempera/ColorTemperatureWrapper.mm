//
//  ColorTemperatureWrapper.mm
//  Tempera
//
//  Created by Tulebaev on 11.04.2022.
//
#import "ColorTemperatureWrapper.h"
#import "ColorTemperature.hpp"

@implementation ColorTemperatureWrapper

ColorTemperature colorTemperature;

- (instancetype) init {
  self = [super init];
  if (self) { colorTemperature = ColorTemperature(); }
  return self;
}

- (NSData*) getColorTemperature :(NSUInteger) temperature {
  std::vector<double> factors = colorTemperature.getColorTemperatureFactors(temperature);
  return [NSData dataWithBytes:factors.data() length:3*sizeof(double)];
}

@end
