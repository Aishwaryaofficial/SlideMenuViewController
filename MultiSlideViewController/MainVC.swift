//
//  MainVC.swift
//  MultiSlideViewController
//
//  Created by Appinventiv on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: @IBOutlet
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var slideBTOutlet: UIButton!
    
    //  MARK: PROPERTY
    
    var  subViewController = UIViewController()
    var slideViewController = SlideMenuVC()
   
    // MARK: VIEW LIFE CYCLE
    
    override func viewDidLoad() {
        
        subViewController = self.storyboard?.instantiateViewController(withIdentifier: "RedSID") as! RedVC
        slideViewController = self.storyboard?.instantiateViewController(withIdentifier: "SlideMenuSID") as! SlideMenuVC
       
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillLayoutSubviews() {
        
            loadChildCV()   // loading child control view
            loadSlideCV()   // loading slide control view
            slideBTOutlet.isSelected = false
        

    }

    // MARK: @IBAction
    
    @IBAction func slideBT(_ sender: UIButton) {
        
        
        slideBTOutlet.isSelected = !slideBTOutlet.isSelected
        
           if slideBTOutlet.isSelected{
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseIn, animations: { () -> Void  in
                self.slideViewController.view.frame = CGRect(x: 0, y: 0, width: 300 , height: 667)   // slide will appear
                    
                }, completion: nil)
            
            
        }else{
            UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseIn, animations: { () -> Void in
                
                self.slideViewController.view.frame = CGRect(x: -300, y: 0, width: 300 , height: 667)  //slide will hide
                
            }, completion: nil)
            
        
            }
        
        }
        // MARK: PRIVATE FUNCTION
    
        func changeSubview(_ child : UIViewController)  {
            
            subViewController = child  // assigning the value of child to subViewController
            viewWillLayoutSubviews()
            
        }
    
        func loadChildCV() {
        
            self.addChildViewController(subViewController)
            self.view.addSubview(subViewController.view)
            slideViewController.view.frame = CGRect(x: -300, y: 0, width: 300 , height: 667)
        }
    
        func loadSlideCV() {
            
        self.addChildViewController(slideViewController)
        self.view.addSubview(slideViewController.view)
        slideViewController.didMove(toParentViewController: self)

        }
    
    }



