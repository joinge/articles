\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{pdffoils}[2007/03/01 v2.01 Ifi document class]
\DeclareOption{landscape}{\AtEndOfPackage{\foillandscape}}
\DeclareOption{twoside}{\OptionNotUsed}
\DeclareOption{dvips}{
  \def \pdff@ps@code #1{\special{ps: #1}}
  \def \pdff@ps@file #1{\special{psfile=#1.ps}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{dvips}
\ProcessOptions \relax
\RequirePackage{calc}
\RequirePackage[usenames]{color}
\RequirePackage[euler-hat-accent]{eulervm}
\RequirePackage{type1cm}
\RequirePackage{ifthen}
\RequirePackage{newcent}
\RequirePackage{pifont}
\RequirePackage{rotating}
\RequirePackage{textcomp}
\RequirePackage{verbatim}
\RequirePackage{keyval}
\LoadClass{article}
\define@key{pdff@params}{copyright}{\def\pdff@copyright{#1}}
\newcommand{\foilcopyright}[1]{\def\pdff@copyright{#1}}
\foilcopyright{}
\define@key{pdff@params}{date}{\def\pdff@date{#1}}
\newcommand{\foildate}[1]{\def\pdff@date{#1}}
\foildate{}
\define@key{pdff@params}{frame}{\def\pdff@frame{#1}}
\newcommand{\foilframe}[1]{\def\pdff@frame{#1}}
\foilframe{boxed}
\define@key{pdff@params}{framecolor}{\def\pdff@framecol{#1}}
\newcommand{\foilframecolor}[1]{\def\pdff@framecol{#1}}
\foilframecolor{black}
\newboolean{pdff@landscape}
\define@key{pdff@params}{landscape}[true]{\setboolean{pdff@landscape}{#1}}
\newcommand{\foillandscape}{\setboolean{pdff@landscape}{true}}
\define@key{pdff@params}{num}[\thefoil]{\def \pdff@num{#1}}
\newcommand{\foilnum}[1]{\def \pdff@num{#1}}
\foilnum{\thefoil}
\define@key{pdff@params}{numprefix}{\def \pdff@num@pre{#1 }}
\newcommand{\foilnumprefix}[1]{\def \pdff@num@pre{#1 }}
\foilnumprefix{}
\define@key{pdff@params}{numpostfix}{\def \pdff@num@post{ #1}}
\newcommand{\foilnumpostfix}[1]{\def \pdff@num@post{ #1}}
\foilnumpostfix{}
\define@key{pdff@params}{portrait}[true]{%
  \ifthenelse{\boolean{#1}}{\foilportrait}{\foillandscape}}
\newcommand{\foilportrait}{\setboolean{pdff@landscape}{false}}
\foilportrait
\newlength{\pdff@rim@t}
\newlength{\pdff@rim@b}
\newlength{\pdff@rim@l}
\newlength{\pdff@rim@r}
\define@key{pdff@params}{toprim}{\setlength{\pdff@rim@t}{#1}}
\define@key{pdff@params}{bottomrim}{\setlength{\pdff@rim@b}{#1}}
\define@key{pdff@params}{leftrim}{\setlength{\pdff@rim@l}{#1}}
\define@key{pdff@params}{rightrim}{\setlength{\pdff@rim@r}{#1}}
\newcommand{\foiltoprim}[1]{\setlength{\pdff@rim@t}{#1}}
\newcommand{\foilbottomrim}[1]{\setlength{\pdff@rim@b}{#1}}
\newcommand{\foilleftrim}[1]{\setlength{\pdff@rim@l}{#1}}
\newcommand{\foilrightrim}[1]{\setlength{\pdff@rim@r}{#1}}
\foiltoprim{3cm}  \foilbottomrim{3cm}
\foilleftrim{3cm}  \foilrightrim{3cm}
\define@key{pdff@params}{site}{\def\pdff@site{#1}}
\newcommand{\foilsite}[1]{\def\pdff@site{#1}}
\foilsite{}
\define@key{pdff@params}{size}{\def\pdff@size{#1}}
\newcommand{\foilsize}[1]{\def\pdff@size{#1}}
\foilsize{\normalsize}
\define@key{pdff@params}{sound}{\def\pdff@sound{#1}}
\newcommand{\foilsound}[1]{\def\pdff@sound{#1}}
\foilsound{}
\define@key{pdff@params}{title}{\def\pdff@title{#1}}
\newcommand{\foiltitle}[1]{\def\pdff@title{#1}}
\foiltitle{}
\define@key{pdff@params}{year}{\def\pdff@year{#1}}
\newcommand{\foilyear}[1]{\def\pdff@year{#1}}
\foilyear{\the\year}
\newcommand{\foilset}[1]{\setkeys{pdff@params}{#1}}
\newcommand{\foilref}[1]{\@ifundefined{r@#1}
    {{\normalfont\textbf{??}}%
      \PackageWarning{pdffoils}{Reference `#1' undefined}}
    {\expandafter\expandafter\expandafter
      \@car\csname r@#1\endcsname \@nil}}
\newcommand{\lastfoil}{\@ifundefined{pdfflastfoil}
  {0}
  {\pdfflastfoil}}
\newlength{\pdff@len@a}  \newlength{\pdff@len@b}
\newcounter{pdff@int@a}  \newcounter{pdff@int@b}
\newenvironment{foil}[1][]
  {\newpage
    \setkeys{pdff@params}{#1}
    \begingroup
    \immediate\openout \pdff@tmp pdfftmp.tex
    \let\do=\@makeother \dospecials \catcode`\^^M=\active
    \def\verbatim@processline{%
      \immediate\write \pdff@tmp{\the\verbatim@line}}
    \verbatim@start}
  {\immediate\closeout \pdff@tmp 
    \endgroup
    \refstepcounter{foil}
\protected@write\@auxout{}%
  {\string\gdef \string\pdfflastfoil{\thefoil}}
\ifthenelse{\boolean{pdff@landscape}}
 {\setlength{\pdff@text@h}{\paperwidth-\pdff@rim@l-\pdff@rim@r}
  \setlength{\pdff@text@w}{\paperheight-\pdff@rim@t-\pdff@rim@b}}
 {\setlength{\pdff@text@h}{\paperheight-\pdff@rim@t-\pdff@rim@b}
  \setlength{\pdff@text@w}{\paperwidth-\pdff@rim@l-\pdff@rim@r}}
\setcounter{pdff@n@breaks}{0}
\setbox\pdff@box=\hbox\bgroup\begin{minipage}{\pdff@text@w}
    \renewcommand{\section}{\secdef\pdff@section\pdff@section}
\newcommand{\pdff@section}[2][]{\par \medskip
  {\bf\larger\larger\boldmath ##2\pdff@par{3pt}}}
\renewcommand{\subsection}{\secdef\pdff@ssection\pdff@ssection}
\newcommand{\pdff@ssection}[2][]{\par \smallskip
  {\bf\larger\boldmath ##2\pdff@par{0pt}}}
\renewcommand{\subsubsection}{\secdef\pdff@sssection\pdff@sssection}
\newcommand{\pdff@sssection}[2][]{\par
  {\bf\boldmath ##2\pdff@par{0pt}}}
\renewcommand{\paragraph}{\secdef\pdff@para\pdff@para}
\newcommand{\pdff@para}[2][]{\par
  {\bf\boldmath ##2\quad}}
\renewcommand{\subparagraph}{\secdef\pdff@spara\pdff@spara}
\newcommand{\pdff@spara}[2][]{\par
  {\it ##2\quad}}
\def \pdff@par ##1{\global\parskip = ##1\relax
  \global\everypar={\global\parskip=0.8\baselineskip \everypar={}}%
  \par }
\renewcommand{\tiny}{\fontsize{10}{11pt}\selectfont
  \let \smaller=\pdff@too@small \let \larger=\scriptsize}
\renewcommand{\scriptsize}{\fontsize{12}{13.2pt}\selectfont
  \let \smaller=\tiny \let \larger=\footnotesize}
\renewcommand{\footnotesize}{\fontsize{14.4}{15.84pt}\selectfont
  \let \smaller=\scriptsize \let \larger=\small}
\renewcommand{\small}{\fontsize{17}{18.7pt}\selectfont
  \let \smaller=\footnotesize \let \larger=\normalsize}
\renewcommand{\normalsize}{\fontsize{21}{23.1pt}\selectfont
  \let \smaller=\small \let \larger=\large}
\renewcommand{\large}{\fontsize{25}{27.5pt}\selectfont
  \let \smaller=\normalsize \let \larger=\Large}
\renewcommand{\Large}{\fontsize{30}{33pt}\selectfont
  \let \smaller=\large \let \larger=\LARGE}
\renewcommand{\LARGE}{\fontsize{36}{39.6pt}\selectfont
  \let \smaller=\Large \let \larger=\huge}
\renewcommand{\huge}{\fontsize{42}{46.2pt}\selectfont
  \let \smaller=\LARGE \let \larger=\Huge}
\renewcommand{\Huge}{\fontsize{50}{55pt}\selectfont
  \let \smaller=\huge \let \larger=\HUGE}
\newcommand{\HUGE}{\fontsize{60}{66pt}\selectfont
  \let \smaller=\Huge \let \larger=\pfdd@too@large}
\newcommand{\pdff@too@small}{\ClassWarning{pdffoils}{There
  is no \string\smaller\space size than \string\tiny.}}
\newcommand{\pdff@too@large}{\ClassWarning{pdffoils}{There
  is no \string\larger\space size than \string\HUGE.}}
\pdff@size
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.8\baselineskip}
\raggedright  \sloppy
\renewenvironment{figure}
  {\par  \let \caption = \pdff@fig@caption}
  {\par}
\renewenvironment{table}
  {\par  \let \caption = \pdff@tab@caption}
  {\par}
\renewenvironment{figure*}
  {\begin{figure}}
  {\end{figure}}
\renewenvironment{table*}
  {\begin{table}}
  {\end{table}}
\def \pdff@fig@caption ##1{\refstepcounter{pdff@figure}%
  \pdff@caption{\figurename~\thepdff@figure}{##1}}
\def \pdff@tab@caption ##1{\refstepcounter{pdff@table}%
  \pdff@caption{\tablename~\thepdff@table}{##1}}
\def \pdff@caption ##1##2{\pdff@par{3pt}
  \setbox0 = \hbox{\textbf{##1}: }%
  \setlength{\pdff@len@a}{\textwidth-\wd0}%
  \leavevmode\box0\relax
  \begin{minipage}[t]{\pdff@len@a}\raggedright
    ##2
  \end{minipage}\pdff@par{3pt}}
\setcounter{mpfootnote}{1}
\renewcommand{\thempfootnote}{\fnsymbol{mpfootnote}}
\def \@makefntext ##1{\noindent
  \llap{\small \@makefnmark \hspace*{0.25em}}\footnotesize
  \raggedright\sloppy ##1}
\renewcommand{\footnoterule}{}
\setlength{\skip\footins}{20pt}
\setlength{\partopsep}{0pt}
\renewcommand{\@listi}{%
  \setlength{\leftmargin}{\leftmargini}%
  \setlength{\parsep}{0.6\baselineskip}%
  \setlength{\topsep}{-0.3\baselineskip}%
  \setlength{\itemsep}{0.2\baselineskip}}
\renewcommand{\@listii}{%
  \setlength{\leftmargin}{\leftmarginii}%
  \setlength{\labelwidth}{\leftmarginii-\labelsep}%
  \setlength{\topsep}{-0.3\baselineskip}%
  \setlength{\parsep}{0.5\baselineskip}%
  \setlength{\itemsep}{0.1\baselineskip}}
\renewcommand{\@listiii}{%
  \setlength{\leftmargin}{\leftmarginiii}%
  \setlength{\labelwidth}{\leftmarginiii-\labelsep}%
  \setlength{\topsep}{-0.3\baselineskip}%
  \setlength{\parsep}{0.4\baselineskip}%
  \setlength{\itemsep}{0pt}}
\def \tighter {\addtolength{\itemsep}{-0.25\baselineskip}}
\renewcommand{\labelenumi}{%
  \setcounter{pdff@int@a}{181+\value{enumi}}%
  \ding{\value{pdff@int@a}}}
\renewcommand{\labelenumii}{%
  \setcounter{pdff@int@a}{171+\value{enumii}}%
  \ding{\value{pdff@int@a}}}
\renewcommand{\labelitemi}{\rule[0.25ex]{1ex}{1ex}\hspace*{0.25em}}
\renewcommand{\labelitemii}{\raisebox{0.75ex}{%
    \setlength{\fboxrule}{1pt}%
    \setlength{\fboxsep}{0.5ex}\fbox{}}\hspace*{0.25em}}
\renewcommand{\labelitemiii}{\textbullet}
\renewcommand{\labelitemiv}{\raisebox{-0.35ex}{\textdegree}}
\renewcommand{\bigskip}{\par \vspace{\baselineskip}}
\renewcommand{\medskip}{\par \vspace{0.5\baselineskip}}
\renewcommand{\smallskip}{\par \vspace{0.25\baselineskip}}
\renewcommand{\arraystretch}{1.25}
\setlength{\arrayrulewidth}{1pt}
\setlength{\fboxrule}{1pt}
\setlength{\fboxsep}{5pt}
\renewcommand{\textunderscore}{\leavevmode
  \kern.06em
  \vbox{\hrule\@height0pt\@depth1.2pt\@width.4em}\kern.06em\relax}
    \input{pdfftmp}
  \end{minipage}\egroup
\setcounter{pdff@n@in@seq}{1+\thepdff@n@breaks}
\setlength{\pdff@box@h}{\ht\pdff@box+\dp\pdff@box}
\ifthenelse{\pdff@box@h > \pdff@text@h}
  {\setlength{\pdff@len@a}{\pdff@box@h-\pdff@text@h}
\ClassWarning{pdffoils}{Foil is \the\pdff@len@a\space too tall!}}
  {}
\edef \pdff@corr@page {\thepage}
    \setcounter{pdff@n}{0}
\whiledo{\value{pdff@n}<\value{pdff@n@in@seq}}{%
  \addtocounter{pdff@n}{1}  \setcounter{pdff@n@breaks}{0}
  \setcounter{page}{1000+\thefoil}
\ifthenelse{\thepdff@n=\thepdff@n@in@seq}
  {}
  {\setcounter{page}{10*\thepage+\thepdff@n}}
  \setbox\pdff@box=\hbox\bgroup\begin{minipage}{\pdff@text@w}
    \renewcommand{\section}{\secdef\pdff@section\pdff@section}
\newcommand{\pdff@section}[2][]{\par \medskip
  {\bf\larger\larger\boldmath ##2\pdff@par{3pt}}}
\renewcommand{\subsection}{\secdef\pdff@ssection\pdff@ssection}
\newcommand{\pdff@ssection}[2][]{\par \smallskip
  {\bf\larger\boldmath ##2\pdff@par{0pt}}}
\renewcommand{\subsubsection}{\secdef\pdff@sssection\pdff@sssection}
\newcommand{\pdff@sssection}[2][]{\par
  {\bf\boldmath ##2\pdff@par{0pt}}}
\renewcommand{\paragraph}{\secdef\pdff@para\pdff@para}
\newcommand{\pdff@para}[2][]{\par
  {\bf\boldmath ##2\quad}}
\renewcommand{\subparagraph}{\secdef\pdff@spara\pdff@spara}
\newcommand{\pdff@spara}[2][]{\par
  {\it ##2\quad}}
\def \pdff@par ##1{\global\parskip = ##1\relax
  \global\everypar={\global\parskip=0.8\baselineskip \everypar={}}%
  \par }
\renewcommand{\tiny}{\fontsize{10}{11pt}\selectfont
  \let \smaller=\pdff@too@small \let \larger=\scriptsize}
\renewcommand{\scriptsize}{\fontsize{12}{13.2pt}\selectfont
  \let \smaller=\tiny \let \larger=\footnotesize}
\renewcommand{\footnotesize}{\fontsize{14.4}{15.84pt}\selectfont
  \let \smaller=\scriptsize \let \larger=\small}
\renewcommand{\small}{\fontsize{17}{18.7pt}\selectfont
  \let \smaller=\footnotesize \let \larger=\normalsize}
\renewcommand{\normalsize}{\fontsize{21}{23.1pt}\selectfont
  \let \smaller=\small \let \larger=\large}
\renewcommand{\large}{\fontsize{25}{27.5pt}\selectfont
  \let \smaller=\normalsize \let \larger=\Large}
\renewcommand{\Large}{\fontsize{30}{33pt}\selectfont
  \let \smaller=\large \let \larger=\LARGE}
\renewcommand{\LARGE}{\fontsize{36}{39.6pt}\selectfont
  \let \smaller=\Large \let \larger=\huge}
\renewcommand{\huge}{\fontsize{42}{46.2pt}\selectfont
  \let \smaller=\LARGE \let \larger=\Huge}
\renewcommand{\Huge}{\fontsize{50}{55pt}\selectfont
  \let \smaller=\huge \let \larger=\HUGE}
\newcommand{\HUGE}{\fontsize{60}{66pt}\selectfont
  \let \smaller=\Huge \let \larger=\pfdd@too@large}
\newcommand{\pdff@too@small}{\ClassWarning{pdffoils}{There
  is no \string\smaller\space size than \string\tiny.}}
\newcommand{\pdff@too@large}{\ClassWarning{pdffoils}{There
  is no \string\larger\space size than \string\HUGE.}}
\pdff@size
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.8\baselineskip}
\raggedright  \sloppy
\renewenvironment{figure}
  {\par  \let \caption = \pdff@fig@caption}
  {\par}
\renewenvironment{table}
  {\par  \let \caption = \pdff@tab@caption}
  {\par}
\renewenvironment{figure*}
  {\begin{figure}}
  {\end{figure}}
\renewenvironment{table*}
  {\begin{table}}
  {\end{table}}
\def \pdff@fig@caption ##1{\refstepcounter{pdff@figure}%
  \pdff@caption{\figurename~\thepdff@figure}{##1}}
\def \pdff@tab@caption ##1{\refstepcounter{pdff@table}%
  \pdff@caption{\tablename~\thepdff@table}{##1}}
\def \pdff@caption ##1##2{\pdff@par{3pt}
  \setbox0 = \hbox{\textbf{##1}: }%
  \setlength{\pdff@len@a}{\textwidth-\wd0}%
  \leavevmode\box0\relax
  \begin{minipage}[t]{\pdff@len@a}\raggedright
    ##2
  \end{minipage}\pdff@par{3pt}}
\setcounter{mpfootnote}{1}
\renewcommand{\thempfootnote}{\fnsymbol{mpfootnote}}
\def \@makefntext ##1{\noindent
  \llap{\small \@makefnmark \hspace*{0.25em}}\footnotesize
  \raggedright\sloppy ##1}
\renewcommand{\footnoterule}{}
\setlength{\skip\footins}{20pt}
\setlength{\partopsep}{0pt}
\renewcommand{\@listi}{%
  \setlength{\leftmargin}{\leftmargini}%
  \setlength{\parsep}{0.6\baselineskip}%
  \setlength{\topsep}{-0.3\baselineskip}%
  \setlength{\itemsep}{0.2\baselineskip}}
\renewcommand{\@listii}{%
  \setlength{\leftmargin}{\leftmarginii}%
  \setlength{\labelwidth}{\leftmarginii-\labelsep}%
  \setlength{\topsep}{-0.3\baselineskip}%
  \setlength{\parsep}{0.5\baselineskip}%
  \setlength{\itemsep}{0.1\baselineskip}}
\renewcommand{\@listiii}{%
  \setlength{\leftmargin}{\leftmarginiii}%
  \setlength{\labelwidth}{\leftmarginiii-\labelsep}%
  \setlength{\topsep}{-0.3\baselineskip}%
  \setlength{\parsep}{0.4\baselineskip}%
  \setlength{\itemsep}{0pt}}
\def \tighter {\addtolength{\itemsep}{-0.25\baselineskip}}
\renewcommand{\labelenumi}{%
  \setcounter{pdff@int@a}{181+\value{enumi}}%
  \ding{\value{pdff@int@a}}}
\renewcommand{\labelenumii}{%
  \setcounter{pdff@int@a}{171+\value{enumii}}%
  \ding{\value{pdff@int@a}}}
\renewcommand{\labelitemi}{\rule[0.25ex]{1ex}{1ex}\hspace*{0.25em}}
\renewcommand{\labelitemii}{\raisebox{0.75ex}{%
    \setlength{\fboxrule}{1pt}%
    \setlength{\fboxsep}{0.5ex}\fbox{}}\hspace*{0.25em}}
\renewcommand{\labelitemiii}{\textbullet}
\renewcommand{\labelitemiv}{\raisebox{-0.35ex}{\textdegree}}
\renewcommand{\bigskip}{\par \vspace{\baselineskip}}
\renewcommand{\medskip}{\par \vspace{0.5\baselineskip}}
\renewcommand{\smallskip}{\par \vspace{0.25\baselineskip}}
\renewcommand{\arraystretch}{1.25}
\setlength{\arrayrulewidth}{1pt}
\setlength{\fboxrule}{1pt}
\setlength{\fboxsep}{5pt}
\renewcommand{\textunderscore}{\leavevmode
  \kern.06em
  \vbox{\hrule\@height0pt\@depth1.2pt\@width.4em}\kern.06em\relax}
    \input{pdfftmp}
  \end{minipage}\egroup
\thispagestyle{pdff@foil}\null
\newpage 
\setcounter{page}{\pdff@corr@page}}}
\newwrite \pdff@tmp
\newcounter{foil}
\newlength{\pdff@text@h}  \newlength{\pdff@text@w}
\newcounter{pdff@n@in@seq}
\newlength{\pdff@box@h}
\newcounter{pdff@n}
\newcommand{\foilbreak}{%
  \addtocounter{pdff@n@breaks}{1}%
  \ifthenelse{\value{pdff@n}=\value{pdff@n@breaks}}
    {\color{white}
\def \color ##1{}}
    {}%
  }
\newcounter{pdff@n@breaks}
\newsavebox{\pdff@box}
\newcounter{pdff@figure}  \newcounter{pdff@table}
\newcommand{\ps@pdff@foil}{%
  \def \@oddhead{\ifthenelse{\boolean{pdff@landscape}}
  {\setlength{\pdff@len@a}{-1in-\oddsidemargin+\paperwidth/2}%
\setlength{\pdff@len@b}{1in+\topmargin+\headheight}
\ifthenelse{90 < 0}
 {\addtolength{\pdff@len@b}{\pdff@text@w/2}}
 {\addtolength{\pdff@len@b}{-\pdff@text@w/2}}%
\addtolength{\pdff@len@b}{-\paperheight/2}%
\rlap{\hspace*{\pdff@len@a}\raisebox{\pdff@len@b}[0pt][0pt]{%
  \begin{rotate}{90}\usebox{\pdff@box}\end{rotate}}}}
  {\setlength{\pdff@len@a}{\pdff@rim@l-1in-\oddsidemargin}%
\setlength{\pdff@len@b}{1in+\topmargin+\headheight-\paperheight/2}%
\rlap{\hspace*{\pdff@len@a}%
  \raisebox{\pdff@len@b}[0pt][0pt]{\usebox{\pdff@box}}}}%
      \pdff@ps@code{/sp {65536 div 72.27 div 72 mul} def}%
\setlength{\pdff@len@a}{1in+\oddsidemargin}%
\setlength{\pdff@len@b}{\paperheight-1in-\topmargin-\headheight}%
\setcounter{pdff@int@a}{\pdff@len@a+32768}%
\setcounter{pdff@int@b}{\pdff@len@b+32768}%
\pdff@ps@code{/pdff_orig_x \arabic{pdff@int@a} sp def}%
\pdff@ps@code{/pdff_orig_y \arabic{pdff@int@b} sp def}%
\setcounter{pdff@int@a}{\paperwidth+32768}%
\setcounter{pdff@int@b}{\paperheight+32768}%
\pdff@ps@code{/pdff_paper_w \arabic{pdff@int@a} sp def}%
\pdff@ps@code{/pdff_paper_h \arabic{pdff@int@b} sp def}%
\ifthenelse{\boolean{pdff@landscape}}
  {\pdff@ps@code{/pdff_lscape true def}}
  {\pdff@ps@code{/pdff_lscape false def}}%
\pdff@ps@code{/pdff_num (\pdff@num@pre\pdff@num\pdff@num@post)}%
\pdff@ps@code{def}%
\setcounter{pdff@int@a}{\pdff@rim@l+32768}%
\pdff@ps@code{/pdff_rim \arabic{pdff@int@a} sp def}%
\pdff@ps@code{/pdff_sound (\pdff@sound) def}%
\pdff@ps@code{/pdff_copyright (\pdff@copyright) def}%
\pdff@ps@code{/pdff_date (\pdff@date) def}%
\pdff@ps@code{/pdff_site (\pdff@site) def}%
\pdff@ps@code{/pdff_title (\pdff@title) def}%
\pdff@ps@code{/pdff_year (\pdff@year) def}%
\pdff@ps@file{pdff-\pdff@frame}\hfil}%
  \def \@oddfoot{\hfil}}
\endinput
