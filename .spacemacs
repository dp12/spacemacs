;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     auctex
     auto-completion
     better-defaults
     (colors :variables colors-enable-nyan-cat-progress-bar t)
     c-c++
     custom
     fasd
     ggtags
     (git :variables
          git-gutter-use-fringe t)
     ;; markdown
     keymap
     org
     perspectives
     progconfig
     search
     sicp
     syntax-checking
     themes-megapack
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         sanityinc-solarized-light
                         sanityinc-solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here

  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
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

  (global-set-key (kbd "C-x f") 'recentf-open-files)
  (define-key evil-normal-state-map (kbd "M-m") 'back-to-indentation)
  (setq projectile-indexing-method 'native)

  ;; Avy
  (define-key evil-normal-state-map (kbd "s") 'avy-goto-word-1)
  (define-key evil-normal-state-map (kbd "S") 'avy-goto-char-2)
  (define-key evil-motion-state-map (kbd "z") 'avy-goto-char-2)
  (define-key evil-visual-state-map (kbd "z") 'avy-goto-char-2)

  ;; Dired
  (eval-after-load 'dired
    '(progn
       (define-key dired-mode-map "a" 'ag)
       (define-key dired-mode-map "A" 'helm-ag)
       (define-key dired-mode-map "W" 'wdired-change-to-wdired-mode)
       (setq dired-dwim-target t)
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

  ;; Ido
  (ido-everywhere t)
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
    "hf" 'helm-for-files
    "hgd" 'helm-gtags-dwim
    "hgs" 'helm-gtags-select
    "hgr" 'helm-gtags-find-rtag
    "hgt" 'helm-gtags-find-tag
    "gn" 'git-timemachine-show-next-revision
    "gp" 'git-timemachine-show-previous-revision
    "gr" 'ggtags-find-reference
    "pj" 'project-explorer-toggle
    )

  ;; Magit
  (eval-after-load "magit"
    '(progn
      (define-key magit-status-mode-map (kbd "J s") 'magit-jump-to-staged)
      (define-key magit-status-mode-map (kbd "J u") 'magit-jump-to-unstaged)
      (define-key magit-status-mode-map (kbd "J t") 'magit-jump-to-untracked)
      (define-key magit-status-mode-map (kbd "J z") 'magit-jump-to-stashes)
      (define-key magit-status-mode-map (kbd "{") 'evil-backward-paragraph)
      (define-key magit-status-mode-map (kbd "}") 'evil-forward-paragraph)
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
