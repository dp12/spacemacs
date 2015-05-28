;;; Compiled snippets and support files for `python-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
                     '(("indent" "# -*- coding: utf-8; mode: python; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- vim:fenc=utf-8:ft=python:et:sw=4:ts=4:sts=4" "indent" nil nil nil nil nil nil)
                       ("main" "#!/usr/bin/env python\n# -*- coding: utf-8; mode: python; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- vim:fenc=utf-8:ft=python:et:sw=4:ts=4:sts=4\n\nimport getopt, sys\ndef usage():\n    print '''\nNAME\n    ${1:description}\nUsage\n    python ${2:program.py} [options]\n'''[1:-1]\n\nif __name__ == '__main__':\n    try:\n        opts, args = getopt.getopt(sys.argv[1:], \"hf:\", [\"help\", \"file=\"])\n    except getopt.GetoptError as err:\n        # print help information and exit:\n        print str(err) # will print something like \"option -a not recognized\"\n        usage()\n        sys.exit(2)\n\n    file=\"\"\n\n    for o, a in opts:\n        if o in (\"-h\", \"--help\"):\n            usage()\n            sys.exit()\n        elif o in (\"-f\", \"--file\"):\n            file= a\n        else:\n            assert False, \"unhandled option\"\n\n    print \"hello world\";\n" "main" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)))


;;; Do not edit! File generated at Thu May 28 14:17:45 2015
