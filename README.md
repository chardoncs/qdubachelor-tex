# 青岛大学本科毕业论文（设计）LaTeX模板

![Release](https://img.shields.io/github/v/release/chardon55/qdubachelor-tex?include_prereleases)
![License](https://img.shields.io/github/license/chardon55/qdubachelor-tex)

> 目前处于维护状态，会不定期进行patch，但通常不进行小版本及以上的更新，小版本及以上的更新仅在接收到需求时进行。

## 简介

基于[@paralevi](https://github.com/paralevi)的[QDUthesis 1.2.1](https://github.com/paralevi/QDUthesis)，严格遵循《青岛大学本科毕业论文（设计）基本规范要求》的格式。

手动编译时需要执行四次编译，即`xelatex | bibtex | xelatex x2`，以生成带有完整目录和参考文献信息的PDF文档。

或者直接使用`latexmk`命令编译。

```bash
latexmk main.tex
```

LaTeX发行版：推荐使用最新版TeX Live。

## 使用方法

### 打开文件

使用LaTeX IDE（例如TeXstudio、Texmaker等）打开主文件。

推荐使用VSCode + LaTeX Workshop插件，或使用 [Overleaf](https://www.overleaf.com/) 在线编辑。

论文主文件为`main.tex`，参考文献主文件为`mainref.bib`。

#### 胶印封面

为了满足胶印本封面打印需求，从v1.2.0开始加入胶印封面模板，其主文件为 `offset-cover.tex`。胶印本封面主文件和论文主文件共享 `content/cover.tex`，因此通常无需修改 `offset-cover.tex`。

打印胶印封面时，请选择纸张为横向A3，该打印方式适用于 460mm x 297mm (18.110 inches x 11.693 inches) 的封面纸。

如果您有其他特殊的胶印封面需求，可以在GitHub仓库中提出Issue；如果您已经实现了您需要的封面，可以提出Pull Request。我们随时欢迎。

### 命令行

[点此了解详情](./.github/commandline.md)，如果您主要使用的是LaTeX IDE，可忽略此说明。

## 注意事项

### 字体准备

要成功编译此模版，安装以下字体：
#### 中文字体
- FangSong.ttf 仿宋
- FZXiaoBiaoSong.ttf 或 FZXiaoBiaoSong-B05S.ttf 方正小标宋
- Kaiti.ttf 楷体
- SimSun.ttf 宋体
- SimHei.ttf 黑体

#### 等宽字体
- Courier New
- Fira Code（可选，如果在.cls中使用）

请注意：不要不小心使用搜索引擎搜索下载字体并误安装，这可能会导致您下载到盗版字体。尊重设计师的劳动成果和版权，使用正版字体。


### 方正小标宋

**使用前需安装方正小标宋字体，可以从[方正字库](https://www.foundertype.com)下载字体。**

Linux和其他POSIX系统安装字体后，建议通过命令:

```bash
fc-list | grep FZXiaoBiaoSong
```

确认生效。如有必要，可使用`fc-cache -fv`强制刷新字体缓存。

### 封面Logo

由于原版论文要求中的青岛大学logo图片分辨率较低，且与官方的样式不完全一致，因此在v1.1.0以后对logo进行了重制，提高了分辨率，同时采用了官方的配色以及英文名称字号和位置，图标中的青岛大学徽标和题词书法与官方完全一致，英文名称采用与官方一致的\`Times new Roman'字体。

logo使用Krita设计，源文件为`qdu-logo.kra'。如需编辑图片，可以[安装Krita](./.github/krita-installation.md)用于编辑源文件。

之前的logo图片位于\`figures/logo.old.png'，如需使用请用\`logo.old.png'替换\`logo.png'。

> Contributed by [null](https://github.com/nullnan) with 💙.
