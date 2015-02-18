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
    
    
    //******* Actions and Outlets  *******
    //***********************************
    //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   
    //***********************************
    // textField Actions ****************
    
    
    @IBAction func freq1TextSet(sender: NSTextField) {
        sineWave1.wavFrequency = sender.doubleValue
        freq1Out.doubleValue = sender.doubleValue //update slider outlet
        sineWave1.calculateRawValues()
        DrawingWav1.needsDisplay = true
    }
    
    
//__________________________________________________
    
    @IBAction func amp1TextSet(sender: NSTextField) {
        
        sineWave1.wavAmplitude = sender.doubleValue
        amp1Out.doubleValue = sender.doubleValue //update slider outlet
        sineWave1.calculateRawValues()
        DrawingWav1.needsDisplay = true

    }
    
//__________________________________________________
    
    @IBAction func Phase1TextSet(sender: NSTextField) {
        
        println("phase set from text")
        sineWave1.wavPhase = Int(sender.doubleValue)
        phase1Out.doubleValue = sender.doubleValue //update slider outlet
         sineWave1.calculateRawValues()
        DrawingWav1.needsDisplay = true

    }
    
    
    //*************************************
    // textField Outlets ******************
    
    
    @IBOutlet weak var freq1Text: NSTextField!
    @IBOutlet weak var amp1Text: NSTextField!
    @IBOutlet weak var phase1Text: NSTextField!
    

    
    
    //***********************************
    // slider actions **************
    
   
    @IBAction func freq1Slider(sender: NSSlider) {
        
        sineWave1.wavFrequency = sender.doubleValue
        sineWave1.calculateRawValues()
        freq1Text.integerValue = Int(sender.doubleValue)
        DrawingWav1.needsDisplay = true
        
    }
    
//__________________________________________________

    
    @IBAction func amp1Slider(sender: NSSlider) {
        
        sineWave1.wavAmplitude = sender.doubleValue
        sineWave1.calculateRawValues()
        amp1Text.floatValue = Float(sender.doubleValue)
        DrawingWav1.needsDisplay = true
        
    }
 //__________________________________________________
    
    @IBAction func phase1Slider(sender: NSSlider) {
        
        sineWave1.wavPhase = Int(sender.doubleValue)
        sineWave1.calculateRawValues()
        phase1Text.integerValue = Int(sender.doubleValue)
        DrawingWav1.needsDisplay = true
    }
   
    
    //***********************************
    // slider Outlets **************

    
    @IBOutlet weak var freq1Out: NSSlider!
    @IBOutlet weak var amp1Out: NSSlider!
    @IBOutlet weak var phase1Out: NSSlider!
    
    
    
    //***********************************
    //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    //***********************************
 
  
   
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        // Insert code here to initialize your application
        
        
        sineWave1.calculateRawValues()
       
       
        

        
        
        
         println("main loop how many times?")
        
        DrawingWav1.testFunction()
        
   DrawingWav1.needsDisplay = true
        
        
     
    } // end main loop
    

    
    
    
    
    
    
    
    
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

