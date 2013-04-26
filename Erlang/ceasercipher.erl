-module(ceasercipher).
-export([encrypt/2, decrypt/2, solve/2]).

convert(MyC,Cipher) when ((MyC >= $a) and (MyC =< $z)) or ((MyC >= $A) and (MyC =< $Z))->
	(MyC band 32 + $A) + ((MyC - (MyC band 32 + $A)) + Cipher) rem 26;
convert(MyC,Cipher) when ((MyC /= $a) and (MyC /= $z)) or ((MyC /= $A) and (MyC /= $Z))-> MyC.
	
encrypt(Input, Cipher) ->
	CipherKey = 26 + Cipher rem 26,
	lists:map(fun(Char) -> convert(Char, CipherKey) end, Input).
	
decrypt(Input, Cipher) ->
	encrypt(Input, -Cipher).

solve(Input,0) -> io:fwrite("\n"),io:fwrite(decrypt(Input,0));
solve(Input,Max) when Max > 0 ->
	io:fwrite("\n"),
	io:fwrite(decrypt(Input,-Max)),
	solve(Input,Max-1).