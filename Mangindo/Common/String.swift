//
//  String.swift
//  Mangindo
//
//  Created by Gallant Pratama on 06/12/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

extension String {
    
    func isNotAddUrl() -> Bool {
        let adsKeywords = ["iklan", "all_anime", "ik.jpg", "rekrut", "ilan.jpg", "animeindonesia", "IKLAN2", "Credit", "animeindonesia", "lowongan"]
        return adsKeywords.allSatisfy({ !self.contains($0) })
    }
}
