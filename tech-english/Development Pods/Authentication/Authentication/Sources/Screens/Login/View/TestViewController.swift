//
//  TestViewController.swift
//  tech-english
//
//  Created by William Reinert on 22/09/22.
//

import UIKit

class TestViewController: UIViewController {

    @IBAction func logOutButtonPressed(_ sender: Any) {
        LoginService().logOut()
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
