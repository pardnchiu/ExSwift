## ExLabel

> [!Note]
> 包含 **ExView** 所有方法

- `text`
    > [!Note]
    > 功能： 設定標籤的文字、顏色、對齊方式、行數以及換行模式。
    ```Swift
    func text(_ value: String? = "", color: UIColor? = nil, alignment: NSTextAlignment? = nil, line: Int? = nil, breakMode: NSLineBreakMode? = nil) -> Self
    ```
    ```Swift
    label.text("Hello, World!", color: .black, alignment: .center, line: 1, breakMode: .byWordWrapping)
    ```
- `font`
    > [!Note]
    > 功能： 設定標籤文字的字體、字型名稱、大小、字重、是否斜體，以及是否調整字體大小以適應標籤大小。
    ```Swift
    func font(_ font: UIFont? = nil, name: String? = nil, size: CGFloat? = nil, weight: UIFont.Weight? = nil, italic: Bool? = nil, sizeToFit: Bool? = nil) -> Self
    ```
    ```Swift
    label.font(name: "Helvetica", size: 14, weight: .bold, italic: true, sizeToFit: true)
    ```
- `padding`
    > [!Note]
    > 功能： 設定標籤內邊距，支持統一設置或單方向設置。
    ```Swift
    func padding(_ value: CGFloat? = nil, top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) -> ExLabel
    ```
    ```Swift
    label.padding(top: 8, left: 12, bottom: 8, right: 12)
    label.padding(8)   // 四邊一致
    label.padding()    // 四邊一致 (預設 16)
    ```
- `if`
    > [!Note]
    > 功能： 根據條件執行某段操作。
    ```Swift
    func `if`(label bool: Bool, _ _self: (UILabel) throws -> Void) rethrows -> Self
    ```
    ```Swift
    label.if(自訂條件為真) { label in
        label.textColor = .blue
    }
    ```