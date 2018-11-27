//
//  ViewController.swift
//  Radio-Checkbox
//
//  Created by Patrick Marshall on 27/11/18.
//  Copyright © 2018 Patrick Marshall. All rights reserved.
//

import UIKit

struct List {
    var selected: Bool = false
    var title: String = ""
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var list: [[List]] = [[],[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupDummy()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ListCell")
    }
    
    func setupDummy() {
        list.removeAll()
        var radio: [List] = []
        var check: [List] = []
        
        for i in 0...5 {
            radio.append(List(selected: false, title: "hehe \(i)"))
            check.append(List(selected: false, title: "xixi \(i)"))
        }
        // Radio must have true value, hehehe
        radio.append(List(selected: true, title: "hehe yey"))
        
        list.append(radio)
        list.append(check)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Radio Button must only 1 that true, so must to change every item state to be false first. hehe
        // I don't know if this is the best method but I believe this will worked at any cases. hehe :3
        // If you have spare time, you might want to use .filter instead of this for O(log n) performance
        if indexPath.section == 0 {
            for i in 0...self.list[0].count-1 {
                self.list[0][i].selected = false
            }
        }
        
        // Change selected state
        self.list[indexPath.section][indexPath.row].selected = !self.list[indexPath.section][indexPath.row].selected
        
        tableView.reloadData()
//        Or even you can only reload partial section with below (in case you want to add animation) hehe
//        tableView.reloadSections(IndexSet(arrayLiteral: indexPath.section), with: .left)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
        switch indexPath.section {
        case 0:
            cell.setup(.radio, object: self.list[indexPath.section][indexPath.row])
            return cell
        default:
            cell.setup(.checkbox, object: self.list[indexPath.section][indexPath.row])
            return cell
        }
    }    
}

// Thats all!
// Love from Patrick ❤️
