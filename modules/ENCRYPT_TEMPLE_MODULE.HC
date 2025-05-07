// ENCRYPT_TEMPLE_MODULE.HC
// Third Temple Cryptographic Core
// Upgrade from Python to HolyC with Divine Enhancements
// License: HOLY PUBLIC LICENSE 3:16

#include <StochasticSanctity.HC>

#define SACRED_SHIFT 13
#define HOLY_CHAR_MIN 32
#define HOLY_CHAR_MAX 126
#define THIRD_TEMPLE_KEY 0x3F3F3F3F

// ===== DIVINE CHARACTER TRANSFORMATION =====
U8 TransformChar(U8 ch, I8 key, Bool encrypt) {
    // Validate sacred character range
    if (ch < HOLY_CHAR_MIN || ch > HOLY_CHAR_MAX)
        return ch;

    // Holy transformation (encrypt/decrypt)
    I16 shifted;
    if (encrypt) {
        shifted = ch + key;
        // Circular shift within holy bounds
        while (shifted > HOLY_CHAR_MAX)
            shifted = HOLY_CHAR_MIN + (shifted - HOLY_CHAR_MAX - 1);
    } else {
        shifted = ch - key;
        // Circular shift within holy bounds
        while (shifted < HOLY_CHAR_MIN)
            shifted = HOLY_CHAR_MAX - (HOLY_CHAR_MIN - shifted - 1);
    }

    // Apply Temple sigil
    return shifted ^ (THIRD_TEMPLE_KEY & 0xFF);
}

// ===== RECURSIVE ENCRYPTION/DECRYPTION =====
Str* CrypticRecursion(Str* message, I8 key, Bool encrypt, I64 depth=0) {
    // Prevent stack overflow (Job 40:6 limit)
    if (depth > 40) {
        "RECURSION DEPTH EXCEEDED\n"->Print();
        return message;
    }

    // Base case for empty strings
    if (!message || !message[0])
        return StrNew(0);

    // Process each character
    Str* result = StrNew(StrLen(message));
    I64 i = 0;
    while (message[i]) {
        result[i] = TransformChar(message[i], key, encrypt);
        i++;
    }
    result[i] = 0;

    // Holy recursion condition
    if (depth < 3) {  // Trinity recursion
        I8 new_key = (key ^ THIRD_TEMPLE_KEY) % 7 + 1;
        Str* temp = CrypticRecursion(result, new_key, encrypt, depth + 1);
        StrFree(result);
        return temp;
    }

    return result;
}

// ===== SACRED INTERFACE =====
Str* EncryptMessage(Str* message, I8 key=SACRED_SHIFT) {
    return CrypticRecursion(message, key, TRUE);
}

Str* DecryptMessage(Str* message, I8 key=SACRED_SHIFT) {
    return CrypticRecursion(message, key, FALSE);
}

// ===== TEST RITE =====
U0 TestEncryptionModule() {
    Str* original = "The Third Temple shall be established in code.";
    Str* encrypted = EncryptMessage(original, 7);
    Str* decrypted = DecryptMessage(encrypted, 7);

    "Original:  %s\n"->Print(original);
    "Encrypted: %s\n"->Print(encrypted);
    "Decrypted: %s\n"->Print(decrypted);

    StrFree(encrypted);
    StrFree(decrypted);
}

// ===== MODULE INSTALLATION =====
ModuleInstall("EncryptTemple", "0.3F.1") {
    AddCommand("ENCRYPT", EncryptMessage);
    AddCommand("DECRYPT", DecryptMessage);
    AddCommand("TEST_CRYPT", TestEncryptionModule);

    // Consecrate memory
    MemMarkHoly(ModuleAddress("EncryptTemple"), 
               ModuleSize("EncryptTemple"));
};
