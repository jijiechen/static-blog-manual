
免费搭建一个静态博客
========



独立博客表面上是网站，但实际上我们作为内容的创作者，需要关注的只是它的内容——我们以后会经常更新的只是内容的部分。一个博客网站可以分为这几个部分：

<img src="https://raw.githubusercontent.com/jijiechen/static-blog-manual/master/assets/blog-site.png" width="480" height="120" />


最常见的博客系统 WordPress 是一款动态博客系统（PHP 程序），这类系统需要在云主机商（如阿里云）那里买专门的空间或来存储和发布（存储并运行 PHP 程序）我们的博客网站。

<br />

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

<br />

## 准备：安装 hugo

*仅需操作一次。*

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

<br />

## 准备：创建新的博客网站

*仅需操作一次。*

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

<br />

## 准备：定制你的主题

*仅需操作一次。*

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

<br />

## 开始创作

*以后每次添加新文章时，都执行这些操作。*

网站建好了之后，终于可以愉快地写作了，相信你盼这一刻已经很久了。创作新文章，就是添加新的 Markdown 文件，是不是很简单？

* 打开命令行环境，切换工作目录到网站目录
* 在 `content` 目录，添加并编辑新的 Markdown 内容文件
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
title: "文章的标题"
date: 2018-08-31T18:35:00+08:00
draft: false
categories: ["Software Project" ]
tags: ["博客", "网站", "hugo" ]
isCJKLanguage: true
---

在最前面的基本信息之后的所有内容，都是文章的正文部分。正文部分支持使用 Markdown 语法。比如可以[添加外链](https://github.com/)，以及**加粗文字**等。
```

可以去 hugo 的网站了解更多[页面基本信息](https://gohugo.io/content-management/front-matter/)和[内容语法介绍](https://gohugo.io/content-management/formats/)，以及教程信息。

上面我们创建的内容是`博客文章`的类型，这种内容一经创建就会自动出现在网站首页的最新文章列表中。除此之外，我们还可以创建一些不被统计入目录的`页面`。只需要在上面创建内容文件时，指定目录为 `content/pages` 开头即可，而页面的内容仍然是以 Markdown 格式描述的。

如果需要在文章中插入图片、音视频等多媒体资源，可以在网站目录下的 `static` 下创建一个专用的目录（如 `static/assets`）。在需要往文章中插入图片时，只需要把图片放在这个目录中，并且在 Markdown 中插入相对路径（不包含 `static` 前缀）即可。

文章编辑期间，可以执行 `hugo server` 命令在本地启动 hugo 预览服务。然后在浏览器中打开新创建的文章，将能即时预览文章最新的效果。

```ps
mkdir static/assets
cp /path/to/image.jpg static/assets/

# 在 Markdown 中插入图片：（正文图片链接）(大图链接)
# [![图片标题](/assets/image.jpg "图片标题")](/assets/image.jpg)
```

<br />

## 发布博客网站

*注册过程仅需操作一次。以后每次要发布新文章时，都重复发布过程即可。*

当大作初成，我想你已经迫不急待地想要把你的作品呈现在世人面前了，因为截止目前，你的网站还只在自己电脑上，不能供互联网上的众人阅览。为了将网站发布到网上，大致需要这两个步骤：

1. 去专门提供存储的网站注册一个账号
2. 在自己电脑上编译我们的博客网站，并把生成好内容打包上传

一般来说这种存储网站（例如七牛云存储）都是收费的，接下来我们看一下如何使用 [GitHub Pages](https://pages.github.com/) 的免费托管服务存储我们的网站。

1. 首先，[注册一个 GitHub 账号](https://github.com/join)，假如用户名为 *user-name*
2. 接着，[创建一个仓库（Repository）](https://github.com/new)，请使用 `user-name.github.io` 作为仓库的名字。注意，这个名字的第一个部分就是你的用户名，不要写错了。创建仓库界面上其他各项均按默认填写即可。
3. 仓库创建完成之后，你将获得一个仓库的 URL，类似这样：*https://github.com/user-name/user-name.github.io.git*

上面的注册过程完成之后，就可以从浏览器中回到控制台中开始发布网站了。下面的手工操作首先将网站进行一次编译，然后将编译后的网站创建为一个 Git 项目，这样才可以被发布到 GitHub 网站上。

1. 在命令行环境，切换工作目录到博客网站，使用 hugo 命令编译网站
2. 把编译好的网站创建为 Git 项目
3. 将最新的网站推送到 GitHub 服务器上

对应的命令行指令是：

```ps
cd myblog
hugo -t hyde  # 注意，把最后一个参数换成你的主题的名字

cd public
git init
git remote add origin https://github.com/user-name/user-name.github.io.git   # 注意，把其中的 user-name 换成你的 GitHub 用户名

git add --all 
git commit -m "Publishing to gh-pages"
git push origin master --set-upstream  # 你会被询问 GitHub 用户名和密码

# 发布完成，回到上层目录（可以继续写作啦）
cd ..
```

如果一切顺利、推送完成之后，稍等片刻，就可以从公网访问你的网站了：http://user-name.github.io，接下来你就可以与朋友们分享你的新网站了。如果觉得每次在发布时都需要输入这一系列的命令，显得很繁琐的话，可以[下载这个脚本文件](https://raw.githubusercontent.com/jijiechen/static-blog-manual/master/assets/publish.bat)，放到博客网站的目录下面，以后每次只需要执行 `./publish` 即可完成发布了。不过，使用这个脚本时，稍微注意几点：

1. 第一次发布时，仍需要手动执行使用上面的过程
2. 如果你使用 macOS 系统，请将上述文件保存为不带扩展名的文件
3. 如果你使用 macOS 系统，请使用 `chmod +x ./publish` 为它添加可执行权限

除了 GitHub pages，也可以使用国内的 [Coding.net](https://pages.coding.me/)，注册和发布的操作过程与 GitHub pages 大同小异。Coding.net 静态页面服务与 GitHub pages 功能类似，但在国内的访问速度要快得多。

<br />

关于为网站使用自定义域名、统计、评论等功能，请转到 [扩展话题](https://github.com/jijiechen/static-blog-manual/blob/master/extensions.md) 目前仍在持续更新中。

