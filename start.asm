format PE64 ; формат компиляции

entry start ;Старт программы

include 'win64w.inc' ; Подключаемая библиотека FASM


section '.data' data readable writeable ; секции данныъ

        hello db 'hello world!',0 ; define byte выделить памяти

section '.code' code readable writeable executable ;секция кода

start: ; метка старта
        invoke printf, hello ; вызывает функцтю printf
  
  invoke getch ; делает прерывания консоли чтобы не закрылась
  
  invoke ExitProcess, 0 ; завершение программы

section '.idata' data import readable ; секция импорта
        library kernel, 'kernel32.dll',\ ;
                msvcrt, 'msvcrt.dll'
  
  import kernel,\
                                ExitProcess, 'ExitProcess'
          
  import msvcrt,\
                                printf, 'printf',\
          getch, '_getch'