format PE64 ; ������ ����������

entry start ;����� ���������

include 'win64w.inc' ; ������������ ���������� FASM


section '.data' data readable writeable ; ������ ������

        hello db 'hello world!',0 ; define byte �������� ������

section '.code' code readable writeable executable ;������ ����

start: ; ����� ������
        invoke printf, hello ; �������� ������� printf
  
  invoke getch ; ������ ���������� ������� ����� �� ���������
  
  invoke ExitProcess, 0 ; ���������� ���������

section '.idata' data import readable ; ������ �������
        library kernel, 'kernel32.dll',\ ;
                msvcrt, 'msvcrt.dll'
  
  import kernel,\
                                ExitProcess, 'ExitProcess'
          
  import msvcrt,\
                                printf, 'printf',\
          getch, '_getch'