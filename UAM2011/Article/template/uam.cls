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
%    2011/04/13        -- || --        Bunch of bug-fixes.
%    2011/04/24        -- || --        Reworked the itemize and enumerate environments
%    2011/04/26        -- || --        Added single line spacing between floats and text
%    2011/04/27        -- || --        Fixed title, reworked layout to accomodate 1inch
%                                      margins, and fixed interline and header spacings
%
%
%    --KNOWN BUGS--
%    * Spacing between a float and a following header is only one line, while it probably
%      should have been two lines according to template. Not sure how to redefine this
%      without also affecting the separation between floats and text. Perhaps I could
%      introduce a new hook after the floats and define the header commands to use it..
%      Will leave it 'as is' for the time being. It probably will not even be noticed,
%      and can easily be fixed manually with e.g. \vspace*{..} if desired.

\NeedsTeXFormat{LaTeX2e}

% IMPORTANT! Change the path here to match your system! E.g. ProvidesClass{./somefolder/uam}[...]
\ProvidesClass{uam}[2011/04/24 Jo Inge Buskenes]
\typeout{-- loading uam.cls}


% Default version number is most recent. Redefine in document to use features in
% older versions only (not implemented yet, backward compability takes too much time).
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
% \PassOptionsToClass{openany}{\@bdoctype}
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



\ifOPTxelatex
   \setromanfont{Times New Roman}
\else
   \RequirePackage{times}
\fi


\RequirePackage{ccaption}                       % For customised captions


%========%                                      %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% LAYOUT %                                       Note! These values may be read from outside Latex
%========%                                      %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% From Word template:
%           Top:     Bottom:  Left:    Right:   Gutter:           
% Margins   2cm      3cm      1.6cm    2cm      2cm
%
% => i.e. total horisontal margin = 1.6cm + 2*2cm = 5.6cm
%    and  total vertical   margin = 2cm + 3cm = 5cm

% BUT, from the information on the last page of the template:
% "The Paper format should be A4. All margins should be set-up to the value of 2.54 cm."
%
% => i.e. total horisontal margin = 2*2.54cm = 5.08cm
%    and  total vertical   margin = 2*2.54cm = 5.08cm

% I'm going to use the 1 inch (2.54cm) margins. There are two reasons for this:

% (1)
% From the Word template we can read:
% "Styles of the following fields are predefined when loading this document from the
% conference website:
% 
% * Paper title
% * (list goes on, but does NOT mention margins!!!"

% (2)
% The proceedings from 2009 - which may be found online - use 2.54cm margins.



% Let's just create a conditional to make it simple to switch should it be necessary.
\newif\ifOPToneinchmargins\OPToneinchmarginstrue

% Page layout:
\setlength\paperwidth{21cm}                  % As Word defines A4
\setlength\paperheight{29.7cm}               % As Word defines A4


\ifOPToneinchmargins

   % Left margin = 1 inch + hoffset + oddsidemargin (or evensidemargin)
   \setlength\hoffset{0pt}
   \setlength\oddsidemargin{0pt}                % Applies to all pages in one-page setups.
   \setlength\evensidemargin{0pt}               % Only applies in two-page setups.

   % Top margin = 1 inch + voffset + topmargin + headheight + headsep
   \setlength\voffset{0pt}
   \setlength\topmargin{0pt}
   \setlength\headheight{0pt}                   % Header height   
   \setlength\headsep{0pt}                      % Distance between header and text

   % Let's see what is left for text then...
   \setlength\textwidth{\paperwidth}            % A4 width
   \addtolength\textwidth{-2in}                 % Subtract margins
   \setlength\linewidth{\textwidth}             % linewidth=textwidth

   \setlength\textheight{\paperheight}          % A4 height
   \addtolength\textheight{-2in}                % Subtract margins

\else

   % Left margin = 1 inch + hoffset + oddsidemargin (or evensidemargin)
   % Adding the 2cm gutter width to the odd/even side margins:
   \setlength\hoffset{0pt}
   \setlength\oddsidemargin{1.6cm}              % Word defined margin
   \addtolength\oddsidemargin{2cm}              % Word defined gutter
   \addtolength\oddsidemargin{-1in}             % Subtract the initial 1 inch

   % Repeating for evensidemargin, even if there's strictly no need to since the
   %'oneside' option is specified.
   \setlength\evensidemargin{1.6cm}             % Word defined margin
   \addtolength\evensidemargin{2cm}             % Word defined gutter
   \addtolength\evensidemargin{-1in}            % Subtract the initial 1 inch

   % Top margin = 1 inch + voffset + topmargin + headheight + headsep
   % For a 2cm topmargin we'll need to set either voffset or topmargin to 2cm-1inch.
   % Latex seems to complain less if we do the latter
   \setlength\voffset{0pt}
   \setlength\topmargin{2cm}
   \addtolength\topmargin{-1in}
   \setlength\headheight{0pt}                   % Header height   
   \setlength\headsep{0pt}                      % Distance between header and text

   % Let's see what is left for text then...
   \setlength\textwidth{\paperwidth}            % A4 width
   \addtolength\textwidth{-1.6cm}               % Subtract left margin
   \addtolength\textwidth{-2cm}                 % Subtract gutter
   \addtolength\textwidth{-2cm}                 % Subtract right margin
   \setlength\linewidth{\textwidth}             % linewidth=textwidth

   \setlength\textheight{\paperheight}          % A4 height
   \addtolength\textheight{-2cm}                % Subtract topmargin
   \addtolength\textheight{-3cm}                % Subtract bottommargin
\fi

% \setlength\baselineskip{12pt}                   % Height of a single line
% \selectfont

% \selectfont
% \setlength\lineskip{0pt}
\newlength\lineheight
\setlength\lineheight{12pt}
\renewcommand\baselinestretch{1.15}
\AtBeginDocument{%
\fontsize{\lineheight}{\lineheight}\selectfont%
}
% \renewcommand\normalsize{\fontsize{12pt}{12pt}} % Just to be paranoid
% 
\selectfont

\setlength\parindent{0.5cm}                     % Indentation of the first line in a paragraph
\setlength\parskip{0pt}                         % Vertical distance between paragraphs. No rubber length,
                                                % but this can be specified e.g. like this:
% \setlength\parskip{10pt%                      % baseskip
%                plus.5\baselineskip%           % amount of stretch
%                minus.3\baselineskip}          % pickyness on underfull vbox
                                 



% The footer will not be used, I guess? I'll just set some sane length here anyways  
\setlength\footskip{3\baselineskip} % Distance from bottom of text to (bottom of) footer

% \setlength\columnsep{5pt} % column separation (not used here)

\setlength\marginparsep{5pt}     % Space between text and margin notes
\setlength\marginparwidth{2cm}   % Margin width
\setlength\marginparpush{0pt}    % hmm, no idea.. spacings between margin notes perhaps?


% Floats (tables and figures)
\setlength\floatsep{0pt}      % space left between floats.
\setlength\textfloatsep{\baselineskip}  % space between last top float or first bottom float and the text.
\setlength\intextsep{\baselineskip}     % space left on top and bottom of an in-text float.
% \setlength\dbltextfloatsep is \textfloatsep for 2 column output.
% \setlength\dblfloatsep is \floatsep for 2 column output.

% Maths:
\setlength\abovedisplayskip{0pt} % space before maths
\setlength\belowdisplayskip{0pt} % space after maths
\setlength\arraycolsep{0pt}      % gap between columns of an array

% Not sure what the short-skips are for, setting them to zero too..
\setlength\abovedisplayshortskip{0pt}
\setlength\belowdisplayshortskip{0pt}

% Lists:
\setlength\topsep{0pt}     % space between first item and preceding paragraph.
\setlength\partopsep{0pt}  % extra space added to \topsep when environment starts a new paragraph.
\setlength\itemsep{0pt}    % space between successive items.

% From ccaption doc:  The actual space between the bottom of the illustration and the baseline of
% the first line of the caption is the \abovecaptionskip plus the \parskip plus the \baselineskip.
\setlength\abovecaptionskip{0pt} % Since \parskip=0pt and \baselineskip=12pt, this is ok.
\setlength\belowcaptionskip{\baselineskip}

% Remove spaces introduced by legends
% \setlength\abovelegendskip{0pt}
% \setlength\belowlegendskip{0pt}


%\flushbottom

%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% CAPTIONS %
%%%%%%%%%%%%                                    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
 
% What you want written under floating objects
\renewcommand*\figurename{Fig.}                 % Utterly stupid, I know, but
\renewcommand*\tablename{Table}                 % this is according to specs...
\captiondelim{: }
\captionnamefont{\itshape}
\captiontitlefont{\slshape}
\captionstyle{\centering}


%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% HEADERS %
%%%%%%%%%%%                                     %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\RequirePackage{titlesec}
% \titleformat{<command>}[<shape>]{<format}{<label>}{<sep>}{<before>}[<after>]

\titleformat{\section}[hang]{\bf}
{\thesection.\enspace}%\thesubsubsection}%  {\footnotesize \enspace \emph{Sec.}  }
   {0pt}{\MakeUppercase}[]
\titlespacing*{\section}{0pt}{2\lineheight}{\lineheight}

\titleformat{\subsection}[hang]{\bf}
{\thesubsection\enspace}%\thesubsubsection}%  {\footnotesize \enspace \emph{Sec.}  }
   {0pt}{}[\newline\newline]
\titlespacing*{\subsection}{0pt}{2\lineheight}{0pt}

\titleformat{\subsubsection}[runin]{\bf}
{\thesubsubsection\enspace}%\thesubsubsection}%  {\footnotesize \enspace \emph{Sec.}  }
   {0pt}{}[\newline]
\titlespacing*{\subsubsection}{0pt}{2\lineheight}{0pt}

% \titleformat{\paragraph}[runin]{\bf\itshape}
% {\itshape}%\thesubsubsection}%  {\footnotesize \enspace \emph{Sec.}  }
%    {0pt}{\itshape}[:\enspace]
% \titlespacing*{\paragraph}{0pt}{2\baselineskip}{*0}


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
\setlength\parindent{0pt}%
\parbox[t]{\linewidth}{\vspace{8\lineheight}}\\[-\baselineskip]%%
\parbox[t]{\linewidth}{\centering%
\fontsize{14pt}{14pt}\bf\uppercase{#1}}}}

\newcommand\firstAddress{$^a$}
\newcommand\secondAddress{$^b$}
\newcommand\thirdAddress{$^c$}

\renewcommand\author[1]{{%
   \par\vspace{4\lineheight}%
   \setlength\parindent{0pt}%
   #1%
}}

\newenvironment{contact}[1]{{%
   \par\vspace{2\lineheight}%
   \setlength\parindent{0pt}%
   #1%
}}{}

\renewenvironment{abstract}[1]{%
   \par\vspace{\lineheight}%
   \paragraph*{\itshape Abstract:}\itshape%
   #1%
}{}

\newcommand\keywords[1]{{%
   \par\vspace{\lineheight}%
   \paragraph*{\itshape Keywords:}\itshape%
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
   
   \newcommand\printreferences[1]{{
      % Remove the header name (we'll make it manually)
      \defbibheading{bibheader}{}

      % Find the excess space between heading and bibliography entries (trial and error)
      \newlength\excess
      \setlength\excess{\lineheight}
%       \addtolength\excess{12pt}

      \addcontentsline{toc}{section}{References}
      \section*{References}\ \par\vspace{-\excess}
      \printbibliography[heading=bibheader]
   }}
\fi

\ifOPTbibtex
      \let\oldbibliography=\bibliography
      
      \renewcommand\bibliography[1]{{

         % Remove the header name (we'll make it manually)
         \renewcommand\refname{}

         % Find the excess space between heading and bibliography entries (trial and error, and educated guess)
         \newlength\excess
         \setlength\excess{2\baselineskip}
%          \addtolength\excess{2\lineheight}
         \addcontentsline{toc}{section}{References}
         
         \setlength\parskip{0pt}
         \section*{References}\vspace*{-\excess}
         \bibliographystyle{unsrt}
         \oldbibliography{#1}
      }}
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

\renewenvironment{itemize}{%
\begin{list}{}{
   \setlength{\leftmargin}{1.26cm}         % From Word template
   \setlength{\itemindent}{0pt}%.63cm}       
   \setlength{\itemsep}{0pt}
   \setlength{\parskip}{0pt}%
   \setlength{\parsep}{0pt}}%
   \let\olditem\item
   \renewcommand\item{\olditem\hspace{-0.63cm}\parbox[t]{0.63cm}{\labelitemi}}}%
{\end{list}}  

\renewenvironment{enumerate}{%
\begin{list}{}{
   \setlength{\leftmargin}{1.26cm}         % From Word template
   \setlength{\itemindent}{0pt}%
   \setlength{\itemsep}{0pt}
   \setlength{\parskip}{0pt}%
   \setlength{\parsep}{0pt}}%
   \let\olditem\item
   \renewcommand\item{%
      \addtocounter{enumi}{1}%
      \olditem\hspace{-0.63cm}\parbox[t]{0.63cm}{\labelenumi}}}%
{\end{list}}

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

