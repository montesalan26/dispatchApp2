//
//  notesController.swift
//  Dispatch_app2
//
//  Created by Alan Montes on 11/25/24.
//

import UIKit

class notesController: UIViewController {
    @IBOutlet weak var temporaryView: UIView!
    @IBOutlet weak var permanentView: UIView!
    @IBOutlet weak var noteStack: UIStackView!
    @IBOutlet weak var writeNotes: UIView!
    @IBOutlet weak var recordNotes: UIView!
    @IBOutlet weak var textViewWrite: UITextView!
    @IBOutlet weak var textWrite: UITextView!
    @IBOutlet weak var notesOne: UILabel!
    @IBOutlet weak var notesTwo: UILabel!
    @IBOutlet weak var notesThree: UILabel!
    @IBOutlet weak var notesFour: UILabel!
    @IBOutlet weak var notesFive: UILabel!
    @IBOutlet weak var saveTextBtn: UIButton!
    @IBOutlet weak var permOne: UILabel!
    @IBOutlet weak var permTwo: UILabel!
    @IBOutlet weak var permThree: UILabel!
    @IBOutlet weak var permFour: UILabel!
    @IBOutlet weak var permFive: UILabel!
    @IBOutlet weak var permSeven: UILabel!
    @IBOutlet weak var permEight: UILabel!
    @IBOutlet weak var permSix: UILabel!
    @IBOutlet weak var loadNumberLabelOne: UILabel!
    @IBOutlet weak var loadNumberTwo: UILabel!
    @IBOutlet weak var loadNumberThree: UILabel!
    @IBOutlet weak var loadNumberFour: UILabel!
    
    
    var labelCounter = 0
       
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           // Ensure the back button is hidden only in this view controller
           self.navigationItem.hidesBackButton = true
           
           // Ensure no left bar button (back button) is set, in case it is manually added by the navigation controller
           self.navigationItem.leftBarButtonItem = nil
           
           loadNumberThree.isHidden = true
           loadNumberFour.isHidden = true
           
           notesOne.isHidden = true
           notesTwo.isHidden = true
           notesThree.isHidden = true
           notesFour.isHidden = true
           notesFive.isHidden = true
           
           permFive.isHidden = true
           permSix.isHidden = true
           permSeven.isHidden = true
           permEight.isHidden = true
           
           temporaryView.layer.cornerRadius = 10
           permanentView.layer.cornerRadius = 10
           noteStack.layer.cornerRadius = 10
           writeNotes.layer.cornerRadius = 10
           recordNotes.layer.cornerRadius = 10
           recordNotes.layer.masksToBounds = true
           textViewWrite.layer.cornerRadius = 10
           textViewWrite.layer.masksToBounds = true
           
           textViewWrite.layer.borderColor = UIColor.black.cgColor
           textViewWrite.layer.borderWidth = 1.0
           textViewWrite.layer.cornerRadius = 5.0
           
           // Add gesture recognizer to dismiss keyboard when tapping outside
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
           view.addGestureRecognizer(tapGesture)
       }
       
       // Action for when the button is pressed
       @IBAction func saveTextButton(_ sender: Any) {
           
           let inputText = textWrite.text
           
           guard let text = inputText, !text.isEmpty else {
               return
           }
           
           switch labelCounter {
           case 0:
               notesOne.text = text
               notesOne.isHidden = false
           case 1:
               notesTwo.text = text
               notesTwo.isHidden = false
           case 2:
               notesThree.text = text
               notesThree.isHidden = false
           case 3:
               notesFour.text = text
               notesFour.isHidden = false
           case 4:
               notesFive.text = text
               notesFive.isHidden = false
           default:
               break
           }
           
           textViewWrite.text = ""
           
           labelCounter += 1
           
           if labelCounter > 4 {
               labelCounter = 0
               dismissKeyboard()
           }
       }

       @objc func dismissKeyboard() {
           textViewWrite.resignFirstResponder()
       }

       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }
   }
