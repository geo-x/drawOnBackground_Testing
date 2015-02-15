//
//  relatedClasses.swift
//  drawOnBackground_Testing
//
//  Created by george on 15/02/2015.
//  Copyright (c) 2015 george. All rights reserved.
//

import Foundation


 class SomeClass {
    
    
    
    
    
    
    
    
    internal func doSomethingInternal() -> () {
        println("SomeClass::doSomethingInternal() called.")
    }
    
    func doSomethingDefault() -> () {
        println("SomeClass::doSomethingDefault() called.")
    }
    
    private func doSomethingPrivate() -> () {
        println("SomeClass::doSomethingPrivate() called.")
    }
    
}



class SomeOtherClass {
    
    let someClassInstance = SomeClass()
    private let hiddenClassInstance = HiddenClass()
    
    func usePrivateMethodInSameFileDifferentClass() -> () {
        someClassInstance.doSomethingPrivate()
    }
    
}

private class HiddenClass {
    
}

