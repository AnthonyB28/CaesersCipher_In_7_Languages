program Caesar_Cipher

implicit none
!Creating variables
character :: sel
character (LEN=100) :: input
character (LEN=100) :: solve
integer :: cipher
integer :: i
!Intialize characters, otherwise issues with computation
solve = ''

!READ CASE SELECTION
print *, "Please input e if encrypting, d for decrypting, or s for solving:"
read *, sel

select case(sel)

!BEGIN ENCRYPTION
  case('e')

	print *, "Message to encrypt: "
	read (*,'(A)') input
	print *, "Shift value: "
	read *,cipher
	call encrypt(input,cipher)    

!BEGIN DECRYPTION
  case('d')
  
  	print *, "Message to decrypt: "
	read (*,'(A)') input
	print *, "Shift value: "
	read *,cipher
    call decrypt(input,cipher)

!BEGIN SOLVE
  case('s')

	print *, "Ecrypted message to solve for: "
	read (*,'(A)') input
	print *, "Max shift value: "
	read *, cipher
	do i = cipher, 0, -1
    print *,"Cipher:",i
    call decrypt(input, i - (28*i))
    end do

end select

end program Caesar_Cipher

!-----SUBROUTINES---------------------------------------------------
!
!  Encrypt and decrypt functions are down here. Take input and cipher number
!
!---------------------------------------------------------------------

SUBROUTINE encrypt(input, cipher)
IMPLICIT NONE
character (LEN=100), intent(in)  :: input
character (LEN=100) :: encryptChar
integer :: i
integer :: mod
integer :: cipher
encryptChar = ''

    !COMPUTATION
    do i = 1, len(input)
  		select case (input(i:i))
    	 case ('a' : 'z')
       		 mod = modulo(iachar(input(i:i)) - 97 + cipher, 26)
    		encryptChar(i:i) = achar( mod + 97)

    	case('A' : 'Z')
    		mod = modulo(iachar(input(i:i)) - 65 + cipher, 26)
    		encryptChar(i:i) = achar( mod + 65)
		end select
	end do !END COMPUTATION
    print *,''
	write (*,"(2a)") "Encrypted = ", encryptChar
END SUBROUTINE encrypt


SUBROUTINE decrypt(input, cipher)
IMPLICIT NONE
character (LEN=100), intent(in)  :: input
character (LEN=100) :: decryptChar
integer :: i
integer :: mod
integer :: cipher
decryptChar = ''

!COMPUTATION
  	do i = 1, len(input)
  	select case (input(i:i))
    		case ('a' : 'z')
        	mod = modulo(iachar(input(i:i)) - 97 - cipher, 26)
    		decryptChar(i:i) = achar( mod + 97)

    		case('A' : 'Z')
    		mod = modulo(iachar(input(i:i)) - 65 - cipher, 26)
    		decryptChar(i:i) = achar( mod + 65)
			end select
	end do !END COMPUTATION
 	write (*,"(2a)") "Decrypted = ", decryptChar
END SUBROUTINE decrypt

  