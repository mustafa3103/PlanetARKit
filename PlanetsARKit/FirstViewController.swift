//
//  FirstViewController.swift
//  PlanetsARKit
//
//  Created by Mustafa on 11.07.2022.
//

import UIKit

class FirstViewController: UIViewController {

    //First screen of application. Here you select the planet name after that you'll see the that planet in real world.
    
    @IBOutlet var pickerView: UIPickerView!
    
    var planets = ["ceres", "earthDay", "earthNight", "jupiter", "mars", "moon", "neptune", "saturn", "sun", "venus"]
    var currentPlanet = "ceres"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    @IBAction func goButtonClicked(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toSecond", sender: self)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            let vc = segue.destination as! ViewController
            vc.planetName = currentPlanet
        }
    }

}

extension FirstViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentPlanet = planets[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return planets[row]
    }
}

extension FirstViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return planets.count
    }
}
