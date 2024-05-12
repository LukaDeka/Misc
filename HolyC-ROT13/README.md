# ROT13 Encoder/Decoder

This is a simple ROT13 encoder/decoder written in HolyC, made by by Terry A. Davis.

## Usage

1. Compile the HolyC program using the [HolyC compiler](https://holyc-lang.com/install.html).
2. Run the compiled executable like so: `./a.out <input.txt> <output.txt>`

## Example
`input.txt`:
```
GUVF VF N FRPERG ZRFFNTR GUNG JVYY OR QRPBQRQ HFVAT EBG GUVEGRRA
```
compilation and execution:
```bash
$ hcc rot13.HC && ./a.out input.txt output.txt
```
`output.txt`:
```
THIS IS A SECRET MESSAGE THAT WILL BE DECODED USING ROT THIRTEEN
```
