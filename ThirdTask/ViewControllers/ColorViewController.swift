//
//  ViewController.swift
//  ThirdTask
//
//  Created by Sosin Vladislav on 28.10.2022.
//

import UIKit

final class ColorViewController: UIViewController {
    @IBOutlet weak var currentColorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    
    var delegate: ColorViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentColorView.layer.cornerRadius = 20
        currentColorView.backgroundColor = viewColor
        
        loadSlidersColor(redColorSlider, greenColorSlider, blueColorSlider)
        setLabelsColor()
    }
    
    @IBAction func sliderChange(_ sender: Any) {
        setColor()
        setLabelsColor()
    }

    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
        delegate?.setColor(currentColorView.backgroundColor ?? .gray)
    }
    
    private func setColor() {
        currentColorView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1.0
        )
    }
    
    private func setLabelsColor() {
        redLabel.text = String(format: "%.2f", redColorSlider.value)
        greenLabel.text = String(format: "%.2f", greenColorSlider.value)
        blueLabel.text = String(format: "%.2f", blueColorSlider.value)
    }
    
    private func loadSlidersColor(_ colorSliders: UISlider...) {
        let complexColor = CIColor(color: viewColor)
        
        colorSliders.forEach { slider in
            switch slider {
            case redColorSlider:
                redColorSlider.value = Float(complexColor.red)
            case greenColorSlider:
                greenColorSlider.value = Float(complexColor.green)
            default:
                blueColorSlider.value = Float(complexColor.blue)
            }
        }
    }
}
