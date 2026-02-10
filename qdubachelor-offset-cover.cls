\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qdubachelor-offset-cover}[2022/06/07 1.3.0 Offset Cover Template for Bachelor Degree Thesis of Qingdao University]

%twoside -双面 openany -新章节可在偶数页开始
\LoadClass[winfonts,twoside,openany,zihao=-4,UTF8]{ctexbook}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions
%------------------------ Packages ------------------------

\RequirePackage{fancyhdr}
\RequirePackage[a3paper,centering,landscape,left=26.4cm,right=-3.4cm,top=2cm,bottom=2cm]{geometry} %页面设置
%\RequirePackage{wallpaper} %用于封面元素对齐
\RequirePackage{makecell}
\RequirePackage{array} %绘制封面下划线
\RequirePackage{titlesec} %标题样式设置
\RequirePackage{graphicx} %插图环境

%head&foot setting
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

\fancypagestyle{plain}{%
\fancyhf{}
\chead{\zihao{5} 青岛大学本科毕业论文（设计）}
\cfoot{\zihao{5}\thepage}
\renewcommand\headrulewidth{0.4pt}
}

\fancypagestyle{emptynumbering}{%
\fancyhf{}
\cfoot{\zihao{5}\thepage}
\renewcommand\headrulewidth{0pt}
}

%font setting
\RequirePackage{xeCJK}
\RequirePackage{fontspec}
%\setmainfont{Times New Roman}
\setCJKfamilyfont{xbsong}{FZXiaoBiaoSong-B05S}
\newcommand{\xbsong}{\CJKfamily{xbsong}}

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

%parameter
\newtoks\category %论文类别
\newtoks\title %论文标题
\newtoks\titleEn %论文英文标题
\newtoks\school %学院
\newtoks\major %专业
\newtoks\name %姓名
\newtoks\supervisor %指导教师
\newtoks\date %封面日期
\newtoks\studentid %学号

%------------------------ cover ------------------------
\def\maketitle {
    \begin{titlepage}
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
    \end{titlepage}
    \thispagestyle{empty}
}
