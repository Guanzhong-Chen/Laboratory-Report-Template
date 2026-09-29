\ProvidesFile{Report-Variables.cls}[2026/09/28 Centred experimental variables table]
\NewDocumentEnvironment{ExperimentalVariables}{+b}{%
  \report@modulebreak\Needspace{5\baselineskip}
  \noindent\textbf{Experimental Variables:}\par\vspace{13pt}
  \begingroup\fontsize{12}{17}\selectfont
  \noindent\begin{tblr}[expand=\VariableRow]{
    width=\linewidth, colspec={X[75]X[96]X[90]X[154]},
    cells={c,m}, stretch=0, colsep=4pt, rowsep=3pt,
    rows={ht=30pt}, row{1}={ht=36pt,font=\bfseries},
    column{1}={font=\bfseries}, row{even}={bg=reportgray},
    hline{2}={.8pt,reportrule}, hline{3-Z}={.4pt,reportrule},
    vline{2-4}={2-Z}{.4pt,reportrule},
  }
    Hypothesis & {Independent\\Variable} & {Dependent\\Variable} & {Controlled\\Variables}\\
    #1
  \end{tblr}\par
  \endgroup\report@modulebreak
}{}
\newcommand{\VariableRow}[4]{{#1} & {#2} & {#3} & {#4}\\}
\endinput
