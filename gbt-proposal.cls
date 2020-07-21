\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gbt-proposal}[GBT Proposal Template]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[12pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% README %%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Created/modified by Kelvin Lee 21/7/2020
% -----------
%
% 1. Compilation
% Compile with XeLaTeX. pdfLaTeX does not support the fontspec package
% which is necessary for unicode characters that are used by European
% names. Unless you want to change all of the names by hand in your
% .bib file, I recommend you compile with XeLaTeX.
%
% 2. Bibliography/references
% This template uses the biblatex package, whereas normally most people
% use natbib for reference management. Biblatex is essential here because
% it gives you flexibility:
% - Multiple bibliographies can be used and cited; publications that come
%   out of the previous grant are have a prefix attached.
% - At the end of the proposal, all of the papers that were produced in
%   the previous grant are printed with the \nocite{} command, even with
%   papers not cited throughout the text.
% - References are split into two keyword categories: if your bibtex entry
%   has a keyword={previous} item in it, then it will be printed as a paper
%   that came from the previous award. It is best to put these references
%   into the previous-award.bib file, and other references in references.bib
%
% 3. Figure wrapping
% The wrapfig package is used to provide a text-wrapping figure environment.
% Replaces \begin{wrapfig} instead of \begin{figure}. This is one of the only
% things that probably need fine-tweaking in terms of formatting.
%
% 4. Table footnotes
% The threeparttable package gives access to a table environment that facilitates
% foot notes at the bottom of the table.


\RequirePackage{calc}
\RequirePackage[sort&compress,authoryear]{natbib}
\RequirePackage[version=3]{mhchem}
% Used for \midrule, \bottomrule, etc
\RequirePackage{booktabs}
% For pretty printing of values and units
\RequirePackage{siunitx}
% This package prevents text invading the right margin
\RequirePackage[final]{microtype}
% figure formats
\RequirePackage{epsfig}
\RequirePackage{epstopdf}

% self explanatory
% \RequirePackage[doublespacing]{setspace}

\RequirePackage{fullpage,multirow,multicol,amssymb}

% This changes the LaTeX font to TeX Pagella, which I like better
% and stands out from the usual Latin Modern Roman
\RequirePackage{tgpagella}
\fontfamily{qpl}\selectfont

% Gives access to the threeparttable and tablenotes
% environments.
\RequirePackage{threeparttable}

% Allows for enumerating lists
\RequirePackage{enumitem}

% Gives the wrapfig environment that will make floats
% that are word wrapping
\RequirePackage{wrapfig}

% Allows text line wrapping in table rows
\RequirePackage{tabularx}

\RequirePackage[multiple]{footmisc}

% For seeing how formatting looks
\RequirePackage{lipsum}

% Sets the page margins to conform with the NSF guidelines
\setlength{\paperheight}{11in}
\setlength{\paperwidth}{8.5in}
\addtolength{\voffset}{-1in}
\addtolength{\hoffset}{-1in}
\setlength{\topmargin}{0.5in}
\setlength{\oddsidemargin}{1in}
\setlength{\evensidemargin}{1in}
\setlength{\textwidth}{\paperwidth - 2in}
\setlength{\textheight}{\paperheight - 2in}
\setlength{\footskip}{36pt}
\setlength{\marginparsep}{0.5cm}
\setlength{\marginparwidth}{1.5cm}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}

% Sets the formatting for section headers
\RequirePackage{titlesec}

%%%%%%%%%%%%%%%%%%% Defines section headers %%%%%%%%%%%%%%%%%%%
\titleformat{\section}[runin]{\bf}{}{}{}[]

\RequirePackage{fancyhdr}
\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0pt}
\lhead{}
\chead{}
\rhead{}
\lfoot{}
\cfoot{\thepage}
\rfoot{}

% Ensures unicode characters are printed correctly,
% particularly with European names!
\RequirePackage{fontspec}

% Sets the formatting for captions
\RequirePackage[
    format=plain,
    font=it,
    labelfont=bf,
    compatibility=false]{caption}

%%%%%%%%%%%%%%%%%%% Labels and link colors %%%%%%%%%%%%%%%%%%% 
\RequirePackage[
  colorlinks, 	
  pdfstartview=FitH,
  linkcolor=black,
  citecolor=black,
  urlcolor=black,
  filecolor=black]{hyperref}

% align single-float pages to the *top* of the page, not the center
\makeatletter
\setlength{\@fptop}{0pt}
\setlength{\@fpbot}{0pt plus 1fil}

% This sets the padding between text and normal figures
\setlength{\textfloatsep}{5pt}
% This sets the padding between text and WRAPPED figures
%\setlength{\intextsep}{10pt}
\makeatletter

%\def\@makefnmark{\hbox{$^{\fnsymbol{\@mpfn}}\m@th$}}
\renewcommand\floatpagefraction{.9}

\captionsetup{belowskip=-10pt}
\setcitestyle{aysep={}}

%%%%%%%%%%%%%%%%% Modifying the title %%%%%%%%%%%%%%%%% 

% this defines a session variable, where the user needs to specify
% which session this proposal is for
\newcommand*{\session}[1]{\gdef\@session{#1}%
}
\newcommand*{\@session}{\texttt{\string\session} currently
not set. Please fix this.}
\renewcommand*{\maketitle}{%
\begin{titlepage}
	\centering
    {\scshape GBT~\@session~Proposal---\@title\unskip\strut\par}
{\small \@date\par}
\end{titlepage}
}
% This makes sure there is no page break
\let\endtitlepage\relax

%%%%%%%%%%%%%%%%% Making the bibliography single line %%%%%%%%%%%%%%%%%

\RequirePackage{paralist}
\let\olditem\item
\renewenvironment{thebibliography}[1]{%
  \section*{\refname}
  \let\par\relax\let\newblock\relax
  \renewcommand{\item}[1][]{\olditem[\textbullet]}%
  \inparaenum}{\endinparaenum}
  
%%%%%%%%%%%%%%%%% Making the section 