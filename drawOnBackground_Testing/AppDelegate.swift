//
//  AppDelegate.swift
//  drawOnBackground_Testing
//
//  Created by george on 12/02/2015.
//  Copyright (c) 2015 george. All rights reserved.
//

import Cocoa



let pi = M_PI


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    //@IBOutlet weak var DrawingView: NSView!
    
    @IBOutlet weak var DrawingWav1: WaveView1!
 
     var resultantValueArray = [Double]()
   
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        // Insert code here to initialize your application
        
        
//        DrawingWav1.lockFocus()
//        var path = NSBezierPath()
//        var somePoint:NSPoint = NSPoint(x:1, y:1)
//        path.lineWidth = 1
//        path.moveToPoint(somePoint)
//        path.lineToPoint ( NSPoint( x:300, y:300))
//        path.stroke()
        
        
        
        
         println("main loop how many times?")
        
        DrawingWav1.testFunction()
        
    DrawingWav1.needsDisplay = true
        
        
     
    } // end main loop
    

    
    
    
    
    
    
    
    
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

