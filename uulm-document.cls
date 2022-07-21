\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uulm-document}[2022/06/28 Jens Ostertag - UUlm Document]


%%%%%%%%%%%%%%%%%%%%%%%%%%
%   LOAD DEFAULT CLASS   %
%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClassWithOptions{article}


%%%%%%%%%%%%%%%%
%   COMMANDS   %
%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}


%%%%%%%%%%%%%%%%%%%%%%%%%
%   DOCUMENT METADATA   %
%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@title{Titel des Dokuments}
\newcommand{\documentTitle}[1]{
	\def\@documentTitle{#1}
}

\def\@subtitle{Subtitel des Dokuments}
\newcommand{\documentSubtitle}[1]{
	\def\@documentSubtitle{#1}
}

\def\@author{Autor}
\newcommand{\documentAuthor}[1]{
	\def\@documentAuthor{#1}
}

\def\@date{\today}
\newcommand{\documentDate}[1]{
	\def\@documentDate{#1}
}

\newif\ifprintmode

\title{\@documentTitle}
\author{\@documentAuthor}
\date{\@documentDate}


%%%%%%%%%%%%%%%%%%%%%%%%
%   DOCUMENT PADDING   %
%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[margin=1in]{geometry}


%%%%%%%%%%%%%%%%%%%%%%%%%
%   DOCUMENT ENCODING   %
%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc}


%%%%%%%%%%%%%%%%%%%%%%%
%   DOCUMENT COLORS   %
%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xcolor}

\def\@facultyColorCode{7D9AAA}
\def\@accentColorCode{CBC6BA}

\definecolor{facultyColor}{HTML}{\@facultyColorCode}
\definecolor{accentColor}{HTML}{\@accentColorCode}
\definecolor{medColor}{HTML}{26537C}
\definecolor{natColor}{HTML}{E06C07}
\definecolor{infIngPsyColor}{HTML}{A32638}
\definecolor{mathColor}{HTML}{55AA1B}

\newcommand{\setFacultyColor}[1]{
	\def\@facultyColorCode{#1}
	\definecolor{facultyColor}{HTML}{\@facultyColorCode}
}

\newcommand{\setAccentColor}[1]{
	\def\@accentColorCode{#1}
	\definecolor{accentColor}{HTML}{\@accentColorCode}
}

\newcommand{\faculty}[1]{
	\ifthenelse{\equal{#1}{med}}
	{\setFacultyColor{26547C}}
	{
		\ifthenelse{\equal{#1}{nat}}
		{\setFacultyColor{DF6D07}}
		{
			\ifthenelse{\equal{#1}{infIngPsy}}
			{\setFacultyColor{A32638}}
			{
				\ifthenelse{\equal{#1}{math}}
				{\setFacultyColor{56AA1C}}
				{\setFacultyColor{7D9AAA}}
			}
		}
	}
}


%%%%%%%%%%%%%%%%%%%%%%
%   DOCUMENT FONTS   %
%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\familydefault}{\sfdefault}


%%%%%%%%%%%%%%%%%%
%   HYPERLINKS   %
%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
	colorlinks,
	citecolor=black,
	filecolor=black,
	linkcolor=black,
	urlcolor=facultyColor
}


%%%%%%%%%%%%%%
%   IMAGES   %
%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\graphicspath{{./img/}}


%%%%%%%%%%%%
%   TikZ   %
%%%%%%%%%%%%
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}
\usetikzlibrary{fit}


%%%%%%%%%%%%%
%   MATHS   %
%%%%%%%%%%%%%
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\newcommand{\qed}{\hfill\ensuremath{\square}}


%%%%%%%%%%%%%%%%
%   Listings   %
%%%%%%%%%%%%%%%%
\RequirePackage{listings}

\definecolor{codeBackgroundColor}{rgb}{1, 1, 1}
\definecolor{codeCommentColor}{rgb}{.5, .5, .5}
\definecolor{codeKeywordColor}{rgb}{0, .7, 0}
\definecolor{codeNumberColor}{rgb}{0, 0, 0}
\definecolor{codeStringColor}{rgb}{1, .3, 0}

\lstdefinestyle{codestyle}{
	backgroundcolor=\color{codeBackgroundColor},
	commentstyle=\color{codeCommentColor},
	keywordstyle=\color{codeKeywordColor},
	numberstyle=\color{codeNumberColor},
	stringstyle=\color{codeStringColor},
	basicstyle=\ttfamily\footnotesize,
	basicstyle=\ttfamily\color{black},
	breakatwhitespace=false,
	breaklines=true,
	captionpos=b,
	keepspaces=true,
	numbers=left,
	numbersep=5pt,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	tabsize=4
}

\lstset{style=codestyle}


%%%%%%%%%%%%%%%%
%   CsQuotes   %
%%%%%%%%%%%%%%%%
\RequirePackage{csquotes}


%%%%%%%%%%%%%
%   INDEX   %
%%%%%%%%%%%%%
\RequirePackage{imakeidx}
\makeindex


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   GERMAN TABLEOFCONTENTS   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tocloft}
\renewcommand*\contentsname{Inhaltsverzeichnis}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   PAGE STYLE & NUMBERING   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{scrlayer-scrpage}
\newpairofpagestyles{default-pagestyle}{
	\clearpairofpagestyles
	\renewcommand*{\headfont}{\normalfont}
	\ifprintmode
		\cfoot{\thepage}
	\else
		\chead{
			\begin{tikzpicture}[remember picture, overlay]
				\node (fullwidth) [rectangle, fill=accentColor, minimum width=\paperwidth, text width=\textwidth, inner sep=.15in, outer sep=0, below, align=right] at (current page.north) {\begin{tabular}{l}\@documentTitle\end{tabular} \hspace*{\fill} \begin{tabular}{r}\@documentSubtitle\end{tabular}};
				\node (pagenumber) [fill=facultyColor, minimum width=.75in, fit={(fullwidth.south) (fullwidth.north)}, inner sep=0, outer sep=0, below left, label={[white]center:\thepage}] at (current page.north east) {};
			\end{tikzpicture}
		}
	\fi
}

\AtBeginDocument{\pagestyle{default-pagestyle}}


%%%%%%%%%%%%%
%   TITLE   %
%%%%%%%%%%%%%
\def\@headerSpacing{1.5in}
\def\@titlePageStyle{default}

\newcommand{\headerspacing}[1]{
	\def\@headerSpacing{#1}
}

\newcommand{\titlepagestyle}[1]{
	\def\@titlePageStyle{#1}
	
	\ifthenelse{\equal{\@titlePageStyle}{clear}}{
		{\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{default-pagestyle}}}}
		{}
	}
}

\renewcommand{\maketitle}{
	\begin{tikzpicture}[remember picture, overlay]
		\node (logo) [rectangle, minimum width=\paperwidth, text width=\textwidth, inner sep=.25in, outer sep=0, below, align=right] at ($(current page.north)+(0, -.5cm)$) {\includegraphics[width=7.3cm]{uulmlogo.png}};
		\node (title) [rectangle, fill=facultyColor, minimum width=\paperwidth, text width=\textwidth, inner sep=.5cm, outer sep=0, align=right, below=0mm of logo] {\textcolor{white}{\LARGE\@documentTitle}};
		\node (subtitle) [rectangle, fill=accentColor, minimum width=\paperwidth, text width=\textwidth, inner sep=.25cm, outer sep=0, align=right, below=0mm of title] {{\Large\@documentSubtitle}\\\@documentDate\hspace*{\fill}\@documentAuthor};
	\end{tikzpicture}
	\thispagestyle{empty}
	\vspace*{\@headerSpacing}\\
	\ifthenelse{\equal{\@titlePageStyle}{clear}}{
		{\clearpage}
		{}
	}
}