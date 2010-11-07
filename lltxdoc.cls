\ProvidesClass{lltxdoc}

\LoadClass[a4paper]{scrartcl}
\RequirePackage{fontspec}
\RequirePackage{xcolor, metalogo, xspace, ifmtarg, xargs, fancyvrb}
\RequirePackage[english]{babel}
\RequirePackage[colorlinks=true]{hyperref}
\RequirePackage{bookmark}

\defaultfontfeatures{Ligatures=TeX, Scale=MatchLowercase}
\setmainfont{Linux Libertine O}
\setsansfont{Kurier}
\setmonofont{Inconsolata}

\newcommand*\simplelogo [1] {%
  \ifcsname #1\endcsname \else \badlogocommand \fi
  \lowercase{\expandafter\simple@logo\expandafter{%
      \csname #1\expandafter\endcsname\expandafter}}\expandafter{%
    \csname #1\endcsname}{#1}}
\newcommand*\simple@logo [3] {%
  \newcommand #1 {#2\xspace}%
  \pdfstringdefDisableCommands{\def#1{#3\space}}}

\providecommand \ConTeXt {Con\TeX{}t}
\providecommand \pdfTeX {pdf\TeX}

\simplelogo {TeX}
\simplelogo {LaTeX}
\simplelogo {LuaTeX}
\simplelogo {LuaLaTeX}
\simplelogo {XeTeX}
\simplelogo {XeLaTeX}
\simplelogo {ConTeXt}
\simplelogo {pdfTeX}

\fvset{formatcom=\color{blue!80!black}}
\DefineShortVerb\©

\newcommand*\email [1] {\href{mailto:#1}{#1}}
\newcommand*\ctan  [1] {\href{http://mirror.ctan.org/#1}{\nolinkurl{#1}}}
\newcommand \file      {\nolinkurl}
\newcommand*\note  [1] {\noindent\textsf{\bfseries #1.}\quad\ignorespaces}

\newcommandx*\para [2][2] {%
  \@ifmtarg{#2}{\para@{#1}{#1}}{\para@{#1}{#2}}}
\newcommand \para@ [2] {%
  \par \medskip
  \hypertarget{para.#2}{}%
  \belowpdfbookmark{#1}{para.#2}%
  \noindent
  \label{para.#2}%
  \makebox [0pt][r] {%
    \textsf{\bfseries #1\quad}}%
  \ignorespaces
}
\newcommandx*\pararef [3][1, 3] {%
  \@ifmtarg{#3}{\para@ref{#1}{#2}{#2}}{\para@ref{#1}{#2}{#3}}}
\newcommand \para@ref [3] {%
  \hyperlink{para.#3}{#1{#2}}}
\newcommand*\parapageref [1] {%
  \autopagref{para.#1}}

\newcommand \pf {\textsf}
\newcommand \pk {\pararef[\pf]}

\newcommandx*\pkdesc [6][6] {%
  \para                       {#1}
  \pkditem {Engines}          {#3}
  \pkditem {Formats}          {#4}          \\
  \pkditem {Authors}          {#2}          \\
  \pkditem {CTAN location}    {#5}[\ctan]   \@ifnotmtarg{#6}{\\}
  \pkditem {Development url}  {#6}[\url]    \\
}
\newcommandx*\pkditem [3][3] {\@ifnotmtarg{#2}{%
    \textsf{\bfseries #1:} #3{#2}.%
  }}

\newcommand \WSPR {Will Robertson\xspace}
\newcommand \KH   {Khaled Hosny\xspace}
\newcommand \HO   {Heiko Oberdiek\xspace}
\newcommand \ER   {Élie Roux\xspace}
\newcommand \MPG  {Manuel Pégourié-Gonnard\xspace}
\newcommand \VK   {Vafa Khalighi\xspace}
\newcommand \HH   {Hans Hagen\xspace}
\newcommand \Taco {Taco Hoewater\xspace}
