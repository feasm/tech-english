//
//  UserListViewController.swift
//  tech-english
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import UIKit

import TNUI

protocol UserListViewController {}

final class UserListViewControllerImpl: UIViewController {

    let presenter: UserListPresenter
    
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    init(presenter: UserListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "User List"
        setup()
    }

    private func setup() {
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        selectButton.layer.cornerRadius = 6
    }

}

extension UserListViewControllerImpl: UITableViewDataSource {
    private func setupTableView() {
        tableView.register(TEUserSummaryViewCell.self, forCellReuseIdentifier: SelectUsersViewControllerImpl.cellIdentifier)
        
        tableView.allowsSelection = false
        
        tableView.dataSource = self
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
        
        return cell ?? UITableViewCell()
    }
}

extension UserListViewControllerImpl: UserListViewController {}
