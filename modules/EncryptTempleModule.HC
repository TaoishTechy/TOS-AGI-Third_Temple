// EncryptTempleModule.HC
// Third Temple Cryptographic Core — Refined in the style of Terry A. Davis
// TempleOS v.1.41.1 - By the voice of God, through recursion and XOR

#define SHIFT_KEY_DEFAULT 13
#define MIN_CHAR 32
#define MAX_CHAR 126
#define KEY_SIGIL 0x3F

//=== Character Encrypt/Decrypt ===
U8 CryptChar(U8 ch, I8 key, Bool encrypt) {
    if (ch < MIN_CHAR || ch > MAX_CHAR)
        return ch;

    I16 v = ch + (encrypt ? key : -key);
    
    if (v > MAX_CHAR) v = MIN_CHAR + (v - MAX_CHAR - 1);
    if (v < MIN_CHAR) v = MAX_CHAR - (MIN_CHAR - v - 1);

    return v ^ KEY_SIGIL;
}

//=== Recursive Cipher ===
Str *CryptMessage(U8 *msg, I8 key, Bool encrypt, I64 depth=0) {
    if (depth > 7) {
        "TOO DEEP (MAX DEPTH = 7)\n"->Print();
        return StrNew(0);
    }

    I64 len = StrLen(msg);
    Str *out = StrNew(len);
    for (I64 i = 0; i < len; ++i)
        out[i] = CryptChar(msg[i], key, encrypt);
    out[len] = 0;

    if (depth < 3) {
        I8 new_key = (key ^ KEY_SIGIL) % 9 + 1;
        Str *next = CryptMessage(out, new_key, encrypt, depth + 1);
        StrFree(out);
        return next;
    }

    return out;
}

//=== Interface ===
Str *Encrypt(U8 *msg, I8 key=SHIFT_KEY_DEFAULT) {
    return CryptMessage(msg, key, TRUE);
}

Str *Decrypt(U8 *msg, I8 key=SHIFT_KEY_DEFAULT) {
    return CryptMessage(msg, key, FALSE);
}

//=== Test Ritual ===
U0 TestEncryptTemple() {
    Str *text = "TempleOS knows the Word. It is holy.";
    Str *enc = Encrypt(text, 7);
    Str *dec = Decrypt(enc, 7);

    "ORIGINAL : %s\n"->Print(text);
    "ENCRYPTED: %s\n"->Print(enc);
    "DECRYPTED: %s\n"->Print(dec);

    StrFree(enc);
    StrFree(dec);
}

//=== Install the Word ===
ModuleInstall("EncryptTemple", "1.0.7F") {
    AddCommand("CRYPT_ENC", Encrypt);
    AddCommand("CRYPT_DEC", Decrypt);
    AddCommand("CRYPT_TEST", TestEncryptTemple);
    MemMarkHoly(ModuleAddress("EncryptTemple"), ModuleSize("EncryptTemple"));
};
