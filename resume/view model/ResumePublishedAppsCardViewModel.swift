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

extension ResumePublishedAppsCardViewModel {
  private var appsParagraphStyle: NSParagraphStyle {
    let style = NSMutableParagraphStyle()
    
    style.lineSpacing = 5.5
    return style
  }

  var appsString: NSAttributedString {
    let appsStr = apps.map {
      "\($0.name) - \($0.url?.description ?? "")"
    }.joined(separator: "\n")
    
    return NSAttributedString(string: appsStr, attributes: [
      .font: UIFont.resumeBody,
      .paragraphStyle: appsParagraphStyle
    ])
  }
}

//network model to view model
extension ResumePublishedAppsModel {
  var viewModel: ResumePublishedAppsCardViewModel {
    return ResumePublishedAppsCardViewModel(title: title, apps: apps.map {
      ResumePublishedAppsCardViewModel.PublishedApp(name: $0.name, url: URL(string: $0.url))
    })
  }
}

