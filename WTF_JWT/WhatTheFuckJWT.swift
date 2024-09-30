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

struct Payload: Encodable {
    let sub = "1234567890"
    let name = "John Doe"
    let iat = 1516239022
}


// see TESTS
 
