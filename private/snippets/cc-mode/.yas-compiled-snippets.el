;;; Compiled snippets and support files for `cc-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'cc-mode
                     '(("bblk" "/**\n * $0\n */" "comment bblock " nil nil nil nil nil nil)
                       ("blk" "/*\n * $0\n */" "comment block " nil nil nil nil nil nil)
                       ("cml" "/* $0 */" "comment line " nil nil nil nil nil nil)
                       ("dblk" "/**\n * @brief ${1:brief}\n * @param ${2:parameter}\n * @return ${3:retval}\n */$0" "doxygen function bloc " nil nil nil nil nil nil)
                       ("elseif" "} else if (${1:condition}) {\n     $0\n" "else if (...) { ... }" nil nil nil nil nil nil)
                       ("ife" "if (${1:condition}) {\n    $2\n} else {\n    $0\n}\n" "if (...) { ... } else { ... }" nil nil nil nil nil nil)
                       ("ifei" "if (${1:condition}) {\n    $2\n} else if (${3:condition}) {\n    $0\n}\n" "if (...) { ... } else if (...) { ... }" nil nil nil nil nil nil)
                       ("ifeie" "if (${1:condition}) {\n     $2\n} else if (${3:condition}) {\n     $4\n} else {\n     $0\n}         \n" "if (...) { ... } else if (...) { ... } else { ... }" nil nil nil nil nil nil)
                       ("i" "#include $0\n" "#include \"...\"" nil nil nil nil nil nil)
                       ("lwf" "printf(\"${1:`(which-function)`} called\\n\");\n" "printf which function called" nil nil nil nil nil nil)
                       ("pai" "* @param[in] ${1:name} ${2:description}" "param in" nil nil nil nil nil nil)
                       ("pao" "* @param[out] ${1:name} ${2:description}" "param out" nil nil nil nil nil nil)
                       ("pri" "println(\"${1:var}\" + $1);\n" "println (...)" nil nil nil nil nil nil)
                       ("swi" "switch(${1:condition}) {\ncase ${2:condition}:\n    $3\n    break;\ndefault:\n    $0\n    break;\n}" "switch (...) { ...}" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu May 28 14:17:45 2015
