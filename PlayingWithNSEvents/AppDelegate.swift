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

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
        statusBarItem.button?.title = "✍"
        let statusBarMenu = NSMenu(title: "Word Counter Bar Menu")
        statusBarItem.menu = statusBarMenu
        
        statusBarMenu.addItem(withTitle: "Count Words", action: nil, keyEquivalent: "")

    }

}

