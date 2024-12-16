# ExZStack 文檔

## 概述
ExZStack 是 UIView 的擴展類，提供定制和佈局管理接口。它通過鏈式方法擴展 UIView，使視圖配置更具聲明性和可讀性。

## 基礎屬性和方法

### 視圖層級
#### parentViewController
獲取當前視圖的父視圖控制器。
```swift
var parentViewController: UIViewController?

// 示例：查找父控制器
if let parentVC = myView.parentViewController {
    print("找到父控制器：\(parentVC)")
}
```

### 佈局與定位

#### layoutPriority
設置內容延展和壓縮阻力的優先級。
```swift
func layoutPriority(
    vertical: UILayoutPriority? = nil, 
    horizontal: UILayoutPriority? = nil,
    verticalHugging: UILayoutPriority? = nil,
    horizontalHugging: UILayoutPriority? = nil,
    verticalCompression: UILayoutPriority? = nil,
    horizontalCompression: UILayoutPriority? = nil
) -> Self

// 示例
myView.layoutPriority(
    vertical: .required,
    horizontal: .defaultLow
)
```

#### frame
設置視圖的框架屬性，支持靈活的參數選項。
```swift
func frame(
    rect: CGRect? = nil,
    origin: CGPoint? = nil,
    size: CGSize? = nil,
    x: CGFloat? = nil,
    y: CGFloat? = nil,
    width: CGFloat? = nil,
    height: CGFloat? = nil
) -> Self

// 示例
myView.frame(x: 10, y: 20, width: 200, height: 100)
```

### 外觀

#### background
設置背景顏色或圖片，可選擇調整色調。
```swift
func background(
    color: UIColor? = nil,
    image: UIImage? = nil,
    tintColor: UIColor? = nil
) -> Self

// 示例
myView.background(color: .red)                                     // 設置紅色背景
myView.background(image: UIImage(named: "background"))            // 設置背景圖片
myView.background(
    image: UIImage(named: "background"),
    tintColor: .blue
)                                                                 // 設置帶藍色調的背景圖片
```

#### alpha
設置視圖透明度。
```swift
func alpha(_ value: CGFloat) -> Self

// 示例
myView.alpha(0.5)    // 50% 透明度
```

#### radius
設置圓角，支持指定特定角落。
```swift
func radius(
    _ value: CGFloat? = nil,
    corner: [UIRectCorner]? = nil
) -> Self

// 示例
myView.radius(10, corner: [.topLeft, .bottomRight])    // 左上和右下設置圓角
```

#### clip
控制視圖和圖層的內容裁剪。
```swift
func clip(
    view: Bool? = nil,
    layer: Bool? = nil
) -> Self

// 示例
myView.clip()                // 同時裁剪視圖和圖層
myView.clip(view: true)      // 僅裁剪視圖
myView.clip(layer: true)     // 僅裁剪圖層
```

#### shadow
添加陰影效果，可自定義屬性。
```swift
func shadow(
    x: CGFloat? = nil,
    y: CGFloat? = nil,
    radius: CGFloat? = nil,
    color: UIColor? = nil,
    opacity: Float? = nil
) -> Self

// 示例
myView.shadow(
    x: 5,
    y: 5,
    radius: 10,
    color: .black,
    opacity: 0.3
)
```

#### border
為指定邊緣添加邊框。
```swift
func border(
    color: UIColor,
    width: CGFloat,
    target: [ExEdge]? = nil
) -> Self

// 示例
myView.border(
    color: .blue,
    width: 2,
    target: [.trailing, .bottom]    // 添加右邊和底部邊框
)
```

### 變換

#### scale
按寬度、高度或統一比例縮放視圖。
```swift
func scale(
    width: CGFloat? = nil,
    height: CGFloat? = nil,
    ratio: CGFloat? = nil
) -> Self

// 示例
myView.scale(width: 150, height: 200)    // 指定寬高縮放
myView.scale(ratio: 1.5)                 // 統一縮放 1.5 倍
```

#### rotate
按指定角度旋轉視圖。
```swift
func rotate(_ angle: CGFloat) -> Self

// 示例
myView.rotate(45)    // 旋轉 45 度
```

### 視圖管理

#### subview
使用聲明式語法或數組添加子視圖。
```swift
// 聲明式語法
func subview(@ExZStackBuilder _ builder: () -> [UIView]) -> Self

// 數組語法
func subview(_ views: [UIView]) -> Self

// 示例
myView.subview {
    childView1
    childView2
}
myView.subview([childView1, childView2])
```

#### sublayer
使用聲明式語法或數組添加 CALayer 實例。
```swift
// 聲明式語法
func sublayer(@ExLayerBuilder _ builder: () -> [CALayer]) -> Self

// 數組語法
func sublayer(_ layers: [CALayer]) -> Self

// 示例
myView.sublayer {
    layer1
    layer2
}
myView.sublayer([layer1, layer2])
```

#### bringToFront
將指定視圖移至視圖層級的前端。
```swift
func bringToFront(_ views: [UIView]) -> Self

// 示例
myView.bringToFront([childView])
```

### 工具方法

#### draw
捕獲視圖為圖片。
```swift
func draw(
    _ width: CGFloat,
    _ height: CGFloat,
    _ completion: @escaping (UIImage?) -> Void
)

// 示例
myView.draw(300, 400) { image in
    guard let image else { return }
    // 使用捕獲的圖片
}
```

## 自動佈局

### 水平約束

#### leftEqualTo
設置左邊緣相對於其他視圖的對齊。
```swift
func leftEqualTo(
    left: UIView? = nil,
    centerX: UIView? = nil,
    right: UIView? = nil,
    _ value: CGFloat? = nil
) -> Self

// 示例
myView.leftEqualTo(left: otherView, value: 10)     // 左邊距離其他視圖左邊 10 點
myView.leftEqualTo(centerX: otherView)             // 左邊對齊其他視圖中心
myView.leftEqualTo(right: otherView, value: -15)   // 左邊距離其他視圖右邊 15 點
```

相關方法：
- `leftGreaterThan`：設置最小距離
- `leftLessThan`：設置最大距離
- `rightEqualTo`：對齊右邊
- `rightGreaterThan`：設置右邊最小距離
- `rightLessThan`：設置右邊最大距離
- `centerXEqualTo`：水平居中對齊
- `centerXGreaterThan`：設置中心點最小 X 距離
- `centerXLessThan`：設置中心點最大 X 距離

### 垂直約束

#### topEqualTo
設置頂部邊緣相對於其他視圖的對齊。
```swift
func topEqualTo(
    top: UIView? = nil,
    centerY: UIView? = nil,
    bottom: UIView? = nil,
    _ value: CGFloat? = nil
) -> Self

// 示例
myView.topEqualTo(top: otherView, value: 10)       // 頂部距離其他視圖頂部 10 點
myView.topEqualTo(centerY: otherView)              // 頂部對齊其他視圖中心
myView.topEqualTo(bottom: otherView, value: -15)   // 頂部距離其他視圖底部 15 點
```

相關方法：
- `topGreaterThan`：設置最小距離
- `topLessThan`：設置最大距離
- `bottomEqualTo`：對齊底部
- `bottomGreaterThan`：設置底部最小距離
- `bottomLessThan`：設置底部最大距離
- `centerYEqualTo`：垂直居中對齊
- `centerYGreaterThan`：設置中心點最小 Y 距離
- `centerYLessThan`：設置中心點最大 Y 距離

### 尺寸約束

#### widthEqualTo
設置寬度相對於其他視圖或固定值。
```swift
func widthEqualTo(
    width: UIView? = nil,
    height: UIView? = nil,
    _ value: CGFloat? = nil
) -> Self

// 示例
myView.widthEqualTo(width: otherView)           // 寬度等於其他視圖的寬度
myView.widthEqualTo(height: otherView)          // 寬度等於其他視圖的高度
myView.widthEqualTo(value: 100)                 // 固定寬度為 100
```

相關方法：
- `widthGreaterThan`：設置最小寬度
- `widthLessThan`：設置最大寬度
- `heightEqualTo`：設置高度
- `heightGreaterThan`：設置最小高度
- `heightLessThan`：設置最大高度
