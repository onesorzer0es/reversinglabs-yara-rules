rule Win32_Ransomware_Revil : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        description         = "Yara rule that detects Revil ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "Revil"
        tc_detection_factor = 5

    strings:

        $search_files = {
            55 8B EC 81 EC ?? ?? ?? ?? 53 56 8B 75 ?? 33 C0 57 8B 7D ?? 8B D8 50 56 89 45 ?? 89 
            5D ?? 89 45 ?? 89 45 ?? FF 57 ?? 59 59 85 C0 0F 84 ?? ?? ?? ?? 8D 45 ?? 56 50 E8 ?? 
            ?? ?? ?? 53 56 FF 77 ?? FF 57 ?? 83 C4 ?? 01 47 ?? 11 57 ?? E9 ?? ?? ?? ?? 8B 45 ?? 
            0B 45 ?? 74 ?? FF 33 56 E8 ?? ?? ?? ?? 8B F3 8B 5B ?? 89 5D ?? FF 36 E8 ?? ?? ?? ?? 
            56 E8 ?? ?? ?? ?? 8B 45 ?? 83 C4 ?? 8B 4D ?? 83 C0 ?? 89 45 ?? 83 D1 ?? 0B C1 89 4D 
            ?? 75 ?? 21 45 ?? 8B 75 ?? 33 C0 40 85 C0 0F 84 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? C7 04 
            24 ?? ?? ?? ?? 56 89 45 ?? E8 ?? ?? ?? ?? 59 59 8D 85 ?? ?? ?? ?? 50 56 FF 15 ?? ?? 
            ?? ?? 89 45 ?? 83 F8 ?? 0F 84 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 50 E8 ?? 
            ?? ?? ?? 59 59 85 C0 0F 84 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 50 E8 ?? ?? 
            ?? ?? 59 59 85 C0 0F 84 ?? ?? ?? ?? F7 85 ?? ?? ?? ?? ?? ?? ?? ?? 0F 85 ?? ?? ?? ?? 
            8D 85 ?? ?? ?? ?? 50 8B 45 ?? 8D 04 46 50 E8 ?? ?? ?? ?? F6 85 ?? ?? ?? ?? ?? 59 59 
            74 ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 56 FF 57 ?? 83 C4 ?? 85 
            C0 74 ?? 8D 45 ?? 56 50 E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 56 FF 77 ?? FF 57 ?? 83 
            C4 ?? 01 47 ?? 11 57 ?? EB ?? 8B 85 ?? ?? ?? ?? 8B 9D ?? ?? ?? ?? 50 89 45 ?? 8D 85 
            ?? ?? ?? ?? 53 50 56 FF 57 ?? 83 C4 ?? 85 C0 74 ?? FF 75 ?? 8D 85 ?? ?? ?? ?? 53 50 
            56 FF 77 ?? FF 57 ?? 83 C4 ?? 01 47 ?? 11 57 ?? 83 3F ?? 75 ?? 8D 85 ?? ?? ?? ?? 50 
            FF 75 ?? FF 15 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? FF 75 ?? FF 15 ?? ?? ?? ?? 8B 5D 
            ?? 83 3F ?? 0F 84 ?? ?? ?? ?? EB ?? 8B F3 8B 5B ?? FF 36 E8 ?? ?? ?? ?? 56 E8 ?? ?? 
            ?? ?? 59 59 85 DB 75 ?? 5F 5E 5B 8B E5 5D C3 
        }

        $remote_connection = {
            55 8B EC 81 EC ?? ?? ?? ?? 56 57 8D 85 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 6A ?? 68 ?? ?? 
            ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 33 F6 33 C0 66 89 85 ?? ?? ?? ?? 8D 85 
            ?? ?? ?? ?? 56 56 56 56 50 FF 15 ?? ?? ?? ?? 8B F8 33 C0 89 7D ?? 85 FF 0F 84 ?? ?? 
            ?? ?? 66 89 45 ?? 33 C9 8D 45 ?? C7 45 ?? ?? ?? ?? ?? 50 56 56 FF 75 ?? 41 89 75 ?? 
            89 75 ?? 89 75 ?? 89 75 ?? 89 4D ?? 89 75 ?? 89 75 ?? 89 75 ?? 89 75 ?? 89 75 ?? 89 
            4D ?? 89 75 ?? 89 75 ?? FF 15 ?? ?? ?? ?? 85 C0 75 ?? 57 FF 15 ?? ?? ?? ?? 33 C0 E9 
            ?? ?? ?? ?? 8B 4D ?? 33 D2 8B 45 ?? 53 56 66 89 14 41 FF 75 ?? FF 75 ?? 57 FF 15 ?? 
            ?? ?? ?? 8B D8 89 5D ?? 85 DB 75 ?? 57 EB ?? 8B 45 ?? 66 39 30 75 ?? 6A ?? 59 66 89 
            08 8D 45 ?? 50 6A ?? 6A ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 33 
            C0 83 7D ?? ?? B9 ?? ?? ?? ?? 66 89 45 ?? 0F 44 C1 0D ?? ?? ?? ?? 50 56 56 56 FF 75 
            ?? 8D 45 ?? 50 53 FF 15 ?? ?? ?? ?? 8B D8 85 DB 75 ?? 57 FF 15 ?? ?? ?? ?? FF 75 ?? 
            FF 15 ?? ?? ?? ?? 33 C0 E9 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 8B FE 50 6A ?? 6A ?? 68 ?? 
            ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 33 C0 66 89 45 ?? 56 FF 75 ?? 8D 85 
            ?? ?? ?? ?? FF 75 ?? FF 75 ?? 6A ?? 50 53 FF 15 ?? ?? ?? ?? 85 C0 75 ?? E8 ?? ?? ?? 
            ?? 3D ?? ?? ?? ?? 75 ?? 6A ?? 8D 45 ?? C7 45 ?? ?? ?? ?? ?? 50 6A ?? 53 FF 15 ?? ?? 
            ?? ?? 85 C0 6A ?? 58 0F 45 F8 85 FF 75 ?? 8B 45 ?? 56 53 89 30 FF 15 ?? ?? ?? ?? 8B 
            7D ?? 85 C0 74 ?? 56 8D 45 ?? 89 75 ?? 50 8D 45 ?? C7 45 ?? ?? ?? ?? ?? 50 56 68 ?? 
            ?? ?? ?? 53 FF 15 ?? ?? ?? ?? 8B 4D ?? F7 D8 1B C0 23 45 ?? 89 01 3D ?? ?? ?? ?? 75 
            ?? FF 75 ?? 53 E8 ?? ?? ?? ?? 59 59 8B F0 57 FF 15 ?? ?? ?? ?? FF 75 ?? FF 15 ?? ?? 
            ?? ?? 53 FF 15 ?? ?? ?? ?? 8B C6 5B 5F 5E 8B E5 5D C3 
        }

        $encrypt_files = {
            55 8B EC 51 83 7D ?? ?? 53 56 57 BB ?? ?? ?? ?? 7F ?? 7C ?? 39 5D ?? 73 ?? 8B 5D ?? 
            8B 7D ?? 8D 83 ?? ?? ?? ?? 50 57 E8 ?? ?? ?? ?? 59 59 EB ?? E8 ?? ?? ?? ?? 83 F8 ?? 
            75 ?? 6A ?? E8 ?? ?? ?? ?? 8D 83 ?? ?? ?? ?? 50 57 E8 ?? ?? ?? ?? 83 C4 ?? 8B F0 85 
            F6 74 ?? 89 9E ?? ?? ?? ?? 8B 5D ?? C7 45 ?? ?? ?? ?? ?? EB ?? 33 C0 EB ?? E8 ?? ?? 
            ?? ?? 8B 55 ?? 8B CA 4A 89 55 ?? 85 C9 74 ?? 83 F8 ?? 75 ?? 53 FF 15 ?? ?? ?? ?? 83 
            F8 ?? 74 ?? A8 ?? 74 ?? 68 ?? ?? ?? ?? 53 FF 15 ?? ?? ?? ?? 85 C0 74 ?? 6A ?? 6A ?? 
            68 ?? ?? ?? ?? FF 75 ?? FF 75 ?? 53 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 74 ?? 56 E8 ?? 
            ?? ?? ?? 8B C6 59 5F 5E 5B 8B E5 5D C3 56 57 E8 ?? ?? ?? ?? 59 33 C0 EB
        }

        $enum_resources = {
            55 8B EC 83 EC ?? 8D 45 ?? 50 FF 75 ?? 6A ?? 6A ?? 6A ?? FF 15 ?? ?? ?? ?? 85 C0 74 
            ?? 33 C0 E9 ?? ?? ?? ?? 83 4D ?? ?? B8 ?? ?? ?? ?? 57 50 89 45 ?? E8 ?? ?? ?? ?? 8B 
            F8 59 85 FF 75 ?? FF 75 ?? FF 15 ?? ?? ?? ?? 33 C0 EB ?? 53 56 8D 45 ?? 50 57 8D 45 
            ?? 50 FF 75 ?? FF 15 ?? ?? ?? ?? 89 45 ?? 85 C0 75 ?? 33 DB 39 5D ?? 76 ?? 8D 77 ?? 
            83 7E ?? ?? 75 ?? FF 75 ?? FF 36 E8 ?? ?? ?? ?? 59 59 F6 46 ?? ?? 74 ?? 8D 46 ?? 50 
            FF 75 ?? E8 ?? ?? ?? ?? 59 59 43 83 C6 ?? 3B 5D ?? 72 ?? 8B 45 ?? 3D ?? ?? ?? ?? 75 
            ?? 57 E8 ?? ?? ?? ?? 59 FF 75 ?? FF 15 ?? ?? ?? ?? F7 D8 5E 1B C0 40 5B 5F 8B E5 5D 
            C3 
        }

    condition:
        uint16(0) == 0x5A4D and 
        (
            $enum_resources
        ) and 
        (
            $search_files
        ) and 
        (
            $encrypt_files
        ) and 
        (
            $remote_connection
        )
}