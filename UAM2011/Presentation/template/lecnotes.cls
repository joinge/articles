%%
%% This is file `lecnotes.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% lecnotes.dtx  (with options: `code')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from lecnotes.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file lecnotes.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\ProvidesClass {lecnotes}[2006/08/21 LaTeX2e document class v2.06d]
\DeclareOption{10pt}{
  \def \lno@abstr@id@sz    {14}  \def \lno@abstr@id@ln     {0}
  \def \lno@caption@lab@sz  {9}  \def \lno@caption@lab@ln  {0}
  \def \lno@caption@text@sz{10}  \def \lno@caption@text@ln{11}
  \def \lno@chap@id@sz     {20}  \def \lno@chap@id@ln      {0}
  \def \lno@chap@num@sz    {30}  \def \lno@chap@num@ln     {0}
  \def \lno@chap@txt@sz    {30}  \def \lno@chap@txt@ln    {30}
  \def \lno@chapquo@auth@sz{10}  \def \lno@chapquo@auth@ln{12}
  \def \lno@chapquo@text@sz{10}  \def \lno@chapquo@text@ln{12}
  \def \lno@xample@line@sz  {7}  \def \lno@xample@line@ln  {0}
  \def \lno@footnote@num@sz {7}  \def \lno@footnote@num@ln {0}
  \def \lno@page@bot@sz    {12}  \def \lno@page@bot@ln     {0}
  \def \lno@page@top@sz    {11}  \def \lno@page@top@ln     {0}
  \def \lno@sec@num@sz     {14}  \def \lno@sec@num@ln      {0}
  \def \lno@ssec@num@sz    {12}  \def \lno@ssec@num@ln     {0}
  \def \lno@sssec@num@sz   {11}  \def \lno@sssec@num@ln    {0}
  \def \lno@para@num@sz    {10}  \def \lno@para@num@ln     {0}
  \def \lno@spara@num@sz    {9}  \def \lno@spara@num@ln    {0}
  \def \lno@sec@txt@sz     {17}  \def \lno@sec@txt@ln     {18}
  \def \lno@ssec@txt@sz    {14}  \def \lno@ssec@txt@ln    {15}
  \def \lno@sssec@txt@sz   {12}  \def \lno@sssec@txt@ln   {12}
  \def \lno@para@txt@sz    {11}  \def \lno@para@txt@ln    {11}
  \def \lno@spara@txt@sz   {10}  \def \lno@spara@txt@ln   {10}
  \def \lno@title@author@sz{17}  \def \lno@title@author@ln{17}
  \def \lno@title@title@sz {25}  \def \lno@title@title@ln {25}
  \def \lno@parskip {12pt plus 4pt minus 2pt}
  \def \lno@noskip {0pt plus 4pt minus 2pt}
}
\DeclareOption{11pt}{\ClassWarningNoLine{lecnotes}{Option
    `11pt' not supported.}}
\DeclareOption{12pt}{\ClassWarningNoLine{lecnotes}{Option
    `12pt' not supported.}}
\DeclareOption{cm}{
  \def \lno@alt@font {cmss}
  \def \lno@l@font {m}  \def \lno@eb@font {bx}
}
\DeclareOption{lucida}{
  \AtEndOfClass{\RequirePackage{lucidabr}}
  \def \lno@alt@font {pgs}
  \def \lno@l@font {l}  \def \lno@eb@font {eb}
}
\DeclareOption{newcent}{
  \AtEndOfClass{\RequirePackage{mathpple,newcent}}
  \def \lno@alt@font {pag}
  \def \lno@l@font {m}  \def \lno@eb@font {b}
}
\DeclareOption{american}{%
  \def \lno@xample@name {Example}
  \def \lno@xamplelist@name {List of Examples}}
\DeclareOption{english}{\ExecuteOptions{american}}
\DeclareOption{norsk}{%
  \def \lno@xample@name {Eksempel}
  \def \lno@xamplelist@name {Eksempler}}
\DeclareOption{nynorsk}{%
  \def \lno@xample@name {Eksempel}
  \def \lno@xamplelist@name {Eksempel}}
\DeclareOption{boxfn}{\def \@makefnmark {\lno@boxfnmark}}
\DeclareOption{stdfn}{\def \@makefnmark {\lno@stdfnmark}}
\let \lno@stdfnmark = \@makefnmark

\DeclareOption{notitlepage}{\ClassWarningNoLine{lecnotes}{Option
    `notitlepage' not supported.}}
\DeclareOption{oneside}{\ClassWarningNoLine{lecnotes}{Option
    `oneside' not supported.}}
\DeclareOption{titlepage}{\ClassWarningNoLine{lecnotes}{Option
    `titlepage' not supported.}}
\DeclareOption{twocolumn}{\ClassWarningNoLine{lecnotes}{Option
    `twocolumn' not supported.}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{cm,10pt,stdfn,american}
\ProcessOptions \relax
\LoadClass[twoside]{report}
\RequirePackage{textcomp}

\RequirePackage{type1cm}
\RequirePackage{float}
\RequirePackage[format=hang]{caption}
\RequirePackage{moreverb}
\newcommand{\lno@font}[2][]{\normalfont
  \fontfamily{\lno@alt@font}%
  \fontsize{\csname lno@#2@sz\endcsname}%
           {\csname lno@#2@ln\endcsname pt}#1\selectfont }
\newcommand{\lno@cleardoublepage}{\lno@clearpage
  \ifodd\c@page \else \null\thispagestyle{plain}\newpage \fi }
\let \lno@clearpage = \clearpage
\newcommand{\frontmatter}{\backmatter
  \pagenumbering{roman}}
\newcommand{\mainmatter}{\lno@cleardoublepage
  \let \clearpage = \lno@cleardoublepage
  \pagenumbering{arabic}%
  \setlength{\parskip}{\lno@parskip}\setlength{\parindent}{0pt}}
\mainmatter
\newcommand{\backmatter}{\clearpage
  \let \clearpage = \lno@clearpage
  \setlength{\parskip}{0pt}\setlength{\parindent}{2em}}
\renewcommand{\@makechapterhead}[1]{%
  \global\@topnum=\z@  \@afterindentfalse
  \vspace*{-40pt}
  \vbox to 90pt{\raggedleft
    \parbox{0.4\textwidth}{\raggedright
      \lno@font[\fontseries{\lno@l@font}\slshape]{chapquo@text}%
      \lno@chapquo@text\par
      \raggedleft
      \lno@font[\fontseries{\lno@l@font}]{chapquo@auth}%
        \lno@chapquo@auth}
    \vss }
  \nochapterquote
  {\setlength{\parindent}{0pt}\raggedright
    \lno@font[\bfseries]{chap@id}\@chapapp\space
    \lno@font[\fontseries{\lno@eb@font}]{chap@num}\thechapter\par
    \vspace{5pt}
    \lno@font[\bfseries]{chap@txt}#1\par
    \vspace{20pt}
  }}
\renewcommand{\@makeschapterhead}[1]{%
  \markboth{\MakeUppercase{#1}}{\MakeUppercase{#1}}%
  \refstepcounter{lno@xchapter}%
  \addcontentsline{toc}{lno@xchapter}{#1}%
  \global\@topnum=\z@  \@afterindentfalse
  \vspace*{10pt}
  {\setlength{\parindent}{0pt}\raggedright
    \lno@font[\bfseries]{chap@txt}#1 \par
    \vspace{20pt}
  }}
\newcounter{lno@xchapter}
\def \toclevel@lno@xchapter {0}
\newcommand{\chapterquote}[3][--- ]{%
  \def \lno@chapquo@text {#2}\def \lno@chapquo@auth {#1#3}}
\newcommand{\nochapterquote}{%
  \def \lno@chapquo@text {}\def \lno@chapquo@auth {}}
\nochapterquote
\renewcommand{\section}{\@lno@display@true
  \@startsection{section}{1}{0pt}%
    {2.5ex plus 1ex minus 0.2ex}{-0.5\baselineskip}%
    {\lno@font[\bfseries]{sec@txt}}}
\renewcommand{\subsection}{\@lno@display@true
  \@startsection{subsection}{2}{0pt}%
    {2ex plus 0.8ex minus 0.2ex}{-0.70\baselineskip}%
    {\lno@font[\bfseries]{ssec@txt}}}
\renewcommand{\subsubsection}{\@lno@display@true
  \@startsection{subsubsection}{3}{0pt}%
    {1.50ex plus 0.6ex minus 0.2ex}{-0.85\baselineskip}%
    {\lno@font[\bfseries]{sssec@txt}}}
\renewcommand{\paragraph}{\@lno@display@false
  \@startsection{paragraph}{4}{0pt}%
    {1.0ex plus 0.4ex minus 0.2ex}{-1em}%
    {\lno@font[\bfseries]{para@txt}}}
\renewcommand{\subparagraph}{\@lno@display@false
  \@startsection{subparagraph}{5}{0pt}%
    {0ex plus 0.2ex}{-1em}%
    {\lno@font[\bfseries]{spara@txt}}}
\newif \if@lno@display@
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \if@lno@display@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}
\def\@xsect#1{%
  \@tempskipa #1\relax
  \if@lno@display@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}
\renewcommand{\@seccntformat}[1]{%
  \llap{\csname lno@s@#1\endcsname \hspace{6pt}}}
\newcommand{\lno@s@section}{%
  \lno@font[\fontseries{\lno@eb@font}]{sec@num}\thesection}
\newcommand{\lno@s@subsection}{%
  \lno@font[\fontseries{\lno@eb@font}]{ssec@num}\thesubsection}
\newcommand{\lno@s@subsubsection}{%
  \lno@font[\fontseries{\lno@eb@font}]{sssec@num}\thesubsubsection}
\newcommand{\lno@s@paragraph}{%
  \lno@font[\fontseries{\lno@eb@font}]{para@num}\theparagraph}
\newcommand{\lno@s@subparagraph}{%
  \lno@font[\fontseries{\lno@eb@font}]{spara@num}\thesubparagraph}
\setcounter{secnumdepth}{3}
\let \lno@maketitle = \maketitle
\renewcommand{\maketitle}{\begingroup
    \def \LARGE {\lno@font[\bfseries]{title@title}}%
    \def \large {\lno@font[\bfseries]{title@author}}%
    \lno@maketitle
    \null \thispagestyle{empty}\newpage
  \endgroup }
\let \lno@abstract    = \abstract
\let \lno@endabstract = \endabstract
\def \abstract {\begingroup
  \let \lno@abstractname = \abstractname
  \def \abstractname {{\lno@font[\bfseries]{abstr@id}%
      \lno@abstractname}}%
  \setlength{\parskip}{\lno@parskip}\setlength{\parindent}{0pt}%
  \lno@abstract }
\def \endabstract {\lno@endabstract \endgroup}
\addtolength{\topmargin}{-0.5cm}
\addtolength{\textheight}{2cm}
\pretolerance = 2000  \tolerance = 6000  \hbadness = \tolerance
\widowpenalty = 1500  \displaywidowpenalty = 750
\clubpenalty = 1500
\setlength{\abovedisplayskip}{\lno@parskip}
\setlength{\abovedisplayshortskip}{\lno@noskip}
\setlength{\belowdisplayskip}{0pt}
\setlength{\belowdisplayshortskip}{0pt}
\renewcommand\normalsize{\@setfontsize\normalsize\@xpt\@xiipt}
\renewcommand\small{\@setfontsize\small\@ixpt{11}}
\renewcommand\footnotesize{\@setfontsize\footnotesize\@viiipt{9.5}}
\everydisplay = {\aftergroup\par}
\renewcommand{\@makefntext}[1]{\leavevmode
  \setlength{\parskip}{0.6\baselineskip}%
  \llap{\@makefnmark \hspace*{3pt}}#1}
\setlength{\footnotesep}{1.4\baselineskip}
\renewcommand{\footnoterule}{%
  \hrule width 0.618\columnwidth height 0.8pt \relax
  \vspace*{-0.8pt}}
\newcommand{\lno@boxfnmark}{\mbox{\hspace*{0.1em}%
    \setlength{\fboxsep}{1.0pt}\setlength{\fboxrule}{0.6pt}%
    \raisebox{0.7pt}{%
      \fbox{\lno@font[\bfseries]{footnote@num}\@thefnmark}}%
    \hspace*{0.1em}}}
\newcommand{\ps@lecnotes}{%
  \def \@oddfoot {\hfil
    \rlap{\hspace*{15pt}%
      \lno@font[\fontseries{\lno@l@font}]{page@bot}\pagename\space
      \thepage}}%
  \def \@evenfoot {%
    \llap{\lno@font[\fontseries{\lno@l@font}]{page@bot}\pagename\space
      \thepage \hspace*{15pt}}\hfil}%
  \def \@oddhead {\hfil
    \underline{\makebox[\textwidth][r]{%
      \lno@font[\fontseries{\lno@l@font}]{page@top}\rightmark\strut}}}%
  \def \@evenhead {%
    \underline{\makebox[\textwidth][l]{%
      \lno@font[\fontseries{\lno@l@font}]{page@top}\leftmark\strut}}}%
  \def \chaptermark ##1{%
    \markboth{\MakeUppercase{\@chapapp} \thechapter\hspace{2em}%
      \MakeUppercase{##1}}%
             {}}%
  \def \sectionmark ##1{%
    \markright{\thesection\hspace{1em}\MakeUppercase{##1}}}%
}
\pagestyle{lecnotes}
\renewcommand{\ps@plain}{\ps@lecnotes
  \def \@oddhead {}\def \@evenhead {}}
\setcounter{topnumber}{3}    \setcounter{bottomnumber}{0}
\setcounter{totalnumber}{3}
\renewcommand{\topfraction}{0.80}
\renewcommand{\textfraction}{0.20}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\captionfont}{\lno@font{caption@text}}
\renewcommand{\captionlabelfont}{\lno@font[\bfseries]{caption@lab}}
\setcaptionmargin{0.1\textwidth}
\floatstyle{plain}
\newfloat{example}{tp}{loe}[chapter]
\floatname{example}{\lno@xample@name}
\restylefloat{figure}  \restylefloat{table}
\newcommand{\examplefile}[2]{\begin{example}
  \hrule height 1pt
  \vspace{2pt}
  \hrule height 0.4pt
  \vspace{6pt}
  {\renewcommand{\baselinestretch}{0.85}\listinginput{1}{#1}}
  \vspace{5pt}
  \hrule height 0.4pt
  \vspace{2pt}
  \hrule height 1pt \relax
  \renewcommand{\rmdefault}{\lno@alt@font}\rmfamily
  \caption{#2}
\end{example}}
\renewcommand{\listinglabel}[1]{\llap{\lno@font{xample@line}%
    \the#1\hspace*{1em}}}
\newcommand{\listofexamples}{\begingroup
    \setlength{\parskip}{1pt plus 1pt}%
    \renewcommand{\rmdefault}{\lno@alt@font}\rmfamily
    \listof{example}{\lno@xamplelist@name}%
  \endgroup }
\addtolength{\evensidemargin}{-1cm}
\addtolength{\oddsidemargin}{1cm}
\setlength{\itemsep}{0pt plus 1pt}
\setlength{\parsep}{0.618\parskip plus 1pt}
\setlength{\partopsep}{0pt}
\setlength{\topsep}{0pt}
\renewcommand{\@listi}{\leftmargin = \leftmargini}
\renewcommand{\@listii}{\leftmargin = \leftmarginii
  \labelwidth = \leftmarginii  \advance \labelwidth by -\labelsep}
\renewcommand{\@listiii}{\leftmargin = \leftmarginiii
  \labelwidth = \leftmarginiii  \advance \labelwidth by -\labelsep}
\renewcommand{\@listiv}{\leftmargin= \leftmarginiv
  \labelwidth = \leftmarginiv  \advance \labelwidth by -\labelsep}
\renewcommand{\@listv}{\leftmargin = \leftmarginv
  \labelwidth = \leftmarginv  \advance \labelwidth by -\labelsep}
\renewcommand{\@listvi}{\leftmargin = \leftmarginvi
  \labelwidth = \leftmarginvi  \advance \labelwidth by -\labelsep}
\let \@listI = \@listi
\@listi
\def \labelenumi {\theenumi)}
\renewcommand{\labelitemi}{\lno@square}
\renewcommand{\labelitemii}{\lno@opensq}
\renewcommand{\labelitemiii}{\ensuremath{\ast}}
\renewcommand{\labelitemiv}{\ensuremath{\bullet}}
\newcommand{\lno@square}{%
  \vrule height 1.1ex width 1ex depth -.1ex \relax }
\newcommand{\lno@opensq}{\begingroup
    \setlength{\fboxsep}{0pt}\setlength{\fboxrule}{1pt}%
    \raisebox{0.1ex}{\fbox{\rule{0pt}{0.8ex}\rule{0.8ex}{0pt}}}
  \endgroup }
\let \lno@toc = \tableofcontents
\def \tableofcontents {\begingroup
    \setlength{\parskip}{1pt plus 1pt}%
    \renewcommand{\rmdefault}{\lno@alt@font}\rmfamily
    \lno@toc
  \endgroup }
\renewcommand{\@pnumwidth}{2em}\renewcommand{\@tocrmarg}{4em}
\newcommand*\l@lno@xchapter[2]{%
    \addpenalty{-\@highpenalty}%
    \vskip 0.2em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup}
\let \lno@lof = \listoffigures
\def \listoffigures {\begingroup
    \setlength{\parskip}{1pt plus 1pt}%
    \renewcommand{\rmdefault}{\lno@alt@font}\rmfamily
    \lno@lof\clearpage
  \endgroup }
\let \lno@lot = \listoftables
\def \listoftables {\begingroup
    \setlength{\parskip}{1pt plus 1pt}%
    \renewcommand{\rmdefault}{\lno@alt@font}\rmfamily
    \lno@lot\clearpage
  \endgroup }
\newcommand{\indexfile}[1]{\cleardoublepage
  \begingroup
    \renewcommand{\rmdefault}{\lno@alt@font}\rmfamily
    \input{#1}\clearpage
  \endgroup }
\setlength{\fboxsep}{3pt}  \setlength{\fboxrule}{0.6pt}
\setlength{\arrayrulewidth}{0.8pt}
\renewcommand{\arraystretch}{1.2}
\endinput
%%
%% End of file `lecnotes.cls'.
