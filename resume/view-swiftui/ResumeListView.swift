//
//  ResumeListView.swift
//  resume
//
//  Created by Michael Farrell on 12/13/22.
//

import SwiftUI

struct ResumeListView: View {
  //TODO: dynamic models array like the UIKit side
  @State var titleViewModel: ResumeTitleCardViewModel
  @State var addressViewModel: ResumeAddressContactCardViewModel
  @State var blurbViewModel: ResumeBlurbCardViewModel
  @State var appsViewModel: ResumePublishedAppsCardViewModel
  @State var skillsViewModel: ResumeSkillsetCardViewModel
  @State var educationViewModel: ResumeEducationCardViewModel
  
  var body: some View {
    ScrollView {
      VStack(spacing: 25) {
        ResumeTitleCardView(viewModel: titleViewModel)
        ResumeAddressContactCardView(viewModel: addressViewModel)
        ResumeBlurbCardView(viewModel: blurbViewModel)
        ResumePublishedAppsCardView(viewModel: appsViewModel)
        ResumeSkillsetCardView(viewModel: skillsViewModel)
        ResumeEducationCardView(viewModel: educationViewModel)
      }
      .padding()
    }
    .background(.clear)
    /*.background {
      Image("background")
        .resizable()
        .aspectRatio(contentMode: .fill)
    }*/
  }
}

struct ResumeListView_Previews: PreviewProvider {
  static var previews: some View {
    ResumeListView(titleViewModel: ResumeTitleCardView_Previews.viewModel,
                   addressViewModel: ResumeAddressContactCardView_Previews.viewModel,
                   blurbViewModel: ResumeBlurbCardView_Previews.viewModel,
                   appsViewModel: ResumePublishedAppsCardView_Previews.viewModel,
                   skillsViewModel: ResumeSkillsetCardView_Previews.viewModel,
                   educationViewModel: ResumeEducationCardView_Previews.viewModel)
    .previewLayout(.sizeThatFits)
    .background(Color.resumeDarkGrey)
  }
}
