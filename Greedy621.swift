//
//  Greedy621.swift
//  Algorithms
//
//  Created by Uji Saori on 2021-04-12.
//

import Foundation

class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var freqs = [Character : Int]()
        var maxFreq = 0
        var maxFreqCount = 0

        for task in tasks {
            let newFreq = freqs[task, default: 0] + 1
            freqs[task] = newFreq
            if maxFreq == newFreq {
                maxFreqCount += 1
            } else if maxFreq < newFreq {
                maxFreq = newFreq
                maxFreqCount = 1
            }
        }

        let emptySlotCount = (maxFreq - 1) * (n - maxFreqCount + 1)
        let idleCount = emptySlotCount - (tasks.count - maxFreq * maxFreqCount)

        if emptySlotCount < 0 || idleCount < 0 {
            return tasks.count
        } else {
            return tasks.count + idleCount
        }
    }
}
