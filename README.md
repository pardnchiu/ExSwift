*此項目還是舊版代碼*
製作新版 Framework ，後續會釋出方便進行導入。

優化各項目擴展

<details>
<summary>UIView</summary>

```Swift
import ExSwift

view.subview([
  UIView()
    // 設定形狀，指定視圖的 x, y 座標和寬高
    .frame(x: CGFloat? = nil, y: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil)
    // 設定背景樣式，可指定背景顏色、背景圖片及背景圖片的色調（tintColor）
    .background(color: UIColor? = nil, image: UIImage? = nil, tintColor: UIColor? = nil)
    // 設定視圖透明度，取值範圍為 0.0（完全透明）到 1.0（完全不透明）
    .alpha(_ value: CGFloat))
    // 設定圓角，可針對每個圓角單獨設置半徑（corner 支持 [UIRectCorner] 指定圓角位置），
    // 並且會記錄過往的圓角設置，當後續需要修改時，可基於此前設置進行更新。
    .radius(_ value: CGFloat? = nil, corner: [UIRectCorner]? = nil)
    // 設定裁剪內容，view 為 true 表示裁剪視圖範圍，layer 為 true 表示裁剪圖層範圍
    .clip(view: Bool = true, layer: Bool = true)
    // 設定陰影效果，包括偏移量（x, y）、模糊半徑、顏色和透明度
    .shadow(x: CGFloat? = nil, y: CGFloat? = nil, blur: CGFloat? = nil, color: UIColor? = nil, alpha: Float? = nil)
    // 設定邊框樣式，包括顏色、寬度，以及可選的目標邊框（target 支持 [ExSwiftEdgeSet] 指定目標邊），
    // 同時會記錄過往邊框位置的設置，用於後續增量修改或狀態恢復。
    // 未連接的邊緣處將保持直角樣式（不會自動套用圓角），以確保視覺一致性。
    .border(color: UIColor, width: CGFloat, target: [ExSwiftEdgeSet]? = nil)
    // 設定縮放比例，支持單獨設定寬度、高度或整體縮放比例（ratio）
    .scale(width: CGFloat? = nil, height: CGFloat? = nil, ratio: CGFloat? = nil)
    // 設定旋轉角度，以弧度為單位進行旋轉
    .rotate(_ angle: CGFloat)
    // 添加子視圖
    .subview(_ views: [UIView])
    // 添加子層（CALayer）
    .sublayer(_ layers: [CALayer])
    // 將指定的子視圖帶到最前面
    .bringToFront(_ views: [UIView])
    // 條件判斷：
    // 僅在條件 (條件) 為 true 時，執行內部的相關設定。
    // - `e: UIView` 表示當前視圖對象，開發者可以在閉包中對視圖進行操作。
    // - 典型應用場景：根據條件決定是否需要進一步自定義視圖樣式或屬性。
    .if (條件) { e in
        // e.backgroundColor = .red // 當條件成立時，設置背景色為紅色
        // e.isHidden = false       // 顯示視圖
    }
    // 視圖截圖操作：
    // 將當前視圖轉換為 UIImage 對象，並將生成的圖片 (e: UIImage) 傳入閉包中，供後續進行處理。
    // - `e: UIImage` 表示生成的截圖，開發者可以對截圖進行保存、顯示或其他操作。
    // - 典型應用場景：生成視圖的快照作為縮略圖或進行視覺效果處理。
    .draw { e in
        // UIImageWriteToSavedPhotosAlbum(e, nil, nil, nil)  // 將截圖保存到相冊
        // print("截圖已生成：\(e)")                            // 輸出截圖信息
    }
])
```
  
</details>
