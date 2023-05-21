
import UIKit

class bookingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "booking restuarant"
        view.backgroundColor = .white
        
        addUI()
    }
    
    
    private func addUI() {
        let header = UILabel()
        header.frame = CGRect(x: 30, y: -30, width: UIScreen.main.bounds.width,height:30)
        header.backgroundColor = .orange
        header.text = "unconfrim"
        header.textColor = .white
        header.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(header)
        view.addSubview(tableView)
        
        let submitb = UIButton()
        submitb.frame = CGRect(x: UIScreen.main.bounds.width - 80, y: UIScreen.main.bounds.height - 50, width: 80, height: 50)
        submitb.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        submitb.backgroundColor = .orange
        submitb.setTitle("submit", for: .normal)
        submitb.setTitleColor(.white, for: .normal)
        submitb.addTarget(self, action: #selector(submitBtnClick), for: .touchUpInside)
        view.addSubview(submitb)

    }
    
    @objc private func submitBtnClick() {
        let alertCtl = UIAlertController(title: "Confrim", message: "", preferredStyle: .actionSheet)
        alertCtl.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
            
        }))
        alertCtl.addAction(UIAlertAction(title: "NO", style: .cancel, handler: { (_) in
            
        }))
        self.present(alertCtl, animated: true)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 30, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 110)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
}

extension bookingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = QIOrderViewCell()
        cell.selectionStyle = .none
        return cell
    }
    
}


class QIOrderViewCell: UITableViewCell {
    
    private var numLabel: UILabel!
    private var num = 1
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addUI()
    }
    func addUI() {
        let imgView = UIImageView()
        imgView.frame = CGRect(x:10, y: 10, width: 50, height: 40)
        imgView.image = UIImage(named: "egg")
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        self.contentView.addSubview(imgView)

        self.contentView.addSubview(imgView)
        
        let nameLable = UILabel()
        nameLable.frame = CGRect(x: 60, y: 0, width: 150, height: 60)
        nameLable.text = "How many pepole"
        nameLable.textAlignment = .center
        nameLable.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(nameLable)
        
        let price = UILabel()
        price.frame = CGRect(x: UIScreen.main.bounds.width - 100, y: 10, width: 70, height: 15)
        price.text = "$10"
        price.textAlignment = .right
        price.textColor = .red
        price.font = UIFont.systemFont(ofSize: 14)
        
        self.contentView.addSubview(price)
        
        let reduceb = UIButton()
        reduceb.frame = CGRect(x: UIScreen.main.bounds.width - 30, y: 30, width: 20, height: 20)
        reduceb.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        reduceb.setTitle("-", for: .normal)
        reduceb.setTitleColor(.black, for: .normal)
        reduceb.layer.masksToBounds = true
        reduceb.layer.borderColor = UIColor.black.cgColor
        reduceb.layer.borderWidth = 1
        reduceb.layer.cornerRadius = 10
        reduceb.addTarget(self, action: #selector(reduceBtnClick), for: .touchUpInside)

        self.contentView.addSubview(reduceb)
        
        numLabel = UILabel()
        numLabel.frame = CGRect(x: UIScreen.main.bounds.width - 60, y: 30, width: 30, height: 20)
        numLabel.text = "1"
        numLabel.textAlignment = .center
        numLabel.font = UIFont.systemFont(ofSize: 13)

        self.contentView.addSubview(numLabel)
        
        
        let addb = UIButton()
        addb.frame = CGRect(x: UIScreen.main.bounds.width - 80, y: 30, width: 20, height: 20)
        addb.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        addb.setTitle("+", for: .normal)
        addb.setTitleColor(.black, for: .normal)
        addb.layer.masksToBounds = true
        addb.layer.borderColor = UIColor.black.cgColor
        addb.layer.borderWidth = 1
        addb.layer.cornerRadius = 10
        addb.addTarget(self, action: #selector(addBtnClick), for: .touchUpInside)

        self.contentView.addSubview(addb)
        
    }
    
    @objc private func reduceBtnClick() {
        guard num > 1 else {
            return
        }
        num = num - 1
        numLabel.text = "\(num)"
    }
    @objc private func addBtnClick() {
        num = num + 1
        numLabel.text = "\(num)"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


