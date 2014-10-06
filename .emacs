;;; Package --- Summary
;;; This is StanleyZ's personal emacs configuration file
(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)



;;; Commentary:
;;; no idea why Emacs insist that this section is required.



;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (tango-dark)))
 '(font-use-system-font nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Show the line number
(global-linum-mode t)

;; show the buffer name in the title
(setq frame-title-format "emacs@%b")

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;;不产生备份文件
(setq make-backup-files nil)

;; Load purcell
(load "~/.emacs.d/init.el")
