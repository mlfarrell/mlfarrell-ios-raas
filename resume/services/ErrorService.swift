//
//  ErrorService.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit

class ErrorService {    
  func handlePossible(error: Error?) {
    guard let error else { return }
    
    //for a simple demo, modal alert is fine
    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default))
    
    guard UIApplication.shared.keyWindow?.rootViewController?.presentedViewController == nil else { return }
    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
  }
}
