//
//  AnimationView.swift
//  NYTBooks-Group-Project
//
//  Created by David Lin on 2/18/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit
import Lottie

class AnimationView: UIView {
    
    private lazy var animationView: Lottie.AnimationView = {
        let lottieAnimationView = Lottie.AnimationView()
        lottieAnimationView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return lottieAnimationView
    }()
    
    
    public func startAnimation() {
        animationView.animation = Animation.named("bookStackAnimation", subdirectory: nil)
        animationView.play()
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commonInit()
    }
    
    
    private func commonInit() {
        animationViewConstraint()
    }
    
    private func animationViewConstraint() {
        addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -100),
            animationView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            animationView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 100)
        ])
    }
}
