//
//  NotificationComponentView.swift
//  TNUI
//
//  Created by William Reinert on 12/10/22.
//

import UIKit

public class NotificationComponentView: UIView {

    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var warningLabel: UILabel!
    
    let nibName = "NotificationComponent"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

}
