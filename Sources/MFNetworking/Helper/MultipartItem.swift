//
//  File.swift
//  
//
//  Created by Ahmed Fathy on 19/11/2023.
//

import Foundation

public struct MultipartItem {
    public let objectDic: Parameters
    public let boundary: String
    public let parameters: Parameters
    public let type: MimeType
    
    public init(boundary: String, objectDic: Parameters, parameters: Parameters = [:], type: MimeType = .jpeg) {
        self.boundary = boundary
        self.objectDic = objectDic
        self.parameters = parameters
        self.type = type
    }
}
