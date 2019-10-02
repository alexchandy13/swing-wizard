//
//  AddItem.swift
//  master
//
//  Created by Alex Chandy on 2/13/19.
//  Copyright © 2019 Alex Chandy. All rights reserved.
//

import UIKit

class AddItem: UIViewController, UITextFieldDelegate
    ,UIPickerViewDataSource, UIPickerViewDelegate {
  
    var currentTextField = UITextField()
    var pickerView = UIPickerView()
    
    
    @IBOutlet weak var inputProblem: UITextField!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var inputZone: UITextField!
    @IBOutlet weak var inputType: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var pickProblem: UIPickerView!
    @IBOutlet weak var pickField: UIPickerView!
    @IBOutlet weak var pickZone: UIPickerView!
    @IBOutlet weak var pickType: UIPickerView!
    
    
    var problemType = ["Trouble Hitting for Power", "Trouble Making Contact", "Too Many Groundballs", "Too Many Flyballs"]
    var fieldArea = ["Pull Side", "Push Side"]
    var zoneArea = ["High", "Inside", "Outside", "Low"]
    var pitchType = ["Fastballs", "Breaking Balls"]
    
    //var isPicked = false
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int!
        if pickerView == pickProblem {
            countrows = self.problemType.count
        } else if pickerView == pickField {
            countrows = self.fieldArea.count
        } else if pickerView == pickZone {
            countrows = self.zoneArea.count
        } else if pickerView == pickType {
            countrows = self.pitchType.count
            // PROOF THAT ALEX DID SOMETHING SMART
        }
        return countrows
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //var titlerow : String!
        if pickerView == pickProblem {
            let titlerow = problemType[row]
            return titlerow
        } else if pickerView == pickField {
            let titlerow = fieldArea[row]
            return titlerow
        } else if pickerView == pickZone {
            let titlerow = zoneArea[row]
            return titlerow
        } else if pickerView == pickType {
            let titlerow = pitchType[row]
            return titlerow
        } else {
            return ""
        }
        

    }
//
//
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //doneButton.isEnabled = false
//        var selectedProblem : Bool!
//        var selectedField : Bool!
//        var selectedZone : Bool!
//        var selectedType : Bool!
        if pickerView == pickProblem {
            self.inputProblem.text = problemType[row]
            self.pickProblem.isHidden = true
//            selectedProblem = true
//            doneButton.isEnabled = true
        } else if pickerView == pickField {
            self.inputField.text = fieldArea[row]
            self.pickField.isHidden = true
//            selectedField = true
        } else if pickerView == pickZone {
            self.inputZone.text = zoneArea[row]
            self.pickZone.isHidden = true
//            selectedZone = true
        } else if pickerView == pickType {
            self.inputType.text = pitchType[row]
            self.pickType.isHidden = true
//            selectedType = true
        }
        
//        if selectedProblem == true {
//            if selectedField == true {
//                if selectedZone == true {
//                    if selectedType == true {
//                        doneButton.isEnabled = true
//                    }
//                }
//            }
//        }
        

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == inputProblem {
            self.pickProblem.isHidden = false
            self.pickField.isHidden = true
            self.pickZone.isHidden = true
            self.pickType.isHidden = true
            self.view.endEditing(true)
        } else if textField == inputField {
            self.pickField.isHidden = false
            self.pickProblem.isHidden = true
            self.pickZone.isHidden = true
            self.pickType.isHidden = true
            self.view.endEditing(true)
        } else if textField == inputZone {
            self.pickZone.isHidden = false
            self.pickField.isHidden = true
            self.pickProblem.isHidden = true
            self.pickType.isHidden = true
            self.view.endEditing(true)
        } else if textField == inputType {
            self.pickType.isHidden = false
            self.pickField.isHidden = true
            self.pickZone.isHidden = true
            self.pickProblem.isHidden = true
            self.view.endEditing(true)
        }
    }
    
//    func createPickerView() {
//        pickerView.delegate = self
//        inputProblem.inputView = pickerView
//    }
//
//    func dismissPickerView() {
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//
//        let finishPick = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissSelector))
//        toolbar.setItems([finishPick], animated: false)
//        toolbar.isUserInteractionEnabled = true
//        inputProblem.inputAccessoryView = toolbar
//    }
    
    @objc func dismissSelector() {
        view.endEditing(true)
        //doneButton.isEnabled = true
    }
    var selectedProblem : String?
    var selectedField : String?
    var selectedZone : String?
    var selectedType : String?
    
   
    
    @objc
    @IBAction func addItem() -> Void {
        let newProblem = inputProblem.text!
        let newField = inputField.text!
        let newZone = inputZone.text!
        let newType = inputType.text!
        
        let newItem = Item(problem: newProblem, field: newField, zone: newZone, type: newType)
        
        Storage.shared.objects.append(newItem)
        //performSegue(withIdentifier: "backToTable", sender: self)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        //doneButton.isEnabled = true
        inputProblem.resignFirstResponder()
        inputField.resignFirstResponder()
        inputZone.resignFirstResponder()
        inputType.resignFirstResponder()
        doneButton.isEnabled = true
        super.viewDidLoad()
        //createPickerView()
        //inputField.delegate = self
        //doneButton.isEnabled = false
        
        //inputProblem.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        //dismissPickerView()
//        if isPicked == true {
//            doneButton.isEnabled = true
//        } else {
//            doneButton.isEnabled = false
//        }
        
    }
 /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        return allowedCharacters.isSuperset(of: characterSet)
    }
    */
    
    
//    @objc func editingChanged(_ textField: UITextField) {
//
//        if textField.text?.count == 1 {
//            if textField.text?.first == " " {
//                textField.text = ""
//                return
//            }
//        }
//        guard
//            let problem = inputProblem.text, !problem.isEmpty
//            else {
//                self.doneButton.isEnabled = false
//                return
//        }
//
//        doneButton.isEnabled = true
//
//    }
 
}
