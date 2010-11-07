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

\newcommand \pf {\textsf}

\newcommandx*\pditem [3][3] {\@ifnotmtarg{#2}{%
    \linebreak[3]%
    \textsf{\bfseries #1:} #3{#2}.%
  }}
\newcommandx*\pkgdesc [6][1, 6] {%
  \par\noindent
  \pditem {Name}            {#1}
  \pditem {Authors}         {#2}
  \pditem {Engines}         {#3}
  \pditem {Formats}         {#4}
  \pditem {CTAN location}   {#5}[\ctan]
  \pditem {Development url} {#6}[\url]
  \newline
}
\newcommand \WSPR {Will Robertson\xspace}
\newcommand \KH   {Khaled Hosny\xspace}
\newcommand \HO   {Heiko Oberdiek\xspace}
\newcommand \ER   {Élie Roux\xspace}
\newcommand \MPG  {Manuel Pégourié-Gonnard\xspace}
\newcommand \VK   {Vafa Khalighi\xspace}
\newcommand \HH   {Hans Hagen\xspace}
\newcommand \Taco {Taco Hoewater\xspace}
