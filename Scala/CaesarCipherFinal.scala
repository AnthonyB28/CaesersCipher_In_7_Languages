object CaesarCipher{
	val upper = 'A' to 'Z'
	val lower = 'a' to 'z'
	
	def main(args: Array[String]) {
	  println("Lets encrypt Hello World by 5 :")
	  println(encrypt("HELLO WORLD", 5))
	  println()
	  
	  println("Lets decrypt that with 5 :")
	  println(decrypt("MJQQT BTWQI", 5))
	  println()
	  
	  println("Lets solve for HAL with max 26: ")
	  println(solve("HAL", 26))
	  println()
	
      println("Use encrypt(message, cipher) \n or decrypt(message,cipher) \n or solve(message,ciphermax)")
    }
	
	def shift(c:Char, cipher:Int, mod:IndexedSeq[Char])=
	{
		mod( (c - mod.head + cipher + mod.size) % mod.size)
	}
	
	def encrypt(input:String, cipher:Int) =
		input.map
		{
			case c if upper.contains(c) => shift(c, cipher, upper)
			case c if lower.contains(c) => shift(c, cipher, lower)
			case c => c
		}
		
	def decrypt(input:String, cipher:Int) =
	{
		encrypt(input, (-cipher))
	}
	
	def solve(input:String, cipher:Int) =
	{
		var i = 0
		while (i <= cipher)
		{
		 println("Cipher " + i + " : " + decrypt(input, i - (28 * i)))
		 i = i + 1
		}
	}
	
	
}