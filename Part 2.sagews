︠9dd8af9d-0e01-4ab2-bfd4-79045764c3cbs︠
import hashlib, time;
from Crypto.Cipher import AES;
︡290f3d7a-ef95-4515-842f-024ab2a62a1f︡{"done":true}
︠51f4dd9d-99fb-471d-9aaf-9255a461144f︠

︡f8791eca-8bf6-4bb2-aa6c-9164bcaf72f2︡{"done":true}
︠89093a94-22fb-4de1-9505-919bd3f0972ds︠
#The procedure rsa on input a positive even integer bits ouputs an RSA public/secret key pair with security parameter bits
def rsa_kg(bits):
    p = next_prime(ZZ.random_element(2^(bits/2)+1));
    q = next_prime(ZZ.random_element(2^(bits/2)+1));
    N = p*q;
    phi_n = (p-1)*(q-1);
    while True:
        e = ZZ.random_element(1,phi_n);
        if gcd(e,phi_n) == 1: break
    d = Integer(Mod(xgcd(e, phi_n)[1],phi_n));
    return N,e,d
︡989e5c73-9172-4d6c-988c-c431c2d522f0︡{"done":true}
︠46014414-44f3-4bdc-b44e-d2e738eb7752s︠
# Run RSA KeyGen and measure running time
t0 = time.clock()
[N,e,d] = rsa_kg(2048);
t_kg = time.clock() - t0;
print t_kg, "seconds process time"
︡89d4df17-b6c2-4e0a-bf3b-b32c1f3e1932︡{"stdout":"5.100157 seconds process time\n"}︡{"done":true}
︠304d8d6b-446c-4715-aed9-58c4a6d610eas︠
N = 2969137743448355327270876080101054338540503259878959630250143995627090090022850067465952425419364381562376747694180021046125245916815600955902349704778606351768446238203395142552910659278295524811626878015858630283055801066768074106075626751467085779562898859072146739523803688429510424565270597342059874774779917771627069956148632281761919668380478984737940333079018716867146763647145975313498463972109605022440637990931976478053161446536228883589512353452610817258565587291176075341583042418338206367482892585691607496654425794359814148329857831356779761901706016990032962092873983791585459395968897828575512138547;
︡ac659e94-f190-4019-8d5f-e1ccec6f5e44︡{"done":true}
︠e4555d3b-370a-4784-b8c4-03a36e6e4eb3s︠
e = 2064502724322065619610920801703770332444544578216378001086293531541437374183762889883952350512303123079541900923236233763161664622129759456230282585413446407867738585722011359806614520232070965281852076618382612714679676252453566235434477739937086238884216665488842132820363214479571428652601988484224495946375721070361900809019329649759575762397833605938043186770042654743067422241477268365617031178172027178755693566409032818917422094610812754447975895865178682453225583191912212367134587486285799782155109152944427348690163315056825740636659649124179137271843769782829849167189203185398850604993866726625112631363
︡06513854-5bc8-481e-beff-284befc52321︡{"done":true}
︠dd159bd0-2d2e-4818-9c77-c6c510d10701s︠
d = 164817171348527753755753603208635619036742073490749506468530930040229764324972692351811470318943236231391855322409976772474849437481937321584288412475299520496938778322645713531603387147172015809882991421907967718504448548287903159721834384358524520658829657167125523862260294993911164088147896499614150244466758466499147482798407833932553820855390993329068527259498384422355392532636839202977467718918529762153015027733261572472919660978457140265299527583227438757503041269902360154624211469038648095333715478964923727948835108680731335999764070544712506207238472730515423196541791784693242359458343141777315367787
︡b57f14ba-7e80-4d16-859b-0f3a12dea195︡{"done":true}
︠524c6586-53d9-48b2-9895-dd3b15077b82s︠
# Encrypt m = 2 with plain RSA encryption and obtain ciphertext c
c = power_mod(2,e,N); c
︡7dc2aaf5-22c8-43ec-9691-08d27034e9b6︡{"stdout":"1579537616800332855330482887003234877585569236489992131463653677686977180490221590823049497065373237584660691540746772917116410466347176795492135108383079607840092696810816729322146461557538914076505636207216211757376777007367007970601596344224714263218730864511397929999886225777599077532744605145949852783344248875642720438814807814619545696382034228545344059678899076406699050493001107859555730315799225539192813046122582640616661376817524859534982571053780378141779441534937844179952020273058617513753743298588995776430007714224224057045498948527517422768903668524822975855790017863933400235630510897858716045611\n"}︡{"done":true}
︠f91220d3-bc07-4d0e-a075-d09268acd748s︠
# Decrypt c, an encryption of m = 2, with plain RSA decryption, and obtain ciphertext c
power_mod(c,d,N)
︡f0cc5513-79b0-4b65-9e6d-f767f0d96c2f︡{"stdout":"2\n"}︡{"done":true}
︠b2ec8f8e-efb5-4d61-ab8a-f8ad15477fd3s︠
# measure plain RSA encryption process time
t0 = time.clock()
c = power_mod(3,e,N);
t_enc = time.clock() - t0;
print t_enc, "seconds process time"
︡dcdef16a-6705-44cc-8511-6a8d9a89c16b︡{"stdout":"0.010369 seconds process time\n"}︡{"done":true}
︠3ab0810c-6ecf-400f-8aea-1f919a9f84b3s︠
# RSA Key Generation is more computationally expensive than RSA Encryption
print "RSA Key Generation is", t_kg/t_enc, "times slower than RSA Encryption for 2048 bit keys"
︡0f282126-c738-4fd0-a56b-7c662d6ae83e︡{"stdout":"RSA Key Generation is 491.86585013 times slower than RSA Encryption for 2048 bit keys\n"}︡{"done":true}
︠00fc83ac-3182-4d71-ac44-1c52b5d2ecbes︠
# Computing SHA1 hash function examples
m = hashlib.sha1()
m.update('abc')
m.hexdigest()
︡97c33b12-7763-4fef-829b-780d1ce12fb3︡{"stdout":"'a9993e364706816aba3e25717850c26c9cd0d89d'\n"}︡{"done":true}
︠e8468ff2-c451-4ef0-a642-55bcd5c9c2d6s︠
# Computing SHA512 hash function example
long_m = hashlib.sha512()
long_m.update("abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu");
long_m.hexdigest()
︡1bd439fd-3c9c-4530-95ee-8afe81f1cb44︡{"stdout":"'8e959b75dae313da8cf4f72814fc143f8f7779c6eb9f7fa17299aeadb6889018501d289e4900f7e4331b99dec4b5433ac7d329eeb6dd26545e96e55b874be909'\n"}︡{"done":true}
︠0fded2a0-7a60-493c-9480-5eb8cf565acfs︠
# Convert an hexadecimal string to an integer
long_m_int = Integer(int(long_m.hexdigest(),16)); long_m_int
︡23218750-13b5-4039-82bd-9b046be7ffc9︡{"stdout":"7467751150072304710748607053756525574443640673541183129594735496433453152253989885323496399866777464427478124519714519652484878749913622135027995536779529\n"}︡{"done":true}
︠d378144f-d2ad-4af3-83ca-a0d5d60d8a24s︠
# Convert an integer into an hexadecimal string
long_m_int.hex
︡7331d3dc-8cc4-4e57-8e07-e584a433ecc0︡{"stdout":"<built-in method hex of sage.rings.integer.Integer object at 0x7fc4018fcb10>\n"}︡{"done":true}
︠2473d68c-0924-419b-8714-1e24ccc7fbd2s︠
# Toy encryption with AES; obj is the symmetric cipher object defined by the sender
obj = AES.new('This is a key123', AES.MODE_CBC, 'This is an IV456')
message = "The answer to your request is no"
t0 = time.clock()
ciphertext = obj.encrypt(message)
t_aes = time.clock() - t0;
print t_aes, "seconds process time"
ciphertext
︡9c0ef481-3abc-40aa-83d2-50f5ce402b08︡{"stdout":"0.00026 seconds process time\n"}︡{"stdout":"\"+\\xf05e3g\\xf9\\xcc\\x94<\\xf4\\x94\\x9e\\xdf\\x97\\xbf\\xdb_&\\xb5\\xf7K\\xeb'\\xa5\\x94\\x84\\x0f\\xd8H.\\x81\"\n"}︡{"done":true}
︠7913bdb8-6eeb-4028-8dc8-3ea3bfd7d75as︠
# Toy decryption with AES; obj2 is the symmetric cipher object defined by the receiver
obj2 = AES.new('This is a key123', AES.MODE_CBC, 'This is an IV456')
obj2.decrypt(ciphertext)
︡bc61f896-5958-4fd3-abac-51109795deb9︡{"stdout":"'The answer to your request is no'\n"}︡{"done":true}
︠c27a0855-3e6d-40d9-8abe-dd39a36fe6dfs︠
# measure plain RSA encryption process time
message1 = "The answer to your request is no"
integer1 = Integer(int(long_m.hexdigest(),16)); integer1
t0 = time.clock()
ciphertext1 = power_mod(integer1,e,N)
t_enc = time.clock() - t0;
print t_enc, "seconds process time"
︡a0c50e6a-40ae-4f9d-97f9-5c42cecbbe81︡{"stdout":"7467751150072304710748607053756525574443640673541183129594735496433453152253989885323496399866777464427478124519714519652484878749913622135027995536779529\n"}︡{"stdout":"0.010364 seconds process time\n"}︡{"done":true}
︠ca442dab-7176-4717-a7d9-fcdac98f01c5s︠
# RSA encryption is slower than AES encryption
print "RSA Key encryption for 2048 bit keys", t_enc/t_aes, "times slower than AES encryption for 128 bit keys"
︡f35bb2d1-2c35-4ea3-9195-a03364cf7489︡{"stdout":"RSA Key encryption for 2048 bit keys 39.8615384615 times slower than AES encryption for 128 bit keys\n"}︡{"done":true}
︠bf1e18d8-52b8-45ae-8096-91c792221075s︠
# More realistic example with AES_CBC
long_plaintext = "To be, or not to be: that is the question: Whether tis nobler in the mind to suffer The slings and arrows of outrageous fortune, Or to take arms against a sea of troubles, And by opposing end them? To die: to sleep; No more; and by a sleep to say we end The heart-ache and the thousand natural shocks That flesh is heir to, tis a consummation Devoutly to be wish d. To die, to sleep; To sleep: perchance to dream: ay, there s the rub; For in that sleep of death what dreams may come When we have shuffled off this mortal coil, Must give us pause: there’s the respect That makes calamity of so long life; For who would bear the whips and scorns of time, The oppressor’s wrong, the proud man’s contumely, The pangs of despised love, the law’s delay, The insolence of office and the spurns That patient merit of the unworthy takes, When he himself might his quietus make With a bare bodkin? who would fardels bear, To grunt and sweat under a weary life, But that the dread of something after death, The undiscover’d country from whose bourn No traveller returns, puzzles the will And makes us rather bear those ills we have Than fly to others that we know not of? Thus conscience does make cowards of us all And thus the native hue of resolution Is sicklied o’er with the pale cast of thought, And enterprises of great pith and moment With this regard their currents turn awry And lose the name of action.–Soft you now! The fair Ophelia! Nymph in thy orisons Be all my sins rememberd._________"; len(long_plaintext)
key = "abf7158809cf4f3c"; len(key)
iv = "08090b0b0c0d0e0f"; len(iv)
︡cf5b5203-18db-4ebc-a6f3-b40d069630d6︡{"stdout":"1504\n"}︡{"stdout":"16\n"}︡{"stdout":"16\n"}︡{"done":true}
︠7ca62a0c-9870-4d64-96c4-f654cfb2db68s︠
cipher = AES.new(key, AES.MODE_CBC,iv)
c_long = cipher.encrypt(long_plaintext); c_long
len(c_long)
︡097d2f46-2c08-4cc7-a031-a445fb09297a︡{"stdout":"'RV\\xea-\\xa6\\xe1\\xa7\\xc5\\x0b\\x0e\\x05hs\\xa5\\xd4r\\x94\\xf4x\\x8c\\xbc{\\xa3\\x99OB\\x80\\x7f\\xf5&\\x0c\\xd0\\xae\\xe3\\xcdR4\\xd9-p\\xa4\\xfa\\xb0\\xe0\\xf2\\xdc\\xb7O\\xa6\\xba\\xafj\\r\\xf6\\x1c\\xf7\\xbb\\x0f\\xba0s\\xe32\\x04\\xf8;\\x8f\\xf9\\xd9\\xdd\\xf5n\\x0b\\x9e@\\x83\\x8f\\x0b\\xc0\\xfciP\\xbc\\xb2\\'\\x02\\xaeA\\x90\\x03\\x8f#\\xe4\\xd7\\xe0\\xf5vG|\\xae- \\xa0|\\x0ez.\\xfe*\\x10\\xa66\\xc8\\x0c\\x19\\x12<\\xd7\\xa3\\x85\\xaa\\xfcy\\x82n\\xe2\\xb5\\x89\\xd1\\xc6?\\xf2< \\xd8ID\\xb8\\x8d\\x11\\xb3uM<[z\\xbeMr\\xce\\xd0a\\x14\\xd9\\xe5\\x1e\\x84-7\\xf3\\x7f\\x8eB\\xecY\\xfc\\xbc\\xc1@F)\\xb4\\x1d\\xb5\\xf7 G\\x81a;\\xe3\\xa7.\\'\\xb8A\\x91K0=H0#\\xa8\\x18\\xa9T\\xf1`\\x06\\xc5\\xda\\n\\xc0K\\x0e\\x03\\xf4$:o\\xd6k#S\\xe8e\\x04\\xaf\\x82\\x16\\xad/u\\xd8\\xdcL\\xc4\\xcf\\t)\\xd0jw\\xf8z>\\xca\\xac\\x98\\xa0\\x8b\\xb2?\\xf9\\xf46s\\x86\\x8c7(\\x13_`B/O%\\x13\\xad\\xe7\\xeb\\xa6\\xe1\\x18\\x97\\xe8\\'\\xe3\\x91\\x87\\xdb5\\xbe\\x101H\\xfa=\\xbb\\xc2F \\xd3\\xe3\\x8e\\xf8\\x0f\\r\\xb7\\x92\\xc3b\\xa4+\\xa0$\\x91\\xfb\\xddHl\\xad)k\\xc7\\xcd/C\\xb1\\x11\\x96\\x81x\\xe3:!\\x87\\xd7\\x19\\x9d\\xa6M\\xbf\\xf8A0\\xf2E\\x8bj\\x1d5\\xeat\\xb2\\t1\\x8b\\xe1V\\xfbv\\xcb\\x86.g\\xc2\\x92\\x98\\x00\\x14\\x7f\\x95\\x0b:\\xee\\xdeB\\xee\\x1a\\xda\\xc4\\xe7\\xc4\\xa0\\x85\\xe8&\\x94\\x01c\\xa5\\xff\\xdaO\\xbd\\xad\\ni\\x8d\\x8f]\\xe2\\xa8\\x17\\xe2\\xd7;\\xc8_\\x93\\xcd\\x86\\x85\\xccE\\x06\\xe6\\xd2Cu-\\xe5\\x8eC\\x0f\\xdbx\\xb5\\xb7\\xbc\\x8f\\x89\\xe3a\\xd1L\\x17X\\xf8\\x87U\\x7fN\\x92\\xe9MP\\xd4\\xe8\\x06\\xb2t\\xd9\\x11\\x8e/P\\x14\\x8fnQ\\xe0\\x13\\xba\\x12\\x81\\xe9\\x8a\\xb8\\x824\\x08Ch\\x8d\\xa5\\xd3\\x1a8g\\x90m\\x10\\xc7\\xd7\\xde\\x95\\xf1^\\xe8\\xb3\\xdcm\\x82\\x18\\xa1f\\x1a{5\\xae\\x93z\\xb0dC?\\xb7\\xb2:\\xb0yb\\x99L5Qso&\\xe0Aq\\xe4\\xa3\\x9e\\xdb\\x7f\\xb2\\xe2\\xb6\\x19~\\xf9c\\xb8\\xfd\\xc9\\xd67\\x97\\x01*\\x9a\\xfe\\xdc\\xa64\\xb3\\xcb\\x9c\\xe0\\xc4\\x04\\xf5)\\n\\xf5\\xda\\x81\\x14\\xf7DI\\xd4m-f~\\x1b\\x87\\xc3 U\\xb1\\x03\\xdd\\xf0\\xe3\\xa5\\xb6V\\x98\\xba,\\xf5\\xd6_\\xea\\x1fr\\xd0\\xf7\\xc7Z\\x8c\\x12\\x98\\x1b.<\\xc4M\\x18f\\x85\\xfb\\xda\\xdc\\xa3\\xc5\\x19`\\x88\\xf3\\xa1dC\\x9aj\\xbf\\xab\\x94M\\xef\\xc2[\\xa92\\x0b\\xa7\\x0c\\x8f{\\x87\\xbc\\xd1\\xc9)`\\x01k1\\x1c\\xf9\\r<\\x1aI~\\xe3\\x85VL]\\xd6\\xe1c@\\xc9W\\xb4\\xca\\x83\\xbew\\x07qk5\\xe2\\xce%\\x8cVp\\x8d\\xd8\\xdcY\\xab\\xa74\\xbd\\xf2\\x996\\xe9\\xdf\\xf1\\x0b\\xbb\\x04[\\xe7d\"\\x03\\xd2\\x961U\\x1d\\xea\\x95?!R\\x1d\\xf4\\xdb\\x06\\xecL\\x8e\\x96V\\xa5\\x85\\xd9\\x1br,;\\xb0\\x8f\\xce\\x89=\\xe2\\x8eV\\xe1\\x1c\\x15@\\x8a1\\xa4\\x9eg7N\\x18\\xa6\\x10\\xafD\\xf4\\xbb\\xb0\\xb1E}H\\x18\\xe3Op`\\xd7\\x14\\xe6\\xa3\\xa6>\\xd2\\x90(:\\xab\\xbe\\xad\\xc2\\x0b}\\xee\\xaaD\\x84\\x07\\xc4]\\x10\\x1bR\\xb6\\x1b0(\\xce\\xfa\\t[\\xd71\\x84\\xe3\\xc1R\\x1fjdx\\x80\\x13\\x1d\\x8b2q%\\xb0\\xfc~\\x0b\\x80X\\x06p\\x97\\x16\\x83]\\x08\\x0f\\xb5\\xc3\\x0b\\x91,\\x9eIp\\x8c2\\xbd\\xf8\\xc8\\xc2/4\\xc0\\xaf\\x06\\x85\\x1c\\x16<\\xd5R5\\xda\\xc9\\x1e\\xf2Q|\\x94\\xa6\\xcfd\\x7f1\\xc5w\\xa9\\xed6DV\\x18\\xf7H\\x0f\\xc6\\xc3\\x89\\x9c\\xf0\\xc4\\x8d\\xce5\\x14AuV\\xacJ\\x01\\xf6\\xc5\\x18\\xfb\\x91\\x04\\xc4$\\xd73+0\\xfd\\x8d\\x17\"\\xf7\\xb0!\\x98\\xfcu\\xfbjgtc\\x1b\\x8ef\\x1a2\\x05km\\xb2\\x89y\\xf1\\xd1\\xe8\\xb9\\xc4 \\x93\\xdc\\xb8\\x9c\\xc6\\xb4\\xf8~\\x95G\\xef\\xacW\\x87J\\x13\\xbe\\xd5\\x938&\\xbf\\x02\\x81\\x8c\\x00\\xb6`n\\\\\\xac\\xe0\\x9b\\xfd\\xf1\\x05e\\xdd\\x03\\xcemX\\xff\\xdc\\x96ux\\xd3_\\x8e\\x13V\\xd3w\\xa5\\x00\\xdco<\\xacy@2\\xeb\\x1e\\xe79\\\\a2\\x85Al\\xbf\\xe7\\x98Hs\\x81^\\xcc\\xbb!`33y\\xe7\\xf3\\xfbF\\xa1\\xeb\\xadB\\xc05\\xb6\\x8bK\\xd7\\x12\\x05\\xf2\\xfej\\xc9\\x18x@\\xc1\\x9d\\x0f\\xea\\x95bE\\x02O|\\xa6r>\\xffP\\xb6Ni*\\xb6\\xd0T6\\x8a\\xdc\\xd4R\\xc2hB\\xb3tnJ\\xaf\\x04\\x14Jz\\xa3\\xd2c\\xcc\\xcfm\\x00\\x99\\xcb\\x97\\xd5\\xc75k\\xe2|\\x1b\\xef\\xf5s|\\xb1\\x81\\\\\\x88\\t\\xaf\\x19\\xff\\xbf\\xae(\"+\\xb3H\\xa9\\xbd\\xef\\x11>H\\x01\\xc8\\xd5\\xad\\xbe\\xebe\\x9f-\\x8fv6,\\xbf\\xc0\\xe9\\x87.\\x83{\\x81a\\xd6\\x1a\\xb3\\x1dt\\x8b\\x15:\\x0ef\\xfc\\xe9\\x86\\xd0\\xcd\\x0b\\x17D\\xf8\"\\x90\\xeb\\xc22\\xbfS`q\"\\x93{o&\\xd3d\\x18\\x83\\xa9<<\\xf2\\x8e\\xe4\\xe1\\x90c\\x0e\\xe4\\x84\\xef\\x04\\xc6\\xde\\xd5\\xb7\\xa8O\\xe0\\x1a\\xbeCW\\xaf\\x19\\xc7\\xd0\\x05\\xd8\\xb3\\x0fX\\x90{)N\\xc9\\x94\\x0b\\xbd\\xd6\\xb8\\x1a\\xe6R\\xc7\\x9be\\x8ep\\x03\\x7f\\xc6K\\x94n\\x0e\\xb88\\xf0\\xfd\\x8a\\x1a\\x89\\x0f\\xd6\\xa7V\\xc8\\x05\\x82\\x1b\\xc5H\\x8e[\\x83T\\x91\\x081\\xbd\\x84\\x90\\x9b\\x1dgz(\\xb7U3=\\x1a\\xbc6\\xf2\\xe5z\\xb2\\xc5\\xdf\\xb9\\xdf)Fm\\x98\\xac.\\x11\\x18\\xcf\\xfbF\\x922\\xc4d\\xc5\\xacl\\x17\\xe0\\x07\\x137l\\xed\\xa6\\xa9/[\\x98\\xa93e\\xaco\\xb6\\xb5{:\\x18\"\\xd9\\xa6T\\x10\\x8b\\xb3\\xbb\\xd4Z\\xe5\\x8f\\xe2\\x0c\\x00\\xf0[\\x99\\xd4\\x94\\xc2\\x12\\x97_v\\xa6)L\\x0c\\xa8\\xb7\\xd1\\xfc+\\xd6Z`\\xc2\\xae\\xf9\\xa4\\\\\\xfbr\\x1d\\x99\\x07\\x91F\\xa4\\xe9\\xee\\xc0r_zq\\xc1\"\\xf0\\xe7\\x9dy&\\xdc\\x8c}\\xb8\\xc8\\xb1\\xc2\\xe6\\xc9%\\xc2Lwc&5\\x98G\\x90\\x8d)jm\\xfc\\xfbf+\\xf4h9\\xea\\xa6\\xf6\\xfaS\\xc4\\x10\\x87\\xdf\\xe3\\xff\\x1f\\xd54@9\\x97\\x13\\xbf\\xf7\\xf8\\x15{\\x8d\\xae@\\xe2\\xcf\\xe8\\xa6\\xf9y3\\xb5,\\xb5\\xf4\\x1bL\\xb3\\x1d\\xa9k\\xc0\\xfd\\xde~\\xe8\\xff\\rZ\\xa8N\\xc5r0\\x8d\\x84Z\\r\\xb7u\\xb3N\\xb8\\t\\x165e>\\x9a\\x0eqa\\xfa\\xc4\\x15\\x0bnHQ\\xc1U\\xc3G\\x01.\\xda\\xf4\\x1fZ\\xce\\xaa\\xc2\\xb5\\x89u'"}︡{"stdout":"\n"}︡{"stdout":"1504\n"}︡{"done":true}
︠fdc7f6ac-3c93-41c5-bb7a-dc988d61c663s︠
decipher = AES.new(key, AES.MODE_CBC,iv);
decipher.decrypt(c_long)
︡725ae537-e053-4cd5-a544-fc3447a6c8bf︡{"stdout":"'To be, or not to be: that is the question: Whether tis nobler in the mind to suffer The slings and arrows of outrageous fortune, Or to take arms against a sea of troubles, And by opposing end them? To die: to sleep; No more; and by a sleep to say we end The heart-ache and the thousand natural shocks That flesh is heir to, tis a consummation Devoutly to be wish d. To die, to sleep; To sleep: perchance to dream: ay, there s the rub; For in that sleep of death what dreams may come When we have shuffled off this mortal coil, Must give us pause: there\\xe2\\x80\\x99s the respect That makes calamity of so long life; For who would bear the whips and scorns of time, The oppressor\\xe2\\x80\\x99s wrong, the proud man\\xe2\\x80\\x99s contumely, The pangs of despised love, the law\\xe2\\x80\\x99s delay, The insolence of office and the spurns That patient merit of the unworthy takes, When he himself might his quietus make With a bare bodkin? who would fardels bear, To grunt and sweat under a weary life, But that the dread of something after death, The undiscover\\xe2\\x80\\x99d country from whose bourn No traveller returns, puzzles the will And makes us rather bear those ills we have Than fly to others that we know not of? Thus conscience does make cowards of us all And thus the native hue of resolution Is sicklied o\\xe2\\x80\\x99er with the pale cast of thought, And enterprises of great pith and moment With this regard their currents turn awry And lose the name of action.\\xe2\\x80\\x93Soft you now! The fair Ophelia! Nymph in thy orisons Be all my sins rememberd._________'\n"}︡{"done":true}
︠90fcf925-78b6-451f-aa35-62b8057b0b4cs︠
#####DATA FOR THE ASSIGNMENT - EXERCISE 3######
eA = e;
︡5af5cbd1-9248-45b9-a071-dee2c7b19b10︡{"done":true}
︠7ee0a4b1-5c21-4518-b646-406de1888dd4s︠
eB = 345876628472173658667827209598382151105659756356047916616789608178750837186397400300720629651340906876883086914495035331197886605204006436370260001522881159036935864943407229927853909159622840262574082310844414506912374854901914383942533751831444966354228432405145711811352973922639155549967535687324229764372344162085165004285404573177532292355481437060424009838888577080364530392886743183323043816768429349194326761737705660684396204279082233532281958218079492085884478114686098035666343747253331397342623111000982654071759143224287261895337445430397635372322031624510827582994475842436489318181834008077000862716
︡f5d59d1c-8fc0-4f37-837b-4e9439e2fbe5︡{"done":true}
︠5506de71-9426-4c25-9732-89a5f02105a9s︠
cA = 599595716443335281998311836057824471423872949240946858680326885165189798248960569757894506358411805849585756670489287378663084704040194999917555981780947347168038953586881042265439088817588061113649282685562685793490922993153055756402440331270258091628957614506114564171089877371669425927413409680720072212671386711718210703493452595971294376452211824154369667228880216368587635945779792347579255888106682362545743068441745513171129264302343262741956564684731698919731241320987319631379148776964502682709221865993042999911089876791270600102273290388573803610119258785910206047147140049692741145838272637793573255535
︡4281c468-66f7-4498-8794-2379a4659a1b︡{"done":true}
︠377d9ee4-51f5-4bbf-a45f-791ffed37a87s︠
cB = 2770835070150439572361533458323853323331135769889806688952647723143090100332051468165048542378394448963218541675902047035925067679296545656936804088767980103951194340741696655103629403946052706547893699470917118074151642535282745768975138916426158727962237119890937352175934340987683034250582715361270008618676286594711314192182238464819951042936453477966710596316628687230956133831756510575129966303624319409792343130059271611653561066928057558199354900277398160189613164209414757242894166135226111274887275728717755076389566803028116652956415673871044558606548743531525162718902734213942283806624617372725072274578
if(gcd(eA,eB)==1):
    x= xgcd(eA,eB)[1];
    y = xgcd(eA,eB)[2];
    print(x*eA+y*eB,x,y);
    m1 = power_mod(cA,x,N)*power_mod(cB,y,N)%N;
    print(m1)
︡803233df-e5d5-485b-b199-de2e8bdb547b︡{"stdout":"(1, -54757658640070026277373153508320349191862062943963599526410270111086739242970583119595450807036444777481669887086135100110080682667015005858680168103659618445784300010214934603910861446796585063713432256286844872157558274259356646876275736813221800912502149069437184312558512183238739389080205524994422464311190413687120706885275277424053668950668975297214155419901144141933140719398294600863483415800061785050529249723275638843144766710434064484796371212504856875471155682202850185368359112204043420577929684368959891137797448177416930477667141855848732148667439773004628141122951436838234054471217791329616021969, 326842943795542136131388887231748194396558586770160309243642890159405490611790943987284479429316660953441133005284064323005053864045297413721782876739412622391329538974536874168572736751884527475119667927069959809147533979991983942166765041610392537355006985362960363172821065996696463727474943721458109078544459158781466460796580527073621281368923229680894391283524619820857108446353233569570309661327714082026182018748651423555464788726121619575985714343257074481710573234451503660784969746628957757055136613377811460265617206006387463809679742541824587941728051765825600741547056253885241043345055066763224531603)\n1241284880241822245031350316995316509613760031105566488758549213410379930768454638388105627962603033792604848852231910514447243725489419608385858883735979314364859728491299260062917200230440025398527707702850295624884577127897107255287191960914532074227602971007475556486214187806225594131456395882122963770810290613577965251307069511057382696768233468670233045728589973715388024931195704831783334623721062756711756350120344089464621935361024119741178566435368539009948622626793857657155673701127355633007181134673038573037510656910655350038503632683840012771185561459530291941543524137687560199607394816363851431902\n"}︡{"done":true}
︠441be32d-ea95-4480-a96a-9b6db613b945s︠

︡17e6f5c6-e252-46c2-bfed-552daf8b3a02︡{"done":true}









