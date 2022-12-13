//
//  ResumeTableViewController.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation
import UIKit
import SnapKit

class ResumeTableViewController : UITableViewController {
  var viewModels: [ResumeViewModel] = [] {
    didSet {
      tableView.reloadData()
    }
  }
    
  override init(style: UITableView.Style) {
    super.init(style: style)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "fallback")
    tableView.register(ResumeTitleCardCell.self, forCellReuseIdentifier: ResumeTitleCardViewModel.reuseId)
    tableView.register(ResumeAddressContactCardCell.self, forCellReuseIdentifier: ResumeAddressContactCardViewModel.reuseId)
    tableView.register(ResumeBlurbCardCell.self, forCellReuseIdentifier: ResumeBlurbCardViewModel.reuseId)
    tableView.register(ResumePublishedAppsCardCell.self, forCellReuseIdentifier: ResumePublishedAppsCardViewModel.reuseId)
    tableView.register(ResumeSkillsetCardCell.self, forCellReuseIdentifier: ResumeSkillsetCardViewModel.reuseId)
    tableView.register(ResumeEducationCardCell.self, forCellReuseIdentifier: ResumeEducationCardViewModel.reuseId)
    
    tableView.backgroundColor = .clear
    tableView.backgroundView = nil
    tableView.bounces = true
    tableView.rowHeight = UITableView.automaticDimension
    tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    tableView.allowsSelection = false
  }
  
  override func didMove(toParent parent: UIViewController?) {
    super.didMove(toParent: parent)
    
    guard parent != nil else { return }    
    tableView.snp.removeConstraints()
    tableView.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview()
      make.center.equalToSuperview()
      make.width.equalTo(600)
      //make.leading.trailing.equalToSuperview().inset(50)
    }
  }
}

//UITableViewDataSource & Delegate
extension ResumeTableViewController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModels.count
  }
    
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let vm = viewModels[indexPath.row]
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: vm.dequeableReuseId) as? ResumeCell else { return fallbackCell() }
    cell.viewModel = vm
    
    return cell
  }
  
  private func fallbackCell() -> UITableViewCell {
    //avoid a crash if a cell is missing
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "fallback") else { fatalError() }
    return cell
  }
}

