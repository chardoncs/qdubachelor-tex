\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qdubachelor}[2022/06/07 1.3.0 Main Template for Bachelor Degree Thesis of Qingdao University]

%twoside -双面 openany -新章节可在偶数页开始
% 中文字体宋体，英文字体Times New Roman，小四，行间距，多倍行距 1.25
\LoadClass[fontset=windows,twoside,openany,zihao=-4,UTF8,linespread=1.25]{ctexbook}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions
%------------------------ Packages ------------------------
\RequirePackage{hyperref} %PDF链接设置
\hypersetup{pdfencoding=auto} 
\hypersetup{colorlinks,linkcolor=black,anchorcolor=black,citecolor=black,urlcolor=black}
\RequirePackage{fancyhdr}
\RequirePackage{makecell}
\RequirePackage{array} %绘制封面下划线
\RequirePackage{titlesec} %标题样式设置
\RequirePackage[subfigure]{tocloft} %目录样式设置
\RequirePackage{tikz} %绘图
\RequirePackage{amsmath} %数学公式
\RequirePackage{graphicx} %插图环境
\RequirePackage[font=small,labelfont=bf,textfont=bf,labelsep=space]{caption} %图片标题小号加粗
\RequirePackage{subfigure} %并排图片
\RequirePackage{diagbox} %绘制斜线表头
\RequirePackage{floatrow} %表格标题五号置顶
\DeclareFloatFont{tblfont}{\zihao{5}}
\RequirePackage{lmodern}
\floatsetup[table]{font=tblfont,capposition=top}
\RequirePackage{forloop}
\RequirePackage{ragged2e}
\RequirePackage[section]{placeins} % 防止图片跨节
\RequirePackage{float}
\RequirePackage[ruled,linesnumbered]{algorithm2e} % 算法
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex} % 参考文献
\RequirePackage{afterpage}

% Word repetition command
\newcounter{loopcounter}
\newcommand{\repeatword}[2][1]{
	\forloop{loopcounter}{0}{\value{loopcounter} < #1}{#2}
}

\newcommand{\emptypage}{
    \newpage
    \null
    \thispagestyle{empty}
    \newpage
}

% Space repetition command
\newcommand{\spaces}[1]{\repeatword[#1]{~}}

% === 页面设置 ===
% 2025 版要求页面设置为A4纸，上边距：2.6cm；下边距：2.6cm；左边距：2.6cm；右边距：2.6cm；装订线：0.5cm；页眉2.5cm：页脚2cm
\ifprint
\RequirePackage[
  a4paper,
  centering,
  left=3.1cm,
  right=2.6cm,
  top=2.6cm,
  bottom=2cm,
  headheight=0cm,
  headsep=0cm,
  footskip=0.6cm,
  includehead,
  includefoot
]{geometry} %页面设置
\else
% 电子版上下左右完全对齐
\RequirePackage[
  a4paper,
  centering,
  left=2.6cm,
  right=2.6cm,
  top=2.6cm,
  bottom=2cm,
  headheight=0cm,
  headsep=0cm,
  footskip=0.6cm,
  includehead,
  includefoot
]{geometry} %页面设置
\fi

% === 页眉页脚设置 ===
\makeatletter
\newcommand*{\emptystyles}{%
\let\oldplain\ps@plain
\let\ps@plain\ps@emptynumbering
\pagestyle{plain}}

\newcommand*{\restorestyles}{%
\clearpage\thispagestyle{empty}
\let\ps@plain\oldplain
\pagestyle{plain}}
\makeatother

% 2025 版要求页眉无内容，页脚标注页码，五号宋体字，居中排列。
% 若需要可以取消注释
\fancypagestyle{plain}{%
\fancyhf{}
% \chead{\zihao{5} 青岛大学本科毕业论文（设计）}
\cfoot{\zihao{5}\songti \thepage}
% \renewcommand\headrulewidth{0.4pt}
}

\fancypagestyle{emptynumbering}{%
\fancyhf{}
\cfoot{\zihao{5}\thepage}
\renewcommand\headrulewidth{0pt}
}

% === 章节设置 ===
\setcounter{secnumdepth}{3}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\setlength\cftbeforetoctitleskip{0em}
\ctexset { chapter = { format+={\heiti\zihao {3}},beforeskip=0em,afterskip=1em} } 
\ctexset { section = { format+={\heiti\raggedright \zihao {-3}} } }
\ctexset { subsection = { format+={\heiti\zihao {4}} } }
\ctexset { subsubsection = { format+={\heiti},indent={1pc},number={(\arabic {subsubsection})} } }

% === 字体设置 ===
\RequirePackage{xeCJK}
\RequirePackage{fontspec}
\newfontfamily\circlefont{FangSong} % 圆圈数字字体
\setmainfont{Times New Roman} % 正文字体设置为Times New Roman

% 仿宋没有提供粗体采用伪粗体修复
\let\fangsong\relax
\newCJKfontfamily{\fangsong}{FangSong}[AutoFakeBold=3]

\let\heiti\relax
\newCJKfontfamily{\heiti}{SimHei}[
%   BoldFont={Heiti SC Medium}, % 黑体-简中等字重，只有MacOS系统提供
  % BoldFont={SimHei}, % 黑体粗体
  AutoFakeBold=2, % 伪粗体
] % 黑体粗体，只是为了消除编译器warning，实际用的是medium字重

% 设置宋体粗体
\setCJKmainfont[
  AutoFakeBold=4, % 伪粗体，和 Microsoft Word 的粗体效果相近
  % BoldFont = {STSongti-SC-Bold}, % 宋体-简粗体，MacOS系统提供
  % BoldFont = {FZCuSong-B09S}, % 粗体，方正粗宋（太粗不好看）
  % BoldFont = {FZXiaoBiaoSong-B05S}, % 粗体方正小标宋（感觉可以）
  ItalicFont = {KaiTi}, % 斜体用楷体替代
  % AutoFakeSlant, % 伪斜体，和 Microsoft Word 的斜体效果相近
  BoldItalicFont = {KaiTi},
  BoldItalicFeatures = {AutoFakeBold=4},
]{SimSun}

% 方正小标宋字体，有两个版本
\IfFontExistsTF{FZXiaoBiaoSong-B05S}%
  {\setCJKfamilyfont{xbsong}{FZXiaoBiaoSong-B05S}}%
  {\setCJKfamilyfont{xbsong}{FZXiaoBiaoSong-B05}}
\newcommand{\xbsong}{\CJKfamily{xbsong}}

% === 等宽字体 === 可以根据喜好选用
% \setmonofont{Fira Code}[Scale=0.85] % 等宽设置成Fira Code
\setmonofont{Courier New}[Scale=0.95] % 等宽设置成Courier New

% === 三线表 ===
\RequirePackage{booktabs}
\RequirePackage{fvextra}  % 提升兼容性，自动分页等

% === 代码样式 ===
\RequirePackage{listings}
% 采用灰色背景，在跨页时样式更美观
\lstset{ 
  tabsize=4, %
  frame=none, %把代码用带有阴影的框圈起来 
  backgroundcolor=\color{gray!10},  % 灰色背景
  keywordstyle=\bfseries,
  showstringspaces=false,%不显示代码字符串中间的空格标记
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle=\ttfamily\footnotesize, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,
%   numbersep=-1em, %行号与代码之间的距离
  escapeinside={(*@}{@*)},
  framexleftmargin=2.5em, % 行号也包含在背景中
}
\renewcommand{\lstlistingname}{代码}

% === 列表样式 ===

% ==== 有序列表项目用圆圈数字 ====
\newcommand*{\circled}[1]{\lower.7ex\hbox{\tikz\draw (0pt, 0pt)%
    circle (.5em) node {\makebox[1em][c]{\small #1}};}}

\newcommand{\circlednum}[1]{%
  \circlefont%
  \ifcase#1\or ①\or ②\or ③\or ④\or ⑤\or
  ⑥\or ⑦\or ⑧\or ⑨\or ⑩\or
  ⑪\or ⑫\or ⑬\or ⑭\or ⑮\or
  ⑯\or ⑰\or ⑱\or ⑲\or ⑳\else\circled{#1}\fi%
}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}

\robustify{\circled}
\robustify{\circlednum}

\setlist[enumerate]{label=\circlednum{\value{enumi}}, leftmargin=2.5em}

% === 算法 ===

% 中文设置
\renewcommand{\algorithmcfname}{算法}        % 改为“算法 1”
\SetKwInput{KwInput}{输入}                   % 中文输入
\SetKwInput{KwOutput}{输出}                  % 中文输出
\SetKwComment{Comment}{\quad // }{}           % 注释样式（可选）

% 定义计数器
\renewcommand{\thealgocf}{\thechapter.\arabic{algocf}} % 编号格式：章节.算法号
\makeatletter
\@addtoreset{algocf}{chapter} % 按章节重置
\makeatother

% === tikz & 绘图 ===
\usetikzlibrary{arrows.meta, positioning, shapes.geometric, shapes.misc, trees, shapes, calc}
\tikzset{
  every node/.style={
    font=\bfseries\fontsize{10.5pt}{12pt},
  },
  every text/.style={
    font=\bfseries\fontsize{10.5pt}{12pt},
    format+={\bfseries}
  },
}

% 流程图，需要可以使用
% \tikzstyle{inout}=[trapezium, trapezium left angle=60, trapezium right angle=120, draw, text width=2.4cm, align=center, font=\small]
% \tikzstyle{end}=[rounded rectangle, draw, text width=1cm, align=center, font=\small]
% \tikzstyle{exec}=[rectangle, draw, text width=3.5cm, align=center, font=\small]
% \tikzstyle{decide}=[kite, kite vertex angles=120, draw, text width=2cm, align=center, font=\small]
% \tikzstyle{arrow}=[-{Stealth}, thick]

% === meta data ===

\newtoks\category %论文类别
\newtoks\title %论文标题
\newtoks\titleEn %论文英文标题
\newtoks\school %学院
\newtoks\major %专业
\newtoks\name %姓名
\newtoks\supervisor %指导教师
\newtoks\date %封面日期
\newtoks\studentid %学号

\def\setmeta {
    \input{meta}
    \hypersetup{
        pdfinfo={
            Title={\the\title},
            Author={\the\name},
            Subject={\the\category},
        }
    }
    \newwrite\outnamefile
    \immediate\openout\outnamefile=\jobname.outname
    \immediate\write\outnamefile{\the\school-\the\studentid-\the\name}
    \immediate\closeout\outnamefile
}

% === 封面 ===
\def\maketitle {
    \begin{titlepage}
    \newgeometry{
      left=2.6cm,  % 取消正文的左侧装订线设置
      right=2.6cm, % 设置为左右对称
      top=2.6cm,
      bottom=2.6cm
    }
    \thispagestyle{empty}
    %\CenterWallPaper{1}{temp.pdf}
    \vspace*{40pt}
    \centerline{\includegraphics[height=3.85cm,width=11cm]{figures/logo} }
    \vspace{52pt}
    \centerline{\xbsong \zihao{-0}{\the\category}}
    \vspace{180pt}
    \centerline {
      \begin{tabular}{ b{2.5cm} >{\raggedright\arraybackslash}b{8cm}}
        \fangsong \zihao{-3} \ziju{2} \textbf{题目：} & {\heiti \zihao{-3} \the\title} \\[-2pt]
        \Xcline{2-2}{1.2pt} \\[0.1cm]
        \fangsong \zihao{-3} \ziju{2} \textbf{学院：} & {\heiti \zihao{-3} \the\school} \\[-2pt]
        \Xcline{2-2}{1.2pt} \\[0.1cm]
        \fangsong \zihao{-3} \ziju{2} \textbf{专业：} & {\heiti \zihao{-3} \the\major} \\[-2pt]
        \Xcline{2-2}{1.2pt} \\[0.1cm]
        \fangsong \zihao{-3} \ziju{2} \textbf{姓名：} & {\heiti \zihao{-3} \the\name} \\[-2pt]
        \Xcline{2-2}{1.2pt} \\[0.1cm]
        \fangsong \zihao{-3} \ziju{2} \textbf{学号：} & {\heiti \zihao{-3} \the\studentid} \\[-2pt]
        \Xcline{2-2}{1.2pt} \\[0.1cm]
        \fangsong \zihao{-3} \textbf{指导教师：} & {\heiti \zihao{-3} \the\supervisor} \\[-2pt]
        \Xcline{2-2}{1.2pt} \\[0.1cm]
      \end{tabular}
    }
    \vskip 1\baselineskip
    \centerline{\fangsong \zihao{4} \textbf{\the\date}}
    \restoregeometry
    \end{titlepage}

    \ifprint
      \thispagestyle{empty}
      \cleardoublepage
    \fi

    \thispagestyle{empty}
    \begin{center}
    ~~\vfill
    \heiti \zihao{2}{\the\title}\\
    \heiti \zihao{2}{\the\titleEn}
    ~~\vfill
    \end{center}
}

% === 目录 ===
\renewcommand{\contentsname}{\hspace*{\fill}\heiti \zihao{3} 目\quad{}录\hspace*{\fill}}

% --- 定义控制命令 ---
\newif\ifforceoddpages % 定义一个条件开关
\def\forceoddpageafterthis{%
  \ifforceoddpages % 检查开关是否为真
    \ifprint
      \cleardoublepage % 强制跳转到下一个奇数页
      \thispagestyle{empty} % 设置当前页样式为空
      \afterpage{\forceoddpageafterthis}% 安排在下一页之后再次执行本命令，形成循环
    \fi
  \fi
}

% --- 创建一个环境来包裹目录 ---
\newenvironment{oddpage}{%
  \forceoddpagestrue % 进入环境时，打开开关
  \afterpage{\forceoddpageafterthis}% 在当前页之后，启动循环
}{%
  \forceoddpagesfalse % 离开环境时，关闭开关
}

\def\maketoc {
  \ifprint
    \thispagestyle{empty}
    \cleardoublepage
  \fi
  \pagenumbering{gobble}
  \ifprint
    \begin{oddpage}
      \tableofcontents
    \end{oddpage}
  \else
    \tableofcontents
  \fi
  
}

% 连接线
\renewcommand{\cftdot}{\xbsong …}
\renewcommand{\cftdotsep}{0.8}

% 取消目录缩进 国标学位论文样式 有需要可以取消注释
% \setlength{\cftchapindent}{0pt}
% \setlength{\cftsecindent}{0pt}
% \setlength{\cftsubsecindent}{0pt}
% \setlength{\cftsubsubsecindent}{0pt}

% === 学术声明 ===
\newlength{\decwidth}       % 定义统一的宽度
\setlength{\decwidth}{10em} % 可根据需要调整


\newcommand{\declaration}[2]{%
    \clearpage
    \ifprint
      \thispagestyle{empty}
      \cleardoublepage
    \fi
    \thispagestyle{empty}
    \vspace*{1cm}%
    \centerline{\heiti \zihao{3} {郑~~重~~声~~明}}
    \vskip 1\baselineskip
    本人呈交的学位论文（设计），是在指导教师的指导下，独立进行研究工作所取得的成果，所有数据、图片资料真实可靠。除文中已经注明引用的内容外，本学位论文（设计）的研究成果不包含他人享有著作权的内容。对本论文（设计）所涉及的研究工作做出贡献的其他个人和集体，均已在文中以明确的方式标明。本学位论文（设计）的知识产权归属于青岛大学。
    \vskip \baselineskip
    \begin{center}
      本人签名：%
      \underline{%
        \makebox[\decwidth][c]{%
          \ifx\\#2\\%
            \hspace{\decwidth}%
          \else
            \includegraphics[width=\decwidth, height=6ex]{#2}%
          \fi
        }%
      }%
      \hspace{0.06\textwidth}%
      日期：%
      \underline{%
        \makebox[\decwidth][c]{#1}%
    }%
    \end{center}%
}

% === 摘要 ===
\newcommand{\varKeyword}{}
\newcommand{\keyword}[1]{\renewcommand{\varKeyword}{#1}}
\newenvironment{abstract}[1]{
    \ifprint
      \thispagestyle{empty}
      \cleardoublepage
    \fi
    \thispagestyle{empty}
    \vspace*{1cm}
    \centerline{\heiti \zihao{3} {摘\quad{}要}}
    \setcounter{page}{1}
    \vspace{1.2cm}
    \keyword{#1}
}{
    \vskip 1\baselineskip
    \noindent{\heiti\textbf{关键词}} \varKeyword
    \clearpage
}
\newenvironment{abstractEn}[1]{
    \ifprint
      \thispagestyle{empty}
      \cleardoublepage
    \fi
    \thispagestyle{empty}
    \vspace*{1cm}
    \centerline{\heiti \zihao{3} \textbf{Abstract}}
    \vspace{1.2cm}
    \keyword{#1}
}{
    \vskip 1\baselineskip
    \noindent\textbf{Keywords} \varKeyword
    \clearpage
}

% === 致谢 ===
\renewenvironment{thanks}{
    \chapter*{致\quad{}谢}
    \addcontentsline{toc}{chapter}{致谢} 
}{\clearpage}

% === 附录 ===
\renewenvironment{appendix}{
    \clearpage
    \pagestyle{empty}
    \ifprint
      \thispagestyle{empty}
      \cleardoublepage
    \fi
    \phantomsection
    \chapter*{附\quad{}录}
    \addcontentsline{toc}{chapter}{附录} 
}{\clearpage}

% === 引用 ===
\newcommand{\reference}[1]{
    \nocite{*}
    \phantomsection
    \addcontentsline{toc}{chapter}{参考文献}
    {
        \kaishu
        \printbibliography[heading=bibliography,title=参考文献]
    }
}

% === 公式 ===
% 公式编号格式
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

\RequirePackage[capitalize,noabbrev]{cleveref} %引用设置
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{section}{第\thesection\ 章}{第\thesection\ 章}
\crefname{subsection}{第\thesubsection\ 节}{第\thesubsection\ 节}
\crefname{equation}{式}{式}
\crefname{algorithm}{算法}{算法}
\crefname{listing}{代码}{代码}