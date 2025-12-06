//
//  Skills.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//
import SwiftUI

@Observable class Skills: Identifiable, Hashable {
    let id: UUID
    let type: SkillType
    let skills: [String]

    init(id: UUID = UUID(), type: SkillType, skills: [String]) {
        self.id = id
        self.type = type
        self.skills = skills
    }

    // MARK: - Equatable
    static func == (lhs: Skills, rhs: Skills) -> Bool {
        return lhs.id == rhs.id && lhs.type == rhs.type && lhs.skills == rhs.skills
    }

    // MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(type)
        hasher.combine(skills)
    }
}


enum SkillType: String {
    case technical = "Technical Skills"
    case soft = "Soft Skills"
}
