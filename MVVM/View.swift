//
//  Presenter.swift
//  MVVM
//
//  Created by DaoNV on 4/1/17.
//  Copyright © 2017 Asian Tech Co., Ltd. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    public static let viewDidUpdated = NSNotification.Name("viewDidUpdated")
}

@objc public protocol View: class {
    @objc optional var viewModel: ViewModel { set get }
    @objc optional func updateView()
}

extension View {
    public func viewDidUpdated() {
        let nc = NotificationCenter.default
        nc.post(name: .viewDidUpdated, object: self)
    }
}

extension View where Self: ViewModelDelegate {
    func viewModel(_ viewModel: ViewModel, didChangeItemsAt indexPaths: [IndexPath], changeType: ChangeType) {
        updateView?()
    }
}
