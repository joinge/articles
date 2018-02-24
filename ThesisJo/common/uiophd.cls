\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\ProvidesClass{common/uiophd}[2016/09/26 v 1.04 UiO document class]
\typeout{====Inside uiophd.cls====}
% \RequirePackage{fix-cm}
\DeclareOption{10pt}{\ClassWarningNoLine{uiophd}{Do not use type size '10pt'}}
\DeclareOption{11pt}{\ClassWarningNoLine{uiophd}{Do not use type size '11pt'}}
\DeclareOption{12pt}{}
% \DeclareOption{american}{\renewcommand{\uiophd@lang}{USenglish}}
% \DeclareOption{USenglish}{\renewcommand{\uiophd@lang}{USenglish}}
% \DeclareOption{english}{\renewcommand{\uiophd@lang}{UKenglish}}
% \DeclareOption{OKenglish}{\renewcommand{\uiophd@lang}{UKenglish}}
% % % \DeclareOption{american}{\renewcommand{\uiophd@lang}{USenglish}}
% \newcommand{\uiophd@lang}{USenglish}
\DeclareOption{altfont}{}
\DeclareOption{draft}{}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions \relax

\RequirePackage{ifpdf,ifxetex} % To detect with Tex engine is being used 

% \RequirePackage[\uiophd@lang]{babel}
% \RequirePackage{emptypage}
\ifxetex\else
   \RequirePackage[T1]{fontenc}
\fi

\ifxetex
\RequirePackage[a4paper,twoside,margin=2.5cm,xetex]{geometry}       % [showframe] different margins on title pages
\else
\RequirePackage[a4paper,twoside,margin=2.5cm]{geometry}
\fi
% \RequirePackage{keyval}
% \RequirePackage{pdfpages}
\RequirePackage{setspace}
\AtBeginDocument{%\parskip=12pt plus 2.5pt\relax
   \parskip=6pt plus 2.5pt\relax
	\setstretch{1.1}
	}
\LoadClass[a4paper,twoside,openright,12pt]{report}

\ifxetex
   \RequirePackage{fontspec}
   \setmainfont[Mapping=tex-text]{EB Garamond}
%      \setmainfont[Mapping=tex-text,Numbers={OldStyle},Ligatures{Common},Contextuals=Alternate]{EB Garamond}
\else
	\IfFileExists{t1zgmj.fd}
	{
% 	\usepackage{ebgaramond}
	   \RequirePackage[full]{textcomp}
		\RequirePackage[garamond,expert]{mathdesign}
		\RequirePackage[swashQ]{garamondx}
   }
	{\renewcommand{\rmdefault}{ptm}}
% 	\IfFileExists{berasans.sty}
% 	{\RequirePackage[scaled]{berasans}}
% 	{\renewcommand{\sfdefault}{phv}}
% 	\IfFileExists{beramono.sty}
% 	{\RequirePackage[scaled]{beramono}}
% 	{\renewcommand{\ttdefault}{pcr}}
\fi
\newcommand{\frontmatter}{\cleardoublepage
	\pagenumbering{roman}}
\newcommand{\mainmatter}{\cleardoublepage
	\pagenumbering{arabic}}
\newcommand{\backmatter}{\cleardoublepage}
\let \uiophd@maketitle = \maketitle
\renewcommand{\maketitle}{{%
		\let \uiophd@date = \@date
		\renewcommand{\@date}{%
			\uiophd@date\par
			\vspace{5em}
			Thesis submitted for the degree of Philosophi\ae~Doctor}
		\uiophd@maketitle
	}}
% 	\newcommand{\includearticle}[2][]{{%
% 			\let \ps@default = \ps@plain
% 			\def \uiophd@ps {default}
% 			\def \ps@low {\let\@mkboth\@gobbletwo
% 				\let\@oddhead\@empty
% 				\def\@oddfoot{\reset@font\hfil\raisebox{-1.25cm}{\thepage}\hfil}%
% 				\let\@evenhead\@empty
% 				\let\@evenfoot\@oddfoot}
% 			\let \ps@none = \ps@empty
% 			\setkeys{uiophd@keys}{#1}
% 			\includepdf[pages={-},pagecommand={\thispagestyle{\uiophd@ps}}]{#2}}}
% 	\define@key{uiophd@keys}{numbers}{\def \uiophd@ps {#1}}
% 	\@ifundefined{tc@check@symbol}{%
% 		\RequirePackage{textcomp}}{}


\typeout{====Leaving uiophd.cls====}
