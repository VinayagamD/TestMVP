//
// Created by Vinayakam D Ganesh on 04/03/17.
// Copyright (c) 2017 Vinayakam D Ganesh. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager {

    typealias ApiCallback = (_ isSuccessful: Bool,_  JSON:Any?,  _ fail: ErrorModel?)->Void

    func get(url: String, callback: @escaping ApiCallback){
        Alamofire.request(url, method: .get).validate(statusCode: 200..<300 ).responseJSON{ response in
                    switch response.result{
                        case .success(let data) :

                                callback(true,data,nil)

                    case .failure(let error) :
                        let errorModel:ErrorModel = ErrorModel()
                            errorModel.error = error;
                        if let httpStatusCode = response.response?.statusCode {
                            switch(httpStatusCode) {

                            case 401:
                                errorModel.errorCode = ErrorModel.UN_AUTHORIZE
                            default:
                                errorModel.errorCode = ErrorModel.INAVLID_DATA

                            }
                        } else {
                            errorModel.errorCode = ErrorModel.UNKNOWN
                        }
                        errorModel.message = error.localizedDescription
                        callback(false,nil,errorModel)
                        break

                    }
            
                }
    }
}
