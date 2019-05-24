import XCTest
import CryptoBLS

extension Data {
    public init?(hex: String) {
        let len = hex.count / 2
        var data = Data(capacity: len)
        for i in 0..<len {
            let j = hex.index(hex.startIndex, offsetBy: i * 2)
            let k = hex.index(j, offsetBy: 2)
            let bytes = hex[j..<k]
            if var num = UInt8(bytes, radix: 16) {
                data.append(&num, count: 1)
            } else {
                return nil
            }
        }
        self = data
    }
    
}

class CryptoBLSTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let pubKey = Data(hex: "141d89e211c93bee9f4cb26e4bd1fa530798dc1cc27e545c0e096aec9d913ba2cae572b339aaab612a0bb2f60dd71ceb")!
        let signature = Data(hex: "0cace6526d0f27e7b969700877796fce5d0a441281d952197eee051385b22c7b9010981cecd19986fc185aa65ac8d82b0c8ba2e0f2cab703f4cd9c3079cc53b78d947bc6d8cc6b05f87fcffea778a05df53f0340d6d0c4f9de182016df8452fe")!
        let hash = Data(hex: "764ffc3658c9e40ebed871d60eb92add480d437973d59038c37d6e55dda35461")!

        XCTAssertTrue(CryptoBLS.verify(messageDigest: hash, pubKey: pubKey, signature: signature))
    }

    func testPerformanceExample() {

        // This is an example of a performance test case.
        self.measure {
            testExample()
        }
    }

}
