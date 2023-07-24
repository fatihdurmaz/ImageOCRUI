//
//  File.swift
//  
//
//  Created by Fatih Durmaz on 24.07.2023.
//

import Foundation

public struct ScannedText: Identifiable {
    public let id: UUID = UUID()
    public var scannedText: String
}
