import Foundation
import RxSwift
import RxCocoa

final class EmployeeViewModel {
    var employees = PublishSubject<[EmployeeData]>()
    var service = ApiService()
    var disposeBag = DisposeBag()
    
    func fetchProductList() {
        service.getRepo()
            .subscribe(onSuccess: { json in
                self.employees.onNext(json.employees)
                self.employees.onCompleted()
                print("JSON: ", json)
            },
            onFailure: { error in
                           print("Error: ", error)
                       })
            .disposed(by: disposeBag)
        
    }
    
}
