import XCTest
@testable import ReusableLoadingIndicator

final class ReusableLoadingIndicatorTests: XCTestCase {
    
    func testPlainLoadingIndicator() {
        let parentView = UIView()
        let loadingIndicator = PlainLoadingIndicator(centeredIn: parentView)
        
        loadingIndicator.startAnimating()
        XCTAssertEqual(loadingIndicator.isLoading, false)
        
        loadingIndicator.show()
        XCTAssertEqual(loadingIndicator.isLoading, true)
        
        loadingIndicator.stopAnimating()
        XCTAssertEqual(loadingIndicator.isLoading, true)
        
        loadingIndicator.hide()
        XCTAssertEqual(loadingIndicator.isLoading, false)
    }
    
}
