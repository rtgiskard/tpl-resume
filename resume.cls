% cls with fonts and some other definition

\usepackage{fontspec}									% 字体处理
\usepackage{xeCJK}										% 中文基本环境
\usepackage[UTF8,fontset=none,heading=true]{ctex}		% ctex 中文宏包，定义中文风格
\usepackage{geometry,graphicx,xcolor}					% 基本页面布局及图形处理
%\usepackage{amsmath,amsfonts,amssymb}					% 数学环境基本工具包
\usepackage{enumitem,listings}							% list 环境
\usepackage{tabularx}									% 表格环境
\usepackage{soul}										% underline
\usepackage{calc}										% length by calc
\usepackage{tikz}										% tikz 绘图
\usepackage{fontawesome}								% 字符图标
\usepackage[unicode]{hyperref}							% pdf 标签索引之类

\usetikzlibrary{fadings}

%-----------------------------------------------------------
% font
\setCJKmainfont[AutoFakeBold,AutoFakeSlant]{AR PL KaitiM GB}	% 中文默认字体，文鼎简中楷
\setCJKmonofont[AutoFakeBold,AutoFakeSlant]{AR PL SungtiL GB}	% 中文等宽字体，文鼎简报宋
\setCJKsansfont[AutoFakeBold,AutoFakeSlant]{WenQuanYi Micro Hei}% 中文无衬线字体，文泉驿微米黑

\setmainfont[AutoFakeBold,AutoFakeSlant]{Inconsolata}			% 英文默认字体
\setmonofont[AutoFakeBold,AutoFakeSlant]{Inconsolata}			% 英文等宽字体
\setsansfont[AutoFakeBold,AutoFakeSlant]{Inconsolata}			% 英文无衬线字体

\setCJKfallbackfamilyfont{\CJKrmdefault}[AutoFakeBold,AutoFakeSlant]{
	{AR PL New Kai}, {AR PL New Kai ExtB},
	{AR PL New Sung}, {AR PL New Sung ExtB},
	{WenQuanYi Micro Hei}, {Unifont}
}

\newCJKfontfamily[zhkai]\kaiti{AR PL KaitiM GB}					% arphicfonts, 楷体
\newCJKfontfamily[zhsong]\songti{AR PL SungtiL GB}				% arphicfonts, 宋体
\newCJKfontfamily[newkai]\newkai{AR PL New Kai}					% opendesktop-fonts, 新楷
\newCJKfontfamily[newsong]\newsong{AR PL New Sung}				% opendesktop-fonts, 新宋
\newCJKfontfamily[newmsong]\newmsong{AR PL New Sung Mono}		% opendesktop-fonts, 新宋, mono
\newCJKfontfamily[zhhei]\heiti{WenQuanYi Micro Hei}				% wqy-microhei, 黑体

%-----------------------------------------------------------
\xeCJKsetup {
	xeCJKactive=true,											% 打开对中文的特殊处理
	CJKmath=true,												% 是否支持数学环境中的 cjk 字符
	CJKspace=false,												% 忽略 cjk 文字之间的空格
	xCJKecglue=false,											% 是否对源文件中直接输入的 cjk 文字与西文之间的空格进行调整
	PunctStyle=quanjiao,										% 设置标点处理格式
	AutoFallBack=true,											% 自动启用备用字体
	AutoFakeBold=true,											% 全局设定当没有声明对应的粗体时,是否使用 伪粗体
	AutoFakeSlant=true,											% 全局设定当没有声明对应的斜体时,是否使用 伪斜体
	%EmboldenFactor=4,											% 设置伪粗体的默认粗细程度
	%SlantFactor=0.167,											% 设置伪斜体的倾斜程度,范围是 −0.999 ∼ 0.999
}

%-----------------------------------------------------------
\setlist{topsep=0ex, itemsep=0.2ex, parsep=0ex, leftmargin=2em}	% list 环境调整
\geometry{left=1.6cm,right=1.6cm,top=2cm,bottom=2cm}			% 页边距
\linespread{1.1}												% 单倍行距
%\setlength{\baselineskip}{1.2\baselineskip}					% 改变行距的推荐方式
%\setlength{\parskip}{1ex plus 1ex minus 0ex}					% 段间距, 0.8 - 1.4 ex
%\setlength{\voffset}{-1em}										% 页顶竖直间距调整
%\setlength{\headsep}{2em}										% 页眉与正文间距
\setlength{\tabcolsep}{2pt}										% 表格列间距

\definecolor{bgsect}{gray}{0.94}
\definecolor{fgnote}{gray}{.6}
\definecolor{fgul}{gray}{.9}

% style for underline
\setulcolor{fgul}
%\setul{}{0.1ex}

\pagestyle{empty}
\urlstyle{same}

\raggedbottom
\raggedright

%-----------------------------------------------------------
\newcommand{\resect}[1]{\vspace{1.2ex}\par\begingroup
	\colorbox{bgsect}{
	\begin{minipage}{\linewidth-4\fboxsep}
	\faListUl \bfseries\newsong #1
	\phantomsection \addcontentsline{toc}{section}{#1}
	\end{minipage}}\endgroup\par\vspace{1ex}}

\newcommand{\resubsect}[3]{\vspace{0.2ex}\par\begingroup
	\textbf{#1} \quad \small \textit{#2} \hfill \textit{#3}
	\phantomsection \addcontentsline{toc}{subsection}{#1}
	\endgroup\par\vspace{0.4ex}}

\newcommand{\exprecord}[4]{\vspace{0.2ex}\par\begingroup
	\textbf{#1} \hfill #2 \\
	\qquad \textit{#3} \hfill \small\textit{#4}
	\endgroup\par\vspace{0.2ex}}

\newenvironment{contblock}[1]{\vspace{-1.6ex}\par\begingroup
	\begin{minipage}[t][][c]{\linewidth-#1} }{
	\end{minipage}\par\endgroup\vspace{1.2ex} }

%-----------------------------------------------------------
% tikz command
\tikzfading[name=fade right,
	left color=transparent!10,
	right color=transparent!90]

\tikzfading[name=fade inside,
	inner color=transparent!0,
	outer color=transparent!70]

\newcommand{\fadehsep}[1]{\begin{tikzpicture}
	\fill [black!20, path fading=fade right] (0,0) rectangle (#1,2pt);
	\end{tikzpicture}}

\newcommand{\fadevsep}[1]{\begin{tikzpicture}
	\fill [black!20, path fading=fade inside] (0,0) rectangle (1pt,#1);
	\end{tikzpicture}}

%-----------------------------------------------------------
% for convenience
\newcommand{\snote}[1]{{\color{fgnote}\scriptsize #1}}

% vi: set ts=4 syntax=tex :
