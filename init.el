;===============================================================================
; Main configuration
;===============================================================================
(setq inhibit-startup-screen t)
(server-start)
; Avoid the annoying "Buffer still has clients" question
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/ecb-2.40-patched")

; Supply *nix commands and .el only for Windows, Linux have theirs installed globally
(when (eq system-type `windows-nt)
  (add-to-list 'load-path "~/.emacs.d/lisp_windows")
  (setq find-program "%APPDATA%\\.emacs.d\\program_windows\\find.exe")
  (setq grep-program "%APPDATA%\\.emacs.d\\program_windows\\grep.exe")
)

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
; Priority order of encoding to open file: utf-8 with BOM -> utf-8 -> big5 -> gb2312
(prefer-coding-system 'gb2312)
(prefer-coding-system 'big5)
;(prefer-coding-system 'utf-8)
;(prefer-coding-system 'utf-8-auto)

;===============================================================================
; Editor layout
;===============================================================================
(cond
  ((eq system-type 'windows-nt) (set-default-font "Consolas-9"))
  ((eq system-type 'gnu/linux) (set-default-font "Monospace-9"))
)
(load-theme 'wombat t)
(tool-bar-mode -1)

; Frame dimension
;(require 'frame-cmds)
; FIXME: Initialize frame width to 120 chars (not a trivial task..><)
;(defun maximize-frame-vertically-left ()
;  (interactive)
;  (maximize-frame-vertically)
;  (move-frame-to-screen-left (selected-frame)))
;(global-set-key (kbd "C-c f <left>") 'maximize-frame-vertically-left)

(set-frame-width nil 120 nil)

;(set-frame-size (selected-frame) 120 60)
;(set-frame-position (selected-frame) 0 0)

(setq frame-title-format (list "%b  (" '((:eval default-directory)) ")"))

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
(setq ecb-options-version "2.40")
;(add-hook 'c-mode-common-hook '(lambda () (ecb-activate)))

;
; Cscope
;
(require 'xcscope)

;-- Makefile -------------------------------------------------------------------
(defun tabs-makefile-hook ()
  (setq indent-tabs-mode t))
(add-hook 'makefile-mode-hook 'tabs-makefile-hook)



