#Python3 FalloutHacker
#https://github.com/lgsoohoo/FalloutHacker
#By PikaLuca87


# All possible passwords must be the same length
# Passwords you try must be from the list you entered before
# Press '\start' to begin testing passwords
# Type '\del' to delete an entered possible password
from random import random
print ("Fallout 3: Hacking: Hacking Computer Terminals")
print ("\nROBCO INDUSTRIES (TM) TERMLINK PROTOCOL")
print ("\nENTER POSSIBLE_PASSWORDS NOW\n")
print ("===========================\nEscape sequence: .start , .del\n\n")

possible_passwords=[]
while True:     #Loading in possible_passwords
    entry=input("0xF9"+str(int(random()*89+10))+" ")

    if entry == ".start":
        break
    elif entry ==".del":
        if len(possible_passwords)>1:
            last = len(possible_passwords)-1
            print ("Removed "+possible_passwords[last])
            del possible_passwords[last]
        else:
            print("NO PASSWORDS ENTERED")
    elif entry=="":
        print("ENTER .START TO BEGIN TESTING")
    else:
        #append it first, if its invalid then we delete
        possible_passwords.append(entry)
        if len(entry)!=len(possible_passwords[0]):
            print("INVALID POSSIBLE PASSWORD. CHECK WORD LENGTH.")
            last = len(possible_passwords)-1
            del possible_passwords[last]


print ("ALL POSSIBLE_PASSWORDS HAVE BEEN LOADED")

unlocked = False
for x in range(0,4): #give 4 attempts
  print ("\n\n"+str(4-x)+" ATTEMPT(S) LEFT :"+"  █"*(4-x))
  if x == 3:
    print("!!! WARNING: LOCKOUT IMMINENT !!!")


  s="\n"    #get the test word and num correct from user
  print ("\nAVAILABLE OPTIONS:\n"+s.join( possible_passwords ))
  test_word=input("ENTER TEST PASSWORD NOW:")
     #check for invalid length
  while len(test_word)!=len(possible_passwords[0]):
	  test_word=input("ERROR:CHECK WORD LENGTH. PLEASE TRY AGAIN:")
  while not(test_word in possible_passwords):
          test_word=input("ERROR:CHOOSE FROM TEST_WORD FROM LIST ABOVE:")
     #ask for # letters correct
  test_num_correct=input("?/"+str(len(possible_passwords[0]))+" CORRECT:")
  if test_num_correct == str(len(possible_passwords[0])):
    unlocked=True
    break;

  words_to_delete=[]
  for word in possible_passwords: #find the words to be deleted
    match_number=0          #num of chars from the test that match the real
    for position in range(0,len(word)):     #checking one word to get #matching
      if test_word[position]==word[position]:
        match_number+=1
    if match_number!= int(test_num_correct):
      words_to_delete.append(word) #remember the words to delete in diff list

  for delete in words_to_delete: #deleting the bad words from possible_passwords
    possible_passwords.remove(delete)

  if len(possible_passwords)==1:
    unlocked=True
    print("\nPASSWORD IDENTIFIED:"+possible_passwords[0])
    break;


if unlocked:
  print("\n\nEXACT MATCH!\nPLEASE WAIT WHILE SYSTEM IS ACCESSED")
  print("LOGON ADMIN\nENTER PASSWORD NOW\t")
  starString = ""
  for star in range(0,len(test_word)):
    starString=starString+"*"
  print(starString)
  print("\n\nACCESS GRANTED")
else:
  print("\n\nTERMINAL LOCKED\nPLEASE CONTACT AN ADMINISTRATOR")
