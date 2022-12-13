//
//  ResumeTitleCardViewModel.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation

struct ResumeTitleCardViewModel : ResumeViewModel {
  static var reuseId: String {
    "ResumeTitleCardCell"
  }
  
  let title: String
  let role: String
}

//network model to view model
extension ResumeModel {
  var viewModel: ResumeTitleCardViewModel {
    return ResumeTitleCardViewModel(title: title, role: role)
  }
}
