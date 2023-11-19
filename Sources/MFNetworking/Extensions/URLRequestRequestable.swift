import Foundation

public extension URLRequest {
    
    init(requester: Requestable) {
        guard let urlComponates = URLComponents(requester: requester),
                  let url = urlComponates.url else {
                      self.init(url: URL(fileURLWithPath: ""))
                      return
                  }
        self.init(url: url)
        
        self.httpMethod = requester.httpMethod.rawValue
        
        // MARK: - Headers
        requester.headers?.forEach({key, value in
            addValue(value, forHTTPHeaderField: key)
        })
        
        // MARK: - Body & Parameters
        // Handle Body
        if case let HTTPRequestTask.requestBody(body, _) = requester.task,
           let httpBody = body.prepareBody() {
            self.httpBody = httpBody
        }
        
        // MARK: - Multi-part
        if case let HTTPRequestTask.requestMultipart(item) = requester.task {
            let body = multiPart(withParameters: item.objectDic, boundary: item.boundary, mimeType: item.type)
            self.httpBody = body
        }

        // MARK: - Request Body
        if case let HTTPRequestTask.requestBody(body, _) = requester.task,
              let httpBody = body.prepareBody() {
            self.httpBody = httpBody
        }
    }
}
