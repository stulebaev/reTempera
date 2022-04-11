//
//  ColorTemperature.hpp
//  Tempera
//
//  Created by Tulebaev on 11.04.2022.
//
#ifndef ColorTemperature_hpp
#define ColorTemperature_hpp

#include <vector>

#define MinColorTemperature 1000
#define MaxColorTemperature 25000

class ColorTemperature {
public:
  std::vector<double> getColorTemperatureFactors(unsigned long temperature);
};

#endif /* ColorTemperature_hpp */
