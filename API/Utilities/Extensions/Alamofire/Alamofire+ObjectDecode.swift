//
//  Alamofire+ObjectDecode.swift
//  API
//
//  Created by Zach McGaughey on 5/9/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import PromiseKit
import ObjectMapper

extension DataRequest {
  
  func responseDecodable<T: BaseMappable>(queue: DispatchQueue? = nil) -> Promise<T> {
    
    return Promise<T> { seal in
      
      validate(statusCode: 200..<400)
      responseObject(queue: queue) { (response: DataResponse<T>) in
        switch response.result {
        case .success(let value):
          seal.fulfill(value)
        case .failure(let error):
          seal.reject(error)
        }
      }
      
    }
    
  }
  
  func responseArrayDecodable<T: BaseMappable>(queue: DispatchQueue? = nil) -> Promise<[T]> {
    
    return Promise<[T]> { seal in
      
      validate(statusCode: 200..<400)
      responseArray(queue: queue) { (response: DataResponse<[T]>) in
        switch response.result {
        case .success(let value):
          seal.fulfill(value)
        case .failure(let error):
          seal.reject(error)
        }
      }
      
    }
    
  }
  
}
