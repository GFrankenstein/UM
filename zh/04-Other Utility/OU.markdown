# 其他小工具 #

本章是一些杂项。主要是我常能用到的小工具。

## 平面图形图像 ##

### Imagemagick ###

[Imagemagick](http://www.imagemagick.org/script/index.php) 是一个很方便且功能强大的 CLI 图形处理工具。

比如截图得到批量的 Molden 格式的轨道图像，可以利用它进行方便的批量裁剪、背景透明化等等，比如写成如下脚本：

    for file in $(ls *.png)
    do
        convert -crop 676x689+133+58 -transparent lime $file CT_$file
    done

这里裁剪出了 678×689 大小的图片，起裁点是原图 (133,58) 处，由于将 Molden 背景设为青绿色(lime)，将其透明(transparent)化。效果如图 4.1 所示。

Insert 18333fig0401.png
图 4-1. 对 Molden 轨道截图处理示意

### GIMP ###

[GIMP](http://www.gimp.org) 可以直接理解为 GNU 世界用来替代 Photoshop 的工具。

### Inkscape ###

[Inkscape](http://www.inkscape.org/zh/) 是开源免费的矢量图软件，全平台通用。

## 3D 模型 ##

### PovRay ###

[PovRay](http://www.povray.org) 用来渲染静态高质量图片，可以得到很漂亮的效果。图 4.2 是我曾用 Diamond 3 软件渲染的一个晶胞的场景。

Insert 18333fig0402.png
图 4-2. PovRay 渲染效果的一个简单演示

### FreeWRL, Meshlab ###

[FreeWRL](http://freewrl.sourceforge.net) 和 [Meshlab](http://meshlab.sourceforge.net) 主要是我用来查看和转换 [VRML](http://zh.wikipedia.org/zh-cn/VRML) 文件 `.wrl` 的工具。Molden 可以输出为 VRML 格式，然后就可以利用 FreeWRL 来浏览，用 Meshlab 可以将 `.wrl` 文件转换为 `.u3d` 格式，可以嵌入到 PDF 文件里（参考 Asymptote 一节）。

### Blender ###

[Blender](http://www.blender.org/) 是业界著名的免费开源 3D 软件，从建模、动画、渲染等到甚至用来做 3D 打印模型都应有尽有。

## 科学软件 ##

### SciDAVis ###

[SciDAVis](http://scidavis.sourceforge.net) 理解为 Windows 下 Origin 的开源替代品即可。

### Gnuplot ###

[Gnuplot](http://www.gnuplot.info) 是比较方便好用的一个绘制数据图的软件，优点在于可以 CLI 交互或者脚本批量处理。

### Sage ###

[Sage](http://www.sagemath.org/index.html) 是开源免费的符号计算软件，可以理解为 Mathematica, Matlab 的替代品。非常有 Python 风格。

### R ###

[R](http://www.r-project.org) 是用来进行统计分析及绘图的强大平台，可类似地看作 SPSS 之类东西的替代品。

与 R 相似的还有看起来更优雅的 [Processing](http://processing.org) 等。

## 文献管理 ##

关于文献管理，商业软件中 EndNote 非常有名。但是，免费软件里面有可以取而代之甚至表现更好的工具。

之前你可能有听说过 [Jabref](http://jabref.sourceforge.net)。现在，有了更方便更现代理念的工具 --- [Zotero](https://www.zotero.org)、[Mendeley](http://www.mendeley.com) 和 [Docear](http://www.docear.org) 等。它们使用了“云同步”的思想，可以将文献库在浏览器端、个人电脑端以及移动设备端全平台地同步。

Zotero 对浏览器支持非常好，可以方便地一键导入文献。Mendeley 则是 PDF metadata 的识别功能极其强大，而且自带了 PDF 工具和移动客户端（如 iOS 平台）。另外 iOS 平台有一款叫做 [Papership](http://www.papershipapp.com) 的软件可以兼容管理 Zotero 和 Mendeley。

## \emph{\TeX} 相关 ##

[\TeX](http://tug.org) 本身是一个很好的免费平台，可以生成高质量的排版。它本身就是一个很好的排版方面（特别是数理方面）的工具，互联网和图书资料都很多，所以不再赘述，仅简单介绍两个和 \emph{\TeX} 相关的工具。

### Asymptote ###

[Asymptote](http://asymptote.sourceforge.net) 是一个矢量绘图语言，可以为 PDF 文件嵌入 `.prc` 格式的真 3D 图形(PDF 支持 `.u3d` 和 `.prc` 的 3D 模型)。这就为在 PDF 文件中嵌入分子轨道或是三维势能面提供了可能。Asymptote 可以与 \emph{\LaTeX} 结合后绘图与排版。

这里给出两个给 PDF 嵌入 3D 分子模型的思路：

#### 思路一 ####

- 直接使用 Asymptote 绘制，用 \emph{\LaTeX} 排版时调用 Asymptote。

#### 思路二 ####

- 首先用 Molden 将轨道保存为 VRML 文件；
- 再用 Meshlab 将 `.wrl` 转为 `.u3d`；
- 利用 movie15 宏包在 \emph{\LaTeX} 排版时将 `.u3d` 文件嵌入。

### TeXmacs ###

[TeXmacs](http://www.texmacs.org/tmweb/home/welcome.en.html) 虽然是受到了 \emph{\TeX} 和 Emacs 的影响，但它是一个完全独立的软件，不依赖于 \emph{\TeX} 和 Emacs，却有 \emph{\TeX} 的精准版式和类似 Emacs 的强大扩展功能，是一种“所见即所想”的文档软件。写结构化文章、记笔记、甚至用来推导公式和演算都非常方便。类似地，还有 [LyX](http://www.lyx.org)。

TeXmacs 的强大和好用之处只有真正用过了才知道（基本可以完全代替“用户体验方面设计相当蹩脚”的 \emph{\TeX} 系统）。不过唯一的毛病可能就是目前还不太稳定。

## 其他 ##

### 版本控制与 Git ###

版本控制是一种非常重要的概念，在工程中可以有效地保证效率和流程顺利。对版本控制的方案，常见的有 SVN(Subversion), Mercurial, CVS 以及 [Git](http://git-scm.com)。这里面，我对 Git 相对了解，而且随着 [GitHub](https://github.com) 的流行，由 “Linux 之父” Linus Torvalds 开发的这个分布式版本控制越来越受到欢迎。

使用 Git 版本控制的好处就是可以更方便地协作开发，而且版本控制可以随时回溯开发的过程。

### 脚本思维与 Python ###

脚本思维就是用会利用脚本语言去完成一些合适的任务。脚本语言特点就是好写(编写效率高，适合轻量级编程)，更接近人类自然语言，开发出它们的目的就是简化流程，使人从繁重的机械劳动中解放出来。把 [Python](http://www.python.org) 单独提出来是因为它是一个集大成者，而且在科学领域应用也非常广泛，语法也比较优雅，所以比较适合科研使用。

其他著名的一些还有：比如文本编辑处理类的 sed, awk, [Perl](http://www.perl.org) 等；和 Python 类似但是在网络开发中更常用的 [Ruby](https://www.ruby-lang.org)(名字来源就是为了取代 Perl)；Web 常见的 JavaScript，PHP；编辑器的 Emacs Lisp；以及嵌入式的 [Lua](http://www.lua.org) 等等。

### 轻量编辑与 Markdown ###

之前已不止一次提到「轻量级应用」这个概念。现代设计理念之一有「极简主义」的风潮——希望能从繁复的现象中返璞归真，抽象出最核心的东西。由此诞生了基于「化繁为简」的理念，进行「奥卡姆剃刀」般修剪的做减法的设计哲学，成为轻量化设计。

[Markdown](http://daringfireball.net/projects/markdown/) 就是把繁复的 HTML 语言保留最核心的要素，重新利用更加易读易写的语法构成。简体中文语法可参考[这里](http://wowubuntu.com/markdown/)。

本手册的编写即采用这种思想，因为没有过于繁复的文本结构，所以直接原稿采用 Markdown 格式书写，再利用 [Pandoc](http://johnmacfarlane.net/pandoc/) 这样的转换工具，加上 \emph{\TeX} 作为排版引擎，最后可以输出结构质量上乘的文本。特别是可以直接利用 GitHub 上的 [Pro Git Book 项目](https://github.com/progit/progit)，再加上本身同样可以利用 Git 进行版本维护，就使本文档写作更加高质高效。

类似地，和 Python 的文档维护方式相同，[reStructuredText](http://docutils.sourceforge.net/rst.html)+[Sphinx](http://sphinx-doc.org) 也是一种方案。