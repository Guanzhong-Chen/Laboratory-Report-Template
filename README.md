# 实验报告 LaTeX 模板

模板依据 Resources 中的 Word 样稿制作。填写内容集中在 main.tex；主文档类为 Laboratory-Report.cls，版式模块位于 Laboratory-Report-cls/。

## 编译

在项目根目录执行：

~~~bash
latexmk -xelatex main.tex
~~~

生成 main.pdf。使用 XeLaTeX，并安装 Times New Roman 字体及常见 TeX Live / MacTeX 宏包。所有宏包统一由 `Laboratory-Report-cls/Packages.cls` 导入，main.tex 直接填写报告内容即可。复制模板时需要同时保留主类、整个子类目录和校徽图片。

## 数学、物理和图表宏包

| 用途 | 已导入宏包 | 常用功能 |
| --- | --- | --- |
| 数学公式与符号 | amsmath、amssymb、mathtools | align、矩阵、数学符号、公式扩展 |
| 粗体向量 | bm | `\bm{F}`、`\bm{a}` |
| 物理公式、向量与微分 | physics | `\dd`、`\dv{x}{t}`、`\pdv{U}{x}`、`\vb{F}`、`\abs{x}`、`\quantity(...)` |
| 其他导数与微分写法 | derivative | `\odv{x}{t}`、`\odif{t}`；`\pdv` 使用 physics 的定义 |
| 数值、SI 单位与不确定度 | siunitx | `\num{...}`、`\qty{...}{...}`、`\unit{...}`、按小数点对齐的 S 列 |
| 数据表格 | tabularray、booktabs | tblr、三线表；已启用 tabularray 的 booktabs、siunitx 和 varwidth 支持；变量表可包含列表 |
| 图片、示意图与实验曲线 | graphicx、tikz、pgfplots | 插图、坐标图、数据曲线、误差线；TikZ 已启用 arrows.meta、calc、positioning |
| 浮动图表与子图 | float、subcaption | `[H]` 定位、并排子图及子标题 |
| 颜色与原稿标记 | xcolor、soul | 表格颜色、`\hl{...}` 黄色标记 |

字体、页面、页眉页脚、列表及模板内部接口需要的宏包也集中在 `Packages.cls`。增补宏包时在该文件中添加 `\RequirePackage{宏包名}`。

### physics 与 siunitx 的同名命令

两个宏包均已导入。模板保存并恢复 **siunitx 原生的 `\qty` 定义**，所以 `\qty{数值}{单位}` 用于带单位的物理量，也支持 siunitx 的可选参数。physics 的自动大小括号使用其完整命令 `\quantity(...)`、`\quantity[...]` 或 `\quantity{...}`：

~~~latex
The length is \qty{1.25}{\metre}.
The time is \qty[round-mode=places,round-precision=2]{1.2345}{\second}.
\[
  \quantity(\frac{a}{b})^2,\qquad \dv{x}{t},\qquad \pdv{U}{x}
\]
~~~

数学与物理量示例：

~~~latex
\begin{align}
  \bm{F} &= m\bm{a}, \\
  v &= \odv{x}{t}, \qquad F_x = -\pdv{U}{x}.
\end{align}

The measured acceleration is \qty{9.81(3)}{\metre\per\second\squared}.
\[
  x(T)-x(0) = \int_0^T v(t)\,\odif{t}
\]
~~~

siunitx 已设置为用 `\pm` 分开展示不确定度，因此 `9.81(3)` 表示 `9.81 ± 0.03`；复合单位使用斜线形式。pgfplots 使用 `compat=1.18`。

## main.tex 中的物理快捷命令

这些命令定义在 main.tex 的导言区，在数学模式中使用：

| 快捷命令 | 定义与用途 | 示例 |
| --- | --- | --- |
| `\d` | `\dd` 的快捷写法，使用 physics 的正体微分符号及间距 | `\int f(x)\,\d x` |
| `\dbar` | 使用 `\text{\dj}` 输出带横划的 đ，用于热量、功等非全微分 | `\dbar Q = T\,\d S` |
| `\dsum` | 求和，并通过 `\limits` 将上下限放到符号上、下方 | `\dsum_{k=1}^{n} k` |
| `\dprod` | 连乘，并通过 `\limits` 将上下限放到符号上、下方 | `\dprod_{k=1}^{n} k` |
| `\e` | 正体自然常数 e | `\e^{-t/\tau}` |
| `\i` | 正体虚数单位 i | `\e^{\i\theta}` |

这里的 `\d` 和 `\i` 已被重定义为上述数学含义。`\dsum`、`\dprod` 固定上下限的位置，符号大小仍随当前数学样式变化；独立公式使用显示样式。

~~~latex
\[
  \int_0^1 x^2\,\d x = \frac{1}{3},\qquad \dbar Q = T\,\d S.
\]
\[
  \dsum_{k=1}^{n} k = \frac{n(n+1)}{2},\qquad
  \dprod_{k=1}^{n} k = n!.
\]
\[
  \e^{\i\theta} = \cos\theta + \i\sin\theta,\qquad \e^{\i\pi}+1=0.
\]
~~~

## 封面和声明页参数

所有课程、教师、学期等具体值都在 main.tex 中填写，类文件中的初始值为空。`\TemplateSetup{...}` 只保留学校名称和校徽路径；其他字段使用独立命令，教师反馈使用 `LecturerFeedback` 环境。

~~~latex
\documentclass{Laboratory-Report}

\TemplateSetup{
  university={XIAMEN UNIVERSITY MALAYSIA},
  logo-file={Resources/University-Logo.jpg}
}

\CourseCode{PHY105}
\CourseName{Physics Lab I}
\Lecturer{Eu Shu Tian, Siti Khatijah Md Saad}
\AcademicSession{September 2026}
\AssessmentTitle{}
\SubmissionDueDate{}
\DateReceived{}
\Mark{}
\begin{LecturerFeedback}
  % 在此填写教师反馈，支持空行分段。
\end{LecturerFeedback}
\Signature{}
\DeclarationDate{}
~~~

| 模板设置键 | 对应位置 |
| --- | --- |
| `university` | 页眉学校名称 |
| `logo-file` | 封面校徽路径 |

| 命令或环境 | 对应位置 |
| --- | --- |
| `\CourseCode{内容}` | 课程代码 |
| `\CourseName{内容}` | 课程名称 |
| `\Lecturer{内容}` | 教师 |
| `\AcademicSession{内容}` | 学期 |
| `\AssessmentTitle{内容}` | 考核标题 |
| `\SubmissionDueDate{内容}` | 截止日期 |
| `\DateReceived{内容}` | 收件日期 |
| `\Mark{内容}` | 右下角评分框中的分数 |
| `LecturerFeedback` 环境 | 教师反馈，支持多段文字及列表 |
| `\Signature{内容}` | 声明页签名 |
| `\DeclarationDate{内容}` | 声明页日期 |

以上命令均放在导言区。命令名区分大小写，不含连字符，例如 `\DateReceived{28 September 2026}`。独立命令的参数中可以直接使用逗号，无需再套一层花括号；空参数 `{}` 表示留空。`\TemplateSetup` 中不再接受课程、教师等字段。

教师反馈环境也放在导言区，其内容会在生成封面时填入反馈框。使用空行分段，也可以加入 `itemize` 或 `enumerate` 列表；环境内容为空时，反馈框留空：

~~~latex
\begin{LecturerFeedback}
  The experimental method is clearly described and the measurements are consistent.

  Please discuss the main sources of uncertainty and explain how they affect the result.
\end{LecturerFeedback}
~~~

反馈框底边保持固定，内容需控制在封面反馈区内。

封面标签、冒号和字段内容共用一条文字基线，横线位于基线下方 5 pt。课程字段是单行位置，较长的内容应适当简写。

## 学生名单和封面高度

在导言区，每位学生添加一条命令：

~~~latex
\ReportStudent{S1234567}{Student Name}
\ReportStudent{S7654321}{Another Student}
~~~

一条命令只生成一行，**不自动补足九行或十行**。若需要一行空白填写位置，可以显式添加：

~~~latex
\ReportStudent{}{}
~~~

请直接填入学号和姓名。删除所有学生命令后，表格只保留表头。姓名过长时会在单元格内换行，行高随之增加；所有单元格文字均水平、垂直居中。

收件日期和反馈框顶部跟随学生表格的实际高度移动。反馈框底边固定在距纸张顶部 749 pt 的位置，右下方的小方框也保持固定。学生变少时，空出的空间会归入反馈框。若名单或换行过多，导致反馈区域不足，编译会提示封面容纳不下。

## 原稿提示文字

原稿中的提示文字直接写在 main.tex 的对应位置，使用普通 LaTeX 分组和 `\hl{...}` 标黄。填写报告时直接修改或删除相应分组即可，类文件不包含提示开关、提示命令或自动填充逻辑。

例如，删除下面整个分组即可去掉这一段提示：

~~~latex
{\fontsize{10}{13.2}\selectfont\itshape\RaggedRight
\hl{(List equipment used, description of general setup, and methods.)}\par}
~~~

方法、结果和结论正文均直接写在对应标题命令后面，不需要用命令参数包围。保留标题命令，将其后的提示分组替换为自己的正文即可。

`soul` 由 `Packages.cls` 统一导入，黄色由主类设置。删除提示时只需删除 main.tex 中相应的文字分组。

## 模块间距和分页

正文模块之间统一采用原 `\Title{}` 模块后使用的 **17 pt** 间距。标题、目的、推论、假设、变量表、方法、结果和结论共用同一个长度，相邻模块的间距不会叠加。

间距设置保存在根目录的 `Laboratory-Report.cls`，需要调整时修改其中这一行：

~~~latex
\setlength{\ReportModuleSpacing}{17pt}
~~~

`\ReportResults` 生成 Results, Analysis and Discussion 标题，不强制换页。结果部分按页面剩余空间自然排版；空间不足时自动换页，标题会尽量与后续内容一起保留。封面、声明页和评分表各自的分页由对应模块负责。

从 `\ReportMethods`（Experimental Equipment, Setup, Methods）开始，方法、结果、结论及 Hypothesis 小节的标题和正文采用 Word 原稿的 **10 磅段后间距**。普通正文用空行或 `\par` 分段即可；`\\` 仅换行，不会产生新的段落间距。

该间距独立于上面的 17 pt 模块间距，标题后的空白只计算一次。对应设置也在主类中：

~~~latex
\setlength{\ReportParagraphSpacing}{10bp}
~~~

`bp` 对应 Word 使用的磅（1/72 英寸）。这项设置从方法部分开始启用；评分表使用自己的段落布局。

## 正文命令

~~~latex
\begin{document}
\MakeCover
\MakeDeclarationPage

\Title{Measurement of Gravitational Acceleration}
\begin{PurposeofExperiment}
  Determine $g$ using a simple pendulum.

  Examine how the pendulum length affects its period.
\end{PurposeofExperiment}

\begin{Inferences}
  \item The period increases with pendulum length.
  \item ...
  \item ...
\end{Inferences}

\begin{Hypotheses}
  \item $T^2$ is proportional to $L$.
  \item ...
  \item ...
\end{Hypotheses}

\begin{ExperimentalVariables}
  \VariableRow{1}{Length $L$}{Period $T$}{
    \item Mass
    \item Release angle
  }
  \VariableRow{2}{}{}{}
  \VariableRow{3}{}{}{}
\end{ExperimentalVariables}

\ReportMethods
Describe the apparatus and procedure here.

\Hypothesis{1}
Describe the method specific to hypothesis 1.

\Hypothesis{2}
Describe the method specific to hypothesis 2.

\ReportResults
Add results, tables, figures, calculations and discussion here.

\Hypothesis{1}
Discuss the result for hypothesis 1.

\Hypothesis{2}
Discuss the result for hypothesis 2.

\ReportConclusions
Summarise findings and improvements.

\MakeMarkingRubric
\end{document}
~~~

| 命令或环境 | 用途 |
| --- | --- |
| `\Title{内容}` | 实验标题 |
| `PurposeofExperiment` 环境 | 实验目的，正文从标题下一行开始；支持空行分段 |
| Inferences、Hypotheses | 推论、假设列表；每条用 \item |
| `ExperimentalVariables` | 自动生成表头的实验变量表，使用 `\begin{ExperimentalVariables}` 和 `\end{ExperimentalVariables}` |
| \VariableRow{编号}{自变量}{因变量}{控制变量} | 一行变量；内容列左对齐、顶部对齐，支持 `\item` 圆点列表；表头和编号居中 |
| `\ReportMethods` | 无参数，只生成器材、实验装置和方法标题；正文直接写在后面 |
| `\Hypothesis{编号}` | 只接收假设编号，生成 Hypothesis 编号标题；方法、结果部分共用，正文直接写在后面 |
| `\ReportConclusions` | 无参数，只生成结论和建议标题；正文直接写在后面 |
| `\ReportResults` | 无参数，生成结果、分析和讨论标题；正文直接写在后面，不强制换页 |
| \MakeMarkingRubric | 另起一页生成评分表 |

`PurposeofExperiment` 使用 `\begin{PurposeofExperiment}` 和 `\end{PurposeofExperiment}` 包围内容。`\ReportMethods`、`\ReportResults`、`\ReportConclusions` 后不加 `{}`；`\Hypothesis` 后只保留一组 `{}` 填写编号，方法或结果正文写在下一行。

正文可使用多段文字、公式、普通表格和 \includegraphics；空行或 \par 均可分段。假设专用小节可按需要增删，列表项和变量行也可增删。空白示例保留原稿的正文结构；填写较长内容后允许自然增加页数。

## 实验变量表中的列表

变量内容列（自变量、因变量、控制变量）左对齐，首行靠单元格顶部；表头和假设编号保持居中。文字自动换行，行高随内容增加。

`\VariableRow` 的后三个参数既可以填写普通文字，也可以直接以 `\item` 开头写圆点列表，无需额外套 `itemize` 环境：

~~~latex
\begin{ExperimentalVariables}
  \VariableRow{1}{Length $L$}{Period $T$}{
    \item Mass of the pendulum bob
    \item Release angle
    \item Gravitational acceleration
  }
  \VariableRow{2}{Mass $m$}{Period $T$}{Length and release angle}
\end{ExperimentalVariables}
~~~

每个 `\item` 在当前单元格中添加一个圆点条目，续行与条目文字对齐；新增表格行仍使用 `\VariableRow`。自变量和因变量单元格也支持同样的列表写法。普通文字不自动加圆点，空参数 `{}` 留空。

## 模块目录

~~~text
Laboratory-Report.cls
main.tex
README.md
Laboratory-Report-cls/
  Packages.cls            统一导入宏包及配置数学、单位、图表支持
  Metadata.cls            封面及声明数据接口、学生名单
  Cover.cls               第一页封面及动态表格
  Declaration.cls         第二页学术诚信声明
  Report-Overview.cls     正文标题、实验目的、推论、假设
  Report-Variables.cls    实验变量表
  Report-Methods.cls      器材、装置和方法
  Report-Results.cls      结果、分析和讨论
  Report-Conclusions.cls  结论和建议
  Marking-Rubric.cls      附录评分表
Resources/
  University-Logo.jpg
  PHY105 Laboratory Report Template SEPT 2026.docx
~~~

主类负责纸张、字体、页眉页脚、颜色、模块间距及子类加载；所有宏包导入统一放在 `Packages.cls`。子类通过 \input 引入，不单独使用 \documentclass 编译。原来的 phy105lab.cls 已更名；已有文档应将首行改为 \documentclass{Laboratory-Report}。
