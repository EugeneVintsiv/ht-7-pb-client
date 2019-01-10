//
// Created by Eugene on 1/7/19.
// Copyright (c) 2019 Eugene. All rights reserved.
//

import Foundation

struct NetworkError: Decodable, Model {
    let message: String

    init(message: String) {
        self.message = message
    }
}
