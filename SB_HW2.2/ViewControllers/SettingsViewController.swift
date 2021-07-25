//
//  ViewController.swift
//  SB_HW2.2
//
//  Created by Vladislav Kulak on 10.07.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var areaToBePainted: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var colorArea: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        
        areaToBePainted.backgroundColor = colorArea
        
        setValueLabel()
        setValueTF()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func doneBtnPressed() {
        delegate.setNewBackground(color: areaToBePainted.backgroundColor ?? UIColor.white)
    }
    
    @IBAction func slidersAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redLabel.text = string(from: sender)
            redTF.text = string(from: sender)
        case greenSlider:
            greenLabel.text = string(from: sender)
            greenTF.text = string(from: sender)
        default:
            blueLabel.text = string(from: sender)
            blueTF.text = string(from: sender)
        }
        
        paintArea()
    }
    
    
    private func string(from slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    private func paintArea(){
        areaToBePainted.backgroundColor = UIColor(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
    
    private func setValueLabel(){
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    private func setValueTF(){
        redTF.text = string(from: redSlider)
        greenTF.text = string(from: greenSlider)
        blueTF.text = string(from: blueSlider)
    }
}


// MARK: - TextField methods

extension SettingsViewController: UITextFieldDelegate {
    
    // Добавил этот метод для удобства работы с клавиатурой ноутбука
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case redTF:
            greenTF.becomeFirstResponder()
        case greenTF:
            blueTF.becomeFirstResponder()
        default:
            doneButtonAction()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        addDoneButtonOnKeyboard(textField)
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            
            switch textField {
            case redTF:
                redSlider.value = currentValue
            case greenTF:
                greenSlider.value = currentValue
            default:
                blueSlider.value = currentValue
            }
            
            paintArea()
            setValueLabel()
            
        } else {
            showAlert(title: "Ooops!", message: "Field must be float!")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Add button to keyboard

extension SettingsViewController {
    
    func addDoneButtonOnKeyboard(_ textField: UITextField) {
        let doneToolbar: UIToolbar = UIToolbar()
        textField.inputAccessoryView = doneToolbar
        doneToolbar.sizeToFit()
        
        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
            target: nil,
            action: nil
        )
        
        let doneBtn: UIBarButtonItem  = UIBarButtonItem(
            title: "Done",
            style: UIBarButtonItem.Style.done,
            target: self,
            action: #selector(doneButtonAction)
        )
        
        doneToolbar.items = [flexSpace, doneBtn]
    }
    
    @objc func doneButtonAction() {
        view.endEditing(true);
    }
}
