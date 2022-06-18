

# I: string 
# O: un-encrypted string 

# Algo: 
# - set result equal to empty array 
# - convert all input string characters to downcase
# - iterate through characters in order 
# - find ord value of string if alpha char
# - add int 13 to its ord value 
# - check if modulo value is over 97 
# - if it is, remainder is correct value, if not value is good 
# - add converted ord to character value (ascii) to result 
# - return result 
# iterate throug horiginal string, if char is cap, capitalize same index in new value

# My Solution

# def capitalize_result(arr, encrypted_text)
#   arr.each do |char| 
#     encrypted_text.chars.each_with_index do |char2, idx| 
#       arr[idx].upcase! if char2 =~ /[A-Z]/
#     end
#   end.join
# end 

# def rot_13(encrypted_text)
#   result = []

#   encrypted_text.downcase.chars.each do |char| 
#     if char =~ /[a-z]/
#       new_char = char.ord + 13
#       new_char = (new_char % 122) + 96 if new_char >= 122
#       result << new_char.chr 
#     else
#       result << char
#     end
#   end
#   capitalize_result(result, encrypted_text)
# end


# def rot_13(encrypted_text)
#   encrypted_text.each_char.reduce('') do |result, encrypted_char|
#     result + decipher_character(encrypted_char)
#   end
# end

# def decipher_character(encrypted_char)
#   case encrypted_char
#   when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
#   else                         encrypted_char
#   end
# end

# Jason Answer 

# ALPHABET = ("a".."z").to_a + ("A".."Z").to_a
# DECRYPT_ROT_13 = ("a".."z").to_a.rotate(13) + ("A".."Z").to_a.rotate(13)

# def decipher_name(name)
#   deciphered = name.chars.map do |char|
#     if char =~ /[A-Za-z]/
#       DECRYPT_ROT_13[ALPHABET.index(char)]
#     else
#       char
#     end
#   end
#   deciphered.join
# end

# one liner answer 

# def rot_13(cypher_string)
#   cypher_string.tr('A-Za-z', 'N-ZA-Mn-za-m')
# end

# p rot_13("Nqn Ybirynpr")
# p rot_13("Tenpr Ubccre")
# p rot_13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
# p rot_13("Nqryr Tbyqfgvar")
# p rot_13("Nyna Ghevat")

# Puneyrf Onoontr
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu



def rotate(str)
  str.tr("a-z", 'b-za')
end

p rotate('abcde')
p rotate('yzabc')