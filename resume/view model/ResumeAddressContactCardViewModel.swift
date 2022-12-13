//
//  ResumeAddressContactCardViewModel.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit

//In a real application, this would be a wrapper around GMSPlace or similair location SDK
struct AddressViewModel: CustomStringConvertible {
  let street: String
  let appartmentUnit: String?
  let city: String
  let state: String
  let zip: String
  
  var description: String {
    "\(street) \(appartmentUnit ?? "")\n\(city), \(state) \(zip)"
  }
}

struct ResumeAddressContactCardViewModel : ResumeViewModel {
  static var reuseId: String {
    "ResumeAddressContactCardCell"
  }
  
  let address: AddressViewModel
  let phone: String
  let email: String
  let logo: URL?
  
  var logoImage: UIImage? {
    guard let logo, logo.isFileURL else {
      //use UIImage load from SDK such as Kingfisher
      return nil
    }

    return UIImage(contentsOfFile: logo.path)
  }
}

//network model to view model
extension ResumeContactModel {
  var viewModel: ResumeAddressContactCardViewModel {
    return ResumeAddressContactCardViewModel(address: AddressViewModel(street: address.street, appartmentUnit: address.appartmentUnit, city: address.city,
                                                                       state: address.state, zip: address.zip), phone: phone, email: email,
                                                                       logo: Bundle.main.url(forResource: "logo", withExtension: "png"))
  }
}

