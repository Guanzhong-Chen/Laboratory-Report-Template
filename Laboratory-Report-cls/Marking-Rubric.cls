\ProvidesFile{Marking-Rubric.cls}[2026/09/28 Marking rubric with centred merged cells]
\newcommand{\MakeMarkingRubric}{%
  \clearpage
  \begingroup
  \noindent\hfill\textbf{APPENDIX 1}\par\vspace{5pt}
  {\centering\bfseries MARKING RUBRICS\par}\vspace{16pt}
  \fontsize{10}{11.5}\selectfont\bfseries
  \noindent\makebox[\linewidth][c]{%
    \begin{tblr}{
      width=184mm, colspec={X[94]X[130]X[130]X[18]X[76]X[36]X[36]},
      cells={c,m}, stretch=0, colsep=3pt, rowsep=4pt, hspan=minimal,
      hlines={.45pt}, vlines={.45pt},
      row{1}={ht=27pt,font=\fontsize{12}{14}\selectfont\bfseries},
      row{2,3}={ht=17pt,bg=reportblue},
      row{4,5}={ht=34pt}, row{6}={ht=46pt}, row{7}={ht=57pt}, row{8}={ht=18pt},
    }
      \SetCell{bg=reportblue} Component Title
        & \SetCell[c=3]{c} Laboratory Report & & 
        & \SetCell{bg=reportblue} {Percentage\\(\%)}
        & \SetCell[c=2]{c} 40 & \\
      \SetCell[r=2]{c,m} Criteria
        & \SetCell[c=4]{c} Score and Descriptors & & &
        & \SetCell[r=2]{c,m} {Weight\\(\%)}
        & \SetCell[r=2]{c,m} Marks \\
        & Excellent & Average & \SetCell[c=2]{c} Poor & & & \\
      Front Matters
        & Good title, experimental purpose, inference hypothesis, and methods.
        & Adequate title, experimental purpose, inference hypothesis, and methods.
        & \SetCell[c=2]{c} Missing items in the front matters & & 5 & \\
      Create and format graphs/charts using software.
        & Good graphs/charts created using productivity and/or graphical software.
        & Adequate graphs/charts created using productivity and/or graphical software.
        & \SetCell[c=2]{c} Hand-drawn graphs/charts & & 15 & \\
      Results Analysis and Discussion
        & Accurate analysis and discussion of the numeric quantities to validate physical laws and theorems.
        & Partial analysis and discussion of the numeric quantities to validate physical laws and theorems.
        & \SetCell[c=2]{c} No analysis and discussion of the created charts and graphs. & & 15 & \\
      Back Matters
        & Good conclusion and recommendations for improvement of experimental design and procedures
        & Adequate conclusion and recommendations for improvement of experimental design and procedures
        & \SetCell[c=2]{c} Poor conclusion and recommendations & & 5 & \\
      \SetCell[c=5]{c} TOTAL & & & & & 40 & \\
    \end{tblr}%
  }\par
  \endgroup
}
\endinput
