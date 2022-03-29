;;; Reserved words
(setq ada83-keywords
      '(
        "abort" "abs" "accept" "access" "all" "and" "array" "at"
        "begin" "body"
        "case" "constant"
        "declare" "delay" "delta" "digits" "do"
        "else" "elsif" "end" "entry" "exception" "exit"
        "for" "function"
        "generic" "goto"
        "if" "in" "is"
        "limited" "loop"
        "mod"
        "new" "not" "null"
        "of" "or" "others" "out"
        "package" "pragma" "private" "procedure"
        "raise" "range" "record" "rem" "renames" "return" "reverse"
        "select" "separate" "subtype"
        "task" "terminate" "then" "type"
        "use"
        "when" "while" "with"
        "xor"))

(setq ada95-keywords
      '(
        "abstract" "aliased"
        "protected"
        "requeue"
        "tagged"
        "until"))

(setq ada05-keywords '("interface" "overriding" "synchronized"))

(setq ada12-keywords '("some"))

(setq ada22-keywords '("parallel"))

(setq madam-keywords-regexp
      (regexp-opt (append
                   ada83-keywords
                   ada95-keywords
                   ada05-keywords
                   ada12-keywords
                   ada22-keywords)
                  'words))

;;; Aspects
(setq ada-aspects '("Unreferenced"))
(setq madam-aspects-regexp (regexp-opt ada-aspects 'words))

(setq madam-font-lock-keywords
      `(
        (,madam-keywords-regexp . font-lock-keyword-face)
        (,madam-aspects-regexp . font-lock-preprocessor-face)
        ))

;;; Syntax table
(defconst madam-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; " is a string delimiter
    (modify-syntax-entry ?\" "\"" table)
    ;; - is punctuation, but -- is comment starter
    (modify-syntax-entry ?- ". 12" table)
    ;; \n is a comment ender
    (modify-syntax-entry ?\n ">" table)
    table))

(define-derived-mode madam-mode prog-mode "madam"
  :syntax-table madam-mode-syntax-table
  (setq font-lock-defaults '(madam-font-lock-keywords))
  (font-lock-fontify-buffer))

;;; Free stuff
(setq ada83-keywords nil)
(setq ada95-keywords nil)
(setq ada05-keywords nil)
(setq ada12-keywords nil)
(setq ada22-keywords nil)
(setq madam-keywords-regexp nil)

(setq ada-aspects nil)
(setq madam-aspects-regexp nil)
