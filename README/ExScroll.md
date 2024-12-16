# ExScroll 系列文檔

## 概述
ExScrollView 提供了一系列基於 UIScrollView 的擴展類，包括：
- `ExScrollView`：基礎滾動視圖類
- `ExHScroll`：水平滾動視圖
- `ExVScroll`：垂直滾動視圖
- `ExScroll`：通用滾動視圖

### 配置設定
```swift
func config(
    axis: NSLayoutConstraint.Axis? = nil,
    indicator: Bool? = nil,
    bounces: Bool? = nil,
    delegate: UIScrollViewDelegate? = nil
) -> ExScrollView
```
配置滾動視圖的基本屬性：
- `axis`：滾動方向
- `indicator`：是否顯示滾動指示器
- `bounces`：是否允許回彈效果
- `delegate`：滾動視圖代理

### 條件執行
```swift
func `if`(button bool: Bool, _ _self: (ExScrollView) throws -> Void) rethrows -> Self
```
根據條件執行指定的代碼塊。

## ExHScroll
專門用於水平滾動的視圖類。

### 特性
- 強制水平滾動（`.horizontal`）
- 自動處理內容大小
- 支持鏈式配置

### 初始化方法
```swift
// 基本初始化
init()

// 帶配置的初始化
init(
    indicator: Bool = true,
    bounces: Bool = true,
    delegate: UIScrollViewDelegate? = nil
)

// 帶子視圖的初始化
init(
    indicator: Bool = true,
    bounces: Bool = true,
    delegate: UIScrollViewDelegate? = nil,
    @ExViewBuilder builder: () -> [UIView]
)

// 帶變量引用的初始化
init(
    _ variable: inout ExScrollView?,
    indicator: Bool = true,
    bounces: Bool = true,
    delegate: UIScrollViewDelegate? = nil
)

// 帶變量引用和子視圖的初始化
init(
    _ variable: inout ExScrollView?,
    indicator: Bool = true,
    bounces: Bool = true,
    delegate: UIScrollViewDelegate? = nil,
    @ExViewBuilder builder: () -> [UIView]
)
```

## ExVScroll
專門用於垂直滾動的視圖類。

### 特性
- 強制垂直滾動（`.vertical`）
- 自動處理內容大小
- 支持鏈式配置

### 初始化方法
```swift
// 基本初始化
init()

// 帶配置的初始化
init(
    indicator: Bool = true,
    bounces: Bool = true,
    delegate: UIScrollViewDelegate? = nil
)

// 帶子視圖的初始化
init(
    indicator: Bool = true,
    bounces: Bool = true,
    delegate: UIScrollViewDelegate? = nil,
    @ExViewBuilder builder: () -> [UIView]
)

// 帶變量引用的初始化
init(
    _ variable: inout ExScrollView?,
    indicator: Bool = true,
    bounces: Bool = true,
    delegate: UIScrollViewDelegate? = nil
)

// 帶變量引用和子視圖的初始化
init(
    _ variable: inout ExScrollView?,
    indicator: Bool = true,
    bounces: Bool = true,
    delegate: UIScrollViewDelegate? = nil,
    @ExViewBuilder builder: () -> [UIView]
)
```

## ExScroll
通用滾動視圖類，支持自定義滾動方向。

### 特性
- 可配置滾動方向
- 完整的配置選項
- 支持子視圖建構器

### 初始化方法
```swift
// 基本初始化
init()

// 帶配置的初始化
init(
    axis: NSLayoutConstraint.Axis? = nil,
    indicator: Bool = true,
    bounces: Bool = true,
    delegate: UIScrollViewDelegate? = nil
)

// 帶子視圖的初始化
init(
    axis: NSLayoutConstraint.Axis? = nil,
    indicator: Bool = true,
    bounces: Bool = true,
    delegate: UIScrollViewDelegate? = nil,
    @ExViewBuilder builder: () -> [UIView]
)

// 帶變量引用的初始化
init(
    _ variable: inout ExScrollView?,
    axis: NSLayoutConstraint.Axis? = nil,
    indicator: Bool = true,
    bounces: Bool = true,
    delegate: UIScrollViewDelegate? = nil
)

// 帶變量引用和子視圖的初始化
init(
    _ variable: inout ExScrollView?,
    axis: NSLayoutConstraint.Axis? = nil,
    indicator: Bool = true,
    bounces: Bool = true,
    delegate: UIScrollViewDelegate? = nil,
    @ExViewBuilder builder: () -> [UIView]
)
```

## 使用示例

### 創建水平滾動視圖
```swift
let hScroll = ExHScroll(indicator: true, bounces: true) {
    someView1
    someView2
    someView3
}
```

### 創建垂直滾動視圖
```swift
let vScroll = ExVScroll(indicator: false) {
    titleLabel
    contentView
    bottomButton
}
```

### 創建通用滾動視圖
```swift
let scroll = ExScroll(
    axis: .vertical,
    indicator: true,
    bounces: true
) {
    headerView
    bodyContent
    footerView
}
```

### 使用變量引用
```swift
var myScroll: ExScrollView?
ExHScroll(&myScroll, indicator: true) {
    // 子視圖
}
```
