

import UIKit

class QIRestaurantViewController: UIViewController {
    
    private var dataArr = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [
            ["starNum": "5", "name": "1"],
            ["starNum": "3", "name": "2"],
            ["starNum": "2", "name": "3"],
            ["starNum": "4", "name": "4"],
            ["starNum": "1", "name": "5"],
        ]

        view.addSubview(tableView)
    }
    

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

}

extension QIRestaurantViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = QIRestaurantViewCell()
        cell.selectionStyle = .none
        cell.dict = dataArr[indexPath.row]
        return cell
    }

    
}

class QIRestaurantViewCell: UITableViewCell {
    
    private var leftImgView: UIImageView!
    private var rightL: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addUI()
    }
    func addUI() {
        
        leftImgView = UIImageView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        leftImgView.image = UIImage(named: "meishi")
        leftImgView.contentMode = .scaleAspectFill
        leftImgView.clipsToBounds = true
        leftImgView.layer.masksToBounds = true
        leftImgView.layer.cornerRadius = 25
        
        self.contentView.addSubview(leftImgView)
        
        
        rightL = createLabel()
        self.contentView.addSubview(rightL)
        
    }
    
    var dict = [String: String]() {
        didSet {
            leftImgView.image = UIImage(named: "\(dict["name"] ?? "")")
            rightL.text = "\(dict["name"] ?? "")"
            let num = Int("\(dict["starNum"] ?? "4")") ?? 4
            for i in 0..<num {
                let star = UIImageView(frame: CGRect(x: i * 40 + 60, y: 15, width: 30, height: 30))
                star.image = UIImage(named: "star");
                self.contentView.addSubview(star)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createLabel() -> UILabel {
        let label = UILabel(frame: CGRect(x:UIScreen.main.bounds.width - 100, y: 20, width: 90, height: 20))
        
        label.text = "???"
        label.font = UIFont.systemFont(ofSize: 14)
        
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 3
        label.layer.borderColor = UIColor.orange.cgColor
        label.layer.borderWidth = 1
        return label
    }
    
    
    
    
}

