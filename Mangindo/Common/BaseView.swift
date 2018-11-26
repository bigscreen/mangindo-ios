//
//  BaseView.swift
//  Mangindo
//
//  Created by Gallant Pratama on 27/11/18.
//  Copyright © 2018 Gallant Pratama. All rights reserved.
//

protocol BaseView: class {
    func startLoading()
    func stopLoading()
    func showData()
    func showAlert(message: String)
}
