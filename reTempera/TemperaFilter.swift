//
//  TemperaFilter.swift
//  reTempera
//
//  Created by Tulebaev on 06.04.2022.
//
import CoreImage

class TemperaFilter: CIFilter {
  var image: CIImage?
  var factors = CIVector(x: 1.0, y: 1.0, z: 1.0)
  let kernel = CIColorKernel(source:
      "kernel float4 LevelingKernel(__sample pixel, vec3 factors) {" +
      "  pixel.rgb *= factors;" +
      "  return clamp(pixel, 0., 1.);" +
      "}")

  override var outputImage: CIImage! {
    guard let image = image else { return nil }
    return kernel!.apply(
      extent: image.extent,
      arguments: [image as Any, factors]
    )!
  }
}
