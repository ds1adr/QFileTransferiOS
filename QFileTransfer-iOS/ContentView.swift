//
//  ContentView.swift
//  QFileTransfer-iOS
//
//  Created by Wontai Ki on 3/29/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Text("Host IP:")
                        TextField("", text: $viewModel.hostIP)
                    }
                    HStack {
                        Text("Port:")
                        TextField("", text: $viewModel.port)
                    }
                }
                Button("Connect") {
                    viewModel.connect()
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
