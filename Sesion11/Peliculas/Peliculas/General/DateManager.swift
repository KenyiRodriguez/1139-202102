//
//  DateManager.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 27/10/21.
//

import Foundation


extension String {
    
    func toDateWithFormat(_ format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}

extension Date {
    
    func toStringWithFormart(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "es_PE")
        return dateFormatter.string(from: self)
    }
}
