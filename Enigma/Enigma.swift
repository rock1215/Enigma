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
        let dayofWeek = Calendar.current.dateComponents([.weekday], from: Date()).weekday
        
        if dayofWeek == 1 {
            return Day.Monday
        } else if dayofWeek == 2 {
            return Day.Tuesday
        } else if dayofWeek == 3 {
            return Day.Wednesday
        } else if dayofWeek == 4 {
            return Day.Thursday
        } else if dayofWeek == 5 {
            return Day.Friday
        } else if dayofWeek == 6 {
            return Day.Saturday
        } else if dayofWeek == 7 {
            return Day.Sunday
        }
        
        return Day.Unknown
    }
    
    // MARK: - TASK 2
    // Load the corresponding encryption keys for the current day from the "DAY_NAME.TXT" file. For example:
    // for Wednesday you would need to load wednesday.txt.
    // Once loaded parse the keys and fill the 'crypto' dictionary with alphabet letters as the keys and their
    // encrypted representations as the values.
    
    mutating func loadEncryptionKeys(for day: Day) {
        self.crypto = [:]

        var fileName = "Monday"

        if day == .Tuesday {
            fileName = "Tuesday"
        } else if day == .Wednesday {
            fileName = "Wednesday"
        } else if day == .Thursday {
            fileName = "Thursday"
        } else if day == .Friday {
            fileName = "Friday"
        } else if day == .Saturday {
            fileName = "Saturday"
        } else if day == .Sunday {
            fileName = "Sunday"
        }

        if let filepath = Bundle.main.path(forResource: fileName, ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                let dataArray = contents.components(separatedBy: "\n")

                for pair in dataArray {
                    let pairArray = pair.components(separatedBy: ";")
                    self.crypto[pairArray[0]] = pairArray[1]
                }

            } catch {
                // contents could not be loaded
            }
        }
    }
//    func loadEncryptionKeys(for day: Day) {
//        var crypto = [String: String]()
//
//        var fileName = "Monday"
//
//        if day == .Tuesday {
//            fileName = "Tuesday"
//        } else if day == .Wednesday {
//            fileName = "Wednesday"
//        } else if day == .Thursday {
//            fileName = "Thursday"
//        } else if day == .Friday {
//            fileName = "Friday"
//        } else if day == .Saturday {
//            fileName = "Saturday"
//        } else if day == .Sunday {
//            fileName = "Sunday"
//        }
//
//        if let filepath = Bundle.main.path(forResource: fileName, ofType: "txt") {
//            do {
//                let contents = try String(contentsOfFile: filepath)
//                let dataArray = contents.components(separatedBy: "\n")
//
//                for pair in dataArray {
//                    let pairArray = pair.components(separatedBy: ";")
//                    crypto[pairArray[0]] = pairArray[1]
//
//
//                }
//
//                print(crypto)
//
//            } catch {
//                // contents could not be loaded
//            }
//        }
//    }
    
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
        let prepared = message.lowercased().replacingOccurrences(of: " ", with: "-")
        
        var result = ""
        
        for cha in prepared {
            if let converted = self.crypto["\(cha)"] {
                result += converted
            }
        }
        
        return result
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
        
        if message.count % 3 != 0 {
            return ""
        }
        
        let prepared = message.lowercased()
        
        let crypedArray = prepared.split(by: 3)
        
        var result = ""
        
        for converted in crypedArray {
            if let original = self.crypto.getKey(for: converted) {
                result += original
            }
        }
        
        result = result.replacingOccurrences(of: "-", with: " ")
        
        return result
    }
    
}

extension String {
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()

        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }

        return results.map { String($0) }
    }
}

