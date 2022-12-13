//
//  ResumeModel.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation

//Note - these models forego any concept of persistence (coredata, codable plists, etc)
//in a production environment, the network model would likely differ more significantly from the view models

//after all, this is just a demo
//I don't typically use this exact naming convention (Model suffix) in production code as well

struct ResumeModel: Codable {
  let title: String
  let role: String
  let description: String
}

struct ResumeContactModel: Codable {
  struct Address: Codable {
    let street: String
    let appartmentUnit: String?
    let city: String
    let state: String
    let zip: String
  }
  
  let address: Address
  let phone: String
  let email: String
}

struct ResumePublishedAppsModel: Codable {
  struct Application: Codable {
    let name: String
    let url: String
  }

  let title: String
  let apps: [Application]
}

struct ResumeSkillsetModel: Codable {
  struct Skillset: Codable {
    let name: String
    let skills: [String]
  }
  
  let title: String
  let skillsets: [Skillset]
}

struct ResumeEducationModel: Codable {
  struct School: Codable {
    let school: String
    let city: String
    let state: String
    let degree: String
    let field: String
    let date: Date
  }
  
  struct Honor: Codable {
    let membership: String
    let chapter: String?
    let society: String
  }

  let title: String
  let schools: [School]
  let honors: [Honor]
}

