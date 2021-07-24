//
//  MainViewController.swift
//  SB_HW2.2
//
//  Created by Vladislav Kulak on 23.07.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewBackground(color: UIColor)
}

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SettingsViewController else { return }
        destination.colorArea = view.backgroundColor
        destination.delegate = self
        
    }
    
    
    @IBAction func settingsBtnPressed() {
        performSegue(withIdentifier: "goToSettings", sender: nil)
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
    }
    
    
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewBackground(color: UIColor) {
        view.backgroundColor = color
    }
}
