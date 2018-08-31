
免费搭建一个静态博客
========



独立博客表面上是网站，但实际上我们作为内容的创作者，需要关注的只是它的内容——我们以后会经常更新的只是内容的部分。一个博客网站可以分为这几个部分：

<img src="https://raw.githubusercontent.com/jijiechen/static-blog-manual/master/assets/blog-site.png" width="480" height="120" />


最常见的博客系统 WordPress 是一款动态博客系统（PHP 程序），这类系统需要在云主机商（如阿里云）那里买专门的空间或来存储和发布（存储并运行 PHP 程序）我们的博客网站。

## 静态博客系统

所谓静态博客系统指的是，博客网站是由一系列的静态 HTML 文件，以及对应的多媒体素材等组成，只要找一个可以存储文件的平台即可发布网站。有许多工具，可以把一篇篇博客文章的 Markdown 文件，配上博客主题之后转换为可以直接发布的 HTML 文件。

<img src="https://raw.githubusercontent.com/jijiechen/static-blog-manual/master/assets/templating.png" width="300" height="188" />

静态博客系统的原理，就如同这篇教程，我创作时，写的是 Markdown 文件（[readme.md](https://raw.githubusercontent.com/jijiechen/static-blog-manual/master/readme.md)），但你看到的确实是带有格式和交互的网页。因为这背后，有 GitHub 在帮我完成了从静态 Markdown 到静态 HTML 的转换。

如果要搭建一个静态博客网站，我们需要的工具有：

* 把 Markdown 转化为 HTML 的工具（即静态网站生成工具）
* 博客样式主题（通常与工具是配套的，一般来说找到了生成工具就找到了主题）
* 能存储和发布静态文件的平台

常用的静态网站生成工具有 [jekyll](https://jekyllrb.com/), [hexo](https://hexo.io/) 和 [hugo](https://gohugo.io/) 等。接下来，我以 hugo 的使用为例介绍如何搭建一个静态博客网站。

在开始之前，先打个预防针：其实步骤并不繁琐，其中大部分工作只需要做一次；另外，也无需担心太有技术含量，因为下面所述的各个步骤都是很简单的操作，只要有简单的电脑操作技能，都可以学会。

另外，整个过程会不会太折腾？其实下面的过程与安装一个 WordPress 动态博客系统相比，大体难度是相当的；但考虑到动态博客系统每年大概需要几百块的成本，后续还需要时不时的维护（比如版本升级、打补丁，数据备份等），其实静态博客的成本主要在第一次的安装和配置期间，在下面的“扩展”部分之前，一共大概只需要花 2 小时左右。

## 准备：安装 hugo

仅需操作一次。

按照官方给定的[安装 hugo 教程](https://gohugo.io/getting-started/installing/)操作是十分简单的：

1. 打开电脑上的终端（Windows 上的`命令提示符`，或 macOS 上的 `Terminal`）
1. 如果是在 Windows 上，先[安装 Chocolatey](https://chocolatey.org/install)，然后重启命令提示符窗口
1. 输入相应的安装命令即可（Windows 上用 `choco install hugo`，macOS 上用 `brew install hugo`）

完成之后，确保你能够从命令行中运行 `hugo version` 命令，并看到如下输出：

```
# hugo version
Hugo Static Site Generator v0.40.1 darwin/amd64 BuildDate:
```

到此时，你的 hugo 就安装成功了。

## 准备：创建新的博客网站

仅需操作一次。

接下来我们用 `hugo new site myblog` 创建新的网站 myblog，这里以后将你以后创作内容和修葺网站的地方。

```
# hugo new site myblog
Congratulations! Your new Hugo site is created in /path/to/myblog.

Just a few more steps and you're ready to go:

1. Download a theme into the same-named folder.
   Choose a theme from https://themes.gohugo.io/, or
   create your own with the "hugo new theme <THEMENAME>" command.
2. Perhaps you want to add some content. You can add single files
   with "hugo new <SECTIONNAME>/<FILENAME>.<FORMAT>".
3. Start the built-in live server via "hugo server".

Visit https://gohugo.io/ for quickstart guide and full documentation.
```

新创建好的网站不包含任何内容，所以我们需要根据屏幕上的提示去下载一个主题。

## 准备：定制你的主题

仅需操作一次。

用浏览器打开转到 [hugo 的主题网站](https://themes.gohugo.io/)，挑选一个喜欢的主题后，在该主题的界面上，要注意你的 hugo 版本是否能够满足它要求的 `Minimum Hugo Version`。如果没问题，就可以继续，点击 `Download` 会转到主题的 GitHub 网站。一般来说，可以先切换到 `releases` 页面去看看有没有发布版。如果有，就可以换一个最新的发布版本下载下来；如果没有，就在网页上点击 `Clone or download`，下面有一个 `download as zip`，即以 zip 文件的方式下载。

这里，我以 “hyde” 主题为例，介绍主题的安装过程。下载到主题的 zip 文件之后，将其解压到上一步中所创建的网站下的 `themes` 子目录下，形成了如下的文件夹结构：

<img src="https://raw.githubusercontent.com/jijiechen/static-blog-manual/master/assets/theme-path.png" width="300" height="210" />

要注意两个细节：

1. 确保主题所在目录中含有 `theme.toml` 文件，否则你的文件夹层级结构可能有误；
2. 如果是以 `Download as zip` 方式下载的，解压后，需要将文件夹名字中的 `-master` 字样去掉。

这时，可以用文本编辑器打开网站目录 `myblog` 下的 `config.toml` 文件，并且在其中添加一行来启用新加载的主题：

```
theme = "hyde"
```

看到该文件中的其他配置，相信你已经猜到他们的用途了。没错，除了指定主题名字，你还可以修改其他配置，比如网站的名字、语言等。另外，一般来说，各个主题还支持一些自有配置，比如，hyde 还支持把导航放到右边，只需要添加如下配置即可：

```
theme = "hyde"

[params]
  layoutReverse = true
```

不同的主题可能支持不同的特有配置，请参考主题的文档来了解详细情况。

完成主题的定制之后，用 `cd myblog` 将命令行环境切换到网站所在目录，接着用 `hugo server` 命令就可以在本地预览新创建的网站了，输入命令后，用浏览器打开 http://localhost:1313 即可在本机访问自己的博客网站。如果预览后发现不满意的地方，还可以继续通过修改配置、再预览的方式持续定制主题。

```
# cd myblog
# hugo server
                   | EN
+------------------+----+
  Pages            |  7
  Paginator pages  |  0
  Non-page files   |  0
  Static files     |  6
  Processed images |  0
  Aliases          |  0
  Sitemaps         |  1
  Cleaned          |  0

Total in 18 ms
Watching for changes in /path/to/myblog/{content,data,layouts,static,themes}
Watching for config changes in /path/to/myblog/config.toml
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

可以[从这里查看完整的命令行操作步骤](https://gohugo.io/getting-started/quick-start/#recapitulation)：从安装 hugo，到预览网站的整个过程。

## 开始创作

以后每次添加新文章时，都执行这些操作。

网站建好了之后，终于可以愉快地写作了，相信你盼这一刻已经很久了。创作新文章，就是添加新的 Markdown 文件，是不是很简单？

* 打开命令行环境，切换工作目录到网站目录
* 在 `content` 目录，编写你的内容文件
* 使用 hugo serve 在本地预览你的博客网站（http://localhost:1313）

```ps
cd myblog
mkdir content/posts   # 本句仅需运行一次

# 如果是 Windows，请在 PowerShell 中执行此语句创建内容
New-Item -Type file content/posts/my-first-post.md

# 如果是 macOS 系统，执行此语句创建内容
touch content/posts/my-first-post.md
```

接下来再用喜欢的编辑器编辑新创建的 Markdown 文件即可。hugo 支持在 Markdown 顶部声明一些文章的基本信息，比如标题、创建时间等。下面就是一篇文章的 Markdown 内容示例：

```
---
title: "我的第一篇文章的标题"
date: 2018-08-31T18:35:00+08:00
draft: false
categories: ["Software Project" ]
tags: ["博客", "网站", "hugo" ]
isCJKLanguage: true
---

在最前面的基本信息之后的所有内容，都是文章的正文部分。正文部分支持使用 Markdown 语法。比如可以[添加外链](https://github.com/)，以及**加粗文字**等。
```

可以去 hugo 的网站了解更多[页面基本信息](https://gohugo.io/content-management/front-matter/)和[内容语法介绍](https://gohugo.io/content-management/formats/)，以及教程信息。

上面我们创建的内容是`博客文章`的类型，这种内容一经创建就会自动出现在网站首页的最新文章列表中。除此之外，我们还可以创建一些不被统计入目录的`页面`。只需要在上面创建内容文件时，指定目录为 `content/pages` 开头即可，而页面的内容仍然是以 Markdown 格式描述的。

如果需要在文章中插入图片、音视频等多媒体资源，可以在网站目录下的 `static` 下创建一个专用的目录（如 `static/assets`）。在需要往文章中插入图片时，只需要把图片放在这个目录中，并且在 Markdown 中插入相对路径（不包含 `static` 前缀）即可。

```ps
mkdir static/assets
cp /path/to/image.jpg static/assets/
# 在 Markdown 中插入图片：（正文图片链接）(大图链接)
# [![图片标题](/assets/image.jpg "图片标题")](/assets/image.jpg)
```

## 发布博客网站

注册过程仅需操作一次。以后每次添加发布文章时，都重复发布过程。

(todo)

在 coding pages，或者 github pages 上发布你的博客网站。

在网站上注册好之后，只要一个 git push 就可以完成网站的发布。

### 扩展：用 Git 记录变更历史

### 扩展：用自己的域名

### 扩展：为网站备案

### 扩展：为博客网站启用 HTTPS

### 扩展：为网站启用统计功能

### 扩展：为网站添加评论
