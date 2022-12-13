//
//  AttributedString+Concat.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit

/// concatenate attributed strings
func +(left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
  let string = NSMutableAttributedString()
  string.append(left)
  string.append(right)
  return string
}

