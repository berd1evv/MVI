//
//  MainView.swift
//  MVI
//
//  Created by Eldiiar on 9/5/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel = MainViewModel<MainState, MainAction, MainMiddleware<MainAction>>(initialState: MainState(), reducer: MainReducer(), middleware: MainMiddleware())
    var body: some View {
        Text(viewModel.state.mainInfo?.welcomTitle ?? "")
            .onAppear(perform: {
                viewModel.sendAction(action: .getMainInfo)
            })
    }
}

#Preview {
    MainView()
}
