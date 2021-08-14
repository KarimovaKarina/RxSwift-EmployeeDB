import Foundation
import RxSwift

final class ApiService {
    func getRepo() -> Single<EmployeesList> {
        return Single<EmployeesList>.create { single in
            let task = URLSession.shared.dataTask(with: URL(string: "https://tartu-jobapp.aw.ee/employee_list/")!) { data, _, error in
                if let error = error {
                    single(.failure(error))
                    return
                }
                
                guard let data = data,
                      let employeeInfo = try? JSONDecoder().decode(EmployeesList.self, from: data)
                else { return }
                single(.success(employeeInfo))
            }
            task.resume()
            return Disposables.create { task.cancel() }
        }
    }
}
