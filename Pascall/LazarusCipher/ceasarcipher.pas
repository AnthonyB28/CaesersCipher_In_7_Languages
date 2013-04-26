program ceasarcipher;

{$mode objfpc}{$H+}

uses   sysutils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

{Anthony Barranco Ceasar Cipher Program in Pascal}
{Variable declaration}
var
  cipher: integer;
  userCase: integer;
  input: string;

{Encrypts the input}
procedure encrypt(var input: string; cipher: integer);
  var
    i: integer;
    output: string;
  begin
    output := input; {Must equal the length of the input, or won't allocate space properly}
    for i := 1 to length(input) do
      case input[i] of
        'A'..'Z': output[i] := chr(ord('A') + (ord(input[i]) - ord('A') + cipher) mod 26);
      end;
    writeln ('Encrypted message: ', output);
  end;

{Decrypts the input}
procedure decrypt(var input: string; cipher: integer);
  var
    i: integer;
    output: string;
  begin
    output := input; {Must equal the length of the input, or won't allocate space properly}
    for i := 1 to length(input) do
      case input[i] of
       'A'..'Z': output[i] := chr(ord('A') + (ord(input[i]) - ord('A') - cipher + 26) mod 26);
      end;
    writeln ('Decrypted message: ', output);
  end;

{Solves the input}
procedure solve(var input: string; cipher: integer);
  var
    i: integer;
  Begin
    for i := cipher downto 0 do
    begin
    writeln('Cipher: ', i);
    decrypt(input, (i - (28 * i)));
    end;
  end;


begin
  {cipher := 3; }
  {input := 'Manual message';}

  write('Enter the message: ');
  readln(input);
  input := UpperCase(input);{Convert input to upper case}

  write('Enter the cipher (or max): ');
  read(cipher);

  write('Enter 1 to encrypt, 2 to decrypt, and 3 to solve: ');
  read(userCase);
  writeln();

  {perform the user's input}
  case userCase of
   1   : Begin
       writeln ('Original message: ', input);
       encrypt(input, cipher);
       end;  {end e}

   2   : Begin
        writeln ('Original message: ', input);
        decrypt(input, cipher);
         end; {end d}
   3    : Begin
        solve(input, cipher);
   end;

  end;  {End case}

  writeln();
  writeln('Press <Enter> to quit');
  readln;
  readln;
end.

