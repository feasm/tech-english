//
//  TEUserSummaryView.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import UIKit
import TNCore

public protocol TEUserSummaryViewDelegate {
    func onSwitch(index: Int, isActive: Bool)
}

public class TEUserSummaryView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var activeSwitch: UISwitch!
    
    public var delegate: TEUserSummaryViewDelegate?
    var index: Int?
    
    func setup(title: String, description: String, isActive: Bool, index: Int) {
        titleLabel.text = title
        descriptionLabel.text = description
        activeSwitch.isOn = isActive
        
        self.index = index
    }
    
    func hideActiveSwitch(_ isHidden: Bool) {
        activeSwitch.isHidden = isHidden
    }
    
    @IBAction func didTapSwitch(_ sender: Any) {
        delegate?.onSwitch(index: self.index ?? 0,
                           isActive: self.activeSwitch.isOn)
    }
    
}
