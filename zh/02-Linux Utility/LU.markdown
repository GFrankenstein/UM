# Linux 小工具 #

本章简单介绍一下常用的 Linux 小工具。主要目的在于对工具的介绍，不涉及过多 Linux 的知识和命令。关于 Linux 知识和和命令，可以参考网络上的介绍（比如[鸟哥的 Linux 私房菜](http://linux.vbird.org)）或者任何 Linux 参考书籍。

## 编辑 ##

Linux 是基于文本文件的系统，这里编辑主要是对文本的操作。

### 编辑器 ###

文本编辑器是最常用的用来进行文本编辑的工具。最有名的是 Vim 和 Emacs。黑客界两大编辑器阵营因此发生过[圣战](https://www.google.com.hk/search?newwindow=1&safe=strict&client=safari&rls=en&biw=1440&bih=860&q=%E7%BC%96%E8%BE%91%E5%99%A8%E5%9C%A3%E6%88%98&oq=%E7%BC%96%E8%BE%91%E5%99%A8%E5%9C%A3&gs_l=serp.3.0.0.1011885.1015094.0.1015961.11.11.0.0.0.0.215.846.6j1j1.8.0....0...1c.4.32.serp..4.7.776.I5mvHkV6OFk)。

#### Vim ####

[Vim](http://www.vim.org) 即 Vi IMproved 的缩写。一般 vi 作为 Linux 的缺省编辑器使用。Vim 作为一个强大的编辑器，学习曲线很陡，有大量的快捷键和三种编辑模式。

Vim 的技巧我推荐参考相关书籍，比方说 [*Learning the vi and Vim Editors*](http://www.amazon.cn/gp/product/B002BNKSGA/ref=wms_ohs_product?ie=UTF8&psc=1) 这本（O'Reilly 的“动物书”之一，我自己读的是影印版），或者直接在互联网上搜集相关技术信息（这是学习技术的最简单有效的方式）。

#### Emacs ####

[Emacs](http://www.gnu.org/software/emacs/) 我自己用得很少，但同样是一款非常强大的通用编辑器。它是 [GNU](https://www.gnu.org) 的精神领袖 Richard Stallman 的作品，后面要介绍的 TeXmacs 深受 Emacs 的启发。

同样，想深入学习 Emacs 的话，还是可以自己找相关参考书或利用网络。

另外，图 2.1 是一个关于编辑器的学习曲线的幽默图片，vi 和 Emacs 也在其中。

Insert 18333fig0201.png 
图 2-1. 编辑器学习曲线对比（图片来源于网络）

### CLI 编辑 ###

#### 正则表达式 ####

正则表达式(Regular Expression，RE)有必要在 awk 和 sed 之前介绍，因为这是在 *nix 系统中一个非常重要的概念（虽然不仅仅如此）。

正则表达式简单看就是用来匹配查找的一套元字符(metacharacter)集合，和 *nix 系统里的通配符类似。总之，利用好 RE，可以大大提高文本处理效率。同样，详细资料可以通过[书籍](http://www.amazon.cn/s/&url=search-alias%3Daps&field-keywords=Regular+Expression&rh=i%3Aaps%2Ck%3ARegular+Expression)和[互联网](https://www.google.com.hk/search?client=safari&rls=en&q=Regular+Expression&ie=UTF-8&oe=UTF-8)获取，在此仅抛砖引玉。

#### awk，sed ####

这是两个典型代表。sed 即 **s**tream **ed**itor，awk 取自其开发者姓名 Alfred **A**ho，Peter **W**einberger, 和 Brian **K**ernighan。两者都是通过 RE 进行匹配后，再进行某些编辑操作，其中 awk 功能更为强大，甚至可以当作一门程序语言使用，语法和 C 语言类似。

除此之外，常用的 grep 即 **g**lobally search a **r**egular **e**xpression and **p**rint，也是利用 RE 匹配的工具。

关于这些工具，最好还是自己读文档(比如 `man awk` 等)、[上网学习](https://www.google.com.hk/search?client=safari&rls=en&q=awk&ie=UTF-8&oe=UTF-8)和[参考相关书籍](http://www.amazon.cn/s/&url=search-alias%3Daps&field-keywords=awk)。掌握这些工具，文本编辑必然事半功倍，因为 CLI 的好处就是自动化、效率化。

## Shell ##

类 Unix 系统(*nix) 分 kernel（内核）和 shell（外壳）两部分。我们可以把 shell 理解为用户与系统内核进行交互的一个界面，界面又分为 GUI(Graphic User Interface, 图形用户界面) 和 CLI(Command Line Interface, 命令行界面)。前者在 *nix 中常见的有 [X11(即 X Window 系统)](www.x.org)，后者常见的有 sh, bash, csh, ksh, [zsh](http://www.zsh.org) 等等。其中 bash 一般是 Linux 缺省默认版本的 shell，而 zsh 是类似于 bash 却功能更为强大的 shell。

## 脚本 ##

脚本通常就是指一系列系统命令的组合。由于 *nix 系统程序之间通信起来非常方便，利用脚本可以轻松完成各式各样的任务，特别是处理文本任务，这是 *nix 最大的一个优势。我们可以简单地将它理解为批处理，这通常是在 Windows 系统下的叫法(.bat)。

## 网络 ##

网络部分最常用的就是 SSH(Secure SHell) 和文件传输的 [FTP](http://zh.wikipedia.org/wiki/Ftp) 或 SFTP 等等。

### SSH ###

关于 SSH，常用的是通过配置 `~/.ssh` 路径下的文件，比如 `config` 文件:

    Host lab
        HostName 114.212.240.250
        User usrname

这样，就可以简化登录，输入 `ssh lab` 就相当于 `ssh usrname@114.212.240.250` 了。另外，还可以配置 RSA 密钥，省去每次输入密码的麻烦。具体细节可以参考“[蜗牛书](http://www.amazon.cn/SSH-the-Secure-Shell-The-Definitive-Guide-Barrett-Daniel/dp/0596008953/ref=sr_1_5?s=books&ie=UTF8&qid=1389502024&sr=1-5)” 或者互联网资源。

### FTP, SFTP ###

关于文件传输，可以直接用 `scp` 命令操作。具体可以 `man scp` 查看手册。这里主要推荐使用 GUI 工具，比如全平台的 [FileZilla](https://filezilla-project.org)，OS X 或 Windows 的话还有 [Cyberduck](http://cyberduck.io)，界面友好。