//
//  TCPClient.swift
//  QFileTransfer-iOS
//
//  Created by Wontai Ki on 3/29/26.
//

import Foundation

class TCPClient {
    let host: String
    let port: UInt
    private var inputStream: InputStream?
    
    init(host: String, port: UInt, inputStream: InputStream? = nil) {
        self.host = host
        self.port = port
        self.inputStream = inputStream
    }
    
    func connect() -> Bool {
        var readStream: Unmanaged<CFReadStream>?
        CFStreamCreatePairWithSocketToHost(nil, host as CFString, UInt32(port), &readStream, nil)
        
        guard let readStream = readStream?.takeRetainedValue() else {
            return false
        }
        
        inputStream = readStream
        inputStream?.open()
        return true
    }

    func disconnect() {
        inputStream?.close()
        inputStream = nil
    }
}
