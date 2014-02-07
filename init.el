;===============================================================================
; Main configuration
;===============================================================================
(server-start)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/ecb-2.40-patched")

(setq find-program "%APPDATA%\\.emacs.d\\unxutils\\find.exe")
(setq grep-program "%APPDATA%\\.emacs.d\\unxutils\\grep.exe")


;===============================================================================
; Editor operation
;===============================================================================
(cua-mode t)

; Row/column
(setq line-number-mode t)
(setq column-number-mode t)
(global-linum-mode t)

; Scrolling
(setq scroll-step 1
      scroll-conservatively 10000)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))

; Backup files
(setq make-backup-files nil)

; Automatically refresh buffer while change is detected
(global-auto-revert-mode 1)

; No wrapping
(setq-default truncate-lines 1)

; TAB
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

; Cursor
(setq-default cursor-type 'bar)

; Parentheses matching
(global-hl-line-mode 1)

; Column marker
(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(setq-default fci-rule-width 2)
(setq-default fci-rule-color "grey")
(add-hook 'after-change-major-mode-hook 'fci-mode)

;
; Coding system
;

; Create new files in utf-8
(setq-default default-buffer-file-coding-system 'utf-8)
; Open file in big5
(prefer-coding-system 'big5)

;===============================================================================
; Editor layout
;===============================================================================
(set-default-font "Consolas-9")
(load-theme 'wheatgrass t)
(tool-bar-mode -1)

; Frame dimension
(require 'frame-cmds)
; FIXME: Initialize frame width to 120 chars (not a trivial task..><)
(defun maximize-frame-vertically-left ()
  (interactive)
  (maximize-frame-vertically)
  (move-frame-to-screen-left (selected-frame)))
(global-set-key (kbd "C-c f <left>") 'maximize-frame-vertically-left)

(set-frame-width nil 120 nil)

;(set-frame-size (selected-frame) 120 60)
;(set-frame-position (selected-frame) 0 0)

;===============================================================================
; Language support
;===============================================================================

;-- C-like ---------------------------------------------------------------------

(setq-default c-basic-offset 4)

;
; ECB
;
; Note: Use the snapshot here
;       http://alexott.blogspot.tw/2012/06/ecb-fresh-emacscedet.html
;
(setq ecb-tip-of-the-day nil)
(require 'ecb)
;(add-hook 'c-mode-common-hook '(lambda () (ecb-activate)))

;
; Cscope
;
(require 'xcscope)

;-- Makefile -------------------------------------------------------------------
(defun tabs-makefile-hook ()
  (setq indent-tabs-mode t))
(add-hook 'makefile-mode-hook 'tabs-makefile-hook)

;===============================================================================
; Automatically generated (Don't modify)
;===============================================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
