//
//  Skills.swift
//  sume
//
//  Created by Rezamir Rahizar on 13/11/2025.
//

struct Skills: Hashable {
    let skills: [SkillType: [String]]
}


enum SkillType {
    case technical
    case soft
}
