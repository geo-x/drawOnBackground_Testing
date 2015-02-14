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
        
        DrawingView.lockFocus()
        var path = NSBezierPath()
        path.lineWidth = 0.2
        
        
        var somePoint:NSPoint = NSPoint(x:1, y:1)
        
        var startPoint:NSPoint =  NSPoint(x:(Double(0 ) * 0.1) , y: Double(sineWave1.wavRawValueArray[0] * Double(100)) + Double(140))
        
        var nextRequiredXValue:Int = 1
        var currentXValue:Int = 0
        
        
        //initialize start and end points
        
        path.moveToPoint(NSPoint(x:100 ,y:0))
        path.lineToPoint(NSPoint(x:102 ,y:300))
        
        path.moveToPoint(NSPoint(x:200.5 ,y:0.5))
        path.lineToPoint(NSPoint(x:202.5 ,y:300.5))
        
        
        
        path.moveToPoint( startPoint)

        
        
        
        for i in 1...360{
            
            println("index is \(i) curent X value is \(currentXValue) and the next required x Value is \(nextRequiredXValue)")
            

            if currentXValue >= nextRequiredXValue{
            
                
                println(" in loop current x equals \(currentXValue)  and the point here is \( NSPoint(x:Int((Double(i ) * 0.1 )) , y: Int(Double(sineWave1.wavRawValueArray[i] * Double(100)) + Double(140))))")
                nextRequiredXValue = nextRequiredXValue + 1
                
                //path.lineToPoint( NSPoint(x:(Double(i ) * 0.1 ) , y: Double(sineWave1.wavRawValueArray[i] * Double(100)) + Double(140)))
                
                 path.lineToPoint( NSPoint(x:Int((Double(i ) * 0.5 )) , y: Int(Double(sineWave1.wavRawValueArray[i] * Double(100)) + Double(140))))
                

                
                path.stroke()
                
            }
            
            
            currentXValue = Int((Double(i ) * 0.5))
            
            //DrawingView.unlockFocus()
            
           
        }
       
        

        
        
        
    }

    
    
    
    
    
    
    
    
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

