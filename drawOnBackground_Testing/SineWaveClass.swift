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
    
    var wavAmplitude:Double
    var wavFrequency:Double
    var wavPhase:Int
    
    var wavRawValueArray = [Double]()
    var phaseAdjustedValueArray = [Double]()
    
    
   

    
   //Methods ******************************
    
    init(){
        wavAmplitude = 0.5
        wavFrequency = 3000
        wavPhase = 180
        
        for i in 0...360 {
            self.phaseAdjustedValueArray.append(0)
        }
        
        
    } // end init
    
//*******************************
    
public func calculateRawValues ()  {
     
   
      var instantaneousAmpValue :Double
        
        for i in 0...360 {
            var degreeCount:Double = Double(i)
            instantaneousAmpValue = Double(sin(degreeCount * pi / 180))
            instantaneousAmpValue = instantaneousAmpValue * self.wavAmplitude
            
            self.wavRawValueArray.append(instantaneousAmpValue)
            
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
  
        println("  now got here")
    }
    
    // NOTE  when a wave is 30 degrees out of phase, it is delayed by 30 degrees.. so now 330 aligns to zero degrees on the reference wave

    
    
//*******************************
    
   
  
//********************************
    
} //end class








class WaveView1: NSView {
    
   
    
    var sineWave1 = SineWave()
   
//    var sineWave2 = SineWave()
//    var sineWave3 = SineWave()
    
    
 
    
    func testFunction(){
        
        println(" test function has been called by an instance of WaveView1")
    }
    
    
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        
     

        println("how many times?")
        
//**************************************************************************

        sineWave1.calculateRawValues()
        
           var path = NSBezierPath()

       
          path.lineWidth = 1
       
          var startPoint:NSPoint =  NSPoint(x:(Double(0 ) * 0.15) , y: Double(sineWave1.phaseAdjustedValueArray[0] * Double(100)) + Double(140))
        
        
      
// *** initialize start point
        
            path.moveToPoint( startPoint )
        
// *** draw points in array
        
            for i in 0...360{
        
                path.lineToPoint( NSPoint(x:(Double(i ) * 0.15 ) , y: Double(sineWave1.phaseAdjustedValueArray[i] * Double(100)) + Double(140)))
                
                
                path.stroke()
        
                //path.lineToPoint( NSPoint(x:Int((Double(i ) * 0.5 )) , y: Int(Double(sineWave1.wavRawValueArray[i] * Double(100)) + Double(140))))
                                
                
                                
                

                          } // end for
                
    } //end drawrect
    
}//end class


