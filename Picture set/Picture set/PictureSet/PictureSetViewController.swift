//
//  PictureSetViewController.swift
//  Picture set
//
//  Created by ALYASI on 11/3/20.
//

import UIKit

class PictureSetViewController: UIViewController {
    var images: [String] = ["1","2","3","4","5","6"]
    @IBOutlet weak var imagViewPageControl: UIPageControl!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    imagViewPageControl.numberOfPages = images.count
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        imagViewPageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(imagViewPageControl.frame.width)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {

        imagViewPageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(imagViewPageControl.frame.width)
    }
   

}
extension PictureSetViewController:UICollectionViewDelegate, UICollectionViewDataSource  ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return images.count
     }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "PictureSetCollectionViewCell", for: indexPath) as! PictureSetCollectionViewCell
        cell.imagView.image = UIImage(named:images[indexPath.row])
        cell.imagView2.image = UIImage(named:images[indexPath.row])
        return cell
   }
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
      return 0
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert = BekijkEenFoto().alert(arry:images, indexPath: indexPath)
      
       self.present(alert, animated: true)

        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        return CGSize(width: imagesCollectionView.frame .width , height: self.imagesCollectionView.frame .height )
    }
   
}
