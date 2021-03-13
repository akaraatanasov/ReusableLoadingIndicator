//
//  LoadingIndicator.swift
//  ReusableLoadingIndicator
//
//  Created by Alexander Karaatanasov on 13.03.21.
//

import UIKit

public struct LoadingIndicator {
    
    // MARK: - Static Properties
    
    private static var instance: LoadingIndicator?
    
    public static var isRunning: Bool {
        return LoadingIndicator.instance != nil
    }
    
    // MARK: - Stored Properties
    
    private let parentView: UIView?
    private let loadingText: String
    
    // MARK: - Views
    
    private let containerView: UIView
    private let activityIndicatorView: PlainLoadingIndicator
    private let loadingTextLabel: UILabel
    
    // MARK: - Init
    
    private init(in view: UIView? = UIViewController.topMostController?.view, with loadingText: String = Constants.emptyText) {
        self.parentView = view
        self.loadingText = loadingText
        
        // setup container view
        self.containerView = UIView()
        containerView.frame = CGRect(x: 0.0, y: 0.0, width: 140, height: 100)
        containerView.center = CGPoint(x: UIScreen.main.bounds.size.width / 2.0, y: UIScreen.main.bounds.size.height / 2.0)
        containerView.layer.cornerRadius = 8.0
        containerView.clipsToBounds = true
        
        // setup background blur view
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = containerView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        containerView.addSubview(blurEffectView)
        
        // setup activity indicator
        self.activityIndicatorView = PlainLoadingIndicator(centeredIn: containerView)
        
        // setup loading label
        self.loadingTextLabel = UILabel()
        loadingTextLabel.textColor = UIColor.black
        loadingTextLabel.text = loadingText
        loadingTextLabel.font = UIFont.systemFont(ofSize: 11)
        loadingTextLabel.sizeToFit()
        loadingTextLabel.center = CGPoint(x: containerView.bounds.midX, y: containerView.bounds.midY + 30)
        containerView.addSubview(loadingTextLabel)
        
        setupConstraints()
    }
    
    // MARK: - Private
    
    private func setupConstraints() {
        // TODO: - Add Constraints instead of relying on the center propery
    }

    
    // MARK: - Public
    
    public static func show(in view: UIView? = nil, with loadingText: String? = nil) {
        guard instance == nil else {
            print("ReusableLoadingIndicator: You still have an active loading indicator, please hide it before showing a new one")
            return
        }
        instance = LoadingIndicator(in: view ?? UIViewController.topMostController?.view, with: loadingText ?? Constants.emptyText)
        instance!.parentView?.addSubview(instance!.containerView)
        instance!.activityIndicatorView.startAnimating()
    }
    
    public static func hide() {
        guard instance != nil else {
            print("ReusableLoadingIndicator: You don't have an active loading indicator, please show one before hiding it")
            return
        }
        instance!.activityIndicatorView.stopAnimating()
        instance!.containerView.removeFromSuperview()
        instance = nil
    }
    
}

extension LoadingIndicator {
    
    enum Constants {
        
        static let emptyText = ""
        
    }
    
}
