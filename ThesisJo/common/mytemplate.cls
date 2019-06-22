% Opening remarks:
%
% - This package is currently being maintained to be compatible with TexLive 2009.
% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common/mytemplate}[2011/01/11 by Jo Inge Buskenes]
% \typeout{-- using mytemplate}
\typeout{====Entering mytemplate.cls====}

% Default version number is most recent. Redefine in document to use features in
% older versions only.
\def\@version{3}

% Changelog:
% Version 1 - Initial version. Pretty much a complete rewrite of all .tex settings and package
%             files. Beamer not ported yet. Will make changes as I go, and use version numbers
%             to keep backwards compability.
% Version 2 - Changed syntax for some math-functions. Now functions like \int takes parameters
%             in the same order as most computer functions - e.g. \int{term}{variable}{from}{to}
% Version 3 - Structure changes. Slowly migrating to Linux-style lowercase syntax to better blend
%             with my code projects. 'Graphics' folder now changed to 'gfx', 'Common' to 'common',
%             and binaries will be put in 'bin'. 'bin' and 'common' is now linked with system
%             latex stuff with "mount --bind", which means the content of these aswell will be
%             tracked by Git now. This is all an attempt to ease the building process of my
%             documentation on foreign computers (aka. the "library" approach).

% These do nothing, but provide them like in article.cls
\newif\if@restonecol
\newif\if@titlepage

%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% PARAMETERS %
%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%
% My document classes are based on the standard ones. These are set to handle the parameters not
% specifically dealt with by me, e.g. the following
%
% Text size       10pt|11pt|12pt
% Paper size      letterpaper|legalpaper|executivepaper|a4paper|a5paper|b5paper
% Orientation     landscape               (default portrait)
% Print side      oneside|twoside
% Ch. start       openright|openany
% Quality         final|draft             (use draft to tag overfull boxes)
% Page type       onecolumn|twocolumn
% Titlepage       notitlepage|titlepage
% Eq. no.         leqno                   (default right)
% Displayed eq.   fleqn                   (default center)
% Bib. style      openbib
%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Conditionals            (& default value)
\newif\ifOPTvone          \OPTvonefalse
\newif\ifOPTvtwo          \OPTvtwofalse
\newif\ifOPTvthree        \OPTvthreefalse
\newif\ifOPTvlatest       \OPTvlatesttrue

\newif\ifOPTstdclass      \OPTstdclassfalse
\newif\ifOPTbeamer        \OPTbeamerfalse
\newif\ifOPTieee          \OPTieeefalse
\newif\ifOPTuam           \OPTuamfalse
\newif\ifOPTuioexam       \OPTuioexamfalse
\newif\ifOPTuiophd        \OPTuiophdfalse

\newif\ifOPTxelatex       \OPTxelatexfalse
\newif\ifOPTlualatex      \OPTlualatexfalse
\newif\ifOPTreport        \OPTreportfalse
\newif\ifOPTdefaultformat \OPTdefaultformatfalse

\newif\ifOPTmovie         \OPTmoviefalse

\newif\ifOPTtwoside       \OPTtwosidefalse

\newif\ifOPTfloatrow      \OPTfloatrowfalse

\newif\ifOPTsecarab       \OPTsecarabtrue
\newif\ifOPTsubsecarab    \OPTsubsecarabtrue
\newif\ifOPTsubsubsecarab \OPTsubsubsecarabtrue

\newif\ifOPTsecroman      \OPTsecromanfalse
\newif\ifOPTsubsecroman   \OPTsubsecromanfalse
\newif\ifOPTsubsubsecroman\OPTsubsubsecromanfalse

\newif\ifOPTsecRoman      \OPTsecRomanfalse
\newif\ifOPTsubsecRoman   \OPTsubsecRomanfalse
\newif\ifOPTsubsubsecRoman\OPTsubsubsecRomanfalse

\newif\ifOPTsecalph       \OPTsecalphfalse
\newif\ifOPTsubsecalph    \OPTsubsecalphfalse
\newif\ifOPTsubsubsecalph \OPTsubsubsecalphfalse

\newif\ifOPTsecAlph       \OPTsecAlphfalse
\newif\ifOPTsubsecAlph    \OPTsubsecAlphfalse
\newif\ifOPTsubsubsecAlph \OPTsubsubsecAlphfalse

\newif\ifOPTlayout        \OPTlayoutfalse

% Compile for Windows or Linux? Affects file linking etc.
\newif\ifOPTlinux         \OPTlinuxtrue
\newif\ifOPTwindows       \OPTwindowsfalse

\newif\ifOPTtodos         \OPTtodostrue
\newif\ifOPTbibliography  \OPTbibliographyfalse
\newif\ifOPTbiblatex      \OPTbiblatexfalse
\newif\ifOPTbibtex        \OPTbibtexfalse
\newif\ifOPTbiber         \OPTbiberfalse
\newif\ifOPTglossary      \OPTglossaryfalse

% Standard parameters
\def\@doctype{handin}
\def\@bdoctype{article}
\def\@language{english}
% \def\@xelatex{false}

% Overwrite with user supplied parameters
\DeclareOption{report}{  \def\@bdoctype{report}  \OPTreporttrue\OPTstdclasstrue}
\DeclareOption{book}{    \def\@bdoctype{book}    \OPTreporttrue\OPTstdclasstrue}
\DeclareOption{handin}{  \def\@bdoctype{article}               \OPTstdclasstrue}
\DeclareOption{article}{ \def\@bdoctype{article}               \OPTstdclasstrue}
\DeclareOption{IEEEtran}{\def\@bdoctype{IEEEtran}   \OPTieeetrue}
\DeclareOption{UAM}{     \def\@bdoctype{common/uam} \OPTuamtrue}
\DeclareOption{beamer}{  \def\@bdoctype{beamer}     \OPTbeamertrue}
\DeclareOption{uiophd}{  \def\@bdoctype{common/uiophd}     \OPTuiophdtrue}
\DeclareOption{uioexam}{ \def\@bdoctype{uioexam}    \OPTuioexamtrue}

% Process the options specified so far
\ProcessOptions

\ifOPTbeamer
  \typeout{argh}
%    \DeclareOption{handout}{\PassOptionsToClass{handout}{\@bdoctype}}
   \DeclareOption{notes}{\PassOptionsToClass{notes=show}{\@bdoctype}}
   \DeclareOption{10pt}{\PassOptionsToClass{10pt}{\@bdoctype}}
   \DeclareOption{11pt}{\PassOptionsToClass{11pt}{\@bdoctype}}
   \DeclareOption{12pt}{\PassOptionsToClass{12pt}{\@bdoctype}}
%   \PassOptionsToClass{xcolor}{table,dvipsnames,svgnames}
   \PassOptionsToClass{xcolor={table,dvipsnames,svgnames}}{\@bdoctype}
  \PassOptionsToClass{hyperref}{%
    final,                %Keep hyperlink stuff even when in draft mode
    breaklinks=true,      %Break links when necessary
    linktocpage=true,     %Enable link to page?
    linkcolor=PineGreen,  %Colour of links to labels within document
    citecolor=Brown,      %Colour of links to the biliography
    filecolor=Red,        %Colour of links to local files
    pagecolor=Red,        %Colour of links to other pages withing document
    urlcolor=Blue,        %Colour of the links to external URLs
    colorlinks=true,      %??
    plainpages=false,     %Store roman/arabic numbering differently to avoid
    bookmarksnumbered }%
\fi
% 
  % Options for IEEEtrans
\ifOPTieee%
   \DeclareOption{9pt}{\PassOptionsToClass{9pt}{\@bdoctype}}
   \DeclareOption{10pt}{\PassOptionsToClass{10pt}{\@bdoctype}}
   \DeclareOption{11pt}{\PassOptionsToClass{11pt}{\@bdoctype}}
   \DeclareOption{12pt}{\PassOptionsToClass{12pt}{\@bdoctype}}

   \DeclareOption{conference}{\PassOptionsToClass{conference}{\@bdoctype}}
   \DeclareOption{journal}{\PassOptionsToClass{journal}{\@bdoctype}}
   \DeclareOption{technote}{\PassOptionsToClass{technote}{\@bdoctype}}
   \DeclareOption{peerreview}{\PassOptionsToClass{peerreview}{\@bdoctype}}
   \DeclareOption{peerreviewca}{\PassOptionsToClass{peerreviewca}{\@bdoctype}}

   \DeclareOption{draft}{\PassOptionsToClass{draft}{\@bdoctype}}
   \DeclareOption{draftcls}{\PassOptionsToClass{draftcls}{\@bdoctype}}
   \DeclareOption{draftclsnofoot}{\PassOptionsToClass{draftclsnofoot}{\@bdoctype}}
   \DeclareOption{final}{\PassOptionsToClass{final}{\@bdoctype}}

   \DeclareOption{letterpaper}{\PassOptionsToClass{letterpaper}{\@bdoctype}}
   \DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{\@bdoctype}}

   \DeclareOption{oneside}{\PassOptionsToClass{oneside}{\@bdoctype}}
   \DeclareOption{twoside}{\PassOptionsToClass{twoside}{\@bdoctype}}
   \DeclareOption{onecolumn}{\PassOptionsToClass{onecolumn}{\@bdoctype}}
   \DeclareOption{twocolumn}{\PassOptionsToClass{twocolumn}{\@bdoctype}}

   \DeclareOption{compsoc}{\PassOptionsToClass{compsoc}{\@bdoctype}}
   \DeclareOption{romanappendices}{\PassOptionsToClass{romanappendices}{\@bdoctype}}
   \DeclareOption{captionsoff}{\PassOptionsToClass{captionsoff}{\@bdoctype}}
   \DeclareOption{nofonttune}{\PassOptionsToClass{nofonttune}{\@bdoctype}}

   \DeclareOption{bibtex}{\OPTbibliographytrue\OPTbibtextrue}
   \DeclareOption{biblatex}{\OPTbibliographytrue\OPTbiblatextrue}
\fi

  % Options for UAM
\ifOPTuam%
   \typeout{-- hmm? --}
   \DeclareOption{final}{\PassOptionsToClass{final}{\@bdoctype}}
   \DeclareOption{draft}{\PassOptionsToClass{draft}{\@bdoctype}}
   \DeclareOption{xelatex}{\PassOptionsToClass{xelatex}{\@bdoctype}\OPTxelatextrue}
   \DeclareOption{bibtex}{\PassOptionsToClass{bibtex}{\@bdoctype}\OPTbibliographytrue}
   \DeclareOption{biblatex}{\PassOptionsToClass{biblatex}{\@bdoctype}\OPTbibliographytrue}
\fi

\ifOPTuioexam
%    \DeclareOption{norsk}{\PassOptionsToClass{norsk}{\@bdoctype}}
%    \DeclareOption{english}{\PassOptionsToClass{english}{\@bdoctype}}
   \DeclareOption{xelatex}{\OPTxelatextrue}
\fi

\ifOPTuioexam
%    \DeclareOption{norsk}{\PassOptionsToClass{norsk}{\@bdoctype}}
%    \DeclareOption{english}{\PassOptionsToClass{english}{\@bdoctype}}
   \DeclareOption{xelatex}{\OPTxelatextrue}
\fi

\ifOPTuiophd
   \DeclareOption{bibtex}{\OPTbibliographytrue}
   \DeclareOption{biblatex}{\OPTbibliographytrue}
   \DeclareOption{biber}{\OPTbibertrue}
   \DeclareOption{xelatex}{\PassOptionsToClass{xelatex}{\@bdoctype}\OPTxelatextrue}
   
   % These are the standard uiophd.cls options:
   \DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{\@bdoctype}} % Not allowed
   \DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{\@bdoctype}} % Not allowed
   \DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{\@bdoctype}} % The only allowed size
   \DeclareOption{american}{\PassOptionsToClass{\CurrentOption}{\@bdoctype}}
   \DeclareOption{USenglish}{\PassOptionsToClass{\CurrentOption}{\@bdoctype}}
   \DeclareOption{english}{\PassOptionsToClass{\CurrentOption}{\@bdoctype}}
   \DeclareOption{UKenglish}{\PassOptionsToClass{\CurrentOption}{\@bdoctype}}
   \DeclareOption{altfont}{\PassOptionsToClass{\CurrentOption}{\@bdoctype}}
   \DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{\@bdoctype}}
   \DeclareOption{todos}{\OPTtodostrue}
   \DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@bdoctype}}
\fi

% Options for the report, book and article class
\ifOPTstdclass
   \DeclareOption{letterpaper}{\PassOptionsToClass{letterpaper}{\@bdoctype}}
   \DeclareOption{legalpaper}{\PassOptionsToClass{legalpaper}{\@bdoctype}}
   \DeclareOption{executivepaper}{\PassOptionsToClass{executivepaper}{\@bdoctype}}
   \DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{\@bdoctype}}
   \DeclareOption{a5paper}{\PassOptionsToClass{a5paper}{\@bdoctype}}
   \DeclareOption{b5paper}{\PassOptionsToClass{b5paper}{\@bdoctype}}
   \DeclareOption{landscape}{\PassOptionsToClass{landscape}{\@bdoctype}}
   \DeclareOption{oneside}{\PassOptionsToClass{oneside}{\@bdoctype}}
   \DeclareOption{twoside}{\OPTtwosidetrue\PassOptionsToClass{twoside}{\@bdoctype}}
   \DeclareOption{openright}{\PassOptionsToClass{openright}{\@bdoctype}}
   \DeclareOption{openany}{\PassOptionsToClass{openany}{\@bdoctype}}
   \DeclareOption{final}{\PassOptionsToClass{final}{\@bdoctype}}
   \DeclareOption{draft}{\PassOptionsToClass{draft}{\@bdoctype}}
   \DeclareOption{onecolumn}{\PassOptionsToClass{onecolumn}{\@bdoctype}}
   \DeclareOption{twocolumn}{\PassOptionsToClass{twocolumn}{\@bdoctype}}
   \DeclareOption{notitlepage}{\PassOptionsToClass{notitlepage}{\@bdoctype}}
   \DeclareOption{titlepage}{\PassOptionsToClass{titlepage}{\@bdoctype}}
   \DeclareOption{leqno}{\PassOptionsToClass{leqno}{\@bdoctype}}
   \DeclareOption{fleqn}{\PassOptionsToClass{fleqn}{\@bdoctype}}
   \DeclareOption{openbib}{\PassOptionsToClass{openbib}{\@bdoctype}}
   \DeclareOption{bibtex}{\OPTbibliographytrue\OPTbibtextrue}
   \DeclareOption{biblatex}{\OPTbibliographytrue\OPTbiblatextrue}
\fi



%
%
%----------
% Available CLASSINPUTs provided (all are macros unless otherwise noted):
% \CLASSINPUTbaselinestretch
% \CLASSINPUTinnersidemargin
% \CLASSINPUToutersidemargin
% \CLASSINPUTtoptextmargin
% \CLASSINPUTbottomtextmargin
%
% Available CLASSINFOs provided:
% \ifCLASSINFOpdf                       (TeX if conditional)
% \CLASSINFOpaperwidth                  (macro)
% \CLASSINFOpaperheight                 (macro)
% \CLASSINFOnormalsizebaselineskip      (length)
% \CLASSINFOnormalsizeunitybaselineskip (length)
%
% Available CLASSOPTIONs provided:
% all class option flags (TeX if conditionals) unless otherwise noted,
% e.g., \ifCLASSOPTIONcaptionsoff
% point size options provided as a single macro:
% \CLASSOPTIONpt
% which will be defined as 9, 10, 11, or 12 depending on the document's
% normalsize point size.
% also, class option peerreviewca implies the use of class option peerreview
% and classoption draft implies the use of class option draftcls




% Version requirements
\DeclareOption{v1}{\OPTvonetrue\OPTvlatestfalse}
\DeclareOption{v2}{\OPTvtwotrue\OPTvlatestfalse}
\DeclareOption{v3}{\OPTvthreetrue\OPTvlatestfalse}

% Remember to enable all versions prior to the one given
\ifOPTvlatest\OPTvthreetrue\fi
\ifOPTvthree\OPTvtwotrue\fi
\ifOPTvtwo\OPTvonetrue\fi

\ifOPTuam\else
  \DeclareOption{xelatex}{\OPTxelatextrue}
  \DeclareOption{lualatex}{\OPTlualatextrue\OPTxelatextrue}
\fi
\DeclareOption{movie}{\OPTmovietrue}

\DeclareOption{defaultformat}{\OPTdefaultformattrue}
% \DeclareOption{twoside}{}

\DeclareOption{floatrow}{\typeout{saywhat???}\OPTfloatrowtrue}

\DeclareOption{secalph}{\OPTsecalphtrue\OPTsecarabfalse}
\DeclareOption{secAlph}{\OPTsecAlphtrue\OPTsecarabfalse}
\DeclareOption{secroman}{\OPTsecromantrue\OPTsecarabfalse}
\DeclareOption{secRoman}{\OPTsecRomantrue\OPTsecarabfalse}

\DeclareOption{subsecalph}{\OPTsubsecalphtrue\OPTsubsecarabfalse}
\DeclareOption{subsecAlph}{\OPTsubsecAlphtrue\OPTsubsecarabfalse}
\DeclareOption{subsecroman}{\OPTsubsecromantrue\OPTsubsecarabfalse}
\DeclareOption{subsecRoman}{\OPTsubsecRomantrue\OPTsubsecarabfalse}

\DeclareOption{subsubsecalph}{\OPTsubsubsecalphtrue\OPTsubsubsecarabfalse}
\DeclareOption{subsubsecAlph}{\OPTsubsubsecAlphtrue\OPTsubsubsecarabfalse}
\DeclareOption{subsubsecroman}{\OPTsubsubsecromantrue\OPTsubsubsecarabfalse}
\DeclareOption{subsubsecRoman}{\OPTsubsubsecRomantrue\OPTsubsubsecarabfalse}

\DeclareOption{layout}{\OPTlayouttrue}

\ifOPTuiophd\else
   \DeclareOption{english}{\def\@language{english}}
   \DeclareOption{norsk}{\def\@language{norsk}}
\fi

\DeclareOption{linux}{\OPTlinuxtrue}
\DeclareOption{windows}{\OPTlinuxfalse\OPTwindowstrue}

\DeclareOption{notodos}{\OPTtodosfalse}
\DeclareOption{glossary}{\OPTglossarytrue}

% Process all the parameters
\ProcessOptions

% And finally load the standard document class
\LoadClass{\@bdoctype}

%========%                                      %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% LAYOUT %                                       Note! These values may be read from outside Latex
%========%                                      %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\ifOPTstdclass
   \typeout{stupid shit}
   %Options for A4 paper:
   % \setlength\oddsidemargin{0.25in}                %Applies to all pages in one-page setups.
   % \setlength\evensidemargin{0.25in}               %Only applies in two-page setups.
   % \setlength\textwidth{5.75in}                    %Unit here must be inches (cuz of laFigure)!
   % \setlength\headheight{15pt}
   \setlength\parindent{0pt}                       %Indent first line in each paragraph?
   % \setlength\columnseprule{11pt}
   % \setlength\parskip{10pt plus0.3pt minus0.3pt}
   % \setlength\parskip{10pt}
   \setlength\parskip{10pt%                         % baseskip
                     plus.5\baselineskip%          % amount of stretch
                     minus.3\baselineskip}          % pickyness on underfull vbox
                                    
   \newcommand\secskip{\ \vspace{-\baselineskip}\vspace{-\parskip}}
   % \setlength\secskip{-\baselineskip}           
   % \setlength\parfillskip{0pt}

   % \setlength\parskip{1\baselineskip}

   % \setlength\topmargin{0pt}
   \setlength\headheight{\baselineskip}
   % \setlength\headsep{\baselineskip}
   % \setlength\textwidth{100pt}
   % \setlength\textheight{200pt}
   % \setlength\footskip{80\baselineskip}
   % \setlength\marginparpush{0pt}
   % \setlength\marginparsep{0pt}
   % \setlength\marginparwidth{0pt}

   \newlength{\realwidth} % Just sometimes handy to have a copy of the initial linewidth available
   \setlength\realwidth{\linewidth}


   % \setlength\parskip{0.8\baselineskip} % Paragraph separation
   % \setlength\parsep{0pt}
   % \setlength\headsep{\baselineskip} % Distance to top of page
   % \setlength\topskip{0pt}
   % \setlength\topmargin{0pt}
   % \setlength\topsep{0pt}
   % % \setlength\partopsep{0pt}
   % \setlength\partopsep{0pt}
   % % \addtolength\partopsep{-\parskip}
   % 
   \setlength\abovecaptionskip{0pt}
   \setlength\belowcaptionskip{0pt}
   % 
   % \setlength\abovedisplayskip{0pt}
   % \setlength\belowdisplayskip{0pt}
   % \setlength\abovedisplayshortskip{0pt}
   % \setlength\belowdisplayshortskip{0pt}

   \setlength\marginparwidth{4cm}

   % \setlength\partopsep{-\topsep}
   % \addtolength\partopsep{-\parskip}

   % \setlength\partopsep{-\topsep}
   % \addtolength\partopsep{-\parskip}

   % \raggedbottom
   \flushbottom
\fi


%==========%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% PACKAGES %
%==========%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\ifOPTuiophd
%   \typeout{++++amsmath,amssymb++++}
%   \let\circledS\undefined                         % To avoid conflicts where this is previously defined
%   \RequirePackage{amsmath,amssymb}
    \typeout{++++mathtools++++}
    \RequirePackage{mathtools}
    \RequirePackage{amsfonts,amssymb}
%    \usepackage{amsfonts}
   
   \ifOPTxelatex%
       \RequirePackage{fontspec}%               % Provides font selecting commands
       \setmainfont[Mapping=tex-text]{EB Garamond}
   \else
      \typeout{++++fontenc+++}
      \RequirePackage[T1]{fontenc}%                 % Set font encoding
      \typeout{++++inputenc++++}
      \RequirePackage[utf8]{inputenc}%              % Set input encoding (optionally latin1)
      % Loading fontenc first is advisable:           https://tex.stackexchange.com/a/34046
      \RequirePackage[final]{microtype}%            % Enable microtypographic features (avoid silly o.f. boxes)
      
%       \RequirePackage[full]{textcomp}
%       \RequirePackage[garamond,expert]{mathdesign}
%       \RequirePackage[swashQ]{garamondx}
%       \renewcommand{\rmdefault}{ptm}
%   
%       \setmathfont{Latin Modern Math}[version=lm]
%       \RequirePackage[full]{textcomp}
%       \RequirePackage[expert]{mathdesign}
%       \RequirePackage[swashQ]{garamondx}
%       \RequirePackage[garamond,expert]{mathdesign}
%       \RequirePackage{mathdesign}
%       \RequirePackage{ebgaramond}
%       \RequirePackage[swashQ]{garamondx}
%      \RequirePackage{newunicodechar}
%       \DeclareSymbolFontAlphabet{\mathrm}    {operators}
%       \DeclareSymbolFontAlphabet{\mathrm}    {letters}
%       \DeclareSymbolFontAlphabet{\mathrm}    {symbols}
%       \DeclareSymbolFontAlphabet{\mathnormal}{letters}
%       \DeclareSymbolFontAlphabet{\mathcal}   {symbols}
%       \DeclareSymbolFont{operators}   {OT1}{cmr} {m}{n}
%       \DeclareSymbolFont{operators}   {OT1}{cmr} {m}{n}
%       \DeclareSymbolFont{letters}     {OML}{cmm} {m}{it}
%       \DeclareSymbolFont{symbols}     {OMS}{cmsy}{m}{n}
   \fi
   \typeout{++++xcolor+++}
   \RequirePackage[table,dvipsnames,svgnames]{xcolor}  % Adds colours in tabulars (will pull in colortbl)
   \typeout{++++ccaption+++}
   \RequirePackage{ccaption}                       % For customised captions
   \typeout{++++fancyhdr++++}
   \RequirePackage{fancyhdr}                       % fancyheading deprecated.

   \typeout{++++biblatex++++}
   \RequirePackage[
         backend=biber
      , defernums=true
      , doi=true
      , eprint=false
   %    , sortlocale=
      , style=numeric-comp
%       , style=ieee,
   %   , style=authoryear-icomp
      , url=false
      , sorting=none
      ]{biblatex}
   \typeout{++++pdfpages++++}
   \RequirePackage[final]{pdfpages}
   \typeout{++++titlesec++++}
   \RequirePackage{titlesec}
%    \ifOPTlayout
%    \typeout{++++layout++++}
%       \RequirePackage{layout}
%    \fi
   \usepackage{tikz}
   \usetikzlibrary{calc,positioning,shapes,snakes}
   %\newcommand{\tikzmark}[1]{\tikz[remember picture]\coordinate(#1){(-.35em,-.545ex)};}
   \newcommand{\tikzmark}[2]{\tikz[remember picture,baseline=(#1.base)]\node[shape=rectangle,inner sep=0pt](#1){#2};}
   \newcommand*\circled[1]{\tikz[baseline=(char.base)]{
               \node[shape=circle,draw,inner sep=2pt] (char) {#1};}}
               
               
   \usepackage{accents} % For underaccent
%   \usepackage{multirow}
   \usepackage{tabularx}
   
   \usepackage[cacheDir=build%
              ,blankBeforeBlockquote=false%	Require blank line before paragraph and quote
              ,blankBeforeCodeFence=false%	Require blank line before paragraph and code fence
              ,blankBeforeHeading=false%		Require blank line before paragraph and heading
              ,breakableBlockquotes%			Blank line between block quotes
              ,citationNbsps=true%				Non-breakable spaces inside notes/citations
              ,citations=false%					Pandoc citation syntax
              ,codeSpans=true%					Enable backticks for code, ``code here``
              ,contentBlocks=false%				Enable iA Writer extension
%              ,contentBlocksLanguageMap=<fn> JSON file that maps file extensions to prog.lang.
              ,definitionLists=false%			Pandoc definition list syntax
              ,fencedCode=false%					Enable fenced code extension
              ,footnotes=false%					Enable Pandoc footnote extension
              ,hashEnumerators=true% 			Enables #. lists
              ,html=false%							Recognize html tags
              ,hybrid=true%						Interspace Latex/Markdown
              ,inlineFootnotes=false%			So.. ^[Inline footnote.]
              ,preserveTabs=false%  			Convert tabs to spaces
              ,smartEllipses=false% 			Convert ellipses to TeX
              ,startNumber=false%   			Make first list number significant
              ,tightLists=true%					Tight lists?
              ,underscores=false%   			Emphasize with _abc_
              ]{markdown}
%   \usepackage[pilcrow]{easylist}
%    \usepackage{floatrow}
   \usepackage{listings}
   \lstset{
         language=bash%
      , caption=%
      , label=%
      , basicstyle=\small
      , frame=bt
      , aboveskip=\baselineskip % space above listing
      , belowskip=\baselineskip % space below listing
      , framexleftmargin=1em%
      , xleftmargin=1em%        %To vertically align the box with the rest of the text in the
      , captionpos=b%     %Caption at bottom
      , mathescape=true%
   }

   \newif\ifTODO\TODOfalse
   \newcounter{todoidx}
   \newsavebox\mytodobox

   \ifOPTtodos
      \typeout{===cool===}
   %   \vbadness=99999	
      \definecolor{todobackground}{rgb}{0.95,0.95,0.95}
      \setlength\marginparsep{1pt}
      \setlength\marginparwidth{40pt}
      \newlength\marginparwidthsmall
      \setlength\marginparwidthsmall{\marginparwidth}
      \addtolength\marginparwidthsmall{-10pt}
      \newcommand\todo[1]{%
         \addtocounter{todoidx}{1}%
         {\color{Red}\bf(\thetodoidx{})}%%\fbox{\bf\thetodoidx{}}}%
         \marginpar{\sbox{\mytodobox}{\hbadness=99999%https://tex.stackexchange.com/a/144615
            {\vspace*{-10pt}\color{Red}\fbox{\bf\thetodoidx{}}}\\%
            \fcolorbox{red}{todobackground}{\parbox{\marginparwidthsmall}{%
            \hfuzz=\maxdimen%https://tex.stackexchange.com/a/144615
            \raggedright\scriptsize #1}}}}}
   
      \newcommand\todopar[1]{\fcolorbox{red}{white}{\parbox{35pt}{#1}}}
   \else
      \typeout{===not cool===}
   %    \usepackage[disable]{./todonotes} 
      \newcommand\todo[1]{}
   \fi
%    \usepackage{epigraph}
%   \RequirePackage[
%      %                   avantgarde
%      %                   bookman
%      %                   charter
%      %                   courier
%      %                   helvetica
%      %                   newcentury
%      %                   palatino
%                        times
%      %                   utopia
%                        ]{quotchap}               %For customisable chapter/section headings.
%%      \renewcommand\chapterheadstartvskip{\vspace*{-5\baselineskip}}

   \typeout{++++accents++++}
   \usepackage{accents}
   \typeout{++++moresize++++}
   \usepackage{moresize}
   \typeout{++++multirow++++}
   \usepackage{multirow}
   \typeout{++++tabularx++++}
   \usepackage{tabularx}
   \typeout{++++collcell++++}
   \usepackage{collcell}
   \typeout{++++booktabs++++}
   \usepackage{booktabs}
   \typeout{++++calc++++}
   \usepackage{calc}
   
   % \typeout{++++mylatexformat++++}
   % \usepackage{mylatexformat}
   \typeout{++++floatrow++++}
   \usepackage{floatrow}
   %\usepackage{bibtex}
   %\usepackage{comment}
   \typeout{++++environ++++}
   \usepackage{environ}
   %\usepackage[runin]{abstract}
   \typeout{++++parskip++++}
   \usepackage[parfill]{parskip}
   \typeout{++++afterpage++++}
   \usepackage{afterpage}
   % \typeout{++++placeins++++}
   % \usepackage{afterpage}
   \typeout{++++subfiles++++}
   \usepackage{subfiles}
   %\typeout{++++standalone++++}
   %\usepackage{standalone}
   \typeout{++++subfig++++}
   \usepackage[caption=false,font=footnotesize]{subfig}
   \typeout{--------------}

   \usepackage[margin=0pt,font={it,small},labelfont={bf,it},labelsep=colon]{caption}
   

   \typeout{++++glossaries++++}
   \usepackage[nonumberlist,nogroupskip]{glossaries}
   \typeout{++++hyperref++++}
   \RequirePackage{hyperref}
   \RequirePackage{bookmark}
   \typeout{--------------}
\else
   \let\circledS\undefined 								% To avoid conflicts where this is previously defined
   \RequirePackage{amsmath,amssymb}

   %~~ Fonts ~~%
   \ifOPTxelatex%
   \typeout{-- XeLaTeX specified, loading fontspec package}%
   \RequirePackage{fontspec}%               % Provides font selecting commands
   %   \RequirePackage[cm-default]{fontspec}%               % Provides font selecting commands
   % \setmathfont{cm-default}
   % \setmathfont{Asana-Math}
   %   \RequirePackage{xunicode}%                    % Provides unicode character macros
   \fi
   \ifOPTlualatex
   \typeout{-- LuaLaTeX specified, loading fontspec package}%
   \RequirePackage{fontspec}%               % Provides font selecting commands
   %   \RequirePackage[cm-default]{fontspec}%               % Provides font selecting commands
   % \setmathfont{cm-default}
   % \setmathfont{Asana-Math}
   %   \RequirePackage{xunicode}%                    % Provides unicode character macros
   \fi
   \ifOPTlualatex\else\ifOPTxelatex\else%
   \typeout{-- PdfLaTeX specified, loading inputenc and fontenc}%
   \RequirePackage[T1]{fontenc}%                 % Set font encoding
   \RequirePackage[utf8]{inputenc}%              % Set input encoding (optionally latin1)
   % Loading fontenc first is advisable:           https://tex.stackexchange.com/a/34046
   \fi\fi


   \ifOPTbeamer\else
   \ifOPTdefaultformat\else
   \ifOPTuam\else
   \ifOPTuiophd\else
      \RequirePackage{lmodern}                        % The truetype implementation of Computer Modern
   \fi
   \fi
   \fi
   \fi

   %~~ Colours and Graphics ~~%
   \ifOPTbeamer
   % \RequirePackage[table,dvipsnames,svgnames]{xcolor}  % Adds colours in tabulars (will pull in colortbl)

   %  , xcolor={
   %       table,                %For colour in tabulars (will pull in colortbl)
   %       dvipsnames,
   %       svgnames  }
   \else
   \RequirePackage[table,dvipsnames,svgnames]{xcolor}  % Adds colours in tabulars (will pull in colortbl)
   \fi

   \ifOPTbeamer
   \else                                                % Increases the available colour palette
   \ifOPTxelatex
      \ifOPTuiophd
      \else
         \RequirePackage[xetex,final]{graphicx}
      \fi%      % Adds \includegraphics{} etc.
   \fi
   \ifOPTlualatex\RequirePackage[xetex,final]{graphicx}\fi%      % Adds \includegraphics{} etc.
   \ifOPTxelatex\else\ifOPTlualatex\else%
         \RequirePackage{graphicx}%
   \fi\fi
   \fi
   \RequirePackage{wrapfig}                        %For enabling text to wrap around figures
   \RequirePackage{subfigure}

   %~~ Floats ~~%
   \ifOPTuam\else
      \RequirePackage{ccaption}                       % For customised captions
   \fi
   \ifOPTfloatrow
   \RequirePackage{floatrow}
   \floatsetup[table]{capposition=top}
   \else
   \RequirePackage{float}                        % Needed for the 'H' 
   \fi                                             % (Fig. placement: htbp - here, top, bottom, page)
                                                   %                  H - here and only here!
   \RequirePackage{threeparttable}                 % For table notes

   \RequirePackage{multirow}                       % For more options with tables..
   \renewcommand*\arraystretch{1.05}


   %~~ COMMENTING ~~%
                                                   % For <\todo[inline]{description}>
   \ifOPTtodos\ifOPTbeamer
      \definecolor{lightblue}{rgb}{0.8,0.8,1}
      \RequirePackage[backgroundcolor=lightblue]{todonotes}
      \else
      \RequirePackage[backgroundcolor=LightBlue]{todonotes}
      \fi
   \else      \RequirePackage[disable]{todonotes} 
   %            \newcommand\todo[2][]{\immediate\write18{echo #1 > /dev/null}}
   %            \newcommand\listoftodos{}
   %            \newcommand\missingfigure{}
   \fi

   \RequirePackage{verbatim}                       % For <\begin{comment} ... \end{comment}>
   % \ifOPTbeamer\else
   \RequirePackage[final]{listings}                % For <\begin{lstlisting} ... \end{lstlisting}>
   % \fi
   % \newcommand\lststart{}%\vspace{0.5\baselineskip}}
   % \newcommand\lstend{}%\vspace{-0.5\baselineskip}}

   \ifOPTbeamer\else% Bah, was a pain... Bunch of xkeyval errors when included.
   \RequirePackage{fancyvrb}
   \fi

   \ifOPTbeamer
   \RequirePackage[absolute,overlay]{textpos}                        % For specifying text etc. absolutely
   \fi

   %~~ REFERENCES ~~%
   \RequirePackage{varioref}                       % \vref{} replace \ref{} on page \pageref{}

   \ifOPTbeamer\else
   \RequirePackage{lastpage}                       % To be able to reference the last page
   \fi

   % \RequirePackage%[ style=alphabetic%
   % %                , bibstyle=authoryear%
   % %                , citestyle=authoryear%
   % %                , natbib=false ]%
   %                {biblatex}
   % \RequirePackage{bibunits}
   % \RequirePackage{splitbib}

   % \RequirePackage{natbib}

   %~~ MATH STUFF ~~%
   % \RequirePackage{amsmath, amsthm}
   \RequirePackage{amssymb, amstext, amsmath, mathrsfs, mathdots}
   % \RequirePackage{unicode-math}
   % http://github.com/wspr/unicode-math

   % \RequirePackage[amssymb]{SIunits}                        % For consistent SI unit usage

   % \RequirePackage{mathdots}

   %~~ LAYOUT ~~%
   % 
   \ifOPTreport%
   %   \def\openright{}
   \RequirePackage[
   %                   avantgarde
   %                   bookman
   %                   charter
   %                   courier
   %                   helvetica
   %                   newcentury
   %                   palatino
                     times
   %                   utopia
                     ]{quotchap}               %For customisable chapter/section headings.
   \renewcommand\chapterheadstartvskip{\vspace*{-5\baselineskip}}
   % \newenvironment{savequote}{}{}
   % \newcommand\qauthor{}
   \fi

   \RequirePackage{fancyhdr}                       % fancyheading deprecated.

   % \RequirePackage[titles]{tocloft}                % For customising TOC

   %~~ OTHER ~~%
   \RequirePackage{ifthen}                         % Combinatorial statements
   \RequirePackage{calc}                           % More flexible size specifications
   \RequirePackage{fp}                             % Floating point arithmetic

   %~~ HYPERLINKS ~~%
   \ifOPTbeamer\else
   \ifOPTxelatex
   \RequirePackage[xetex]{hyperref}
   \else
   \RequirePackage{hyperref}
   \fi
   \fi

   \RequirePackage{url}   

   %~~ INDEXES (GLOSSARY, ...) ~~%
   \ifOPTglossary
   \RequirePackage[toc,nonumberlist]{glossaries}%
   \renewcommand\glsdescwidth{0.8\linewidth}
   \renewcommand\glspagelistwidth{0pt}
   \fi

   \ifOPTbibliography
   \RequirePackage[autostyle]{csquotes}
   \ifOPTuiophd
   \typeout{=====Hello there sucker!!!======}
   \RequirePackage[
      backend=biber
      , style=ieee
      , citestyle=ieee
   %   , defernums=true
   %   , doi=true
   %   , eprint=false
   %%    , sortlocale=
   %%   , style=authoryear-icomp
   %   , url=false
      ]{biblatex}
   \else
      \ifOPTuam\else
   	  \RequirePackage[
   	     backend=biber
   	   , defernums=true
   	   , doi=true
   	   , eprint=false
   	%    , sortlocale=
   	   , style=numeric
   	%   , style=authoryear-icomp
   	   , url=false
   	   ]{biblatex}
      \fi
   \fi

   \fi



   %% Packet for turning/rotating objects
   \RequirePackage{rotating}

   \ifOPTlayout
   \RequirePackage{layout}                       % \layout to print layout
   % Alternative (no package needed):                \printinunitsof{cm}\prntlen{\textwidth}
   \else
   \newcommand\layout{}
   \fi

   \RequirePackage[final]{pdfpages}
   \RequirePackage{tikz}


   % Customised titles (\...)
   \ifOPTbeamer\else\ifOPTieee\else
   \usepackage{titlesec}
   \fi\fi

   \AtBeginDocument{%
   \RequirePackage{longtable}
   }
 \fi


% \format{<command>}[<shape>]{<format}{<label>}{<sep>}{<before>}[<after>]

% \ifOPTmovie%
% \RequirePackage[final]{movie15}                  
% \fi


% \RequirePackage{minted}
% \newminted{bash}{  baselinestretch=1, mathescape, linenos=true, fontsize=\scriptsize, bgcolor=weakGrey, numbersep=10pt}
% \newminted{text}{  baselinestretch=1, mathescape, linenos=true, fontsize=\scriptsize, bgcolor=weakGrey, numbersep=10pt}
% \newminted{matlab}{baselinestretch=1, mathescape, linenos=true, fontsize=\scriptsize, bgcolor=weakGrey, numbersep=10pt}
% \renewcommand\theFancyVerbLine{\sffamily\color{SeaGreen}{\tiny\arabic{FancyVerbLine}}}                 



%%%%%%%%%%
% HEADERS
%%%%%%%%%%%

% This is mostly ripped from the 'quotchap' package. It did not perform to my liking, so I've
% tweaked it some... 


% charter         bch
% palatino        ppl
% avantgarde      pag
% bookman         pbk
% courier         pcr
% helvetica       phv
% newcentury      pnc
% times           ptm
% utopia          put

% \ifOPTreport%
% {
% \def\@defaultcnfont{ptm}
% 
% \newif\if@usecolor\@usecolortrue
% \newcommand*{\@newfontcmd}{\@ifundefined{@defaultcnfont}{\newcommand*}{%
%     \PackageWarning{quotchap}{%
%       You have tried to specify more than one font to be\MessageBreak
%       used for the chapter numbers. I ignore the font\MessageBreak
%       `\CurrentOption'}
%     \providecommand*}}
% 
% % \DeclareOption{grey}{\@usecolortrue}
% % \DeclareOption{nogrey}{\@usecolorfalse}
% \providecommand*{\@defaultcnfont}{pbk}
% \if@usecolor
%   \definecolor{chaptergrey}{rgb}{0.6,0.6,0.6}%
% \else
%   \providecommand*{\color}[1]{}
% \fi
% 
% \newcommand*{\chapnumfont}{%
%   \usefont{T1}{\@defaultcnfont}{b}{n}\fontsize{100}{130}\selectfont%
%   \color{TealBlue}}
% \let\size@chapter\huge
% \providecommand*{\chapterheadstartvskip}{\vspace*{2.3\baselineskip}}
% \providecommand*{\chapterheadendvskip}{\vspace{1.7\baselineskip}}
% \providecommand*{\sectfont}{\relax}
% \@ifundefined{@mainmattertrue}{\newif\if@mainmatter\@mainmattertrue}{}
% 
% \newenvironment{savequote}[1][10cm]{%
%   \begin{lrbox}{\@quotebox}
%     \begin{minipage}[t]{#1}\footnotesize\slshape
%       \ignorespaces}{%
%       \unskip\end{minipage}\end{lrbox}
%   \global\setbox\@quotebox\copy\@quotebox
%   \global\let\@printcites\@iprintcites
%   \ignorespacesafterend}
% \newcommand{\qauthor}[1]{%
%   \par\smallskip
%   {\raggedleft\upshape #1\qquad\hbox{}\par}\bigskip}
% \newsavebox{\@quotebox}
% \let\@printcites\relax
% \renewcommand\chapter{%
%   \if@openright\cleardoublepage\else\clearpage\fi
%   \thispagestyle{plain}%
%   \global\@topnum\z@
%   \@printcites
%   \@afterindentfalse
%   \secdef\@chapter\@schapter}
% \renewcommand{\@makechapterhead}[1]{\chapterheadstartvskip%
%   {\size@chapter{\enspace\enspace\sectfont\raggedleft
%       {\chapnumfont
%         \ifnum \c@secnumdepth >\m@ne%
%         \if@mainmatter\thechapter%
%         \fi\fi
%         \par\nobreak}%
%       {\raggedleft\advance\leftmargin10em\interlinepenalty\@M #1\par}}
%     \nobreak\chapterheadendvskip}}
% \renewcommand{\@makeschapterhead}[1]{%
%   {\let\c@secnumdepth\m@ne\@makechapterhead{#1}}}
% \newcommand*{\@iprintcites}{%
%   \vbox to\z@{\copy\@quotebox\vss}
%   \global\let\@printcites\relax}
% %% \CharacterTable
% %%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
% %%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
% %%   Digits        \0\1\2\3\4\5\6\7\8\9
% %%   Exclamation   \!     Double quote  \"     Hash (number) \#
% %%   Dollar        \$     Percent       \%     Ampersand     \&
% %%   Acute accent  \'     Left paren    \(     Right paren   \)
% %%   Asterisk      \*     Plus          \+     Comma         \,
% %%   Minus         \-     Point         \.     Solidus       \/
% %%   Colon         \:     Semicolon     \;     Less than     \<
% %%   Equals        \=     Greater than  \>     Question mark \?
% %%   Commercial at \@     Left bracket  \[     Backslash     \\
% %%   Right bracket \]     Circumflex    \^     Underscore    \_
% %%   Grave accent  \`     Left brace    \{     Vertical bar  \|
% %%   Right brace   \}     Tilde         \~}
% % \endinput
% 
% \renewcommand\chapterheadstartvskip{\vspace*{-5\baselineskip}}
% }
% \fi

%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% REFERENCES % 
%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

%~~ HYPERREF ~~%
\ifOPTbeamer\else
\ifOPTdefaultformat\else
\ifOPTuiophd
   \hypersetup{
     breaklinks=true                             % Break links when necessary
   , linktocpage=true                             % Enable link to page?
   , linkcolor=Black%PineGreen                          % Colour of links to labels within document
   , citecolor=Brown                              % Colour of links to the biliography
   , filecolor=Red                                % Colour of links to local files
   , urlcolor=SeaGreen                            % Colour of the links to external URLs
   , colorlinks=true                              % ??
   , plainpages=false                             % Store roman/arabic numbering differently to avoid
                                                   % ``duplicate'' warning.
   , final
   %  , bookmarksopen=true
   %  , bookmarksopenlevel=3
   %  , bookmarks=true
   , bookmarksnumbered }                          % Have the bookmarks numbered.

\else
   \hypersetup{
      breaklinks=true,                             % Break links when necessary
   , linktocpage=true                             % Enable link to page?
   , linkcolor=PineGreen                          % Colour of links to labels within document
   , citecolor=Brown                              % Colour of links to the biliography
   , filecolor=Red                                % Colour of links to local files
   , urlcolor=SeaGreen                            % Colour of the links to external URLs
   , colorlinks=true                              % ??
   , plainpages=false                             % Store roman/arabic numbering differently to avoid
                                                   % ``duplicate'' warning.
   , final
   %  , bookmarksopen=true
   %  , bookmarksopenlevel=3
   %  , bookmarks=true
   , bookmarksnumbered }                          % Have the bookmarks numbered.
\fi
\fi
\fi

\newcommand\source[1]{\mbox{}\hfill \textit{[ \footnote{Based on #1.} ]}}

%%For inline abbreviations:
%\newcommand\fig[1]{\hyperref[#1]{fig.}~\ref{#1}}
%\newcommand\figpage[1]{\hyperref[#1]{fig.}~\ref{#1} (page \pageref{#1})}
%\newcommand\Fig[1]{\hyperref[#1]{Fig.}~\ref{#1}}
%\newcommand\tab[1]{\hyperref[#1]{tab.}~\ref{#1}}
%\newcommand\tabpage[1]{\hyperref[#1]{tab.}~\ref{#1} (page \pageref{#1})}
%\newcommand\Tab[1]{\hyperref[#1]{Tab.}~\ref{#1}}
%\newcommand\eq[1]{\hyperref[#1]{eq.}~\ref{#1}}
%\newcommand\eqpage[1]{\hyperref[#1]{eq.}~\ref{#1} (page \pageref{#1})}
%\newcommand\Eq[1]{\hyperref[#1]{Eq.}~\ref{#1}}
%\newcommand\lign[1]{\hyperref[#1]{lign.}~\ref{#1}}
%\newcommand\lignpage[1]{\hyperref[#1]{lign.}~\ref{#1} (page \pageref{#1})}
%\newcommand\Lign[1]{\hyperref[#1]{Lign.}~\ref{#1}}
%\newcommand\lst[1]{\hyperref[#1]{list}~\ref{#1}}
%\newcommand\lstpage[1]{\hyperref[#1]{list}~\ref{#1} (page \pageref{#1})}

% A hack to make images hyperlinked, e.g. \href{<url>}{\xbox{\includegraphics{<img>}}}:
\newsavebox{\ximagebox}\newlength{\ximageheight}
\newsavebox{\xglyphbox}\newlength{\xglyphheight}
\newlength{\xboxoversize}\setlength\xboxoversize{3.64pt}% fix to avoid overfull hboxes
\newcommand{\xbox}[1]
{\begin{narrow}{0pt}{-\xboxoversize}% fix to avoid overfull hboxes
\savebox{\ximagebox}%
{\addtolength\linewidth{-\xboxoversize}#1\addtolength\linewidth{\xboxoversize}}% fix to avoid overfull hboxes
\settoheight{\ximageheight}{\usebox{\ximagebox}}%
\savebox{\xglyphbox}{\char32}\settoheight{\xglyphheight}{\usebox{\xglyphbox}}%
\raisebox{\ximageheight}[0pt][0pt]{%\raisebox{-\xglyphheight}[0pt]    [0pt]{%
\makebox[0pt][l]{\usebox{\xglyphbox}}}%}%
\usebox{\ximagebox}%
\raisebox{0pt}[0pt][0pt]{\makebox[0pt][r]{\usebox{\xglyphbox}}}
\end{narrow}}% fix to avoid overfull hboxes
%(see http://www.tug.org/pipermail/xetex/2005-October/002481.html for details)

% \def\execB#1{\immediate\write18{#1}\endgroup}
% \def\exec{\begingroup\catcode 92 12 \execB}
\def\exec{\begingroup\catcode 92 12 \execB}
\def\execB#1{\immediate\write18{#1}\endgroup}
% \exec{echo '\href' > bin/aaa.txt}

\ifOPTlinux
\newcommand\run[3][]{%ex \run[(optional: program)]{<command/file>}{<name>}
  \immediate\write18{echo \#! /bin/bash > bin/#3.sh}%
  \immediate\write18{echo "" >> bin/#3.sh}%
  \immediate\write18{echo #1 #2 >> bin/#3.sh}%
  \immediate\write18{chmod a+x bin/#3.sh}%
%
  \immediate\write18{echo \#! /bin/bash > bin/run.sh}%
  \immediate\write18{echo "" >> bin/#3.sh}%

  \exec{echo '\@backslashchar href{run:/home/me/Work/UiO/mapet/doc/bin/#3.sh}{#3}' > bin/run.sh}
%   \immediate\write18{}%
\input{bin/run.sh}
%   \href{run:bin/#3.sh}{#3}%
}
\fi
\ifOPTwindows %NB! Never tested!
\newcommand\run[3][]{%ex \run{<command>}{<name>}
  \immediate\write18{echo "\@echo off" > bin/#3.cmd}%
  \immediate\write18{echo #1 #2 >> bin/#3.cmd}%
  \href{run:bin/#3.cmd}{\texttt{#3}}%
}
\fi


% \newcommand\graphicsAI[2][]{%
%    \immediate\write18{laFigure #2 #1}%
%    \input{result}%
% }

%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% COLOURS %
%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\newcommand\baseColour{\color{Black}}
% \newcommand\red{\color{Red}}
% \newcommand\brown{\color{Brown}}
% \newcommand\green{\color{Green}}
% \newcommand\seaGreen{\color{SeaGreen}}

\newcommand\Grey[1]{{\color{Grey}#1}}
\newcommand\Red[1]{{\color{Red}#1}}
\newcommand\Blue[1]{{\color{Blue}#1}}
\newcommand\DarkBlue[1]{{\color{DarkBlue}#1}}
\newcommand\LightBlue[1]{{\color{LightBlue}#1}}
\newcommand\Brown[1]{{\color{Brown}#1}}
\newcommand\Green[1]{{\color{Green}#1}}
\newcommand\SeaGreen[1]{{\color{SeaGreen}#1}}
\newcommand\Yellow[1]{{\color{yellow}#1}}
\newcommand\Orange[1]{{\color{orange}#1}}

\definecolor{weakGrey}{rgb}{0.85,0.85,0.85}
\definecolor{tabBlue}{HTML}{AACCFF}
\definecolor{tabGrey}{HTML}{CCCCCC}
% \definecolor{fileBlue}{DarkBlue}
\newcommand\fileBlue[1]{{\color{DarkBlue}#1}}

%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% FLOATS  %
%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\ifOPTuiophd
    \renewcommand\topfraction{0.9}  % max fraction of floats at top
    \renewcommand\bottomfraction{0.8} % max fraction of floats at bottom
    %   Parameters for TEXT pages (not float pages):
    \setcounter{topnumber}{2}
    \setcounter{bottomnumber}{2}
    \setcounter{totalnumber}{4}     % 2 may work better
    \setcounter{dbltopnumber}{2}    % for 2-column pages
    \renewcommand\dbltopfraction{0.9} % fit big float above 2-col. text
    \renewcommand\textfraction{0.07}  % allow minimal text w. figs
    %   Parameters for FLOAT pages (not text pages):
%     \renewcommand\floatpagefraction{0.85}  % require fuller float pages
  % N.B.: floatpagefraction MUST be less than topfraction !!
%     \renewcommand\dblfloatpagefraction{0.85} % require fuller float pages

\else

% Alter some LaTeX defaults for better treatment of figures:
    % See p.105 of "TeX Unbound" for suggested values.
    % See pp. 199-200 of Lamport's "LaTeX" book for details.
    %   General parameters, for ALL pages:
    \renewcommand{\topfraction}{0.9}  % max fraction of floats at top
    \renewcommand{\bottomfraction}{0.8} % max fraction of floats at bottom
    %   Parameters for TEXT pages (not float pages):
    \setcounter{topnumber}{2}
    \setcounter{bottomnumber}{2}
    \setcounter{totalnumber}{4}     % 2 may work better
    \setcounter{dbltopnumber}{2}    % for 2-column pages
    \renewcommand{\dbltopfraction}{0.9} % fit big float above 2-col. text
    \renewcommand{\textfraction}{0.07}  % allow minimal text w. figs
    %   Parameters for FLOAT pages (not text pages):
    \renewcommand{\floatpagefraction}{0.85}  % require fuller float pages
  % N.B.: floatpagefraction MUST be less than topfraction !!
    \renewcommand{\dblfloatpagefraction}{0.85} % require fuller float pages

  % remember to use [htp] or [htpb] for placement

%   \hbadness=25 %(10000=infinity - underfull hbox ignored)
%   \vbadness=25 %correction underfull vbox ignored
%   \hfuzz=2pt (whats the accepted line overflow?)
%   \tolerance= (1000 - overfull hbox' ignored)

\fi


%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% LISTINGS %
%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% \newcommand\aboveskip{0pt}
% \newcommand\belowskip{0pt}

% \ifOPTbeamer\else
\ifOPTdefaultformat\else
\ifOPTuiophd\else
\lstset{
  %These 3 parameters should be re-specified for each listing:
   language=c%
 , caption=someCaption%
 , label=someLabel%
 , extendedchars=false
%  , inputencoding=utf8
  %
%   morecomment=[1]\ ,
%   fvcmdparams=<\frac><2>,
 , backgroundcolor=\color{weakGrey}%
  %
 , basicstyle=\scriptsize\ttfamily%\scriptsize
 , keywordstyle=\ttfamily\color{DarkBlue}\bfseries%
 , identifierstyle=\ttfamily\bfseries%
 , commentstyle=\ttfamily\color{ForestGreen}\itshape%
  %morecomment=[|]{//}
 , stringstyle=\ttfamily\color{Brown}%
  %
 , showspaces=false%
 , showstringspaces=false%
 , showtabs=false%
  %
 , frame=single                            %single, shadowbox, framed
%  , xtopmargin=100pt%
%  , xbottommargin=100pt%
%  , framesep=10pt
%  , rulesep=10pt
 , lineskip=1.5pt
 , aboveskip=\parskip % space above listing
 , belowskip=\parskip % space below listing
 , framexleftmargin=0pt%
 , framexrightmargin=0pt%
 , linewidth=\linewidth%
 , xleftmargin=4pt%        %To vertically align the box with the rest of the text in the
 , xrightmargin=4pt%       %document, rather than having the text aligned and the box overshoot.
 , tabsize=2%
  %
 , captionpos=b%     %Caption at bottom
  %
 , breaklines=true%
 , breakatwhitespace=false%
  %
 , mathescape=true%
%   escapeinside={\%},
%   escapebegin={\%},
%   escapeend={.},
  %
 , numbers=left%
 , numberstyle=\tiny\color{SeaGreen}%
 , stepnumber=1%
 , numbersep=10pt }
\fi\fi

\ifOPTbeamer\else
\ifOPTuiophd\else
\lstset{
  basicstyle=\tiny\ttfamily%\scriptsize
 }
\fi\fi
% % Beamer hates fancyvrb
% \ifOPTbeamer\else
% \lstset{
%   fancyvrb=false 
% }
% \fi
% % \fi
% 
%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% HEADERS %    
%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

%Set up the fancyheadings package:
%\renewcommand{\sectionmark}[1]{\markboth{\lowercase{\thesection.\ #1}}{}}
% \renewcommand{\sectionmark}[1]{\markright{#1}}
% \renewcommand{\leftmark}[1]{\sectionmark}


\ifOPTuam\ifOPTuiophd\else
   \ifOPTtwoside
   %Every first page of a chapter is ``plain'' (for some reason):
   \fancypagestyle{plain}
   { \lhead{}
      \chead{}
      \rhead{}
      \lfoot{}
      \cfoot{}
      \rfoot{\SeaGreen{\textit{Page \thepage}}}
      \renewcommand\headrulewidth{0pt}
      \renewcommand\footrulewidth{0pt}
   %   \setlength{\headrulewidth}{0pt}
   %   \setlength{\footrulewidth}{0pt}
   }

   % All other pages will use these parameters (since I set \pagestyle{fancy}):
   \fancyhead{}
   \fancyhead[LE]{\SeaGreen{\let\uppercase\relax\textsc\leftmark}}
   %   \fancyhead[LO]{\SeaGreen{\let\uppercase\relax\textsc\leftmark}}
   \fancyhead[RO]{\SeaGreen{\let\uppercase\relax\textsc\rightmark}}
   \fancyfoot{}
   \fancyfoot[LE]{\SeaGreen{\textit{Page \thepage}}}
   \fancyfoot[RO]{\SeaGreen{\textit{Page \thepage}}}
   %   \fancyfoot[LE,RO]{\SeaGreen{\textit{Page \thepage}}}
   %   \fancyfoot[C]{\SeaGreen{\textit{Page \thepage}}}

   % Redefine \cleardoublepage for blank last pages of every chapter
   \makeatletter
   \def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
      \hbox{}
      \vspace*{\fill}
      \ % Just a single blank character
      \vspace{\fill}
      \thispagestyle{plain} % ..empty or plain
      \newpage
      \if@twocolumn\hbox{}\newpage\fi\fi\fi}
   \makeatother
   \else
   %Every first page of a chapter is ``plain'' (for some reason):
   \fancypagestyle{plain}
   { \lhead{}
      \chead{}
      \rhead{}
      \lfoot{}
      \cfoot{}
      \rfoot{\SeaGreen{\textit{Page \thepage}}}
      \renewcommand\headrulewidth{0pt}
      \renewcommand\footrulewidth{0pt}
   %   \setlength{\headrulewidth}{0pt}
   %   \setlength{\footrulewidth}{0pt}
   }

   % All other pages will use these parameters (since I set \pagestyle{fancy}):
   \fancyhead{} % Clear headers
   %   \lhead{}
   %   \chead{}
   \rhead{\SeaGreen{\let\uppercase\relax\textsc\leftmark}}
   \fancyfoot{} % Clear footers
   %   \lfoot{}
   %   \cfoot{}
   \rfoot{\SeaGreen{\textit{Page \thepage}}}
   \fi

\fi\fi

\ifOPTuiophd

%       \makeatletter
%       \let\ps@plain\ps@fancy
%       \let\ps@empty\ps@fancy
%       \makeatother
      
   % Every first page of a chapter is ``plain'' (for some reason).
   % Only print page number on these pages
	\fancypagestyle{plain}
	{  \vbadness 1000
	   \lhead{}
		\chead{}
		\rhead{}
		\lfoot{}
		\cfoot{\thepage}
 		\rfoot{}
%       \fancyfoot[RO]{\thepage}
%       \fancyfoot[LE]{\thepage}
		\renewcommand\headrulewidth{0pt}
		\renewcommand\footrulewidth{0pt}
		%   \setlength{\headrulewidth}{0pt}
		%   \setlength{\footrulewidth}{0pt}
	}
   \fancypagestyle{empty}
   {  % \hbadness 99999
      \vbadness 99999
      \lhead{}
      \chead{}
      \rhead{}
      \lfoot{}
      \cfoot{}
      \rfoot{}
      \rfoot{}
%       \fancyfoot[RO]{\thepage}
%       \fancyfoot[LE]{\thepage}
      \renewcommand\headrulewidth{0pt}
      \renewcommand\footrulewidth{0pt}
      %   \setlength{\headrulewidth}{0pt}
      %   \setlength{\footrulewidth}{0pt}
   }
   \fancypagestyle{normal}
   {  % \hbadness 99999
      \vbadness 1000
      \pagestyle{fancy}
%  \fancyhead[RO]{\SeaGreen{\let\uppercase\relax\textsc\leftmark}}
   %   \fancyhead[LO]{\SeaGreen{\let\uppercase\relax\textsc\leftmark}}
   
%       \lhead{}
%       \chead{}
%       \rhead{}
%       \lfoot{}
%       \cfoot{}
%       \rfoot{}
%       \renewcommand\headrulewidth{0pt}
%       \renewcommand\footrulewidth{0pt}
      %   \setlength{\headrulewidth}{0pt}
      %   \setlength{\footrulewidth}{0pt}
      \fancyhead{}
      \fancyfoot{}
      \fancyfoot[C]{\thepage}
%       \fancyfoot[LE]{\thepage}

   }   

%    \fancyhead{}
% %    \fancyhead[RO]{\rightmark}
%    \fancyfoot{}
%    \fancyfoot[RO]{\thepage}
%    \fancyfoot[LE]{\thepage}
   
   % \fancyhead{}
% \fancyhead[LE]{\bf Paper IV}
% \fancyhead[RO]{\bf\flushright \papertitle}
% \fancyfoot{}
% \fancyfoot[RO]{\thepage}
% \fancyfoot[LE]{\thepage}

\fi


	%  \arabic{COUNTER} : The value of COUNTER printed as an arabic numeral.
	%  \roman{COUNTER}  : Its value printed as a lower-case roman numberal.
	%  \Roman{COUNTER}  : Its value printed as an upper-case roman numberal.
	%  \alph{COUNTER}   : Value of COUNTER printed as a lower-case letter:
	%                         1 = a, 2 = b, etc.
	%  \Alph{COUNTER}   : Value of COUNTER printed as an upper-case letter:
	%                           1 = A, 2 = B, etc.
	\newcommand\secspace{\hspace{2pt}}
	
	\ifOPTsecarab
	% \renewcommand{\thesection}{\arabic{section}\secspace}
	\fi
	\ifOPTsecalph
	\renewcommand{\thesection}{\alph{section}\secspace}
	\fi
	\ifOPTsecAlph
	\renewcommand{\thesection}{\Alph{section}\secspace}
	\fi
	\ifOPTsecroman
	\renewcommand{\thesection}{\roman{section}\secspace}
	\fi
	\ifOPTsecRoman
	\renewcommand{\thesection}{\Roman{section}\secspace}
	\fi
	
	\ifOPTsubsecarab
	\renewcommand{\thesubsection}{\thesection.\arabic{subsection}\secspace}
	\fi
	\ifOPTsubsecalph
	\renewcommand{\thesubsection}{\thesection\alph{subsection}\secspace}
	\fi
	\ifOPTsubsecAlph
	\renewcommand{\thesubsection}{\thesection\Alph{subsection}\secspace}
	\fi
	\ifOPTsubsecroman
	\renewcommand{\thesubsection}{\thesection.\roman{subsection}\secspace}
	\fi
	\ifOPTsubsecRoman
	\renewcommand{\thesubsection}{\thesection.\Roman{subsection}\secspace}
	\fi
	
	\ifOPTsubsubsecarab
	% \renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}\secspace}
	\fi
	\ifOPTsubsubsecalph
	\renewcommand{\thesubsubsection}{\thesubsection\alph{subsubsection}\secspace}
	\fi
	\ifOPTsubsubsecAlph
	\renewcommand{\thesubsubsection}{\thesubsection\Alph{subsubsection}\secspace}
	\fi
	\ifOPTsubsecroman
	\renewcommand{\thesubsubsection}{\thesubsection.\roman{subsubsection}\secspace}
	\fi
	\ifOPTsubsecRoman
	\renewcommand{\thesubsubsection}{\thesubsection.\Roman{subsubsection}\secspace}
	\fi


% \renewcommand{\thesubsection}{\thesection\alph{subsection}\hspace{2pt}}
% \renewcommand{\thesubsubsection}{\thesubsection\alph{subsubsection}\hspace{2pt}}

% \titleformat{\subsection}[runin]{\itshape}
% {}%\thesubsubsection}%  {\footnotesize \enspace \emph{Sec.}  }
%   {0pt}{\normalsize\bfseries\filright\textsl}[\mbox{}\hfill\color{SeaGreen}\thesubsection\vspace{0pt}\newline]
% \titlespacing*{\subsection}{0pt}{*2}{*0}


% Section headings formatting:
% \titleformat{\section}[runin]
%   {\begin{pspicture}(330,200)}
%   {\put 
%  \halign{\emph{\color{Black}\large\textit\thesection} &&}%  {\footnotesize \enspace \emph{Sec.}  }
%   {0pt}{\color{Black}\large\bfseries\filright\textsl}}[]
% \titlespacing*{\section}{-25pt}{*4}{*0}
% 
% \titleformat{\section}[runin]{}
% {\put(-10,0){\color{SeaGreen}\Large\emph\thesection}}%  {\footnotesize \enspace \emph{Sec.}  }
%   {0pt}{\color{Black}\Large\bfseries\filright\textsl}[\vspace{15pt}\newline]
% \titlespacing*{\section}{0pt}{*4}{*0}
% 
% \titleformat{\subsection}[runin]{}
% {\emph{\color{SeaGreen}\large\textit\thesubsection}\enspace}%  {\footnotesize \enspace \emph{Sec.}  }
%   {0pt}{\large\bfseries\filright\textsl}[\vspace{15pt}\newline]
% \titlespacing*{\subsection}{0pt}{*2}{*0}

% \titleformat{\subsubsection}[runin]{\itshape}
% {}%\thesubsubsection}%  {\footnotesize \enspace \emph{Sec.}  }
%   {0pt}{\normalsize\bfseries\filright\textsl}[\mbox{}\hfill\color{SeaGreen}\thesubsubsection\vspace{0pt}\newline]
% \titlespacing*{\subsubsection}{0pt}{*2}{*0}
% 
% \titleformat{\paragraph}[runin]{\itshape}
% {}%\theparagraph}%  {\footnotesize \enspace \emph{Sec.}  }
%   {0pt}{\color{SeaGreen}\normalsize\bfseries\filright\textsl}[\vspace{0pt}\newline]
% \titlespacing*{\paragraph}{0pt}{*2}{*0}

%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% FILENAME %
%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\ifOPTvthree
  \newcommand\inputNtag[1]{%
  \immediate\write18{echo "#1" > ./temp/filename.txt}%
  \input{#1}}
\else
  \newcommand\inputNtag[1]{%
  \immediate\write18{echo "#1" > ./Temp/filename.txt}%
  \input{#1}}
\fi    

\ifOPTvthree
  \newcommand\settag[1]{%
  \immediate\write18{echo "#1" > ./temp/filename.txt}}
\else
  \newcommand\settag[1]{%
  \immediate\write18{echo "#1" > ./Temp/filename.txt}}
\fi

%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% GRAPHICS %      
%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\ifOPTvthree%
  \ifOPTbeamer%
  \newcommand<>{\graphicsAI}[2][]{%
    \immediate\write18{./bin/laFigure #2 #1}%
    \exec{echo 'sed -i s/includegraphics/includegraphics#3/ result.tex'}%
    \exec{sed -i s/'includegraphics'/'includegraphics#3'/ result.tex}%
    \input{result}}%
  \else%
  \newcommand\graphicsAI[2][]{%
    \immediate\write18{./bin/laFigure #2 #1}%
    \input{result}}%
  \fi
\else%
  \newcommand\graphicsAI[2][]{%
    \immediate\write18{laFigure #2 #1}%
    \input{result}}%
\fi

\ifOPTvthree
  \ifOPTbeamer%
    \newcommand<>{\graphicsAIlab}[4][]{%
    \labFig{#4}%    
    \immediate\write18{./bin/laFigure #2 #1}%
    \exec{echo 'sed -i s/includegraphics/includegraphics#5/ result.tex'}%
    \exec{sed -i s/'includegraphics'/'includegraphics#5'/ result.tex}%
    \input{result}%
    \caption{#3}}
  \else
    \newcommand\graphicsAIlab[4][]{%
    \labFig{#4}%
    \immediate\write18{./bin/laFigure #2 #1}%
    \input{result}%
    \caption{#3}}
  \fi
\else
  \newcommand\graphicsAIlab[4][]{%
    \labFig{#4}%
    \immediate\write18{laFigure #2 #1}%
    \input{result}%
    \caption{#3}}
\fi

\ifOPTvthree
  \graphicspath{{./gfx}} 
\else
  \graphicspath{{./Graphics}}                     % Folder where graphics are stored
\fi
%~~ TIKZ ~~%
% \usepackage{tikz}
% \usepackage{pgflibraryarrows}
% \usepackage{pgflibrarysnakes}

\newcommand\fref[2][]{%
\immediate\write18{laFixPath #2 #1}\input{result.tex}}%


%%%%%%%%%                                       %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% LISTS %      
%%%%%%%%%                                       %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\ifOPTuiophd\else
	\newenvironment{enumerate0}
	{\begin{enumerate}
	%   \setlength\parskip{\baselineskip}
	% \setlength\abovedisplayskip{0pt}
	% \setlength\belowdisplayskip{0pt}
	% \setlength\abovedisplayshortskip{0pt}
	% \setlength\belowdisplayshortskip{0pt}
	  \setlength{\itemsep}{0pt}
	  \setlength{\parskip}{0.5\baselineskip}
	  \setlength{\parsep}{0pt}}
	% 10pt plus0.3pt minus0.3pt
	{\end{enumerate}}
	
	% \setlength\topsep{0pt}
	% \setlength\partopsep{0pt}
	\newenvironment{itemize0}
	{\begin{itemize}
	% \setlength\abovedisplayskip{0pt}
	% \setlength\belowdisplayskip{0pt}
	% \setlength\abovedisplayshortskip{0pt}
	% \setlength\belowdisplayshortskip{0pt}
	  \setlength{\parindent}{0pt}
	  \setlength{\itemsep}{0pt}
	  \setlength{\parskip}{5pt plus0.3pt minus0.3pt}
	  \setlength{\parsep}{0pt}
	
	%   \renewcommand\indent{}
	%   \renewcommand\parindent{}
	}
	{\end{itemize}}
\fi

%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% GLOSSARY %   
%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\ifOPTglossary
\newcommand\glshypclr[1]{\color{SeaGreen}{#1}\color{Black}}    %Glossary Hyperlink Colour
% \renewcommand{\cleardoublepage}{\clearpage}
\fi

%%%%%%%%%%%%%%%%                                %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% BIBLIOGRAPHY %
%%%%%%%%%%%%%%%%                                %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\ifOPTbibliography
%   \newcommand\bibgroup[1]{\vspace{10pt}\hspace{-8pt}\color{Brown}\textbf{\textsl{#1}}\baseColour\vspace{-10pt}}
\fi



% % 'thebiblipgraphy' is just a list. Redefine to gain some control...
% \renewenvironment{thebibliography}[1]
%    {%\section*{References}
% %     \footnotesize
%     \begin{list}{}{%\setlength{\leftmargin}{\bibindent}
%                    \settowidth\labelwidth{\@biblabel{#1}}
%                    \leftmargin\labelwidth
% %                    \setlength{\itemindent}{-\leftmargin} % ??? Do they want trouble?
%                    \setlength{\itemindent}{0pt}
%                    \setlength{\itemsep}{10pt}
%                    \setlength{\parsep}{\smallskipamount}
%                    \usecounter{enumiv}\renewcommand\theenumiv{}}
%       \sloppy
%       \clubpenalty=4000
%       \widowpenalty=4000
%       \frenchspacing}
%    {\end{list}}
% 
% \let\stdthebibliography\thebibliography
% \bibliographyunit[\subsubsection] % Used by 'bibunits'


%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% CAPTIONS %
%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\ifOPTuiophd
%    %% What you want written under floating objects
%    \captionnamefont{\footnotesize\bf\itshape}
%    \captiontitlefont{\footnotesize\bf\slshape}
%    \captionstyle{}
%    \captiondelim{: }
%    \newcommand\subcaption[1]{{\footnotesize\centering#1}}
% %    \typeout{ -test- }
%    % \setlength{\belowcaptionskip}{-10pt}

\else
\ifOPTuam\else
   %% What you want written under floating objects
   \captionnamefont{\footnotesize\itshape}
   \captiontitlefont{\footnotesize\slshape}
   \captionstyle{\centering}
   \captiondelim{ - }
   \newcommand\subcaption[1]{{\footnotesize\centering#1}}
   \typeout{ -test- }
   % \setlength{\belowcaptionskip}{-10pt}
\fi
\fi

%%%%%%%%%%%%%%%                                 %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% MATHEMATICS %
%%%%%%%%%%%%%%%                                 %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%


%% \newcommand\note[1]{\color{Red}#1\baseColour}
%\newcommand\mathgreen[1]{\color{Green}#1\baseColour}
%\newcommand\mathred[1]{\color{Red}#1\baseColour}
%%~~ MATH MODE MODS ~~%
%% \,  small space 3/18 of a quad
%% \:  medium space  4/18 of a quad
%% \;  large space 5/18 of a quad
%% \!  negative space  -3/18 of a quad
%
%\newcommand\nn{\nonumber\\}
%\renewcommand\-{\text{\scriptsize-}}
%
%\newcommand\nmat[1]{\begin{matrix}#1\end{matrix}}
%\newcommand\bmat[1]{\begin{bmatrix}#1\end{bmatrix}}
%\newcommand\case[1]{\begin{cases}#1\end{cases}}
%\newcommand\textbox[2]{\footnotesize\text{\parbox{#1}{\centering\emph{#2}}}}
%
%\newcommand\rand{\text{rand}}
%\newcommand\randn{\text{randn}}
%\newcommand\rect{\text{rect}}
%\newcommand\sinc{\text{sinc}}
%\newcommand\tr{\text{tr}}
%\newcommand\adj{\text{adj}}
%
%% \newcommand\max{\text{max}}
%% \newcommand\min{\text{min}}
%
%\newcommand\qqquad{\quad\qquad}
%\newcommand\qqqquad{\qquad\qquad}
%
%\renewcommand\l[1]{\left#1}
%\renewcommand\r[1]{\right#1}
%
%% {\text{\parbox{1.5cm}{\centering volume hyper- sphere}}}
%
%%Keyword colouring:
%\newcommand\kw[1]{#1}
%\newcommand\parm[1]{#1}%\color{Black}#1\color{Black}}
%
%\newcommand\of[1]{\scriptstyle(\parm{#1})\displaystyle}
%\newcommand\df[1]{\scriptstyle[\parm{#1}]\displaystyle}
%\newcommand\var[3]{#1_\text{#2}\of{#3}}
%
%\newcommand\diag{\text{diag}}
%
%% \raisebox{lift}[extend-above-baseline][extend-below-baseline]{text}
%\newcommand\mt[1]{\text{\emph{#1}}} %mt = mathtext
%\newcommand\mathnorm{\textstyle}
%\newcommand\mathbig[1]{\displaystyle#1\mathnorm}
%\newcommand\mathsmall[1]{\scriptstyle#1\mathnorm}
%\newcommand\mathtiny[1]{\scriptscriptstyle#1\mathnorm}
%\newcommand\sfrac[2]{\scriptstyle\raisebox{0.25pt}[0pt][0pt]{$\frac{#1}{#2}$}\mathnorm}
%\newcommand\nfrac[2]{\textstyle\frac{#1}{#2}\displaystyle}
%
%\newcommand\sumu[1]{\sum\limits^{#1}\,}
%\newcommand\suml[1]{\sum\limits_{#1}\,}
%\newcommand\sumb[2]{\sum\limits_{#1}^{#2}\,}
%
%\newcommand\produ[1]{\prod\limits^{#1}\,}
%\newcommand\prodl[1]{\prod\limits_{#1}\,}
%\newcommand\prodb[2]{\prod\limits_{#1}^{#2}\,}
%
%%Math macros:
%\newcommand\diff[2]{\frac{\kw{d}\,\textstyle #1\scriptstyle}{\kw{d\parm{#2}}}\displaystyle}
%\newcommand\ddiff[2]{\frac{\kw{d^2}\,\displaystyle #1\scriptstyle}{\kw{d\parm{#2}}^2}\displaystyle}
%
%\renewcommand\d[1]{\scriptstyle\kw{\,d\parm{#1}}\displaystyle}
%
%% These commands are mutually exclusive. Remember to "renew" in v2.
%\ifOPTvtwo
%  \newcommand\intb[4]{\int\limits_{#3}^{#4} #1 \d{#2}} % \int{exp}{var}{from}{to}
%  \newcommand\intl[3]{\int\limits_{#3} #1 \d{#2}} % \int{exp}{var}{for all}
%  \newcommand\intu[2]{\int #1 \d{#2}} % \int{exp}{var}{for all}
%%   \newcommand\intu[2]{\int #1\, \scriptstyle\kw{d\parm{#2}}\displaystyle} % \int{exp}{var}{for all}  
%\else %v1:
%  \newcommand\intb[4]{\int\limits_{#2}^{#3} #4\, \scriptstyle\kw{d\parm{#1}}\displaystyle} % \int{var}{from}{to}{exp}
%  \newcommand\intl[3]{\int\limits_{#2} #3\, \scriptstyle\kw{d\parm{#1}}\displaystyle} % \int{var}{for all}{exp}
%  \newcommand\intu[2]{\int #2\, \scriptstyle\kw{d\parm{#1}}\displaystyle} % \int{var}{for all}{exp}
%  \newcommand\intt[4]{\int\limits_{#3}^{#4} #1\, \scriptstyle\kw{d\parm{#2}}\displaystyle} % deprecated - use \intb
%\fi
%
%
%\ifOPTxelatex
%   \renewcommand\T{^{\scriptscriptstyle T}}
%\else
%   \newcommand\T{^{\scriptscriptstyle T}}
%\fi
%\renewcommand\H{^{\scriptscriptstyle H}}
%
%\renewcommand\vec[1]{\boldsymbol{#1}}
%\newcommand\mat[1]{\boldsymbol{#1}}


% \renewcommand*\a{\vec a}
% \renewcommand*\i{\vec i}
% \renewcommand*\k{\vec k}
% \newcommand*\n{\vec n}
% \newcommand*\p{\vec p}
% \newcommand*\s{\vec s}
% \newcommand*\w{\vec w}
% \newcommand*\x{\vec x}

% \newcommand*\A{\mat A}
% \renewcommand*\B{\mat B}
% \renewcommand*\C{\mat C}
% \newcommand*\E{\mat E}
% \renewcommand*\H{\mat H}
% \renewcommand*\P{\mat P}
% \newcommand*\eP{\mat{\hat P}}
% \newcommand*\R{\mat R}
% \newcommand*\Ri{\R^{-1}}
% \newcommand*\eR{\mat{\hat R}}
% \newcommand*\W{\mat W}
% \newcommand*\X{\mat X}
% \newcommand*\Y{\mat Y}

% \renewcommand*\L{\mat \Lambda}
% \renewcommand*\U{\mat U}
% \renewcommand*\t{\mathtiny{^T}}
% \newcommand*\h{\mathtiny{^H}}
% \renewcommand*\t{^T}
% \newcommand*\h{^H}

% \newcommand\D{\vec\nabla} %Del: Vector differential operator - nabla
% \newcommand\Dx{\vec\nabla\times}
% \newcommand\Dd{\vec\nabla\cdot}







%%%%%%%%                                        %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% SI++ % 
%%%%%%%%                                        %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\newcommand\uns{$\,$} % uns = unit spacing :)
%~~ SI System Base Units & Prefix ~~%
%~~ (as defined by the International System of Units) ~~%
% \newcommand{\km}{km}
% \newcommand{\m}{m}                %Meter
% \newcommand{\mm}{mm}
% \newcommand{\um}{{$\mu$}m}
% \newcommand{\nm}{nm}
% \newcommand{\kg}{kg}              %kiloGrams
% \newcommand{\s}{s}                %Seconds
\newcommand{\ms}{ms}
\newcommand{\us}{{$\mu$}s}
\newcommand{\ns}{ns}
\newcommand{\ps}{ps}
% \newcommand{\A}{A}                %Ampere
% \newcommand{\mA}{mA}
% \newcommand{\uA}{{$\mu$}A}
% \newcommand{\nA}{nA}
% \newcommand{\K}{K}                %Kelvin
% \newcommand{\mK}{mK}
% \newcommand{\mol}{mol}            %mol
% \newcommand{\cd}{cd}              %cd (luminosity)
% 
% %~~ SI System Derived Units & Prefix ~~%
% %~~ (as defined by the International System of Units) ~~%
% 
% \newcommand{\Hz}{\uns Hz}              %Hertz                                        [1/s]
% \newcommand{\kHz}{\uns kHz}            %kiloHertz
% \newcommand{\MHz}{\uns MHz}            %megaHertz
% \newcommand{\GHz}{\uns GHz}            %gigaHertz
% \newcommand{\N}{N}                %Newton                                       [m*kg/s^2]
% \newcommand{\Pa}{Pa}              %Pressure (pascal)                            [N/m^2]
% \newcommand{\GJ}{GJ}
% \newcommand{\MJ}{MJ}
% \newcommand{\kJ}{kJ}
% \newcommand{\J}{J}                %Energy (joule)                               [N*m]
% \newcommand{\W}{W}                %Power (watt)                                 [J/s]
% % \newcommand{\C}{C}                %Electric charge (coulomb)                    [s*A]
% \newcommand{\V}{V}                %Volt(age)                                    [W/A=J/C]
% \newcommand{\mV}{mV}              %milliVolt
% \newcommand{\uV}{{$\mu$}V}        %microVolt
% \newcommand{\nV}{nV}              %nanoVolt
% \newcommand{\nF}{nF}              %Electric Capacitance (farad)                 [C/V]
% \newcommand{\uF}{$\mu$F}          %Electric Capacitance (farad)                 [C/V]
% \newcommand{\mF}{mF}               %Electric Capacitance (farad)                 [C/V]
% \newcommand{\F}{F}                %Electric Capacitance (farad)                 [C/V]
% \newcommand{\ohm}{$\Omega$}       %Electric Resistance (ohm)                    [V/A]
% \newcommand{\kohm}{k$\Omega$}     %Electric Resistance (ohm)                    [V/A]
% \newcommand{\Mohm}{M$\Omega$}     %Electric Resistance (ohm)                    [V/A]
% \renewcommand{\S}{S}              %Electrical Conductance (siemens)             [1/ohm]
% \newcommand{\Wb}{\Wb}             %Magnetic Flux (weber)                        [J/A]
% % \newcommand{\T}{\T}               %Magnetic Field (tesla)                       [V*s/m^2=Wb/m^2=N/A*m]
% \renewcommand{\H}{\H}             %Inductance (henry)                           [V*s/A=Wb/A]
% \newcommand{\oC}{{$^\circ$}C}     %Degree Celsius (celsius)                     [K-273.15]
% \renewcommand{\Im}{\Im}           %Luminus Flux (lumen)                         [cd*sr]
% \newcommand{\Ix}{\Ix}             %Illuminance (lux)                            [Im/m^2]
% \newcommand{\Bq}{\Bq}             %Radioactivity (becquerel)                    [1/s]
% \newcommand{\Gy}{\Gy}             %Absorbed Dose Ionizing Radiation (gray)      [J/kg]
% \newcommand{\Sv}{\Sv}             %Equivalent Dose Ionizing Radiation (sievert) [J/kg]
% \newcommand{\kat}{\kat}           %Catalytic Activity (katal)                   [mol/s]
% 
% %~~ Some Units Defined by IEEE 1541 ~~%
% \renewcommand{\b}{b}              %Bit
% \newcommand{\kb}{kb}
% \newcommand{\Mb}{Mb}
% \newcommand{\Gb}{Gb}
% \newcommand{\B}{B}                %Byte
% \newcommand{\kB}{kB}
% \newcommand{\MB}{MB}
% \newcommand{\GB}{GB}
% 
% %~~ Other Units ~~%
% \newcommand{\eV}{\uns eV}
% \newcommand{\keV}{\uns keV}
% \newcommand{\MeV}{\uns MeV}
% \newcommand{\GeV}{\uns GeV}
% \newcommand{\TeV}{\uns TeV}
% 
% \newcommand{\Gbps}{Gbps}
% \newcommand{\Mbps}{Mbps}
% \newcommand{\kbps}{kbps}
% \newcommand{\bps}{bps}
% 
% %~~ Some Common Symbols ~~%
% 
% \newcommand{\sT}{\textit{T}}      %Period                                       [s]
% \newcommand{\sF}{\textit{F}}      %Frequency                                    [1/s]
% 
% \newcommand{\grad}{$^\circ$}
% \newcommand{\degree}{$^\circ$}
% % \newcommand{\deg}{$^\circ$}
% \newcommand{\ca}{$\approx$}

%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% FORMATTING % 
%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

%~~ REFERENCING ~~%                             (use instead of \label)
\newcommand\labFig[1]{\refstepcounter{figure}\label{#1}\addtocounter{figure}{-1}}
\newcommand\labTab[1]{\refstepcounter{table}\label{#1}\addtocounter{table}{-1}}
\newcommand\labSec[1]{\refstepcounter{section}\label{#1}\addtocounter{section}{-1}}

%~~ LAYOUT ~~%
% \ifOPTbeamer
   \newenvironment{narrow}[2]{%
   \begin{list}{}{%
   \setlength{\topsep}{0pt}%
   \setlength{\leftmargin}{#1}%
   \setlength{\rightmargin}{#2}%
   \setlength{\listparindent}{\parindent}%
   \setlength{\itemindent}{\parindent}%
   \setlength{\parsep}{\parskip}}%
   \item[]}{\end{list}}
% \else
%    \renewenvironment{narrow}[2]{%
%    \begin{list}{}{%
%    \setlength{\topsep}{0pt}%
%    \setlength{\leftmargin}{#1}%
%    \setlength{\rightmargin}{#2}%
%    \setlength{\listparindent}{\parindent}%
%    \setlength{\itemindent}{\parindent}%
%    \setlength{\parsep}{\parskip}}%
%    \item[]}{\end{list}}
% \fi

\ifOPTstdclass
	% \hbadness=10000                                 %Disables "underfull hbox" infomessages.
	\typeout{====Are these options evaluated???====}
	%% Numbering depth
	\setcounter{tocdepth}{4}       % Depth of numbering in the TOC (1.1.1)
	\setcounter{secnumdepth}{3}    % Depth of numbering in the document (1.1.1)
	 
	%% Define "size" of a length
	\setlength{\unitlength}{1mm}
	
	\fussy  % Options: fussy, sloppy
	%% 
	\clubpenalty=10000
	%% 
	\widowpenalty=10000 
	%% 
	\displaywidowpenalty=10000
	%% 
	\adjdemerits=10000
	 
	\hfuzz=1pc % Don't bother to report overfull boxes if over-edge is < 1pc
	\vfuzz=1pc % Don't bother to report overfull boxes if over-edge is < 1pc
\fi

%%%%%%%%%%%%%
%% DUMMIES %%
%%%%%%%%%%%%%

\newcommand\even{}


% With pdflatex: to say one thing, copy paste anohter
%      \bgroup
%        \lccode`!=`\\
%        \lowercase{\gdef\esc{!!}}
%      \egroup
% 
%      You can easily write equations such as
%      \pdfliteral direct {%
%        /Span <<
%         /ActualText (This is cool)%(\esc( \esc sum_{i=1}^{n}i = \esc frac{1}{2}n \esc cdot (n+1) \esc))
%        >>
%        BDC
%      }
%      hello
% %      $\sum_{i=1}^{n}i=\frac{1}{2}n\cdot(n+1)$
%      \pdfliteral direct {%
%        EMC
%      }
%      in \LaTeX. 

\typeout{====End mytemplate.cls====}
