//
//  LanguageClient.swift
//  Decode
//
//  Created by Caroline Shi on 3/20/17.
//  Copyright © 2017 Victoria Zhou. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LanguageClient {

    //API constants
    var clientID = "CodeSwitch"
    var clientSecret = "aBCX3XqV1i6xTNNj0ohE9tcqMAFtuD7Gw86wYdpS/R0="
    var accessTokenEndpoint = "https://datamarket.accesscontrol.windows.net/v2/OAuth2-13"
    var translateEndpoint = "http://api.microsofttranslator.com/V2/Http.svc/Translate"
    
    var accessTokenValue: String?
    
    var usersLanguage: String? = "English (US)"
    var translateToLanguage: String?
    
    //TODO: make sure access token is being set correctly
    //data is definitely being fetched correctly
    func getAccessToken() {
        let params = ["client_id": clientID, "client_secret": clientSecret, "scope": "http://api.microsofttranslator.com", "grant_type": "client_credentials"]
        
        Alamofire.request(accessTokenEndpoint, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON {
            response in
                let res = response.value
                let json = SwiftyJSON.JSON(res!)
                self.accessTokenValue = json["access_token"].string
        }
    }
    
    //TODO: Get this to work
    func translate(langTo: String, text: String) {
        print("accesstoken: \(self.accessTokenValue)")
        //leave appid field empty?
        let params = ["appId": "", "to": langTo, "text": text]
        let headers: HTTPHeaders = ["Authorization" : ("Bearer " + accessTokenValue!)]
        
        Alamofire.request(translateEndpoint, method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON {
            response in
                print("HIIII")
                debugPrint(response)
        }
    }
    
    
    
    
}
