//
//  CustomSlider.swift
//  demo
//
//  Created by PL Smarann Khadka on 15/12/2024.
//

import SwiftUI
// Custom UISlider with gradient handling
class CustomSlider: UISlider {
    private var gradientLayer: CAGradientLayer?

    func configureGradientLayer() {
        // Create gradient layer
        let gradientLayer = CAGradientLayer()
        let uiColor = UIColor(red: 170/255, green: 0/255, blue: 255/255, alpha: 0.1)
        let cgColor = uiColor.cgColor
        gradientLayer.colors = [
            cgColor,
            UIColor(red: 0.7, green: 0.2, blue: 1.0, alpha: 1).cgColor  // End with purple
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 10 // Rounded corners for thin track

        // Insert the gradient layer
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.gradientLayer = gradientLayer
        updateGradientLayer() // Initial gradient update
    }

    func updateGradientLayer() {
        guard let gradientLayer = gradientLayer else { return }

        // Calculate the width of the gradient layer based on the thumb position
        let thumbPosition = CGFloat(value) * (bounds.width - thumbWidth()) + thumbWidth() / 2
        gradientLayer.frame = CGRect(
            x: 0, // Start at the beginning of the slider
            y: bounds.midY - 1.5, // Align vertically and center
            width: thumbPosition, // End at the thumb's position
            height: 3 // Thin track height
        )
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientLayer() // Update gradient when layout changes
    }

    private func thumbWidth() -> CGFloat {
        // Approximate thumb width
        return currentThumbImage?.size.width ?? 0
    }
}
