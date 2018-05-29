//
//  AuthorizationCodeGrantFlow.swift
//  FitnessCoach
//
//  Created by Yuren Huang on 5/21/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit
import Alamofire

class AuthorizationCodeGrantFlow {
    static let shared = AuthorizationCodeGrantFlow()
    var verifier: String?
    var challenge: String?
    var code: String?
    
    let clientInfo = plistValues(bundle: Bundle.main)
    let path = Bundle.main.path(forResource: "Info", ofType: "plist")
    lazy var info = NSDictionary(contentsOfFile: path!)
    lazy var urlScheme = info?.object(forKey: "CFBundleIdentifier")
    
    func createCodeVerifier() {
        var buffer = [UInt8](repeating: 0, count: 32)
        _ = SecRandomCopyBytes(kSecRandomDefault, buffer.count, &buffer)
        verifier = Data(bytes: buffer).base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
            .trimmingCharacters(in: .whitespaces)
    }
    
    func createCodeChallenge() {
        // You need to import CommonCrypto (imported in bridging header)
        guard let data = verifier?.data(using: .utf8) else { return }
        var buffer = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
        _ = CC_SHA256($0, CC_LONG(data.count), &buffer)
        }
        let hash = Data(bytes: buffer)
        challenge = hash.base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
            .trimmingCharacters(in: .whitespaces)
    }
    
//    this function below is not finished
    func getCode() {
        let audience = "https://api.fitbit.com"
        let url = URL(string: """
            https://\(clientInfo!.domain)/authorize?
                audience=\(audience)&
                scope=SCOPE&
                response_type=code&
                client_id=\(clientInfo!.clientId)&
                code_challenge=\(challenge!)&
                code_challenge_method=S256&
                redirect_uri=\(urlScheme!)://\(clientInfo!.domain)/ios/\(urlScheme!)/callback
            """)
        Alamofire.request(url!)
    }
    
    func exchangeCodeForToken() {
        
        let headers = ["content-type": "application/json"]
        
        let postData = NSData(data: """
            {
                "grant_type": "authorization_code",
                "client_id": \(clientInfo!.clientId),
                "code_verifier": \(verifier!),
                "code": \(code!),
                "redirect_uri": "\(urlScheme!)://\(clientInfo!.domain)/ios/\(urlScheme!)/callback",
            }
            """.data(using: String.Encoding.utf8)!)
        
        var request = URLRequest(url: URL(string: "https://\(clientInfo!.domain)/oauth/token")!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
            }
        })
        
        dataTask.resume()
    }
}
