% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Resume Class
% % Original Copyright (C) 2010 by Trey Hunner
% % Note: very little from the original class is still below.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{resumeFormatter}[2010/07/10 v0.9 resumeFormatter class]
\LoadClass[11pt,letterpaper]{article}
\usepackage[parfill]{parskip} % remove paragraph indentation
\usepackage{array} % boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % ifthenelse statements
\pagestyle{empty} % suppress page numbers

% %	heading: name and contact info
\newcommand{\name}[1]{\def\@name{#1}}
\def \@name {} % empty by default
\newcommand{\phone}[1]{\def\@phone{#1}}
\def \@phone {}
\newcommand{\email}[1]{\def\@email{#1}}
\def \@email {}
\newcommand{\address}[1]{\def\@address{#1}}
\def \@address {}

% print commands
\def \printname {
  \begingroup
    \hfil{\namesize\bf \@name}\hfil
    \nameskip\break
  \endgroup
}
\def \printaddress {
  \@ifundefined{\@address}{\@address}{}
}
\def \printmyemail {
  \@ifundefined{\@email}{
    \href{mailto:\@email}{\@email}}{}
}
\newcommand{\printanemail}[1] {
  \href{mailto:#1}{#1}
}
\def \printphone {
  \@ifundefined{\@phone}{\@phone}{}
}
\newcommand{\printseparator}[2]{
  \@ifundefined{\@#1}{\@ifundefined{\@#2}{|}{}}{}
}
% bring it all together with \printcontact
\def \printcontact {
  \begingroup
    \centerline{\printmyemail | \printphone}\\
    \centerline{\printaddress}
  \endgroup
}

% rSection environment
\newcommand{\sectionHeader}[1]{
  \MakeUppercase{{\bf #1}} % section title
  \sectionlineskip
  \hrule % horizontal line
}
\newenvironment{rSection}[1]{
  \sectionskip
  \sectionHeader{#1}
  \begin{list}{}{ % list for each individual item in the section
    \setlength{\leftmargin}{1em} % margin within the section
  }
  \item[]
}{
  \end{list}
}

% job
\newenvironment{job}[4]{ % job title, year(s) employed, company name, and location
 {\bf #1} \hfill {#2} % job title and date
 \ifthenelse{\equal{#3}{}}{}{
  \\ {\bf\em #3} \hfill {#4} % company and location
  }\smallskip
  \begin{list}{$\smallbullet$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % compress items
  }{
  \end{list}
  \medskip
}

% project
\newenvironment{project}[2]{ % project title, date
 {\bf #1} \hfill {#2}
 \smallskip
  \begin{list}{}{\leftmargin=0em}
   \itemsep -0.5em \vspace{-0.5em}
  }{
  \end{list}
  \medskip
}

% reference
\newcommand{\reference}[5]{ % name, job title, company, email, phone
 {\bf #1}\\
 #2\\
 #3 \\
 \printanemail{#4}\\
 #5
 \medskip
}

% % whitespace commands
\def\namesize{\fontsize{28}{30}\selectfont} % size of my name
\def\addressskip{\smallskip} % space between address|phone|email
\def\sectionlineskip{\smallskip} % the space between section and underline 
\def\nameskip{\medskip} % the space after your name at the top
\def\sectionskip{\medskip} % the space after the heading section
\newcommand{\tab}[1]{\hspace{.2667\textwidth}\rlap{#1}}
\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}}
% bullets
\newcommand*\smallbullet{\mathpalette\smallbullet@{.6}}
\newcommand*\smallbullet@[2]{\mathbin{\vcenter{\hbox{\scalebox{#2}{$\m@th#1\bullet$}}}}}

