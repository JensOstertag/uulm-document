\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uulm-document}[2022/06/28 Jens Ostertag - UUlm Document]


%%%%%%%%%%%%%%%%%%%%%%%%%%
%   LOAD DEFAULT CLASS   %
%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass{article}


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
\RequirePackage{ifthen}

\def\@facultyColorCode{CBC6BA}
\def\@accentColorCode{CBC6BA}

\definecolor{facultyColor}{HTML}{\@facultyColorCode}
\definecolor{accentColor}{HTML}{\@accentColorCode}

\newcommand{\setFacultyColor}[1]{
	\def\@facultyColorCode{#1}
}

\newcommand{\setAccentColor}[1]{
	\def\@accentColorCode{#1}
}

\newcommand{\faculty}[1]{
	\ifthenelse{\equal{#1}{med}}
	{\setFacultyColor{26537C}}
	{
		\ifthenelse{\equal{#1}{nat}}
		{\setFacultyColor{E06C07}}
		{
			\ifthenelse{\equal{#1}{infIngPsy}}
			{\setFacultyColor{A32638}}
			{
				\ifthenelse{\equal{#1}{math}}
				{\setFacultyColor{55AA1B}}
				{\setFacultyColor{CBC6BA}}
			}
		}
	}
	\definecolor{facultyColor}{HTML}{\@facultyColorCode}
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
\usetikzlibrary{calc}
\usetikzlibrary{positioning}


%%%%%%%%%%%%%
%   MATHS   %
%%%%%%%%%%%%%
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\newcommand{\qed}{\hfill\ensuremath{\square}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   GERMAN TABLEOFCONTENTS   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tocloft}
\renewcommand*\contentsname{Inhaltsverzeichnis}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}


%%%%%%%%%%%%%%%%%%%%%%
%   PAGE NUMBERING   %
%%%%%%%%%%%%%%%%%%%%%%
\pagenumbering{gobble}


%%%%%%%%%%%%%
%   TITLE   %
%%%%%%%%%%%%%
\renewcommand{\maketitle}{
\thispagestyle{empty}
\begin{tikzpicture}[remember picture, overlay]
\node (logo) [rectangle, minimum width=\paperwidth, text width=\textwidth, inner sep=.25in, outer sep=0, below, align=right] at ($(current page.north)+(0, -.5cm)$) {\includegraphics[width=7.3cm]{uulmlogo.png}};
\node (title) [rectangle, fill=facultyColor, minimum width=\paperwidth, text width=\textwidth, inner sep=.5cm, outer sep=0, align=right, below=0mm of logo] {\textcolor{white}{\LARGE\@documentTitle}};
\node (subtitle) [rectangle, fill=accentColor, minimum width=\paperwidth, text width=\textwidth, inner sep=.25cm, outer sep=0, align=right, below=0mm of title] {{\Large\@documentSubtitle}\\\@documentDate\hspace*{\fill}\@documentAuthor};
\end{tikzpicture}
\vspace*{2in}\\
}