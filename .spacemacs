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
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/spacemacs/private/")
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     asm
     auto-completion
     better-defaults
     ;; helm
     emacs-lisp
     (colors :variables
             colors-enable-nyan-cat-progress-bar t
             nyan-bar-length 8)
     (c-c++ :variables c-c++-enable-clang-support t)
     custom
     deft
     evil-snipe
     (git :variables
          git-gutter-use-fringe t)
     gtags
     imenu-list
     ivy
     markdown
     keymap
     (latex :variables latex-enable-auto-fill nil)
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     progconfig
     python
     rust
     ;; (ranger :variables ranger-show-preview t)
     search
     search-engine
     semantic
     sicp
     ;; spell-checking
     ;; syntax-checking
     themes-megapack
     version-control
     vinegar
     ycmd
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ag project-explorer mode-icons pt
                                      visual-regexp-steroids zop-to-char
                                      dumb-jump rtags color-theme-solarized
                                      zerodark-theme helm-ag helm-gtags
                                      helm-swoop projectile-ripgrep evil-lion)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-search-highlight-persist)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
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
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-one
                         glowfish-contrast
                         monokai
                         zerodark
                         sanityinc-solarized-light
                         spacemacs-dark
                         leuven
                         seti
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Source Code Pro"
   dotspacemacs-default-font '("tamsynmod"
                               :size 18
                               ;; :weight semibold
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
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
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default evil-shift-round nil)
  (when (string-equal system-type "windows-nt")
    (set-fontset-font t '(#x2680 . #x26FF) (font-spec :family "DejaVu Sans Mono" :size 20))
    (set-fontset-font t '(#x26aa . #x26ac) (font-spec :family "DejaVu Sans Mono" :size 20))
    (setq-default ispell-program-name "C:/bin/Aspell/bin/aspell.exe")
    (setq flyspell-issue-message-flag nil)
    )
  (add-to-list 'load-path "~/spacemacs/themes")
  (add-to-list 'custom-theme-load-path "~/spacemacs/themes")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; (global-visual-line-mode t) ;; Don't do this with swiper - too slow
  (diminish 'visual-line-mode)
  (spacemacs/toggle-truncate-lines-off)
  (setq uniquify-buffer-name-style 'reverse)
  (setq uniquify-separator " ⇐ ")
  (setq uniquify-after-kill-buffer-p t)
  (setq uniquify-ignore-buffers-re "^\\*")
  (setq sp-highlight-pair-overlay nil)
  (setq sp-highlight-wrap-overlay nil)
  (setq sp-highlight-wrap-tag-overlay nil)
  (mode-icons-mode)
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
  (define-key evil-normal-state-map (kbd "C-M-.") 'helm-gtags-find-tag-other-window)
  (global-set-key (kbd "M-z") 'zop-to-char)
  (global-set-key (kbd "C-x f") 'recentf-open-files)
  (global-set-key (kbd "M-?") 'company-complete)
  (global-set-key (kbd "M-I") 'company-rtags)
  ;; (global-set-key (kbd "M-I") 'company-irony)
  (global-set-key (kbd "M-Y") 'company-ycmd)
  (define-key yas-minor-mode-map [backtab] 'hippie-expand)
  (define-key evil-normal-state-map (kbd "M-m") 'back-to-indentation)
  ;; (setq projectile-indexing-method 'native)
  (add-to-list 'auto-mode-alist '("\\.bin\\'" . hexl-mode))

  (defun check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
        (backward-char 1)
        (if (looking-at "\\.") t
          (backward-char 1)
          (if (looking-at "->") t nil)))))

  (define-key company-mode-map [tab]
    '(menu-item "maybe-company-expand" nil
                :filter (lambda (&optional _)
                          (when (check-expansion)
                            #'company-complete-common))))

  ;; Spacemacs
  (setq spacemacs-mode-line-minor-modesp nil)
  (setq spaceline-version-control-p nil)

  ;; Spacemacs theme
  (setq powerline-default-separator 'alternate)
  (spaceline-compile)

  ;; Avy and evil-snipe
  (define-key evil-normal-state-map (kbd "n") 'avy-goto-word-1)
  (setq avy-keys (number-sequence ?a ?z))
  (set-face-attribute 'evil-snipe-matches-face nil :inherit nil :foreground "red" :box '(:color "lawn green" :style released-button))
  (setq evil-snipe-scope 'buffer)
  (setq evil-snipe-repeat-scope 'buffer)

  ;; Evil config
  (define-key evil-normal-state-map (kbd "+") 'spacemacs/evil-numbers-transient-state/evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "-") 'spacemacs/evil-numbers-transient-state/evil-numbers/dec-at-pt)
  (define-key evil-normal-state-map (kbd "[s") (lambda (n) (interactive "p") (dotimes (c n nil) (insert " "))))
  (define-key evil-normal-state-map (kbd "]s") (lambda (n) (interactive "p")
                                                 (forward-char) (dotimes (c n nil) (insert " ")) (backward-char (1+ n))))
  (define-key evil-normal-state-map (kbd "[w") 'eyebrowse-next-window-config)
  (define-key evil-normal-state-map (kbd "]w") 'eyebrowse-prev-window-config)
  (define-key evil-normal-state-map (kbd "M-w") 'evil-delete-backward-word)
  (evil-lion-mode)
  (setq evil-want-C-i-jump t)

  ;; Make v$ exclude the carriage return
  (evil-define-motion evil-last-non-blank (count)
    "Move the cursor to the last non-blank character
on the current line. If COUNT is given, move COUNT - 1
lines downward first."
    :type inclusive
    (evil-end-of-line count)
    (re-search-backward "^\\|[^[:space:]]")
    (setq evil-this-type (if (eolp) 'exclusive 'inclusive)))
  (define-key evil-visual-state-map "$" 'evil-last-non-blank)

  (setq evil-want-Y-yank-to-eol nil)

  ;; Evil multiple-cursors/Iedit
  (add-hook 'prog-mode-hook 'turn-on-evil-mc-mode)
  (add-hook 'text-mode-hook 'turn-on-evil-mc-mode)
  (define-key evil-normal-state-map (kbd "[m") 'evil-mc-mode)
  (define-key evil-normal-state-map (kbd "[i") 'evil-iedit-state/iedit-mode)
  (defvar evil-mc-mode-line-prefix "ⓜ"
    "Override of the default mode line string for `evil-mc-mode'.")

  ;; Ycmd
  (eval-after-load "ycmd"
    (progn
      (setq ycmd-server-command (list "python" (file-truename "~/ycmd/ycmd")))
      (add-hook 'c-mode-hook 'ycmd-mode)
      (add-hook 'c++-mode-hook 'ycmd-mode)
      (setq ycmd-force-semantic-completion t)
      ))
  (diminish 'ycmd-mode "Ⓨ")

  (setq request-message-level -1) ;; make ycmd less annoying

  ;; Ediff
  ;; From http://stackoverflow.com/questions/9656311/conflict-resolution-with-emacs-ediff-how-can-i-take-the-changes-of-both-version
  (defun ediff-copy-both-to-C ()
    (interactive)
    (ediff-copy-diff ediff-current-difference nil 'C nil
                     (concat
                      (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                      (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
  (defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "d" 'ediff-copy-both-to-C))
  (add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)

  ;; Dired
  (eval-after-load 'dired
    '(progn
       (define-key dired-mode-map "a" 'ripgrep-regexp)
       (define-key dired-mode-map "A" 'helm-ag)
       (define-key dired-mode-map "W" 'wdired-change-to-wdired-mode)
       (define-key dired-mode-map (kbd "M-n") 'dired-narrow)
       (setq dired-dwim-target t)
       (setq diff-hl-dired-mode t)
       (add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode t)))
       (setq dired-listing-switches "--group-directories-first -alh")
       ))

  (defun kill-dired-buffers()
    (interactive)
    (mapc (lambda (buffer)
            (when (eq 'dired-mode (buffer-local-value 'major-mode buffer))
              (kill-buffer buffer)))
          (buffer-list)))

  (defun copy-file-basename-to-clipboard ()
    "Copy the current buffer file name to the clipboard."
    (interactive)
    (let ((filename (if (equal major-mode 'dired-mode)
                        default-directory
                      (buffer-name))))
      (when filename
        (kill-new filename)
        (message "%s" filename))))


  ;; Helm
  (setq helm-M-x-fuzzy-match t)
  (setq helm-semantic-fuzzy-match t)
  (setq helm-imenu-fuzzy-match t)
  (setq helm-recentf-fuzzy-match t)
  (setq helm-buffers-fuzzy-match t)
  (setq helm-locate-fuzzy-match nil)
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  (setq helm-swoop-split-direction 'split-window-vertically)
  ;; use search query at the cursor  (default)
  (setq helm-swoop-pre-input-function
        (lambda () (thing-at-point 'symbol)))
  ;; Show function/variable tags in helm-semantic-or-imenu
  (with-eval-after-load 'helm-semantic
    (push '(c-mode . semantic-format-tag-summarize) helm-semantic-display-style)
    (push '(c++-mode . semantic-format-tag-summarize) helm-semantic-display-style))

  ;; Ido
  (add-hook 'ido-setup-hook
            (lambda () (define-key ido-completion-map (kbd "C-w") 'ido-kill-buffer-at-head)))
  ;; (setq ido-use-virtual-buffers t)
  (defun ido-clear-virtual-buffers ()
    (interactive)
    (setq buffer-name-history '()))
  (setq ido-enable-flex-matching t)


  ;; Ivy
  (global-set-key "\C-s" 'swiper)
  (define-key ivy-minibuffer-map (kbd "C-w") 'ivy-next-history-element)
  (define-key ivy-minibuffer-map (kbd "C-s") 'ivy-next-history-element)
  (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line-or-history)
  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line-or-history)
  (define-key ivy-minibuffer-map (kbd "C-u") 'ivy-kill-line)

  (setq ivy-re-builders-alist
        '((counsel-imenu . ivy--regex-fuzzy)
          (counsel-bookmark . ivy--regex-fuzzy)
          (counsel-git . ivy--regex-fuzzy)
          (ivy-switch-buffer . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))

  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c k") 'counsel-ag)

  ;; Leader keys
  (spacemacs/set-leader-keys
    "ak" 'avy-kill-whole-line
    "ay" 'avy-copy-line
    "bx" 'ace-swap-window
    "bk" (kbd "C-x k")
    "bl" 'list-bookmarks
    "ed" 'ediff-buffers
    "dk" 'kill-dired-buffers
    "dj" 'dired-jump
    "do" 'dired-jump-other-window
    "d." 'dired-omit-mode
    "dg" 'dumb-jump-go
    "dG" 'dumb-jump-go-other-window
    "dl" 'dumb-jump-quick-look
    "db" 'dumb-jump-back
    "ew" 'eww
    "fp" 'fiplr-find-file
    "fi" 'find-file-in-project
    "fd" 'find-file-in-current-directory
    "fn" 'copy-file-basename-to-clipboard
    "gn" 'git-timemachine-show-next-revision
    "gp" 'git-timemachine-show-previous-revision
    "gr" 'ggtags-find-reference
    "hf" 'helm-for-files
    "hm" 'helm-man-woman
    "hx" 'hexl-mode
    "h." 'highlight-symbol-at-point
    "hr" 'unhighlight-regexp
    "if" 'counsel-recentf
    "rd" 'rtags-find-symbol-at-point
    "rf" 'rtags-find-references-at-point
    "rt" 'rtags-taglist
    "rg" 'projectile-ripgrep
    "ir" 'counsel-rg
    "ry" 'helm-show-kill-ring
    "bj" 'counsel-bookmark
    "ib" 'counsel-bookmark
    "ix" 'ido-clear-virtual-buffers
    "mc" 'evil-mc-mode
    "mi" 'evil-matchit-mode
    "ms" 'evilmi-select-items
    "oi" 'helm-semantic-or-imenu
    "ou" 'org-previous-visible-heading
    "ga" 'projectile-find-other-file-other-window
    "pj" 'project-explorer-toggle
    "gB" 'magit-blame-quit
    "w1" 'eyebrowse-switch-to-window-config-1
    "w2" 'eyebrowse-switch-to-window-config-2
    "w3" 'eyebrowse-switch-to-window-config-3
    "w4" 'eyebrowse-switch-to-window-config-4
    "w5" 'eyebrowse-switch-to-window-config-5
    "w6" 'eyebrowse-switch-to-window-config-6
    "w7" 'eyebrowse-switch-to-window-config-7
    "w8" 'eyebrowse-switch-to-window-config-8
    "w9" 'eyebrowse-switch-to-window-config-9
    "wx" 'eyebrowse-close-window-config
    "wn" 'eyebrowse-rename-window-config
    "w TAB" 'eyebrowse-last-window-config
    "L"  'spacemacs/workspaces-transient-state/body
    "W"  'spacemacs/workspaces-transient-state/body
    "xx" 'align-regexp
    )

  ;; Org-mode
  (require 'org-drill)
  (require 'org-mouse)
  (setq org-bullets-bullet-list '("◎" "◉" "○" "✎" "†" "■"))
  ;;✇✉✂▯✎⇘➜▲ ∇☰⚠☢
  ;; (setq org-bullets-bullet-list '("⌘" "▶" "▲" "⇨")) ► ∗
  ;; (setq org-bullets-bullet-list '("♠" "♣" "♥" "♦"))
  (setq org-todo-keywords
        (quote ((sequence "☛ TODO(t)" "↻ PENDING(p)" "|" "✔ DONE(d!)")
                (sequence "⚑ WAITING(w@/!)" "⚁ MAYBE(m)" "PROJECT(P@)" "|" "✘ CANCELLED(c@/!)"))))
  (setq org-fontify-whole-heading-line t)
  (setq org-todo-keyword-faces
        '(
          ("☛ TODO"  . (:inherit org-todo :foreground "red"))
          ("⚑ WAITING"  . (:inherit org-todo :foreground "purple"))
          ("⚁ MAYBE"  . (:inherit org-todo :foreground "chocolate"))
          ("↻ PENDING"  . (:inherit org-todo :foreground "orange"))
          ("PROJECT"  . (:inherit org-todo :foreground "steelblue"))
          ("✔ DONE"  . (:inherit org-todo :foreground "green2"))
          ("✘ CANCELED"  . shadow)
          ))

  (defun leuven-set-font-to-office ()
    (interactive)
    (if (equal custom-enabled-themes '(leuven))
      (progn
        ;; (load-theme 'doom-one)
        (set-face-attribute 'default nil :font "Calibri"  :foreground "#FFFFF"))
      (progn
        ;; (load-theme 'leuven)
        ;; (set-face-attribute 'default nil :font "Consolas" :height 120))))
        (set-face-attribute 'default nil :font "Consolas" :height 120))))
  ;; (add-hook 'org-mode-hook 'set-font-to-office)

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
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments (quote ("--smart-case" "--stats" "-U")))
 '(ag-ignore-list (quote ("*.html" "*.js" "*.map" "*.xml" "*.json")))
 '(evil-want-Y-yank-to-eol nil)
 '(helm-ag-base-command "ag --nocolor --nogroup -U")
 '(helm-ag-ignore-patterns (quote ("*.html" "*.js" "*.map" "*.xml" "*.json")))
 '(helm-ag-use-agignore t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-drill org-velocity)))
 '(package-selected-packages
   (quote
    (projectile-ripgrep ripgrep yasnippet helm-core with-editor request-deferred deferred company swiper highlight git-commit anaconda-mode counsel smartparens ycmd request helm projectile ivy magit magit-popup powerline dash spinner hydra mmm-mode markdown-toc markdown-mode macrostep helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-gtags helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet gh-md elisp-slime-nav auto-compile packed ace-jump-helm-line zop-to-char zonokai-theme zerodark-theme zenburn-theme zen-and-art-theme yapfify x86-lookup ws-butler window-numbering which-key wgrep volatile-highlights visual-regexp-steroids vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection stickyfunc-enhance srefactor spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smex smeargle showkey seti-theme rtags reverse-theme restart-emacs ranger rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme quelpa quack pyvenv pytest pyenv-mode py-isort purple-haze-theme pt project-explorer professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox orgit organic-green-theme org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree nasm-mode naquadah-theme mwim mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mode-icons minimal-theme material-theme majapahit-theme magit-gitflow lush-theme lorem-ipsum live-py-mode linum-relative link-hint light-soap-theme key-chord jbeans-theme jazz-theme ivy-hydra ir-black-theme inkpot-theme info+ indent-guide imenu-list ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-make helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ ggtags geiser gandalf-theme flycheck-ycmd flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fiplr find-file-in-project fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-snipe evil-numbers evil-nerd-commenter evil-multiedit evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme engine-mode dumb-jump dtrt-indent dracula-theme django-theme disaster dired-subtree dired-narrow diff-hl deft define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme counsel-projectile corral company-ycmd company-statistics company-irony company-c-headers company-auctex company-anaconda column-enforce-mode color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode cmake-mode clues-theme clean-aindent-mode clang-format cherry-blossom-theme cedit busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent ag afternoon-theme adaptive-wrap ace-window ace-link ac-ispell)))
 '(projectile-project-root-files-functions
   (quote
    (projectile-root-top-down projectile-root-top-down-recurring)))
 '(projectile-project-root-files-top-down-recurring (quote (".projectile" ".svn" "CVS" "Makefile")))
 '(ripgrep-arguments (quote ("--no-ignore-vcs")))
 '(zerodark-use-high-contrast-in-mode-line nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-lead-face ((t (:foreground "red"))))
 '(avy-lead-face-0 ((t (:foreground "dark orange"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(evil-snipe-first-match-face ((t (:inherit nil :foreground "red" :underline "red"))))
 '(helm-swoop-target-line-block-face ((t (:inherit highlight))))
 '(helm-swoop-target-line-face ((t (:inherit highlight))))
 '(helm-swoop-target-word-face ((t (:inherit company-tooltip-selection))))
 '(hl-line ((t (:underline "goldenrod")))))
