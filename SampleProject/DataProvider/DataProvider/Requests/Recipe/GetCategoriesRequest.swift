//
//  GetCategoriesRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct GetCategoriesRequest: APIRequest {
    
    public typealias ResponseType = BaseResponse<[MainCategory]>

    public var path: String = "category-recipes"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(page: Int) {
        parameters["page"] = page
    }
    
}
