新版 Framework 正在優化中，後續將釋出給各位方便整合導入。

新版擴展特色與功能優化

新版擴展將對項目進行全面升級，針對各項擴展進行優化，並引入以下核心改進：
- 避免與原生方法衝突
  除了少量需要在原生擴展以外，剩餘自定義擴展功能將採用繼承方式，獨立命名空間，確保穩定性和兼容性。
- 統一命名與類型設計
  新版將對常見 UIKit 元件提供專屬子類，結構清晰，使用更靈活。
  例如：
  - UIView → ExZStack
  - UILabel → ExText
  - UIButton → ExButton
  - UIImageView → ExImage
  - UITextfield → ExTextField
  - UITextView → ExTextEditor
  - UIStackView → ExVStack, ExHStack, ExStack
  - UIScrollView → ExVScroll, ExHScroll, ExScroll

- 高效功能整合
新版框架將集成多項優化功能，簡化開發流程，提升代碼可讀性與可維護性。

## 文檔 (還在整理，後續會主要用網站展示)
- [ExZStack](./README/ExZStack.md)
- [ExText](./README/ExText.md)
- [ExButton](./README/ExButton.md)
- [ExImage](./README/ExImage.md)
- [ExTextField](./README/ExTextfield.md)
- [ExTextEditor](./README/ExTextEditor.md)
- [ExStack](./README/ExStack.md)
- [ExScroll](./README/ExScroll.md)

## 範例

> [!Note]
> 快速構建複雜界面 使用鏈式語法與巢狀結構，無需冗長的屬性設定語句，即可快速構建層次清晰的 UI 元件，顯著提升代碼的可讀性與可維護性。

```Swift
var bool = false;
myView.subview([
    // 主容器視圖
    ExView()
        .frame(x: 0, y: 0, width: 300, height: 400) // 設置框架大小
        .background(color: .white) // 背景設為白色
        .subview([
            // 子視圖 1：標題容器
            ExView()
                .frame(x: 10, y: 10, width: 280, height: 50) // 設置大小與位置
                .background(color: .lightGray) // 背景設為淺灰
                .subview([
                    ExLabel()
                        .frame(x: 10, y: 10, width: 260, height: 30) // 設置標籤框架
                        .text("標題1", color: .red, alignment: .center) // 設置標題文字
                        .background(color: .clear) // 背景透明
                        .if(bool) { label in
                            label.text("標題2", color: .black, alignment: .center) // 設置標題文字
                        }
                ]),

            // 子視圖 2：按鈕容器
            ExView()
                .frame(x: 10, y: 70, width: 280, height: 300) // 按鈕容器框架
                .background(color: .gray) // 背景設為灰色
                .subview([
                    ExButton()
                        .frame(x: 20, y: 20, width: 120, height: 40) // 按鈕1框架
                        .background(color: .blue) // 按鈕默認背景藍色
                        .text("按鈕1", color: .red, state: .normal) // 按鈕文字紅色
                        .action(.touchUpInside) { button in
                            button
                                .background(color: .red) // 點擊後背景變紅
                                .text("已點擊", color: .white, state: .normal) // 文字變白
                        },
                    ExButton()
                        .frame(x: 140, y: 20, width: 120, height: 40) // 按鈕2框架
                        .background(color: .red, state: .normal) // 按鈕默認背景紅色
                        .background(color: .blue, state: .disabled) // 禁用時背景藍色
                        .text("按鈕2", color: .red, state: .normal) // 默認文字紅色
                        .text("已停用", state: .disabled) // 禁用時文字
                        .action(.touchUpInside) { button in
                            button.isEnabled = false // 點擊後禁用按鈕
                        }
                ])
        ])
])
```