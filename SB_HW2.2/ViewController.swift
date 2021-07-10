//
//  ViewController.swift
//  SB_HW2.2
//
//  Created by Vladislav Kulak on 10.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var areaToBePainted: UIView!
   
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        
        self.paintArea(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value))
    }


    @IBAction func redSliderAction() {
        redLabel.text = String(self.rounded(value: redSlider.value))
        
        self.paintArea(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value))
    }
    
    @IBAction func greenSliderAction() {
        greenLabel.text = String(self.rounded(value: greenSlider.value))
        
        self.paintArea(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value))
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = String(self.rounded(value: blueSlider.value))
        
        self.paintArea(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value))
    }
    
    private func rounded(value: Float)->Float {
        return round(100 * value) / 100
    }
    
    private func paintArea(red: CGFloat, green: CGFloat, blue: CGFloat){
        areaToBePainted.backgroundColor = UIColor(
            displayP3Red: red,
            green: green,
            blue: blue,
            alpha: 1.0
        )
    }
}

