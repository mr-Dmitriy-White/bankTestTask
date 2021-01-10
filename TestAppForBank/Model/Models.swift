//
//  Models.swift
//  TestAppForBank
//
//  Created by Dima Biliy on 10.01.2021.
//

import Foundation

// MARK: - GitModel
struct GitModel: Codable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [ItemGit]
}

// MARK: - Item
struct ItemGit: Codable  {
    let stargazers_count: Int
    let name: String
}
