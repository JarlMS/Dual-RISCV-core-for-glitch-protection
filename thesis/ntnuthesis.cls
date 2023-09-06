%
% File for the ntnuthesis LaTeX class.
% This class produces a subset of book suitable for doctoral
% theses written at NTNU.
%
% Original author: Federico Zenith
%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{ntnuthesis}[2007/03/25 Class for MSc theses at NTNU Trondheim]


%
% Set default values for the variables used by our implementation of \maketitle
%
\newcommand{\SubTitle}{}
\newcommand{\DegreeType}{}
\newcommand{\Faculty}{Faculty of Information Technology, \\ Mathematics and Electrical Engineering}
\newcommand{\Department}{Department of Electronics and Telecommunications }
%\newcommand{\CopyrightNotice}{}
%\newcommand{\ISBNPrinted}{N/A}
%\newcommand{\ISBNElectronic}{N/A}
%\newcommand{\SerialNumber}{\number\year:N/A}
\newcommand{\Month}{\ifcase\month\or
	January\or February\or March\or April\or May\or June\or
	July\or August\or September\or October\or November\or December\fi}
\newcommand{\Year}{\number\year}
\renewcommand{\@author}{Yahya H. Yassin}
\renewcommand{\@title}{}


%
% Set the default values for margin settings
%
\newcommand{\GeometryOptions}{margin=25mm,top=15mm,bindingoffset=5mm}
\newcommand{\CropOptions}{}
\newcommand{\CropLandscapeFlag}{}

%
% Commodity command to give two different versions of code, the first for printout mode
% and the second for screen mode. Useful for large pictures and layouts in absolute units.
%
\newcommand{\printandscreen}[2]{\ifthenelse{\isundefined{\ScreenMode}}{#1}{#2}}

%
% Process options passed to the class
%
\DeclareOption{a4crop}{\renewcommand{\CropOptions}{cam,a4,center}}
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{screen}{
	\renewcommand{\CropLandscapeFlag}{landscape}
	\renewcommand{\GeometryOptions}{margin=25mm,screen}
	\newcommand{\ScreenMode}{true}
}
\DeclareOption*{\PackageWarning{ntnuthesis}{Unknown option `\CurrentOption.}}
\ProcessOptions\relax

\LoadClass[a4paper,11pt,twoside,openright,onecolumn,titlepage,english]{book}

% Set appropriate margins
\RequirePackage[\GeometryOptions,includeheadfoot,headheight=14.5pt]{geometry}

% Set cropping marks, if a4crop has been specified.
\RequirePackage[\CropOptions,\CropLandscapeFlag]{crop}

% Necessary to set the headers; notice that right and left headers are swapped.
\RequirePackage{fancyhdr}

% Used in some conditional statements
\RequirePackage{ifthen}

% Necessary to include the NTNU logo
\RequirePackage{graphicx}

%
% Define the commands to set the variables used by \title
%
\newcommand{\subtitle}[1]{\renewcommand{\SubTitle}{#1}}
\newcommand{\degreetype}[1]{\renewcommand{\DegreeType}{#1}}
\newcommand{\faculty}[1]{\renewcommand{\Faculty}{#1}}
\newcommand{\department}[1]{\renewcommand{\Department}{#1}}
%\newcommand{\copyrightnotice}[1]{\renewcommand{\CopyrightNotice}{#1}}
%\newcommand{\isbnprinted}[1]{\renewcommand{\ISBNPrinted}{#1}}
%\newcommand{\isbnelectronic}[1]{\renewcommand{\ISBNElectronic}{#1}}
%\newcommand{\serialnumber}[1]{\renewcommand{\SerialNumber}{#1}}
\newcommand{\setyear}[1]{\renewcommand{\Year}{#1}}
\newcommand{\setmonth}[1]{\renewcommand{\Month}{#1}}

%
% Override the \maketitle command
%
\renewcommand{\maketitle}{
	\begin{titlepage}
	\parindent=0cm
	\addtolength{\parskip}{\baselineskip}
	\addvspace{3cm}
	\printandscreen{\vspace{2cm}}{\vspace{0.5cm}}

	{\renewcommand{\textcolor}{grey}{\Huge \@author}}

	\vfill %\addvspace{2cm} 	


		{\LARGE \textbf{\@title}}

		{\Large \textbf{\SubTitle}}

	
		
	
	\vfill

	{
	%\LARGE 
	Master thesis\\for the degree \DegreeType

	%{\@author}

	Trondheim, \Month\ \Year

	Norwegian University of Science and Technology\\
	\Faculty\ \\
	\Department
	}

	\printandscreen{\vspace{2cm}}{\vspace{0.75cm}}
%	\includegraphics[width=0.4\textwidth]{NTNUlogo}	
\begin{figure}[!ht]
	\includegraphics[width=0.4\textwidth]{NTNUlogo}
	%\includegraphics[viewport= 0 0 448 128, clip, width=0.1\textwidth]{emptylogo}
	%\includegraphics[viewport= 64 400 540 524, clip, width=0.5\textwidth]{holstimage}
\end{figure}
	\newpage
	{~}
	\thispagestyle{empty}
	\vfill
	
	{
	\scriptsize
	\textbf{NTNU}

	Norwegian University of Science and Technology

	Master thesis\\
	for the degree of \DegreeType

	\Faculty\ \\
	\Department

	\copyright\ \Year\ \@author 
	%\CopyrightNotice

%	ISBN \ISBNPrinted\ (printed version)\\
%	ISBN \ISBNElectronic\ (electronic version)\\
%	ISSN 1503-8181

%	Doctoral theses at NTNU, \SerialNumber

%	Printed by NTNU-trykk
	}
	\end{titlepage}
}

\AtBeginDocument{
%	\pagestyle{fancy}
%	\pagestyle{empty}
%	\renewcommand{\headrulewidth}{0.4pt}
%	\renewcommand{\sectionmark}[1]{\markright{\textbf{\thesection.\ #1}}}
%	\renewcommand{\chaptermark}[1]{\markboth{\textbf{#1}}{}}
%	\rhead{\nouppercase{\leftmark}}
%	\lhead{\nouppercase{\rightmark}}
%	\printandscreen{	
%		\fancyhead[LE,RO]{\textbf{\thepage}}
%	}{	
%		\fancyhead[R]{\textbf{\thepage}}
%	}
%	\fancyfoot[C]{}

%---------------------------------------------------------------------------------------------------------------------
%\usepackage{graphicx,amsfonts,psfrag,fancyhdr,layout,appendix,subfigure}
%\usepackage[sectionbib]{natbib}
%\usepackage{chapterbib}

%% Set equal margins on book style
%\setlength{\oddsidemargin}{53pt}
%\setlength{\evensidemargin}{53pt}
%\setlength{\marginparwidth}{57pt}
%\setlength{\footskip}{30pt}

% Redefine plain page style
\fancypagestyle{plain}{
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
%\fancyfoot[LE,RO]{\thepage}
\fancyfoot[C]{\thepage}
}

% Code for creating empty pages
% No headers on empty pages before new chapter
\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}
    \thispagestyle{empty}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother \clearpage{\pagestyle{plain}\cleardoublepage}

%
% Renew the appendix chapter
%
%<report|book>
%\newcommand\appendix{
%	\par
%	\setcounter{chapter}{0}%
%	\setcounter{section}{0}%
%	\renewcommand\@chapapp{\appendixname}%
%	\renewcommand\thechapter{\@Alph\c@chapter}
%}
%</report|book>

%%
%% Define an abstract definition
%%
%\if@titlepage
%	\newenvironment{abstract}{%
%	\titlepage
%	\null\vfil
%	\@beginparpenalty\@lowpenalty
%	\begin{center}%
%		\bfseries \abstractname
%		\@endparpenalty\@M
%	\end{center}}%
%	{\par\vfil\null\endtitlepage}
%\else
%	\newenvironment{abstract}{%
%	\if@twocolumn
%		\section*{\abstractname}%
%	\else
%		\small
%		\begin{center}%
%			{\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
%		\end{center}%
%		\quotation
%	\fi}
%	{\if@twocolumn\else\endquotation\fi}
%\fi

% Define pagestyle
%\pagestyle{fancy}
%\fancyhf{}
%\fancyhead[LE,RO]{\thepage}
%\renewcommand{\chaptermark}[1]{\markboth{ \emph{#1}}{}}
%\fancyhead[LO]{}
%\fancyhead[RE]{\leftmark}
%\fancyfoot[LE,RO]{\thepage}

%% Dutch style of paragraph formatting, i.e. no indents. 
%\setlength{\parskip}{1.3ex plus 0.2ex minus 0.2ex}
%\setlength{\parindent}{0pt}

% Less detailed TOC
\setcounter{tocdepth}{1}

%---------------------------------------------------------------------------------------------------------------------
}
