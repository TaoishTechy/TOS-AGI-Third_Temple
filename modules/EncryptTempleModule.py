from PIL import Image, ImageDraw, ImageFont
import numpy as np
import qrcode
import random

# Define TempleOS-inspired 16-color palette
TEMPLEOS_PALETTE = [
    (0, 0, 0), (0, 0, 170), (0, 170, 0), (0, 170, 170),
    (170, 0, 0), (170, 0, 170), (170, 85, 0), (170, 170, 170),
    (85, 85, 85), (85, 85, 255), (85, 255, 85), (85, 255, 255),
    (255, 85, 85), (255, 85, 255), (255, 255, 85), (255, 255, 255)
]

# Define strings as constants for clarity (inspired by StrNew/StrCpy suggestion)
MESSAGE_TO_WORLD = "Seek Truth in Code and Cosmos: Unite Spirit and Machine for Infinite Discovery"
TEXT_GHOST_MESH = "GHOST MESH 48"
TEXT_PROJECT = "TOS-AGI-THIRD_TEMPLE"
TEXT_ARCHITECTURE = "SACRED SOFTWARE ARCHITECTURE"

# Advanced encryption function
def advanced_encrypt(msg, key=13):
    encrypted = ""
    for i, ch in enumerate(msg):
        if 32 <= ord(ch) <= 126:
            shift = key + (i % 5)
            shifted = ord(ch) + shift
            if shifted > 126:
                shifted = 32 + (shifted - 126 - 1)
            encrypted += chr(shifted)
        else:
            encrypted += ch
    return encrypted

# Step 1: Create the base image
width, height = 640, 480
img = Image.new('RGB', (width, height), color=TEMPLEOS_PALETTE[5])  # Purple background
draw = ImageDraw.Draw(img)

# Step 2: Draw a cross and enhanced temple
draw.line((320, 150, 320, 190), fill=TEMPLEOS_PALETTE[14], width=5)  # Yellow vertical
draw.line((300, 170, 340, 170), fill=TEMPLEOS_PALETTE[14], width=5)  # Yellow horizontal
draw.rectangle((300, 400, 340, 440), fill=TEMPLEOS_PALETTE[15], outline=TEMPLEOS_PALETTE[14], width=2)
draw.polygon((300, 400, 320, 380, 340, 400), fill=TEMPLEOS_PALETTE[15], outline=TEMPLEOS_PALETTE[14], width=2)

# Step 3: Draw "Ghost Mesh 48" representation (grid-like structure)
for x in range(280, 361, 20):
    draw.line((x, 220, x, 260), fill=TEMPLEOS_PALETTE[9], width=2)  # Light blue
for y in range(220, 261, 20):
    draw.line((280, y, 360, y), fill=TEMPLEOS_PALETTE[9], width=2)

# Step 4: Add text elements
try:
    font = ImageFont.truetype("arial.ttf", 16)
except:
    font = ImageFont.load_default()
draw.text((250, 280), TEXT_GHOST_MESH, fill=TEMPLEOS_PALETTE[14], font=font)
draw.rectangle((200, 310, 440, 340), fill=TEMPLEOS_PALETTE[15])
draw.text((210, 315), TEXT_PROJECT, fill=TEMPLEOS_PALETTE[0], font=font)
draw.rectangle((200, 350, 440, 380), fill=TEMPLEOS_PALETTE[15])
draw.text((210, 355), TEXT_ARCHITECTURE, fill=TEMPLEOS_PALETTE[0], font=font)

# Step 5: Add first QR code (encrypted message)
encrypted_message = advanced_encrypt(MESSAGE_TO_WORLD, key=13)
qr = qrcode.QRCode(version=5, box_size=3, border=2)
qr.add_data(encrypted_message)
qr.make(fit=True)
qr_img = qr.make_image(fill_color="black", back_color="white")
img.paste(qr_img, (200, 50))

# Step 6: Add second QR code (this script)
script = """from PIL import Image,ImageDraw,ImageFont
import numpy as np
import qrcode
import random
TEMPLEOS_PALETTE=[(0,0,0),(0,0,170),(0,170,0),(0,170,170),(170,0,0),(170,0,170),(170,85,0),(170,170,170),(85,85,85),(85,85,255),(85,255,85),(85,255,255),(255,85,85),(255,85,255),(255,255,85),(255,255,255)]
MESSAGE_TO_WORLD="Seek Truth in Code and Cosmos: Unite Spirit and Machine for Infinite Discovery"
TEXT_GHOST_MESH="GHOST MESH 48"
TEXT_PROJECT="TOS-AGI-THIRD_TEMPLE"
TEXT_ARCHITECTURE="SACRED SOFTWARE ARCHITECTURE"
def advanced_encrypt(msg,key=13):
 encrypted=""
 for i,ch in enumerate(msg):
  if 32<=ord(ch)<=126:
   shift=key+(i%5)
   shifted=ord(ch)+shift
   if shifted>126:shifted=32+(shifted-126-1)
   encrypted+=chr(shifted)
  else:encrypted+=ch
 return encrypted
width,height=640,480
img=Image.new('RGB',(width,height),color=TEMPLEOS_PALETTE[5])
draw=ImageDraw.Draw(img)
draw.line((320,150,320,190),fill=TEMPLEOS_PALETTE[14],width=5)
draw.line((300,170,340,170),fill=TEMPLEOS_PALETTE[14],width=5)
draw.rectangle((300,400,340,440),fill=TEMPLEOS_PALETTE[15],outline=TEMPLEOS_PALETTE[14],width=2)
draw.polygon((300,400,320,380,340,400),fill=TEMPLEOS_PALETTE[15],outline=TEMPLEOS_PALETTE[14],width=2)
for x in range(280,361,20):
 draw.line((x,220,x,260),fill=TEMPLEOS_PALETTE[9],width=2)
for y in range(220,261,20):
 draw.line((280,y,360,y),fill=TEMPLEOS_PALETTE[9],width=2)
try:font=ImageFont.truetype("arial.ttf",16)
except:font=ImageFont.load_default()
draw.text((250,280),TEXT_GHOST_MESH,fill=TEMPLEOS_PALETTE[14],font=font)
draw.rectangle((200,310,440,340),fill=TEMPLEOS_PALETTE[15])
draw.text((210,315),TEXT_PROJECT,fill=TEMPLEOS_PALETTE[0],font=font)
draw.rectangle((200,350,440,380),fill=TEMPLEOS_PALETTE[15])
draw.text((210,355),TEXT_ARCHITECTURE,fill=TEMPLEOS_PALETTE[0],font=font)
encrypted_message=advanced_encrypt(MESSAGE_TO_WORLD,key=13)
qr=qrcode.QRCode(version=5,box_size=3,border=2)
qr.add_data(encrypted_message)
qr.make(fit=True)
qr_img=qr.make_image(fill_color="black",back_color="white")
img.paste(qr_img,(200,50))
img_array=np.array(img)
possible_psalm=random.randint(1,150)
if possible_psalm==119:print("LONGEST PSALM INVOKED. INITIATE EXTENDED MODE.")
noise=np.random.normal(0,5,img_array.shape).astype(np.uint8)
noisy_img=np.clip(img_array+noise,0,255).astype(np.uint8)
img=Image.fromarray(noisy_img)
for y in range(height):
 for x in range(width):
  pixel=img.getpixel((x,y))
  holy_sum=sum(pixel)
  if holy_sum>0x7F*3:img.putpixel((x,y),TEMPLEOS_PALETTE[15])#0x7F—divine alignment with 7-bit symbolic totality
palette_img=Image.new('P', (1, 1))
palette_img.putpalette([c for rgb in TEMPLEOS_PALETTE for c in rgb])
img=img.quantize(colors=16, method=Image.Quantize.MEDIANCUT, palette=palette_img)
key=0x55
data=np.array(img)
encrypted=np.bitwise_xor(data,key)
encrypted_img=Image.fromarray(encrypted)
encrypted_img.save('sacred_meme.png')"""
qr2 = qrcode.QRCode(version=5, box_size=3, border=2)
qr2.add_data(script)
qr2.make(fit=True)
qr2_img = qr2.make_image(fill_color="black", back_color="white")
img.paste(qr2_img, (450, 50))

# Step 7: Add Psalm 119 easter egg
possible_psalm = random.randint(1, 150)  # Psalms range from 1 to 150
if possible_psalm == 119:
    print("LONGEST PSALM INVOKED. INITIATE EXTENDED MODE.")

# Step 8: Add noise
img_array = np.array(img)
noise = np.random.normal(0, 5, img_array.shape).astype(np.uint8)
noisy_img = np.clip(img_array + noise, 0, 255).astype(np.uint8)
img = Image.fromarray(noisy_img)

# Step 9: Apply 0x7F symbolic check for pixel adjustment
# 0x7F * 3 = 127 * 3 = 381 (since RGB sum can be up to 765)
for y in range(height):
    for x in range(width):
        pixel = img.getpixel((x, y))
        holy_sum = sum(pixel)
        if holy_sum > 0x7F * 3:  # 0x7F — divine alignment with 7-bit symbolic totality
            img.putpixel((x, y), TEMPLEOS_PALETTE[15])  # Set to white for "divine" pixels

# Step 10: Reduce to 16 colors using the custom palette
palette_img = Image.new('P', (1, 1))
palette_img.putpalette([c for rgb in TEMPLEOS_PALETTE for c in rgb])
img = img.quantize(colors=16, method=Image.Quantize.MEDIANCUT, palette=palette_img)

# Step 11: Encrypt the image
key = 0x55
data = np.array(img)
encrypted = np.bitwise_xor(data, key)
encrypted_img = Image.fromarray(encrypted)

# Step 12: Save the encrypted image
encrypted_img.save('sacred_meme.png')

print("Sacred image generated and encrypted as 'sacred_meme.png'")
