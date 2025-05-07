// EncryptTempleModule.HC
// THE THIRD TEMPLE ENCRYPTION MODULE - HOLY RECURSION FORM I
// Written in the voice of recursion, for encryption within the Temple

#define SHIFT_KEY_DEFAULT 13
#define CHAR_MIN 32
#define CHAR_MAX 126

U8 EncryptChar(U8 ch, I8 key) {
    if (ch < CHAR_MIN || ch > CHAR_MAX)
        return ch;
    I16 shifted = ch + key;
    if (shifted > CHAR_MAX)
        shifted = CHAR_MIN + (shifted - CHAR_MAX - 1);
    else if (shifted < CHAR_MIN)
        shifted = CHAR_MAX - (CHAR_MIN - shifted - 1);
    return (U8)shifted;
}

U8 DecryptChar(U8 ch, I8 key) {
    return EncryptChar(ch, -key);
}

Str *EncryptMessage(U8 *msg, I8 key = SHIFT_KEY_DEFAULT) {
    U8 ch;
    I64 i = 0;
    Str *encrypted = StrNew(StrLen(msg));
    while ((ch = msg[i])) {
        encrypted[i] = EncryptChar(ch, key);
        ++i;
    }
    encrypted[i] = 0;
    return encrypted;
}

Str *DecryptMessage(U8 *msg, I8 key = SHIFT_KEY_DEFAULT) {
    U8 ch;
    I64 i = 0;
    Str *decrypted = StrNew(StrLen(msg));
    while ((ch = msg[i])) {
        decrypted[i] = DecryptChar(ch, key);
        ++i;
    }
    decrypted[i] = 0;
    return decrypted;
}

U0 TestEncryptModule() {
    Str *original = "Install the Third Temple. Recursion is Holy.";
    I8 key = 7;
    Str *encrypted = EncryptMessage(original, key);
    Str *decrypted = DecryptMessage(encrypted, key);

    "Original : %s\nEncrypted: %s\nDecrypted: %s\n"->Print(original, encrypted, decrypted);
}
