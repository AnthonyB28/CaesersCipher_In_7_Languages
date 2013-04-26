program  test
  	implicit none
  	!use of a simple menu
  	real  :: x,y,answer,num
  	integer  :: choice
  	!set up the menu  the user may enter  1, 2 or 3
  	print  *,'Choose an option'
  	print  *,'1    Multiply'
  	print  *,'2    Divide'
  	print  *,'3    Add'
  	read  *,choice
  	x=3.4
  	y=2.9
  	!the following line has 2 consecutive 
  	!equals signs  (no spaces in between)
    	if  (choice == 1) then   !If then
    	answer=x*y
  		print *,'result = ',answer
    	end if !end if question
    	if (choice == 2) then !If then number 2
  		answer=x/y
  		print *,'result = ',answer
  	end if !end if question
  	if (choice == 3) then !if then number 3
  		answer=x+y
  		print *,'result = ',answer 
  	end if !end if question
    print *, 'enter  a positive number'
	read *, num
		if (num <0)    stop !STOP will end the program
		if (num < 10) print *, 'less than 10'
		if (num > 10) print *, 'greater than 10'
	print *,'It is a positive number'
  	end program test  !As you can see, just the if (blah) then, end if is necessary
    !NOTE THAT THERE IS ELSE IF (BLAH) THEN
    !But you don't end it with end if until the last else