\ProvidesFile{Report-Variables.cls}[2026/10/06 Left-aligned experimental variables with cell lists]

% A cell beginning with \item is a compact bullet list. Other cell contents
% are typeset normally; the global \item command is never redefined.
\ExplSyntaxOn
\NewDocumentCommand{\report@variablecell}{>{\TrimSpaces}+m}{
  \tl_if_head_eq_meaning:nNTF {#1} \item
    {
      \begin{itemize}[
        label=\textbullet, leftmargin=1.35em, labelsep=.5em,
        topsep=0pt, partopsep=0pt, itemsep=3pt, parsep=0pt
      ]
        #1
      \end{itemize}
    }
    {
      % Clear the minipage flag even when the last cell is empty.
      \tl_if_blank:nTF {#1} {\leavevmode} {#1}
    }
}
\ExplSyntaxOff
\NewDocumentEnvironment{ExperimentalVariables}{+b}{%
  \report@modulebreak\Needspace{5\baselineskip}
  \noindent\textbf{Experimental Variables:}\par\vspace{13pt}
  \begingroup\fontsize{12}{17}\selectfont
  \noindent\begin{tblr}[expand=\VariableRow]{
    measure=vbox, width=\linewidth, colspec={X[75]X[96]X[90]X[154]},
    % Head alignment keeps text/list first lines level; numbers remain centred.
    % Negative stretch avoids inserting an empty first paragraph before lists.
    cells={l,h}, stretch=-1, colsep=4pt, rowsep=3pt,
    rows={ht=30pt}, row{1}={ht=36pt,font=\bfseries,c,m},
    column{1}={font=\bfseries,c,m}, row{even}={bg=reportgray},
    hline{2}={.8pt,reportrule}, hline{3-Z}={.4pt,reportrule},
    vline{2-4}={2-Z}{.4pt,reportrule},
  }
    Hypothesis & {Independent\\Variable} & {Dependent\\Variable} & {Controlled\\Variables}\\
    #1
  \end{tblr}\par
  \endgroup\report@modulebreak
}{}
\newcommand{\VariableRow}[4]{{#1} & {\report@variablecell{#2}} & {\report@variablecell{#3}} & {\report@variablecell{#4}}\\}
\endinput
