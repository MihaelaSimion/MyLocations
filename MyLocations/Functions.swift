//
//  Functions.swift
//  MyLocations
//
//  Created by Mihaela Simion on 8/17/18.
//  Copyright © 2018 Mihaela Simion. All rights reserved.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds,
                                  execute: run)
}
