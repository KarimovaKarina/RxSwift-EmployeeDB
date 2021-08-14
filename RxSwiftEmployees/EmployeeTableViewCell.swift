import UIKit

class EmpoyeeCell: UITableViewCell {
    var safeArea: UILayoutGuide!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        safeArea = layoutMarginsGuide
    }
}
