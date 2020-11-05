//
//  AlertView.swift
//  CustomAlert
//
//  Created by SHUBHAM AGARWAL on 31/12/18.
//  Copyright © 2018 SHUBHAM AGARWAL. All rights reserved.
// ,UICollectionViewDelegate, UICollectionViewDataSource  ,UICollectionViewDelegateFlowLayout

import Foundation
import UIKit

class AlertView: UIView{
  
    @IBOutlet weak var evaluationcollectionView: UICollectionView!
     @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    static let instance = AlertView()
    var timerTest = Timer()
     var time = 0
    let name = [" ."]
    var Hello = ""
    var Hello1 = 2
    @IBOutlet weak var viewALE: UIView!
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleLbl2: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
      commonInit()
       activityIndicatorView.startAnimating()
        startTimer ()
      
    }
    func startTimer () {
        timerTest = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(actionBundle), userInfo: nil, repeats: true)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
      alertView.layer.cornerRadius = 10
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func Message()  {
        
    }
    
    func startAnimating(title: String) {
        Hello1 = 2
        self.titleLbl.text = title
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    @objc func actionBundle()
     {
        if Hello1 == 2 {
        time += 1
       
        for index in stride(from: 0, to: name.count, by: 1) {
         
           if time <= 3{
               Hello +=  "\(name[index])"
               print(1,index,Hello)
            self.titleLbl2.text = Hello
              
               
           }else{
            time = 0
            Hello = ""
            self.titleLbl2.text = Hello
           }
           print(3,name.count )
        }}

     
        }
 
   
    
     func stopAnimating() {
        Hello = ""
       DispatchQueue.main.async {
        self.activityIndicatorView.stopAnimating()
        self.parentView.removeFromSuperview()
        self.Hello1 = 1
       }
        
    }
  
    
    
    
    
    
    
}
