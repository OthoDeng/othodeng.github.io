#import "@preview/cetz:0.5.2": canvas, draw
#import "@preview/cetz-plot:0.1.4": plot

#let ink = rgb("30343b")
#let blue = rgb("487a9b")
#let teal = rgb("438b83")
#let violet = rgb("88739e")
#let guide = rgb("d8dde1")

#let plot-style() = draw.set-style(axes: (
  stroke: (paint: ink, thickness: 0.55pt),
  tick: (
    stroke: (paint: ink, thickness: 0.55pt),
    length: -0.07cm,
    label: (offset: 0.07cm),
  ),
  label: (offset: 0.38cm),
))

#let activation-panel(letter, title, fn, color, limits, step) = block[
  #set text(font: "Arial", size: 8pt, fill: ink)
  #align(left)[#text(weight: "bold", letter) #h(4pt) #title]
  #v(5pt)
  #canvas({
    plot-style()
    plot.plot(
      size: (3.5, 2.8), axis-style: "scientific-auto",
      x-min: -4, x-max: 4, y-min: limits.at(0), y-max: limits.at(1),
      x-tick-step: 2, y-tick-step: step,
      x-label: [Input, z], y-label: [Output],
      {
        plot.add-hline(0, style: (stroke: guide + 0.45pt))
        plot.add-vline(0, style: (stroke: guide + 0.45pt))
        plot.add(fn, domain: (-4, 4), samples: 161,
          style: (stroke: color + 1.2pt))
      },
    )
  })
]

#let activation-figure() = figure(
  block(width: 100%, breakable: false, fill: white, inset: 6pt)[
    #grid(
      columns: (1fr, 1fr, 1fr), gutter: 10pt,
      activation-panel("a", "ReLU", z => calc.max(0, z), blue, (-0.2, 4.2), 2),
      activation-panel("b", "Sigmoid", z => 1 / (1 + calc.exp(-z)), teal, (-0.05, 1.05), 0.5),
      activation-panel("c", "tanh", z => calc.tanh(z), violet, (-1.1, 1.1), 1),
    )
  ],
  caption: [激活函数的输入—输出关系。三个面板采用相同输入范围，纵轴范围分别标注。ReLU 在负值区间输出零；Sigmoid 和 tanh 在两端逐渐饱和，梯度接近零。曲线直接由函数表达式计算。],
)

#let pca-panel(letter, title, rotated: false) = block[
  #set text(font: "Arial", size: 8pt, fill: ink)
  #align(left)[#text(weight: "bold", letter) #h(4pt) #title]
  #v(5pt)
  #canvas({
    import draw: *
    plot-style()
    plot.plot(
      size: (4.4, 4.4), axis-style: "scientific-auto",
      x-min: -3, x-max: 3, y-min: -3, y-max: 3,
      x-tick-step: 2, y-tick-step: 2,
      x-label: if rotated { [PC1 score] } else { [Feature 1 (centred)] },
      y-label: if rotated { [PC2 score] } else { [Feature 2 (centred)] },
      {
        plot.add-hline(0, style: (stroke: guide + 0.45pt))
        plot.add-vline(0, style: (stroke: guide + 0.45pt))
        plot.add(t => {
          let u = 2.5 * calc.cos(t)
          let v = 0.7 * calc.sin(t)
          if rotated { (u, v) } else { ((u - v) / calc.sqrt(2), (u + v) / calc.sqrt(2)) }
        }, domain: (0, 2 * calc.pi), samples: 181,
          style: (stroke: ink + 0.9pt))
        if rotated {
          plot.add(((-2.7, 0), (2.7, 0)), style: (stroke: blue + 1.1pt))
          plot.add(((0, -1.2), (0, 1.2)), style: (stroke: violet + 1.1pt))
          plot.annotate(resize: false, {
            content((1.7, 1.55), text(blue)[Keep PC1])
          })
        } else {
          let d = 2.7 / calc.sqrt(2)
          plot.add(((-d, -d), (d, d)), style: (stroke: blue + 1.1pt))
          let e = 1.2 / calc.sqrt(2)
          plot.add(((-e, e), (e, -e)), style: (stroke: violet + 1.1pt))
          plot.annotate(resize: false, {
            content((2.15, 2.25), text(blue)[PC1])
            content((-1.35, 1.2), text(violet)[PC2])
          })
        }
      },
    )
  })
]

#let pca-figure() = figure(
  block(width: 100%, breakable: false, fill: white, inset: 6pt)[
    #grid(columns: (1fr, 1fr), gutter: 18pt,
      pca-panel("a", "Principal directions"),
      pca-panel("b", "Principal-component coordinates", rotated: true),
    )
  ],
  caption: [PCA 的几何示意。椭圆由参数方程构造，表示沿两个正交方向具有不同尺度的数学形状。a，蓝色 PC1 沿较长方向，紫色 PC2 与其正交。b，转换为主成分坐标后，保留 PC1 得到一维表示，同时舍弃 PC2 方向的信息。两个面板均采用相同的横纵比例；图中未使用观测样本或估计解释方差比例。],
)
