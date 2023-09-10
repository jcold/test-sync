```yaml
date: 2023-09-10 11:13
```

用了这么长时间文本编辑器，总对格式不能自由掌控感到不快，直到使用了Markdown。Markdown是近年来较为流行的文本标记语言，简单易用是它的核心特点，因为简单，所以格式不是那么丰富，在某些场景下无法满足需求，若是退回，则又回到开始，纠结使用哪个编辑器。索性今天整理下Markdown语法诉求，看看能否对其扩展，以满足日常需求？

# 标准语法

详见[Markdown语法标准](https://daringfireball.net/projects/markdown/syntax)[^markdown-syntax]。部分格式有几种表达方式，这里仅罗列其一种。

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


# 扩展语法

## 自动转换链接

```markdown
<https://www.daobox.cn>
```


## 指定属性

可以对标题、链接、图片增加属性，属性支持CSS样式名，ID，和其他自定义属性

<pre>
# 标题  {.main .shine #the-site lang=fr}

[道盒](https://www.daobox.cn){.main .shine #the-site lang=fr}

![道盒Logo](https://www.daobox.cn/daobox.svg){.main .shine #the-site lang=fr}
</pre>


## 表格 {.main .shine #the-site lang=fr}

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

| 默认对齐   | 左对齐 | 中对齐 | 右对齐 |
| ---       | :---  | :---: | ---:  |
| Content   | Content | Content | Content |
| Content   | Content | Content | Content |


## 定义列表 （Definition Lists）

<pre>
Apple
:   Pomaceous fruit of plants of the genus Malus in 
    the family Rosaceae.

Orange
:   The fruit of an evergreen tree of the genus Citrus.
</pre>


## 脚注/引用

`^`字符后面可以用字母与下划线组合，渲染时系统自动重新编号。

<pre>
That's some text with a footnote.[^1]

[^1]: And that's the footnote.
      That's the second paragraph.
</pre>



## 缩写词

<pre>
*[HTML]: Hyper Text Markup Language
*[W3C]:  World Wide Web Consortium
</pre>

示例Markdown

```markdown
The HTML specification
is maintained by the W3C.
```

渲染HTML结果

```html
The <abbr title="Hyper Text Markup Language">HTML</abbr> specification
is maintained by the <abbr title="World Wide Web Consortium">W3C</abbr>.
```

## 强调扩展

### 删除线

```markdown
~~删除线~~
```

~~删除线~~

### 下划线

```markdown
__下划线__
```

__下划线__

### 上标

```markdown
E=MC^2^
```

E=MC^2^

### 下标

```markdown
H~2~O
```

H~2~O


## 任务列表

```markdown
- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media
```

- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media

## 高亮

```markdown
I need to highlight these ==very important words==.
```

I need to highlight these ==very important words==.

HTML结果

```html
I need to highlight these <mark>very important words</mark>.
```

## 特殊字符替换

```markdown
| => &#124;
> => &gt;
< => &lt;
```

## 常用符号

[HTML特殊符号](https://chaooo.github.io/unicode_css3_content/) [^php-markdown-extra]


## emoji 表情符号

[emoji](https://gist.github.com/rxaviers/7360908)


## 参考

[^markdown-syntax]: <https://daringfireball.net/projects/markdown/syntax>

[^php-markdown-extra]: <https://michelf.ca/projects/php-markdown/extra/>