//
//  BekijkEenFoto.swift
//   Picture set
//
// Created by ALYASI on 11/3/20.
//

import UIKit

class BekijkEenFoto{
   var actionCancel: (()->Void)?
    
    func alert(arry:[String],indexPath:IndexPath)->PictureDisplayService{
        let storyBoard = UIStoryboard(name: "AlertStoryboard", bundle: .main)
        let alertVC = storyBoard.instantiateViewController(withIdentifier: "AlertVC") as! PictureDisplayService
        alertVC.images = arry
        alertVC.lastIndexPathCitySelected = indexPath
       
        alertVC.actionCancel = actionCancel
        return alertVC
    }
    
}
