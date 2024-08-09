//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by Gulfem ALBAYRAK on 9.08.2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}
class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
