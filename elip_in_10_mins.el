(+ 3 (+ 1 2))

;; `setq' stores a value into a variable:
(setq my-name "Bastien")
(insert "Hello!")
(insert "Hello" " world!")
(insert "Hello, I am " my-name)

(defun hello () (insert "Hello, I am " my-name))

(hello)

(defun hello (name) (insert "Hello " name))

(hello "you")

;; Now switch to a new buffer named "*test*" in another window:
(switch-to-buffer-other-window "*test*")

;; You can combine several sexps with `progn':
(progn
  (switch-to-buffer-other-window "*test*")
  (hello "you"))


;; It's often useful to erase the buffer:
(progn
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello "there"))

;; Or to go back to the other window:
(progn
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello "you")
  (other-window 1))

;; You can bind a value to a local variable with `let':
(let ((local-name "you"))
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello local-name)
  (other-window 1))


;; Let's format a string:
(format "Hello %s!\n" "visitor")

;; Let's refine our function by using format:
(defun hello (name)
  (insert (format "Hello %s!\n" name)))

(hello "you")


;; Let's create another function which uses `let':
(defun greeting (name)
  (let ((your-name "Bastien"))
    (insert (format "Hello %s!\n\nI am %s."
		    name       ; the argument of the function
		    your-name  ; the let-bound variable "Bastien"
		    ))))

;; And evaluate it:
(greeting "you")


;; Some functions are interactive:
(read-from-minibuffer "Enter your name: ")

(defun greeting (from-name)
  (let ((your-name (read-from-minibuffer "Enter your name: ")))
    (insert (format "Hello!\n\nI am %s and you are %s."
		    from-name ; the argument of the function
		    your-name ; the let-bound var, entered at prompt
		    ))))

(greeting "Bastien")


;; Let's complete it by displaying the results in the other window:
(defun greeting (from-name)
  (let ((your-name (read-from-minibuffer "Enter your name: ")))
    (switch-to-buffer-other-window "*test*")
    (erase-buffer)
    (insert (format "Hello %s!\n\nI am %s." your-name from-name))
    (other-window 1)))

;; Now test it:
(greeting "Bastien")


(setq list-of-names '("Sarah" "Chloe" "Mathilde"))

;; Get the first element of this list with `car':
(car list-of-names)

;; Get a list of all but the first element with `cdr':
(cdr list-of-names)

;; Add an element to the beginning of a list with `push':
(push "Stephanie" list-of-names)


;; Let's call `hello' for each element in `list-of-names':
(mapcar 'hello list-of-names)

(defun greeting ()
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (mapcar 'hello list-of-names)
  (other-window 1))

(greeting)


(defun replace-hello-by-bonjour ()
  (switch-to-buffer-other-window "*test*")
  (goto-char (point-min))
  (while (search-forward "Hello")
    (replace-match "Bonjour"))
  (other-window 1))

(replace-hello-by-bonjour)

(defun hello-to-bonjour ()
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  ;; Say hello to names in `list-of-names'
  (mapcar 'hello list-of-names)
  (goto-char (point-min))
  ;; Replace "Hello" by "Bonjour"
  (while (search-forward "Hello" nil 't)
    (replace-match "Bonjour"))
  (other-window 1))

(hello-to-bonjour)


(defun boldify-names ()
  (switch-to-buffer-other-window "*test*")
  (goto-char (point-min))
  (while (re-search-forward "Bonjour \\(.+\\)!" nil 't)
    (add-text-properties (match-beginning 1)
			 (match-end 1)
			 (list 'face 'bold)))
  (other-window 1))

(boldify-names)
