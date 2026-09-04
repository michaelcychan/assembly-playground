# Assembly Exploration

I explore the Assembly language on WSL2/Ubuntu

## Tools

 | Tool      | Purpose                                    |
 |-----------|--------------------------------------------|
 | `nasm`    | Assemble `.asm` to object file             |
 | `ld`      | link object file to executable             |
 | `gdb`     | debugging                                  |
 | `objdump` | inspect / disassemble the resulting binary |
 | `strace`  | see linux system calls                     |

```sh
sudo apt install nasm binutils gdb strace
```

## Compile and Run

```sh
./compile-and-run <filename-without-extension>
```