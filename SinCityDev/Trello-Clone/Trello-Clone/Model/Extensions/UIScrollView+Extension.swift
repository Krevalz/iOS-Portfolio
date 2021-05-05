//
//  UIScrollView+Extension.swift
//  Trello-Clone
//
//  Created by Amanuel Ketebo on 11/19/17.
//  Copyright © 2017 SinCityDev. All rights reserved.
//

import UIKit

extension UIScrollView {
    func scrollToMostRight() {
        let rect = CGRect(x: self.contentSize.width - 1,y: 0, width: 1, height: 1)
        self.scrollRectToVisible(rect, animated: true)
    }
}
