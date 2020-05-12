//
//  ViewController.swift
//  PlayingWithNSEvents
//
//  Created by Nicolas Rizk on 5/6/20.
//  Copyright © 2020 Rizk Media. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var activeApplicationTextField: NSTextField!
    @IBOutlet weak var wordCountTextField: NSTextField!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String : true]
//        let accessEnabled = AXIsProcessTrustedWithOptions(options)
//        
//        print("Access\(accessEnabled ? "" : " Not") Enabled")
//        
//        // initialize word counter, v2 will be persisting this amount over a specified time range
//        wordCountTextField.stringValue = "0"
//        
//        // initialize array of events to store keystrokes
//        var eventArray = [NSEvent]()
//        
//        NSEvent.addGlobalMonitorForEvents(matching: NSEvent.EventTypeMask.keyDown) { (event) in
//            
//            print(event)
//            
//            // Get current word count
//            let numString = self.wordCountTextField.stringValue
//            
//            // Convert word count to int for addition
//            var numInt = Int(numString)!
//            
//            if event.keyCode == 49 { // ignore spaces
//                // count the array as a word on the next space, if the array has contents in it
//                if eventArray.count > 1 { // basic check, needs to be more sophisticated
//                    numInt+=1
//                    eventArray = []
//                }
//            } else {
//                eventArray.append(event) // this will include delete events, that's fine?
//            }
//            
//            self.activeApplicationTextField.stringValue = "You are currently typing in \(NSWorkspace.shared.frontmostApplication!.localizedName!)"
//            
//            /* a good start, but this program does not yet:
//             - sift through numbers, i wonder if there's a categorization for those keycodes
//             - if the user types 3 characters, then deletes those 3 characters, there will be six items in the eventArray. Which would count it as a word.
//             */
//            
//            self.wordCountTextField.stringValue = "\(numInt)"
//            
//            if let appDelegate = NSApplication.shared.delegate {
////                appDelegate.status
//            }
//        }
//        
//        detectRunningApps()
//    
//    }
    
    func detectRunningApps() {
        let apps = NSWorkspace.shared.runningApplications
        print("Currently Running:")
        for app in apps {
            print("\(app.localizedName!)")
        }
    }
}

