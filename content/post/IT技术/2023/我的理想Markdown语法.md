---
date: 2023-09-10 11:13
update_time: 2023-09-22 12:25
slug: daobox-extend-markdown
weight: 100
---

**本页目录**

[TOC]

# 更新日志

## 2023-09-22

**新增**

* [宏](#daobox-macro)`{{daobox::include()}}`包含
* [内部链接](#inner-link)
* [页内锚点](#page-anchor)

## 2023-09-12

比较难找到符合需求的Markdown解析器，所以花了些时间自己实现了个。已集成至[道盒发布]，免费使用，Enjoy! :non-potable_water: :-1: :+1: :tada::tada::tada:

---

用了这么长时间文本编辑器，总对格式不能自由掌控感到不快，直到使用了Markdown。Markdown是近年来较为流行的文本标记语言，简单易用是它的核心特点，因为简单，所以格式不是那么丰富，在某些场景下无法满足需求，若是退回，则又回到开始，纠结使用哪个编辑器。索性今天整理下Markdown语法诉求，看看能否对其扩展，以满足日常需求？

# 基础语法 ✅

1. 基于[Markdown标准语法](https://daringfireball.net/projects/markdown/syntax)[^markdown-syntax]。部分格式有几种表达方式，这里仅罗列其一种。
2. 补充[Github Markdown](https://github.github.com/gfm/)[^gfm]扩展语法。

<pre>

# 一级标题
## 二级标题
### 三级标题
#### 四级标题
##### 五级标题
###### 六级标题


* 无序列表1
* 无序列表2
* 无序列表3


1. 有序列表1
1. 有序列表2
1. 有序列表3
1. 可以顺序标号，或者全部用1
    最终渲染时会自动矫正编号。
    如果前面带有缩进，会自动归为上个列表项的范围。


`行内代码`


```js
console.log('代码块+语法高亮')
```


水平分割线
---


[链接](https://www.daobox.cn "标题可省略")
[页内链接](#链接ID)


![图片替换描述](/path/to/img.jpg "图片标题可省略")


*斜体*
**粗体**
***粗斜体***


> 引用内容
> 嵌套内容可以包含上面的格式
> > 嵌套引用内容

</pre>


# 语法扩展


## 宏 {#daobox-macro}

### TOC (Table of content) ✅

对于长篇大作，良好的目录索引（TOC）对阅读很有帮助，所以需要增加TOC的宏标记，渲染时自动替换。效果见本页开始。

```markdown
[TOC]
```

```markdown
{{daobox::toc()}}
```

可选参数：

* `level` 搜索的标题级别，默认 `level=3`

```markdown
{{daobox::toc(level=5)}}
```


### 包含外部文件

渲染时将指定文件内容包含进来。仅允许常见的[ul]#**纯文本**#文件，常见扩展名为md, txt, csv, js等程序源文件。

```markdown
{{daobox::include(file="_xx.md")}}
```

可选参数：

* `as` 输出格式。取值范围：
    1. `plain`(默认值)，渲染时原样输出
    1. `table` 尝试解析为表格
    1. `code` 代码
* `lang` 编程语言，仅 `as="code"` 时有效。

```markdown
{{daobox::include(file="_xx.csv", as="table")}}
```

```markdown
{{daobox::include(file="_xx.js", as="code", lang="js")}}
```

## 内部链接 {#inner-link}

适用于项目内的文件跳转。

```markdown
[[文件名]]

[[文件名?dir="目录"]]

[[网页路径/文件名?dir="目录"]]
```

## 页内锚点 ✅ {#page-anchor}

适用于页面内部不同位置之间的跳转。目前仅适用于标题:exclamation:。

标题增加`id`属性后会自动生成锚点，如果未指定`id`属性，默认使用`HA-`加上标题内容地址化[^slugify]生成锚点，可在链接中使用`#id`实现页内锚点跳转。


## 自动转换链接 ✅

```markdown
<https://www.daobox.cn>
```

hello <https://www.daobox.cn>{target=_blank color=red} world


## 标题、链接、图片扩展属性 ✅ {.main .shine #the-site lang=zh}

可以对下面块增加属性，属性支持CSS样式名，ID，和其他自定义属性

1. 标题 ✅
2. 链接 ✅
3. 图片 ✅

```markdown
带有扩展属性的[道盒](https://www.daobox.cn){color=orangered}链接。

![Air](https://images.unsplash.com/photo-1564979045531-fa386a275b27?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2532&q=80 "蓝天与狗尾巴草"){style="border-radius: 1em;"}
```

带有扩展属性的[道盒](https://www.daobox.cn){color=orangered}链接。

![Air](https://images.unsplash.com/photo-1564979045531-fa386a275b27?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2532&q=80 "蓝天与狗尾巴草"){style="border-radius: 1em;"}


## 段落属性 ✅

```markdown
{bgcolor="rgba(0,0,0,0.1)" color=blue underline pa=1em coner=0.5em}
这是一段区块示例内容，它拥有扩展属性。
```

{bgcolor="rgba(0,0,0,0.1)" color=blue underline pa=1em coner=0.5em}
这是一段区块示例内容，它拥有扩展属性。

## 文字颜色、背景色、字体 ✅

```markdown
[color=red, bgcolor=yellow .nice]#赤色#

[font=宋体]#我是有不一样的字体#
```

我有[color=red, bgcolor=yellow .nice .girl]#赤色#的文本和[color=blue]#蓝色#内容。

我是有[font="思源宋体 CN"]#不一样的字体#,
我有[font=阿里妈妈东方大楷]#阿里妈妈东方大楷#

## 表格 ✅

<pre>
First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell
</pre>

或者两端加上管道符

<pre>
| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |
</pre>

单元格对齐

<pre>
| 默认对齐   | 左对齐 | 中对齐 | 右对齐 |
| ---       | :---  | :---: | ---:  |
| Content   | Content | Content | Content |
| Content   | Content | Content | Content |
</pre>

{align=center .my-table}
| 默认对齐   | 左对齐 | 中对齐 | 右对齐 |
| ---       | :---  | :---: | ---:  |
| Content   | Content | Content | Content |
| Content   | Content | Content | Content |



## 定义列表 （Definition Lists） ✅

<pre>
Apple

:   Pomaceous fruit of plants of the genus Malus in 
    the family Rosaceae.

Orange

:   The fruit of an evergreen tree of the genus Citrus.
</pre>

Apple

:   Pomaceous fruit of plants of the genus Malus in 
    the family Rosaceae.

Orange

:   The fruit of an evergreen tree of the genus Citrus.


## 脚注/引用 ✅

`[^数字|字母中线下划线组合]`字符后面可以用数字标号，或字母与下划线、中线的组合，渲染时系统自动重新编号。

<pre>
That's some text with a footnote.[^1]

[^1]: And that's the footnote.
      That's the second paragraph.
</pre>

That's some text with a footnote.[^1]

[^1]: And that's the footnote.
      That's the second paragraph.


## 强调

### 删除线 ✅

```markdown
~~删除线~~
```

~~删除线~~

### 下划线 ✅

```markdown
[ul]#下划线#
```

[ul]#下划线#

### 上标 ✅

```markdown
E=MC^2^
```

E=MC^2^

### 下标 ✅

```markdown
H~2~O
```

H~2~O


## 任务列表 ✅

```markdown
- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media
```

- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media

## 高亮 ✅

```markdown
I need to highlight these ==very important words==.
```

I need to highlight these ==very important words==.

HTML结果

```html
I need to highlight these <mark>very important words</mark>.
```

## 特殊字符替换 ✅

```markdown
| => &#124;
> => &gt;
< => &lt;
(C) © 版权
(TM) ™ 商标
(R) ® 注册商标
-- —— 破折号
... …​省略号
-> → 右箭头
<- ← 左箭头
=> ⇒ 右双箭头
<= ⇐ 左双箭头

```

## 常用符号 ✅

1. [HTML特殊符号](https://chaooo.github.io/unicode_css3_content/) ✅
2. [emoji表情符号](https://gist.github.com/rxaviers/7360908) ✅

:point_right:查找emoji[表情](https://github-emoji-picker.rickstaa.dev/) :smile: :muscle: 。

## 参考

[^markdown-syntax]: <https://daringfireball.net/projects/markdown/syntax>

[^gfm]: <https://github.github.com/gfm/>

[道盒发布]: https://publish.daobox.cn

[^slugify]: 通过对文本转换，从而生成有效链接地址。英文字母数字保持原样，空格替换为`-`，中文每个字符转换拼音后，使用`-`连接。==注:exclamation:==：字母+中文的连接处没有连字符`-`，如果需要请在中间添加英文空格。