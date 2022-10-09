//
//  OnboardLevel.swift
//  tech-english
//
//  Created by Gustavo Domingues on 29/09/22.
//

import UIKit

import TNCore

class OnboardLevel: TEBaseViewController {
    
    @IBOutlet weak var basicButton: UIButton!
    @IBOutlet weak var intermedButton: UIButton!
    @IBOutlet weak var avancedButton: UIButton!
    
    var presenter = OnboardLevelPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func levelButtonPressed(_ sender: UIButton) {
        switch sender {
            case basicButton:
                presenter.lvlUser = "Básico"
            case intermedButton:
                presenter.lvlUser = "Intermediario"
            case avancedButton:
                presenter.lvlUser = "Avançado"
                default:
                    print("Unknown Button")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
