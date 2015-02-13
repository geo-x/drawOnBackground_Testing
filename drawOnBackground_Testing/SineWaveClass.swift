//
//  SineWaveClass.swift
//  drawOnBackground_Testing
//
//  Created by george on 12/02/2015.
//  Copyright (c) 2015 george. All rights reserved.
//

import Cocoa
import Foundation

class SineWave{

    //Properties **************************
    
    var wavAmplitude:Double
    var wavFrequency:Double
    var wavPhase:Int
    
    var wavRawValueArray = [Double]()
    var phaseAdjustedValueArray = [Double]()
    
    
   

    
   //Methods ******************************
    
    init(){
        wavAmplitude = 1
        wavFrequency = 3000
        wavPhase = 0
        
        for i in 0...360 {
            self.phaseAdjustedValueArray.append(0)
        }
        
        
    } // end init
    
//*******************************
    
    func calculateRawValues ()  {
     
   
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
            
            println("the index here is\(i)")
           
            println("the rv index here is\(i)")
            println("the pa index here is\(i-startDegreeOffset)")
            println("  ")
            
            self.phaseAdjustedValueArray[(i-startDegreeOffset)] = self.wavRawValueArray[i]
        }
        
        for i in 1...(360 - self.wavPhase){
            
            println("the index here is\(i)")
           
            println("the rv index here is\(i-1)")
            println("the pa index here is\(self.wavPhase + i)")
            println("  ")
            
            self.phaseAdjustedValueArray[(self.wavPhase + i)] = self.wavRawValueArray[(i-1)]

        }
  
        
    }
    
    // NOTE  when a wave is 30 degrees out of phase, it is delayed by 30 degrees.. so now 330 aligns to zero degrees on the reference wave

    
    
//*******************************
    
   
  
//********************************
    
} //end class
