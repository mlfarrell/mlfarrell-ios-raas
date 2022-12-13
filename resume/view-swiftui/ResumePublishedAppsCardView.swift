//
//  ResumePublishedAppsCardView.swift
//  resume
//
//  Created by Michael Farrell on 12/13/22.
//

import SwiftUI

struct ResumePublishedAppsCardView: View {
  @State var viewModel: ResumePublishedAppsCardViewModel
  
  var body: some View {
    VStack {
      Text(viewModel.title)
        .font(.resumeTitle)
        .padding(.bottom, 8)
      
      ForEach(viewModel.apps) { app in
        HStack(spacing: 0) {
          Text("\(app.name) - ")
          Text(app.url?.absoluteString ?? "")
            .foregroundColor(.blue)
            //.underline()
            .onTapGesture {
              visitSite(url: app.url)
            }
          Spacer()
        }
        .font(.resumeBody)
        .padding(.bottom, 3)
      }
    }
    .foregroundColor(.resumeBlack)
    .wrapped(with: 16)
  }
  
  func visitSite(url: URL?) {
    guard let url else { return }
    UIApplication.shared.open(url)
  }
}

struct ResumePublishedAppsCardView_Previews: PreviewProvider {
  static let viewModel = ResumePublishedAppsCardViewModel(title: "Published Applications", apps: [
    ResumePublishedAppsCardViewModel.PublishedApp(name: "Verto Studio 3D", url: URL(string: "https://vertostudio.com/ios.php")),
    ResumePublishedAppsCardViewModel.PublishedApp(name: "Verto Studio Mac", url: URL(string: "https://apps.apple.com/us/app/verto-studio-3d/id503496509?mt=12")),
    ResumePublishedAppsCardViewModel.PublishedApp(name: "Verto Studio VR", url: URL(string: "https://www.oculus.com/experiences/quest/3595480007166275/")),
    ResumePublishedAppsCardViewModel.PublishedApp(name: "War War", url: URL(string: "https://apps.apple.com/us/app/war-war/id1518435998?mt=12")),
    ResumePublishedAppsCardViewModel.PublishedApp(name: "Espresso-C", url: URL(string: "https://apps.apple.com/us/app/espresso-c/id916506440?mt=12"))
  ])
  
  static var previews: some View {
    ResumePublishedAppsCardView(viewModel: viewModel)
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Color(white: 0.4))
  }
}
