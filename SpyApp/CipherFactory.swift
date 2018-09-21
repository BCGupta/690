import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Alpha": AlphaNumericCeaserCipher(),
        "Morse": MorseCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
