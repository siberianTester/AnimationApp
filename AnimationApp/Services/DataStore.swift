//
//  DataStore.swift
//  AnimationApp
//
//  Created by Yaroslav Malygin on 26.11.2024.
//

import SpringAnimation

final class DataStore {
    
    static var shared = DataStore()
    
    let animations = AnimationPreset.allCases
    let curves = AnimationCurve.allCases
    
    private init() {}
}
