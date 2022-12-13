'use strict';

const fs = require('fs');

module.exports = class ResumeController {
	static title(req, res) {
    const reqParams = req.query;						
    
    //console.log(JSON.stringify(reqParams));
        
    //simulated response (lets pretend this came from a fancy storage service)
    //otherwise, scope creep will lead to me storing this stuff in the cloud
    // which is overkill for a swift resume POC
    res.json({
      title: "Michael L. Farrell",
      role: "Lead iOS Engineer",
      description: "I am an expert in the field of Agile mobile application development, modern real-time graphics, data visualization, GPU computing, and video game development. I am formally trained in computer science and modernized software engineering practices with a further specialization in Swift, Objective-C, C++, Apple, Windows & LINUX systems. I’ve helped small teams (up to 5 engineers) in the iOS space navigate complex deliveries through several leadership roles."
    });
	}	
	
	static contact(req, res) {
    const reqParams = req.query;						
    
    //not putting my actual contact info on this repo
    res.json({
      phone: "+1-555-555-1234",
      email: "developer@gmail.com",
      address: {
        street: "123 Fictional St", 
        appartmentUnit: "#999", 
        city: "San Diego", 
        state: "CA", 
        zip: "90210"      
      }     
    });
	}	
	
	static apps(req, res) {
    res.json({
      title: "Published Applications",
      apps: [
        { name: "Verto Studio 3D", url:  "https://vertostudio.com/ios.php" },
        { name: "Verto Studio Mac", url:  "https://apps.apple.com/us/app/verto-studio-3d/id503496509?mt=12" },
        { name: "Verto Studio VR", url:  "https://www.oculus.com/experiences/quest/3595480007166275/" },
        { name: "War War", url:  "https://apps.apple.com/us/app/war-war/id1518435998?mt=12" },
        { name: "Espresso-C", url:  "https://apps.apple.com/us/app/espresso-c/id916506440?mt=12" }
      ]
    });	
	}
	
	static skills(req, res) {
    res.json({
      title: "Skill Set",
      skillsets: [
        { name: "Languages", skills: [ "Swift", "Objective-C", "C/C++", "JS", "Java" ] },
        { name: "APIs & SDKs", skills: [ "UIKit", "CoreData", "URLSession", "StoreKit2", "Metal", "SwiftUI", "AWSSDK", "XCUITest", "ARKit" ] },
        { name: "Design Patterns", skills: [ "MVVM", "MVC", "VIPER" ] },
        { name: "Systems & Tools", skills: [ "CircleCI", "CocoaPods", "Carthage", "fastlane", "git", "figma" ] },
        { name: "Environments", skills: [ "Xcode","nodeJS","Android Studio (NDK)","AWS" ] },
        { name: "Devices", skills: [ "iPad", "iPhone", "Hololens", "HTC Vive", "Quest" ] }
      ]
    });		
	}
	
	static education(req, res) {
    res.json({
      title: "Education",
      schools: [
        { school: "Ohio University", city: "Athens", state: "OH", degree: "M.S.", field: "Computer Science", date: "2009-04-01T00:00:00Z" },
        { school: "Salisbury University", city: "Salisbury", state: "MD", degree: "B.S.", field: "Computer Science", date: "2006-04-01T00:00:00Z" }
      ],
      honors: [
        { membership: "Member", chapter: null, society: "Phi Theta Kappa Honor Society" },
        { membership: "Founding Member", chapter: "Theta-Xi Chapter, ", society: "Sigma Pi Fraternity International" },
        { membership: "Member", chapter: null, society: "Theta Tau Professional Engineering Fraternity" }
      ]
    });			
	}
};


