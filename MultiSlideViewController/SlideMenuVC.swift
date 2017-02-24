//
//  SlideMenuVC.swift
//  MultiSlideViewController
//
//  Created by Appinventiv on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class SlideMenuVC: UIViewController {
    
    // MARK: @IBOutlet
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    // array
    
    var color : [String] = ["GREEN","BLUE","YELLOW","RED"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        // setting up delegate and dataSource
        
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        
       let listNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableViewOutlet.register(listNib, forCellReuseIdentifier: "TableViewCellID")
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// extension  UITableViewDataSource , UITableViewDelegate

extension SlideMenuVC: UITableViewDataSource , UITableViewDelegate {
    
    // adding delegate and dataSource methods

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! TableViewCell
        cell.itemLabel.text = color[indexPath.item]
        
        return cell
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return color.count
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
          let cell = self.parent as! MainVC
        
        switch indexPath.row {
        
        case 0:
            
            let child = self.storyboard?.instantiateViewController(withIdentifier: "GreenSID") as! GreenVC
                cell.changeSubview(child)
            
        case 1:
            
            let child = self.storyboard?.instantiateViewController(withIdentifier: "BlueSID") as! BlueVC
                  cell.changeSubview(child)

        case 2:
            
            let child = self.storyboard?.instantiateViewController(withIdentifier: "YellowSID") as! YellowVC
                   cell.changeSubview(child)
        
        case 3:
            
            let child = self.storyboard?.instantiateViewController(withIdentifier: "RedSID") as! RedVC
                     cell.changeSubview(child)
        
        default:   let child = self.storyboard?.instantiateViewController(withIdentifier: "RedSID") as! RedVC
                     cell.changeSubview(child)

        
        }
    
    }
    
}


    
    
    
    


    
    
    
    
    
