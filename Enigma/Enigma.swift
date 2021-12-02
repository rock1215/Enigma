//
//  Enigma.swift
//  Enigma
//
//

import Foundation

enum Day: String, CaseIterable {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, Unknown
}

struct Enigma {
    
    var crypto = [String: String]()
    
    init() {} //DO NOT MODIFY THE INITIALIZER
    
    // MARK: - TASK 1
    // Get the current day name in the form of the enumeration above. Example: "Tuesday" would be Day.Tuesday
    func getCurrentDay() -> Day {
        return .Unknown
    }
    
    // MARK: - TASK 2
    // Load the corresponding encryption keys for the current day from the "DAY_NAME.TXT" file. For example:
    // for Wednesday you would need to load wednesday.txt.
    // Once loaded parse the keys and fill the 'crypto' dictionary with alphabet letters as the keys and their
    // encrypted representations as the values.
    
    mutating func loadEncryptionKeys(for day: Day) {

    }
    
    // MARK: - TASK 3
    // Fill out the encryption function below which accepts a String and returns an encrypted version of that
    // String. Each letter of the String should be encrypted using the encryption keys. Exmaple letter 'a' could be
    // encrypted as 'de4' depending on todays Day and the keys loaded.
    // Example if the method gets the word 'Hello' passed in it should return the encrypted version which could be
    // 'lzxpasbvcbvcgf3' depending on todays Day and the keys loaded.
    // Remember that letters need to be lowercase before encrypting.
    // Remember that the space character needs to be encrypted using the '-' key from crypto keys.
    // Please note that the characters that are allowed to be encrypted are only:
    // 'abcdefghijklmnopqrstuvwxyz0123456789 ' you should ignore any other characters that are passed in.
    // Example Devsk..iller should only encrypt 'devskiller' and ignore the .. in the middle.
    
    mutating func encrypt(message: String) -> String {
        return ""
    }
    
    // MARK: - TASK 4
    // Fill out the decryption function below which accepts a String which is already encrypted using todays keys.
    // Every three character of the String is one letter in the decrypted String. Example: 'de4' could be the
    // letter 'a' depending on todays Day and the keys loaded.
    // Remember that the space character needs to be changed from '-' to ' '
    // Remember that letters need to be lowercase before decrypting.
    // If the message cannot be decrypted it should return the errorMessage variable's value
    
    func decrypt(message: String) -> String {
        let errorMessage = "MESSAGE INCORRECTLY ENCRYPTED" //PLEASE DO NOT MODIFY THIS CONSTANT's VALUE
        return ""
    }
    
}

