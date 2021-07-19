//
//  Reducer.swift
//  iPodTestApp
//
//  Created by TJ Littlejohn on 7/13/21.
//

import Foundation
import Combine

func combine<Value, Action>(
  _ reducers: (inout Value, Action) -> Void...
) -> (inout Value, Action) -> Void {
  return { value, action in
    for reducer in reducers {
      reducer(&value, action)
    }
  }
}

final class Store<Value, Action>: ObservableObject {
    let reducer: (inout Value, Action) -> Void
    @Published var value: Value
    
    init(initialValue: Value, reducer: @escaping (inout Value, Action) -> Void) {
        self.reducer = reducer
        self.value = initialValue
    }
    
    func send( action: Action ) {
        self.reducer(&self.value, action)
    }
    
    func pullback<LocalValue, GlobalValue, Action>(
      _ reducer: @escaping (inout LocalValue, Action) -> Void,
      value: WritableKeyPath<GlobalValue, LocalValue>
    ) -> (inout GlobalValue, Action) -> Void {
      return { globalValue, action in
        reducer(&globalValue[keyPath: value], action)
      }
    }
    
}

struct AppState {
    
    
    
}

enum AppAction {
    
    case clockwise
    case counterClockwise
    case backSeek
    case menu
    case playPause
    case fowardSeek
    case buttonClick
    
}
