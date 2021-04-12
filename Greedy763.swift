//
//  Greedy763.swift
//  Algorithms
//
//  Created by Uji Saori on 2021-04-12.
//

import Foundation

class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        var lastIndexes: [Character: Int] = [:]
        for (index, char) in S.enumerated() {
            lastIndexes[char] = index
        }

        var curIndex = 0
        var lastIndex = 0
        var result: [Int] = []
        for (index, char) in S.enumerated() {
            lastIndex = max(lastIndex, lastIndexes[char] ?? 0)
            if index == lastIndex {
                result.append(index - curIndex + 1)
                curIndex = index + 1
            }
        }
        return result
    }
}
