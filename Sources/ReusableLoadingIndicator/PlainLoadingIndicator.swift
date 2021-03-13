//
//  PlainLoadingIndicator.swift
//  ReusableLoadingIndicator
//
//  Created by Alexander Karaatanasov on 13.03.21.
//

import UIKit

public class PlainLoadingIndicator: UIActivityIndicatorView {
    
    public var isLoading: Bool = false {
        didSet {
            if isLoading {
                self.startAnimating()
            } else {
                self.stopAnimating()
            }
        }
    }
    
    // MARK: - Init
    
    public init(centeredIn view: UIView?) {
        super.init(style: .medium)
        // setup activity indicator
        self.hidesWhenStopped = true
        self.translatesAutoresizingMaskIntoConstraints = false
        if let parentView = view {
            // add as a subview to parent
            parentView.addSubview(self)
            // setup center constraints
            self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
            self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public
    
    public func show() {
        isLoading = true
    }

    public func hide() {
        isLoading = false
    }
    
}
