//
//  ViewModel.swift
//  QFileTransfer-iOS
//
//  Created by Wontai Ki on 3/29/26.
//

import Combine
import Foundation

class ViewModel: ObservableObject {
    @Published var hostIP: String = ""
    @Published var port: String = "8989"
    
    private var tcpClient: TCPClient?
    
    func connect() {
        guard let portNumber = UInt(port) else {
            print("Invalid port number")
            return
        }
        
        tcpClient = TCPClient(host: hostIP, port: portNumber)
        if tcpClient?.connect() == true {
            print("Connected to \(hostIP):\(port)")
        } else {
            print("Failed to connect to \(hostIP):\(port)")
        }
    }
    
    func disconnect() {
        tcpClient?.disconnect()
        print("Disconnected from \(hostIP):\(port)")
    }
}




