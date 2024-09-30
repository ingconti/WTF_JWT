//
//  WTF_JWTTests.swift
//  WTF_JWTTests
//
//  Created by ing.conti on 30/09/24.
//

import XCTest
@testable import WTF_JWT


import Foundation
import CryptoKit

final class WTF_JWTTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample1() throws {
 
            let secret = "your-256-bit-secret"
            let privateKey = SymmetricKey(data: Data(secret.utf8))
            
            let headerJSONData = try! JSONEncoder().encode(Header())
            let headerBase64String = headerJSONData.urlSafeBase64EncodedString()
            
            let payloadJSONData = try! JSONEncoder().encode(Payload())
            let payloadBase64String = payloadJSONData.urlSafeBase64EncodedString()
            
            let toSign = Data((headerBase64String + "." + payloadBase64String).utf8)
            
            let signature = HMAC<SHA256>.authenticationCode(for: toSign, using: privateKey)
            let signatureBase64String = Data(signature).urlSafeBase64EncodedString()
            
            let token = [headerBase64String, payloadBase64String, signatureBase64String].joined(separator: ".")
        print(token) // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c

        let expectedToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"

        XCTAssertEqual(token, token, expectedToken)
        }

    

}
