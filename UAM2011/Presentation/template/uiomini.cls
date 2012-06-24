%% Identification part:

\NeedsTeXFormat{LaTeX2e}[1994/12/01]

\ProvidesClass{uiomini}[1997/03/25 v1.1 Ifi/UiO document class]

%% Initial code part:

\renewcommand{\rmdefault}{poc}	% Use `Concorde' as default font
			      	% (except first page). 

%% Options declaration part:

\DeclareOption{10pt}{\OptionNotUsed}
\DeclareOption{11pt}{\OptionNotUsed}
\DeclareOption{12pt}{\OptionNotUsed}

\DeclareOption{american}{\PassOptionsToPackage{USamerican}{babel}}
\DeclareOption{english}{\PassOptionsToPackage{UKenglish}{babel}}
\DeclareOption{norsk}{\PassOptionsToPackage{norsk}{babel}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}

%% Options execution part:

\ProcessOptions

%% Package loading part:

\RequirePackage{babel,graphicx,ifthen,pifont,type1cm,type1ec}

\LoadClass[a4paper,12pt]{letter}

%% Main code part:

% Two `letter' commands that don't apply anymore:

\renewcommand{\cc}[1]{\ClassError{uiomini}{Command \protect\cc\space
  not available}{You cannot use this command in a `uiomini' document.}}
\renewcommand{\encl}[1]{\ClassError{uiomini}{Command \protect\encl\space
  not available}{You cannot use this command in a `uiomini' document.}}

% Various fields to fill out:

\newcommand{\agreed}[1]{\def \uiomini@agreed{#1}}
\newcommand{\approval}[1]{\def \uiomini@approval{#1}}
\newcommand{\callme}[1]{\def \uiomini@callme{#1}}
\newcommand{\email}[1]{\def \uiomini@email{#1}}
\newcommand{\information}[1]{\def \uiomini@information{#1}}
\newcommand{\jobtitle}[1]{\def \uiomini@jobtitle{#1}}
\newcommand{\npages}[1]{\def \uiomini@npages{#1}}
\newcommand{\xdata}[1]{\def \uiomini@xdata{#1}}
\newcommand{\xinfo}[2]{\def \uiomini@xinfo{#1}\def \uiomini@xinfox{#2}}

\agreed{} \approval{} \callme{} \email{} \information{} 
\jobtitle{} \npages{1} \xdata{} \xinfo{}{}

% Two useful symbols:
\newcommand{\checkit}{{\fontsize{25}{0pt}\ding{51}}}
\newcommand{\crossit}{{\fontsize{25}{0pt}\ding{56}}}

% Redefine \opening and \closing to give special front page:

\renewcommand{\opening}[1]{%
  #1
  \par\nobreak
}

\renewcommand{\closing}[1]{%
}

% Define the new front page style:

\newcommand{\uiomini@bf}{\uiomini@font\bfseries}
\newcommand{\uiomini@font}{\fontfamily{pbk}\fontsize{11}{16pt}}
\newcommand{\uiomini@md}{\uiomini@font\mdseries}

\newcommand{\ps@first}{%
  \def \@evenhead{\uiomini@head}\let \@oddhead = \@evenhead
  \def \@evenfoot{\uiomini@foot}\let \@oddfoot = \@evenfoot
}

\newcommand{\uiomini@head}{%
  \hspace*{-3.8cm}%
  \raisebox{-26cm}[0pt][0pt]{%
    \newcommand{\Data}[2]{\put(13.4,##1){\makebox(6.3,1.2)[r]{\uiomini@bf
          ##2}}}
    \newcommand{\Tekst}[2]{\put(13.4,##1){\makebox(6.3,0.6)[l]{\uiomini@md
          ##2}}}
    \setlength{\unitlength}{1cm}%
    \begin{picture}(1,1)
      \put(1,28){\makebox(18.7,2)[br]{\uiomini@font
          \fontsize{14}{0pt}\bfseries
          \iflanguage{norsk}{UNIVERSITETET I OSLO}{UNIVERSITY OF OSLO}}}
      \put(1,27.3){\makebox(18.7,2)[br]{\uiomini@font
          \fontsize{14}{0pt}\mdseries
          \iflanguage{norsk}{DET MATEMATISK-}{FACULTY OF}}}
      \put(1,26.8){\makebox(18.7,2)[br]{\uiomini@font
          \fontsize{14}{0pt}\mdseries
          \iflanguage{norsk}{NATURVITENSKAPELIGE}{MATHEMATICS AND}}}
      \put(1,26.3){\makebox(18.7,2)[br]{\uiomini@font
          \fontsize{14}{0pt}\mdseries
          \iflanguage{norsk}{FAKULTET}{NATURAL SCIENCES}}}

      \put(1,25.1){\makebox(18.7,2)[br]{\uiomini@bf
          \fontsize{12}{16pt}\selectfont
          \iflanguage{norsk}{Institutt for informatikk}{Department
            of Informatics}}}

      \put(1,25.1){{\uiomini@md \begin{tabular}[t]{@{}l}
          \uiomini@font\fontsize{12}{16pt}\bfseries \toname\\
          \toaddress\end{tabular}}}

      \put(1,23.7){\makebox(18.7,2)[br]{\uiomini@md
          \iflanguage{norsk}{Informatikkbygningen}{Informatics Building}}}
      \put(1,23.2){\makebox(18.7,2)[br]{\uiomini@md
          Gaustadalleen 23}}
      \put(1,22.7){\makebox(18.7,2)[br]{\uiomini@md
          \iflanguage{norsk}{Postboks}{PO Box} 1080~~Blindern}}
      \put(1,22.2){\makebox(18.7,2)[br]{\uiomini@md
          N-0316~~Oslo, Norway}}

      \put(1,21.1){\makebox(18.7,2)[br]{\uiomini@md
          Telefon / Phone: +47-22 85 24 10}}
      \put(1,20.6){\makebox(18.7,2)[br]{\uiomini@md
          Telefaks / Telefax: +47-22 85 24 01}}

      \put(1,19){\makebox(2,1)[bl]{\uiomini@bf\itshape 
          Telefaks / Minibrev /}}
      \put(1,18.4){\makebox(2,1)[bl]{\uiomini@bf\itshape 
          Telefax / Miniletter}}

      \put(1,17.65){\line(1,0){18.7}}
      \put(1,17.2){\makebox(2,1)[bl]{\uiomini@md Beskjed / Message:}}
      \put(1,9.2){\line(1,0){18.7}}
      \put(1,8.75){\makebox(2,1)[bl]{\uiomini@md
          Med vennlig hilsen / With compliments:}}
        
      \multiput(13.4,10.4)(0,1.2){6}{\line(1,0){6.3}}
      \Tekst{17.0}{\uiomini@bf Antall sider inkl.~denne /}
      \Tekst{16.4}{\uiomini@bf No.~of pages including this}
      \Tekst{15.8}{Iflg.~avtale /}
      \Tekst{15.2}{As agreed}
      \Tekst{14.6}{Vennligst ring /}
      \Tekst{14.0}{Please call}
      \Tekst{13.4}{Til orientering /}
      \Tekst{12.8}{For your information}
      \Tekst{12.2}{Til godkjennelse /}
      \Tekst{11.6}{For approval}
      \Tekst{11.0}{\uiomini@xinfo}
      \Tekst{10.4}{\uiomini@xinfox}
      \Tekst{9.8}{\uiomini@bf Dato /}
      \Tekst{9.2}{\uiomini@bf Date}

      \Data{16.4}{\uiomini@npages}
      \Data{15.2}{\uiomini@agreed}
      \Data{14.0}{\uiomini@callme}
      \Data{12.8}{\uiomini@information}
      \Data{11.6}{\uiomini@approval}
      \Data{10.4}{\uiomini@xdata}
      \Data{9.2}{\@date}
      \put(13.3,1.0){\includegraphics[width=65mm]{uiologo-45mm}}
    \end{picture}%
    }
  \hss
}

\newcommand{\uiomini@foot}{%
  \hspace*{-2.5cm}%
  \raisebox{-3cm}[0pt][0pt]{%
    \vbox to 8cm{\vss
      \uiomini@md
      \hsize = 0.8\textwidth
      \ifx\uiomini@empty\fromsig \fromname \else \fromsig \fi
      \strut\par
      \ifx\uiomini@empty\uiomini@jobtitle \else
        \uiomini@jobtitle\strut\par \fi
      \ifx\uiomini@empty\fromaddress \else \fromaddress\strut\par \fi
      \ifx\uiomini@empty\uiomini@email \else
        E-post / E-mail: \uiomini@email\strut\par\fi
      \ifx\uiomini@empty\telephonenum \else
        Telefon / Phone: \telephonenum\strut\par\fi
      \vss}}%
  \hss
}

\def \uiomini@empty {}		% For testing undefined or empty.

% Use the ordinary letter headers and footers after the front page:
\renewcommand{\ps@plain}{%
  \renewcommand{\@evenhead}{\hfill
    \raisebox{2.2cm}[1.4ex]{%
      \begin{tabular}[b]{@{}r@{}}
	\fontfamily{pbk}\fontsize{9}{11pt}\bfseries
        \iflanguage{norsk}{UNIVERSITETET I 
	  OSLO}{UNIVERSITY OF OSLO}\\[-1pt]
	\fontfamily{pbk}\fontsize{9}{11pt}\mdseries
        \iflanguage{norsk}{Institutt for
	  informatikk}{Department of Informatics}\\
      \end{tabular}}}%
  \let \@oddhead = \@evenhead
%
  \renewcommand{\@evenfoot}{\hfill
    \raisebox{-0.9cm}[1ex][0ex]{%
      \fontfamily{pbk}\fontsize{9}{11pt}\bfseries
      \iflanguage{norsk}{Side}{Page} \thepage}}%
  \let \@oddfoot = \@evenfoot
}

% Redefine the `letter' environment':

\renewenvironment{letter}[1]{\newpage
  \@processto{\leavevmode\ignorespaces #1}
  \thispagestyle{first}
  \uiomini@md 
  \interlinepenalty=200 % smaller than the TeXbook value
  \vspace*{7.6cm}
  \hspace*{-2.5cm}\begin{minipage}{10cm}
  \setlength{\parskip}{0.6\baselineskip}
}{%
  \end{minipage}\newpage
}

% Stolen from the `letter' document class:

\long\def\@processto#1{\@xproc #1\\@@@\ifx\toaddress\@empty
    \else \@yproc #1@@@\fi}
\long\def\@xproc #1\\#2@@@{\gdef\toname{#1}\gdef\toaddress{#2}}
\long\def\@yproc #1\\#2@@@{\gdef\toaddress{#2}}

% Default definitions:

\pagestyle{plain}
