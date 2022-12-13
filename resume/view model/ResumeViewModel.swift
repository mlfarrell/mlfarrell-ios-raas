//
//  ResumeViewModel.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation

protocol ResumeViewModel {
  static var reuseId: String { get }
}

extension ResumeViewModel {
  var dequeableReuseId: String {
    return Self.reuseId
  }
}
