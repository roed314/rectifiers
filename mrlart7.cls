

\NeedsTeXFormat{LaTeX2e}
%% Package Loading
\LoadClass{amsart}[1997/03/26 v1.2r]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main Code
%\normalsize

\def\@secnumfont{\bfseries}
\setlength{\baselineskip}{13pt}

\setlength{\paperwidth}{8.5in}
\setlength{\paperheight}{11in}

\setlength{\hoffset}{-1in}
\setlength{\voffset}{-1in}
\setlength{\oddsidemargin}{27mm}
\setlength{\topmargin}{17mm}
\setlength{\textwidth}{130mm}
\setlength{\textheight}{197mm}
\setlength{\headheight}{8pt}
\setlength{\headsep}{6mm}
\setlength{\footskip}{24pt}
\setlength{\evensidemargin}{27mm}

\setlength{\marginparwidth}{90pt}
\setlength{\marginparsep}{11pt}

%\setbox0=\hbox{\footnotesize M$^1$}
\setlength{\footnotesep}{\ht0}
\setlength{\skip\footins}{7pt plus 3pt}

\setlength{\tabcolsep}{\labelsep}
\setlength{\tabbingsep}{\labelsep}

\setlength{\parskip}{0pt plus 1pt}
\setlength{\parindent}{12pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\small{\footnotesize}
\def\Large{\large}
\def\LARGE{\large}
\def\huge{\large}
\def\Huge{\large}

%%%%%%%%%%%%%%%%%%%%%%%%%%


%\def\part{\@startsection{\@string\part}%
%        0\z@{12\p@\@plus12\p@}{6\p@}%
%        {\raggedright\defaultfont\bf}}
%\def\partname{Part}

\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\section}{\@startsection%
         {section}%
         {1}%
         {0mm}%
         {9\p@\@plus12\p@}%
         {6\p@}%
         {\centering\normalfont\normalsize\bf}}%

\renewcommand{\subsection}{\@startsection%
         {subsection}%
         {2}%
         {0mm}%
         {6\p@\@plus9\p@}%
         {-.5em}%
         {\normalfont\normalsize\bf}}%

\renewcommand{\subsubsection}{\@startsection%
         {subsubsection}%
         {3}%
         {0mm}%
         {6\p@\@plus9\p@}%
         {-.5em}%
         {\normalfont\normalsize\it}}%

\renewcommand{\paragraph}{\@startsection%
         {paragraph}%
         {4}%
         {0mm}%
         {\parskip}%
         {-\fontdimen2\font}%
         {\normalfont\normalsize}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@maketitle{%
   \normalfont\normalsize
   \let\@makefnmark\relax  \let\@thefnmark\relax
   \ifx\@empty\@date\else \@footnotetext{\@setdate}\fi
   %%%%%%%%%%%%%%%%%%%
   %% Added : received command ; eg, \received{Date}
   \ifx\@empty\@received\else \@footnotetext{Received \@received .}\fi
   \ifx\@empty\@subjclass\else \@footnotetext{\@setsubjclass}\fi
   \ifx\@empty\@keywords\else \@footnotetext{\@setkeywords}\fi
   \ifx\@empty\thankses\else \@footnotetext{%
     \def\par{\let\par\@par}\@setthanks}\fi
   \@mkboth{\@nx\shortauthors}{\@nx\shorttitle}%

% Alas! The top of the title!
     {\noindent
     {{$ Math{.}\  Res.\  Lett.$} {\small{\bf \volno}  (\yrno), $no.$ \issueno,
     {\number\thepage}--\lpageno\ \hskip\fill
          \copyright \ International Press 2011}} \vskip 8.4mm}

   \global\topskip66\p@\relax %now 66 THJ 8/9/99 % 5.5pc   "   "   "     "     "
   \@settitle
   \ifx\@empty\authors \else \@setauthors \fi
%  \ifx\@empty\@authors
%    \else
%    \baselineskip32\p@
%    \vtop{\@andify{ and }\@authors
%    \centering{\small\normalsize\sc
%    \expandafter{\@authors}\@@par}%
%    \global\dimen@i\prevdepth}\relax
%    \prevdepth\dimen@i
%    \fi
   \ifx\@empty\@dedicatory
   \else
     \baselineskip30\p@
     \vtop{\centering{\footnotesize\itshape\@dedicatory\@@par}%
       \global\dimen@i\prevdepth}\prevdepth\dimen@i
   \fi
   \@setabstract
   \skip@0.3cm\@plus 0.3cm \advance\skip@-1.5\baselineskip
   \vskip\skip@
   \normalsize
   \if@titlepage
     \newpage
   \else
     \dimen@34\p@ \advance\dimen@-\baselineskip
     \vskip\dimen@\relax
   \fi
} % end \@maketitle

%% Received date notator
\def\received#1{\def\@received{#1}}
\def\@received{}


\renewenvironment{abstract}{%
   \ifx\maketitle\relax
     \ClassWarning{\@classname}{Abstract should precede
       \protect\maketitle\space in AMS documentclasses; reported}%
   \fi
   \global\setbox\abstractbox=\vtop \bgroup
   \normalfont\Small
   \Small
   \list{}{\labelwidth\z@
     \leftmargin8mm \rightmargin\leftmargin
     \listparindent\normalparindent \itemindent\z@
     \parsep\z@ \@plus\p@
     \let\fullwidthdisplay\relax
     }%
   \item[\hskip\labelsep\scshape\abstractname.]%
}{%
   \endlist\egroup
   \ifx\@setabstract\relax \@setabstracta \fi
}
\def\@setabstract{\@setabstracta \global\let\@setabstract\relax}
\def\@setabstracta{%
   \ifvoid\abstractbox
   \else
     \skip@14\p@ \advance\skip@-\lastskip
		  \advance\skip@-3mm \vskip\skip@
%			\advance \hsize -17mm \vskip\skip@
     \box\abstractbox
     \prevdepth\z@ % because \abstractbox is a vtop
   \fi
}

\def\footnoterule{\kern-.4\p@
         \hrule\@width 5pc\kern9.5\p@\kern-\footnotesep}

\long\def\@footnotetext#1{\insert\footins{%
   \normalfont\small
   \interlinepenalty\interfootnotelinepenalty
   \splittopskip\footnotesep \splitmaxdepth \dp\strutbox
   \floatingpenalty\@MM \hsize\columnwidth
   \@parboxrestore \parindent\normalparindent \sloppy
   \edef\@currentlabel{\p@footnote\@thefnmark}%
   \@makefntext{\rule\z@\footnotesep\ignorespaces#1\unskip\strut\par}}}

\def\@setaddresses{\par
   \nobreak \begingroup
\footnotesize
   \def\author##1{\nobreak\addvspace\bigskipamount}%
   \def\\{\unskip, \ignorespaces}%
   \interlinepenalty\@M
   \def\address##1##2{\begingroup
     \par\addvspace\bigskipamount\indent
     \@ifnotempty{##1}{(\ignorespaces##1\unskip) }%
     {\scshape\ignorespaces##2}\par\endgroup}%
   \def\curraddr##1##2{\begingroup
     \@ifnotempty{##2}{\nobreak\indent{\itshape Current address}%
       \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
       ##2\par\endgroup}}%
   \def\email##1##2{\begingroup
     \@ifnotempty{##2}{\nobreak\indent{\itshape E-mail address}%
       \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
% v1.0 -
%     \rmfamily##2\par\endgroup}}%
       \ttfamily##2\par\endgroup}}%
   \def\urladdr##1##2{\begingroup
     \@ifnotempty{##2}{\nobreak\indent{\itshape URL}%
       \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
       \ttfamily##2\par\endgroup}}%
   \addresses
   \endgroup
}

\def\@setauthors{%
   \begingroup
   \trivlist
%  \centering\footnotesize \@topsep30\p@\relax
		\centering \@topsep30\p@\relax
   \advance\@topsep by -\baselineskip
   \item\relax
   \andify\authors
\scshape\authors
   %\authors
   \endtrivlist
   \endgroup
}

\def\ps@firstpage{\ps@plain
   \def\@oddfoot{\normalfont\small \hfil\thepage\hfil
      \global\topskip\normaltopskip}%
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\@serieslogo\hss}%
   \let\@evenhead\@oddhead % in case an article starts on a left-hand page
}

\renewcommand{\ps@headings}{%
		\renewcommand{\@oddhead}{\normalfont\small \hfill 
\@xp\shorttitle \hfill
\thepage}
		\renewcommand{\@evenhead}{\normalfont\small \thepage 
\hfill \@xp\shortauthors
\hfill}%
		\renewcommand{\@evenfoot}{}%
		\renewcommand{\@oddfoot}{}}

\pagestyle{headings}

%\setcounter{thepage}{\pageno}
