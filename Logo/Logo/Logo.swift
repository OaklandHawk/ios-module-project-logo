//
//  Logo.swift
//  Logo
//
//  Created by Taylor Lyles on 9/11/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

struct Lines {
	let width: CGFloat
	let length: CGFloat
	let color: UIColor
	var value: Int = 0
}


class Logo: UIView {

	private var line1 = Lines(width: 3.0, length: 3.0, color: .green, value: 0)
	private var line2 = Lines(width: 3.0, length: 3.0, color: .red, value: 0)
	private var line3 = Lines(width: 3.0, length: 3.0, color: .blue, value: 0)
	
	private var lineHandEndPoint: CGPoint {
		let line1AsRadians = Float(Double(line1.value) / 60 * 2.0 * Double.pi - Double.pi / 2)
		let lineLength = CGFloat(frame.size.width / line1.length)
		return handEndPoint(with: line1AsRadians, and: lineLength)
	}
	
	private let bgColor = UIColor.yellow
	private let borderColor = UIColor.green
	private let borderWidth: CGFloat = 2.0
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.clear
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		backgroundColor = UIColor.clear
	}

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
		
		if let context = UIGraphicsGetCurrentContext() {
			
			// BottomLine
			context.move(to: CGPoint(x: 4.5,
									 y: 249.5))
			context.addLine(to: CGPoint(x: 304,
										y: 249.5))
			context.setStrokeColor(UIColor.green.cgColor)
			context.setLineWidth(borderWidth)
			context.strokePath()
			
			// LeftLine
			context.move(to: CGPoint(x: 4.5,
									 y: 249.5))
			context.addLine(to: CGPoint(x: 154,
										y: 2))
			context.setStrokeColor(UIColor.green.cgColor)
			context.setLineWidth(borderWidth)
			context.strokePath()
			
			// RightLine
			context.move(to: CGPoint(x: 154,
									 y: 2))
			context.addLine(to: CGPoint(x: 304,
										y: 249.5))
			context.setStrokeColor(UIColor.green.cgColor)
			context.setLineWidth(borderWidth)
			context.strokePath()
			
			// TopRightLine
			context.move(to: CGPoint(x: 154,
									 y: 2))
			context.addLine(to: CGPoint(x: 305.5,
										y: 81.5))
			context.setStrokeColor(UIColor.green.cgColor)
			context.setLineWidth(borderWidth)
			context.strokePath()
			
			
		}
		
    }

	private func handEndPoint(with radianValue: Float, and handLength: CGFloat) -> CGPoint {
		return CGPoint(x: handLength * CGFloat(cosf(radianValue)) + frame.size.width / 2.0,
					   y: handLength * CGFloat(sinf(radianValue)) + frame.size.height / 2.0)
	}

}
