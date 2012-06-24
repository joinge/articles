% Opening remarks:
%
% This is a template for the Underwater Acustic Measurements (UAM) conference articles, based on
% the specifications supplied in:
%   http://www.uam-conferences.org/_docs/UAM2011_Paper_Template.doc
% 
% Since this file contains style commands only, and you'd probably want your own set of commands
% to go with it, I suggest creating another stylefile to keep your commands in, and load this file
% from within that style file:
%
% In top.tex:
%   \documentclass[ <comma separated list of options> ]{ mystyle.cls }
%
% In mystyle.cls:
%   \NeedsTeXFormat{ LaTeX2e }
%   \ProvidesClass{ mystyle.cls }[ <some comment, author perhaps?> ]
%   \typeout{-- loading mystyle.cls }
%   \def\@bdoctype{ uam }
%   \LoadClass{ \@bdoctype }
%   ...
%   <add packages, commands and whatever..>
%
%   ****************
%   ** IMPORTANT! **
%   ****************
%   Edit the \ProvidesClass{ <path> }[ <comment> ] line to ensure the path correctly speficies
%   the whereabouts of this file, preferrably relative to the directory where the latex-compiler
%   is called.
%
%
%    --CHANGELIST--
%
%    When?         Who?                What?
%    2011/03/07    Jo Inge Buskenes    File just created.
%
%

\NeedsTeXFormat{LaTeX2e}

% IMPORTANT! Change the path here to match your system!
\ProvidesClass{uam}[2011/03/07 Jo Inge Buskenes]
\typeout{-- loading uam.cls}


% Default version number is most recent. Redefine in document to use features in
% older versions only.
\def\@version{1}

% Changelog:
% Version 1 - Initial version.


% These do nothing, but provide them like in article.cls
\newif\if@restonecol
\newif\if@titlepage


%%%%%%%%%%%%%%%%                                %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% CONDITIONALS %
%%%%%%%%%%%%%%%%                                %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% Conditionals            (& default value)
\newif\ifOPTvone          \OPTvonefalse
\newif\ifOPTvlatest       \OPTvlatesttrue

\newif\ifOPTxelatex       \OPTxelatexfalse      % Use XeLaTeX compiler instead of PdflLaTeX?
\newif\ifOPTbibtex        \OPTbibtexfalse       % Add references using Bibtex?
\newif\ifOPTbiblatex      \OPTbiblatexfalse     % Add references using BibLatex (better)? 
\newif\ifOPTbibliography  \OPTbibliographyfalse % True if either of the two above is specified

% Remember to enable all versions prior to the one given
\ifOPTvlatest\OPTvonetrue\fi



%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% PARAMETERS %
%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%


% This style file is based on the article class
\def\@bdoctype{article}

% Send UAM approved parameters to the 'article' class
\PassOptionsToClass{12pt}{\@bdoctype}
\PassOptionsToClass{a4paper}{\@bdoctype}
\PassOptionsToClass{oneside}{\@bdoctype}
\PassOptionsToClass{openany}{\@bdoctype}
\DeclareOption{final}{\PassOptionsToClass{final}{\@bdoctype}}
\DeclareOption{draft}{\PassOptionsToClass{draft}{\@bdoctype}}
\PassOptionsToClass{onecolumn}{\@bdoctype}
\PassOptionsToClass{leqno}{\@bdoctype}
\PassOptionsToClass{fleqn}{\@bdoctype}
\DeclareOption{openbib}{\PassOptionsToClass{openbib}{\@bdoctype}}

% Modify the conditionals according to user specified parameters
\DeclareOption{v1}{\OPTvonetrue\OPTvlatesttrue}
\DeclareOption{xelatex}{\OPTxelatextrue}
\DeclareOption{bibtex}{  \OPTbibliographytrue\OPTbibtextrue}
\DeclareOption{biblatex}{\OPTbibliographytrue\OPTbiblatextrue} % Part of texlive-bibtexextra-2010


% Process all the parameters
\ProcessOptions

% Load the standard document class
\LoadClass{\@bdoctype}


%==========%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% PACKAGES %
%==========%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% I am not sure why, but the AMS stuff must precede the fontspec package

\RequirePackage[fleqn]{amsmath}
\RequirePackage{amssymb}

\ifOPTxelatex%
  \typeout{-- XeLaTeX specified, loading fontspec package}%
  \RequirePackage{fontspec}%               % Provides font selecting commands
\else%
  \typeout{-- PdfLaTeX specified, loading inputenc and fontenc}%
  \RequirePackage[utf8]{inputenc}%              % Set input encoding (optionally latin1)
  \RequirePackage[T1]{fontenc}%                 % Set font encoding
\fi


%========%                                      %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% LAYOUT %                                       Note! These values may be read from outside Latex
%========%                                      %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\setlength\baselineskip{12pt}

\setlength\hoffset{0pt}

% Adding the 2cm gutter width to the odd/even side margins:
\setlength\oddsidemargin{2cm}                %Applies to all pages in one-page setups.
\setlength\evensidemargin{2cm}               %Only applies in two-page setups.

\setlength\textwidth{21cm}                   % A4 width
\addtolength\textwidth{-2in}                 % Subtract margins
\addtolength\textwidth{-2cm}                 % Subtract gutter
\setlength\linewidth{\textwidth}

\setlength\textheight{29.7cm}                % A4 height
\addtolength\textheight{-2in}                 % Subtract margins

\setlength\parindent{0.5cm}                       %Indent first line in each paragraph?
% \setlength\columnseprule{11pt}
\setlength\parskip{0pt}%12pt plus0.3pt minus0.3pt}
%     \setlength\parskip{10pt%                         % baseskip
%                      plus.5\baselineskip%          % amount of stretch
%                      minus.3\baselineskip}          % pickyness on underfull vbox
                                 

% Setting all these to zeros leaves just 1in margin, just what we want
\setlength\headsep{0pt}
\setlength\headheight{0pt}
\setlength\voffset{0pt}
\setlength\topsep{0pt}
\setlength\topmargin{0pt}

% \setlength\topmargin{2cm}


% \setlength\headsep{\baselineskip}
% \setlength\voffset{0pt}
% \setlength\topmargin{1cm}
%    \addtolength\topmargin{-\headheight}
%    \addtolength\topmargin{-\headsep}
% \setlength\textwidth{100pt}
% \setlength\footskip{80\baselineskip}
% \setlength\marginparpush{0pt}
% \setlength\marginparsep{0pt}
% \setlength\marginparwidth{0pt}

\newlength{\realwidth} % Just sometimes handy to have a copy of the initial linewidth available
\setlength\realwidth{\linewidth}

% From ccaption doc:  The actual space between the bottom of the illustration and the baseline of
% the ﬁrst line of the caption is the \abovecaptionskip plus the \parskip plus the \baselineskip.
\setlength\abovecaptionskip{0pt} % Since \parskip=0pt and \baselineskip=12pt, this is ok.
\setlength\belowcaptionskip{0pt}

\setlength\abovedisplayskip{0pt}
\setlength\belowdisplayskip{0pt}
\setlength\abovedisplayshortskip{0pt}
\setlength\belowdisplayshortskip{0pt}

   % \setlength\partopsep{-\topsep}
   % \addtolength\partopsep{-\parskip}

   % \setlength\partopsep{-\topsep}
   % \addtolength\partopsep{-\parskip}

   % \raggedbottom
   \flushbottom



\ifOPTxelatex
   \setromanfont{Times New Roman}
\else
   \RequirePackage{times}
\fi

%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% CAPTIONS %
%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\RequirePackage{ccaption}                       % For customised captions

% What you want written under floating objects

\renewcommand*\figurename{Fig.}                 % Utterly stupid, I know, but
\renewcommand*\tablename{Table}                 % this is according to specs...
\captiondelim{: }
\captionnamefont{\itshape}
\captiontitlefont{\slshape}
\captionstyle{\centering}

% \setlength{\belowcaptionskip}{-10pt}



%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% HEADERS %
%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\RequirePackage{titlesec}
% \titleformat{<command>}[<shape>]{<format}{<label>}{<sep>}{<before>}[<after>]

\titleformat{\section}[runin]{\bf}
{\thesection.\enspace}%\thesubsubsection}%  {\footnotesize \enspace \emph{Sec.}  }
   {0pt}{\uppercase}[\newline]
\titlespacing*{\section}{0pt}{2\baselineskip}{0pt}

\titleformat{\subsection}[runin]{\bf}
{\thesubsection\enspace}%\thesubsubsection}%  {\footnotesize \enspace \emph{Sec.}  }
   {0pt}{}[\newline]
\titlespacing*{\subsection}{0pt}{2\baselineskip}{0pt}

\titleformat{\subsubsection}[runin]{\bf}
{\thesubsubsection\enspace}%\thesubsubsection}%  {\footnotesize \enspace \emph{Sec.}  }
   {0pt}{}[\newline]
\titlespacing*{\subsubsection}{0pt}{2\baselineskip}{0pt}

\titleformat{\paragraph}[runin]{\bf\itshape}
{\itshape}%\thesubsubsection}%  {\footnotesize \enspace \emph{Sec.}  }
   {0pt}{\itshape}[:\enspace]
\titlespacing*{\paragraph}{0pt}{2\baselineskip}{*0}


%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% HEADERS %
%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% Headers and footers are not allowed...
\RequirePackage{fancyhdr}

\fancypagestyle{plain}{
   \fancyhf{}
   \renewcommand{\headrulewidth}{0pt}
   \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{empty}{
   \fancyhf{}
   \renewcommand{\headrulewidth}{0pt}
   \renewcommand{\footrulewidth}{0pt}
}

\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}


%%%%%%%%%%%%%%%%%%%                             %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% FRONTPAGE STUFF %
%%%%%%%%%%%%%%%%%%%%                            %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\renewcommand\title[1]{{%
\setlength\parindent{0pt}
\parbox{\textwidth}{\vspace{8\baselineskip}{%
\centering\fontsize{14pt}{14pt}\bf\uppercase{#1}}}}}

\newcommand\firstAddress{$^a$}
\newcommand\secondAddress{$^b$}
\newcommand\thirdAddress{$^c$}

\renewcommand\author[1]{{%
   \par%
   \vspace{4\baselineskip}%
   \setlength\parindent{0pt}%
   #1%
}}

\newenvironment{contact}[1]{{%
   \par%
   \vspace{2\baselineskip}
   \setlength\parindent{0pt}
   #1%
}}{}

\renewenvironment{abstract}[1]{%
   \par%
   \paragraph*{Abstract}\itshape%
   #1%
}{}

\newcommand\keywords[1]{{%
   \paragraph*{Keywords}\itshape%
   #1%
}}


%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% REFERENCES % 
%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%


\ifOPTxelatex
   \RequirePackage[xetex]{hyperref}
\else
   \RequirePackage{hyperref}
\fi

%~~ HYPERREF ~~%
\hypersetup{
   breaklinks=true,                             % Break links when necessary
 , linktocpage=true                             % Enable link to page?
 , linkcolor=blue                          % Colour of links to labels within document
 , citecolor=blue                              % Colour of links to the biliography
 , filecolor=red                                % Colour of links to local files
 , urlcolor=blue                            % Colour of the links to external URLs
 , colorlinks=true                              % ??
 , plainpages=false                             % Store roman/arabic numbering differently to avoid
                                                % ``duplicate'' warning.
  , final
%  , bookmarksopen=true
%  , bookmarksopenlevel=3
%  , bookmarks=true
 , bookmarksnumbered }                          % Have the bookmarks numbered.


% Regarding that F#!!%! space between the reference heading and 'thebibliography', when the 
% below don't work (yes, I'm aware that this is a far fetch) I'm all out of ideas... 
\let\oldthebibliography=\thebibliography
\renewenvironment{thebibliography}[1]%
{\begin{oldthebibliography}{#1}
   \setlength\itemsep{0pt}
   \setlength\parskip{0pt}
   \setlength\parsep{0pt}}
{\end{oldthebibliography}}
\renewcommand*{\refname}{}

\ifOPTbiblatex
  \RequirePackage[url=false, defernums=true]{biblatex}

   \newcommand\printreferences{{%
      % Remove the header name (we'll make it manually)
      \defbibheading{bibheader}{}

      % Find the excess space between heading and bibliography entries (trial and error)
      \newlength\excess
      \setlength\excess{2\baselineskip}
%       \addtolength\excess{12pt}

      \addcontentsline{toc}{section}{References}
      \section*{References}\ \par\vspace{-\excess}
      \printbibliography[heading=bibheader]
   }}
\fi

\ifOPTbibtex
   \newcommand\printreferences{%
      % Remove the header name (we'll make it manually)
      \renewcommand\refname{}

      % Find the excess space between heading and bibliography entries (trial and error)
      \newlength\excess
      \setlength\excess{5\baselineskip}
      \addtolength\excess{11pt}
      \addcontentsline{toc}{section}{References}
      
      \section*{References}\ \par\vspace{-\excess}
      \bibliographystyle{unsrt}}
\fi


%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% FLOATS  %
%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

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

%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% LISTS ETC. %
%%%%%%%%%%%%%%                                  %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\renewenvironment{enumerate}
{\begin{enumerate}
%  \setlength\parskip{\baselineskip}
% \setlength\abovedisplayskip{0pt}
% \setlength\belowdisplayskip{0pt}
% \setlength\abovedisplayshortskip{0pt}
% \setlength\belowdisplayshortskip{0pt}
  \setlength{\itemsep}{0pt}
  \setlength{\parskip}{0.5\baselineskip}
  \setlength{\parsep}{0pt}}
% 10pt plus0.3pt minus0.3pt
{\end{enumerate}}

\renewenvironment{itemize}
{\begin{itemize}
%  \setlength\parskip{\baselineskip}
% \setlength\abovedisplayskip{0pt}
% \setlength\belowdisplayskip{0pt}
% \setlength\abovedisplayshortskip{0pt}
% \setlength\belowdisplayshortskip{0pt}
  \setlength{\itemsep}{0pt}
  \setlength{\parskip}{0.5\baselineskip}
  \setlength{\parsep}{0pt}}
% 10pt plus0.3pt minus0.3pt
{\end{itemize}}


\newenvironment{narrow}[2]{%
\begin{list}{}{%
\setlength{\topsep}{0pt}%
\setlength{\leftmargin}{#1}%
\setlength{\rightmargin}{#2}%
\setlength{\listparindent}{\parindent}%
\setlength{\itemindent}{\parindent}%
\setlength{\parsep}{\parskip}}%
\item[]}{\end{list}}


%%%%%%%%%%%%%%%                                 %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% OTHER STUFF %
%%%%%%%%%%%%%%%                                 %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

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
