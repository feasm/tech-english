//
//  File.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 06/09/22.
//

import UIKit
//import SnapKit

//import TNCore
//
//public class TNUserSummaryView: UIView {
//    
//    struct Constants {
//        static let height: CGFloat = 86
//        static let margin: CGFloat = 18
//
//        struct UserImageView {
//
//        }
//    }
//
//    lazy public var userImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "user_avatar")
//
//        return imageView
//    }()
//
//    lazy public var textStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//
//        return stackView
//    }()
//
//    lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "username"
//        label.font = TNFonts.verySmallFontBold
//
//        return label
//    }()
//
//    lazy var descriptionLabel: UILabel = {
//        let label = UILabel()
//        label.text = "description"
//        label.font = TNFonts.verySmallFont
//
//        return label
//    }()
//
//    lazy var selectSwitch: TNSwitch = {
//        let selectSwitch = TNSwitch()
//
//        return selectSwitch
//    }()
//
//    public init() {
//        super.init(frame: .zero)
//        setupView()
//    }
//
//    public func setup(title: String, description: String) {
//        titleLabel.text = title
//        descriptionLabel.text = description
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//
//extension TNUserSummaryView: ViewCoded {
//    public func buildViewHierarchy() {
//        addSubview(userImageView)
//        addSubview(textStackView)
//        addSubview(selectSwitch)
//
//        textStackView.addArrangedSubview(titleLabel)
//        textStackView.addArrangedSubview(descriptionLabel)
//    }
//
//    public func setupConstraints() {
//        snp.makeConstraints { make in
//            make.height.equalTo(Constants.height)
//        }
//
//        userImageView.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(Constants.margin)
//            make.leading.equalToSuperview().inset(Constants.margin)
//            make.bottom.equalToSuperview().inset(Constants.margin)
//            make.width.equalTo(userImageView.snp.height)
//        }
//
//        textStackView.snp.makeConstraints { make in
//            make.centerY.equalTo(userImageView.snp.centerY)
//            make.leading.equalTo(userImageView.snp.trailing).offset(10)
//        }
//
//        selectSwitch.snp.makeConstraints { make in
//            make.trailing.equalToSuperview().inset(Constants.margin)
//            make.centerY.equalTo(userImageView.snp.centerY)
//        }
//    }
//
//    public func addAdditionalConfiguration() {
////        backgroundColor = .gray
//    }
//}
