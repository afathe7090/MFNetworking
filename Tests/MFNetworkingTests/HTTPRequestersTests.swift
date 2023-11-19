import XCTest
@testable import MFNetworking

final class HTTPRequestersTests: XCTestCase {
    
    func test_simpleRequester_canInit() {
        _ = makeSUT()
    }
    
    func test_simpleRequest_validAttributesValues() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.url, anyURL())
        XCTAssertEqual(sut.httpMethod, "GET")
        XCTAssertEqual(sut.allHTTPHeaderFields, [:])
    }
    
    private func makeSUT() -> URLRequest {
        let requester = MockSimpleRequester()
        return URLRequest(requester: requester)
    }
    
    private struct MockSimpleRequester: Requestable {
        var baseUrl: URL { anyURL() }
        var path: String { "" }
        var httpMethod: HTTPMethods { .get }
        var task: HTTPRequestTask { .requestPlain }
        var headers: Headers? { [:]}
    }
}
public func anyURL() -> URL {
    URL(string: "https://any-url.com/")!
}
