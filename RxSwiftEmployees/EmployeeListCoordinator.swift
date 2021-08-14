import UIKit

final class EmployeeListCoordinator: Coordinator {
    private var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let employeeListViewController = EmpoyeeListViewController()
        navigationController.setViewControllers([employeeListViewController], animated: true)
    }
}
