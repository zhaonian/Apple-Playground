//
// Created by Zhaonian Luan on 7/26/20.
// Copyright (c) 2020 zluan.io. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(element: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == element.id {
                return index
            }
        }
        return nil
    }
}
