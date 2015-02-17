//
//  AppDelegate.swift
//  drawOnBackground_Testing
//
//  Created by george on 12/02/2015.
//  Copyright (c) 2015 george. All rights reserved.
//

import Cocoa



let pi = M_PI



//*********************************
// Global Scope Objects
//*********************************

public var sineWave1 = SineWave()


//**********************************
//**********************************




@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var DrawingWav1: WaveView1!
    
    // textFields ******************
    
    @IBOutlet weak var phaseText: NSTextField!
    
    // slider actions **************
    

    
    
    @IBAction func phase1Slider(sender: NSSlider) {
        
        sineWave1.wavPhase = Int(sender.doubleValue)
        sineWave1.calculateRawValues()
        DrawingWav1.needsDisplay = true
    }
    
    
 
     //var resultantValueArray = [Double]()
   
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        // Insert code here to initialize your application
        
        
        sineWave1.calculateRawValues()
       
        println(" just set phase 1 to 0 and it's \(sineWave1.wavPhase)")
        

        
        
        
         println("main loop how many times?")
        
        DrawingWav1.testFunction()
        
   DrawingWav1.needsDisplay = true
        
        
     
    } // end main loop
    

    
    
    
    
    
    
    
    
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

