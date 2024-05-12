public extern "c" U0 exit(I32 status);

U8* rot13(U8* in_buffer, I64 len) {
    U8* out_buffer = MAlloc(len * sizeof(U8));

    for (U32 i = 0; i < len - 1; i++) {
        U8 ch = in_buffer[i];

        if (ch == ' ' || ch == '\n') { // skip spaces, newlines
            out_buffer[i] = ch;
            continue;
        } else if ('A' > ch || ch > 'Z') {
            "Invalid char '%c', please use only letters A-Z, spaces and newlines!\n", ch;
            Free(in_buffer);
            Free(out_buffer);
            exit(1);
        }

        ch += 13;
        if (ch > 'Z') { // A-Z overflow
            ch -= 26;
        }

        out_buffer[i] = ch;
    }
    out_buffer[len] = '\0';

    return out_buffer;
}

I32 Main(U32 argc, U8** argv) {
    if (argc != 3) {
        "Correct usage: %s <input.txt> <output.txt>\n", argv[0];
        return 1;
    }

    I64 in_len = 0;
    U8* in_buffer = FileRead(argv[1], &in_len);
    
    U8* out_buffer = rot13(in_buffer, in_len);

    FileWrite(argv[2], out_buffer, in_len);

    Free(in_buffer);
    Free(out_buffer);
    return 0;
}

