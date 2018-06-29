;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

 ;; Add MELPA repository.
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass)))
 '(package-selected-packages (quote (elpy which-key auto-correct))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; emacs org mode
(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
 ;; removes start up message with tutorial etc
(setq inhibit-startup-message t)
 ;; always show column number
(setq column-number-mode t)
;; Always match pairs
(show-paren-mode 1)
;;paren-mode delay set to 0 seconds
(setq show-paren-delay 0)
;; maximised
(toggle-frame-maximized)
;; show line numbers on left side
(global-linum-mode t)
;; paste on text cursor
(setq mouse-yank-at-point t)
;; replace highlited text
(delete-selection-mode 1)
;; start emacs server
;;(server-start)
;; show buffer name not hostname
(setq-default frame-title-format
              '(:eval
                (format "%s@%s: %s %s"
                        (or (file-remote-p default-directory 'user)
                            user-real-login-name)
                        (or (file-remote-p default-directory 'host)
                            system-name)
                        (buffer-name)
                        (cond 
                         (buffer-file-truename
                          (concat "(" buffer-file-truename ")"))
                         (dired-directory
                          (concat "{" dired-directory "}"))
                         (t
                          "[no file]")))))

;; standup in flyspell-mode
(add-hook 'text-mode-hook (lambda () (flyspell-buffer)))

;; mouse mode in -nw
(xterm-mouse-mode 1)
