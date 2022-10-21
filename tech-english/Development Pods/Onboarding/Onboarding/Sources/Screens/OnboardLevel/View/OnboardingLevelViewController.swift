//
//  OnboardLevel.swift
//  tech-english
//
//  Created by Gustavo Domingues on 29/09/22.
//

import UIKit
import TNCore

class OnboardingLevelViewController: TEBaseViewController {
    
    @IBOutlet weak var basicButton: UIButton!
    @IBOutlet weak var intermedButton: UIButton!
    @IBOutlet weak var avancedButton: UIButton!
    var getLevel: String?
    var presenter: OnboardingLevelPresenter?
    
    init(presenter: OnboardingLevelPresenter) {
        self.presenter = presenter
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func levelButtonPressed(_ sender: UIButton) {
        switch sender {
            case basicButton:
                getLevel = "Básico"
            case intermedButton:
                getLevel = "Intermediario"
            case avancedButton:
                getLevel = "Avançado"
                default:
                    print("Unknown Button")
        }
        getLevelUser(level: getLevel ?? "Error")
    }
    
    func getLevelUser(level: String) {
        if let levelUser = level as Optional {
            presenter?.levelUser = levelUser
        print(presenter?.levelUser ?? "error")
        }
    }
}
