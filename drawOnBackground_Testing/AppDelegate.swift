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
    
   
    //***********************************
    // textField Actions ****************
    
    
    @IBAction func Phase1TextSet(sender: NSTextField) {
        
        println("phase set from text")
        sineWave1.wavPhase = Int(sender.doubleValue)
        phase1Out.doubleValue = sender.doubleValue
         sineWave1.calculateRawValues()
        DrawingWav1.needsDisplay = true

    }
    
    
    //*************************************
    // textField Outlets ******************
    
    
    @IBOutlet weak var phase1Text: NSTextField!
    
   //******* Actions and Outlets  *******
    //***********************************
    //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    //***********************************
    // slider actions **************
    
    @IBAction func phase1Slider(sender: NSSlider) {
        
        sineWave1.wavPhase = Int(sender.doubleValue)
        sineWave1.calculateRawValues()
        phase1Text.integerValue = Int(sender.doubleValue)
        DrawingWav1.needsDisplay = true
    }
   
    
    //***********************************
    // slider Outlets **************

    
    @IBOutlet weak var phase1Out: NSSlider!
    
    
    
    //***********************************
    //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    //***********************************
 
  
   
    
    
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

