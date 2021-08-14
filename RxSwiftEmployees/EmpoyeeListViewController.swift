import UIKit
import RxSwift
import RxCocoa

final class EmpoyeeListViewController: UIViewController {
    let viewModel = EmployeeViewModel()
    var safeArea: UILayoutGuide!
    let tableView = UITableView()
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.safeAreaLayoutGuide
        setupTableView()
        viewModel.fetchProductList()
        bindTableView()
    }
    
    func setupTableView(){
            view.addSubview(tableView)
            
            tableView.register(EmpoyeeCell.self, forCellReuseIdentifier: "cellID")
            
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        }
    
    func bindTableView() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        
        viewModel.employees.bind(to: tableView.rx.items(cellIdentifier: "cellID")) { row, employee, cell in
            cell.textLabel?.text = "\(employee.firstName), \(employee.lastName)"
         }.disposed(by: disposeBag)
    }
}


