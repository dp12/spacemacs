;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("author" "#+AUTHOR: ${1:`user-full-name`}\n" "Author" nil nil nil nil nil nil)
                       ("begin" "\\begin{$1}\n  $0\n\\end{$1}\n" "\\begin{...} ... \\end{...}" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("block" "#+begin_$1 $2\n  $0\n#+end_$1\n" "#+begin_...#+end_" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("cbs" "#+begin_src C\n$0\n#+end_src" "C begin src" nil nil nil nil nil nil)
                       ("chk" "- [ ] " "checkbox" nil nil nil nil "direct-keybinding" nil)
                       ("dyl" "** $0\n*** Tasks [/]\n*** Notes" "daylog" nil nil nil nil "direct-keybinding" nil)
                       ("desc" "#+DESCRIPTION: ${0}\n" "DESCRIPTION" nil nil nil nil nil nil)
                       ("dita" "#+BEGIN_DITAA ${1:export-file-name} -r -S -E\n${0}\n#+END_DITAA\n" "DITAA" nil nil nil nil nil nil)
                       ("docbook" "#+BEGIN_DOCBOOK\n${0}\n#+END_DOCBOOK\n" "DOCBOOK" nil nil nil nil nil nil)
                       ("email" "#+EMAIL: ${1:`user-mail-address`}\n" "Email" nil nil nil nil nil nil)
                       ("figure" "#+attr_latex: width=$1\\textwidth\n`(org-insert-link '(4))`\n$0\n" "figure" nil nil nil nil nil nil)
                       ("file" "[[file:${1:file-path}]]\n" "[[file:link]]" nil nil nil nil nil nil)
                       ("html" "#+BEGIN_HTML\n${0}\n#+END_HTML\n" "HTML" nil nil nil nil nil nil)
                       ("inc" "#+INCLUDE: \"${1:file}\" ${2:src-example-quote} ${3:mode}\n\n" "Author" nil nil nil nil nil nil)
                       ("keywords" "#+KEYWORDS: ${0}\n" "KEYWORDS" nil nil nil nil nil nil)
                       ("lang" "#+LANGUAGE: ${1:en}\n" "LANGUAGE" nil nil nil nil nil nil)
                       ("latex" "#+BEGIN_LATEX\n${0}\n#+END_LATEX\n" "LATEX" nil nil nil nil nil nil)
                       ("options" "#+OPTIONS: ${0}\n\n" "OPTIONS" nil nil nil nil nil nil)
                       ("pagebreak" "#+ODT: <text:p text:style-name=\"PageBreak\"/>\n" "page break for libreoffice" nil nil nil nil nil nil)
                       ("prop" " :PROPERTIES:\n :VISIBILITY:folded:\n :END:\n" "Properties Folded" nil nil nil nil nil nil)
                       ("pyb" "#+begin_src python\n$0\n#+end_src" "pythonbabble" nil nil nil nil "direct-keybinding" nil)
                       ("sb" "#+source: ${1:name}\n#+begin_src ${2:language}\n  $3\n#+end_src\n" "#+srcname:..#+begin_src...#+end_src" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("seq" "#+SEQ_TODO: ${1:STATES} | ${2:FINISHED}\n" "SEQ TODO" nil nil nil nil nil nil)
                       ("src" "#+BEGIN_SRC $1$>\n$0$>\n#+END_SRC$>\n" "Source Code Block" nil nil nil nil nil nil)
                       ("startup" "#+STARTUP: ${1:options}\n" "Startup" nil nil nil nil nil nil)
                       ("text" "#+TEXT: ${1:text}\n" "Text" nil nil nil nil nil nil)
                       ("title" "#+TITLE: ${1:title}\n" "Title Block" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu May 28 14:17:45 2015
