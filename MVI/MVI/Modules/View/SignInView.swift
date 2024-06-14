//
//  ContentView.swift
//  MVI
//
//  Created by Eldiiar on 8/5/24.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel: SignInViewModel = SignInViewModel<SignInState, SignInAction, SignInMiddleware<SignInAction>>(initialState: SignInState.init(), reducer: SignInReducer(), middleware: SignInMiddleware())
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .onTapGesture {
                    viewModel.sendAction(action: .getProfile)
                }
            
            Text("Hello, world!")
                .onTapGesture {
                    viewModel.sendAction(action: .navigation(destination: .detail))
                }
            
            if let profile = viewModel.state.profile {
                Text(profile.name + " " + profile.surname)
            }

        }
        .padding()
        .navigationDestination(item: Binding(get: { viewModel.state.route } , set: { _ in viewModel.sendAction(action: .navigation(destination: nil))}), destination: { type in
            switch type {
            case .detail:
                MainView()
            case .empty:
                EmptyView()
            }
        })
//        .navigationDestination(isPresented: Binding(get: { viewModel.state.show }, set: { _ in viewModel.sendAction(action: .showHide) })) {
//            MainView()
//        }
        
    }
}
