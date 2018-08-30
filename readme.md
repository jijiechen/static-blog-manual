
免费搭建一个静态博客
========



独立博客表面上是网站，但实际上我们作为内容的创作者，需要关注的只是它的内容——我们以后会经常更新的只是内容的部分。一个博客网站可以分为这几个部分：

<img src="https://raw.githubusercontent.com/jijiechen/static-blog-manual/master/assets/blog-site.png" width="480" height="120" />


最常见的博客系统 WordPress 是一款动态博客系统（PHP 程序），这类系统需要在云主机商（如阿里云）那里买专门的空间或来存储和发布（存储并运行 PHP 程序）我们的博客网站。

所谓静态博客系统指的是，博客网站是由一系列的静态 HTML 文件，以及对应的多媒体素材等组成，只要找一个可以存储文件的平台即可发布网站。有许多工具，可以把一篇篇博客文章的 markdown 文件，配上博客主题之后转换为可以直接发布的 HTML 文件。

<img src="https://raw.githubusercontent.com/jijiechen/static-blog-manual/master/assets/templating.png" width="480" height="300" />

静态博客的原理，就如同这篇教程，我创作时，写的是 markdown 文件（[readme.md](https://raw.githubusercontent.com/jijiechen/static-blog-manual/master/manual.md)），但你看到的确实是带有格式和交互的网页。因为这背后，有 GitHub 在帮我完成了从静态 markdown 到静态 HTML 的转换。

如果要搭建一个静态博客，我们需要的工具有：

* 把 markdown 转化为 HTML 的工具（即静态网站生成工具）
* 博客样式主题（通常与工具是配套的，一般来说找到了生成工具就找到了主题）
* 能存储和发布静态文件的平台

常用的静态网站生成工具有 [jekyll](https://jekyllrb.com/), [hexo](https://hexo.io/) 和 [hugo](https://gohugo.io/) 等。

接下来，我以 hugo 的使用为例介绍如何搭建一个静态博客。


