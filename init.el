;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     javascript
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     asm
     auto-completion
     better-defaults
     ;; helm
     emacs-lisp
     (colors :variables
             colors-enable-nyan-cat-progress-bar t
             nyan-bar-length 8)
     (c-c++ :variables
            c-c++-backend 'lsp-cquery
            c-c++-lsp-sem-highlight-rainbow t)
     custom
     deft
     evil-snipe
     (git :variables
          git-gutter-use-fringe t)
     gtags
     imenu-list
     ivy
     lsp
     mail
     markdown
     (mu4e :variables
           mu4e-account-alist t
           mu4e-enable-notifications t
           mu4e-enable-mode-line t
           mu4e-enable-async-operations t
           mu4e-use-maildirs-extension t)
     (multiple-cursors :variables multiple-cursors-backend 'evil-mc)
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
     ;; Prevent byte-compiling when in lisp mode
     (semantic :disabled-for emacs-lisp)
     (spell-checking :variables spell-checking-enable-by-default nil)
     ;; syntax-checking
     text-editing
     themes-megapack
     version-control
     vinegar
     ;; ycmd
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(;; Appearance
                                      mode-icons spaceline-all-the-icons
                                      all-the-icons-dired minimap tabbar
                                      tabbar-ruler
                                      ;; Themes
                                      color-theme-solarized zerodark-theme
                                      atom-one-dark-theme poet-theme
                                      ;; Text-editing tools
                                      visual-regexp-steroids cedit ialign
                                      ;; Search tools
                                      rtags projectile-ripgrep ag helm-ag
                                      deadgrep ztree
                                      ;; Evil extensions
                                      evil-lion evil-replace-with-register
                                      evil-string-inflection evil-fringe-mark
                                      evil-textobj-syntax
                                      ;; Company
                                      company-try-hard company-prescient
                                      ;; Programming tools
                                      shell-pop project-explorer quickrun
                                      format-all ivy-prescient
                                      ;; Modes
                                      arduino-mode
                                      ;; Elisp programming
                                      elmacro helpful elsa flycheck-elsa
                                      package-lint flycheck-package
                                      ;; Non-MELPA
                                      (evil-briefcase :location (recipe :fetcher github :repo "strickinato/evil-briefcase"))
                                      (snakehump :location (recipe :fetcher github :repo "aes/snakehump"))
                                      (source-peek :location (recipe :fetcher github :repo "iqbalansari/emacs-source-peek"))
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'doge

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-one
                         solarized-dark
                         ;; glowfish-contrast
                         monokai
                         zerodark
                         exotica
                         rebecca
                         nimbus
                         ;; firebelly
                         ;; niflheim
                         sanityinc-solarized-light
                         spacemacs-dark
                         leuven
                         seti
                         moe-dark)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;; dotspacemacs-default-font '("Tamsynmod"
   ;; dotspacemacs-default-font '("Ubuntu Mono"
   ;; dotspacemacs-default-font '("Lode"
   ;; dotspacemacs-default-font '("Neep"
   ;; dotspacemacs-default-font '("orp" ;small
   ;; dotspacemacs-default-font '("Roboto Mono"
   ;; dotspacemacs-default-font '("Neep"
   ;; dotspacemacs-default-font '("bitocra13full"
   dotspacemacs-default-font '("GohuFont" ; very clear
   ;; dotspacemacs-default-font '("Dina" ; very clear
   ;; dotspacemacs-default-font '("sys" ; small but clear
   ;; dotspacemacs-default-font '("CtrlD"
                               :size 17
                               ;; :weight semibold
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
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

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
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

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
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

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  ;; (push '(use-package . "melpa-stable") package-pinned-packages)
  (setq-default evil-shift-round nil)
  (when (string-equal system-type "windows-nt")
    (set-fontset-font t '(#x2680 . #x26FF) (font-spec :family "DejaVu Sans Mono" :size 20))
    (set-fontset-font t '(#x26aa . #x26ac) (font-spec :family "DejaVu Sans Mono" :size 20))
    (setq-default ispell-program-name "C:/bin/hunspell/bin/hunspell")
    (setq ispell-local-dictionary "en_US")
    (setq ispell-local-dictionary-alist
         '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8))))
    (setq flyspell-issue-message-flag nil)
    (defun flyspell-buffer-after-pdict-save (&rest _)
      (flyspell-buffer))
    (advice-add 'ispell-pdict-save :after #'flyspell-buffer-after-pdict-save)
  (add-to-list 'load-path "~/.spacemacs.d/themes")
  (add-to-list 'custom-theme-load-path "~/.spacemacs.d/themes"))

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
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
  (setq split-height-threshold nil) ;; use vertical splits only
  (global-set-key (kbd "C-H f") #'helpful-callable)
  (global-set-key (kbd "C-H v") #'helpful-variable)
  (global-set-key (kbd "C-H k") #'helpful-key)
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
  (global-set-key (kbd "M-<down>") 'move-text-down)
  (global-set-key (kbd "M-<up>") 'move-text-up)
  (global-set-key (kbd "C-M-S-<right>") 'sp-slurp-hybrid-sexp)
  (global-set-key (kbd "C-M-S-<down>") 'sp-push-hybrid-sexp)
  (global-set-key (kbd "C-M-S-<up>") 'sp-transpose-hybrid-sexp)
  (global-set-key (kbd "C-M-S-k") 'sp-kill-hybrid-sexp)
  (define-key evil-normal-state-map (kbd "M-.") 'ggtags-find-tag-dwim)
  (define-key evil-normal-state-map (kbd "C-M-.") 'helm-gtags-find-tag-other-window)
  (add-hook 'ripgrep-search-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "q") 'quit-window)))
  (global-set-key (kbd "M-U") 'downcase-word)
  (global-set-key (kbd "C-x f") 'recentf-open-files)
  (global-set-key (kbd "M-?") 'company-complete)
  (global-set-key (kbd "M-I") 'company-rtags)
  ;; (global-set-key (kbd "M-I") 'company-irony)
  (global-set-key (kbd "M-Y") 'company-ycmd)
  (global-set-key (kbd "M-Q") 'company-lsp)
  (global-set-key (kbd "M-H") 'company-try-hard)
  (company-prescient-mode)
  (global-set-key (kbd "M-G") 'git-complete)
  (define-key yas-minor-mode-map [backtab] 'hippie-expand)
  (define-key evil-normal-state-map (kbd "M-m") 'back-to-indentation)
  ;; (setq projectile-indexing-method 'native)
  (add-to-list 'auto-mode-alist '("\\.bin\\'" . hexl-mode))
  (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
  ;; Hide the async shell command buffer by default
  ;; (add-to-list 'display-buffer-alist (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))
  (defadvice async-shell-command (around hide-async-windows activate) (save-window-excursion ad-do-it))
  (add-to-list 'warning-suppress-types '(yasnippet backquote-change))
  (set-face-attribute hl-line-face nil :underline "goldenrod" :inherit nil)
  (set-face-background 'hl-line nil)
  ;; Spacemacs workaround for query-replace failing with "Args out of range"
  (setq frame-title-format nil)

  ;; Spacemacs
  (setq spacemacs-mode-line-minor-modesp nil)

  ;; Spaceline theme
  ;; (use-package spaceline-all-the-icons
  ;;   :after spaceline
  ;;   :config (spaceline-all-the-icons-theme))
  ;; (spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
  ;; (spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
  ;; (spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
  ;; (spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line
  ;; (spaceline-toggle-all-the-icons-vc-icon-on)
  ;; (spaceline-toggle-all-the-icons-fullscreen-on)
  ;; (spaceline-toggle-all-the-icons-flycheck-status-on)
  ;; (spaceline-toggle-all-the-icons-git-status-on)
  ;; (spaceline-toggle-all-the-icons-vc-icon-on)
  ;; (spaceline-toggle-all-the-icons-mode-icon-on)
  ;; (spaceline-toggle-all-the-icons-package-updates-on)
  ;; (spaceline-toggle-all-the-icons-text-scale-on)
  ;; (spaceline-toggle-all-the-icons-region-info-on)
  ;; (spaceline-toggle-all-the-icons-multiple-cursors)
  ;; (setq-default spaceline-all-the-icons-separator-type 'arrow)

  (setq spaceline-version-control-p nil)
  (setq spaceline-buffer-encoding-p nil)
  (setq spaceline-buffer-encoding-abbrev-p nil)
  (setq spaceline-projectile-root-p nil)
  (setq spaceline-purpose-p nil)
  ;; (setq powerline-default-separator 'nil) ;; straight bar
  ;; (spaceline-compile)
  (spacemacs|create-align-repeat-x "hex" "0x")

  ;; Avy and evil-snipe
  (define-key evil-normal-state-map (kbd "n") 'avy-goto-char-2)
  (setq avy-keys (number-sequence ?a ?z))
  (set-face-attribute 'evil-snipe-matches-face nil :inherit nil :foreground "red" :box '(:color "lawn green" :style released-button))
  (setq evil-snipe-scope 'buffer)
  (setq evil-snipe-repeat-scope 'buffer)
  (define-key evil-normal-state-map (kbd "go") 'avy-goto-word-1)

  ;; Evil config
  (define-key evil-normal-state-map (kbd "+") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "-") 'evil-numbers/dec-at-pt)
  (define-key evil-insert-state-map "\C-x\C-n" 'evil-complete-next-line)
  (define-key evil-insert-state-map "\C-x\C-p" 'evil-complete-previous-line)
  (define-key evil-normal-state-map (kbd "[s") (lambda (n) (interactive "p") (dotimes (c n nil) (insert " "))))
  (define-key evil-normal-state-map (kbd "]s") (lambda (n) (interactive "p")
                                                 (forward-char) (dotimes (c n nil) (insert " ")) (backward-char (1+ n))))
  (define-key evil-normal-state-map (kbd "[n") (lambda (n) (interactive "p")
                                                 (previous-line) (end-of-line) (dotimes (c n nil) (insert "\n"))))
  (define-key evil-normal-state-map (kbd "]n") (lambda (n) (interactive "p")
                                                  (dotimes (c n nil) (end-of-line) (insert "\n"))))
  (define-key evil-normal-state-map (kbd "[w") 'eyebrowse-next-window-config)
  (define-key evil-normal-state-map (kbd "]w") 'eyebrowse-prev-window-config)
  (define-key evil-normal-state-map (kbd "M-w") 'evil-delete-backward-word)

  ;; evil-args
  (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
  (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
  (define-key evil-normal-state-map "L" 'evil-forward-arg)
  (define-key evil-normal-state-map "H" 'evil-backward-arg)
  (define-key evil-motion-state-map "L" 'evil-forward-arg)
  (define-key evil-motion-state-map "H" 'evil-backward-arg)
  (define-key evil-normal-state-map "K" 'evil-jump-out-args)

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
  (setq evil-replace-with-register-key (kbd "gR"))

  (with-eval-after-load 'evilnc
    (define-key evil-inner-text-objects-map evilnc-comment-text-object 'evilnc-inner-comment)
    (define-key evil-outer-text-objects-map evilnc-comment-text-object 'evilnc-outer-comment))

  ;; Evil multiple-cursors/Iedit
  (add-hook 'prog-mode-hook 'turn-on-evil-mc-mode)
  (define-key evil-normal-state-map (kbd "[m") 'evil-mc-mode)
  (define-key evil-normal-state-map (kbd "[i") 'evil-iedit-state/iedit-mode)
  (setq evil-mc-mode-line-prefix "ⓜ")
  (global-set-key (kbd "C-S-<mouse-1>") 'evil-mc-toggle-cursor-on-click)
  (setq evil-mc-undo-cursors-on-keyboard-quit t)

  ;; Evil fringe mark
  (global-evil-fringe-mark-mode)
  (setq-default left-fringe-width 16)
  (setq-default evil-fringe-mark-side 'left-fringe)
  (spacemacs|diminish global-evil-fringe-mark-mode)

  ;; Evil briefcase
  (evil-briefcase-mode 1)

  ;; Magit
  (with-eval-after-load 'magit
    ;; Use shift-return to open file from magit in another window.
    (define-key magit-file-section-map (kbd "S-<return>") (lambda ()
                                                    (interactive)
                                                    (let ((current-prefix-arg '(4)))
                                                      (call-interactively 'magit-diff-visit-file))))
    (define-key magit-hunk-section-map (kbd "S-<return>") (lambda ()
                                                       (interactive)
                                                       (let ((current-prefix-arg '(4)))
                                                         (call-interactively 'magit-diff-visit-file))))
    (setq magit-stage-all-confirm nil)
    (setq magit-unstage-all-confirm nil)
    (add-hook 'magit-mode-hook (lambda () (evil-briefcase-mode 0))))

  (defun magit-yank ()
    (interactive)
    (evil-yank)
    (kill-new (replace-regexp-in-string "^\+ " "" (substring-no-properties (car kill-ring)))))
  ;; (defun wrapper (&rest args)
  ;;   (interactive (advice-eval-interactive-spec
  ;;                 (cadr (interactive-form #'wrappee))))
  ;;   (apply #'wrappee args))

  ;; Ycmd
  (with-eval-after-load 'ycmd
    (setq ycmd-server-command (list "python" (file-truename "~/ycmd/ycmd")))
    (add-hook 'c-mode-hook 'ycmd-mode)
    (add-hook 'c++-mode-hook 'ycmd-mode)
    (setq ycmd-force-semantic-completion t))
  (spacemacs|diminish ycmd-mode "Ⓨ")

  (setq request-message-level -1) ;; make ycmd less annoying

  ;; Ediff
  ;; From http://stackoverflow.com/questions/9656311/conflict-resolution-with-emacs-ediff-how-can-i-take-the-changes-of-both-version
  (defun ediff-copy-both-to-C ()
    (interactive)
    (ediff-copy-diff ediff-current-difference nil 'C nil
                     (concat
                      (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                      (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
  (defun add-c-to-ediff-mode-map () (define-key ediff-mode-map "c" 'ediff-copy-both-to-C))
  (add-hook 'ediff-keymap-setup-hook 'add-c-to-ediff-mode-map)

  ;; Dired
  (with-eval-after-load 'dired
    (define-key dired-mode-map "a" 'ripgrep-regexp)
    (define-key dired-mode-map "A" 'helm-ag)
    (define-key dired-mode-map "W" 'wdired-change-to-wdired-mode)
    (define-key dired-mode-map (kbd "M-n") 'dired-narrow)
    (setq dired-dwim-target t)
    (setq diff-hl-dired-mode t)
    (add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode t)))
    (setq dired-listing-switches "--group-directories-first -alh")
    (spacemacs|diminish all-the-icons-dired-mode)
    (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

  ;; Start wdired in evil normal mode
  (add-hook 'wdired-mode-hook
            (lambda () (evil-normal-state)))

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
                      (uniquify-buffer-base-name))))
      (when filename
        (kill-new filename)
        (message "%s" filename))))

  (defun projectile-ripgrep-filename ()
    "Search for the current filename"
    (interactive)
    (projectile-ripgrep (uniquify-buffer-base-name)))

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
  ;; Use rg as helm-ag backend
  (setq helm-ag-base-command "rg --no-heading")

  ;; Ivy
  (global-set-key "\C-s" 'counsel-grep-or-swiper)
  (global-set-key (kbd "C-S-s") 'isearch-forward)
  (global-set-key (kbd "C-S-r") 'isearch-backward)
  (define-key ivy-minibuffer-map (kbd "C-w") 'ivy-next-history-element)
  (define-key ivy-minibuffer-map (kbd "C-s") 'ivy-next-history-element)
  (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line-or-history)
  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line-or-history)
  (define-key ivy-minibuffer-map (kbd "C-u") 'ivy-kill-line)

  (ivy-set-actions
   'counsel-M-x
   '(("y" kill-new "copy name")
     ("h" (lambda (x) (describe-function (intern x))) "help")))

  (setq ivy-re-builders-alist
        '(
          ;; (counsel-imenu . ivy--regex-fuzzy)
          (counsel-bookmark . ivy--regex-fuzzy)
          (ivy-switch-buffer . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))
  ;; automatically start looking for functions in counsel imenu
  (setq ivy-initial-inputs-alist '((counsel-imenu . "Function ")))
  (add-hook 'imenu-after-jump-hook #'recenter-top-bottom)

  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c k") 'counsel-ag)

  ;; Eyebrowse
  (defun eyebrowse-auto-rename ()
    (interactive)
    (eyebrowse-rename-window-config
     (eyebrowse--get 'last-slot) (uniquify-buffer-base-name)))
  (add-hook 'eyebrowse-post-window-switch-hook 'eyebrowse-auto-rename)

  (defun persp-layout-sort (&rest dummy)
    (setq persp-names-cache
          (cons "Default" (sort (delete "Default" persp-names-cache)
                                'string-collate-lessp))))
  (add-hook 'persp-created-functions 'persp-layout-sort)
  (add-hook 'persp-renamed-functions 'persp-layout-sort)

  ;; Leader keys
  (spacemacs/set-leader-keys
    "ak" 'avy-kill-region
    "aK" 'avy-kill-whole-line
    "ar" 'avy-copy-region
    "ay" 'avy-copy-line
    "qa" 'anzu-query-replace-regexp
    "dm" 'delete-matching-lines
    "bx" 'ace-swap-window
    "bk" (kbd "C-x k")
    "bl" 'list-bookmarks
    "cq" 'lsp-cquery-enable
    "ed" 'ediff-buffers
    "er" 'evil-show-registers
    "em" 'evil-show-marks
    "dk" 'kill-dired-buffers
    "dj" 'dired-jump
    "do" 'dired-jump-other-window
    "d." 'dired-omit-mode
    "dg" 'dumb-jump-go
    "dG" 'dumb-jump-go-other-window
    "dl" 'dumb-jump-quick-look
    "db" 'dumb-jump-back
    "ps" 'lsp-ui-sideline-mode
    "pd" 'lsp-ui-peek-find-definitions
    "pr" 'lsp-ui-peek-find-references
    "ew" 'eww
    "fn" 'copy-file-basename-to-clipboard
    "fN" 'projectile-ripgrep-filename
    "fz" 'counsel-fzf
    "gd" 'gdb-set-fast-breakpoint
    "gn" 'git-timemachine-show-next-revision
    "gp" 'git-timemachine-show-previous-revision
    "gB" 'git-timemachine-blame
    "gr" 'ggtags-find-reference
    "gh" 'ggtags-find-declaration
    "ha" 'helm-ag
    "hx" 'hexl-mode
    "h." 'highlight-symbol-at-point
    "hr" 'unhighlight-regexp
    "if" 'counsel-recentf
    "ca" 'counsel-linux-app
    "rd" 'rtags-find-symbol-at-point
    "rf" 'rtags-find-references-at-point
    "rt" 'rtags-taglist
    "rg" 'projectile-ripgrep
    "rr" 'parrot-start-animation
    "ro" 'deadgrep
    "rc" 'counsel-rg
    "ir" 'ivy-resume
    "ry" 'counsel-yank-pop
    "bj" 'counsel-bookmark
    "ib" 'counsel-bookmark
    "ix" 'ido-clear-virtual-buffers
    "mc" 'evil-mc-mode
    "mi" 'evil-matchit-mode
    "mm" 'minimap-mode
    "ml" 'imenu-list-smart-toggle
    "ms" 'evilmi-select-items
    "ma" 'mu4e-alert-update-mail-count-interactive
    "mu" 'mu4e-update-mail-and-index-wrapper
    "mj" 'mu4e-jump-to-mail
    "nx" 'narrow-search-buffer-to-regexp
    "oi" 'helm-semantic-or-imenu
    "ou" 'org-previous-visible-heading
    "og" 'counsel-org-goto
    "oh" 'org-toggle-heading
    "oc" 'insert-org-checkbox
    "ga" 'projectile-find-other-file-other-window
    "pj" 'project-explorer-toggle
    "gB" 'magit-blame-quit
    "mf" 'magit-find-file
    "mp" 'magit-file-popup
    "rh" 'vc-region-history
    "su" 'string-inflection-underscore
    "sl" 'sort-lines
    "Sp" 'shell-pop
    "te" 'treemacs
    "Sv" 'flyspell-visible
    "tu" 'untabify
    "tt" 'tabify
    "id" 'insert-doxygen-stub
    "ih" 'insert-header-guards
    "iv" 'insert-void-stub
    "i0" 'insert-if0
    "ie" 'insert-endif
    "--" 'insert-arrow-or-replace-period
    "w1" 'eyebrowse-switch-to-window-config-1
    "w2" 'eyebrowse-switch-to-window-config-2
    "w3" 'eyebrowse-switch-to-window-config-3
    "w4" 'eyebrowse-switch-to-window-config-4
    "w5" 'eyebrowse-switch-to-window-config-5
    "w6" 'eyebrowse-switch-to-window-config-6
    "w7" 'eyebrowse-switch-to-window-config-7
    "w8" 'eyebrowse-switch-to-window-config-8
    "w9" 'eyebrowse-switch-to-window-config-9
    "w|" 'split-window-right
    "wx" 'eyebrowse-close-window-config
    "w TAB" 'eyebrowse-last-window-config
    "L"  'spacemacs/workspaces-transient-state/body
    "W"  'spacemacs/workspaces-transient-state/body
    "xai" 'ialign
    "xax" 'spacemacs/align-repeat-hex
    "xx" 'align-regexp
    "xy" 'link-hint-copy-link
    "-f" 'flip-snake-kebab
    "-n" 'snakehump-next-at-point
    "-p" 'snakehump-next-at-point
    "."  'evilnc-copy-and-comment-lines
    )

  ;; Org-mode
  (require 'org-drill)
  (require 'org-mouse)
  (setq org-startup-indented t)
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
  (setq org-src-fontify-natively t)
  ;; Use middle dot instead of "-" list markers
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

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
  (add-to-list 'org-structure-template-alist
               '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))
  (add-to-list 'org-structure-template-alist
               '("cs" "#+BEGIN_SRC c\n?\n#+END_SRC"))
  (add-to-list 'org-structure-template-alist
               '("cpp" "#+BEGIN_SRC c++\n?\n#+END_SRC"))
  (add-to-list 'org-structure-template-alist
               '("py" "#+BEGIN_SRC python\n?\n#+END_SRC"))

  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme '(textobjects navigation additional todo))
              (evil-define-key 'normal evil-org-mode-map
                (kbd "M-o") (evil-org-define-eol-command org-insert-subheading))))

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

  ;; Tabbar
  (setq tabbar-ruler-global-tabbar t)     ; get tabbar
  (setq tabbar-ruler-global-ruler nil)    ; get global ruler
  (setq tabbar-ruler-popup-menu nil)      ; get popup menu
  (setq tabbar-ruler-popup-toolbar nil)   ; get popup toolbar
  (setq tabbar-ruler-popup-scrollbar nil) ; show scroll-bar on mouse-move
  (setq tabbar-ruler-style 'firefox-circle)
  (require 'tabbar-ruler)
  (add-hook 'persp-mode-hook (lambda ()
                               (setq tabbar-buffer-list-function #'tabbar-ruler-tabbar-buffer-list)))
  (define-key evil-normal-state-map (kbd "g t") 'tabbar-forward-tab)
  (define-key evil-normal-state-map (kbd "g T") 'tabbar-backward-tab)

  (desktop-save-mode)
  (setq desktop-restore-eager 2)
  (setq desktop-restore-frames nil)
  (setq desktop-load-locked-desktop t)
  (add-to-list 'desktop-globals-to-save 'register-alist)
  (add-to-list 'desktop-locals-to-save 'evil-markers-alist)
  (desktop-read)
)

;; Save off custom settings to custom.el
(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)
