//
//  LoginViewController.swift
//  tech-english
//
//  Created by William Reinert on 11/09/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var contentView: UIView!
    
    private func setupUI() {
        signInButton.layer.cornerRadius = 6
        contentView.layer.cornerRadius = 15
    }
}

//extension UIView {
//    func customize(backgroundColor: UIColor = .clear, radiusSize: CGFloat = 0) {
//        let subView = UIView(frame: bounds)
//        subView.backgroundColor = backgroundColor
//        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        insertSubview(subView, at: 0)
//
//        subView.layer.cornerRadius = radiusSize
//        subView.layer.masksToBounds = true
//        subView.clipsToBounds = true
//    }
//}
