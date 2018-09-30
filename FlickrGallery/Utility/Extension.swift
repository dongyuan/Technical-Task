//
//  Extension.swift
//  FlickrGallery
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import UIKit

extension UIImageView {
    func from(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async { [weak self] in
                    self?.image = UIImage(data: data)
                }
            }
        }
    }
}

extension Date {
    func formattedDate(locale: Locale) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: self)
    }
}
