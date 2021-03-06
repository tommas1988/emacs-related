;; set default buffer file coding system
(setq-default buffer-file-coding-system 'utf-8-unix)

;; config highlight-current-line-minor-mode and a key bound
(highlight-current-line-minor-mode)
(highlight-current-line-set-bg-color "dark cyan")
(global-set-key (kbd "C-x C-h") 'highlight-current-line-minor-mode)

;; config hs-minor-mode
(global-set-key (kbd "C-c C-t") 'hs-toggle-hiding)

;; set ggtags-mode
(global-set-key (kbd "M-*") 'pop-tag-mark)

;; config c-mode
(add-hook 'c-mode-hook 'hs-minor-mode)
(eval-after-load 'ggtags
  '(define-key c-mode-base-map "\C-c\C-p" 'ggtags-prev-mark))
(eval-after-load 'ggtags
  '(define-key c-mode-base-map "\C-c\C-n" 'ggtags-next-mark))

;; org-mode settings
(setq org-src-fontify-natively t)
(setq org-startup-indented nil)

;; use company-mode in all buffers
(global-company-mode 1)

;; php-mode setting
;; set php executable for php-mode
(set-variable 'php-executable "php-interpreter")
;; set flymake-php
(add-hook 'php-mode-hook 'flymake-php-load)
;; set hs-minor-mode
(add-hook 'php-mode-hook 'hs-minor-mode)
;; set psr-2 coding style
(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)

;; config web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq web-mode-engines-alist '(("php" . "\\.phtml\\'")))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
;; force autoclosing and autoparing when used in tty
(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-pairing t)

;; config js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; config web-beautify
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))

;; turn on cursor change when Emacs is idle
(curchg-toggle-cursor-type-when-idle 1)

;; turn on column number mode
(column-number-mode)

;; show line number
;;(global-linum-mode)

;; turn on mouse avoidance mode
(mouse-avoidance-mode 'animate)

;; initialize smex
;;(smex-initialize)
;; key binds
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; overwrite etags key bind
;;(global-set-key (kbd "M-.") 'etags-select-find-tag-at-point)

;; set smartparens-global-mode
(smartparens-global-mode t)

;; set up window-numbering-mode
(window-numbering-mode t)

;; load sql-indent library
(load-library "sql-indent")

;; load sqlup to sql-mode
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hool 'sqlup-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes t)

 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(scroll-bar-mode nil))


(if window-system
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Lucida Console" :foundry "outline"  :weight normal :height 113 :width normal)))))
 ;; set minibuf font color
(set-face-foreground 'minibuffer-prompt "white"))

;; initialize color-theme
(load-theme 'monokai)
