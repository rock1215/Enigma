//
//  EncryptionView.swift
//  Enigma
//
//

import UIKit

final class EncryptionView: UIStackView {
    
    var enigma = Enigma()
    
    let subStackView: UIStackView = {
       let stckView = UIStackView()
        stckView.axis = .vertical
        stckView.distribution = .fillEqually
        stckView.spacing = 8.0
        stckView.translatesAutoresizingMaskIntoConstraints = false
        stckView.accessibilityIdentifier = Identifiers.subStackView
        return stckView
    }()
    
    let loadedKeysLbl: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFontMetrics(forTextStyle: UIFont.TextStyle.body).scaledFont(for: UIFont(name: "Helvetica-Bold", size: 14)!)
        lbl.accessibilityIdentifier = Identifiers.loadedKeysLbl
        return lbl
    }()
    
    let messageTxtView: UITextView = {
        let txtView = UITextView(frame: .zero)
        txtView.font = UIFontMetrics(forTextStyle: UIFont.TextStyle.body).scaledFont(for: UIFont(name: "Helvetica-Bold", size: 14)!)
        txtView.textColor = .white
//        txtView.isScrollEnabled = true
        txtView.layer.cornerRadius = 5
        txtView.backgroundColor = .gray
        txtView.accessibilityIdentifier = Identifiers.messageTxtView
        return txtView
    }()
    
    let encryptDecryptCtrl: UISegmentedControl = {
       let segmntCtrl = UISegmentedControl(items: ["ENCRYPT", "DECRYPT"])
        segmntCtrl.tintColor = .white
        segmntCtrl.selectedSegmentIndex = 0
        segmntCtrl.addTarget(self, action: #selector(encryptDecryptChanged(_:)), for: .valueChanged)
        segmntCtrl.accessibilityIdentifier = Identifiers.encryptDecryptSegCtrl
        return segmntCtrl
    }()
    
    let encryptDecryptButton: UIButton = {
       let btn = UIButton()
        btn.setTitle("ENCRYPT", for: .normal)
        btn.layer.cornerRadius = 5
        btn.backgroundColor = .white
        btn.setTitleColor(.gray, for: .normal)
        btn.addTarget(self, action: #selector(processMessage), for: .touchUpInside)
        btn.accessibilityIdentifier = Identifiers.encryptDecryptButton
        return btn
    }()
    
    let processedMessageTxtView: UITextView = {
       let txtView = UITextView(frame: .zero)
        txtView.font = UIFontMetrics(forTextStyle: UIFont.TextStyle.body).scaledFont(for: UIFont(name: "Helvetica-Bold", size: 20)!)
        txtView.textColor = .white
        txtView.isScrollEnabled = true
        txtView.layer.cornerRadius = 5
        txtView.backgroundColor = .gray
        txtView.accessibilityIdentifier = Identifiers.processedMessageTxtView
        return txtView
    }()

    init() {
        super.init(frame: .zero)

        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 8.0
        accessibilityIdentifier = Identifiers.encryptionView
        translatesAutoresizingMaskIntoConstraints = false

        // MARK: - Task 5
        // 5 - Fix the setup function by adding the necessary code to ensure that the encryption view is appearing
        // on the app's main screen. It should show the keys loaded today for example:
        // "Keys loaded today: Monday"
        // You shouldn't set any constrains in the setup function.
        // You need to add the corresponding views as follows:
        // add subStackView as the first childView of the encryptionView and then add subStackView's children as follows:
        //          1 - loadedKeysLbl, 2 - messageTxtView, 3 - encryptDecryptCtrl, 4 - encryptDecryptButton
        // lastly add the processedMessageTxtView as a second child of encryptionView

        loadedKeysLbl.text = "Keys loaded today: \(self.enigma.getCurrentDay().rawValue)" // Fix to show the missing day name of the loaded key
        
        self.enigma.loadEncryptionKeys(for: self.enigma.getCurrentDay())
        
        self.addArrangedSubview(self.subStackView)
        
        self.subStackView.addArrangedSubview(self.loadedKeysLbl)
        self.subStackView.addArrangedSubview(self.messageTxtView)
        self.subStackView.addArrangedSubview(self.encryptDecryptCtrl)
        self.subStackView.addArrangedSubview(self.encryptDecryptButton)
        
        self.addArrangedSubview(self.processedMessageTxtView)
    }
    
    
    // MARK: - TASK 6
    // 6 - Fill the function below to update the title of the encryptDecryptButton depending on what is selected on the encryptDecryptCtrl UISegmentedControl. If the selected item is "ENCRYPT" the title of the button should be also "ENCRYPT", else if "DECRYPT" is selected then "DECRYPT" should be the button's title.
    @objc func encryptDecryptChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.encryptDecryptButton.setTitle("ENCRYPT", for: .normal)
        } else if sender.selectedSegmentIndex == 1 {
            self.encryptDecryptButton.setTitle("DECRYPT", for: .normal)
        }
    }
    
    //MARK: - TASK 7
    // 7 - Fill in the function below in order to process the message from messageTxtView it should either encrypt or decrypt depending on the selection in the segmented control. The output needs to be shown in the processedMessageTxtView
    @objc func processMessage() {
        if self.encryptDecryptButton.title(for: .normal) == "ENCRYPT" {
            self.processedMessageTxtView.text = self.enigma.encrypt(message: self.messageTxtView.text)
        } else {
            self.processedMessageTxtView.text = self.enigma.decrypt(message: self.messageTxtView.text)
        }
    }
    
}
