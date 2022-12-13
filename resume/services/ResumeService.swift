//
//  ResumeService.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation

@MainActor
class ResumeService {
  //see "server" directory in this repo
  let baseUrl = URL(string: "http://localhost:6001")
  
  let errorService: ErrorService
  let networkService: NetworkService
  
  init(errorService: ErrorService, networkService: NetworkService) {
    self.errorService = errorService
    self.networkService = networkService
  }
  
  func getResume() async -> ResumeModel? {
    guard let url = baseUrl?.appendingPathComponent("resume/title") else { return nil }
    let result = await networkService.get(url: url) as (ResumeModel?, Error?)
    
    errorService.handlePossible(error: result.1)
    return result.0
  }
  
  func getContact() async -> ResumeContactModel? {
    guard let url = baseUrl?.appendingPathComponent("resume/contact") else { return nil }
    let result = await networkService.get(url: url) as (ResumeContactModel?, Error?)
    
    errorService.handlePossible(error: result.1)
    return result.0
  }
  
  func getApps() async -> ResumePublishedAppsModel? {
    guard let url = baseUrl?.appendingPathComponent("resume/apps") else { return nil }
    let result = await networkService.get(url: url) as (ResumePublishedAppsModel?, Error?)
    
    errorService.handlePossible(error: result.1)
    return result.0
  }

  func getSkills() async -> ResumeSkillsetModel? {
    guard let url = baseUrl?.appendingPathComponent("resume/skills") else { return nil }
    let result = await networkService.get(url: url) as (ResumeSkillsetModel?, Error?)
    
    errorService.handlePossible(error: result.1)
    return result.0
  }

  func getEducation() async -> ResumeEducationModel? {
    guard let url = baseUrl?.appendingPathComponent("resume/education") else { return nil }
    let result = await networkService.get(url: url) as (ResumeEducationModel?, Error?)
    
    errorService.handlePossible(error: result.1)
    return result.0
  }
}
