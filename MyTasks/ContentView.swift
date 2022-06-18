//
//  ContentView.swift
//  MyTasks
//
//  Created by Danny Wade on 18/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {

            // Background
            Color.pink.ignoresSafeArea()

            // Content
            MenuView()
        }
    }
}

struct MenuView: View {

    @State var showSheet: Bool = false

    var body: some View {
        VStack {
            Spacer()
            Text("My Tasks:")
                .foregroundColor(.white)
                .font(.title)
                .padding(.bottom, 2)

            Text("5")
                .foregroundColor(.white)
                .font(.largeTitle)

            Spacer()

            Button {
                showSheet.toggle()
            } label: {
                Text("View Tasks")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.cyan
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    )
            }

            .fullScreenCover(isPresented: $showSheet) {
                TaskView()
            }
            Spacer()
        }
    }
}



struct TaskView: View {

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.cyan.ignoresSafeArea()

            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.pink)
                    .font(.largeTitle)
                    .padding(20)
            }


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        TaskView()
    }
}
