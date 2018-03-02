//
//  ResultViewController.swift
//  WebserviceDemo
//
//  Created by ThietTB on 3/1/18.
//  Copyright © 2018 bipbipdinang. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    let tableView = UITableView()
    let actInd = UIActivityIndicatorView()
    let containerView = UIView()
    var items = [Items]()
    var nameRepo = ""
    var language = ""
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.subView()
        self.getData(nameRep: self.nameRepo, language: self.language, page: self.page)
    }
    
    private func subView(){
        view.backgroundColor = UIColor.red
        view.addSubview(tableView)
        containerView.frame = view.frame
        containerView.center = view.center
        containerView.backgroundColor = UIColor("0xffffff").withAlphaComponent(0.3)
        
        let loading = UIView()
        loading.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loading.center = view.center
        loading.backgroundColor = UIColor("0x444444").withAlphaComponent(0.7)
        loading.clipsToBounds = true
        loading.layer.cornerRadius = 10.0
        
        self.actInd.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        actInd.center = CGPoint(x: loading.frame.size.width/2, y: loading.frame.size.height/2)
        loading.addSubview(actInd)
        containerView.addSubview(loading)
        view.addSubview(containerView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44   
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCellCustom", bundle: nil), forCellReuseIdentifier: "idCell")
        self.navigationItem.title = "Result"
    }
    
    func getData(nameRep: String, language: String?, page: Int) {
        actInd.startAnimating()
        self.containerView.isHidden = false
        var urlSearch = String()
        guard let language2 = language else {
           return urlSearch = "https://api.github.com/search/repositories?q=\(nameRep)+language:&sort=stars&order=desc&page=\(page)"
        }
        urlSearch = "https://api.github.com/search/repositories?q=\(nameRep)+language:\(language2)&sort=stars&order=desc&page=\(page)"
        guard let url = URL(string: urlSearch) else {
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            print(data)
            do {
                let result  = try JSONDecoder().decode(Result.self, from: data)
                DispatchQueue.main.async {
                    let itemsArray = result.items
                    for item in itemsArray {
                        self.items.append(Items(full_name: item?.full_name, description: item?.description))
                    }
                    self.tableView.dataSource = self
                    self.tableView.reloadData()
                    self.actInd.stopAnimating()
                    self.containerView.isHidden = true
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }
        task.resume()
        
    }
    
}

extension ResultViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) as! TableViewCellCustom
        cell.items = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
}

extension ResultViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = items.count - 1
        if indexPath.row == lastElement {
            self.getData(nameRep: self.nameRepo, language: self.language, page: self.page + 1)
            print("load more")
        }
    }
}

