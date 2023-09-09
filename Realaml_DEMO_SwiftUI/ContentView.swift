//
//  ContentView.swift
//  Realaml_DEMO_SwiftUI
//
//  Copyright © 2023 Realaml. All rights reserved.
//

import SwiftUI
import Realaml

struct ContentView: View {

    @State private var isPresented = false

    @State private var kycResult: KYCView.Result?

    private let signKey = "YOUR_SIGNATURE_KEY"

    var body: some View {
        VStack {
            Button("Start KYC") {
                isPresented = true
            }
            .buttonStyle(.borderedProminent)
        }
        .fullScreenCover(isPresented: $isPresented) {
            KYCView(environment: .staging, signatureKey: signKey, result: $kycResult)
        }
        .navigationTitle("Realaml SwiftUI Demo")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
