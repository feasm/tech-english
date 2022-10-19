//
//  NotificationComponentView.swift
//  TNUI
//
//  Created by William Reinert on 12/10/22.
//

import UIKit
//import SwiftUI

public class NotificationComponentView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var warningLabel: UILabel!
    
    var nibName: String {
        return String(describing: type(of: self))
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
//        loadViewFromNib()
    }
    
    public required init(warningText: String, isError: Bool) {
        super.init(frame: CGRect.zero)
        
        loadViewFromNib(warningText: warningText, isError: isError)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        super.init(coder: aDecoder)
//        loadViewFromNib()
    }
    
    
    
    private func loadViewFromNib(warningText: String, isError: Bool) {
        let bundle = Bundle(for: NotificationComponentView.self)
        contentView = UINib(nibName: nibName, bundle: bundle).instantiate(withOwner: self).first as? UIView
        contentView.layer.cornerRadius = 6
        contentView.layer.masksToBounds = true
        self.warningLabel.text = warningText
        
        if isError == false {
            contentView.backgroundColor = .systemGreen
            statusImage.image = UIImage(named: "check-circle")
        }
        
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: -70),
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 34)
        ]
        NSLayoutConstraint.activate(constraints)
        
        animate()
    }
    
    private func animate() {
        UIView.animate(withDuration: 0.25, delay: 0.25, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.contentView.frame.origin.y = 140
        })
        self.contentView.alpha = 1
        UIView.animate(withDuration: 0.25, delay: 2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.contentView.frame.origin.y = 0
        })
    }
}
