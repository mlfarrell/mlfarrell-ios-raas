//
//  ResumeAddressContactCardView.swift
//  resume
//
//  Created by Michael Farrell on 12/13/22.
//

import SwiftUI

struct ResumeAddressContactCardView: View {
  @State var viewModel: ResumeAddressContactCardViewModel
  
  var body: some View {
    HStack {
      Text(viewModel.address.description)
      Spacer()
      Image(uiImage: viewModel.logoImage ?? UIImage())
      Spacer()
      VStack {
        Text(viewModel.phone)
        Text(viewModel.email)
      }
    }
    .font(.resumeBody)
    .foregroundColor(.resumeBlack)
    .wrapped(with: 16)
  }
}

struct ResumeAddressContactCardView_Previews: PreviewProvider {
  static let viewModel = ResumeAddressContactCardViewModel(address: AddressViewModel(street: "123 Fictional St", appartmentUnit: "#999", city: "San Diego", state: "CA", zip: "90210"),
                                                           phone: "+1-555-555-1234", email: "developer@gmail.com", logo: Bundle.main.url(forResource: "logo", withExtension: "png"))
  
  static var previews: some View {
    ResumeAddressContactCardView(viewModel: viewModel)
      .frame(maxWidth: 600)
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Color(white: 0.4))
  }
}
