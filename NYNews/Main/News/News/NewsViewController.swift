//
//  NewsViewController.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import UIKit
import RxSwift

class NewsViewController: BaseViewController {
    
    let disposeBag = DisposeBag()
    
    // The View Model that contains the business of the Controller
    var viewModel: NewsViewModel!
    
    // Check no data
    var isNoData = false
    
    // The pull to refresh control to refresh data
    let refreshControl = UIRefreshControl()
    
    // Table View
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            
            // Setup the Table View delegate and datasource
            tableView.delegate   = self
            tableView.dataSource = self
            
            // Add empty Cell
            tableView.register(EmptyTableViewCell.nib, forCellReuseIdentifier: EmptyTableViewCell.identifier)

            // Setup the Refresh Control
            tableView.refreshControl = refreshControl
            refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Nav title
        self.navigationItem.title = Constants.Strings.newsPageTitle
    }

    override func setupViews() {
        super.setupViews()
        
        // api call
        viewModel.getNews()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        // loading
        viewModel
            .loading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (loading) in
                loading ? self.tableView.beginRefreshing() : self.tableView.endRefreshing()
            }, onError: { (_) in}, onCompleted: {}) {}
            .disposed(by: self.disposeBag)
               
        // error
        viewModel
            .error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (error) in
                if !error.isEmpty {
                    ToastUtils.shared.showToast(error)
                }
                self.reloadData()
            }, onError: { (_) in}, onCompleted: {}) {}
            .disposed(by: self.disposeBag)
        
        // result
        viewModel
            .result
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (result) in
                if result.count != 0 {
                    self.viewModel.newsList = result
                }
                self.reloadData()
            }, onError: { (_) in}, onCompleted: {}) {}
            .disposed(by: self.disposeBag)
    }
    
    func reloadData() {
        isNoData = viewModel.newsList.count == 0
        tableView.reloadData()
        tableView.endRefreshing()
    }
    
    @objc func refreshData() {
        // api call
        viewModel.getNews()
    }
}
