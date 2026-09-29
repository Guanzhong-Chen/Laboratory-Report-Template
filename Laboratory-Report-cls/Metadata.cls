\ProvidesFile{Metadata.cls}[2026/09/28 Report data interface]

% No course, lecturer, session, or other report values are hard-coded here.
\def\report@university{}
\def\report@logo{}
\def\report@code{}
\def\report@course{}
\def\report@lecturer{}
\def\report@session{}
\def\report@assessment{}
\def\report@due{}
\def\report@received{}
\def\report@mark{}
\def\report@feedback{}
\def\report@signature{}
\def\report@date{}
\def\report@students{}
\newcounter{report@studentcount}

\define@key{template}{university}{\def\report@university{#1}}
\define@key{template}{logo-file}{\def\report@logo{#1}}

% Template settings and independent report fields use ordinary LaTeX commands.
\newcommand{\TemplateSetup}[1]{\setkeys{template}{#1}}
\newcommand{\CourseCode}[1]{\def\report@code{#1}}
\newcommand{\CourseName}[1]{\def\report@course{#1}}
\newcommand{\Lecturer}[1]{\def\report@lecturer{#1}}
\newcommand{\AcademicSession}[1]{\def\report@session{#1}}
\newcommand{\AssessmentTitle}[1]{\def\report@assessment{#1}}
\newcommand{\SubmissionDueDate}[1]{\def\report@due{#1}}
\newcommand{\DateReceived}[1]{\def\report@received{#1}}
\newcommand{\Mark}[1]{\def\report@mark{#1}}
% Capture paragraphs without typesetting in the preamble. The definition must
% survive the environment's group so MakeCover can use it later.
\NewDocumentEnvironment{LecturerFeedback}{+b}{%
  \gdef\report@feedback{#1}%
}{}
\newcommand{\Signature}[1]{\def\report@signature{#1}}
\newcommand{\DeclarationDate}[1]{\def\report@date{#1}}

% Exactly one command means exactly one data row, even if both fields are empty.
\newcommand{\ReportStudent}[2]{%
  \stepcounter{report@studentcount}%
  \g@addto@macro\report@students{{#1} & {#2}\\}%
}
\endinput
