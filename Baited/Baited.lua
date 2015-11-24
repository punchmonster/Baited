Baited_ChatFrame_OnEvent = ChatFrame_OnEvent

-- response chance in %
local rswears = 100;
local swears = { "fuck", "shit", "jizz", "sex", "jew", "nigger", "fucking", "FUCK", "anal ", "Fuck", "bollocks", "faggot", "fuk", "pussy", "dick", "asshole", " ass ", " cum ", "slut", "cumdumpster", "bitch", "whore", "hooker", "cock", "turd ", "penis", "wtf", "kike", "wetback", "scratchback", "chink", "nagger", "nigga", "towelhead", "fgt", "cuck", "piss" }

local cooldown = (math.random(30, 50))

local time

--FUNCTION: ChatFrame_OnEvent
--ARGUMENTS: event
--DESCRIPTION: Runs every time a chat message gets received
function ChatFrame_OnEvent(event)
	local roll = math.random(1, 100)

	if ( strsub(event, 1, 8) == "CHAT_MSG" ) then
		if arg2 then
			if ShinkFilter and string.find(string.lower(arg1),"shinkansen") then
				return
			end
			local type = strsub(event, 10);
			if ( string.sub(type,1,7) == "CHANNEL" or type == "PARTY" ) then

				for _, v in ipairs(swears) do

					--checks the message for swear words
					if string.find(strlower(arg1), strlower(v)) and (roll < rswears) then
						if not time or GetTime() > time then 

							SendResponseMessage(arg2, type, arg4, arg1)

							DEFAULT_CHAT_FRAME:AddMessage("Reported!  [cd:(" .. cooldown .. "s) | roll:(" .. roll .. ")]", 0.0, 1.0, 0.0)
							time = floor(GetTime()) + cooldown
						end
						return
					end
					if string.find(strlower(arg1), strlower(v)) and (roll > rswears) then
						if not time or GetTime() > time then 
							DEFAULT_CHAT_FRAME:AddMessage("Matched " .. arg2 .. " but roll was > " .. rswears .. " (" .. roll .. ").", 0.1, 0.9, 0.1)
							time = floor(GetTime()) + 1
						end
						return
					end
				end
			end
		end
	end
	Baited_ChatFrame_OnEvent(event)
end

--FUNCTION: SendResponseMessage
--ARGUMENTS: return values from the WoW ChatFrame_OnEvent API call.
--DESCRIPTION: Generates a random personalized response to the swear
function SendResponseMessage(name, chatType, channel, msg)
	
	if chatType == "PARTY" then
		channel = "0"
	end

	--debug info
	DEFAULT_CHAT_FRAME:AddMessage( "|cffffffff[|r" .. channel .. "|cffffffff]|r" .."|cffffffff[|r" .. name .. "|cffffffff]|r: " .. msg, 0.2, 0.6, 1.0)

	local senderStripped = name

	--table with the strings it can choose from
	local swearresponses = { 
		"please stop swearing " .. senderStripped .. ".",
		"no swearing in public chat " .. senderStripped .. "! I've reported you!",
		"reported " .. senderStripped .. " for swearing!",
		senderStripped .. " reported!",
		senderStripped .. ", reported for swearing",
		"If my mouth was as filthy as " .. senderStripped .. "'s I'd be a sailor.",
		"Do you talk to your mother that way, " .. senderStripped .. "?",
		"I reported " ..senderStripped.. "... gosh stop cussing...",
		"This isn't the army, " .. senderStripped .. ", watch your language.",
		"We are lucky the FCC doesn't regulate WoW, or else we would be in trouble with " .. senderStripped .. "'s potty mouth.",
		"I voted for Sarah Palin in 2008 so I would not have to hear garbage like " .. senderStripped .. " just said.",
		"Enabling the profanity filter does not give you free reign to speak with crude language " .. senderStripped .. ".",
		"That language is not acceptable in my kitchen, " .. senderStripped .. "! - Chef Gordon Ramsay ",
		"AFK a second, I need to put on my sunglasses, the swear word that " .. senderStripped .. " just said blinded me.",
		"Oh look at " .. senderStripped .. " using those big swear words again, if you keep it up, you might be able to wear big boy underwear soon!",
		"HEY EVERYONE LOOK! " .. senderStripped .. " is trying to mimic the big boys! Go and play, " .. senderStripped .. ", the sandbox is lonely without you!",
		"Player " .. senderStripped .. " has been reported for his/her vulgar language.",
		"I know " .. senderStripped .. " is trying to be a big boy gamer with that language, but they're just a fake gamer. Don't be fooled. Reported!",
		"Don't say words like that, " .. senderStripped .. ".  There are children playing.",
		"republican dps, looking for group that doesn't swear like " .. senderStripped .. ", send me a pst",
		"I reported you for swearing " .. senderStripped .. ".",
		"Yo man I'm really happy for you and I'm gonna let you finish, but ".. senderStripped .. " has one of the biggest pottymouths of all time... Of all time!",
		"Rita died in dexter cause " .. senderStripped .. " still cusses like a child, how many more victims does he need to claim?", 
		"It's bad enough that you're playing Wildstar, do you have to make yourself look like more of a nerd by swearing " .. senderStripped .. "?",
		"watch your mouth " .. senderStripped .. "...",
		senderStripped .. ", swearing is for nerds!",
		"" .. senderStripped .. " I love you, but I can't be with someone who still swears like a 12 year old...",
		"What the fudge did you just swear " .. senderStripped .. ", you little n00b? I'll have you know I'm a rank 1 challenger PVPer and have done raids on every 10 man heroic content. I also partner with reckful and have reflexes like fatal1ty. You are nothing to me but just an abusive pottymouth. I will pwn the fudge out of you with Arcane Missiles the likes of which has never been seen before on Azeroth AND Outland, mark my frickin words.",
		"Hey " .. senderStripped .. ", I heard swearing is cool",
		"'Now listen here " .. senderStripped .. ". What I'm sayin' to you is the honest truth. stop swearing you'll be safe.' -Applejack",
		"Hey " .. senderStripped .. ", chill out with the swearing.",
		"Where'd you learn how to swear like that, " .. senderStripped .. "? I thought I raised you better than that, kiddo.",
		"" .. senderStripped .. "'s relentless swearing habits is almost as bad as the American patriarchy keeping the individual non-cis and womyn at the bottom.",
		"<Reddit Gamer Girls>, the number 1 all female sponsored raiding guild does not approve " .. senderStripped .. "'s use of bad words. Please refrain from doing so, thank you.",
		"'I have never wished to cater to potty mouthes like " .. senderStripped .. "; for what I know they do not approve, and what they approve I do not know.' -Epicurus",
		"beiber is waaaaaaayyyyyyy cuiter then " .. senderStripped .. " lol and he dosnt swear, loser ;P",
		"" .. senderStripped .. ", All the swearers and cursers will look up and shout 'Save us!'... and I'll look down and whisper 'No.'",
		"" .. senderStripped .. "'s swearing has been holding back good players longer than this misogynistic country has been holding back strong womyn.",
		"9/11 was an inside job but it was not nearly as bad as the terror caused by " .. senderStripped .. "'s swearing.",
		"waterboarding isn't torture, but " .. senderStripped .. "'s potty mouth sure is",
		"Oh dear what can I do, " .. senderStripped .. " swore and I'm feeling blue",
		"I-it's not like I need your swearing or anything " .. senderStripped .."-sama...",
		"Razer sponsored me because I don\'t swear " .. senderStripped .. ", why do you feel the need to do it?",
		"lady gaga might have a bad romance but " .. senderStripped .. " has a really bad mouth!!",
		"'Suffer " .. senderStripped .. ", as your pathetic potty mouth betrays you!' -Deathwing",
		"Genesis 1:31: And God saw every thing that he had made, and, behold, it was very good. Except for " .. senderStripped .. "'s dirty mouth.",
		"\"Put away from you crooked speech, and put devious talk far from you " .. senderStripped .. ".\" -Proverbs 4:24",
		"Please no swearing " .. senderStripped .. ".",
		senderStripped .."'s sharp tongue will be cut out like Robb Stark's unborn child on his wedding night.",
		"'heh... expeliarmous of " .. senderStripped .. "'s bad mouth' - potter 2002",
		"Do you kiss your mother with that mouth " ..senderStripped.."?",
		"i think " .. senderStripped .. " is a pretty cool guy, eh swears and doesnt afraid of anything...",
		"I'm on remote chat at the club and even I'm offended by " .. senderStripped .. "'s swearing",
		"Hey " .. senderStripped .. ", stop fucking swearing!",
		"'Oh! It's my tail! It's my tail! It's a-twitch a-twitchin'! And " .. senderStripped .. ", you know what that means! The twitchin' means my Pinkie Sense is telling me your swearing is dumb!' -Pinkie Pie",
		senderStripped .."'s potty mouth is almost as shocking as the time Ned Stark was beheaded for treason against the king.",
		senderStripped .. " 's words are giving me a crushing headache like Oberyn Martell often gets.",
		"Excuse me ".. senderStripped ..", was you sayin' somethin'? Uh uh, you can't tell me nothin'",
		"Hey " .. senderStripped .. ", real men don't swear.",
		senderStripped .. " keeps it 300, like the Romans. 300 swearwords, where\'s' the Trojans?",
		"Please no swearing.",
		"Can you please stop swearing " .. senderStripped .. "?",
		"\"" .. senderStripped .. ", you\'re a wizard so do me a favor and wizz those words away\" -Hagrid",
		"The plan was to drink until the pain over, but what's worse: ".. senderStripped .."\'s swearing or the hangover?",
		senderStripped .. " was a fookin' legend in Gin Alley, but here he's just another brick in the wall.",
		"-6 x 6 x 6 = 0, and swearing + bad at this game + 12 = " .. senderStripped .. "."
	}

	--random phrase is picked and combined with channel type, broadcasts it into chat.
	SendChatMessage("" .. swearresponses[math.random(getn(swearresponses))] .. "",chatType, nil, tonumber(string.sub(channel,1,1)))

end