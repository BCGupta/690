//
//  AlphaNumericCeaserCipher.swift
//  SpyApp
//
//  Created by Shubham Gupta on 9/14/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//


import Foundation


extension Dictionary where Value: Equatable {
    /// Returns all keys mapped to the specified value.
    /// ```
    /// let dict = ["A": 1, "B": 2, "C": 3]
    /// let keys = dict.keysForValue(2)
    /// assert(keys == ["B"])
    /// assert(dict["B"] == 2)
    /// ```
    func keysForValue(value: Value) -> [Key] {
        return compactMap { (key: Key, val: Value) -> Key? in
            value == val ? key : nil
        }
    }
}



struct AlphaNumericCeaserCipher: Cipher {


   func encode(_ plaintext: String, secret: String) -> String? {
     
        let alphabet = "ABCDEFGHIJKLMNOPQRDTUVWXYZ0123456789"
        let alphabetArray = Array(alphabet)
    let alphaNinput = ["A":0, "B":2, "C":3, "D":4, "E":5, "F":6, "G":7, "H":8, "I":9, "J":10, "K":11,"L":12, "M":13,"N":14,"O":15, "P":16,"Q":17,"R":18, "S":19, "T":20, "U":21,"V":22,"W":23,"X":24,"Y":25,"Z":26, "0":27, "1":28, "2":29, "3":30, "4":31, "5":32, "6":33, "7":34, "8":35, "9":36]
        
        guard let shiftBy = Int(secret) else {
            return nil
        }
        var encoded = ""
        let uppercasedInput = plaintext.uppercased()

        for character in uppercasedInput {
            let number: Int? = alphaNinput[String(character)]
            let shiftedNumber = number! + shiftBy
            if shiftedNumber > 36 {
               let newShift = (shiftedNumber - 36) - 1
            encoded.append(alphabetArray[newShift])
            }
            if shiftedNumber < 36 {
                encoded.append(alphabetArray[shiftedNumber - 1])
            }
        }
        
        return encoded
        
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        
        let alphabet = "ABCDEFGHIJKLMNOPQRDTUVWXYZ0123456789"
        let alphabetArray = Array(alphabet)
        let alphaNinput = ["A":0, "B":2, "C":3, "D":4, "E":5, "F":6, "G":7, "H":8, "I":9, "J":10, "K":11,"L":12, "M":13,"N":14,"O":15, "P":16,"Q":17,"R":18, "S":19, "T":20, "U":21,"V":22,"W":23,"X":24,"Y":25,"Z":26, "0":27, "1":28, "2":29, "3":30, "4":31, "5":32, "6":33, "7":34, "8":35, "9":36]
        
        guard let shiftBy = Int(secret) else {
            return nil
        }
        var decoded = ""
        let uppercasedInput = plaintext.uppercased()
        
        for character in uppercasedInput {
            
            let number: Int? = alphaNinput[String(character)]
            let shiftedNumber = number! - shiftBy + shiftBy
            if shiftedNumber < 0 {
                let newShift = (shiftedNumber + 36) - 1
                decoded.append(alphabetArray[newShift])
            }
            else{
                decoded.append(alphabetArray[shiftedNumber])
            }
           
        }
        
        return decoded
        
    }

}
