//
//  PublishedAppsCardCell.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit
import SnapKit

class ResumePublishedAppsCardCell: ResumeCell {
  override var viewModel: ResumeViewModel? {
    didSet {
      guard let viewModel = viewModel as? ResumePublishedAppsCardViewModel else { return }
      titleLabel.text = viewModel.title
      appsText.attributedText = viewModel.appsString
    }
  }
  
  lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRectZero)
    
    label.font = .resumeTitle
    label.textColor = .resumeBlack
    label.textAlignment = .center
    return label
  }()
  
  lazy var appsText: UITextView = {
    let text = UITextView(frame: CGRectZero)
    
    text.font = .resumeBody
    text.textColor = .resumeBlack
    text.textAlignment = .left
    text.isScrollEnabled = false
    text.backgroundColor = .clear
    text.isEditable = false
    //text.isSelectable = false
    text.dataDetectorTypes = .link
    text.delegate = self
    return text
  }()
  
  override func commonInit() {
    super.commonInit()

    resumeCellContent.addSubview(titleLabel)
    resumeCellContent.addSubview(appsText)

    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(10)
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(appsText.snp.top).offset(-6)
    }

    appsText.snp.makeConstraints { make in
      make.bottom.equalToSuperview().inset(7)
      make.leading.trailing.equalToSuperview().inset(10)
    }
  }
}

extension ResumePublishedAppsCardCell: UITextViewDelegate {
  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    return true
  }
}
