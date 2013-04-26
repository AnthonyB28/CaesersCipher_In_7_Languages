#|Converts the character based on a check
  against the uppercase/lowercase value|#
(defun convert (char cipher)
  (let*
    (
	 #|An implementation using ASCII character encoding 
		 might return these values:
			(char-code #\$) =>  36
			(char-code #\a) =>  97 |#
	 (myChar  (char-code  char))
     (fLetter 
		(cond 
		#|Try swapping these arround? |#
            ((and (>= myChar (char-code #\A)) 
			(<= myChar (char-code #\Z))) (char-code #\A)))
	  )
	)
	#|This is.... ridiculous.
	  In order to get the notation right,
	  I have to space it out like this.
	  The addition is just confusing without the spacing to me.
	|#
     (if fLetter  (code-char
	 (+ 
	 (mod
	 (+ 
	 (- myChar fLetter ) 
	 cipher) 26) 
	 fLetter)) 
	 char)
   )
)

;;This function does the actual encryption call
(defun encryptFun (input cipher)
	
	(map 'string #'
		(lambda (char) 
			(convert char cipher)) 
	(string-upcase input))
)

;;Made this a seperate function to look pretty
(defun encrypt (input cipher)
	(format t "Encrypted:")
	(encryptFun input cipher)
)

;;Calls encryption but with a negative key
(defun decrypt (input cipher)
	(format t "Decrypted:")
	(encryptFun input (- cipher))
)

;;Calls the encryptFun rather than the
;;decrypt fun for neatness
(defun solve (input maxCipher)
	(loop for i from maxCipher downto 0 do
	(format t "Cipher ~s" i)
	(format t ": ~s~%" (encryptFun input i))
	)
)
 