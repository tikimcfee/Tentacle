//
//  Branch.swift
//  Tentacle
//
//  Created by Romain Pouclet on 2017-02-15.
//  Copyright © 2017 Matt Diephouse. All rights reserved.
//

import Foundation
import Argo
import Runes
import Curry

extension Repository {
    // https://developer.github.com/v3/repos/branches/#list-branches
    internal var branches: Request<[Branch]> {
        return Request(method: .get, path: "/repos/\(owner)/\(name)/branches")
    }
}

public struct Branch {

    /// Name of the branch
    public let name: String

    /// Sha of the commit the branch points to
    public let sha: SHA

    public init(name: String, sha: SHA) {
        self.name = name
        self.sha = sha
    }
}

extension Branch: Hashable {
    public static func ==(lhs: Branch, rhs: Branch) -> Bool {
        return lhs.name == rhs.name && lhs.sha == rhs.sha
    }

    public var hashValue: Int {
        return name.hashValue ^ sha.hashValue
    }
}

extension Branch: ResourceType {
    public static func decode(_ j: JSON) -> Decoded<Branch> {
        let f = curry(Branch.init)

        return f
            <^> j <| "name"
            <*> j <| "commit"
    }
}
