//
//  ResumeCell.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit

class ResumeCell: UITableViewCell {
  private let betweenCellPadding: CGFloat = 20
  
  var viewModel: ResumeViewModel?
  
  lazy var resumeCellContent: UIView = {
    UIView(frame: CGRectZero)
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  func commonInit() {
    backgroundColor = .clear

    contentView.addSubview(resumeCellContent)
    resumeCellContent.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview().inset(betweenCellPadding/2)
      make.leading.trailing.equalToSuperview()
    }
    
    resumeCellContent.backgroundColor = .resumeWhite.withAlphaComponent(0.9)
    resumeCellContent.layer.cornerRadius = 16
    resumeCellContent.layer.borderColor = UIColor.resumeLightGrey.cgColor
    resumeCellContent.layer.borderWidth = 2.0    
    resumeCellContent.isUserInteractionEnabled = true
  }
}
