;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     colors
     ;; (colors :variables colors-enable-nyan-cat-progress-bar t)
     c-c++
     custom
     deft
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     eyebrowse
     (git :variables
          git-gutter-use-fringe t)
     gtags
     ;; markdown
     keymap
     (latex :variables latex-enable-auto-fill nil)
     org
     perspectives
     progconfig
     python
     search
     semantic
     sicp
     ;; spacemacs-ivy
     syntax-checking
     themes-megapack
     unimpaired
     version-control
     vinegar
     ,@(unless (string= system-type "windows-nt")
         '(fasd))
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ag)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(evil-search-highlight-persist)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         monokai
                         sanityinc-solarized-light
                         spacemacs-dark
                         solarized-dark
                         moe-dark
                         leuven
                         seti
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-M"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  (setq-default
      evil-shift-round nil)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  ;; System Settings
  (global-visual-line-mode t)
  (diminish 'visual-line-mode)
  (setq-default truncate-lines 0)
  (modify-syntax-entry ?_ "w")
  (setq uniquify-buffer-name-style 'reverse)
  (setq uniquify-separator " :: ")
  (setq uniquify-after-kill-buffer-p t)
  (setq uniquify-ignore-buffers-re "^\\*")
  (global-set-key (kbd "C-x <down>") 'winner-redo)
  (global-set-key (kbd "C-x <up>") 'winner-undo)
  (global-set-key (kbd "C-c <left>") 'windmove-left)
  (global-set-key (kbd "C-c <right>") 'windmove-right)
  (global-set-key (kbd "C-c <down>") 'windmove-down)
  (global-set-key (kbd "C-c <up>") 'windmove-up)
  (define-key evil-normal-state-map (kbd "C-c <left>") 'windmove-left)
  (define-key evil-normal-state-map (kbd "C-c <right>") 'windmove-right)
  (define-key evil-normal-state-map (kbd "C-c <down>") 'windmove-down)
  (define-key evil-normal-state-map (kbd "C-c <up>") 'windmove-up)
  (global-set-key (kbd "C-M-S-<right>") 'sp-slurp-hybrid-sexp)
  (global-set-key (kbd "C-M-S-<down>") 'sp-push-hybrid-sexp)
  (global-set-key (kbd "C-M-S-<up>") 'sp-transpose-hybrid-sexp)
  (global-set-key (kbd "C-M-S-k") 'sp-kill-hybrid-sexp)
  (define-key evil-normal-state-map (kbd "M-.") 'ggtags-find-tag-dwim)

  (global-set-key (kbd "C-x f") 'recentf-open-files)
  (define-key evil-normal-state-map (kbd "M-m") 'back-to-indentation)
  (setq projectile-indexing-method 'native)

  ;; Spacemacs
  (setq spacemacs-mode-line-minor-modesp nil)

  ;; Avy
  ;; (define-key evil-normal-state-map (kbd "s") 'avy-goto-word-1)
  ;; (define-key evil-normal-state-map (kbd "S") 'avy-goto-char-2)
  ;; (define-key evil-motion-state-map (kbd "z") 'avy-goto-char-2)
  ;; (define-key evil-visual-state-map (kbd "z") 'avy-goto-char-2)
  (setq avy-keys (number-sequence ?a ?z))

  ;; Evil
  (define-key evil-normal-state-map (kbd "+") 'spacemacs/evil-numbers-increase)
  (define-key evil-normal-state-map (kbd "-") 'spacemacs/evil-numbers-decrease)
  (define-key evil-normal-state-map (kbd "[s") (lambda (n) (interactive "p") (dotimes (c n nil) (insert " "))))
  (define-key evil-normal-state-map (kbd "]s") (lambda (n) (interactive "p")
    (forward-char) (dotimes (c n nil) (insert " ")) (backward-char (1+ n))))
  (define-key evil-normal-state-map (kbd "M-w") 'evil-delete-backward-word)
  (defvar evil-mc-mode-line-prefix "ⓜ"
    "Override of the default mode line string for `evil-mc-mode'.")

  ;; Dired
  (eval-after-load 'dired
    '(progn
       (define-key dired-mode-map "a" 'ag)
       (define-key dired-mode-map "A" 'helm-ag)
       (define-key dired-mode-map "W" 'wdired-change-to-wdired-mode)
       (setq dired-dwim-target t)
       (setq diff-hl-dired-mode t)
       (add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode t)))
       ))

  ;; Helm
  (setq helm-M-x-fuzzy-match t)
  (setq helm-semantic-fuzzy-match t)
  (setq helm-imenu-fuzzy-match t)
  (setq helm-recentf-fuzzy-match t)
  (setq helm-buffers-fuzzy-match t)
  ;; (setq helm-locate-fuzzy-match t)
  (global-set-key (kbd "C-c f") 'helm-for-files)
  (global-set-key (kbd "C-c F") 'fiplr-find-file)
  (global-set-key (kbd "C-c i") 'helm-semantic-or-imenu)
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  (setq helm-swoop-split-direction 'split-window-vertically)
  ;; use search query at the cursor  (default)
  (setq helm-swoop-pre-input-function
        (lambda () (thing-at-point 'symbol)))

  ;; Ido
  ;; (ido-everywhere t)
  (setq ido-use-virtual-buffers t)

  ;; Org-mode
  (setq org-bullets-bullet-list '("⌘" "▶" "▲" "⇨"))
  ;; (setq org-bullets-bullet-list '("♠" "♣" "♥" "♦"))

  ;; Leader keys
  (evil-leader/set-key
    "ed" 'ediff-buffers
    "dj" 'dired-jump
    "do" 'dired-jump-other-window
    "fp" 'fiplr-find-file
    "fi" 'find-file-in-project
    "hf" 'helm-for-files
    "hgd" 'helm-gtags-dwim
    "hgs" 'helm-gtags-select
    "hgr" 'helm-gtags-find-rtag
    "hgt" 'helm-gtags-find-tag
    "gn" 'git-timemachine-show-next-revision
    "gp" 'git-timemachine-show-previous-revision
    "gr" 'ggtags-find-reference
    "mc" 'evil-mc-mode
    "pj" 'project-explorer-toggle
    "gB" 'magit-blame-quit
    "W"  'spacemacs/workspaces-micro-state
    "l"  'spacemacs/workspaces-micro-state
    "L"  'spacemacs/layouts-micro-state
    )

  ;; Magit
  (eval-after-load "magit"
    '(progn
      (evil-define-key evil-magit-state magit-mode-map (kbd "M-j s") 'magit-jump-to-staged)
      (evil-define-key evil-magit-state magit-mode-map (kbd "M-j u") 'magit-jump-to-unstaged)
      (evil-define-key evil-magit-state magit-mode-map (kbd "M-j n") 'magit-jump-to-untracked)
      (evil-define-key evil-magit-state magit-mode-map (kbd "M-j z") 'magit-jump-to-stashes)
      (evil-define-key evil-magit-state magit-mode-map (kbd "M-j k") 'magit-discard)
      (evil-define-key evil-magit-state magit-mode-map (kbd "M-j g") 'magit-refresh-all)
      (evil-define-key evil-magit-state magit-mode-map (kbd "{") 'evil-backward-paragraph)
      (evil-define-key evil-magit-state magit-mode-map (kbd "}") 'evil-forward-paragraph)
      ))

  ;; Org-mode
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "PENDING(p)" "|" "DONE(d!)")
                (sequence "WAITING(w@/!)" "MAYBE(m)" "PROJECT(P@)" "|" "CANCELLED(c@/!)"))))
  (setq org-todo-keyword-faces
        '(
          ("TODO"  . (:foreground "red" :weight bold))
          ("WAITING"  . (:foreground "olivedrab" :weight bold))
          ("MAYBE"  . (:foreground "chocolate" :weight bold))
          ("PENDING"  . (:foreground "orange" :weight bold))
          ("PROJECT"  . (:foreground "steelblue" :weight bold))
          ("DONE"  . (:foreground "green2" :weight bold))
          ("CANCELED"  . shadow)
          ))

  ;; LaTeX
  (cond
   ((string-equal system-type "darwin")
    (progn (setq TeX-view-program-selection '((output-pdf "Skim")))))
   ((string-equal system-type "gnu/linux")
    (progn (setq TeX-view-program-selection '((output-pdf "Okular"))))))

  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-start-server t)
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-view-program-list
        '(("Okular" "okular --unique %o#src:%n`pwd`/./%b")
          ("Skim" "displayline -b -g %n %o %b")
          ("Zathura" "zathura-sync.sh %n:1:%b %o")))
  (cond
   ((spacemacs/system-is-mac) (setq TeX-view-program-selection '((output-pdf "Skim"))))
   ((spacemacs/system-is-linux) (setq TeX-view-program-selection '((output-pdf "Zathura")))))

  ;; Theme
  (setq powerline-default-separator 'alternate)

  ;; Aliases
  (defalias 'chi 'c-toggle-hungry-state)
  )

(setq dotspacemacs-additional-packages
      '(
        ag
        project-explorer
        ))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(evil-exchange-highlight-face (quote evil-ex-search))
 '(magit-diff-use-overlays nil)
 '(paradox-github-token t)
 '(projectile-globally-ignored-files (quote ("TAGS *.html *.o *.su")))
 '(projectile-project-root-files-bottom-up (quote (".git" ".hg" ".fslckout" ".bzr" "_darcs")))
 '(projectile-project-root-files-functions
   (quote
    (projectile-root-top-down projectile-root-top-down-recurring)))
 '(projectile-project-root-files-top-down-recurring (quote (".svn" "CVS" "Makefile" ".projectile")))
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
