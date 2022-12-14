//
//  ResumeColors.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit
import SwiftUI

extension UIColor {
  static var resumeBlack: UIColor {
    UIColor(red: 0, green: 0, blue: 0.1, alpha: 1)
  }
  
  static var resumeDarkGrey: UIColor {
    UIColor(red: 0.22, green: 0.22, blue: 0.25, alpha: 1)
  }

  static var resumeLightGrey: UIColor {
    UIColor(red: 0.65, green: 0.65, blue: 0.68, alpha: 1)
  }

  static var resumeWhite: UIColor {
    UIColor(white: 0.92, alpha: 1.0)
  }
}

//SwiftUI convenience
extension Color {
  static var resumeBlack: Color {
    Color(uiColor: .resumeBlack)
  }
  
  static var resumeDarkGrey: Color {
    Color(uiColor: .resumeDarkGrey)
  }

  static var resumeLightGrey: Color {
    Color(uiColor: .resumeLightGrey)
  }

  static var resumeWhite: Color {
    Color(uiColor: .resumeWhite)
  }
}
