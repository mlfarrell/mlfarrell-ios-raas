//
//  PublishedAppsCardViewModel.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit

struct ResumePublishedAppsCardViewModel : ResumeViewModel {
  static var reuseId: String {
    "ResumePublishedAppsCardCell"
  }
  
  struct PublishedApp: Identifiable {
    let name: String
    let url: URL?    
    var id: String { name }
  }
  
  let title: String
  let apps: [PublishedApp]
}

//network model to view model
extension ResumePublishedAppsModel {
  var viewModel: ResumePublishedAppsCardViewModel {
    return ResumePublishedAppsCardViewModel(title: title, apps: apps.map {
      ResumePublishedAppsCardViewModel.PublishedApp(name: $0.name, url: URL(string: $0.url))
    })
  }
}

