//
//  ResumeAddressContactCardCell.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit
import SnapKit

class ResumeAddressContactCardCell: ResumeCell {
  override var viewModel: ResumeViewModel? {
    didSet {
      guard let viewModel = viewModel as? ResumeAddressContactCardViewModel else { return }
      addressLabel.text = viewModel.address.description
      contactLabel.text = viewModel.phone + "\n" + viewModel.email
      logoImageView.image = viewModel.logoImage
    }
  }
  
  lazy var addressLabel: UILabel = {
    let label = UILabel(frame: CGRectZero)
    
    label.numberOfLines = 2
    label.font = .resumeBody
    label.textColor = .resumeBlack
    label.textAlignment = .left
    return label
  }()

  lazy var contactLabel: UILabel = {
    let label = UILabel(frame: CGRectZero)
    
    label.numberOfLines = 2
    label.font = .resumeBody
    label.textColor = .resumeBlack
    label.textAlignment = .right
    return label
  }()

  lazy var logoImageView: UIImageView = {
    let imageView = UIImageView(frame: CGRectZero)
    
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  override func commonInit() {
    super.commonInit()
    
    resumeCellContent.addSubview(addressLabel)
    resumeCellContent.addSubview(contactLabel)
    resumeCellContent.addSubview(logoImageView)

    addressLabel.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview().inset(10)
      make.left.equalToSuperview().inset(10)
    }
    
    contactLabel.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview().inset(10)
      make.right.equalToSuperview().inset(10)
    }
    
    logoImageView.snp.makeConstraints { make in
      make.center.equalToSuperview()
      //make.top.bottom.equalToSuperview().inset(5)
      make.width.height.equalTo(50)
    }
  }
}
