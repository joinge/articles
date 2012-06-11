\NeedsTeXFormat{LaTeX2e}[1994/12/01] %% Any version, really.
\ProvidesPackage{uioletter}[2011/03/21 v3.01c UiO document class]
\newcommand{\uioletter@bokmaal}{%
  \def \uioletter@dept@name {Institutt for informatikk}%
  \def \uioletter@date@name {Dato}%
  \def \uioletter@ouraddr@name {Postboks 1080 Blindern}%
  \def \uioletter@email@name {E-post}%
  \def \uioletter@fax@name {Faks}%
  \def \uioletter@phone@name {Telefon}%
  \def \uioletter@ourref@name {V\aa r ref}%
  \def \uioletter@ourzip@name {0316}%
  \def \uioletter@yourref@name {Deres ref}}
\uioletter@bokmaal
\newcommand{\uioletter@nynorsk}{%
  \uioletter@bokmaal}
\newcommand{\uioletter@english}{%
  \def \uioletter@dept@name {Department of Informatics}%
  \def \uioletter@date@name {Date}%
  \def \uioletter@ouraddr@name {PO box 1080 Blindern}%
  \def \uioletter@email@name {E-mail}%
  \def \uioletter@fax@name {Fax}%
  \def \uioletter@phone@name {Phone}%
  \def \uioletter@ourref@name {Our ref}%
  \def \uioletter@ourzip@name {NO-0316}%
  \def \uioletter@yourref@name {Your ref}}
\DeclareOption{norsk}{\uioletter@bokmaal
  \def \uioletter@suffix {}
  \PassOptionsToPackage{norsk}{babel}}
\DeclareOption{nynorsk}{\uioletter@nynorsk
  \def \uioletter@suffix {}
  \PassOptionsToPackage{nynorsk}{babel}}
\DeclareOption{UKenglish}{\uioletter@english
  \def \uioletter@suffix {-eng}
  \PassOptionsToPackage{UKenglish}{babel}}
\DeclareOption{USenglish}{\uioletter@english
  \def \uioletter@suffix {-eng}
  \PassOptionsToPackage{USenglish}{babel}}
\uioletter@bokmaal
\DeclareOption{a4paper}{}
\DeclareOption*{%
    \ClassWarning{uioletter}{Option '\CurrentOption' is not recognised}}
\ProcessOptions* \relax
\RequirePackage{babel}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage[absolute]{textpos}
\RequirePackage{uiofont2010}
\LoadClass[a4paper,11pt]{letter}
\newcommand{\countersign}[1]{\def \uioletter@countersign {#1}}
\def \uioletter@countersign {}
\newcommand{\countersigntitle}[1]{\def \uioletter@countertitle {#1}}
\def \uioletter@countertitle {}
\newcommand{\executive}[1]{\def \uioletter@executive {#1}}
\def \uioletter@executive {}
\newcommand{\execaddr}[1]{\def \uioletter@execaddr {#1}}
\def \uioletter@execaddr {}
\newcommand{\mytitle}[1]{\def \uioletter@mytitle {#1}}
\def \uioletter@mytitle {}
\newcommand{\ouraddr}[1]{\def \uioletter@ouraddr {#1}}
\def \uioletter@ouraddr {\uioletter@ouraddr@name}
\newcommand{\ourcity}[1]{\def \uioletter@ourcity {#1}}
\def \uioletter@ourcity {Oslo}
\newcommand{\ourdept}[1]{\def \uioletter@ourdept {#1}}
\def \uioletter@ourdept {\uioletter@dept@name}
\newcommand{\ouremail}[1]{\def \uioletter@ouremail {#1}}
\def \uioletter@ouremail {}
\newcommand{\ourfax}[1]{\def \uioletter@ourfax {#1}}
\def \uioletter@ourfax {}
\newcommand{\ourphone}[1]{\def \uioletter@ourphone {#1}}
\def \uioletter@ourphone {}
\newcommand{\ourref}[1]{\def \uioletter@ourref {#1}}
\def \uioletter@ourref {}
\newcommand{\oursect}[1]{\def \uioletter@oursect {#1}}
\def \uioletter@oursect {}
\newcommand{\ourweb}[1]{\def \uioletter@ourweb {#1}}
\def \uioletter@ourweb {www.uio.no}
\newcommand{\ourzip}[1]{\def \uioletter@ourzip {#1}}
\def \uioletter@ourzip {\uioletter@ourzip@name}
\newcommand{\yourref}[1]{\def \uioletter@yourref {#1}}
\def \uioletter@yourref {}
\let \uioletter@orig@letter = \letter
\renewcommand{\letter}[1]{%
  \uioletter@orig@letter{#1}%
  \uioletter@addFixedElements
  \thispagestyle{empty}
  \vspace*{-1in}
\vspace*{-\topmargin}
\vspace*{-\headheight}
\vspace*{-\headsep}
\vspace*{99mm}
\vspace*{-1.5ex}
\setlength{\baselineskip}{5mm plus 1pt minus 1pt}
\raggedright
\setlength{\parindent}{0pt}%
\setlength{\parskip}{5mm plus 2pt minus 2pt}}
\newcommand{\uioletter@addFixedElements}{%
  \begin{textblock*}{15cm}(20mm,12mm)
  \includegraphics[height=9.3mm]{ifi-mn-navn\uioletter@suffix}
\end{textblock*}
  \begin{textblock*}{17cm}(20mm,46mm)
  \footnotesize
  \toname\\
  \toaddress\null
\end{textblock*}
  \begin{textblock*}{17cm}(20mm,72mm)
  \footnotesize
  \ifthenelse{\boolean{uioletter@date}}
    {\makebox[45pt][l]{\uioletter@date@name:}\today}
    {}\mbox{}
  \ifthenelse{\equal{\uioletter@yourref}{}}{}
    {\\ \makebox[45pt][l]{\uioletter@yourref@name:}\uioletter@yourref}%
  \ifthenelse{\equal{\uioletter@ourref}{}}{}
    {\\ \makebox[45pt][l]{\uioletter@ourref@name:}\uioletter@ourref}
\end{textblock*}
  \begin{textblock*}{20mm}(22.5mm,105mm)
  \includegraphics{uio-bg-colon}
\end{textblock*}
  \begin{textblock*}{19mm}(24mm,266mm)
  \includegraphics[height=19mm]{uio-segl}
\end{textblock*}
  \begin{textblock*}{147,5mm}(62.5mm,271mm)
  \scriptsize
  \begin{tabularx}{127.5mm}[t]{@{}%
      >{\raggedright}X@{}%
      >{\raggedright}X@{}%
      >{\raggedright}X@{}}
    \uioletter@ourdept&
    \ifthenelse{\equal{\uioletter@oursect}{}}{~}
      {\uioletter@oursect}\\
    \uioletter@ouraddr\\
    \uioletter@ourzip~\uioletter@ourcity&
    \makebox[4em][l]{\uioletter@phone@name:} \uioletter@ourphone\\
    \makebox[4em][l]{\uioletter@fax@name:} \uioletter@ourfax\\
    \makebox[4em][l]{\uioletter@email@name:} 
      \textsf{\uioletter@ouremail}\\
    \makebox[4em][l]{Www:} \textsf{\uioletter@ourweb}\\
    \tabularnewline
  \end{tabularx}
\end{textblock*}}
\newboolean{uioletter@date}  \setboolean{uioletter@date}{false}
\AtBeginDocument{
  \ifthenelse{\isundefined{\iso@printday}} %% Package isodate loaded?
    {}
    {\setboolean{uioletter@date}{true}}
  \ifthenelse{\equal{\@date}{}}            %% \date{} ?
    {}
    {\setboolean{uioletter@date}{true}}
}
\setlength{\oddsidemargin}{20mm-1in}
\setlength{\textwidth}{21cm-20mm-20mm}
\setlength{\topmargin}{46mm-1in-\headheight-\headsep}
\setlength{\textheight}{29.7cm-46mm-37mm}
\renewcommand{\opening}[1]{%
  \textbf{#1}\par \vspace{1pt}\vspace{-\baselineskip}}
\renewcommand{\closing}[1]{\par\vspace{1\baselineskip}
  \begin{minipage}{\textwidth}
    #1\par
    \vspace{3\baselineskip}
    \mbox{}\fromsig\\
    \mbox{}\uioletter@mytitle\\
    \leavevmode \hspace*{85mm}%
\begin{minipage}{85mm}
  \mbox{}%
  \ifthenelse{\equal{\uioletter@countersign}{}}{}
    {\uioletter@countersign\\}%
  \mbox{}%
  \ifthenelse{\equal{\uioletter@countertitle}{}}{}
    {\uioletter@countertitle}
\end{minipage}\par 
    \mbox{}%
\ifthenelse{\equal{\uioletter@executive}{}}{}
  {\par \vspace*{\parskip}
   \mbox{}\uioletter@executive
   \ifthenelse{\equal{\uioletter@execaddr}{}}{}
     {\\ \emph{\uioletter@execaddr}}
  }
  \end{minipage}\par
  \vspace{\parskip}
\setlength{\parskip}{0pt}}
\endinput
