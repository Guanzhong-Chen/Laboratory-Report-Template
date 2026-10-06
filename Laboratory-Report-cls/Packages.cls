\ProvidesFile{Packages.cls}[2026/09/29 Shared packages for a physics laboratory report]

% Typography, page layout, and template interfaces.
\RequirePackage{fontspec}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\RequirePackage{needspace}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{keyval}

% Mathematics, vectors, derivatives, physical quantities, and uncertainty.
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{bm}
\RequirePackage{derivative}
\RequirePackage{siunitx}
\sisetup{separate-uncertainty=true,per-mode=symbol}

% Preserve siunitx's native quantity command before physics replaces it.
% physics keeps its bracket interface under \quantity; \qty is always SI.
\NewCommandCopy{\report@siqty}{\qty}
\RequirePackage{physics}
\RenewCommandCopy{\qty}{\report@siqty}
% This specific siunitx warning is resolved by the explicit restoration above.
\ExplSyntaxOn
\msg_redirect_name:nnn { siunitx } { physics-pkg } { none }
\ExplSyntaxOff

% Data tables, figures, diagrams, plots, and subfigures.
\RequirePackage[table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{tabularray}
\UseTblrLibrary{booktabs,siunitx,varwidth}
% Enable paragraph/list measurement only for tables that request it.
\SetTblrInner{measure=hbox}
\RequirePackage{float}
\RequirePackage{subcaption}
\RequirePackage{tikz}
\usetikzlibrary{arrows.meta,calc,positioning}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}

% Standard highlighting for the editable sample text in main.tex.
\RequirePackage{soul}
\endinput
