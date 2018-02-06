%% Identification part:

\NeedsTeXFormat{LaTeX2e}[1994/12/01]

\ProvidesClass{psfoils}[1998/3/26 v2.3 Ifi class for foils with PS frames]

%% Initial code part:

\RequirePackage{ifthen}

\newboolean{psfoils@color}

%% Options delcaration part:

\DeclareOption{bwfoils}{\setboolean{psfoils@color}{false}}
\DeclareOption{colorfoils}{\setboolean{psfoils@color}{true}}
\DeclareOption{landscape}{OptionNotUsed}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%% Options execution part:

\ExecuteOptions{bwfoils}
\ProcessOptions

%% Package loading part:

\RequirePackage{exscale,type1cm}
\LoadClass{article}

%% Main code part:

%%% Note: Start of PostScript driver specific code:

\def \foil@get@frame {%
  \special{ps: /sp {65536 div 72.27 div 72 mul} bind def}
  \special{ps: /foil_date (\foil@date)\space def}
  \special{ps: /foil_id (\foil@prefix\thefoil\foil@suffix)\space def}
  \special{ps: /foil_site (\foil@site)\space def}
  \special{ps: /foil_title (\foil@title)\space def}
  \foil@conv=\paperwidth
  \special{ps: /foil_width \the\foil@conv\space sp def}
  \foil@conv=\paperheight
  \special{ps: /foil_height \the\foil@conv\space sp def}
  \foil@conv=\foil@rim
  \special{ps: /foil_rim \the\foil@conv\space sp def}
  \foil@conv=\foil@rim@sep
  \special{ps: /foil_rim_sep \the\foil@conv\space sp def}
  \special{ps: /foil_landscape \if T\foil@landscape true \else
    false \fi def}
  \ifthenelse{\boolean{psfoils@color}}%
    {\special{ps: /foil_color true def}}%
    {\special{ps: /foil_color false def}}
  \special{psfile=\foil@frame.ps}
}

\def \foil@start@rot {%
  \special{ps: gsave currentpoint}%
  \special{ps: currentpoint translate -90 rotate}%
  \special{ps: exch neg exch neg translate}%
}

\def \foil@end@rot {%
  \special{ps: grestore}%
}

%%% End of PostScript driver specific code

\newcounter{foil}
\newcount \foil@conv
\newdimen \foil@rim
\newdimen \foil@rim@sep
\newdimen \foil@text@h
\newdimen \foil@text@w
\newbox   \foil@box


\def \foil{\clearpage
  \refstepcounter{foil}%
  %%
  %% Compute the text area:
  \if T\foil@landscape
    \foil@text@h = \paperwidth
    \foil@text@w = \paperheight
  \else
    \foil@text@h = \paperheight
    \foil@text@w = \paperwidth
  \fi
  \advance \foil@text@h by -2\foil@rim
  \advance \foil@text@h by -2\foil@rim@sep
  \advance \foil@text@w by -2\foil@rim
  \advance \foil@text@w by -2\foil@rim@sep
  \setbox\foil@box=\hbox\bgroup\begin{minipage}{\foil@text@w}
  %%
  %% Change main font?
  \if T\foil@font@def
    \def \rmdefault{\foil@font}
  \fi
  \rmfamily
  %%
  %% Size commands:
  \def \HUGE        {\def \foil@fsize{A}\fontsize{60}{67pt}\selectfont}
  \def \Huge        {\def \foil@fsize{B}\fontsize{50}{56pt}\selectfont}
  \def \huge        {\def \foil@fsize{C}\fontsize{42}{47pt}\selectfont}
  \def \LARGE       {\def \foil@fsize{D}\fontsize{36}{40pt}\selectfont}
  \def \Large       {\def \foil@fsize{E}\fontsize{30}{34pt}\selectfont}
  \def \large       {\def \foil@fsize{F}\fontsize{25}{29pt}\selectfont}
  \def \normalsize  {\def \foil@fsize{G}\fontsize{20.7}{24pt}\selectfont}
  \def \small       {\def \foil@fsize{H}\fontsize{17}{20pt}\selectfont}
  \def \footnotesize{\def \foil@fsize{I}\fontsize{14.4}{17pt}\selectfont}
  \def \scriptsize  {\def \foil@fsize{J}\fontsize{12}{14pt}\selectfont}
  \def \tiny        {\def \foil@fsize{K}\fontsize{10}{12pt}\selectfont}
  %%
  \def \smaller{\if A\foil@fsize \protect\Huge         \else
                \if B\foil@fsize \protect\huge         \else
                \if C\foil@fsize \protect\LARGE        \else
                \if D\foil@fsize \protect\Large        \else
                \if E\foil@fsize \protect\large        \else
                \if F\foil@fsize \protect\normalsize   \else
                \if G\foil@fsize \protect\small        \else
                \if H\foil@fsize \protect\footnotesize \else
                \if I\foil@fsize \protect\scriptsize   \else
                                 \protect\tiny
                \fi\fi\fi\fi\fi\fi\fi\fi\fi}
  \def \larger {\if C\foil@fsize \protect\Huge         \else
                \if D\foil@fsize \protect\huge         \else
                \if E\foil@fsize \protect\LARGE        \else
                \if F\foil@fsize \protect\Large        \else
                \if G\foil@fsize \protect\large        \else
                \if H\foil@fsize \protect\normalsize   \else
                \if I\foil@fsize \protect\small        \else
                \if J\foil@fsize \protect\footnotesize \else
                \if K\foil@fsize \protect\scriptsize   \else
                                 \protect\HUGE
                \fi\fi\fi\fi\fi\fi\fi\fi\fi}
  \normalsize \foil@scale
  \def \arraystretch{1.2}
  %%
  %% Skip commands:
  \smallskipamount = 0.5\baselineskip
  \medskipamount   = \baselineskip
  \bigskipamount   = 2\baselineskip
  %%
  %% Define foil item marks:
  \def \labelitemi{\foil@item}
  \def \labelitemii{\foil@itemx}
  \def \labelitemiii{\foil@itemxx}
  %%
  %% Paragraph set-up:
  \parindent = 0pt   \parskip = \baselineskip
  \tolerance = 9990  \raggedright
  %%
  %% Use thicker lines:
  \arrayrulewidth = 1pt
  \fboxrule = 1pt
  %%
  %% Footnotes:
  \skip\@mpfootins = \baselineskip
  \setcounter{mpfootnote}{0}
  \def \footnoterule{}
  \def \thempfootnote{\fnsymbol{mpfootnote}}
  \def \@makefntext##1{\noindent
    \llap{\small \@makefnmark\kern 0.2em \relax}\footnotesize
    \raggedright ##1}
  %% I prefer these footnote symbols:
  \def \@fnsymbol ##1{\ensuremath{\ifcase ##1\or \dagger\or \ddagger\or
    \mathchar "27B\or \mathchar "278\or *\else\@ctrerr\fi\relax}}
  %%
  %% Redefinitions:
  \def \section {\secdef\foil@section\foil@ssection}%
  \def \foil@section [##1]##2{\foil@ssection{##2}}%
  \def \foil@ssection ##1{\@startsection{section}{2}{0pt}{1.5\baselineskip}%
    {0.001pt}{\larger\larger\bf \foil@sec@font}*{##1}%
    \vspace{-0.6\parskip}}
  \def \subsection {\secdef\foil@subsection\foil@ssubsection}%
  \def \foil@subsection [##1]##2{\foil@ssubsection{##2}}%
  \def \foil@ssubsection ##1{\@startsection
    {subsection}{3}{0pt}{0.75\baselineskip}%
    {0.001pt}{\larger\bf \foil@sub@font}*{##1}%
    \vspace{-0.8\parskip}}
  \def \subsubsection {\secdef\foil@subsubsection\foil@ssubsubsection}%
  \def \foil@subsubsection [##1]##2{\foil@ssubsubsection{##2}}%
  \def \foil@ssubsubsection ##1{\@startsection{subsubsection}{4}{0pt}%
    {0.25\baselineskip}{0.001pt}{\bf \foil@subsub@font}*{##1}%
    \vspace{-\parskip}}
  %%
  %% Make \_ bolder:
  \def \_{\leavevmode \kern 0.06em 
    \vbox{\hrule width 0.3em depth 1.0pt}%
    \kern 0.06em }
  %%
  %% Modify vertical spacing in lists:
  \def \@listI{\leftmargin=\leftmargini
    \parsep=0.5\baselineskip\relax
    \topsep=-0.5\baselineskip\relax
    \itemsep=0.15\baselineskip}
  \partopsep=0pt
  \let \@listi=\@listI   \@listi 
  \def \@listii{\leftmargin=\leftmarginii
    \labelwidth=\leftmarginii \advance\labelwidth by -\labelsep
    \topsep=-0.2\baselineskip
    \parsep=0.2\baselineskip
    \partopsep=0pt
    \itemsep=0.1\baselineskip}
  \def \tighter {\addtolength{\itemsep}{-0.3\baselineskip}}
  %%
  %% Prevent ilegal use:
  \def \foillandscape{\PackageWarning{psfoils command \string\foillandscape
      \space not allowed in foil environment}}
  \def \foilportrait{\PackageWarning{psfoils command \string\foilportrait
      \space not allowed in foil environment}}
  \def \foilframe{\PackageWarning{psfoils command \string\foilframe
      \space not allowed in foil environment}}
  %%
  %% Now, start the foil itself:
}

\def \endfoil{\par
  \xdef \last@foil@page{\thepage}%
  \end{minipage}\egroup
  %%
  %% Check the height:
  \dimen0 = \ht\foil@box  \advance \dimen0 \dp\foil@box
  \ifdim \dimen0 > \foil@text@h
    \advance \dimen0 by -\foil@text@h
    \message{^^JWarning: Foil no \thefoil\space is \the\dimen0
      \space too tall!^^J}%
    \if T\foil@landscape 
    \else
      \setbox\foil@box=\vbox to \foil@text@h{%
        \box\foil@box
        \vss}\fi
  \fi 
  %%
  %% Keep modifications local:
  \begingroup
  \evensidemargin = -1in    \oddsidemargin = \evensidemargin
  \topmargin = -1in         \headsep = 0pt
  \topskip = 0pt
  \headheight = 0pt         \parskip = 0pt
  \textwidth = \foil@text@w \textheight = \foil@text@h
  \def \@evenhead {}        \def \@oddhead {}
  \def \@evenfoot {}        \def \@oddfoot {}
  %%
  %% Fetch the PostScript frame:
  \foil@get@frame
  %% 
  %% Output the foil:
  \null
  \if T\foil@landscape
    \vskip 0.5\paperheight
    \vskip -\baselineskip
    \vbox to 0pt{\vss
      \hbox to \paperwidth{\hss
        \foil@start@rot
	\makebox[0pt]{\box\foil@box}%
	\foil@end@rot
	\hss}
      \vss}
  \else
    \vskip 0.5\paperheight
    \vskip -\baselineskip
    \vbox to 0pt{\vss
      \hbox to \paperwidth{\hss
        \box\foil@box 
	\hss}
      \vss}
  \fi
  %%
  %% Well, that was that:
  \newpage
  \endgroup
}


\let \foil@enddoc = \enddocument
\def \enddocument{\immediate\write\@auxout{\string
    \newlabel{lastfoil}{{\thefoil}{\last@foil@page}}}%
  \foil@enddoc
}


%% Fix catcodes for text going to PostScript:

\def \psfoils@fixcatcode {\begingroup
  \@tempcnta = 128
  \loop \ifnum \@tempcnta<256
    \catcode\@tempcnta = 11
    \advance \@tempcnta \@ne
  \repeat
  \catcode`\~ = 11
  \catcode`\# = 11
  \catcode`\$ = 11
  \catcode`\% = 11
  \catcode`\^ = 11
  \catcode`\& = 11
  \catcode`\_ = 11
}


%% Various user macroes:

\def \foilrim#1{\foil@rim=#1 \relax }
\def \foilrimsep#1{\foil@rim@sep=#1 \relax }

\foilrim{1.5cm}         % Default foil rim is 1.5 cm.
\foilrimsep{1.5cm}      % Default foil rim separation is 1.5 cm.

\def \foilframe#1{\def \foil@frame{#1}}
\foilframe{box}

\def \p@foilprefix#1{\gdef \foil@prefix{#1}\endgroup}
\def \p@foilsuffix#1{\gdef \foil@suffix{#1}\endgroup}
\def \foilprefix {\psfoils@fixcatcode \p@foilprefix}
\def \foilsuffix {\psfoils@fixcatcode \p@foilsuffix}
\foilprefix{}  \foilsuffix{}

\def \p@foildate#1{\gdef \foil@date{#1}\endgroup}
\def \p@foilsite#1{\gdef \foil@site{#1}\endgroup}
\def \p@foiltitle#1{\gdef \foil@title{#1}\endgroup}
\def \foildate  {\psfoils@fixcatcode \p@foildate}
\def \foilsite  {\psfoils@fixcatcode \p@foilsite}
\def \foiltitle {\psfoils@fixcatcode \p@foiltitle}
\foildate{}  \foilsite{}  \foiltitle{}

\def \foillandscape{\def \foil@landscape{T}}
\def \foilportrait{\def \foil@landscape{F}}
\foilportrait

\def \foilfont#1{\def \foil@font{#1}\def \foil@font@def{T}}
\def \foil@font@def{F}  
\def \foilscale#1{\def \foil@scale{#1}}
\foilscale{}


\def \foilsecfont#1{\def \foil@sec@font{#1}}
\def \foilsubfont#1{\def \foil@sub@font{#1}}
\def \foilsubsubfont#1{\def \foil@subsub@font{#1}}
\foilsecfont{}  \foilsubfont{}  \foilsubsubfont{}


\def \foilitem#1{\def \foil@item{#1}}
\def \foilitemx#1{\def \foil@itemx{#1}}
\def \foilitemxx#1{\def \foil@itemxx{#1}}
\foilitem{$\bullet$}  \foilitemx{{\bf ---}}  \foilitemxx{$\ast$}

%% Make a robust version of \pageref:
 
\def \foilref #1{\@ifundefined{r@#1}{{\reset@font\bf ??}\@warning
   {Reference `#1' on page \thepage \space
    undefined}}{\expandafter\expandafter\expandafter
                \@car\csname r@#1\endcsname
                \@nil}}
