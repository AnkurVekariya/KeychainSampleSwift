//
//  keychain.swift
//  KeyachainDemo
//
//  Created by Ankur on 10/12/18.
//  Copyright © 2018 ankur. All rights reserved.
//

import UIKit

class KeyChain {
    
    //save value as data in keychain
    class func save(key: String, data: NSData) -> OSStatus {
        
        let query = [
            kSecClass as String       : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecValueData as String   : data ] as [String : Any]
        
        SecItemDelete(query as CFDictionary)
        
        return SecItemAdd(query as CFDictionary, nil)
        
    }
    
    class func load(key: String) -> NSData? {
        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecReturnData as String  : kCFBooleanTrue,
            kSecMatchLimit as String  : kSecMatchLimitOne ] as [String : Any]
        
        var dataTypeRef:AnyObject? = nil
        
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == noErr {
            return (dataTypeRef! as! NSData)
        } else {
            return nil
        }
    }
    
    class func stringToNSDATA(string : String)->NSData
    {
        let _Data = string.data(using: .utf8)!
        return _Data as NSData
        
    }
    
    
    class func NSDATAtoString(data: NSData)->String
    {
        
        let returned_string = String(data: data as Data, encoding: String.Encoding.utf8) as! String
        
        return returned_string
    }
    
//    class func intToNSDATA(r_Integer : Int)->NSData
//    {
//
//        var SavedInt: Int = r_Integer
//        let _Data = NSData(bytes: &SavedInt, length: sizeof(Int))
//        return _Data
//
//    }
//    class func NSDATAtoInteger(_Data : NSData) -> Int
//    {
//        var RecievedValue : Int = 0
//        _Data.getBytes(&RecievedValue, length: sizeof(Int))
//        return RecievedValue
//
//    }
    class func CreateUniqueID() -> String
    {
        let uuid: CFUUID = CFUUIDCreate(nil)
        let cfStr:CFString = CFUUIDCreateString(nil, uuid)
        
        let nsTypeString = cfStr as NSString
        let swiftString:String = nsTypeString as String
        return swiftString
    }
}
