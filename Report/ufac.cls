%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Classe de relatórios e Trabalhos de conclusão de curso da UNIVERSIDADE FEDERAL DO ACRE
% ufac.cls - Versão Corrigida (Beta 2)
% Data da Implementação: 18 de junho de 2025
% Autor: Professor Carreira, Victor (PhD)
% e-mail: victor.carreira@ufac.br
% Este código foi verificado e sua distribuição segue as regras de distribuição de código
% aberto em TeX- LPPL@copyright.
% Reporte os bugs através o e-mail acima ou do repositório @github abaixo
% Repositório GiT: https://github.com/VictorCarreira/UFACTeXmodels.git
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ufac}[2025/06/18 UFAC TCC/Report Class (Corrected)]

% --- Opções da Classe ---
\DeclareOption{final_tcc}{\def\@doc@type{final_tcc}}
\DeclareOption{draft_tcc}{\def\@doc@type{draft_tcc}}
\DeclareOption{report}{\def\@doc@type{report}}
\ExecuteOptions{final_tcc} % Opção padrão
\ProcessOptions\relax      % Esta linha processa as opções do usuário, que devem sobrescrever o padrão

\LoadClass[12pt,a4paper]{report}

% --- Pacotes Essenciais ---
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[brazilian]{babel}
\RequirePackage{indentfirst}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage[colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue]{hyperref}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{tocloft}


% --- Comandos para Informações do Documento ---
\newcommand{\@authorname}{}
\newcommand{\authorname}[1]{\renewcommand{\@authorname}{#1}}
\newcommand{\@worktitle}{}
\newcommand{\worktitle}[1]{\renewcommand{\@worktitle}{#1}}
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\@advisorname}{}
\newcommand{\advisorname}[1]{\renewcommand{\@advisorname}{#1}}
\newcommand{\@coursename}{NOME DO CURSO} % Valor padrão
\newcommand{\coursename}[1]{\renewcommand{\@coursename}{#1}}
\newcommand{\@universityname}{UNIVERSIDADE FEDERAL DO ACRE} % Valor padrão
\newcommand{\universityname}[1]{\renewcommand{\@universityname}{#1}}
\newcommand{\@campusname}{Campus Universitário - Rio Branco} % Valor padrão
\newcommand{\campusname}[1]{\renewcommand{\@campusname}{#1}}
\newcommand{\@city}{Rio Branco}
\newcommand{\city}[1]{\renewcommand{\@city}{#1}}
\newcommand{\@docdate}{\the\year}
\newcommand{\docdate}[1]{\renewcommand{\@docdate}{#1}}

% --- Definição dos Nomes de Seção ---
\providecommand{\abstractname}{Resumo} % Garante que o comando existe antes de renovar
\renewcommand{\abstractname}{RESUMO}
\newcommand{\engabstractname}{ABSTRACT}
\providecommand{\keywordsname}{Palavras-chave} % Garante que o comando existe antes de renovar
\renewcommand{\keywordsname}{Palavras-chave}
\newcommand{\engkeywordsname}{Keywords}


% --- Configurações de Geometria e Estilo ---
\geometry{
    a4paper,
    left=3cm,
    right=2cm,
    top=1cm,
    bottom=2cm
}
\onehalfspacing % Espaçamento 1.5
\captionsetup{justification=centering, singlelinecheck=false} % Centraliza legendas

% --- LÓGICA CONDICIONAL CORRIGIDA com \ifstrequal ---

% Watermark para a versão de rascunho (draft_tcc)
\ifstrequal{\@doc@type}{draft_tcc}{
    \RequirePackage{draftwatermark}
    \SetWatermarkText{VERSÃO PRELIMINAR}
    \SetWatermarkScale{1}
    \SetWatermarkColor[gray]{0.9}
}{}

% --- Página de Rosto ---
\newcommand{\makecover}{
    \thispagestyle{empty}
    \begin{center}
        % Adiciona a imagem no topo central
        \vspace*{1cm} % Espaço antes da imagem
        \includegraphics[scale=0.1]{figs/LogoUFAC.png} % Ajuste o width/scale conforme necessário
        \vspace*{1cm} % Espaço após a imagem

        \large\MakeUppercase{\@universityname} \\
        \large\MakeUppercase{\@campusname} \\
        \large\MakeUppercase{\@coursename} \\
        \vspace*{3cm}
        \large\MakeUppercase{\@authorname} \\
        \vspace*{3.5cm}
        \textbf{\large\MakeUppercase{\@worktitle}} \\
        \ifstrequal{\@subtitle}{}{}{
             \vspace*{0.5cm}
             \large\MakeUppercase{\@subtitle}
        } \\
        \vfill
        \large\MakeUppercase{\@city} \\
        \large\MakeUppercase{\@docdate}
    \end{center}
    \clearpage
}

% --- Elementos Pré-Textuais (Resumo, Listas, etc.) ---
% A definição do comando \pretext depende da opção da classe
\ifstrequal{\@doc@type}{final_tcc}{
    \newcommand{\pretext}{
        % Ficha Catalográfica
        \thispagestyle{empty}\vfill\begin{center}Página reservada à ficha catalográfrica - elemento obrigatório\end{center}\vfill
        \noindent A ficha catalográfica é um elemento obrigatória para os Trabalhos de Conclusão de Curso - TCC defendidos na UFAC, sendo gerado gratuitamente na biblioteca central. 
        \noindent Após a conclusão do TCC, entre em contato com a biblioteca do seu curso para solicitar a ficha catalográfica. 
        \clearpage

        % Termo de Aprovação
        \thispagestyle{empty}\vfill\begin{center}Página reservada ao termo de aprovação - elemento obrigatório\end{center}\vfill
        \noindent O termo de aprovação do Trabalho de Conclusão de Curso (TCC) é uma página onde os membros da banca examinadora e o orientador atestam seu parecer em relação ao trabalho.
        \noindent Este termo é entregue ao aluno após a defesa, que deverá ser escaneado e inserido no corpo deste trabalho, como imagem estendida no centro da página, após as devidas correções e recomendações da banca avaliadora. 
        \clearpage

        % Epígrafe (Opcional)
        \section*{EPÍGRAFE}\addcontentsline{toc}{section}{EPÍGRAFE}
        \vspace*{2cm}
        \begin{flushright}
        ``A sabedoria é árvore de vida para quem dela toma posse; felizes os que se apegam a ela com firmeza.'' \\
        Provérbios 3:18 
        \end{flushright}
        \clearpage

        % Agradecimentos (Opcional)
        \section*{AGRADECIMENTOS}\addcontentsline{toc}{section}{AGRADECIMENTOS}
        Elemento opcional.
        Texto de agradecimento aqui, expressando reconhecimento a pessoas, instituições ou entidades que contribuíram significativamente para a realização do trabalho.
        \clearpage

        % Resumo
        \section*{\abstractname}\addcontentsline{toc}{section}{\abstractname}
        Elemento obrigatório, constituído de uma sequência de frases concisas e objetivas, fornecendo uma visão rápida e clara do conteúdo do estudo.  O texto deverá conter no máximo 500 palavras e ser antecedido pela referência do estudo, com exceção do resumo inserido no próprio documento.  Também, não deve conter citações.  O resumo deve ser redigido em parágrafo único, espaçamento simples e seguido das palavras representativas do conteúdo do estudo, isto é, palavras-chave, em número de três a cinco, separadas entre si por ponto e finalizadas também por ponto.  Usar o verbo na terceira pessoa do singular, com linguagem impessoal (pronome SE), bem como fazer uso, preferencialmente, da voz ativa. 
        \vspace{1cm}\noindent \textbf{\keywordsname}: Primeira palavra. Segunda palavra. Terceira palavra. Quarta palavra. Quinta-palavra. 
        \clearpage

        % Abstract
        \section*{\engabstractname}\addcontentsline{toc}{section}{\engabstractname}
        Além da língua nativa ou vernácula (para os brasileiros, o português) o TCC deve apresentar o resumo traduzido para um outro idioma.  Na maioria das vezes essa tradução é feita para o inglês. 
        \vspace{1cm}\noindent \textbf{\engkeywordsname}: Keyword 1. Keyword 2. Keyword 3. Keyword 4. Keyword 5. 
        \clearpage

        % Lista de Figuras (Opcional)
        \listoffigures\addcontentsline{toc}{section}{LISTA DE FIGURAS}\clearpage

        % Lista de Tabelas (Opcional)
        \listoftables\addcontentsline{toc}{section}{LISTA DE TABELAS}\clearpage

        % Lista de Abreviaturas e Siglas (Opcional)
        \section*{LISTA DE ABREVIATURAS E SIGLAS}\addcontentsline{toc}{section}{LISTA DE ABREVIATURAS E SIGLAS}
        Elemento opcional.
        Lista alfabética das abreviaturas e siglas utilizadas no texto, seguidas das palavras ou expressões correspondentes grafadas por extenso.
        \clearpage

        % Lista de Símbolos (Opcional)
        \section*{LISTA DE SÍMBOLOS}\addcontentsline{toc}{section}{LISTA DE SÍMBOLOS}
        Elemento opcional.
        Lista dos símbolos utilizados no texto, na ordem em que aparecem, seguidos de seu significado.
        \clearpage

        % Sumário
        \tableofcontents\clearpage
    }
}{ % Se a opção não for 'final_tcc'
    \ifstrequal{\@doc@type}{draft_tcc}{
        % Conteúdo de \pretext para draft_tcc (IDÊNTICO a final_tcc por solicitação)
        \newcommand{\pretext}{
            % Ficha Catalográfica
            \thispagestyle{empty}\vfill\begin{center}Página reservada à ficha catalográfrica - elemento obrigatório\end{center}\vfill
            \noindent A ficha catalográfica é um elemento obrigatória para os Trabalhos de Conclusão de Curso - TCC defendidos na UFAC, sendo gerado gratuitamente na biblioteca central. 
            \noindent Após a conclusão do TCC, entre em contato com a biblioteca do seu curso para solicitar a ficha catalográfica. 
            \clearpage

            % Termo de Aprovação
            \thispagestyle{empty}\vfill\begin{center}Página reservada ao termo de aprovação - elemento obrigatório\end{center}\vfill
            \noindent O termo de aprovação do Trabalho de Conclusão de Curso (TCC) é uma página onde os membros da banca examinadora e o orientador atestam seu parecer em relação ao trabalho.
            \noindent Este termo é entregue ao aluno após a defesa, que deverá ser escaneado e inserido no corpo deste trabalho, como imagem estendida no centro da página, após as devidas correções e recomendações da banca avaliadora. 
            \clearpage

            % Epígrafe (Opcional)
            \section*{EPÍGRAFE}\addcontentsline{toc}{section}{EPÍGRAFE}
            \vspace*{2cm}
            \begin{flushright}
            ``A sabedoria é árvore de vida para quem dela toma posse; felizes os que se apegam a ela com firmeza.'' \\
            Provérbios 3:18 
            \end{flushright}
            \clearpage

            % Agradecimentos (Opcional)
            \section*{AGRADECIMENTOS}\addcontentsline{toc}{section}{AGRADECIMENTOS}
            Elemento opcional.
            Texto de agradecimento aqui, expressando reconhecimento a pessoas, instituições ou entidades que contribuíram significativamente para a realização do trabalho.
            \clearpage

            % Resumo
            \section*{\abstractname}\addcontentsline{toc}{section}{\abstractname}
            Elemento obrigatório, constituído de uma sequência de frases concisas e objetivas, fornecendo uma visão rápida e clara do conteúdo do estudo.  O texto deverá conter no máximo 500 palavras e ser antecedido pela referência do estudo, com exceção do resumo inserido no próprio documento.  Também, não deve conter citações.  O resumo deve ser redigido em parágrafo único, espaçamento simples e seguido das palavras representativas do conteúdo do estudo, isto é, palavras-chave, em número de três a cinco, separadas entre si por ponto e finalizadas também por ponto.  Usar o verbo na terceira pessoa do singular, com linguagem impessoal (pronome SE), bem como fazer uso, preferencialmente, da voz ativa. 
            \vspace{1cm}\noindent \textbf{\keywordsname}: Primeira palavra. Segunda palavra. Terceira palavra. Quarta palavra. Quinta-palavra. 
            \clearpage

            % Abstract
            \section*{\engabstractname}\addcontentsline{toc}{section}{\engabstractname}
            Além da língua nativa ou vernácula (para os brasileiros, o português) o TCC deve apresentar o resumo traduzido para um outro idioma.  Na maioria das vezes essa tradução é feita para o inglês. 
            \vspace{1cm}\noindent \textbf{\engkeywordsname}: Keyword 1. Keyword 2. Keyword 3. Keyword 4. Keyword 5. 
            \clearpage

            % Lista de Figuras (Opcional)
            \listoffigures\addcontentsline{toc}{section}{LISTA DE FIGURAS}\clearpage

            % Lista de Tabelas (Opcional)
            \listoftables\addcontentsline{toc}{section}{LISTA DE TABELAS}\clearpage

            % Lista de Abreviaturas e Siglas (Opcional)
            \section*{LISTA DE ABREVIATURAS E SIGLAS}\addcontentsline{toc}{section}{LISTA DE ABREVIATURAS E SIGLAS}
            Elemento opcional.
            Lista alfabética das abreviaturas e siglas utilizadas no texto, seguidas das palavras ou expressões correspondentes grafadas por extenso.
            \clearpage

            % Lista de Símbolos (Opcional)
            \section*{LISTA DE SÍMBOLOS}\addcontentsline{toc}{section}{LISTA DE SÍMBOLOS}
            Elemento opcional.
            Lista dos símbolos utilizados no texto, na ordem em que aparecem, seguidos de seu significado.
            \clearpage

            % Sumário
            \tableofcontents\clearpage
        }
    }{ % Se for 'report'
        \newcommand{\pretext}{} % Nenhum elemento pré-textual
    }
}

% --- Elementos Pós-Textuais (Referências, Apêndices) ---
\newcommand{\posttext}{
    \clearpage
    \section*{CONSIDERAÇÕES FINAIS}
    \addcontentsline{toc}{section}{CONSIDERAÇÕES FINAIS}
    Parte final do texto...

    \clearpage
    \phantomsection
    \addcontentsline{toc}{section}{REFERÊNCIAS}
    \printbibliography[heading=none]

    % Adiciona apêndice apenas para a versão final do TCC
    \ifstrequal{\@doc@type}{final_tcc}{
        \clearpage
        \section*{APÊNDICE A}
        \addcontentsline{toc}{section}{APÊNDICE A}
        Elemento opcional
    }{}
}

% --- Comandos para inicializar o documento ---
\newcommand{\docinit}{
    \makecover
    \pagestyle{plain}
    \pagenumbering{roman}
    \pretext
    \cleardoublepage
    \pagenumbering{arabic}
}

\newcommand{\docend}{
    \posttext
}

\endinput
