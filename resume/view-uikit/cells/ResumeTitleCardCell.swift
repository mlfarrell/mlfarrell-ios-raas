//
//  ResumeTitleCardCell.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit
import SnapKit

class ResumeTitleCardCell: ResumeCell {
  override var viewModel: ResumeViewModel? {
    didSet {
      guard let viewModel = viewModel as? ResumeTitleCardViewModel else { return }
      titleLabel.text = viewModel.title
      roleLabel.text = viewModel.role
    }
  }
  
  lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRectZero)
    
    label.font = .resumeTitle
    label.textColor = .resumeBlack
    label.textAlignment = .center
    return label
  }()

  lazy var roleLabel: UILabel = {
    let label = UILabel(frame: CGRectZero)
    
    label.font = .resumeSubtitle
    label.textColor = .resumeBlack
    label.textAlignment = .center
    return label
  }()

  override func commonInit() {
    super.commonInit()
    
    resumeCellContent.addSubview(titleLabel)
    resumeCellContent.addSubview(roleLabel)

    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(10)
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(roleLabel.snp.top).offset(-6)
    }
    
    roleLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.bottom.equalToSuperview().inset(10)
    }
  }
}
