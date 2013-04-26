fun convertN(a) = ord a - ord #"a"
fun convertCapN(a) = ord a - ord#"A"

fun convertA(n) = chr(ord #"a" + n)
fun convertCapA(n) = chr(ord #"A" + n) 

fun shift (a,n) = if Char.isLower a then convertA((convertN(a) + n)  mod 26)
					else convertCapA((convertCapN(a) + n)  mod 26)
					
fun seperate(nil,n) = nil
| seperate(x::xs,n) = shift(x,n) :: seperate(xs,n)

fun encrypt(a,n) = implode(seperate(explode(a),n))

fun decrypt(a,n) = encrypt(a,~n)

fun solve(a,max) =
	let
		fun findrange(n) = List.tabulate(n, fn x => x);
		val maximum = findrange(max)
		fun attemptToSolve(a,nil) = nil
		|	attemptToSolve(a,x::xs) = decrypt(a,x) :: attemptToSolve(a,xs);
		fun printSolve(nil) = ()
		| printSolve(x::xs) =
		  (
		    print(x);
			print("\n"); 
			printSolve(xs)
		   );
	in
		printSolve(attemptToSolve(a,maximum))
	end;