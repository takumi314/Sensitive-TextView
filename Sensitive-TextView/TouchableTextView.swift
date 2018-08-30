//
//  TouchableTextView.swift
//  Sample-ExclusionRect-TextView
//
//  Created by Kohey Nishioka on 2018/08/30.
//  Copyright © 2018 text. All rights reserved.
//

import UIKit

class TouchableTextView: UITextView {

    /// 指がタッチパネルに触れながら移動させるとコールされる
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

        // タッチ位置を取得
        let touch = touches.first
        let locationInView = touch!.location(in: self)
        
        // テキストコンテナの座標系に変換
        let locationContainer = CGPoint(x: locationInView.x - self.textContainerInset.left,
                                        y: locationInView.y - self.textContainerInset.top)
        
        // 円形の非表示領域を定義
        let rect = CGRect(x: locationContainer.x - 40.0,
                          y: locationContainer.y - 40.0,
                          width: 80.0,
                          height: 80.0)
        let path = UIBezierPath(ovalIn: rect)
        
        // 非表示領域を適用
        self.textContainer.exclusionPaths = [path]

    }
    
    /// 指がタッチパネルから離れるタイミングでコールされる
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.textContainer.exclusionPaths = []
        
    }
    
}
