#Python3 FalloutHacker
#https://github.com/lgsoohoo/FalloutHacker
#By PikaLuca87
from random import random
print ("Fallout 3: Hacking: Hacking Computer terminals")
print ("\nROBCO INDUSTRIES (TM) TERMLINK PROTOCOL")
print ("\nENTER POSSIBLE_PASSWORDS NOW\n")

possible_passwords=[]
while True:     #Loading in possible_passwords
    entry=raw_input("0xF9"+str(int(random()*89+10))+" ")
    if entry=="":
        break
    elif entry =="\del":
        last = len(possible_passwords)-1
        print ("Removed"+possible_passwords[last])
        del possible_passwords[last]
    else:
        possible_passwords.append(entry)


print ("ALL POSSIBLE_PASSWORDS HAVE BEEN LOADED")


for x in range(0,4):#give 4 attempts
  print ("\n\n"+str(4-x)+" ATTEMPT(S) LEFT :"+" []"*(4-x))

  s="\n"    #get the test word and num correct from user
  print ("\nAVAILABLE OPTIONS:\n"+s.join( possible_passwords ))
  test_word=raw_input("ENTER TEST PASSWORD NOW:")
  while len(test_word)!=len(possible_passwords[0]):
	  test_word=raw_input("ERROR. PLEASE TRY AGAIN:")
  test_num_correct=raw_input("?/"+str(len(possible_passwords[0]))+" CORRECT:")

  words_to_delete=[]
  for word in possible_passwords: #find the words to be deleted
    match_number=0          #num of chars from the test that match the real
    for position in range(0,len(word)):     #checking one word to get #matching
      if test_word[position]==word[position]:
        match_number+=1
    if match_number!= int(test_num_correct):
      words_to_delete.append(word)#remember the words to delete in diff list


  for delete in words_to_delete: #deleting the bad words from possible_passwords
    possible_passwords.remove(delete)
