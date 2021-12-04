Scriptname FalloutVore:FVS01_DecypherScript Extends ObjectReference

Message Property FVS01_DecryptMessage_1 Auto
Message Property FVS01_DecryptMessage_2 Auto
Message Property FVS01_DecryptMessage_3 Auto
Message Property FVS01_DecryptMessage_4 Auto
Message Property FVS01_DecryptMessage_5 Auto
Message Property FVS01_DecryptMessage_6 Auto

GlobalVariable Property FVS01_MessageDecrypted_1 Auto
GlobalVariable Property FVS01_MessageDecrypted_2 Auto
GlobalVariable Property FVS01_MessageDecrypted_3 Auto
GlobalVariable Property FVS01_MessageDecrypted_4 Auto
GlobalVariable Property FVS01_MessageDecrypted_5 Auto
GlobalVariable Property FVS01_MessageDecrypted_6 Auto

Quest Property FVS01_BriaQuest_FV_ Auto
Scene Property FVS01_BriaQuest_FV_TypewriterFail Auto

Int Cipher1
Int Cipher2
Int Cipher3
Int Cipher4
Int Cipher5
Int Cipher6

Event OnActivate(ObjectReference akActionRef)
	
	Cipher1 = FVS01_DecryptMessage_1.Show()
	Cipher2 = FVS01_DecryptMessage_2.Show()
	Cipher3 = FVS01_DecryptMessage_3.Show()
	Cipher4 = FVS01_DecryptMessage_4.Show()
	Cipher5 = FVS01_DecryptMessage_5.Show()
	Cipher6 = FVS01_DecryptMessage_6.Show()
	
	FVS01_MessageDecrypted_1.SetValue(Cipher1)
	FVS01_MessageDecrypted_2.SetValue(Cipher2)
	FVS01_MessageDecrypted_3.SetValue(Cipher3)
	FVS01_MessageDecrypted_4.SetValue(Cipher4)
	FVS01_MessageDecrypted_5.SetValue(Cipher5)
	FVS01_MessageDecrypted_6.SetValue(Cipher6)
	
	If(Cipher1 == 2 && Cipher2 == 4 && Cipher3 == 0 && Cipher4 == 4 && Cipher5 == 1 && Cipher6 == 3)
		FVS01_BriaQuest_FV_.SetStage(50)
	Else
		FVS01_BriaQuest_FV_TypewriterFail.start()
	EndIF
	
EndEvent