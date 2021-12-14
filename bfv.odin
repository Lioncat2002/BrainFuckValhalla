package bfv

import "core:fmt"
import "core:os"

main :: proc() {
    a:[3000]u8 //Setting memory
    b:u8=0
    loop:int=0
    input,err:=os.read_entire_file(os.args[1])
    res:string=string(input)  //"+[----->+++<]>+.+."
    for i:=0;i<len(res);i+=1{
       current_char:=res[i]
       
        if current_char=='+' {
            a[b]+=1
            
        }
        else if current_char=='-'{
            a[b]-=1
        }
        else if current_char=='>'{
            b+=1
        }
        else if current_char=='<'{
            b-=1
        }
        else if current_char==','{
            buf: [1024]byte
            num_read,err := os.read(os.stdin, buf[:])
            s := string(buf[:num_read])
            a[b]=s[0]
        }
        else if current_char=='.'{
            fmt.print(rune(a[b]))

        }
        else if current_char=='['{
            continue 
        }
        else if current_char==']' && a[b]!=0{
            loop=1
            for loop>0{
                i-=1
                current_char=res[i]

                if current_char=='['{
                    loop-=1

                }
                else if current_char==']'{
                    loop+=1
                }
            }
        }

    }

    
}