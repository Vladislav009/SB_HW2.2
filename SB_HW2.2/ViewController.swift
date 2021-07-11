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
        
        
        setSliderToLabel(label: redLabel, slider: redSlider)
        setSliderToLabel(label: greenLabel, slider: greenSlider)
        setSliderToLabel(label: blueLabel, slider: blueSlider)
        
        paintArea()
    }
    
    
    @IBAction func redSliderAction() {
        setSliderToLabel(label: redLabel, slider: redSlider)
        
        paintArea()
    }
    
    @IBAction func greenSliderAction() {
        setSliderToLabel(label: greenLabel, slider: greenSlider)
        
        paintArea()
    }
    
    @IBAction func blueSliderAction() {
        setSliderToLabel(label: blueLabel, slider: blueSlider)
        
        paintArea()
    }
    
    private func setSliderToLabel(label: UILabel, slider: UISlider) {
        label.text = String(rounded(value: slider.value))
    }
    
    private func rounded(value: Float) -> Float {
         round(100 * value) / 100
    }
    
    private func paintArea(){
        areaToBePainted.backgroundColor = UIColor(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
}

