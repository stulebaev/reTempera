//
//  ViewController.swift
//  reTempera
//
//  Created by Tulebaev on 06.04.2022.
//
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var intensity: UISlider!

  var context = CIContext(options: nil)
  var filter = TemperaFilter()

  override func viewDidLoad() {
    super.viewDidLoad()
    intensity.minimumValue = 1000
    intensity.maximumValue = 25000
    intensity.value = 6500
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self,
                                                        action: #selector(importPicture))
  }

  @objc func importPicture() {
    let picker = UIImagePickerController()
    picker.delegate = self
    present(picker, animated: true)
  }

  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let newImage = info[.originalImage] as? UIImage else { return }
    dismiss(animated: true)
    filter.image = CIImage(image: newImage)
    applyProcessing()
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true)
  }

  @IBAction func intensityChanged(_ sender: UISlider) {
    var factors: [CGFloat] = [1.0, 1.0, 1.0]
//print(UInt(intensity.value))
    let data = ColorTemperatureWrapper().getColorTemperature(UInt(intensity.value)) as NSData
    data.getBytes(&factors, length: 3*MemoryLayout<CGFloat>.size)
    filter.factors = CIVector(x: factors[0], y: factors[1], z: factors[2])
//print(filter.factors)
    applyProcessing()
  }

  func applyProcessing() {
    guard let processed = filter.outputImage else { return }
    let cgImg = context.createCGImage(processed, from: processed.extent)!
    self.imageView.image = UIImage(cgImage: cgImg)
  }
}
