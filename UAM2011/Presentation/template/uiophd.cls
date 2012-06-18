\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\ProvidesClass{uiophd}[2008/06/18 v 1.04 UiO document class]
\DeclareOption{10pt}{\ClassWarningNoLine{uiophd}{Do not
        use type size `10pt'}}
\DeclareOption{11pt}{\ClassWarningNoLine{uiophd}{Do not
        use type size `11pt'}}
\DeclareOption{12pt}{}
\DeclareOption{american}{\renewcommand{\uiophd@lang}{american}}
\DeclareOption{english}{\renewcommand{\uiophd@lang}{english}}
\newcommand{\uiophd@lang}{american}
\DeclareOption{altfont}{}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions \relax
\RequirePackage[\uiophd@lang]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[a4paper]{geometry}
\RequirePackage{setspace}
\AtBeginDocument{\setstretch{1.1}}
\RequirePackage{textcomp}
\LoadClass[openright,12pt]{report}
\geometry{twoside,margin=2.5cm}
\IfFileExists{t1padx.fd}
  {\renewcommand{\rmdefault}{padx}}
  {\renewcommand{\rmdefault}{ptm}}
\IfFileExists{t1iofs.fd}
  {\renewcommand{\sfdefault}{iofs}}
  {\renewcommand{\sfdefault}{phv}}
\IfFileExists{t1hlct.fd}
  {\renewcommand{\ttdefault}{hlct}}
  {\renewcommand{\ttdefault}{pcr}}
\newcommand{\frontmatter}{\cleardoublepage
  \pagenumbering{roman}}
\newcommand{\mainmatter}{\cleardoublepage
  \pagenumbering{arabic}}
\newcommand{\backmatter}{\cleardoublepage}
