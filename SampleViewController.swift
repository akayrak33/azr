import UIKit
import RxSwift

class SampleViewController: UIViewController {
    let service = BaseService()
    let disposeBag = DisposeBag()
    
    let somet = "asdasd"

    override func viewDidLoad() {
        super.viewDidLoad()

        request(onSuccess: { response in
            print(response.url)
        }, onError: {error in
            print(error.errorMessage, error.errorCode)
        })?.disposed(by: disposeBag)
    }

    func request(onSuccess: @escaping (GetRequestUIModel) -> Void,
                 onError: @escaping (Error) -> Void) -> Disposable? {

        return nil
    }

    func call<T, U>(withMapper mapper: @escaping (T) -> (U?),
                    observable: Observable<T>,
                    onSuccess: @escaping (U) -> Void,
                    onError: @escaping (Error) -> Void) -> Disposable? {

        return nil
    }
}

class GetRequestResponse: Decodable {
    let url: String
}

class GetRequestUIModel {
    let url: String

    init(url: String) {
        self.url = url
    }
}

class GetRequestUIModelConverter {
    static func convert(with response: Result<GetRequestResponse>) -> GetRequestUIModel? {
        guard let data = response.response else { return nil }

        return GetRequestUIModel(url: data.url)
    }
}
