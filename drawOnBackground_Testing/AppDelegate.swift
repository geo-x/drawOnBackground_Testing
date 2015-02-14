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


    @IBOutlet weak var DrawingView: NSView!
    
     var resultantValueArray = [Double]()
    
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        
        var sineWave1 = SineWave()
        var sineWave2 = SineWave()
        var sineWave3 = SineWave()
        sineWave1.calculateRawValues()
        
        
//        for i in 0...359{
//        println("the value at \(i) degrees is \(sineWave1.phaseAdjustedValueArray[i])")
//        }
        
        
        
        func calculateResultantValues(){
            for i in 0...359{
                resultantValueArray[i] = sineWave1.phaseAdjustedValueArray[i] + sineWave2.phaseAdjustedValueArray[i] + sineWave3.phaseAdjustedValueArray[i]
            }
            
            
        }
        
        println("\(sineWave3.wavPhase) degrees")
        println("\(sineWave3)")
        
        sineWave3.wavPhase = 33
        
          println("\(sineWave3.wavPhase) degrees")
        
// draw test line over graph paper image
//        DrawingView.lockFocus()
//        var path = NSBezierPath()
//        path.lineWidth = 1.0
//        path.moveToPoint( NSPoint(x:0,y:0))
//        path.lineToPoint(( NSPoint(x:200,y:200)))
//        path.stroke()
        
       
        
        
        
        var path = NSBezierPath()
        var somePoint:NSPoint = NSPoint(x:1, y:1)
        
        path.lineWidth = 0.1
        
        var startPoint:NSPoint =  NSPoint(x:(Double(0 ) * 0.15) , y: Double(sineWave1.phaseAdjustedValueArray[0] * Double(100)) + Double(140))
        
      
        
        //initialize start point
        
        DrawingView.lockFocus()
        path.moveToPoint( startPoint)
        
        
        
        for i in 0...360{
            
            
               path.lineToPoint( NSPoint(x:(Double(i ) * 0.15 ) , y: Double(sineWave1.phaseAdjustedValueArray[i] * Double(100)) + Double(140)))
                
                 //path.lineToPoint( NSPoint(x:Int((Double(i ) * 0.5 )) , y: Int(Double(sineWave1.wavRawValueArray[i] * Double(100)) + Double(140))))
                

                
                path.stroke()
        
        } // end for
       
        
//DrawingView.unlockFocus()
  
     
    } // end main loop
    

    
    
    
    
    
    
    
    
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

