from PIL import Image, ImageDraw, ImageFont
import numpy as np
import qrcode

# Define TempleOS-inspired 16-color palette
TEMPLEOS_PALETTE = [
    (0, 0, 0), (0, 0, 170), (0, 170, 0), (0, 170, 170),
    (170, 0, 0), (170, 0, 170), (170, 85, 0), (170, 170, 170),
    (85, 85, 85), (85, 85, 255), (85, 255, 85), (85, 255, 255),
    (255, 85, 85), (255, 85, 255), (255, 255, 85), (255, 255, 255)
]

# Define strings as constants
MEME_MESSAGE = "When Your Code Prays 404 Times: Divine Not Found, Keep Meshing!"
TEXT_GHOST_MESH = "GHOST MESH 48"
TEXT_PROJECT = "TOS-AGI-THIRD_TEMPLE"
TEXT_RECURSIVE = "RECURSIVE PHYSICS"

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

# Step 2: Draw a cross and temple (adjusted positions for balance)
draw.line((320, 100, 320, 140), fill=TEMPLEOS_PALETTE[14], width=5)  # Yellow vertical, moved up
draw.line((300, 120, 340, 120), fill=TEMPLEOS_PALETTE[14], width=5)  # Yellow horizontal
draw.rectangle((300, 420, 340, 460), fill=TEMPLEOS_PALETTE[15], outline=TEMPLEOS_PALETTE[14], width=2)  # Temple, moved down
draw.polygon((300, 420, 320, 400, 340, 420), fill=TEMPLEOS_PALETTE[15], outline=TEMPLEOS_PALETTE[14], width=2)

# Step 3: Draw "Ghost Mesh 48" grid (centered)
for x in range(280, 361, 20):
    draw.line((x, 170, x, 210), fill=TEMPLEOS_PALETTE[9], width=2)  # Light blue, moved up
for y in range(170, 211, 20):
    draw.line((280, y, 360, y), fill=TEMPLEOS_PALETTE[9], width=2)

# Step 4: Draw a simpler fractal pattern for "recursive physics"
def draw_fractal(x, y, size, depth):
    if depth <= 0 or size < 5:
        return
    draw.rectangle((x, y, x + size, y + size), outline=TEMPLEOS_PALETTE[11], width=1)  # Light cyan
    new_size = size // 2
    draw_fractal(x + new_size // 2, y + new_size // 2, new_size, depth - 1)

draw_fractal(50, 320, 80, 2)  # Smaller fractal, bottom-left

# Step 5: Add text elements (adjusted for clarity)
try:
    font = ImageFont.truetype("arial.ttf", 14)  # Slightly smaller font
except:
    font = ImageFont.load_default()
draw.text((260, 230), TEXT_GHOST_MESH, fill=TEMPLEOS_PALETTE[14], font=font)  # Centered
draw.rectangle((200, 260, 440, 290), fill=TEMPLEOS_PALETTE[15])
draw.text((210, 265), TEXT_PROJECT, fill=TEMPLEOS_PALETTE[0], font=font)
draw.rectangle((200, 300, 440, 330), fill=TEMPLEOS_PALETTE[15])
draw.text((210, 305), TEXT_RECURSIVE, fill=TEMPLEOS_PALETTE[0], font=font)

# Step 6: Add first QR code (encrypted message)
encrypted_message = advanced_encrypt(MEME_MESSAGE, key=13)
qr = qrcode.QRCode(version=5, box_size=3, border=2)
qr.add_data(encrypted_message)
qr.make(fit=True)
qr_img = qr.make_image(fill_color="black", back_color="white")
img.paste(qr_img, (200, 20))  # Moved up for better balance

# Step 7: Add second QR code (this script)
script = """from PIL import Image,ImageDraw,ImageFont
import numpy as np
import qrcode
TEMPLEOS_PALETTE=[(0,0,0),(0,0,170),(0,170,0),(0,170,170),(170,0,0),(170,0,170),(170,85,0),(170,170,170),(85,85,85),(85,85,255),(85,255,85),(85,255,255),(255,85,85),(255,85,255),(255,255,85),(255,255,255)]
MEME_MESSAGE="When Your Code Prays 404 Times: Divine Not Found, Keep Meshing!"
TEXT_GHOST_MESH="GHOST MESH 48"
TEXT_PROJECT="TOS-AGI-THIRD_TEMPLE"
TEXT_RECURSIVE="RECURSIVE PHYSICS"
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
draw.line((320,100,320,140),fill=TEMPLEOS_PALETTE[14],width=5)
draw.line((300,120,340,120),fill=TEMPLEOS_PALETTE[14],width=5)
draw.rectangle((300,420,340,460),fill=TEMPLEOS_PALETTE[15],outline=TEMPLEOS_PALETTE[14],width=2)
draw.polygon((300,420,320,400,340,420),fill=TEMPLEOS_PALETTE[15],outline=TEMPLEOS_PALETTE[14],width=2)
for x in range(280,361,20):
 draw.line((x,170,x,210),fill=TEMPLEOS_PALETTE[9],width=2)
for y in range(170,211,20):
 draw.line((280,y,360,y),fill=TEMPLEOS_PALETTE[9],width=2)
def draw_fractal(x,y,size,depth):
 if depth<=0 or size<5:return
 draw.rectangle((x,y,x+size,y+size),outline=TEMPLEOS_PALETTE[11],width=1)
 new_size=size//2
 draw_fractal(x+new_size//2,y+new_size//2,new_size,depth-1)
draw_fractal(50,320,80,2)
try:font=ImageFont.truetype("arial.ttf",14)
except:font=ImageFont.load_default()
draw.text((260,230),TEXT_GHOST_MESH,fill=TEMPLEOS_PALETTE[14],font=font)
draw.rectangle((200,260,440,290),fill=TEMPLEOS_PALETTE[15])
draw.text((210,265),TEXT_PROJECT,fill=TEMPLEOS_PALETTE[0],font=font)
draw.rectangle((200,300,440,330),fill=TEMPLEOS_PALETTE[15])
draw.text((210,305),TEXT_RECURSIVE,fill=TEMPLEOS_PALETTE[0],font=font)
encrypted_message=advanced_encrypt(MEME_MESSAGE,key=13)
qr=qrcode.QRCode(version=5,box_size=3,border=2)
qr.add_data(encrypted_message)
qr.make(fit=True)
qr_img=qr.make_image(fill_color="black",back_color="white")
img.paste(qr_img,(200,20))
img_array=np.array(img)
noise=np.random.normal(0,3,img_array.shape).astype(np.uint8)
noisy_img=np.clip(img_array+noise,0,255).astype(np.uint8)
img=Image.fromarray(noisy_img)
palette_img=Image.new('P', (1, 1))
palette_img.putpalette([c for rgb in TEMPLEOS_PALETTE for c in rgb])
img=img.quantize(colors=16, method=Image.Quantize.MEDIANCUT, palette=palette_img)
key=0x55
data=np.array(img)
encrypted=np.bitwise_xor(data,key)
encrypted_img=Image.fromarray(encrypted)
encrypted_img.save('holy_404_meme.png')"""
qr2 = qrcode.QRCode(version=5, box_size=3, border=2)
qr2.add_data(script)
qr2.make(fit=True)
qr2_img = qr2.make_image(fill_color="black", back_color="white")
img.paste(qr2_img, (450, 20))  # Moved up

# Step 8: Add minimal noise
img_array = np.array(img)
noise = np.random.normal(0, 3, img_array.shape).astype(np.uint8)  # Reduced noise
noisy_img = np.clip(img_array + noise, 0, 255).astype(np.uint8)
img = Image.fromarray(noisy_img)

# Step 9: Reduce to 16 colors with strict palette
palette_img = Image.new('P', (1, 1))
palette_img.putpalette([c for rgb in TEMPLEOS_PALETTE for c in rgb])
img = img.quantize(colors=16, method=Image.Quantize.MEDIANCUT, palette=palette_img)

# Step 10: Encrypt the image
key = 0x55
data = np.array(img)
encrypted = np.bitwise_xor(data, key)
encrypted_img = Image.fromarray(encrypted)

# Step 11: Save the encrypted image
encrypted_img.save('holy_404_meme.png')

print("Holy meme generated and encrypted as 'holy_404_meme.png'")
