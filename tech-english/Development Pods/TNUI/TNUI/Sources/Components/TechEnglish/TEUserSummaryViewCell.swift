//
//  TEUserSummaryViewCell.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import UIKit
import TNCore

public class TEUserSummaryViewCell: UITableViewCell {
    
    public var userSummaryView: TEUserSummaryView?
    
    public struct ViewData {
        let index: Int
        let title: String
        let description: String
        let isActive: Bool
        
        let shouldShowActivation: Bool
        
        public init(index: Int, title: String, description: String, isActive: Bool, shouldShowActivation: Bool = true) {
            self.index = index
            self.title = title
            self.description = description
            self.isActive = isActive
            self.shouldShowActivation = shouldShowActivation
        }
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addUserView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(viewData: ViewData) {
        userSummaryView?.setup(title: viewData.title,
                               description: viewData.description,
                               isActive: viewData.isActive,
                               index: viewData.index)
        
        if !viewData.shouldShowActivation {
            userSummaryView?.hideActiveSwitch(true)
        }
    }
    
    private func addUserView() {
        userSummaryView = loadViewFromNib(TEUserSummaryView.self)
        
        guard let view = userSummaryView else { return }
        contentView.addSubview(view)
        view.pinToSuperview()
    }
    
}
