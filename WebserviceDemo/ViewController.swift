//
//  ViewController.swift
//  WebserviceDemo
//
//  Created by ThietTB on 3/1/18.
//  Copyright © 2018 bipbipdinang. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    let repTextField = UITextField()
    let languageTextField = UITextField()
    let button = UIButton()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.subView()
    }
    
    fileprivate func subView(){
        view.addSubview(imageView)
        view.addSubview(button)
        view.addSubview(repTextField)
        view.addSubview(languageTextField)
        view.backgroundColor = UIColor.white
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        imageView.image = UIImage(named: "github")
        imageView.contentMode = .scaleToFill
        
        repTextField.translatesAutoresizingMaskIntoConstraints = false
        repTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        repTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        repTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        repTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        repTextField.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        repTextField.placeholder = "Repositories"
        repTextField.layer.cornerRadius = 10.0
        
        languageTextField.translatesAutoresizingMaskIntoConstraints = false
        languageTextField.topAnchor.constraint(equalTo: repTextField.bottomAnchor, constant: 10).isActive = true
        languageTextField.centerXAnchor.constraint(equalTo: repTextField.centerXAnchor).isActive = true
        languageTextField.widthAnchor.constraint(equalTo: repTextField.widthAnchor).isActive = true
        languageTextField.heightAnchor.constraint(equalTo: repTextField.heightAnchor).isActive = true
        languageTextField.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        languageTextField.placeholder = "Language"
        languageTextField.layer.cornerRadius = 10.0
  
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: languageTextField.bottomAnchor, constant: 10).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        button.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        button.setTitle("search", for: .normal)
        button.layer.cornerRadius = 10
        self.navigationItem.title = "Github Search Repo"
    }
    
    @objc func searchAction(sender: UIButton!) {
        let resultVC = ResultViewController()
        resultVC.nameRepo = repTextField.text!
        resultVC.language = languageTextField.text!
        self.navigationController?.pushViewController(resultVC, animated: true)
        
    }
    
    
}

