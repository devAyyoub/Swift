//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Ayyoub on 23/1/25.
//

import SwiftUI

struct ContentView: View {
    @State private var names : [String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? "" : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            TextField("Name to add: ", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty && !names.contains(nameToAdd) {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            HStack {
                Button {
                    if let randomName = names.randomElement() {
                        withAnimation {
                            pickedName = randomName
                            
                            if shouldRemovePickedName {
                                names.removeAll { name in
                                    return (name == pickedName)
                                }
                            }
                        }
                        
                    } else {
                        pickedName = ""
                    }
                } label : {
                    Text("Pick Random Name")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                }
                .buttonStyle(.borderedProminent)
                .font(.title3)
                
                Button {
                    if let randomName = names.randomElement() {
                        withAnimation {
                            pickedName = randomName
                            pickedName = ""
                        }
                    }
                } label : {
                    Text("Delete Random Name")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                }
                .buttonStyle(.borderedProminent)
                .font(.title3)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
