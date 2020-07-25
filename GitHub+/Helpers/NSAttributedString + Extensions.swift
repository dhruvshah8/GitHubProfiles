//
//  NSAttributedString + Extensions.swift
//  GitHub+
//
//  Created by Dhruv Shah on 2020-07-25.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import UIKit

extension NSAttributedString {
	
	// Attributed text string with prepended image attachment
	convenience init?(image: UIImage?, text: String) {
		guard let image = image?.withRenderingMode(.alwaysTemplate) else { return nil }

		// image
		let imageAttachment = NSTextAttachment(image: image)
		let imageString = NSAttributedString(attachment: imageAttachment)

		// text
		let textString = NSAttributedString(string: " " + text)

		// result
		let resultString = NSMutableAttributedString(attributedString: imageString)
		resultString.append(textString)
		
		self.init(attributedString: resultString)
	}
}
