*此項目還是舊版代碼*
製作新版 Framework ，後續會釋出方便進行導入。

優化各項目擴展
新版功能如下

<details>
<summary>Enum 擴展</summary>

- ExSwiftEdgeSet
  用於 `border` 方法設置邊框位置
  ```Swift
  enum ExSwiftEdgeSet {
    	case top
    	case bottom
    	case leading
    	case trailing
    	case horizontal
    	case vertical
    	case all
  }
  ```

</details>

<details>
<summary>UIView 擴展</summary>

> [!NOTE]
> 提供了一系列便捷的鏈式調用函數，快速設置 UIView 的屬性，包括背景、圓角、邊框、陰影、縮放、旋轉等功能。

## 功能

- 父視圖控制器
  `parentViewController`: 獲取當前 UIView 所屬的 UIViewController
- Frame 設置
  `frame(x:y:width:height:)`: 設置或更新 UIView 的位置與大小
- 背景設置
  `background(color:image:tintColor:)`: 設置背景顏色或圖片
- 透明度
  `alpha(_ value:)`: 設置 UIView 的透明度
- 圓角
  `radius(_:corner:)`: 設置圓角大小與位置
- 邊框
  `border(color:width:target:)`: 為視圖添加邊框
- 陰影
  `shadow(x:y:blur:color:alpha:)`: 添加陰影效果
- 縮放
  `scale(width:height:ratio:)`: 按比例或指定尺寸縮放
- 旋轉
  `rotate(_ angle:)`: 旋轉視圖
- 子視圖與子層操作
  `subview(_ views:)`: 添加子視圖
  `sublayer(_ layers:)`: 添加子層
  `bringToFront(_ views:)`: 將子視圖移至最前
- 條件操作
  `if(_:void:)`: 條件執行操作
- 擷取畫面
  `draw(_:_:completion:)`: 擷取當前視圖畫面

### 範例

- 基本視圖操作
  ```Swift
  let myView = UIView()
      .frame(x: 50, y: 100, width: 200, height: 100)
      .background(color: .blue)
      .alpha(0.8)
      .radius(20)
      .shadow(x: 5, y: 5, blur: 10, color: .black, alpha: 0.5)
  ```
- 設置部分圓角
  ```Swift
  myView.radius(20, corner: [.topLeft, .topRight])
  ```
- 添加背景圖片
  ```Swift
  myView.background(image: UIImage(named: "background"), tintColor: .gray)
  ```
- 添加子視圖與子層
  ```Swift
  myView.subview([
      UIView()
          .frame(x: 10, y: 10, width: 50, height: 50)
          .background(color: .red)
  ])
  ```
- 巢狀結構添加元件
  ```Swift
  myView.subview([
      UIView()
        .frame(x: 0, y: 0, width: 300, height: 400)
        .background(color: .white)
        .subview([
            // 子視圖 1：標題容器
            UIView()
                .frame(x: 10, y: 10, width: 280, height: 50)
                .background(color: .lightGray)
                .subview([
                    UILabel()
                        .frame(x: 10, y: 10, width: 260, height: 30)
                        .background(color: .clear)
                        .if(true) { label in
                            label.text = "標題"
                            label.textColor = .black
                            label.textAlignment = .center
                        }
                ]),
    
            // 子視圖 2：按鈕容器
            UIView()
                .frame(x: 10, y: 70, width: 280, height: 300)
                .background(color: .gray)
                .subview([
                    UIButton()
                        .frame(x: 20, y: 20, width: 120, height: 40)
                        .background(color: .blue)
                        .if(true) { button in
                            button.setTitle("按鈕1", for: .normal)
                            button.setTitleColor(.white, for: .normal)
                        },
    
                    UIButton()
                        .frame(x: 140, y: 20, width: 120, height: 40)
                        .background(color: .red)
                        .if(true) { button in
                            button.setTitle("按鈕2", for: .normal)
                            button.setTitleColor(.white, for: .normal)
                        }
                ])
        ])
  ])
  ```
- 擷取畫面
  ```Swift
  myView.draw(200, 100) { image in
      print("成功擷取畫面")
  }
  ```
- 條件執行
  ```Swift
  myView.if(myView.alpha > 0.5) { view in
      view.background(color: .green)
  }
  ```
- 添加邊框
  ```Swift
  myView.border(color: .black, width: 2, target: [.top, .bottom])
  ```
- 旋轉視圖
  ```Swift
  myView.rotate(45)
  ```
  
</details>
