//
//  ViewController.swift
//  ThirdTask
//
//  Created by Sosin Vladislav on 28.10.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentColorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    
    @IBAction func sliderChange(_ sender: Any) {
        updateColorView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateColorView()
    }
    
    private func updateColorView() {
        currentColorView.layer.cornerRadius = 20
        
        currentColorView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1.0
        )
        
        redLabel.text = String(format: "%.2f", redColorSlider.value)
        greenLabel.text = String(format: "%.2f", greenColorSlider.value)
        blueLabel.text = String(format: "%.2f", blueColorSlider.value)
    }
}
