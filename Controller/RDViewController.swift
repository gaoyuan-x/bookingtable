
import UIKit

class RDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Resturant Detail"
        
        view.addSubview(collectionView)
        let bookingbtn = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 80, y: UIScreen.main.bounds.height - 50, width: 80, height: 50))
        bookingbtn.backgroundColor = .orange
        bookingbtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        bookingbtn.setTitle("Booking", for: .normal)
        bookingbtn.setTitleColor(.black, for: .normal)
        bookingbtn.addTarget(self, action: #selector(bookingClick), for: .touchUpInside)

        view.addSubview(bookingbtn)
    }
    
    @objc private func bookingClick() {
        let vi = QIDetermineView()
        vi.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        vi.backgroundColor = .white
        view.addSubview(vi)
    }
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width ,height: 400), collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        collectionView.register(RestaurantDetailCell.classForCoder(), forCellWithReuseIdentifier: "RestaurantDetailCell")
        
        return collectionView
    }()
  

}

extension RDViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let cellW = UIScreen.main.bounds.width / 3 - 20
            return CGSize(width: cellW, height: cellW + 40)
        } else {
            let cellW = UIScreen.main.bounds.width / 2 - 20
            return CGSize(width: cellW, height: cellW + 40)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantDetailCell", for: indexPath) as! RestaurantDetailCell
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vi = QIDetermineView()
//        vi.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
//        vi.backgroundColor = .white
//        view.addSubview(vi)
//    }
    
}

class RestaurantDetailCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addUI()
    }
    
    private func addUI() {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width))
        imgView.image = UIImage(named: "西红柿炒鸡蛋")
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true

        self.contentView.addSubview(imgView)
        
        let pricel = UILabel(frame: CGRect(x: 30, y: self.frame.width - 30, width: self.frame.width - 30, height: 30))
        pricel.text = "$15"
        pricel.textColor = .red
        pricel.font = UIFont.systemFont(ofSize: 14)

        self.contentView.addSubview(pricel)
        
        let namelabel = UILabel(frame: CGRect(x: 0, y: self.frame.width, width: self.frame.width, height: 30))
        namelabel.text = "burger"
        namelabel.textAlignment = .center
        namelabel.font = UIFont.systemFont(ofSize: 15)

        self.contentView.addSubview(namelabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class QIDetermineView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addUI()
    }
    
    private func addUI() {
        let label = UILabel()
            label.frame = CGRect(x: 0, y: UIScreen.main.bounds.height / 2, width: UIScreen.main.bounds.width, height: 20)
            label.text = "Booking?"
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(label)
        
        let cbutton = UIButton()
            cbutton.frame = CGRect(x: UIScreen.main.bounds.width * 0.2, y: UIScreen.main.bounds.height * 0.7, width: 70, height: 30)
            cbutton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            cbutton.setTitle("cancel", for: .normal)
            cbutton.setTitleColor(.black, for: .normal)
            cbutton.layer.masksToBounds = true
            cbutton.layer.borderColor = UIColor.black.cgColor
            cbutton.layer.borderWidth = 1
            cbutton.layer.cornerRadius = 3
            cbutton.addTarget(self, action: #selector(cancelBtnClick), for: .touchUpInside)
        self.addSubview(cbutton)
      
        let doneb = UIButton()
        doneb.frame = CGRect(x: UIScreen.main.bounds.width * 0.7, y: UIScreen.main.bounds.height * 0.7, width: 70, height: 30)
        doneb.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        doneb.setTitle("Yes", for: .normal)
        doneb.layer.masksToBounds = true
        doneb.layer.borderColor = UIColor.black.cgColor
        doneb.layer.borderWidth = 1
        doneb.layer.cornerRadius = 3
        doneb.addTarget(self, action: #selector(doneBtnClick), for: .touchUpInside)
        self.addSubview(doneb)
        
    }
    
    @objc func cancelBtnClick() {
        self.removeFromSuperview()
    }
    @objc func doneBtnClick() {
        

        cancelBtnClick()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

