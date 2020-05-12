//
//  AppDelegate.swift
//  PlayingWithNSEvents
//
//  Created by Nicolas Rizk on 5/6/20.
//  Copyright © 2020 Rizk Media. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusBarItem: NSStatusItem!
    var currentWordCount: Int!
    static let currentWordCountKey = "currentWordCount"
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        currentWordCount = UserDefaults.standard.integer(forKey: AppDelegate.currentWordCountKey)
        
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        statusBarItem.button?.title = "\(currentWordCount!)"
        
        let statusBarMenu = NSMenu(title: "Word Counter Bar Menu")
        statusBarItem.menu = statusBarMenu
        let quitAppMenuItem = NSMenuItem(title: "Quit", action: #selector(quitApp), keyEquivalent: "")
        statusBarMenu.addItem(quitAppMenuItem)
        
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String : true]
        let accessEnabled = AXIsProcessTrustedWithOptions(options)
        
        print("Access\(accessEnabled ? "" : " Not") Enabled")
        
        // initialize array of events to store keystrokes
        var eventArray = [NSEvent]()
        
        NSEvent.addGlobalMonitorForEvents(matching: NSEvent.EventTypeMask.keyDown) { (event) in
            
            if event.keyCode == 49 { // ignore spaces
                // count the array as a word on the next space, if the array has contents in it
                if eventArray.count > 1 { // basic check, needs to be more sophisticated
                    self.currentWordCount+=1
                    eventArray = []
                }
            } else {
                eventArray.append(event) // this will include delete events, that's fine?
            }

            self.statusBarItem.button?.title = "\(self.currentWordCount!)"

        }
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        UserDefaults.standard.set(self.currentWordCount, forKey: AppDelegate.currentWordCountKey)
    }
    
    @objc func quitApp() {
        NSApplication.shared.terminate(self)
    }
}

