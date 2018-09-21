//
//  AlphaNumericCeasarCipherTests.swift
//  SpyAppTests
//
//  Created by Shubham Gupta on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class AlphaNumericCeasarCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = CeaserCipher()
}
}

