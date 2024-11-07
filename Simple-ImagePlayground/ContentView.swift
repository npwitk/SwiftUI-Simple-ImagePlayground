//
//  ContentView.swift
//  Simple-ImagePlayground
//
//  Created by Nonprawich I. on 07/11/2024.
//

import SwiftUI
import ImagePlayground

struct ContentView: View {
    @State private var showImagePlayground: Bool = false
    @State private var imageURL: URL?
    
    var body: some View {
        VStack {
            if let imageURL {
                AsyncImage(url: imageURL, scale: 1, content: { image in
                    image.resizable().aspectRatio(contentMode: .fit).frame(maxHeight: 300)
                }, placeholder: { EmptyView() })
                .frame(height: 300)
            }
            Button {
                showImagePlayground.toggle()
            } label: {
                Label("Image Playground", systemImage: "apple.image.playground")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .imagePlaygroundSheet(isPresented: $showImagePlayground, concept: "", onCompletion: {
            self.imageURL = $0
        })
    }
}

#Preview {
    ContentView()
}
