\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\ProvidesClass{common/uiophd}[2014/06/30 v 1.03b UiO document class]
\DeclareOption{10pt}{\ClassWarningNoLine{uiophd}{Do not
        use type size '10pt'}}
\DeclareOption{11pt}{\ClassWarningNoLine{uiophd}{Do not
        use type size '11pt'}}
\DeclareOption{12pt}{}
\DeclareOption{american}{\renewcommand{\uiophd@lang}{USenglish}}
\DeclareOption{USenglish}{\renewcommand{\uiophd@lang}{USenglish}}
\DeclareOption{english}{\renewcommand{\uiophd@lang}{UKenglish}}
\DeclareOption{UKenglish}{\renewcommand{\uiophd@lang}{UKenglish}}
\newcommand{\uiophd@lang}{american}
\DeclareOption{altfont}{}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions \relax
\RequirePackage[\uiophd@lang]{babel}
\RequirePackage{emptypage}
% \RequirePackage[T1]{fontenc}
\RequirePackage[a4paper]{geometry}
\RequirePackage{setspace}
\AtBeginDocument{\setstretch{1.1}}
\RequirePackage{textcomp}
\LoadClass[twoside,openright,12pt]{report}
\geometry{twoside,margin=2.5cm}
\IfFileExists{t1zgmj.fd}
  {\RequirePackage[garamond,expert]{mathdesign}
   \RequirePackage[swashQ]{garamondx}}
  {\renewcommand{\rmdefault}{ptm}}
\IfFileExists{berasans.sty}
  {\RequirePackage[scaled]{berasans}}
  {\renewcommand{\sfdefault}{phv}}
\IfFileExists{beramono.sty}
  {\RequirePackage[scaled]{beramono}}
  {\renewcommand{\ttdefault}{pcr}}
\newcommand{\frontmatter}{\cleardoublepage
  \pagenumbering{roman}}
\newcommand{\mainmatter}{\cleardoublepage
  \pagenumbering{arabic}}
\newcommand{\backmatter}{\cleardoublepage}
