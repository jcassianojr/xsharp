/*
TEXTBLOCK exemplo  
//	LOCAL oCHAVE AS SHA256
//    LOCAL cCHAVE AS STRING
 //oCHAVE:=  SHA256{}
 //   cCHAVE :=Ochave:GetSHA256('arroz e feijao')
 //
 //   alert(cCHAVE)
 // https://groups.google.com/g/comp.lang.clipper.visual-objects/c/eUAwug-rRV4/m/c1Z-ZIMGVHsJ

*/
CLASS SHA256

// DESCRIPTION:
// This class is used to generate a SHA-256 //digest// or //signature// of a string.
// The SHA-256 algorithm is one of the industry standard methods for generating
// digital signatures. It is generically known as a digest, digital signature,
// one-way encryption, hash or checksum algorithm. A common use for SHA-256 is
// for password encryption as it is one-way in nature, that does not mean that
// your passwords are not free from a dictionary attack. If you are using the
// routine for passwords, you can make it a little more secure by concatenating
// some known random characters to the password before you generate the signature
// and on subsequent tests, so even if a hacker knows you are using SHA-256 for
// your passwords, the random characters will make it harder to dictionary attack.

PROTECT DIM m_lOnBits[31] AS DWORD
PROTECT DIM m_l2Power[31] AS DWORD
PROTECT DIM K[64] AS DWORD
//
//

PROTECT METHOD AddUnsigned( dwX AS DWORD, dwY AS DWORD ) AS DWORD PASCAL 

LOCAL dwX4 AS DWORD
LOCAL dwY4 AS DWORD
LOCAL dwX8 AS DWORD
LOCAL dwY8 AS DWORD
LOCAL dwResult AS DWORD

dwX8 := _AND(dwX, 0x80000000)
dwY8 := _AND(dwY, 0x80000000)
dwX4 := _AND(dwX, 0x40000000)
dwY4 := _AND(dwY, 0x40000000)

dwResult := _AND(dwX, 0x3FFFFFFF) + _AND(dwY, 0x3FFFFFFF)

IF _AND(dwX4, dwY4) > 0
dwResult := _XOR(dwResult, 0x80000000, dwX8, dwY8)
ELSEIF _OR(dwX4, dwY4) > 0
IF _AND(dwResult, 0x40000000) > 0
dwResult := _XOR(dwResult, 0xC0000000, dwX8, dwY8)
ELSE
dwResult := _XOR(dwResult, 0x40000000, dwX8, dwY8)
ENDIF
ELSE
dwResult := _XOR(dwResult, dwX8, dwY8)
ENDIF
//
RETURN dwResult


PROTECT METHOD Ch(X AS DWORD, Y AS DWORD, Z AS DWORD) AS DWORD PASCAL 
RETURN _XOR(_AND(X, Y), _AND(_NOT(X), Z))


PROTECT METHOD Cnv2Hex(dwNum AS DWORD) AS STRING PASCAL 
RETURN Lower(Right("00000000" + AsHexString(dwNum), 8))

PROTECT METHOD ConvertToWordArray( cMessage AS STRING ) AS ARRAY PASCAL 
// Takes the string message and puts it in a long array with padding according to
// the SHA-256 rules (similar to MD5 routine).
LOCAL dwMessageLength AS DWORD
LOCAL dwNumberOfWords AS DWORD
LOCAL dwBytePosition AS DWORD
LOCAL dwByteCount AS DWORD
LOCAL dwWordCount AS DWORD
LOCAL dwByte AS DWORD
LOCAL dwTmp AS DWORD
LOCAL dwWordArray AS ARRAY
LOCAL MODULUS_BITS := 512 AS DWORD
LOCAL CONGRUENT_BITS := 448 AS DWORD

dwMessageLength := SLen(CMessage)
// Get padded number of words. Message needs to be congruent to 448 bits,
// modulo 512 bits. If it is exactly congruent to 448 bits, modulo 512 bits
// it must still have another 512 bits added. 512 bits = 64 bytes
// (or 16 * 4 byte words), 448 bits = 56 bytes. This means lNumberOfWords must
// be a multiple of 16 (i.e. 16 * 4 (bytes) * 8 (bits))
dwNumberOfWords := (((dwMessageLength + ((MODULUS_BITS - CONGRUENT_BITS) / 8)) / (MODULUS_BITS / 8)) + 1) * (MODULUS_BITS / 32)
dwWordArray := ArrayCreate(dwNumberOfWords)
//
FOR dwByte := 1 UPTO dwNumberOfWords
dwWordArray[dwByte] := 0
NEXT

// Combine each block of 4 bytes (ascii code of character) into one long
// value and store in the message. The high-order (most significant) bit of
// each byte is listed first. However, unlike MD5 we put the high-order
// (most significant) byte first in each word.
dwBytePosition := 0
dwByteCount := 0
//
DO WHILE dwByteCount < dwMessageLength
dwWordCount := dwByteCount / 4
dwBytePosition := (3 - (dwByteCount % 4)) * 8
dwByte := Asc(SubStr(cMessage, dwByteCount + 1, 1))
//
dwTmp := dwWordArray[dwWordCount + 1]
dwTmp := _OR(dwTmp, SELF:LShift(dwByte, dwBytePosition))
dwWordArray[dwWordCount + 1] := dwTmp
dwByteCount := dwByteCount + 1
ENDDO

// Terminate according to SHA-256 rules with a 1 bit, zeros and the length in
// bits stored in the last two words
dwWordCount := dwByteCount / 4
dwBytePosition := (3 - (dwByteCount % 4)) * 8
// Add a terminating 1 bit, all the rest of the bits to the end of the
// word array will default to zero
dwTmp := dwWordArray[dwWordCount + 1]
dwTmp := _OR(dwTmp, SELF:LShift(0x80, dwBytePosition))
dwWordArray[dwWordCount + 1] := dwTmp

// We put the length of the message in bits into the last two words, to get
// the length in bits we need to multiply by 8 (or left shift 3). This left
// shifted value is put in the last word. Any bits shifted off the left edge
// need to be put in the penultimate word, we can work out which bits by shifting
// right the length by 29 bits.
dwWordArray[dwNumberOfWords] := SELF:LShift(dwMessageLength, 3)
dwWordArray[dwNumberOfWords - 2] := SELF:RShift(dwMessageLength, 29)
//
RETURN dwWordArray


PROTECT METHOD Gamma0(X AS DWORD) AS DWORD PASCAL 
RETURN _XOR(SELF:S(X, 7), SELF:S(X, 18), SELF:R(X, 3))


PROTECT METHOD Gamma1(X AS DWORD) AS DWORD PASCAL 
RETURN _XOR(SELF:S(X, 17), SELF:S(X, 19), SELF:R(X, 10))


METHOD GetSHA256( cMessage AS STRING ) AS STRING PASCAL 
// Takes a string and uses the SHA-256 digest to produce a signature for it.
LOCAL DIM HASH[8] AS DWORD
LOCAL M AS ARRAY
LOCAL DIM W[64] AS DWORD
LOCAL a, b, c, d, e, f, g, h, i, j, T1, T2 AS DWORD
LOCAL cOut AS STRING

// Initial hash values
HASH[1] := 0x6A09E667
HASH[2] := 0xBB67AE85
HASH[3] := 0x3C6EF372
HASH[4] := 0xA54FF53A
HASH[5] := 0x510E527F
HASH[6] := 0x9B05688C
HASH[7] := 0x1F83D9AB
HASH[8] := 0x5BE0CD19

// Preprocessing. Append padding bits and length and convert to words
M := SELF:ConvertToWordArray(CMessage)

FOR j := 1 UPTO 64
W[j] := 0
NEXT

// Main loop
FOR i := 0 UPTO ALen(M) - 1 STEP 16
a := HASH[1]
b := HASH[2]
c := HASH[3]
d := HASH[4]
e := HASH[5]
f := HASH[6]
g := HASH[7]
h := HASH[8]
//
FOR j := 0 UPTO 63
IF j < 16
W[j + 1] := M[j + i + 1]
ELSE
W[j + 1] := SELF:AddUnsigned(SELF:AddUnsigned(SELF:AddUnsigned(SELF:Gamma1(W[j - 1]), W[j - 6]), SELF:Gamma0(W[j - 14])), W[j - 15])
END IF
//
T1 := SELF:AddUnsigned(SELF:AddUnsigned(SELF:AddUnsigned(SELF:AddUnsigned(h, SELF:Sigma1(e)), SELF:Ch(e, f, g)), K[j + 1]), W[j + 1])
T2 := SELF:AddUnsigned(SELF:Sigma0(a), SELF:Maj(a, b, c))
//
h := g
g := f
f := e
e := SELF:AddUnsigned(d, T1)
d := c
c := b
b := a
a := SELF:AddUnsigned(T1, T2)
NEXT
//
HASH[1] := SELF:AddUnsigned(a, HASH[1])
HASH[2] := SELF:AddUnsigned(b, HASH[2])
HASH[3] := SELF:AddUnsigned(c, HASH[3])
HASH[4] := SELF:AddUnsigned(d, HASH[4])
HASH[5] := SELF:AddUnsigned(e, HASH[5])
HASH[6] := SELF:AddUnsigned(f, HASH[6])
HASH[7] := SELF:AddUnsigned(g, HASH[7])
HASH[8] := SELF:AddUnsigned(h, HASH[8])
NEXT

// Output the 256 bit digest
cOut := SELF:Cnv2Hex(HASH[1]) + SELF:Cnv2Hex(HASH[2]) + SELF:Cnv2Hex(HASH[3]) + SELF:Cnv2Hex(HASH[4])
cOut := cOut + SELF:Cnv2Hex(HASH[5]) + SELF:Cnv2Hex(HASH[6]) + SELF:Cnv2Hex(HASH[7]) + SELF:Cnv2Hex(HASH[8])
//
RETURN cOut


CONSTRUCTOR() 

m_lOnBits[1] := 1 // 00000000000000000000000000000001
m_lOnBits[2] := 3 // 00000000000000000000000000000011
m_lOnBits[3] := 7 // 00000000000000000000000000000111
m_lOnBits[4] := 15 // 00000000000000000000000000001111
m_lOnBits[5] := 31 // 00000000000000000000000000011111
m_lOnBits[6] := 63 // 00000000000000000000000000111111
m_lOnBits[7] := 127 // 00000000000000000000000001111111
m_lOnBits[8] := 255 // 00000000000000000000000011111111
m_lOnBits[9] := 511 // 00000000000000000000000111111111
m_lOnBits[10] := 1023 // 00000000000000000000001111111111
m_lOnBits[11] := 2047 // 00000000000000000000011111111111
m_lOnBits[12] := 4095 // 00000000000000000000111111111111
m_lOnBits[13] := 8191 // 00000000000000000001111111111111
m_lOnBits[14] := 16383 // 00000000000000000011111111111111
m_lOnBits[15] := 32767 // 00000000000000000111111111111111
m_lOnBits[16] := 65535 // 00000000000000001111111111111111
m_lOnBits[17] := 131071 // 00000000000000011111111111111111
m_lOnBits[18] := 262143 // 00000000000000111111111111111111
m_lOnBits[19] := 524287 // 00000000000001111111111111111111
m_lOnBits[20] := 1048575 // 00000000000011111111111111111111
m_lOnBits[21] := 2097151 // 00000000000111111111111111111111
m_lOnBits[22] := 4194303 // 00000000001111111111111111111111
m_lOnBits[23] := 8388607 // 00000000011111111111111111111111
m_lOnBits[24] := 16777215 // 00000000111111111111111111111111
m_lOnBits[25] := 33554431 // 00000001111111111111111111111111
m_lOnBits[26] := 67108863 // 00000011111111111111111111111111
m_lOnBits[27] := 134217727 // 00000111111111111111111111111111
m_lOnBits[28] := 268435455 // 00001111111111111111111111111111
m_lOnBits[29] := 536870911 // 00011111111111111111111111111111
m_lOnBits[30] := 1073741823 // 00111111111111111111111111111111
m_lOnBits[31] := 2147483647 // 01111111111111111111111111111111

m_l2Power[1] := 1 // 00000000000000000000000000000001
m_l2Power[2] := 2 // 00000000000000000000000000000010
m_l2Power[3] := 4 // 00000000000000000000000000000100
m_l2Power[4] := 8 // 00000000000000000000000000001000
m_l2Power[5] := 16 // 00000000000000000000000000010000
m_l2Power[6] := 32 // 00000000000000000000000000100000
m_l2Power[7] := 64 // 00000000000000000000000001000000
m_l2Power[8] := 128 // 00000000000000000000000010000000
m_l2Power[9] := 256 // 00000000000000000000000100000000
m_l2Power[10] := 512 // 00000000000000000000001000000000
m_l2Power[11] := 1024 // 00000000000000000000010000000000
m_l2Power[12] := 2048 // 00000000000000000000100000000000
m_l2Power[13] := 4096 // 00000000000000000001000000000000
m_l2Power[14] := 8192 // 00000000000000000010000000000000
m_l2Power[15] := 16384 // 00000000000000000100000000000000
m_l2Power[16] := 32768 // 00000000000000001000000000000000
m_l2Power[17] := 65536 // 00000000000000010000000000000000
m_l2Power[18] := 131072 // 00000000000000100000000000000000
m_l2Power[19] := 262144 // 00000000000001000000000000000000
m_l2Power[20] := 524288 // 00000000000010000000000000000000
m_l2Power[21] := 1048576 // 00000000000100000000000000000000
m_l2Power[22] := 2097152 // 00000000001000000000000000000000
m_l2Power[23] := 4194304 // 00000000010000000000000000000000
m_l2Power[24] := 8388608 // 00000000100000000000000000000000
m_l2Power[25] := 16777216 // 00000001000000000000000000000000
m_l2Power[26] := 33554432 // 00000010000000000000000000000000
m_l2Power[27] := 67108864 // 00000100000000000000000000000000
m_l2Power[28] := 134217728 // 00001000000000000000000000000000
m_l2Power[29] := 268435456 // 00010000000000000000000000000000
m_l2Power[30] := 536870912 // 00100000000000000000000000000000
m_l2Power[31] := 1073741824 // 01000000000000000000000000000000

// Just put together the K array once
K[1] := 0x428A2F98
K[2] := 0x71374491
K[3] := 0xB5C0FBCF
K[4] := 0xE9B5DBA5
K[5] := 0x3956C25B
K[6] := 0x59F111F1
K[7] := 0x923F82A4
K[8] := 0xAB1C5ED5
K[9] := 0xD807AA98
K[10] := 0x12835B01
K[11] := 0x243185BE
K[12] := 0x550C7DC3
K[13] := 0x72BE5D74
K[14] := 0x80DEB1FE
K[15] := 0x9BDC06A7
K[16] := 0xC19BF174
K[17] := 0xE49B69C1
K[18] := 0xEFBE4786
K[19] := 0xFC19DC6
K[20] := 0x240CA1CC
K[21] := 0x2DE92C6F
K[22] := 0x4A7484AA
K[23] := 0x5CB0A9DC
K[24] := 0x76F988DA
K[25] := 0x983E5152
K[26] := 0xA831C66D
K[27] := 0xB00327C8
K[28] := 0xBF597FC7
K[29] := 0xC6E00BF3
K[30] := 0xD5A79147
K[31] := 0x6CA6351
K[32] := 0x14292967
K[33] := 0x27B70A85
K[34] := 0x2E1B2138
K[35] := 0x4D2C6DFC
K[36] := 0x53380D13
K[37] := 0x650A7354
K[38] := 0x766A0ABB
K[39] := 0x81C2C92E
K[40] := 0x92722C85
K[41] := 0xA2BFE8A1
K[42] := 0xA81A664B
K[43] := 0xC24B8B70
K[44] := 0xC76C51A3
K[45] := 0xD192E819
K[46] := 0xD6990624
K[47] := 0xF40E3585
K[48] := 0x106AA070
K[49] := 0x19A4C116
K[50] := 0x1E376C08
K[51] := 0x2748774C
K[52] := 0x34B0BCB5
K[53] := 0x391C0CB3
K[54] := 0x4ED8AA4A
K[55] := 0x5B9CCA4F
K[56] := 0x682E6FF3
K[57] := 0x748F82EE
K[58] := 0x78A5636F
K[59] := 0x84C87814
K[60] := 0x8CC70208
K[61] := 0x90BEFFFA
K[62] := 0xA4506CEB
K[63] := 0xBEF9A3F7
K[64] := 0xC67178F2
//
RETURN SELF


PROTECT METHOD LShift( dwValue AS DWORD, dwBits AS DWORD ) AS DWORD PASCAL 
RETURN dwValue << dwBits


PROTECT METHOD Maj(X AS DWORD, Y AS DWORD, Z AS DWORD) AS DWORD PASCAL 
RETURN _XOR(_AND(X, Y), _AND(X, Z), _AND(Y, Z))


PROTECT METHOD R(X AS DWORD, N AS DWORD) AS DWORD PASCAL 
RETURN SELF:RShift(X, _AND(N, m_lOnBits[5]))


PROTECT METHOD RShift( dwValue AS DWORD, dwBits AS DWORD ) AS DWORD PASCAL 
RETURN dwValue >> dwBits


PROTECT METHOD S(X AS DWORD, N AS DWORD) AS DWORD PASCAL 
RETURN _OR(SELF:RShift(X, _AND(N, m_lOnBits[5])), SELF:LShift(X, (32 - _AND(N, m_lOnBits[5]))))


PROTECT METHOD Sigma0(X AS DWORD) AS DWORD PASCAL 
RETURN _XOR(SELF:S(X, 2), SELF:S(X, 13), SELF:S(X, 22))


PROTECT METHOD Sigma1(X AS DWORD) AS DWORD PASCAL 
RETURN _XOR(SELF:S(X, 6), SELF:S(X, 11), SELF:S(X, 25))



END CLASS
