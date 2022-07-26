# uulm-document
An inofficial LaTeX Documentclass for Documents at Ulm University.

## Installation
### Getting Started
- Create a Project Folder or on your Device, where you keep all your Document Files
- Download this Repository and move the File `uulm-document.cls` and the Directory `img` to your Project Folder
- Create the `.tex`-File for your Document

Your Project Folder should look like this:
```
Project_Folder
  ╟─  img
  ║      ╙─  uulmlogo.png
  ╟─  uulm-document.cls
  ╙─  your_document.tex
```

### Document Setup
For a more detailed Instruction on how to setup your Document, plase take a Look at the Documentation.

There is a bare Minimum Script you can copy:
```LaTeX
\documentclass[a4paper]{uulm-document}

\documentTitle{Document Title}
\documentSubtitle{Document Subtitle}
\documentAuthor{Document Author}
\documentDate{\today}

\faculty{default}
\titlepagestyle{default}
\printmodefalse

\begin{document}
	\maketitle
	\tableofcontents
\end{document}
```