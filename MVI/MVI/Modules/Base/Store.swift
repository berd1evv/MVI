//
//  Store.swift
//  MVI
//
//  Created by Eldiiar on 8/5/24.
//

import Foundation

class Store<S: ViewState, A: Action, M: Middleware>: ObservableObject {
    @Published private(set) var state: S
    private let reducer: any Reducer<S, A>
    private var middlewares: (any Middleware<A>)?
    private let logger: Logger
    
    init(initialState: S, reducer: any Reducer<S, A>, middleware: M? = nil) {
        self.state = initialState
        self.reducer = reducer
        self.middlewares = middleware as? any Middleware<A>
        self.logger = SentryLogger()
    }
    
    internal func dispatch(_ action: any Action) {
        logger.log(action.description)
        reducer.reduce(currentState: &state, action: action as! A)
        logger.log(state.rawValue)
        
        let newAction = middlewares?.process(command: action as! A)
        if let newAction = newAction {
            dispatch(newAction)
        }
    }
}
