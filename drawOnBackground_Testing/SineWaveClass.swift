//
//  SineWaveClass.swift
//  drawOnBackground_Testing
//
//  Created by george on 12/02/2015.
//  Copyright (c) 2015 george. All rights reserved.
//

import Cocoa
import Foundation

public class SineWave{

    //Properties **************************
    
    var wavAmplitude:Float
    public var wavFrequency:Float
    var wavPhase:Int
    
    // create empty arrays using initializer syntax
    
    var wavRawValueArray = [Float]()
    public var phaseAdjustedValueArray = [Float]()
    
    
   

    
   //Methods ******************************
    
    init(){
        wavAmplitude = 0.5
        wavFrequency = 400
        wavPhase = 0
        
        // load wavRawValue array with dummy values
        for i in 0...360 {
            self.wavRawValueArray.append(0.0)
            self.phaseAdjustedValueArray.append(0.0)
        }
        
        
    } // end init
    
//*******************************
    
public func calculateRawValues ()  {
     
   
      var instantaneousAmpValue :Float
        
        for i in 0...360 {
            var degreeCount:Int = i
            instantaneousAmpValue = Float(sin(Float(degreeCount) * Float(pi) / Float(180)))
            instantaneousAmpValue = instantaneousAmpValue * self.wavAmplitude
            
            self.wavRawValueArray[i] = instantaneousAmpValue
            
            }
        
      
      self.adjustValuesForPhase()
    }
    
//******************************

    func adjustValuesForPhase (){
        
        var startDegreeOffset:Int = 360 - self.wavPhase

        for i in startDegreeOffset...360 {
            
//            println("the index here is\(i)")
//            println("the rv index here is\(i)")
//            println("the pa index here is\(i-startDegreeOffset)")
//            println("  ")
            
            self.phaseAdjustedValueArray[(i-startDegreeOffset)] = self.wavRawValueArray[i]
        }
        
        for i in 1...(360 - self.wavPhase){
            
//            println("the index here is\(i)")
//            println("the rv index here is\(i-1)")
//            println("the pa index here is\(self.wavPhase + i)")
//            println("  ")
            
            self.phaseAdjustedValueArray[(self.wavPhase + i)] = self.wavRawValueArray[(i-1)]

        }
  
  
    }
    
    // NOTE  when a wave is 30 degrees out of phase, it is delayed by 30 degrees.. so now 330 aligns to zero degrees on the reference wave

    
    
//*******************************
    
   
  
//********************************
    
} //end class








class WaveView1: NSView {
    
    var verticalScale: Int = 100
    
    var timeScale:Float = 2.5 // x axis time scale in milliseconds ( in this case 1/4 cycle of 100 Hz)
    
    
    var scaleFactor:Float {
        
        return ((1/sineWave1.wavFrequency*1000)/self.timeScale)
        
    }
    
    
  
    
    
    var degreesToFillDisplay:Int {
        return Int(360 * timeScale / (1 / sineWave1.wavFrequency * 1000))
    }
    
    
    var completeCyclesDisplayed:Int {
        return Int(degreesToFillDisplay / 360)
    }
    
    
    
    func testFunction(){
        
        //println(" test function has been called by an instance of WaveView1 and the scaleFactor is \(self.scaleFactor)")
        //println(" and the number of degrees to display is \( degreesToFillDisplay) and the number of complete cycles is \(completeCyclesDisplayed) ")
    }
    
 //*********************************************************************
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
    
        
        //println(" test function has been called by an instance of WaveView1 and the scaleFactor is \(self.scaleFactor)")
        //println(" and the number of degrees to display is  \( degreesToFillDisplay) and the number of complete cycles is \(completeCyclesDisplayed)")
        
        
        var path = NSBezierPath()
      
        
        path.lineWidth = 1
        
        //var startPoint: NSPoint =  NSPoint(x:(Float(0 ) * Float(self.scaleFactor)) , y: Float(sineWave1.phaseAdjustedValueArray[0]) * Float(verticalScale) + Float(140))
        
    var startPointX: CGFloat {
        return (CGFloat(0) * CGFloat(self.scaleFactor))
        
          }
        
        var startPointY:CGFloat {
            
            return ( CGFloat(sineWave1.phaseAdjustedValueArray[0]) * CGFloat(verticalScale) + CGFloat(140))
        }
        
  
        
    var startPoint: NSPoint =  NSPoint( x: startPointX , y: startPointY)
        
       var lastPoint:NSPoint = startPoint
        
        
        
        // *** initialize start point
        
        path.moveToPoint( startPoint )
        
        // *** draw points in array for first complete cycle
        
        
        for j in 0...completeCyclesDisplayed{
        
        for i in 0...360{
            
            var nextPointX: CGFloat {
                
                return (CGFloat(i) * CGFloat(self.scaleFactor) + CGFloat(self.scaleFactor) * CGFloat(360) * CGFloat(j) )
            }
            
            var nextPointY: CGFloat {
                
                return ( CGFloat((sineWave1.phaseAdjustedValueArray[i] * 100) + 140))
            }
            
           
           
           path.lineToPoint( NSPoint(x: nextPointX, y: nextPointY))
           
            path.stroke()
            
            
        } // end for degrees loop
        
       
        
        } //cycles loop
        
    } //end drawrect
    
} //end class


