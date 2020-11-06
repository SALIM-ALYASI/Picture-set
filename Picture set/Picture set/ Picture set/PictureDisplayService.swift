//
//  PictureDisplayService.swift
//   Picture set
//
//   Created by ALYASI on 11/3/20.
//

import UIKit

class PictureDisplayService: UIViewController {
    var imageString = [String]()
    //var family = [String]()
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var imagViewPageControl: UIPageControl!
    @IBOutlet weak var btnCancel: UIButton!
    var lastIndexPathCitySelected:IndexPath = IndexPath()

  override func viewDidLoad() {
        super.viewDidLoad()
      //  matrixarrangement()
    imagesCollectionView.collectionViewLayout.invalidateLayout()
        imagViewPageControl.numberOfPages = imageString.count
    // هدا كودك
   imagesCollectionView.scrollToItem(at: lastIndexPathCitySelected , at: .top, animated: true)
     }
//
//    func matrixarrangement() {
//        family.append(images[lastIndexPathCitySelected.row] )
//        for t in 0 ..< images.count {
//            if images[t] != images[lastIndexPathCitySelected.row]{
//
//             family.append(images[t] )
//            }
//        }
//    }
    
    @IBAction func panGestureRecognizer(_ sender: UIPanGestureRecognizer) {
        dismiss(animated: true)
      
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        dismiss(animated: true)
      
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       imagViewPageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(imagViewPageControl.frame.width)
     }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        imagViewPageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(imagViewPageControl.frame.width)
     }
    

}

extension PictureDisplayService:UICollectionViewDelegate, UICollectionViewDataSource  ,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return imageString.count
     }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
       cell.imagView.image = UIImage(named:imageString[indexPath.row])
       return cell
   }
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
      return 0
       }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: imagesCollectionView.frame .width , height: self.imagesCollectionView.frame .height)
    }
    func collectionView(collectionView: UICollectionView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
 }
