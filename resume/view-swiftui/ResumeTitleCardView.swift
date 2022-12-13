//
//  ResumeTitleCardView.swift
//  resume
//
//  Created by Michael Farrell on 12/13/22.
//

import SwiftUI

struct ResumeTitleCardView: View {
  @State var viewModel: ResumeTitleCardViewModel
  
  var body: some View {
    VStack {
      Text(viewModel.title)
        .font(.resumeTitle)
        .padding(.bottom, 3)
      Text(viewModel.role)
        .font(.resumeSubtitle)
    }
    .foregroundColor(.resumeBlack)
    .wrapped(with: 16)
  }
}

struct ResumeTitleCardView_Previews: PreviewProvider {
  static let viewModel = ResumeTitleCardViewModel(title: "Michael L. Farrell", role: "Lead iOS Engineer")
  
  static var previews: some View {
    ResumeTitleCardView(viewModel: viewModel)
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Color(white: 0.4))
  }
}
