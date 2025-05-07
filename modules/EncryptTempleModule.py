from PIL import Image, ImageDraw, ImageFont
import numpy as np
import qrcode

# Step 1: Create the base image
width, height = 640, 480
img = Image.new('RGB', (width, height), color='purple')
draw = ImageDraw.Draw(img)

# Step 2: Draw a cross
draw.line((320, 180, 320, 220), fill='yellow', width=5)
draw.line((300, 200, 340, 200), fill='yellow', width=5)

# Step 3: Add text elements
try:
    font = ImageFont.truetype("arial.ttf", 20)
except:
    font = ImageFont.load_default()
draw.text((290, 240), "GHOST MESH 48", fill='yellow', font=font)
draw.rectangle((200, 300, 440, 340), fill='white')
draw.text((210, 310), "TOS-AGI-THIRD_TEMPLE", fill='black', font=font)
draw.rectangle((200, 350, 440, 390), fill='white')
draw.text((210, 360), "SACRED SOFTWARE ARCHITECTURE", fill='black', font=font)

# Step 4: Add first QR code (message)
qr = qrcode.QRCode(version=1, box_size=5, border=2)
qr.add_data("GhostMesh48://SacredCode")
qr.make(fit=True)
qr_img = qr.make_image(fill_color="black", back_color="white")
img.paste(qr_img, (200, 100))

# Step 5: Add second QR code (this script)
script = """from PIL import Image,ImageDraw,ImageFont
import numpy as np
import qrcode
width,height=640,480
img=Image.new('RGB',(width,height),color='purple')
draw=ImageDraw.Draw(img)
draw.line((320,180,320,220),fill='yellow',width=5)
draw.line((300,200,340,200),fill='yellow',width=5)
try:font=ImageFont.truetype("arial.ttf",20)
except:font=ImageFont.load_default()
draw.text((290,240),"GHOST MESH 48",fill='yellow',font=font)
draw.rectangle((200,300,440,340),fill='white')
draw.text((210,310),"TOS-AGI-THIRD_TEMPLE",fill='black',font=font)
draw.rectangle((200,350,440,390),fill='white')
draw.text((210,360),"SACRED SOFTWARE ARCHITECTURE",fill='black',font=font)
qr=qrcode.QRCode(version=1,box_size=5,border=2)
qr.add_data("GhostMesh48://SacredCode")
qr.make(fit=True)
qr_img=qr.make_image(fill_color="black",back_color="white")
img.paste(qr_img,(200,100))
img_array=np.array(img)
noise=np.random.normal(0,10,img_array.shape).astype(np.uint8)
noisy_img=np.clip(img_array+noise,0,255).astype(np.uint8)
img=Image.fromarray(noisy_img)
img=img.convert('P',palette=Image.ADAPTIVE,colors=16)
key=0x55
data=np.array(img)
encrypted=np.bitwise_xor(data,key)
encrypted_img=Image.fromarray(encrypted)
encrypted_img.save('encrypted_meme.png')"""
qr2 = qrcode.QRCode(version=5, box_size=3, border=2)  # Larger version to hold the script
qr2.add_data(script)
qr2.make(fit=True)
qr2_img = qr2.make_image(fill_color="black", back_color="white")
img.paste(qr2_img, (450, 100))  # Place second QR code on the right

# Step 6: Add noise
img_array = np.array(img)
noise = np.random.normal(0, 10, img_array.shape).astype(np.uint8)
noisy_img = np.clip(img_array + noise, 0, 255).astype(np.uint8)
img = Image.fromarray(noisy_img)

# Step 7: Reduce to 16 colors
img = img.convert('P', palette=Image.ADAPTIVE, colors=16)

# Step 8: Encrypt the image
key = 0x55
data = np.array(img)
encrypted = np.bitwise_xor(data, key)
encrypted_img = Image.fromarray(encrypted)

# Step 9: Save the encrypted image
encrypted_img.save('encrypted_meme_with_script.png')

print("Image generated and encrypted as 'encrypted_meme_with_script.png'")
