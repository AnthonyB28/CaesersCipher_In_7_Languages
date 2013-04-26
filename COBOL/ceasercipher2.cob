IDENTIFICATION DIVISION.
PROGRAM-ID. CEASER-1-CIPHER.
AUTHOR. ANTHONYBARRANCO.
INSTALLATION. XYZ.
DATE-WRITTEN. 20/4/13.

DATA DIVISION.
WORKING-STORAGE SECTION.
  01 INPUTE PIC X(50).
  01 CIPHERE PIC S99.
  01 INPUTD PIC X(50).
  01 CIPHERD PIC S99.
  01 INPUTS PIC X(50).
  01 CIPHERS PIC X(50).

PROCEDURE DIVISION.
DISPLAY "Enter input to encrypt."
ACCEPT INPUTE
DISPLAY "Please enter cipher key."
ACCEPT  CIPHERE
CALL 'ENCRYPT' USING BY CONTENT INPUTE CIPHERE.
DISPLAY "Enter input to decrypt."
ACCEPT INPUTD
DISPLAY "Please enter cipher key."
ACCEPT  CIPHERD
CALL 'DECRYPT' USING BY CONTENT INPUTD CIPHERD.
DISPLAY "Enter input to solve for."
ACCEPT INPUTS
DISPLAY "Please enter cipher key."
ACCEPT  CIPHERS
CALL 'SOLVE' USING BY CONTENT INPUTS CIPHERS.
STOP RUN.
 
IDENTIFICATION DIVISION.
PROGRAM-ID. ENCRYPT.
DATA DIVISION.
WORKING-STORAGE SECTION.
  01 SENTRY PIC 99.
  01 LENGTHNUM PIC 99.
  01 MYC PIC X(1).
  01 CONVERTNUM PIC 99.
LINKAGE SECTION.
  01 INPUTC PIC X(50).
  77 CIPHER PIC S99.
PROCEDURE DIVISION USING INPUTC CIPHER.
COMPUTE LENGTHNUM = 0
COMPUTE CONVERTNUM = 0
COMPUTE SENTRY = 0
MOVE '' TO MYC
INSPECT FUNCTION REVERSE(INPUTC) TALLYING LENGTHNUM FOR LEADING SPACES
COMPUTE CONVERTNUM = FUNCTION MOD (CIPHER, 26)
COMPUTE LENGTHNUM = LENGTH OF CIPHER - LENGTHNUM
INSPECT INPUTC CONVERTING
"avcdefghijklmnopqrstuvwxyz" to "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
PERFORM UNTIL SENTRY = LENGTHNUM

IF ((FUNCTION ORD(INPUTC(SENTRY:1)) + CONVERTNUM) > (FUNCTION ORD('Z')))
	     MOVE FUNCTION CHAR((FUNCTION ORD(INPUTC(SENTRY:1)) + CONVERTNUM) - 26) TO MYC
	  ELSE
		 MOVE FUNCTION CHAR(FUNCTION ORD(INPUTC(SENTRY:1)) + CONVERTNUM) TO MYC
END-IF	 
IF (((FUNCTION ORD(INPUTC(SENTRY:1))) >= (FUNCTION ORD('A'))) AND 
	     ((FUNCTION ORD(INPUTC(SENTRY:1))) <= (FUNCTION ORD('Z'))))
		 IF ((FUNCTION ORD(INPUTC(SENTRY:1)) + CONVERTNUM) > (FUNCTION ORD('Z')))
		    INSPECT INPUTC(SENTRY:1) REPLACING ALL INPUTC(SENTRY:1) BY MYC
         ELSE
			INSPECT INPUTC(SENTRY:1) REPLACING ALL INPUTC(SENTRY:1) BY MYC
END-IF
ELSE
	INSPECT INPUTC(SENTRY:1) REPLACING ALL INPUTC(SENTRY:1) BY INPUTC(SENTRY:1)
 END-IF
COMPUTE SENTRY = SENTRY + 1
END-PERFORM.
DISPLAY INPUTC.
END PROGRAM ENCRYPT.
  
IDENTIFICATION DIVISION.
PROGRAM-ID. DECRYPT.
DATA DIVISION.
LINKAGE SECTION.
  01 INPUTC PIC X(50).
  77 CIPHER PIC S99.
PROCEDURE DIVISION USING INPUTC CIPHER.
MULTIPLY -1 BY CIPHER
CALL 'ENCRYPT' USING BY CONTENT INPUTC CIPHER.
END PROGRAM DECRYPT.

IDENTIFICATION DIVISION.
PROGRAM-ID. SOLVE.
DATA DIVISION.
WORKING-STORAGE SECTION.
	01 STRINGIN PIC X(50).
	01 CIPHERMAX PIC 99.
LINKAGE SECTION.
  01 INPUTC PIC X(50).
  77 CIPHER PIC S99.
PROCEDURE DIVISION USING INPUTC CIPHER.
COMPUTE CIPHER = CIPHER + 1
PERFORM VARYING CIPHERMAX FROM 0 BY 1
UNTIL CIPHERMAX = CIPHER
		MOVE INPUTC TO STRINGIN
		DISPLAY 'Cipher: ' CIPHERMAX
		CALL 'ENCRYPT' USING BY CONTENT STRINGIN CIPHERMAX
		END-PERFORM.
EXIT PROGRAM.
END PROGRAM SOLVE.