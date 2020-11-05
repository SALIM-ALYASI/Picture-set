//
//  StartScreenViewController.swift
//  Picture set
//
//  Created by ALYASI on 11/3/20.
//

import UIKit

class StartScreenViewController: UIViewController,UIScrollViewDelegate{
    var colorarry = ["Camps","Caroman","Camping_supplies","QIAD BIKE FOR RENT"]
    var detailsarry = ["‎يمكنك البحث عن السيارات واستئجارها بما في ذلك السيارات رباعية الدفع 🚘 مع وبدون المرشدين السياحيين🧍‍♂️ باستخدام تطبيق البادية! المرشدون السياحيون سيجعلون رحلتك لا تُنسى 📸😁","باستخدام تطبيق البادية ، ستجد شاليهات ومخيمات وغرف وما إلى ذلك للإيجار 🛌 🏨 ويمكنك التواصل مع العقارات مباشرة!","‎يمكنك استخدام تطبيق البادية للعثور على المحلات التجارية التي تبيع وتؤجر مستلزمات التخييم🏕️ وأدوات المغامرات المختلفة! 🚵‍♂️ 🚣🧗","‎‏إذا كنت من محبي الصحراء، يمكنك استئجار الدراجات رباعية الدفع لمغامراتك الرملية 🌵🐪 استخدم تطبيق البادية لمعرفة المزيد!"]
    var titlerarry = ["Camps","Caroman","Camping supplies","QIAD BIKE FOR RENT"]
    @IBOutlet weak var imagViewPageControl: UIPageControl!
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        imagViewPageControl.numberOfPages = colorarry.count
  }
 
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        imagViewPageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(imagViewPageControl.frame.width)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {

        imagViewPageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(imagViewPageControl.frame.width)
    }
}

extension StartScreenViewController:UICollectionViewDelegate, UICollectionViewDataSource  ,UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return colorarry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "StartScreenCell", for: indexPath) as! StartScreenCell
        cell.imagView.image = UIImage(named:colorarry[indexPath.row])
        cell.titleLabel.text =  titlerarry[indexPath.row]
        cell.detailsarryLabel.text =  detailsarry[indexPath.row]
        return cell
   }
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
      return 0

        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: imagesCollectionView.frame .width , height: self.imagesCollectionView.frame .height )
    }
   
}
