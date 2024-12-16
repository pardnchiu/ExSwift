# ExText 文檔

## 概述
ExText 是 UILabel 的擴展類，提供更豐富的文字顯示和樣式配置功能，支持鏈式調用和聲明式語法

## 初始化
```swift
// 創建空標籤
let label = ExText()

// 創建帶文字的標籤
let label = ExText("Hello World")

// 創建帶子視圖的標籤
let label = ExText {
    innerView1
    innerView2
}

// 使用變量引用
var myLabel: ExText?
ExText(&myLabel, "Hello World")
```

## 文字設置

### text 方法
設置標籤的文字內容和樣式。
```swift
func text(
    _ value: String? = nil,         // 文字內容
    color: UIColor? = nil,          // 文字顏色
    alignment: NSTextAlignment? = nil, // 文字對齊
    line: Int? = nil,               // 行數
    breakMode: NSLineBreakMode? = nil // 換行模式
) -> Self

// 示例
label.text(
    "Hello World",
    color: .black,
    alignment: .center,
    line: 2,
    breakMode: .byTruncatingTail
)
```

## 字體設置

### font 方法
設置標籤的字體屬性。
```swift
func font(
    _ value: UIFont? = nil,         // 字體
    name: String? = nil,            // 字體名稱
    size: CGFloat? = nil,           // 字體大小
    weight: UIFont.Weight? = nil,   // 字重
    italic: Bool? = nil,            // 是否斜體
    sizeToFit: Bool? = nil          // 是否自適應大小
) -> Self

// 示例
label.font(
    .systemFont(ofSize: 16),
    weight: .bold,
    italic: true,
    sizeToFit: true
)

// 使用自定義字體
label.font(
    name: "Arial",
    size: 18,
    weight: .medium
)
```

## 內邊距設置

### padding 方法
設置標籤的內邊距。
```swift
func padding(
    _ value: CGFloat? = nil,        // 統一內邊距
    vertical: CGFloat? = nil,       // 垂直內邊距
    horizontal: CGFloat? = nil,     // 水平內邊距
    top: CGFloat? = nil,           // 上邊距
    left: CGFloat? = nil,          // 左邊距
    bottom: CGFloat? = nil,        // 下邊距
    right: CGFloat? = nil          // 右邊距
) -> ExText

// 示例
// 設置統一內邊距
label.padding(16)

// 設置不同方向的內邊距
label.padding(
    vertical: 12,
    horizontal: 16
)

// 設置詳細內邊距
label.padding(
    top: 10,
    left: 15,
    bottom: 10,
    right: 15
)
```

## 條件配置

### if 方法
根據條件配置標籤。
```swift
func `if`(
    label bool: Bool,
    _ _self: (ExText) throws -> Void
) rethrows -> Self

// 示例
label.if(shouldHighlight) { label in
    label.text(color: .red)
        .font(weight: .bold)
}
```

## 自動佈局支持
ExText 完全支持自動佈局系統：
- 自動計算內容大小
- 支持內邊距調整
- 自動處理約束

### 示例
```swift
let label = ExText("標籤文字")
    .text(color: .black, alignment: .center)
    .font(size: 16, weight: .medium)
    .padding(horizontal: 16, vertical: 8)
```

## 特性
1. **智能尺寸調整**
   - 自動計算內容大小
   - 支持自適應字體大小
   - 考慮內邊距影響

2. **彈性文字配置**
   - 支持多行文字
   - 可配置換行方式
   - 靈活的對齊方式

3. **豐富的字體選項**
   - 支持自定義字體
   - 可調整字重
   - 支持斜體樣式

4. **精確的邊距控制**
   - 支持統一邊距
   - 可分別設置四個方向的邊距
   - 動態更新佈局

5. **鏈式調用支持**
   ```swift
   label
       .text("標題", color: .black)
       .font(size: 16, weight: .bold)
       .padding(16)
   ```

6. **條件式配置**
   支持根據條件動態設置樣式。

7. **自動佈局整合**
   完全支持 Auto Layout 系統。
