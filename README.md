# Enigma Application

## Introduction

You have been assigned to a cryptographic project called Enigma. The goal is to create an app that has custom encryption and decryption abilities. The keys are supplied to you for the whole week, from Monday till Sunday. Depending on the day of the week, the app is running on the keys required for loading the appropriate ciphering keys from the corresponding files. For example, if it is a Tuesday the app should load the Tuesday.txt keys and load them into the crypto dictionary. You will be required to create the encrypting and decrypting functions that should return a String with either the encrypted or the decrypted message. The space between the words should be encrypted using the '-' key from the encryption keys.

## Task definition

Note : Please do NOT modify any tests unless specifically told to do so.
Note : Please do NOT modify the function declarations and return types. 

Your task is to implement the following features of the app:

1.  Get the current day name in the form of the enumeration declared in Enigma.swift. For example: "Tuesday" would 
	be Day.Tuesday.

`func getCurrentDay() -> Day`

2.  Load the corresponding encryption keys for the current day from the "DAY_NAME.TXT" file. For example:
    for Wednesday you will have to load the Wednesday.txt.
    Once loaded, parse the keys and fill in the 'crypto' dictionary with alphabet letters as the keys and their
    encrypted representations as the values.

`mutating func loadEncryptionKeys(for day: Day)`

3.  Fill in the encryption function below that accepts a String and returns an encrypted version of that
    String. Each letter of the String should be encrypted using the encryption keys. For example, letter 'a' could be
    encrypted as 'de4' depending on today’s Day and the keys loaded. For example, if the method gets the word 'Hello', it should return the encrypted version which could be 'lzxpasbvcbvcgf3' depending on today’s Day and the keys loaded.
    Remember that the letters have to be lowercased before encrypting.
    Remember that the space character has to be encrypted with the '-' key from the crypto keys dictionary.
    Please note that only the following characters can be encrypted:
    'abcdefghijklmnopqrstuvwxyz0123456789 ' (alphanumeric and space), therefore you should ignore any other characters that 
    are passed.
    For example, 'Devsk..iller' should only be encrypted as 'devskiller' and the '.. ' in the middle should be ignored.

`mutating func encrypt(message: String) -> String`

4.  Fill in the decryption function below that accepts a String which is already encrypted using today’s keys.
    Every three characters of the String can be one letter in the decrypted String. For example, 'de4' could be 
    letter 'a' depending on today’s Day and the keys loaded.
    Remember that the space character needs to be changed from '-' to ' '.
    If the message cannot be decrypted, it should return the errorMessage variable value.

`func decrypt(message: String) -> String`

5.  Fix the setup function in the EncryptionView.swift file in order to be able to display the encryption view when the app launches.
	It should show the keys loaded for the current day. For example,
    "Keys loaded today: Monday".
    Do not set any constrains in the setup function.
    Add the corresponding views as follows:
    add the subStackView as the first childView of the encryptionView and then add the subStackView children as follows:
              1 - loadedKeysLbl, 2 - messageTxtView, 3 - encryptDecryptCtrl, 4 – encryptDecryptButton.
    Lastly, add the processedMessageTxtView as a second child of the encryptionView.

`func setup()`

6.  Fill in the encryptDecryptChanged function to update the title of the encryptDecryptButton depending on what 
	is selected on the encryptDecryptCtrl UISegmentedControl. If the selected item is "ENCRYPT", the title of the 
	button should be also "ENCRYPT", whereas if "DECRYPT" is selected then the button title should be "DECRYPT".

`@objc func encryptDecryptChanged(_ sender: UISegmentedControl)`

7.  Fill in the processMessage function in order to process the message from the messageTxtView as it should either encrypt 
	or decrypt depending on the selection in the segmented control. The output needs to be shown in the 
	processedMessageTxtView.

`@objc func processMessage()`


# Hints

1. In order to pass tests, please do not modify the encryption keys.
2. Think of invalid input calls for your app. 
