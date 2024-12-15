//
//  GradientSlider.swift
//  demo
//
//  Created by PL Smarann Khadka on 15/12/2024.
//
import SwiftUI

// Gradient slider implementation
struct GradientSlider: UIViewRepresentable {
    @Binding var value: Double

    func makeUIView(context: Context) -> CustomSlider {
        let slider = CustomSlider()
        slider.minimumTrackTintColor = .clear
        slider.maximumTrackTintColor = .clear
        slider.setThumbImage(UIImage(systemName: "circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged), for: .valueChanged)

        // Configure gradient layer
        slider.configureGradientLayer()

        return slider
    }

    func updateUIView(_ uiView: CustomSlider, context: Context) {
        // Update slider value
        uiView.value = Float(value)
        uiView.updateGradientLayer()
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: GradientSlider

        init(_ parent: GradientSlider) {
            self.parent = parent
        }

        @objc func valueChanged(_ sender: UISlider) {
            parent.value = Double(sender.value)
        }
    }
}
