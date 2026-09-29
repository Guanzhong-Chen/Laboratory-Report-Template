\ProvidesFile{Cover.cls}[2026/09/28 Cover with a variable-height student table]
\newsavebox{\report@studentbox}
\newlength{\report@studentheight}

% #1 is the shared text baseline. The rule is always 5 pt below that baseline.
% Coordinates are TeX points, measured from the upper-left page corner.
\newcommand{\report@coverfield}[3]{%
  \node[anchor=base west,inner sep=0] at (95,#1) {#2};
  \node[anchor=base west,inner sep=0] at (225,#1) {:};
  \node[anchor=base west,inner sep=0] at (239,#1) {#3};
  \draw[reportrule,line width=.45pt] (234,{#1+5}) -- (505,{#1+5});
}

\newcommand{\MakeCover}{%
  \begingroup
  % Measure the real table, including wrapped student names and all rules.
  \sbox{\report@studentbox}{%
    \fontsize{14}{17}\selectfont
    \begin{tblr}[expand=\report@students]{
      width=271pt, colspec={X[95]X[176]},
      cells={c,m}, rows={ht=16pt}, colsep=4pt, rowsep=3pt,
      stretch=0, hlines={.45pt}, vlines={.45pt},
    }
      Student ID & Student Name\\
      \report@students
    \end{tblr}%
  }%
  \setlength{\report@studentheight}{\dimexpr\ht\report@studentbox+\dp\report@studentbox\relax}%
  \pgfmathsetmacro{\report@studentbottom}{343+\strip@pt\report@studentheight}%
  \pgfmathsetmacro{\report@datebaseline}{\report@studentbottom+20}%
  \pgfmathsetmacro{\report@feedbacktop}{\report@datebaseline+27}%
  \pgfmathsetmacro{\report@feedbacklabel}{\report@feedbacktop+16}%
  \pgfmathsetmacro{\report@feedbacktext}{\report@feedbacktop+29}%
  \ifdim\report@feedbacktop pt>650pt
    \ClassError{Laboratory-Report}{Student table is too tall for the cover}%
      {Shorten wrapped entries or reduce the number of students. The feedback box bottom is fixed.}%
  \fi
  \begin{tikzpicture}[remember picture,overlay]
    \ifx\report@logo\@empty\else
      \node[anchor=north,inner sep=0] at ([yshift=-72pt]current page.north)
        {\includegraphics[width=110pt]{\report@logo}};
    \fi
    \begin{scope}[shift={(current page.north west)},x=1pt,y=-1pt,
      every node/.style={font=\fontsize{14}{17}\selectfont}]
      \report@coverfield{209}{Course Code}{\report@code}
      \report@coverfield{231}{Course Name}{\report@course}
      \report@coverfield{253}{Lecturer}{\report@lecturer}
      \report@coverfield{275}{Academic Session}{\report@session}
      \report@coverfield{297}{Assessment Title}{\report@assessment}
      \report@coverfield{319}{Submission Due Date}{\report@due}
      \node[anchor=base west,inner sep=0] at (95,358) {Prepared by};
      \node[anchor=base west,inner sep=0] at (225,358) {:};
      \node[anchor=north west,inner sep=0,outer sep=0] at (234,343)
        {\usebox{\report@studentbox}};
      \report@coverfield{\report@datebaseline}{Date Received}{\report@received}
      % Only this rectangle's top follows the student table; y=749 never moves.
      \draw[line width=.45pt] (90,\report@feedbacktop) rectangle (505,749);
      \coordinate (report-mark-nw) at (433,677);
      \draw[line width=.45pt] (report-mark-nw) rectangle (505,749);
      % Match the original PDF's inset inside the fixed lower-right mark box.
      \node[anchor=base west,inner sep=0,outer sep=0] at
        ([xshift=7.5bp,yshift=-16.8bp]report-mark-nw) {Mark: \report@mark};
      \node[anchor=base west,inner sep=0] at (95,\report@feedbacklabel)
        {Feedback from Lecturer:};
      \node[anchor=north west,inner sep=0,text width=395pt,align=left] at
        (95,\report@feedbacktext) {\report@feedback};
    \end{scope}
  \end{tikzpicture}%
  \null\par\clearpage
  \endgroup
}
\endinput
