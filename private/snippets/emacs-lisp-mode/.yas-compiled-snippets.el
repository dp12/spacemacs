;;; Compiled snippets and support files for `emacs-lisp-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'emacs-lisp-mode
                     '(("c" "(cond\n ((${1:CONDITION})\n  $0)\n (t\n  (message \"default\"))" "(cond (COND1 BODY) (t ...))" nil nil nil nil nil nil)
                       ("dolis" "(dolist (i ${1:items})\n  $0\n)" "(dolist (i items) ...)" nil nil nil nil nil nil)
                       ("dolist" "(let ((i 0) found item)\n  (while (and (not found)\n              (< i (length ${1:items})))\n    (setq item (nth i ${1:$(yas/substr yas-text \"[^ ]*\")}))\n    (when (${2:t})\n      (setq found t)\n      )\n    (setq i (1+ i))\n    ))" "(dolist () break)" nil nil nil nil nil nil)
                       ("lwf" "(message \"${1:`(which-function)`} called\")" "(message \"which function called\")" nil nil nil nil nil nil)
                       ("l" "(message \"${1:hello}\")\n" "(message \"hello\")" nil nil nil nil nil nil)
                       ("lo" "(message \"${1:object}=%s\" ${1:$(yas/substr yas-text \"[^ ]*\")})\n" "(message \"object=%s\" object)" nil nil nil nil nil nil)
                       ("foreach" "(mapc\n  (lambda (elem)\n    (message \"elem=%s\" elem)\n    $0\n  )\n  ${1:(list 1 2 3 4)}\n)\n" "(mapc FUNCTION SEQUENCE)" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu May 28 14:17:45 2015
