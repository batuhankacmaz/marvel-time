//
//  Errors.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 30.06.2023.
//

import Foundation

final class Errors {
    //internal
    static let ERR_SERIALIZING_REQUEST = "error_serializing_request"
    static let ERR_CONVERTING_TO_HTTP_RESPONSE = "error_converting_response_to_http_response"
    static let ERR_PARSE_RESPONSE = "error_parsing_response"
    static let ERR_NIL_BODY = "error_nil_body"
    static let ERR_PARSE_ERROR_RESPONSE = "error_parsing_error_response"
    
    //server
    static let ERR_USER_EXIST = "user already exist"
    static let ERR_USER_NOT_EXIST = "user not exist"
    static let ERR_WRONG_CREDENTIALS = "wrong credentials"
    static let ERR_MISSING_AUTH_HEADER = "missing auth header or wrong header format"

}
