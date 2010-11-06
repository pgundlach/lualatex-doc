\ProvidesClass{lltxdoc}

\LoadClass[a4paper]{scrartcl}
\RequirePackage{fontspec}
\RequirePackage{xcolor, metalogo, xspace, ifmtarg}
\RequirePackage[english]{babel}
\RequirePackage[colorlinks=true]{hyperref}
\RequirePackage{bookmark}

\defaultfontfeatures{Ligatures=TeX, Scale=MatchLowercase}
\setmainfont{Linux Libertine O}
\setsansfont{Kurier}
\setmonofont[Color=0000CC]{Inconsolata}

\newcommand*\simplelogo [1] {%
  \ifcsname #1\endcsname \else \badlogocommand \fi
  \lowercase{\expandafter\simple@logo\expandafter{%
      \csname #1\expandafter\endcsname\expandafter}}\expandafter{%
    \csname #1\endcsname}{#1}}
\newcommand*\simple@logo [3] {%
  \newcommand #1 {#2\xspace}%
  \pdfstringdefDisableCommands{\def#1{#3}}}

\simplelogo {TeX}
\simplelogo {LaTeX}
\simplelogo {LuaTeX}
\simplelogo {LuaLaTeX}
\simplelogo {XeTeX}
\simplelogo {XeLaTeX}

\newcommand*\email [1] {\href{mailto:#1}{#1}}
