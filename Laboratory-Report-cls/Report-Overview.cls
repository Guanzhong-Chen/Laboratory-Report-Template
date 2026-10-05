\ProvidesFile{Report-Overview.cls}[2026/09/28 Title, purpose, inferences and hypotheses]
\NewDocumentCommand{\Title}{+m}{%
  \report@modulebreak
  \noindent\textbf{Title:}\enspace#1\report@modulebreak}
\NewDocumentEnvironment{PurposeofExperiment}{}{%
  \report@modulebreak\Needspace{3\baselineskip}
  \noindent\textbf{Purpose of Experiment:}\par\nobreak\vspace{17pt}
  \ignorespaces
}{\report@modulebreak\ignorespacesafterend}
\NewDocumentEnvironment{Inferences}{}{%
  \report@modulebreak\Needspace{3\baselineskip}
  \noindent\textbf{Inferences:}\par\vspace{17pt}
  \begin{enumerate}[label=\arabic*.,leftmargin=30pt,labelwidth=23pt,labelsep=7pt,
    itemindent=0pt,align=left,topsep=0pt,itemsep=16.5pt,parsep=0pt,partopsep=0pt]
}{\end{enumerate}\report@modulebreak}
\NewDocumentEnvironment{Hypotheses}{}{%
  \report@modulebreak\Needspace{3\baselineskip}
  \noindent\textbf{Hypotheses:}\par\vspace{17pt}
  \begin{enumerate}[label=\arabic*.,leftmargin=30pt,labelwidth=23pt,labelsep=7pt,
    itemindent=0pt,align=left,topsep=0pt,itemsep=16.5pt,parsep=0pt,partopsep=0pt]
}{\end{enumerate}\report@modulebreak}
\endinput
