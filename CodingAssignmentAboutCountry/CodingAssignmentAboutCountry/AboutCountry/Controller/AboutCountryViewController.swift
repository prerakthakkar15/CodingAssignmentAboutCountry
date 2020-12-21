//
//  AboutCountryViewController.swift
//  CodingAssignmentAboutCountry
//
//  Created by Prerak on 21/12/20.
//  Copyright © 2020 PrerakHomePC. All rights reserved.
//

import UIKit

class AboutCountryViewController: UIViewController {
    
    
    //MARK: - TableView Controller veriables
    var tableView : UITableView = {
        let countryTableView = UITableView()
        countryTableView.rowHeight = UITableView.automaticDimension
        // this enables autolayout for our TableView
        countryTableView.translatesAutoresizingMaskIntoConstraints = false
        countryTableView.tableFooterView = UIView(frame: .zero)
        countryTableView.allowsSelection = false
        return countryTableView
    }()
    private static let CellIdentifier = "aboutCountry"
    var refreshControl: UIRefreshControl!
        
    //MARK: - AboutCountryViewModel instance
    var instanceAboutCountryVM : AboutCountryViewModel!
    
    //MARK: - AboutCountry API Data
    var aboutCountrydata : [AboutCountryItemObject] = []
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.register(AboutCountryTableViewCell.self, forCellReuseIdentifier: AboutCountryViewController.CellIdentifier)
         tableView.dataSource = self
        tableView.delegate = self
        self.instanceAboutCountryVM = AboutCountryViewModel(instanceVC: self)
        setupLayout()
        self.instanceAboutCountryVM.delegate = self
        self.instanceAboutCountryVM.loadAboutCountryData()
       
    }
    
    //Set up Table view Layout in View Controller
    private func setupLayout() {
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        addPageRefreshControl()
    }
    
    //Add Pull To refresh into TableView
    private func addPageRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "You'r almost there!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]);
        refreshControl.addTarget(self, action: #selector(refreshTableData), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
}

//MARK: - UITableView Data Source
extension AboutCountryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboutCountrydata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let tableCell = tableView.dequeueReusableCell(withIdentifier: AboutCountryViewController.CellIdentifier, for: indexPath) as! AboutCountryTableViewCell
        
        guard let tableCell = tableView.dequeueReusableCell(withIdentifier: AboutCountryViewController.CellIdentifier) as? AboutCountryTableViewCell else{
            fatalError("")
        }
        
        let aboutCountryItemObj = aboutCountrydata[indexPath.row]
        tableCell.setCellDataObj = aboutCountryItemObj
        tableCell.selectionStyle = .none
        return tableCell
    }
    
}

//MARK: - AboutCountryModelDelegate Method omplementation
extension AboutCountryViewController : AboutCountryModelDelegate {
    func didReceiveCountryData(aboutCountryItemArray: [AboutCountryItemObject], Title: String) {
        self.aboutCountrydata = aboutCountryItemArray;
        self.title = Title
        
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
       
        self.tableView.reloadData()
        
    }
}

//MARK: - UITableView Pull to Refresh controller Action
extension AboutCountryViewController {
    @objc func refreshTableData(_ sender: Any) {
        //  below code is to refresh tableView
        self.instanceAboutCountryVM.loadAboutCountryData()
    }
}
