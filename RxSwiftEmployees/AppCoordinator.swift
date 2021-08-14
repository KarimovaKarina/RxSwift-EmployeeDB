import UIKit

protocol Coordinator {
    func start()
}

final class AppCoordinator: Coordinator {
    private var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    func start() {
        let navigationController = UINavigationController()
        let employeeListCoordinator = EmployeeListCoordinator(navigationController: navigationController)
        childCoordinators.append(employeeListCoordinator)
        employeeListCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
