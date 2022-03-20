# 青岛大学本科毕业论文（设计）LaTeX模板

![Version_1.0.0](.github/info/version.svg)

## 简介 
本模板严格遵循《青岛大学本科毕业论文（设计）基本规范要求》的格式，基于LaTeX发行版TeX Live。

手动编译时需要执行四次编译，即`xelatex + bibtex + xelatex + xelatex`， 可生成带有完整目录和参考文献信息的PDF文档。

基于QDUBachelor 1.2.1，由我个人修改和维护。原版的Bash脚本已删除，改用GNU Make进行构建、清理、预览等操作。

## 操作方法

### 准备工作
如果没有安装GNU Make，请安装后再进行如下操作。

*GNU Make是开源免费的软件，~~请山寨大王们直接下载安装正版即可~~。*

镜像
- 清华大学（TUNA）：https://mirrors.tuna.tsinghua.edu.cn/gnu/make/
- 中国科学技术大学：https://mirrors.ustc.edu.cn/gnu/make/
- 上海交通大学：https://mirrors.sjtug.sjtu.edu.cn/gnu/make/
- 南京大学：https://mirrors.nju.edu.cn/gnu/make/

此外请检查一下Makefile是否在存储库中，没有Makefile是没法进行操作的。

### 命令行操作

以Bash为例：
```bash
# 编译构建
$ make build

# 清理 
$ make clean

# 删除PDF文件
$ make cleanpdf

# 打开PDF
$ make viewPDF

# 构建并预览
$ make build-preview
```

> ## Original
>
> **使用前需安装方正小标宋字体。**
> 类Unix系统安装字体后，建议通过检验命令`fc-list|grep FZXiaoBiaoSong`确认生效。如有必要，可使用`fc-cache -fv`强制刷新字体缓存。感谢[@9527567](https://github.com/9527567)反馈。
>
>
> ## 版本历史
> ### 2017/06/01 v1.2.1
> - 修复了目录前的垂直距离偏大的问题
> 
> ### 2017/05/31 v1.2
> - 修改页边距，上下边距包含页眉页脚
> - 目录中章节标题后添加引导点
> - 缩小了每章标题前的垂直距离
> - 去掉图表标题中的冒号
> - 致谢与参考文献添加页眉
> 
> ### 2017/05/29 v1.1.1
> - 按照学院要求，将封面对齐方式设置为左对齐
> - 正文外章节均取消页眉，正文内所有页面全部添加页眉
> 
> ### 2017/05/11 v1.1
> - 将默认页面样式设置为双面
> - 优化代码结构，增加了部分注释
> - “目录”改为“目 录”，更美观
> - 增加了附录环境
> - 增加了代码段支持
> 
> ### 2017/05/10 v1.0
> 第一版发布