
免费搭建一个静态博客
========



独立博客表面上是网站，但实际上我们作为内容的创作者，需要关注的只是它的内容——我们以后会经常更新的只是内容的部分。一个博客网站可以分为这几个部分：

<img src="https://raw.githubusercontent.com/jijiechen/static-blog-manual/master/assets/blog-site.png" width="480" height="120" />


最常见的博客系统 WordPress 是一款动态博客系统（PHP 程序），这类系统需要在云主机商（如阿里云）那里买专门的空间或来存储和发布（存储并运行 PHP 程序）我们的博客网站。

## 静态博客系统

所谓静态博客系统指的是，博客网站是由一系列的静态 HTML 文件，以及对应的多媒体素材等组成，只要找一个可以存储文件的平台即可发布网站。有许多工具，可以把一篇篇博客文章的 markdown 文件，配上博客主题之后转换为可以直接发布的 HTML 文件。

<img src="https://raw.githubusercontent.com/jijiechen/static-blog-manual/master/assets/templating.png" width="300" height="188" />

静态博客的原理，就如同这篇教程，我创作时，写的是 markdown 文件（[readme.md](https://raw.githubusercontent.com/jijiechen/static-blog-manual/master/manual.md)），但你看到的确实是带有格式和交互的网页。因为这背后，有 GitHub 在帮我完成了从静态 markdown 到静态 HTML 的转换。

如果要搭建一个静态博客，我们需要的工具有：

* 把 markdown 转化为 HTML 的工具（即静态网站生成工具）
* 博客样式主题（通常与工具是配套的，一般来说找到了生成工具就找到了主题）
* 能存储和发布静态文件的平台

常用的静态网站生成工具有 [jekyll](https://jekyllrb.com/), [hexo](https://hexo.io/) 和 [hugo](https://gohugo.io/) 等。

接下来，我以 hugo 的使用为例介绍如何搭建一个静态博客。

## 安装配置 hugo

仅需操作一次。

(todo)

按照官方给定的 [安装 hugo 教程](https://gohugo.io/getting-started/installing/) 操作是十分简单的。

## 准备：初始化工作空间

仅需操作一次。

(todo)

在磁盘上，创建一个文件夹，这里以后将你以后创作内容和修葺网站的地方。

使用 Git 来保管好这些内容吧。

## 准备：定制你的主题

仅需操作一次。

(todo)

转到 [hugo 主题列表](https://themes.gohugo.io/)中，挑选一个喜欢的主题。

## 开始创作

以后每次添加新文章时，都重复。

(todo)

* 在 `content` 目录，编写你的内容文件（.md）。
* 使用 hugo serve 在本地预览你的博客网站（http://localhost:1313）


## 发布博客网站

注册过程仅需操作一次。以后每次添加发布文章时，都重复发布过程。

(todo)

在 coding pages，或者 github pages 上发布你的博客。

在网站上注册好之后，只要一个 git push 就可以完成网站的发布。
