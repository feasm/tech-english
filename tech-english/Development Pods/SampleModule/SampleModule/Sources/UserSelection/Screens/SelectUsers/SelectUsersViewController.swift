//
//  SelectUsersViewController.swift
//  tech-english
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import UIKit

import TNUI

protocol SelectUsersViewController {
    func updateUsers()
}

final class SelectUsersViewControllerImpl: UIViewController {

    static let cellIdentifier = "TEUserSummaryView"
    
    let presenter: SelectUsersPresenter
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectButton: UIButton!
    
    init(presenter: SelectUsersPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select Users"
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.getUsers()
    }
    
    private func setup() {
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        selectButton.layer.cornerRadius = 6
    }
    
    @IBAction func onSearchTextChanged(_ sender: UITextField) {
        presenter.onSearchTextChanged(text: sender.text ?? "")
    }
    
    @IBAction func didTapSelectButton(_ sender: Any) {
        presenter.didTapSelectButton()
    }
    
}

extension SelectUsersViewControllerImpl: UITableViewDataSource, UITableViewDelegate {
    private func setupTableView() {
        tableView.register(TEUserSummaryViewCell.self, forCellReuseIdentifier: SelectUsersViewControllerImpl.cellIdentifier)
        
        tableView.allowsSelection = false
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.usersViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectUsersViewControllerImpl.cellIdentifier,
                                                 for: indexPath) as? TEUserSummaryViewCell
        let viewData = presenter.usersViewData[indexPath.row]
        cell?.setup(viewData: viewData)
        cell?.userSummaryView?.delegate = self
        
        return cell ?? UITableViewCell()
    }
    
}

extension SelectUsersViewControllerImpl: SelectUsersViewController {
    func updateUsers() {
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
}

extension SelectUsersViewControllerImpl: TEUserSummaryViewDelegate {
    func onSwitch(index: Int, isActive: Bool) {
        presenter.setUserActive(index, isActive)
    }
}
