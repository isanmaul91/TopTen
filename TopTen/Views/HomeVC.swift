//
//  HomeVC.swift
//  TopTen
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel: HomeViewModelProtocol = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupNavBar()
        setupTableView()
        viewModel.fetch()
    }
    
    func setupViewModel() {
        viewModel.requestState.addObserver(self) { [weak self] state in
            if state == .success {
                self?.reloadScreen()
            }
        }
        
        viewModel.needUpdateName.addObserver(self) { [weak self] val in
            if val {
                self?.showAlert()
            }
        }
    }
    
    func reloadScreen() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func setupNavBar() {
        title = viewModel.getTitle()
        navigationItem.enableMultilineTitle()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "PostTVC", bundle: nil),
                           forCellReuseIdentifier: "PostTVC")
        tableView.register(UINib(nibName: "PhotoTVC", bundle: nil),
                           forCellReuseIdentifier: "PhotoTVC")
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "",
                                      message: L.your_name,
                                      preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(
            UIAlertAction(
                title: L.save_text,
                style: .cancel,
                handler: { [weak self] _ in
                    guard let field = alert.textFields?.first,
                          let text = field.text,
                          !text.isEmpty else { return }
                    self?.updateName(text)
                }
            )
        )
        
        present(alert, animated: true)
    }
    
    func updateName(_ name: String) {
        viewModel.setName(name)
        setupNavBar()
    }
}


extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTVC",
                                                     for: indexPath) as! PostTVC
            cell.setup(viewModel.getPostList())
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTVC",
                                                     for: indexPath) as! PhotoTVC
            cell.setup(viewModel.getPhotoList())
            return cell
        default:
            return UITableViewCell()
        }
    }
}
