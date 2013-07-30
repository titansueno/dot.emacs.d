;;;; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-

;;; 日本語環境設定
(set-language-environment "Japanese")

;;; マウスカーソルを消す設定
(setq w32-hide-mouse-on-key t)
(setq w32-hide-mouse-timeout 5000)

;;; font-lockの設定
(global-font-lock-mode t)

;; YaTeX, yahtml
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq load-path (cons (expand-file-name "~/site-lisp/yatex") load-path))
(setq YaTeX-kanji-code 1) ; Shift_JIS
(setq tex-command "platex")
(setq dvi2-command "dviout")
(add-hook 'yatex-mode-hook '(lambda () (auto-fill-mode nil)))

(autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
(setq auto-mode-alist (cons (cons "\\.html$" 'yahtml-mode) auto-mode-alist))
(setq auto-mode-alist (cons (cons "\\.htm$" 'yahtml-mode) auto-mode-alist))
(setq yahtml-kanji-code 1) ; Shift_JIS
(setq yahtml-template-file (expand-file-name "~/yahtml-template.html"))
(add-hook 'yahtml-mode-hook '(lambda () (auto-fill-mode nil)))

;; c-mode, two space 'tab', replace tab with spaces
(setq-default tab-width 5)
(add-hook 'c-mode-common-hook
          '(lambda ()
                   (setq indent-tabs-mode nil) ; use 'spaces' instead of 'tab'
                   (c-set-style "k&r")
                   (setq c-basic-offset 4)))

;; Verilog-Mode
(defun prepend-path ( my-path )
(setq load-path (cons (expand-file-name my-path) load-path)))
(defun append-path ( my-path )
(setq load-path (append load-path (list (expand-file-name my-path)))))
(prepend-path "~/elisp")
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(setq auto-mode-alist (cons '("\\.v\\'" . verilog-mode) auto-mode-alist))
(add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1)))
(setq verilog-indent-level 4
	 verilog-indent-level-module 4
	 verilog-indent-level-declaration 4
	 verilog-indent-level-behavioral 4
	 verilog-indent-level-directive 4
	 verilog-auto-newline nil
	 verilog-auto-endcomments nil
	 verilog-auto-lineup '())

;; 選択範囲をマーク
(setq-default transient-mark-mode t)

;; バックアップを作らない
(setq make-backup-files nil)

;; CSS-mode
(autoload 'css-mode "css-mode")
(setq auto-mode-alist (cons '("\\.css\\'" . css-mode) auto-mode-alist))
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-newline-before-closing-bracket t)

;; ecmascript-mode
(autoload 'ecmascript-mode "ecmascript-mode" "ECMAScript" t)
(setq auto-mode-alist (cons '("\\.as\\'" . ecmascript-mode) auto-mode-alist))

;; js2-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; bibTeX関係
(setq bibtex-field-delimiters 'double-quotes)

;; refTeX関係
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(add-hook 'yatex-mode-hook
          #'(lambda ()
              (reftex-mode 1)
              (define-key reftex-mode-map
                (concat YaTeX-prefix ">") 'YaTeX-comment-region)
              (define-key reftex-mode-map
                (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))

;; ツールバー無効
(tool-bar-mode 0)

(setq inhibit-splash-screen t)

(custom-set-variables
 '(safe-local-variable-values (quote ((syntax . elisp)))))
(custom-set-faces )
(put 'upcase-region 'disabled nil)
