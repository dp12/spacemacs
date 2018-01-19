;;; packages.el --- mail layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: dp12 <dp12@github.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `mail-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mail/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mail/pre-init-PACKAGE' and/or
;;   `mail/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mail-packages
  '()
  "The list of Lisp packages required by the mail layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

;; mu4e
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(setq mu4e-maildir "~/Maildir"
      mu4e-get-mail-command "mbsync -a"
      mu4e-update-interval 60
      mu4e-compose-signature-auto-include nil
      mu4e-view-show-images t
      mu4e-view-show-addresses t
      message-kill-buffer-on-exit t
      mu4e-change-filenames-when-moving t
      mu4e-context-policy 'pick-first
      mu4e-confirm-quit nil)
(add-hook 'message-mode-hook 'turn-on-orgtbl)
(add-hook 'message-mode-hook 'turn-on-orgstruct++)


(defun my-mu4e-action-view-with-xwidget (msg)
  "View the body of the message inside xwidget-webkit."
  (unless (fboundp 'xwidget-webkit-browse-url)
    (mu4e-error "No xwidget support available"))
  (let* ((html (mu4e-message-field msg :body-html))
         (txt (mu4e-message-field msg :body-txt))
         (tmpfile (format "%s%x.html" temporary-file-directory (random t))))
    (unless (or html txt)
      (mu4e-error "No body part for this message"))
    (with-temp-buffer
      ;; simplistic -- but note that it's only an example...
      (insert (or html (concat "<pre>" txt "</pre>")))
      (write-file tmpfile)
      (xwidget-webkit-browse-url (concat "file://" tmpfile) t))))

(with-eval-after-load 'mu4e
  (add-to-list 'mu4e-view-actions
               '("webkit" . my-mu4e-action-view-with-xwidget) t)
  (add-to-list 'mu4e-view-actions
               '("browser" . mu4e-action-view-in-browser) t))

;; Attach files with dired "C-c RET C-a"
(require 'gnus-dired)
;; make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
        (set-buffer buffer)
        (when (and (derived-mode-p 'message-mode)
                   (null message-sent-message-via))
          (push (buffer-name buffer) buffers))))
    (nreverse buffers)))
(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

(setq message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/bin/msmtp")

;; function to return first name of email recipients
;; used by yasnippet
;; from  http://pragmaticemacs.com/emacs/email-templates-in-mu4e-with-yasnippet/
;; and inspired by
;; http://blog.binchen.org/posts/how-to-use-yasnippets-to-produce-email-templates-in-emacs.html
(defun bjm/mu4e-get-names-for-yasnippet ()
  "Return comma separated string of names for an email"
  (interactive)
  (let ((email-name "") str email-string email-list email-name2 tmpname)
    (save-excursion
      (goto-char (point-min))
      ;; first line in email could be some hidden line containing NO to field
      (setq str (buffer-substring-no-properties (point-min) (point-max))))
    ;; take name from TO field - match series of names
    (when (string-match "^To: \"?\\(.+\\)" str)
      (setq email-string (match-string 1 str)))
    ;;split to list by comma
    (setq email-list (split-string email-string " *, *"))
    ;;loop over emails
    (dolist (tmpstr email-list)
      ;;get first word of email string
      (setq tmpname (car (split-string tmpstr " ")))
      ;;remove whitespace or ""
      (setq tmpname (replace-regexp-in-string "[ \"]" "" tmpname))
      ;;join to string
      (setq email-name
            (concat email-name ", " tmpname)))
    ;;remove initial comma
    (setq email-name (replace-regexp-in-string "^, " "" email-name))

    ;;see if we want to use the name in the FROM field
    ;;get name in FROM field if available, but only if there is only
    ;;one name in TO field
    (if (< (length email-list) 2)
        (when (string-match "^\\([^ ,\n]+\\).+writes:$" str)
          (progn (setq email-name2 (match-string 1 str))
                 ;;prefer name in FROM field if TO field has "@"
                 (when (string-match "@" email-name)
                   (setq email-name email-name2))
                 )))
    email-name))

(defun mu4e-alert-update-mail-count-interactive ()
  (interactive)
  (mu4e-alert-update-mail-count-modeline))

(defun mu4e-jump-to-unread ()
  (interactive)
  (persp-switch "mail")
  (mu4e-alert-view-unread-mails))

;; xwidget web browsing
;; make these keys behave like normal browser
(defun xwidget-webkit-scroll-vertical (scroll)
  "Scroll webkit a specified amount."
  (xwidget-set-adjustment (xwidget-webkit-last-session) 'vertical t scroll))

(with-eval-after-load 'xwidget
  (define-key xwidget-webkit-mode-map [mouse-4] 'xwidget-webkit-scroll-down)
  (define-key xwidget-webkit-mode-map [mouse-5] 'xwidget-webkit-scroll-up)
  (define-key xwidget-webkit-mode-map (kbd "<up>") 'xwidget-webkit-scroll-down)
  (define-key xwidget-webkit-mode-map (kbd "<down>") 'xwidget-webkit-scroll-up)
  (define-key xwidget-webkit-mode-map (kbd "k") 'xwidget-webkit-scroll-down)
  (define-key xwidget-webkit-mode-map (kbd "j") 'xwidget-webkit-scroll-up)
  (define-key xwidget-webkit-mode-map (kbd "C-u") (lambda () (interactive)
                                                    (xwidget-webkit-scroll-vertical -250)))
  (define-key xwidget-webkit-mode-map (kbd "C-d") (lambda () (interactive)
                                                    (xwidget-webkit-scroll-vertical 250)))
  (define-key xwidget-webkit-mode-map (kbd "q") 'spacemacs/delete-window)
  (define-key xwidget-webkit-mode-map (kbd "M-w") 'xwidget-webkit-copy-selection-as-kill)
  (define-key xwidget-webkit-mode-map (kbd "C-c") 'xwidget-webkit-copy-selection-as-kill)
  (evil-set-initial-state 'xwidget-webkit-mode 'emacs))

;; adapt webkit according to window configuration chagne automatically
;; without this hook, every time you change your window configuration,
;; you must press 'a' to adapt webkit content to new window size
(add-hook 'window-configuration-change-hook (lambda ()
                                              (when (equal major-mode 'xwidget-webkit-mode)
                                                (xwidget-webkit-adjust-size-dispatch))))

;; by default, xwidget reuses previous xwidget window,
;; thus overriding your current website, unless a prefix argument
;; is supplied
;;
;; This function always opens a new website in a new window
(defun xwidget-browse-url-no-reuse (url &optional session)
  (interactive (progn
                 (require 'browse-url)
                 (browse-url-interactive-arg "xwidget-webkit URL: "
                                             )))
  (xwidget-webkit-browse-url url t))

;; make xwidget default browser
;; (setq browse-url-browser-function (lambda (url session)
;;                                     (other-window 1)
;;                                     (xwidget-browse-url-no-reuse url)))

;;; packages.el ends here
