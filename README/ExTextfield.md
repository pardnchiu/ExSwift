# ExTextField 文檔

## 概述
ExTextField 是 UITextField 的擴展類，提供增強的文字輸入功能、鍵盤配置和視圖自定義能力。

## 初始化
```swift
// 創建基本輸入框
let textField = ExTextField()

// 創建帶代理的輸入框
let textField = ExTextField(delegate: self)

// 創建帶子視圖的輸入框
let textField = ExTextField {
    customView1
    customView2
}

// 使用變量引用
var myTextField: ExTextField?
ExTextField(&myTextField, delegate: self)
```

## 基本配置

- ### 文字設置
    ```swift
    func text(
        _ value: String? = nil,            // 文字內容
        color: UIColor? = nil,             // 文字顏色
        alignment: NSTextAlignment? = nil, // 對齊方式
        type: UITextContentType? = nil,    // 文字類型
        placeholder: String? = nil         // 佔位文字
    ) -> Self

    // 示例
    textField.text(
        "輸入文字",
        color: .black,
        alignment: .left,
        type: .name,
        placeholder: "請輸入..."
    )
    ```
- ### 字體設置
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
    textField.font(
        .systemFont(ofSize: 16),
        weight: .medium,
        italic: false,
        sizeToFit: true
    )
    ```

## 鍵盤配置

### keyboard 方法
```swift
func keyboard(
    type: UIKeyboardType? = nil,             // 鍵盤類型
    appearance: UIKeyboardAppearance? = nil, // 鍵盤外觀
    returnKey: UIReturnKeyType? = nil        // 返回鍵類型
) -> Self

// 示例
textField.keyboard(
    type: .emailAddress,
    appearance: .light,
    returnKey: .done
)
```

## 視圖自定義

### leftView 方法
```swift
func leftView(
    mode: UITextField.ViewMode? = nil,
    rightMode: UITextField.ViewMode? = nil,
    @ExSubBuilder builder: () -> UIView
) -> Self

// 示例
textField.leftView(mode: .always) {
    ExImageView(UIImage(named: "icon"))
}
```

### rightView 方法
```swift
func rightView(
    mode: UITextField.ViewMode? = nil,
    rightMode: UITextField.ViewMode? = nil,
    @ExSubBuilder builder: () -> UIView
) -> Self

// 示例
textField.rightView(mode: .whileEditing) {
    ExButton("清除")
}
```

## 代理設置

### delegate 方法
```swift
func delegate(_ delegate: UITextFieldDelegate?) -> Self

// 示例
textField.delegate(self)
```

## 使用示例

### 基本配置
```swift
let textField = ExTextField()
    .text(placeholder: "請輸入用戶名", color: .black)
    .font(size: 16)
    .keyboard(type: .default)
```

### 完整配置
```swift
let textField = ExTextField(delegate: self)
    .text(placeholder: "電子郵件", type: .emailAddress)
    .font(size: 16, weight: .medium)
    .keyboard(type: .emailAddress, returnKey: .next)
    .leftView(mode: .always) {
        ExImageView(UIImage(named: "mail-icon"))
    }
```

### 特殊樣式
```swift
let searchField = ExTextField()
    .text(placeholder: "搜索")
    .keyboard(type: .search)
    .leftView(mode: .always) {
        ExImageView(UIImage(named: "search"))
    }
    .rightView(mode: .whileEditing) {
        ExButton("取消")
    }
```

## 注意事項

1. **高度限制**
   - 使用 frame 設置高度時會自動添加高度約束
   - 約束優先級為 `.defaultHigh`

2. **字體設置**
   - 預設字體大小為 17pt
   - 支持動態字體縮放

3. **視圖模式**
   - 左右視圖可以設置不同的顯示模式
   - 支持自定義視圖內容

4. **自動佈局**
   - 完全支持自動佈局系統
   - 自動管理約束衝突
