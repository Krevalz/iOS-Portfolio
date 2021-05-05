//
//  ViewController.swift
//  Trello-Clone
//
//  Created by Amanuel Ketebo on 11/19/17.
//  Copyright © 2017 SinCityDev. All rights reserved.
//

import UIKit

class TrelloBoard: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var listViews = [ListView]()
    var padding: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchedAdd() {
        let listView = ListView()
        listView.tableView.delegate = self
        listView.tableView.dataSource = self
        listView.tableView.tableFooterView = UIView()
        
        listViews.append(listView)
        
        scrollView.addSubview(listView)
        scrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(listViews.count), height: scrollView.bounds.height)
    }
}

extension TrelloBoard: UITableViewDelegate, UITableViewDataSource {
    // Delegate methods
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let xPoint = padding + (view.bounds.width * CGFloat(listViews.count - 1))
        let yPoint = padding
        let width = view.bounds.width - (padding * 2)
        let height = listViews.last!.tableView.contentSize.height + 100
        
        listViews.last!.view.frame = CGRect(x: xPoint, y: yPoint, width: width, height: height)
        scrollView.scrollToMostRight()
    }
    
    
    // Datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let label = UILabel()
        
        label.numberOfLines = 0
        label.text = "Hey there!"
        cell.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
        label.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        
        return cell
    }
}
