%% Identification part:

\NeedsTeXFormat{LaTeX2e}[1994/12/01]

\ProvidesClass{privatbrev}[1995/11/07 v1.0 Ifi document class]

%% Initial code part:

%% Options declaration part:

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}

%% Options execution part:

\ProcessOptions

%% Package loading part:

\LoadClass[a4paper]{letter}

%% Main code part:

% There is no need for very tight setting of paragraphs:

\tolerance = 6000  \hbadness = \tolerance
\pretolerance = 4000

% Modify the first page layout:

\def \ps@firstpage{%
  \def \@evenhead{\raisebox{2cm}[0pt][0pt]{%
      \hbox to \textwidth{\begin{minipage}[t]{10cm}
        \textbf{\mbox{}\fromname}\\
        \fromaddress\hbox{}
      \end{minipage}\hss
      \raisebox{-3cm}{\fromlocation\ \@date}}}%
  }%
  \def \@oddhead{\@evenhead}%
  \def \@oddfoot{}\def \@evenfoot{}%
}

% Modify layout of other pages:

\def \ps@plain{%
  \def \@evenhead{}\def \@oddhead{}%
  \def \@evenfoot{\normalfont\rmfamily\normalsize\mdseries\upshape\hfil
        -- \thepage\ --\hfil}%
  \def \@oddfoot{\@evenfoot}%
}

% Modify \opening:

\renewcommand{\opening}[1]{%
  \thispagestyle{firstpage} 
  \vspace*{1cm}
  {\raggedright \textbf{\toname}\\ \toaddress \par}\vspace{2\parskip}
  #1\par\nobreak}

\pagestyle{plain}
