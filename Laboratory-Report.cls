\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Laboratory-Report}[2026/09/28 v2.0 Modular laboratory report]
\LoadClass[12pt,a4paper]{article}

% All explicit package imports are kept in this module.
\input{Laboratory-Report-cls/Packages.cls}

% Shared typography and page layout. Report-specific data belong in main.tex.
\setmainfont{Times New Roman}
\geometry{a4paper,left=31.75mm,right=31.75mm,top=25.4mm,bottom=25.4mm,
  headheight=16pt,headsep=20pt,footskip=35pt}
\definecolor{reportblue}{RGB}{184,204,228}
\definecolor{reportgray}{RGB}{204,204,204}
\definecolor{reportrule}{RGB}{105,105,105}
\sethlcolor{yellow}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

% All report modules share the original Title module's 17 pt spacing.
% addvspace prevents adjacent module boundaries from doubling the gap.
\newlength{\ReportModuleSpacing}
\setlength{\ReportModuleSpacing}{17pt}
\newcommand{\report@modulebreak}{\par\addvspace{\ReportModuleSpacing}}

% These .cls files are input modules, not independent document classes.
\input{Laboratory-Report-cls/Metadata.cls}
\input{Laboratory-Report-cls/Cover.cls}
\input{Laboratory-Report-cls/Declaration.cls}
\input{Laboratory-Report-cls/Report-Overview.cls}
\input{Laboratory-Report-cls/Report-Variables.cls}
\input{Laboratory-Report-cls/Report-Methods.cls}
\input{Laboratory-Report-cls/Report-Results.cls}
\input{Laboratory-Report-cls/Report-Conclusions.cls}
\input{Laboratory-Report-cls/Marking-Rubric.cls}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\normalfont\fontsize{12}{14}\selectfont\report@university}
\fancyfoot[C]{\normalfont\fontsize{12}{14}\selectfont\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\endinput
