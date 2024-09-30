//
//  WhatTheFuckJWT.swift
//  WTF_JWT
//
//  Created by ing.conti on 30/09/24.
//

//https://stackoverflow.com/questions/60290703/how-do-i-generate-a-jwt-to-use-in-api-authentication-for-swift-app

import Foundation
import CryptoKit

extension Data {
    func urlSafeBase64EncodedString() -> String {
        return base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
}

struct Header: Encodable {
    let alg = "HS256"
    let typ = "JWT"
}


/* was:
struct Payload: Encodable {
    let sub = "1234567890"
    let name = "John Doe"
    let iat = 1516239022
}
*/

struct Payload: Encodable {
    
    
    internal init(sub: String, name: String, iat: String) {
        self.sub = sub
        self.name = name
        self.iat = iat
    }
    

    /*
    internal init(sub: String = "1234567890", name: String = "John Doe", iat: Int = 1516239022) {
        self.sub = sub
        self.name = name
        self.iat = iat
    }
    var sub = "1234567890"
    var name = "John Doe"
    var iat = 1516239022
     */
    private var sub: String
    private var name: String
    private var iat: String

}

// see TESTS
 
