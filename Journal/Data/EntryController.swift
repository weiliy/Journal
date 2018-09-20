//
//  EntryController.swift
//  Journal
//
//  Created by Weili Yi  on 2018/9/3.
//  Copyright © 2018 Weili Yi. All rights reserved.
//

import UIKit

class EntryController {
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    var tags: [String] {
        var tags = Set<String>()
        entries.forEach {
            tags.update(with: $0.tag.capitalized)
        }
        return Array(tags).sorted()
    }
    
    init() {
        let entry1 = Entry(title: "My first Entry", body: "this is y first entry", tag: "Journal", color: .lightGray)
        let entry2 = Entry(title: "My 2 Entry", body: "this is y first entry", tag: "Journal", color: .lightGray)
        let entry3 = Entry(title: "My 3 Entry", body: "this is y first entry this is y first entrythis is y first entrythis is y first entrythis is y first entrythis is y first entrythis is y first entrythis is y first entrythis is y first entrythis is y first entry", tag: "Journal", color: .lightGray)
        let entry4 = Entry(title: "My 4 Entry", body: "this is y first entry", tag: "journal", color: .lightGray)
        let entry5 = Entry(title: "My 5 Entry", body: "this is y first entry", tag: "Journal", color: .lightGray)
        
        entries = [entry1, entry2, entry3, entry4, entry5]
    }
    
    // CRUD
    
    func createEntry(withTitle title: String,
                     body: String,
                     tag: String? = nil,
                     color: UIColor) {
        let entry = Entry(title: title, body: body, tag: tag ?? "Untagged", color: color)
        entries.append(entry)
        // Save
    }
    
    func getEntry(at indexPath: IndexPath) -> Entry {
        // let tag = tags[indexPath.section]
        // let entries = getEntries(with: tag)
        return entries[indexPath.row]
    }
    
    func getEntries(with tag: String) -> [Entry] {
        return entries.filter { $0.tag.lowercased() == tag.lowercased() }
    }
    
    func updateEntry(_ entry: Entry,
                     with title: String,
                     body: String,
                     tag: String? = nil,
                     color: UIColor) {
        guard let index = entries.index(of: entry) else { return }
        entries[index].title = title
        entries[index].body = body
        entries[index].tag = tag ?? "Untagged"
        entries[index].color = color
        // Save
    }
    
    func deleteEntry(_ entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        entries.remove(at: index)
        // Save
    }
}
