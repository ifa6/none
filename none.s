
out/bin/none:     file format elf32-i386


Disassembly of section .text:

00305000 <_start>:
  305000:	eb 0e                	jmp    305010 <start>
  305002:	66 90                	xchg   %ax,%ax

00305004 <multiboot_header>:
  305004:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  30500a:	00 00                	add    %al,(%eax)
  30500c:	fb                   	sti    
  30500d:	4f                   	dec    %edi
  30500e:	52                   	push   %edx
  30500f:	e4 fa                	in     $0xfa,%al

00305010 <start>:
  305010:	fa                   	cli    
  305011:	89 1d 00 20 31 00    	mov    %ebx,0x312000
  305017:	0f 20 c0             	mov    %cr0,%eax
  30501a:	83 c8 20             	or     $0x20,%eax
  30501d:	0f 22 c0             	mov    %eax,%cr0
  305020:	bf 00 09 20 00       	mov    $0x200900,%edi
  305025:	be 10 20 31 00       	mov    $0x312010,%esi
  30502a:	b9 40 00 00 00       	mov    $0x40,%ecx
  30502f:	c1 e9 02             	shr    $0x2,%ecx
  305032:	fc                   	cld    
  305033:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  305035:	0f 01 15 04 20 31 00 	lgdtl  0x312004
  30503c:	0f 01 1d 0a 20 31 00 	lidtl  0x31200a
  305043:	ea 4a 50 30 00 08 00 	ljmp   $0x8,$0x30504a

0030504a <new_env>:
  30504a:	b8 10 00 00 00       	mov    $0x10,%eax
  30504f:	8e d8                	mov    %eax,%ds
  305051:	8e c0                	mov    %eax,%es
  305053:	8e d0                	mov    %eax,%ss
  305055:	8e e0                	mov    %eax,%fs
  305057:	8e e8                	mov    %eax,%gs
  305059:	bc f0 ff 3f 00       	mov    $0x3ffff0,%esp
  30505e:	e8 35 2a 00 00       	call   307a98 <main>
  305063:	fb                   	sti    
  305064:	eb fe                	jmp    305064 <new_env+0x1a>
  305066:	66 90                	xchg   %ax,%ax

00305068 <divide_error>:
  305068:	6a 00                	push   $0x0
  30506a:	68 3c 59 30 00       	push   $0x30593c

0030506f <error_code>:
  30506f:	87 44 24 04          	xchg   %eax,0x4(%esp)
  305073:	87 0c 24             	xchg   %ecx,(%esp)
  305076:	52                   	push   %edx
  305077:	53                   	push   %ebx
  305078:	55                   	push   %ebp
  305079:	56                   	push   %esi
  30507a:	57                   	push   %edi
  30507b:	06                   	push   %es
  30507c:	1e                   	push   %ds
  30507d:	0f a0                	push   %fs
  30507f:	0f a8                	push   %gs
  305081:	54                   	push   %esp
  305082:	50                   	push   %eax
  305083:	b8 10 00 00 00       	mov    $0x10,%eax
  305088:	8e d8                	mov    %eax,%ds
  30508a:	8e c0                	mov    %eax,%es
  30508c:	8e e0                	mov    %eax,%fs
  30508e:	ff d1                	call   *%ecx
  305090:	83 c4 08             	add    $0x8,%esp
  305093:	0f a9                	pop    %gs
  305095:	0f a1                	pop    %fs
  305097:	1f                   	pop    %ds
  305098:	07                   	pop    %es
  305099:	5f                   	pop    %edi
  30509a:	5e                   	pop    %esi
  30509b:	5d                   	pop    %ebp
  30509c:	5b                   	pop    %ebx
  30509d:	5a                   	pop    %edx
  30509e:	59                   	pop    %ecx
  30509f:	58                   	pop    %eax
  3050a0:	cf                   	iret   

003050a1 <single_step_exception>:
  3050a1:	6a 00                	push   $0x0
  3050a3:	68 5a 59 30 00       	push   $0x30595a
  3050a8:	eb c5                	jmp    30506f <error_code>

003050aa <nmi>:
  3050aa:	6a 00                	push   $0x0
  3050ac:	68 88 59 30 00       	push   $0x305988
  3050b1:	eb bc                	jmp    30506f <error_code>

003050b3 <breakpoint_exception>:
  3050b3:	6a 00                	push   $0x0
  3050b5:	68 a6 59 30 00       	push   $0x3059a6
  3050ba:	eb b3                	jmp    30506f <error_code>

003050bc <overflow>:
  3050bc:	6a 00                	push   $0x0
  3050be:	68 d4 59 30 00       	push   $0x3059d4
  3050c3:	eb aa                	jmp    30506f <error_code>

003050c5 <bounds_check>:
  3050c5:	6a 00                	push   $0x0
  3050c7:	68 f2 59 30 00       	push   $0x3059f2
  3050cc:	eb a1                	jmp    30506f <error_code>

003050ce <inval_opcode>:
  3050ce:	6a 00                	push   $0x0
  3050d0:	68 10 5a 30 00       	push   $0x305a10
  3050d5:	eb 98                	jmp    30506f <error_code>

003050d7 <copr_not_available>:
  3050d7:	6a 00                	push   $0x0
  3050d9:	68 2e 5a 30 00       	push   $0x305a2e
  3050de:	eb 8f                	jmp    30506f <error_code>

003050e0 <double_fault>:
  3050e0:	68 4c 5a 30 00       	push   $0x305a4c
  3050e5:	eb 88                	jmp    30506f <error_code>

003050e7 <copr_seg_overrun>:
  3050e7:	6a 00                	push   $0x0
  3050e9:	68 6a 5a 30 00       	push   $0x305a6a
  3050ee:	e9 7c ff ff ff       	jmp    30506f <error_code>

003050f3 <inval_tss>:
  3050f3:	68 88 5a 30 00       	push   $0x305a88
  3050f8:	e9 72 ff ff ff       	jmp    30506f <error_code>

003050fd <segment_not_present>:
  3050fd:	68 a6 5a 30 00       	push   $0x305aa6
  305102:	e9 68 ff ff ff       	jmp    30506f <error_code>

00305107 <stack_exception>:
  305107:	68 c4 5a 30 00       	push   $0x305ac4
  30510c:	e9 5e ff ff ff       	jmp    30506f <error_code>

00305111 <general_protection>:
  305111:	68 e2 5a 30 00       	push   $0x305ae2
  305116:	e9 54 ff ff ff       	jmp    30506f <error_code>

0030511b <page_fault>:
  30511b:	68 00 5b 30 00       	push   $0x305b00
  305120:	e9 4a ff ff ff       	jmp    30506f <error_code>

00305125 <copr_error>:
  305125:	6a 00                	push   $0x0
  305127:	68 75 5b 30 00       	push   $0x305b75
  30512c:	e9 3e ff ff ff       	jmp    30506f <error_code>

00305131 <none>:
  305131:	6a 00                	push   $0x0
  305133:	68 93 5b 30 00       	push   $0x305b93
  305138:	e9 32 ff ff ff       	jmp    30506f <error_code>

0030513d <switch_task>:
  30513d:	60                   	pusha  
  30513e:	06                   	push   %es
  30513f:	1e                   	push   %ds
  305140:	0f a0                	push   %fs
  305142:	0f a8                	push   %gs
  305144:	b8 10 00 00 00       	mov    $0x10,%eax
  305149:	8e d8                	mov    %eax,%ds
  30514b:	8e c0                	mov    %eax,%es
  30514d:	8e e0                	mov    %eax,%fs
  30514f:	8e e8                	mov    %eax,%gs
  305151:	8b 1d 04 26 31 00    	mov    0x312604,%ebx
  305157:	89 a3 b0 00 00 00    	mov    %esp,0xb0(%ebx)
  30515d:	e8 a2 14 00 00       	call   306604 <sched>
  305162:	8b a3 b0 00 00 00    	mov    0xb0(%ebx),%esp
  305168:	8b 83 b4 00 00 00    	mov    0xb4(%ebx),%eax
  30516e:	0f 22 d8             	mov    %eax,%cr3
  305171:	0f a9                	pop    %gs
  305173:	0f a1                	pop    %fs
  305175:	1f                   	pop    %ds
  305176:	07                   	pop    %es
  305177:	61                   	popa   
  305178:	cf                   	iret   

00305179 <hwint00>:
  305179:	60                   	pusha  
  30517a:	06                   	push   %es
  30517b:	1e                   	push   %ds
  30517c:	0f a0                	push   %fs
  30517e:	0f a8                	push   %gs
  305180:	b8 10 00 00 00       	mov    $0x10,%eax
  305185:	8e d8                	mov    %eax,%ds
  305187:	8e c0                	mov    %eax,%es
  305189:	8e e0                	mov    %eax,%fs
  30518b:	8e e8                	mov    %eax,%gs
  30518d:	e4 21                	in     $0x21,%al
  30518f:	0a 05 01 00 00 00    	or     0x1,%al
  305195:	e6 21                	out    %al,$0x21
  305197:	b0 20                	mov    $0x20,%al
  305199:	e6 20                	out    %al,$0x20
  30519b:	ff 05 40 26 31 00    	incl   0x312640
  3051a1:	6a 00                	push   $0x0
  3051a3:	b8 00 00 00 00       	mov    $0x0,%eax
  3051a8:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  3051af:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  3051b6:	83 c4 08             	add    $0x8,%esp
  3051b9:	8b 1d 04 26 31 00    	mov    0x312604,%ebx
  3051bf:	89 a3 b0 00 00 00    	mov    %esp,0xb0(%ebx)
  3051c5:	e8 3a 14 00 00       	call   306604 <sched>
  3051ca:	8b a3 b0 00 00 00    	mov    0xb0(%ebx),%esp
  3051d0:	8b 83 b4 00 00 00    	mov    0xb4(%ebx),%eax
  3051d6:	0f 22 d8             	mov    %eax,%cr3
  3051d9:	e4 21                	in     $0x21,%al
  3051db:	24 fe                	and    $0xfe,%al
  3051dd:	e6 21                	out    %al,$0x21
  3051df:	0f a9                	pop    %gs
  3051e1:	0f a1                	pop    %fs
  3051e3:	1f                   	pop    %ds
  3051e4:	07                   	pop    %es
  3051e5:	61                   	popa   
  3051e6:	cf                   	iret   

003051e7 <hwint01>:
  3051e7:	60                   	pusha  
  3051e8:	06                   	push   %es
  3051e9:	1e                   	push   %ds
  3051ea:	0f a0                	push   %fs
  3051ec:	0f a8                	push   %gs
  3051ee:	b8 10 00 00 00       	mov    $0x10,%eax
  3051f3:	8e d8                	mov    %eax,%ds
  3051f5:	8e c0                	mov    %eax,%es
  3051f7:	8e e0                	mov    %eax,%fs
  3051f9:	8e e8                	mov    %eax,%gs
  3051fb:	e4 21                	in     $0x21,%al
  3051fd:	0c 02                	or     $0x2,%al
  3051ff:	e6 21                	out    %al,$0x21
  305201:	b0 20                	mov    $0x20,%al
  305203:	e6 20                	out    %al,$0x20
  305205:	b8 01 00 00 00       	mov    $0x1,%eax
  30520a:	fb                   	sti    
  30520b:	6a 01                	push   $0x1
  30520d:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  305214:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  30521b:	83 c4 08             	add    $0x8,%esp
  30521e:	fa                   	cli    
  30521f:	e4 21                	in     $0x21,%al
  305221:	24 fd                	and    $0xfd,%al
  305223:	e6 21                	out    %al,$0x21
  305225:	0f a9                	pop    %gs
  305227:	0f a1                	pop    %fs
  305229:	1f                   	pop    %ds
  30522a:	07                   	pop    %es
  30522b:	61                   	popa   
  30522c:	cf                   	iret   

0030522d <hwint02>:
  30522d:	60                   	pusha  
  30522e:	06                   	push   %es
  30522f:	1e                   	push   %ds
  305230:	0f a0                	push   %fs
  305232:	0f a8                	push   %gs
  305234:	b8 10 00 00 00       	mov    $0x10,%eax
  305239:	8e d8                	mov    %eax,%ds
  30523b:	8e c0                	mov    %eax,%es
  30523d:	8e e0                	mov    %eax,%fs
  30523f:	8e e8                	mov    %eax,%gs
  305241:	e4 21                	in     $0x21,%al
  305243:	0c 04                	or     $0x4,%al
  305245:	e6 21                	out    %al,$0x21
  305247:	b0 20                	mov    $0x20,%al
  305249:	e6 20                	out    %al,$0x20
  30524b:	b8 02 00 00 00       	mov    $0x2,%eax
  305250:	fb                   	sti    
  305251:	6a 02                	push   $0x2
  305253:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  30525a:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  305261:	83 c4 08             	add    $0x8,%esp
  305264:	fa                   	cli    
  305265:	e4 21                	in     $0x21,%al
  305267:	24 fb                	and    $0xfb,%al
  305269:	e6 21                	out    %al,$0x21
  30526b:	0f a9                	pop    %gs
  30526d:	0f a1                	pop    %fs
  30526f:	1f                   	pop    %ds
  305270:	07                   	pop    %es
  305271:	61                   	popa   
  305272:	cf                   	iret   

00305273 <hwint03>:
  305273:	60                   	pusha  
  305274:	06                   	push   %es
  305275:	1e                   	push   %ds
  305276:	0f a0                	push   %fs
  305278:	0f a8                	push   %gs
  30527a:	b8 10 00 00 00       	mov    $0x10,%eax
  30527f:	8e d8                	mov    %eax,%ds
  305281:	8e c0                	mov    %eax,%es
  305283:	8e e0                	mov    %eax,%fs
  305285:	8e e8                	mov    %eax,%gs
  305287:	e4 21                	in     $0x21,%al
  305289:	0c 08                	or     $0x8,%al
  30528b:	e6 21                	out    %al,$0x21
  30528d:	b0 20                	mov    $0x20,%al
  30528f:	e6 20                	out    %al,$0x20
  305291:	b8 03 00 00 00       	mov    $0x3,%eax
  305296:	fb                   	sti    
  305297:	6a 03                	push   $0x3
  305299:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  3052a0:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  3052a7:	83 c4 08             	add    $0x8,%esp
  3052aa:	fa                   	cli    
  3052ab:	e4 21                	in     $0x21,%al
  3052ad:	24 f7                	and    $0xf7,%al
  3052af:	e6 21                	out    %al,$0x21
  3052b1:	0f a9                	pop    %gs
  3052b3:	0f a1                	pop    %fs
  3052b5:	1f                   	pop    %ds
  3052b6:	07                   	pop    %es
  3052b7:	61                   	popa   
  3052b8:	cf                   	iret   

003052b9 <hwint04>:
  3052b9:	60                   	pusha  
  3052ba:	06                   	push   %es
  3052bb:	1e                   	push   %ds
  3052bc:	0f a0                	push   %fs
  3052be:	0f a8                	push   %gs
  3052c0:	b8 10 00 00 00       	mov    $0x10,%eax
  3052c5:	8e d8                	mov    %eax,%ds
  3052c7:	8e c0                	mov    %eax,%es
  3052c9:	8e e0                	mov    %eax,%fs
  3052cb:	8e e8                	mov    %eax,%gs
  3052cd:	e4 21                	in     $0x21,%al
  3052cf:	0c 10                	or     $0x10,%al
  3052d1:	e6 21                	out    %al,$0x21
  3052d3:	b0 20                	mov    $0x20,%al
  3052d5:	e6 20                	out    %al,$0x20
  3052d7:	b8 04 00 00 00       	mov    $0x4,%eax
  3052dc:	fb                   	sti    
  3052dd:	6a 04                	push   $0x4
  3052df:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  3052e6:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  3052ed:	83 c4 08             	add    $0x8,%esp
  3052f0:	fa                   	cli    
  3052f1:	e4 21                	in     $0x21,%al
  3052f3:	24 ef                	and    $0xef,%al
  3052f5:	e6 21                	out    %al,$0x21
  3052f7:	0f a9                	pop    %gs
  3052f9:	0f a1                	pop    %fs
  3052fb:	1f                   	pop    %ds
  3052fc:	07                   	pop    %es
  3052fd:	61                   	popa   
  3052fe:	cf                   	iret   

003052ff <hwint05>:
  3052ff:	60                   	pusha  
  305300:	06                   	push   %es
  305301:	1e                   	push   %ds
  305302:	0f a0                	push   %fs
  305304:	0f a8                	push   %gs
  305306:	b8 10 00 00 00       	mov    $0x10,%eax
  30530b:	8e d8                	mov    %eax,%ds
  30530d:	8e c0                	mov    %eax,%es
  30530f:	8e e0                	mov    %eax,%fs
  305311:	8e e8                	mov    %eax,%gs
  305313:	e4 21                	in     $0x21,%al
  305315:	0c 20                	or     $0x20,%al
  305317:	e6 21                	out    %al,$0x21
  305319:	b0 20                	mov    $0x20,%al
  30531b:	e6 20                	out    %al,$0x20
  30531d:	b8 05 00 00 00       	mov    $0x5,%eax
  305322:	fb                   	sti    
  305323:	6a 05                	push   $0x5
  305325:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  30532c:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  305333:	83 c4 08             	add    $0x8,%esp
  305336:	fa                   	cli    
  305337:	e4 21                	in     $0x21,%al
  305339:	24 df                	and    $0xdf,%al
  30533b:	e6 21                	out    %al,$0x21
  30533d:	0f a9                	pop    %gs
  30533f:	0f a1                	pop    %fs
  305341:	1f                   	pop    %ds
  305342:	07                   	pop    %es
  305343:	61                   	popa   
  305344:	cf                   	iret   

00305345 <hwint06>:
  305345:	60                   	pusha  
  305346:	06                   	push   %es
  305347:	1e                   	push   %ds
  305348:	0f a0                	push   %fs
  30534a:	0f a8                	push   %gs
  30534c:	b8 10 00 00 00       	mov    $0x10,%eax
  305351:	8e d8                	mov    %eax,%ds
  305353:	8e c0                	mov    %eax,%es
  305355:	8e e0                	mov    %eax,%fs
  305357:	8e e8                	mov    %eax,%gs
  305359:	e4 21                	in     $0x21,%al
  30535b:	0c 40                	or     $0x40,%al
  30535d:	e6 21                	out    %al,$0x21
  30535f:	b0 20                	mov    $0x20,%al
  305361:	e6 20                	out    %al,$0x20
  305363:	b8 06 00 00 00       	mov    $0x6,%eax
  305368:	fb                   	sti    
  305369:	6a 06                	push   $0x6
  30536b:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  305372:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  305379:	83 c4 08             	add    $0x8,%esp
  30537c:	fa                   	cli    
  30537d:	e4 21                	in     $0x21,%al
  30537f:	24 bf                	and    $0xbf,%al
  305381:	e6 21                	out    %al,$0x21
  305383:	0f a9                	pop    %gs
  305385:	0f a1                	pop    %fs
  305387:	1f                   	pop    %ds
  305388:	07                   	pop    %es
  305389:	61                   	popa   
  30538a:	cf                   	iret   

0030538b <hwint07>:
  30538b:	60                   	pusha  
  30538c:	06                   	push   %es
  30538d:	1e                   	push   %ds
  30538e:	0f a0                	push   %fs
  305390:	0f a8                	push   %gs
  305392:	b8 10 00 00 00       	mov    $0x10,%eax
  305397:	8e d8                	mov    %eax,%ds
  305399:	8e c0                	mov    %eax,%es
  30539b:	8e e0                	mov    %eax,%fs
  30539d:	8e e8                	mov    %eax,%gs
  30539f:	e4 21                	in     $0x21,%al
  3053a1:	0c 80                	or     $0x80,%al
  3053a3:	e6 21                	out    %al,$0x21
  3053a5:	b0 20                	mov    $0x20,%al
  3053a7:	e6 20                	out    %al,$0x20
  3053a9:	b8 07 00 00 00       	mov    $0x7,%eax
  3053ae:	fb                   	sti    
  3053af:	6a 07                	push   $0x7
  3053b1:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  3053b8:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  3053bf:	83 c4 08             	add    $0x8,%esp
  3053c2:	fa                   	cli    
  3053c3:	e4 21                	in     $0x21,%al
  3053c5:	24 7f                	and    $0x7f,%al
  3053c7:	e6 21                	out    %al,$0x21
  3053c9:	0f a9                	pop    %gs
  3053cb:	0f a1                	pop    %fs
  3053cd:	1f                   	pop    %ds
  3053ce:	07                   	pop    %es
  3053cf:	61                   	popa   
  3053d0:	cf                   	iret   

003053d1 <hwint08>:
  3053d1:	60                   	pusha  
  3053d2:	06                   	push   %es
  3053d3:	1e                   	push   %ds
  3053d4:	0f a0                	push   %fs
  3053d6:	0f a8                	push   %gs
  3053d8:	b8 10 00 00 00       	mov    $0x10,%eax
  3053dd:	8e d8                	mov    %eax,%ds
  3053df:	8e c0                	mov    %eax,%es
  3053e1:	8e e0                	mov    %eax,%fs
  3053e3:	8e e8                	mov    %eax,%gs
  3053e5:	e4 a1                	in     $0xa1,%al
  3053e7:	0c 01                	or     $0x1,%al
  3053e9:	e6 a1                	out    %al,$0xa1
  3053eb:	b0 20                	mov    $0x20,%al
  3053ed:	e6 20                	out    %al,$0x20
  3053ef:	eb 00                	jmp    3053f1 <hwint08+0x20>
  3053f1:	e6 a0                	out    %al,$0xa0
  3053f3:	b8 08 00 00 00       	mov    $0x8,%eax
  3053f8:	fb                   	sti    
  3053f9:	6a 08                	push   $0x8
  3053fb:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  305402:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  305409:	83 c4 08             	add    $0x8,%esp
  30540c:	fa                   	cli    
  30540d:	e4 a1                	in     $0xa1,%al
  30540f:	24 fe                	and    $0xfe,%al
  305411:	e6 a1                	out    %al,$0xa1
  305413:	0f a9                	pop    %gs
  305415:	0f a1                	pop    %fs
  305417:	1f                   	pop    %ds
  305418:	07                   	pop    %es
  305419:	61                   	popa   
  30541a:	cf                   	iret   

0030541b <hwint09>:
  30541b:	60                   	pusha  
  30541c:	06                   	push   %es
  30541d:	1e                   	push   %ds
  30541e:	0f a0                	push   %fs
  305420:	0f a8                	push   %gs
  305422:	b8 10 00 00 00       	mov    $0x10,%eax
  305427:	8e d8                	mov    %eax,%ds
  305429:	8e c0                	mov    %eax,%es
  30542b:	8e e0                	mov    %eax,%fs
  30542d:	8e e8                	mov    %eax,%gs
  30542f:	e4 a1                	in     $0xa1,%al
  305431:	0c 02                	or     $0x2,%al
  305433:	e6 a1                	out    %al,$0xa1
  305435:	b0 20                	mov    $0x20,%al
  305437:	e6 20                	out    %al,$0x20
  305439:	eb 00                	jmp    30543b <hwint09+0x20>
  30543b:	e6 a0                	out    %al,$0xa0
  30543d:	b8 09 00 00 00       	mov    $0x9,%eax
  305442:	fb                   	sti    
  305443:	6a 09                	push   $0x9
  305445:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  30544c:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  305453:	83 c4 08             	add    $0x8,%esp
  305456:	fa                   	cli    
  305457:	e4 a1                	in     $0xa1,%al
  305459:	24 fd                	and    $0xfd,%al
  30545b:	e6 a1                	out    %al,$0xa1
  30545d:	0f a9                	pop    %gs
  30545f:	0f a1                	pop    %fs
  305461:	1f                   	pop    %ds
  305462:	07                   	pop    %es
  305463:	61                   	popa   
  305464:	cf                   	iret   

00305465 <hwint10>:
  305465:	60                   	pusha  
  305466:	06                   	push   %es
  305467:	1e                   	push   %ds
  305468:	0f a0                	push   %fs
  30546a:	0f a8                	push   %gs
  30546c:	b8 10 00 00 00       	mov    $0x10,%eax
  305471:	8e d8                	mov    %eax,%ds
  305473:	8e c0                	mov    %eax,%es
  305475:	8e e0                	mov    %eax,%fs
  305477:	8e e8                	mov    %eax,%gs
  305479:	e4 a1                	in     $0xa1,%al
  30547b:	0c 04                	or     $0x4,%al
  30547d:	e6 a1                	out    %al,$0xa1
  30547f:	b0 20                	mov    $0x20,%al
  305481:	e6 20                	out    %al,$0x20
  305483:	eb 00                	jmp    305485 <hwint10+0x20>
  305485:	e6 a0                	out    %al,$0xa0
  305487:	b8 0a 00 00 00       	mov    $0xa,%eax
  30548c:	fb                   	sti    
  30548d:	6a 0a                	push   $0xa
  30548f:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  305496:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  30549d:	83 c4 08             	add    $0x8,%esp
  3054a0:	fa                   	cli    
  3054a1:	e4 a1                	in     $0xa1,%al
  3054a3:	24 fb                	and    $0xfb,%al
  3054a5:	e6 a1                	out    %al,$0xa1
  3054a7:	0f a9                	pop    %gs
  3054a9:	0f a1                	pop    %fs
  3054ab:	1f                   	pop    %ds
  3054ac:	07                   	pop    %es
  3054ad:	61                   	popa   
  3054ae:	cf                   	iret   

003054af <hwint11>:
  3054af:	60                   	pusha  
  3054b0:	06                   	push   %es
  3054b1:	1e                   	push   %ds
  3054b2:	0f a0                	push   %fs
  3054b4:	0f a8                	push   %gs
  3054b6:	b8 10 00 00 00       	mov    $0x10,%eax
  3054bb:	8e d8                	mov    %eax,%ds
  3054bd:	8e c0                	mov    %eax,%es
  3054bf:	8e e0                	mov    %eax,%fs
  3054c1:	8e e8                	mov    %eax,%gs
  3054c3:	e4 a1                	in     $0xa1,%al
  3054c5:	0c 08                	or     $0x8,%al
  3054c7:	e6 a1                	out    %al,$0xa1
  3054c9:	b0 20                	mov    $0x20,%al
  3054cb:	e6 20                	out    %al,$0x20
  3054cd:	eb 00                	jmp    3054cf <hwint11+0x20>
  3054cf:	e6 a0                	out    %al,$0xa0
  3054d1:	b8 0b 00 00 00       	mov    $0xb,%eax
  3054d6:	fb                   	sti    
  3054d7:	6a 0b                	push   $0xb
  3054d9:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  3054e0:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  3054e7:	83 c4 08             	add    $0x8,%esp
  3054ea:	fa                   	cli    
  3054eb:	e4 a1                	in     $0xa1,%al
  3054ed:	24 f7                	and    $0xf7,%al
  3054ef:	e6 a1                	out    %al,$0xa1
  3054f1:	0f a9                	pop    %gs
  3054f3:	0f a1                	pop    %fs
  3054f5:	1f                   	pop    %ds
  3054f6:	07                   	pop    %es
  3054f7:	61                   	popa   
  3054f8:	cf                   	iret   

003054f9 <hwint12>:
  3054f9:	60                   	pusha  
  3054fa:	06                   	push   %es
  3054fb:	1e                   	push   %ds
  3054fc:	0f a0                	push   %fs
  3054fe:	0f a8                	push   %gs
  305500:	b8 10 00 00 00       	mov    $0x10,%eax
  305505:	8e d8                	mov    %eax,%ds
  305507:	8e c0                	mov    %eax,%es
  305509:	8e e0                	mov    %eax,%fs
  30550b:	8e e8                	mov    %eax,%gs
  30550d:	e4 a1                	in     $0xa1,%al
  30550f:	0c 10                	or     $0x10,%al
  305511:	e6 a1                	out    %al,$0xa1
  305513:	b0 20                	mov    $0x20,%al
  305515:	e6 20                	out    %al,$0x20
  305517:	eb 00                	jmp    305519 <hwint12+0x20>
  305519:	e6 a0                	out    %al,$0xa0
  30551b:	b8 0c 00 00 00       	mov    $0xc,%eax
  305520:	fb                   	sti    
  305521:	6a 0c                	push   $0xc
  305523:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  30552a:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  305531:	83 c4 08             	add    $0x8,%esp
  305534:	fa                   	cli    
  305535:	e4 a1                	in     $0xa1,%al
  305537:	24 ef                	and    $0xef,%al
  305539:	e6 a1                	out    %al,$0xa1
  30553b:	0f a9                	pop    %gs
  30553d:	0f a1                	pop    %fs
  30553f:	1f                   	pop    %ds
  305540:	07                   	pop    %es
  305541:	61                   	popa   
  305542:	cf                   	iret   

00305543 <hwint13>:
  305543:	60                   	pusha  
  305544:	06                   	push   %es
  305545:	1e                   	push   %ds
  305546:	0f a0                	push   %fs
  305548:	0f a8                	push   %gs
  30554a:	b8 10 00 00 00       	mov    $0x10,%eax
  30554f:	8e d8                	mov    %eax,%ds
  305551:	8e c0                	mov    %eax,%es
  305553:	8e e0                	mov    %eax,%fs
  305555:	8e e8                	mov    %eax,%gs
  305557:	e4 a1                	in     $0xa1,%al
  305559:	0c 20                	or     $0x20,%al
  30555b:	e6 a1                	out    %al,$0xa1
  30555d:	b0 20                	mov    $0x20,%al
  30555f:	e6 20                	out    %al,$0x20
  305561:	eb 00                	jmp    305563 <hwint13+0x20>
  305563:	e6 a0                	out    %al,$0xa0
  305565:	b8 0d 00 00 00       	mov    $0xd,%eax
  30556a:	fb                   	sti    
  30556b:	6a 0d                	push   $0xd
  30556d:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  305574:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  30557b:	83 c4 08             	add    $0x8,%esp
  30557e:	fa                   	cli    
  30557f:	e4 a1                	in     $0xa1,%al
  305581:	24 df                	and    $0xdf,%al
  305583:	e6 a1                	out    %al,$0xa1
  305585:	0f a9                	pop    %gs
  305587:	0f a1                	pop    %fs
  305589:	1f                   	pop    %ds
  30558a:	07                   	pop    %es
  30558b:	61                   	popa   
  30558c:	cf                   	iret   

0030558d <hwint14>:
  30558d:	60                   	pusha  
  30558e:	06                   	push   %es
  30558f:	1e                   	push   %ds
  305590:	0f a0                	push   %fs
  305592:	0f a8                	push   %gs
  305594:	b8 10 00 00 00       	mov    $0x10,%eax
  305599:	8e d8                	mov    %eax,%ds
  30559b:	8e c0                	mov    %eax,%es
  30559d:	8e e0                	mov    %eax,%fs
  30559f:	8e e8                	mov    %eax,%gs
  3055a1:	e4 a1                	in     $0xa1,%al
  3055a3:	0c 40                	or     $0x40,%al
  3055a5:	e6 a1                	out    %al,$0xa1
  3055a7:	b0 20                	mov    $0x20,%al
  3055a9:	e6 20                	out    %al,$0x20
  3055ab:	eb 00                	jmp    3055ad <hwint14+0x20>
  3055ad:	e6 a0                	out    %al,$0xa0
  3055af:	b8 0e 00 00 00       	mov    $0xe,%eax
  3055b4:	fb                   	sti    
  3055b5:	6a 0e                	push   $0xe
  3055b7:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  3055be:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  3055c5:	83 c4 08             	add    $0x8,%esp
  3055c8:	fa                   	cli    
  3055c9:	e4 a1                	in     $0xa1,%al
  3055cb:	24 bf                	and    $0xbf,%al
  3055cd:	e6 a1                	out    %al,$0xa1
  3055cf:	0f a9                	pop    %gs
  3055d1:	0f a1                	pop    %fs
  3055d3:	1f                   	pop    %ds
  3055d4:	07                   	pop    %es
  3055d5:	61                   	popa   
  3055d6:	cf                   	iret   

003055d7 <hwint15>:
  3055d7:	60                   	pusha  
  3055d8:	06                   	push   %es
  3055d9:	1e                   	push   %ds
  3055da:	0f a0                	push   %fs
  3055dc:	0f a8                	push   %gs
  3055de:	b8 10 00 00 00       	mov    $0x10,%eax
  3055e3:	8e d8                	mov    %eax,%ds
  3055e5:	8e c0                	mov    %eax,%es
  3055e7:	8e e0                	mov    %eax,%fs
  3055e9:	8e e8                	mov    %eax,%gs
  3055eb:	e4 a1                	in     $0xa1,%al
  3055ed:	0c 80                	or     $0x80,%al
  3055ef:	e6 a1                	out    %al,$0xa1
  3055f1:	b0 20                	mov    $0x20,%al
  3055f3:	e6 20                	out    %al,$0x20
  3055f5:	eb 00                	jmp    3055f7 <hwint15+0x20>
  3055f7:	e6 a0                	out    %al,$0xa0
  3055f9:	b8 0f 00 00 00       	mov    $0xf,%eax
  3055fe:	fb                   	sti    
  3055ff:	6a 0f                	push   $0xf
  305601:	ff 34 85 00 42 31 00 	pushl  0x314200(,%eax,4)
  305608:	ff 14 85 40 42 31 00 	call   *0x314240(,%eax,4)
  30560f:	83 c4 08             	add    $0x8,%esp
  305612:	fa                   	cli    
  305613:	e4 a1                	in     $0xa1,%al
  305615:	24 7f                	and    $0x7f,%al
  305617:	e6 a1                	out    %al,$0xa1
  305619:	0f a9                	pop    %gs
  30561b:	0f a1                	pop    %fs
  30561d:	1f                   	pop    %ds
  30561e:	07                   	pop    %es
  30561f:	61                   	popa   
  305620:	cf                   	iret   

00305621 <bad_sys_call>:
  305621:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  305626:	fb                   	sti    
  305627:	cf                   	iret   

00305628 <method>:
  305628:	56                   	push   %esi
  305629:	57                   	push   %edi
  30562a:	52                   	push   %edx
  30562b:	51                   	push   %ecx
  30562c:	53                   	push   %ebx
  30562d:	ff d0                	call   *%eax
  30562f:	83 c4 14             	add    $0x14,%esp
  305632:	b8 00 00 00 00       	mov    $0x0,%eax
  305637:	cd 80                	int    $0x80

00305639 <_workloop>:
  305639:	1e                   	push   %ds
  30563a:	06                   	push   %es
  30563b:	b8 10 00 00 00       	mov    $0x10,%eax
  305640:	8e d8                	mov    %eax,%ds
  305642:	8e c0                	mov    %eax,%es
  305644:	e8 a0 14 00 00       	call   306ae9 <doloop>
  305649:	07                   	pop    %es
  30564a:	1f                   	pop    %ds
  30564b:	83 c4 04             	add    $0x4,%esp
  30564e:	68 28 56 30 00       	push   $0x305628
  305653:	fb                   	sti    
  305654:	cf                   	iret   

00305655 <sys_call>:
  305655:	fa                   	cli    
  305656:	3b 05 64 20 31 00    	cmp    0x312064,%eax
  30565c:	73 c3                	jae    305621 <bad_sys_call>
  30565e:	83 f8 00             	cmp    $0x0,%eax
  305661:	74 d6                	je     305639 <_workloop>
  305663:	1e                   	push   %ds
  305664:	06                   	push   %es
  305665:	0f a0                	push   %fs
  305667:	56                   	push   %esi
  305668:	57                   	push   %edi
  305669:	52                   	push   %edx
  30566a:	51                   	push   %ecx
  30566b:	53                   	push   %ebx
  30566c:	50                   	push   %eax
  30566d:	b8 10 00 00 00       	mov    $0x10,%eax
  305672:	8e d8                	mov    %eax,%ds
  305674:	8e c0                	mov    %eax,%es
  305676:	8e e0                	mov    %eax,%fs
  305678:	58                   	pop    %eax
  305679:	ff 14 85 50 20 31 00 	call   *0x312050(,%eax,4)

00305680 <ret_from_sys_call>:
  305680:	5b                   	pop    %ebx
  305681:	59                   	pop    %ecx
  305682:	5a                   	pop    %edx
  305683:	5f                   	pop    %edi
  305684:	5e                   	pop    %esi
  305685:	0f a1                	pop    %fs
  305687:	07                   	pop    %es
  305688:	1f                   	pop    %ds
  305689:	fb                   	sti    
  30568a:	cf                   	iret   
  30568b:	90                   	nop

0030568c <panic>:
  30568c:	55                   	push   %ebp
  30568d:	89 e5                	mov    %esp,%ebp
  30568f:	83 ec 08             	sub    $0x8,%esp
  305692:	83 ec 08             	sub    $0x8,%esp
  305695:	ff 75 08             	pushl  0x8(%ebp)
  305698:	68 c0 d5 30 00       	push   $0x30d5c0
  30569d:	e8 06 00 00 00       	call   3056a8 <printk>
  3056a2:	83 c4 10             	add    $0x10,%esp
  3056a5:	fa                   	cli    
  3056a6:	eb fe                	jmp    3056a6 <panic+0x1a>

003056a8 <printk>:
  3056a8:	55                   	push   %ebp
  3056a9:	89 e5                	mov    %esp,%ebp
  3056ab:	83 ec 18             	sub    $0x18,%esp
  3056ae:	8d 45 0c             	lea    0xc(%ebp),%eax
  3056b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3056b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3056b7:	83 ec 04             	sub    $0x4,%esp
  3056ba:	50                   	push   %eax
  3056bb:	ff 75 08             	pushl  0x8(%ebp)
  3056be:	68 00 22 31 00       	push   $0x312200
  3056c3:	e8 fb 7b 00 00       	call   30d2c3 <vsprintf>
  3056c8:	83 c4 10             	add    $0x10,%esp
  3056cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3056ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3056d1:	83 ec 04             	sub    $0x4,%esp
  3056d4:	50                   	push   %eax
  3056d5:	68 00 22 31 00       	push   $0x312200
  3056da:	6a 00                	push   $0x0
  3056dc:	e8 be 61 00 00       	call   30b89f <cons_print>
  3056e1:	83 c4 10             	add    $0x10,%esp
  3056e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3056e7:	c9                   	leave  
  3056e8:	c3                   	ret    

003056e9 <printx>:
  3056e9:	55                   	push   %ebp
  3056ea:	89 e5                	mov    %esp,%ebp
  3056ec:	83 ec 18             	sub    $0x18,%esp
  3056ef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3056f6:	e9 d9 00 00 00       	jmp    3057d4 <printx+0xeb>
  3056fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3056fe:	83 e0 0f             	and    $0xf,%eax
  305701:	85 c0                	test   %eax,%eax
  305703:	0f 85 8e 00 00 00    	jne    305797 <printx+0xae>
  305709:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  30570d:	74 73                	je     305782 <printx+0x99>
  30570f:	83 ec 0c             	sub    $0xc,%esp
  305712:	68 d3 d5 30 00       	push   $0x30d5d3
  305717:	e8 8c ff ff ff       	call   3056a8 <printk>
  30571c:	83 c4 10             	add    $0x10,%esp
  30571f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  305726:	eb 44                	jmp    30576c <printx+0x83>
  305728:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30572b:	8d 50 f0             	lea    -0x10(%eax),%edx
  30572e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  305731:	01 d0                	add    %edx,%eax
  305733:	89 c2                	mov    %eax,%edx
  305735:	8b 45 08             	mov    0x8(%ebp),%eax
  305738:	01 d0                	add    %edx,%eax
  30573a:	0f b6 00             	movzbl (%eax),%eax
  30573d:	88 45 ef             	mov    %al,-0x11(%ebp)
  305740:	80 7d ef 20          	cmpb   $0x20,-0x11(%ebp)
  305744:	7e 0c                	jle    305752 <printx+0x69>
  305746:	80 7d ef 7f          	cmpb   $0x7f,-0x11(%ebp)
  30574a:	74 06                	je     305752 <printx+0x69>
  30574c:	0f be 45 ef          	movsbl -0x11(%ebp),%eax
  305750:	eb 05                	jmp    305757 <printx+0x6e>
  305752:	b8 2e 00 00 00       	mov    $0x2e,%eax
  305757:	83 ec 08             	sub    $0x8,%esp
  30575a:	50                   	push   %eax
  30575b:	68 d6 d5 30 00       	push   $0x30d5d6
  305760:	e8 43 ff ff ff       	call   3056a8 <printk>
  305765:	83 c4 10             	add    $0x10,%esp
  305768:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  30576c:	83 7d f0 0f          	cmpl   $0xf,-0x10(%ebp)
  305770:	7e b6                	jle    305728 <printx+0x3f>
  305772:	83 ec 0c             	sub    $0xc,%esp
  305775:	68 d9 d5 30 00       	push   $0x30d5d9
  30577a:	e8 29 ff ff ff       	call   3056a8 <printk>
  30577f:	83 c4 10             	add    $0x10,%esp
  305782:	83 ec 08             	sub    $0x8,%esp
  305785:	ff 75 f4             	pushl  -0xc(%ebp)
  305788:	68 db d5 30 00       	push   $0x30d5db
  30578d:	e8 16 ff ff ff       	call   3056a8 <printk>
  305792:	83 c4 10             	add    $0x10,%esp
  305795:	eb 1a                	jmp    3057b1 <printx+0xc8>
  305797:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30579a:	83 e0 07             	and    $0x7,%eax
  30579d:	85 c0                	test   %eax,%eax
  30579f:	75 10                	jne    3057b1 <printx+0xc8>
  3057a1:	83 ec 0c             	sub    $0xc,%esp
  3057a4:	68 e3 d5 30 00       	push   $0x30d5e3
  3057a9:	e8 fa fe ff ff       	call   3056a8 <printk>
  3057ae:	83 c4 10             	add    $0x10,%esp
  3057b1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  3057b4:	8b 45 08             	mov    0x8(%ebp),%eax
  3057b7:	01 d0                	add    %edx,%eax
  3057b9:	0f b6 00             	movzbl (%eax),%eax
  3057bc:	0f be c0             	movsbl %al,%eax
  3057bf:	83 ec 08             	sub    $0x8,%esp
  3057c2:	50                   	push   %eax
  3057c3:	68 e7 d5 30 00       	push   $0x30d5e7
  3057c8:	e8 db fe ff ff       	call   3056a8 <printk>
  3057cd:	83 c4 10             	add    $0x10,%esp
  3057d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3057d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3057d7:	3b 45 0c             	cmp    0xc(%ebp),%eax
  3057da:	0f 82 1b ff ff ff    	jb     3056fb <printx+0x12>
  3057e0:	83 ec 0c             	sub    $0xc,%esp
  3057e3:	68 d9 d5 30 00       	push   $0x30d5d9
  3057e8:	e8 bb fe ff ff       	call   3056a8 <printk>
  3057ed:	83 c4 10             	add    $0x10,%esp
  3057f0:	c9                   	leave  
  3057f1:	c3                   	ret    
  3057f2:	66 90                	xchg   %ax,%ax

003057f4 <print_cpu_info>:
  3057f4:	55                   	push   %ebp
  3057f5:	89 e5                	mov    %esp,%ebp
  3057f7:	83 ec 08             	sub    $0x8,%esp
  3057fa:	8b 45 08             	mov    0x8(%ebp),%eax
  3057fd:	8b 50 30             	mov    0x30(%eax),%edx
  305800:	8b 45 08             	mov    0x8(%ebp),%eax
  305803:	8b 40 34             	mov    0x34(%eax),%eax
  305806:	83 ec 04             	sub    $0x4,%esp
  305809:	52                   	push   %edx
  30580a:	50                   	push   %eax
  30580b:	68 f4 d5 30 00       	push   $0x30d5f4
  305810:	e8 93 fe ff ff       	call   3056a8 <printk>
  305815:	83 c4 10             	add    $0x10,%esp
  305818:	8b 45 08             	mov    0x8(%ebp),%eax
  30581b:	8b 50 1c             	mov    0x1c(%eax),%edx
  30581e:	8b 45 08             	mov    0x8(%ebp),%eax
  305821:	8b 40 40             	mov    0x40(%eax),%eax
  305824:	83 ec 04             	sub    $0x4,%esp
  305827:	52                   	push   %edx
  305828:	50                   	push   %eax
  305829:	68 10 d6 30 00       	push   $0x30d610
  30582e:	e8 75 fe ff ff       	call   3056a8 <printk>
  305833:	83 c4 10             	add    $0x10,%esp
  305836:	8b 45 08             	mov    0x8(%ebp),%eax
  305839:	8b 50 10             	mov    0x10(%eax),%edx
  30583c:	8b 45 08             	mov    0x8(%ebp),%eax
  30583f:	8b 40 08             	mov    0x8(%eax),%eax
  305842:	83 ec 04             	sub    $0x4,%esp
  305845:	52                   	push   %edx
  305846:	50                   	push   %eax
  305847:	68 29 d6 30 00       	push   $0x30d629
  30584c:	e8 57 fe ff ff       	call   3056a8 <printk>
  305851:	83 c4 10             	add    $0x10,%esp
  305854:	8b 45 08             	mov    0x8(%ebp),%eax
  305857:	8b 50 14             	mov    0x14(%eax),%edx
  30585a:	8b 45 08             	mov    0x8(%ebp),%eax
  30585d:	8b 40 0c             	mov    0xc(%eax),%eax
  305860:	83 ec 04             	sub    $0x4,%esp
  305863:	52                   	push   %edx
  305864:	50                   	push   %eax
  305865:	68 45 d6 30 00       	push   $0x30d645
  30586a:	e8 39 fe ff ff       	call   3056a8 <printk>
  30586f:	83 c4 10             	add    $0x10,%esp
  305872:	8b 45 08             	mov    0x8(%ebp),%eax
  305875:	8b 50 28             	mov    0x28(%eax),%edx
  305878:	8b 45 08             	mov    0x8(%ebp),%eax
  30587b:	8b 40 2c             	mov    0x2c(%eax),%eax
  30587e:	83 ec 04             	sub    $0x4,%esp
  305881:	52                   	push   %edx
  305882:	50                   	push   %eax
  305883:	68 5e d6 30 00       	push   $0x30d65e
  305888:	e8 1b fe ff ff       	call   3056a8 <printk>
  30588d:	83 c4 10             	add    $0x10,%esp
  305890:	8b 45 08             	mov    0x8(%ebp),%eax
  305893:	8b 50 24             	mov    0x24(%eax),%edx
  305896:	8b 45 08             	mov    0x8(%ebp),%eax
  305899:	8b 40 20             	mov    0x20(%eax),%eax
  30589c:	83 ec 04             	sub    $0x4,%esp
  30589f:	52                   	push   %edx
  3058a0:	50                   	push   %eax
  3058a1:	68 7a d6 30 00       	push   $0x30d67a
  3058a6:	e8 fd fd ff ff       	call   3056a8 <printk>
  3058ab:	83 c4 10             	add    $0x10,%esp
  3058ae:	c9                   	leave  
  3058af:	c3                   	ret    

003058b0 <print_task_info>:
  3058b0:	55                   	push   %ebp
  3058b1:	89 e5                	mov    %esp,%ebp
  3058b3:	83 ec 08             	sub    $0x8,%esp
  3058b6:	a1 04 26 31 00       	mov    0x312604,%eax
  3058bb:	8d 48 18             	lea    0x18(%eax),%ecx
  3058be:	a1 04 26 31 00       	mov    0x312604,%eax
  3058c3:	8b 10                	mov    (%eax),%edx
  3058c5:	a1 04 26 31 00       	mov    0x312604,%eax
  3058ca:	83 ec 08             	sub    $0x8,%esp
  3058cd:	51                   	push   %ecx
  3058ce:	52                   	push   %edx
  3058cf:	50                   	push   %eax
  3058d0:	ff 75 0c             	pushl  0xc(%ebp)
  3058d3:	ff 75 08             	pushl  0x8(%ebp)
  3058d6:	68 94 d6 30 00       	push   $0x30d694
  3058db:	e8 c8 fd ff ff       	call   3056a8 <printk>
  3058e0:	83 c4 20             	add    $0x20,%esp
  3058e3:	c9                   	leave  
  3058e4:	c3                   	ret    

003058e5 <die>:
  3058e5:	55                   	push   %ebp
  3058e6:	89 e5                	mov    %esp,%ebp
  3058e8:	57                   	push   %edi
  3058e9:	56                   	push   %esi
  3058ea:	53                   	push   %ebx
  3058eb:	83 ec 1c             	sub    $0x1c,%esp
  3058ee:	83 ec 08             	sub    $0x8,%esp
  3058f1:	ff 75 10             	pushl  0x10(%ebp)
  3058f4:	ff 75 08             	pushl  0x8(%ebp)
  3058f7:	e8 b4 ff ff ff       	call   3058b0 <print_task_info>
  3058fc:	83 c4 10             	add    $0x10,%esp
  3058ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  305902:	83 e8 04             	sub    $0x4,%eax
  305905:	83 ec 0c             	sub    $0xc,%esp
  305908:	50                   	push   %eax
  305909:	e8 e6 fe ff ff       	call   3057f4 <print_cpu_info>
  30590e:	83 c4 10             	add    $0x10,%esp
  305911:	b8 01 00 00 00       	mov    $0x1,%eax
  305916:	bb 03 00 00 00       	mov    $0x3,%ebx
  30591b:	b9 03 00 00 00       	mov    $0x3,%ecx
  305920:	ba 00 00 00 00       	mov    $0x0,%edx
  305925:	be 00 00 00 00       	mov    $0x0,%esi
  30592a:	bf 00 00 00 00       	mov    $0x0,%edi
  30592f:	cd 80                	int    $0x80
  305931:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  305934:	8d 65 f4             	lea    -0xc(%ebp),%esp
  305937:	5b                   	pop    %ebx
  305938:	5e                   	pop    %esi
  305939:	5f                   	pop    %edi
  30593a:	5d                   	pop    %ebp
  30593b:	c3                   	ret    

0030593c <do_divide_error>:
  30593c:	55                   	push   %ebp
  30593d:	89 e5                	mov    %esp,%ebp
  30593f:	83 ec 08             	sub    $0x8,%esp
  305942:	83 ec 04             	sub    $0x4,%esp
  305945:	ff 75 08             	pushl  0x8(%ebp)
  305948:	ff 75 0c             	pushl  0xc(%ebp)
  30594b:	68 b8 d6 30 00       	push   $0x30d6b8
  305950:	e8 90 ff ff ff       	call   3058e5 <die>
  305955:	83 c4 10             	add    $0x10,%esp
  305958:	c9                   	leave  
  305959:	c3                   	ret    

0030595a <do_debug>:
  30595a:	55                   	push   %ebp
  30595b:	89 e5                	mov    %esp,%ebp
  30595d:	83 ec 08             	sub    $0x8,%esp
  305960:	83 ec 04             	sub    $0x4,%esp
  305963:	ff 75 08             	pushl  0x8(%ebp)
  305966:	ff 75 0c             	pushl  0xc(%ebp)
  305969:	68 c5 d6 30 00       	push   $0x30d6c5
  30596e:	e8 72 ff ff ff       	call   3058e5 <die>
  305973:	83 c4 10             	add    $0x10,%esp
  305976:	83 ec 0c             	sub    $0xc,%esp
  305979:	68 d4 d6 30 00       	push   $0x30d6d4
  30597e:	e8 25 fd ff ff       	call   3056a8 <printk>
  305983:	83 c4 10             	add    $0x10,%esp
  305986:	c9                   	leave  
  305987:	c3                   	ret    

00305988 <do_nmi>:
  305988:	55                   	push   %ebp
  305989:	89 e5                	mov    %esp,%ebp
  30598b:	83 ec 08             	sub    $0x8,%esp
  30598e:	83 ec 04             	sub    $0x4,%esp
  305991:	ff 75 08             	pushl  0x8(%ebp)
  305994:	ff 75 0c             	pushl  0xc(%ebp)
  305997:	68 fe d6 30 00       	push   $0x30d6fe
  30599c:	e8 44 ff ff ff       	call   3058e5 <die>
  3059a1:	83 c4 10             	add    $0x10,%esp
  3059a4:	c9                   	leave  
  3059a5:	c3                   	ret    

003059a6 <do_breakpoint>:
  3059a6:	55                   	push   %ebp
  3059a7:	89 e5                	mov    %esp,%ebp
  3059a9:	83 ec 08             	sub    $0x8,%esp
  3059ac:	83 ec 04             	sub    $0x4,%esp
  3059af:	ff 75 08             	pushl  0x8(%ebp)
  3059b2:	ff 75 0c             	pushl  0xc(%ebp)
  3059b5:	68 09 d7 30 00       	push   $0x30d709
  3059ba:	e8 26 ff ff ff       	call   3058e5 <die>
  3059bf:	83 c4 10             	add    $0x10,%esp
  3059c2:	83 ec 0c             	sub    $0xc,%esp
  3059c5:	68 1b d7 30 00       	push   $0x30d71b
  3059ca:	e8 d9 fc ff ff       	call   3056a8 <printk>
  3059cf:	83 c4 10             	add    $0x10,%esp
  3059d2:	c9                   	leave  
  3059d3:	c3                   	ret    

003059d4 <do_overflow>:
  3059d4:	55                   	push   %ebp
  3059d5:	89 e5                	mov    %esp,%ebp
  3059d7:	83 ec 08             	sub    $0x8,%esp
  3059da:	83 ec 04             	sub    $0x4,%esp
  3059dd:	ff 75 08             	pushl  0x8(%ebp)
  3059e0:	ff 75 0c             	pushl  0xc(%ebp)
  3059e3:	68 31 d7 30 00       	push   $0x30d731
  3059e8:	e8 f8 fe ff ff       	call   3058e5 <die>
  3059ed:	83 c4 10             	add    $0x10,%esp
  3059f0:	c9                   	leave  
  3059f1:	c3                   	ret    

003059f2 <do_bounds_check>:
  3059f2:	55                   	push   %ebp
  3059f3:	89 e5                	mov    %esp,%ebp
  3059f5:	83 ec 08             	sub    $0x8,%esp
  3059f8:	83 ec 04             	sub    $0x4,%esp
  3059fb:	ff 75 08             	pushl  0x8(%ebp)
  3059fe:	ff 75 0c             	pushl  0xc(%ebp)
  305a01:	68 3a d7 30 00       	push   $0x30d73a
  305a06:	e8 da fe ff ff       	call   3058e5 <die>
  305a0b:	83 c4 10             	add    $0x10,%esp
  305a0e:	c9                   	leave  
  305a0f:	c3                   	ret    

00305a10 <do_inval_opcode>:
  305a10:	55                   	push   %ebp
  305a11:	89 e5                	mov    %esp,%ebp
  305a13:	83 ec 08             	sub    $0x8,%esp
  305a16:	83 ec 04             	sub    $0x4,%esp
  305a19:	ff 75 08             	pushl  0x8(%ebp)
  305a1c:	ff 75 0c             	pushl  0xc(%ebp)
  305a1f:	68 41 d7 30 00       	push   $0x30d741
  305a24:	e8 bc fe ff ff       	call   3058e5 <die>
  305a29:	83 c4 10             	add    $0x10,%esp
  305a2c:	c9                   	leave  
  305a2d:	c3                   	ret    

00305a2e <do_copr_not_available>:
  305a2e:	55                   	push   %ebp
  305a2f:	89 e5                	mov    %esp,%ebp
  305a31:	83 ec 08             	sub    $0x8,%esp
  305a34:	83 ec 04             	sub    $0x4,%esp
  305a37:	ff 75 08             	pushl  0x8(%ebp)
  305a3a:	ff 75 0c             	pushl  0xc(%ebp)
  305a3d:	68 51 d7 30 00       	push   $0x30d751
  305a42:	e8 9e fe ff ff       	call   3058e5 <die>
  305a47:	83 c4 10             	add    $0x10,%esp
  305a4a:	c9                   	leave  
  305a4b:	c3                   	ret    

00305a4c <do_double_fault>:
  305a4c:	55                   	push   %ebp
  305a4d:	89 e5                	mov    %esp,%ebp
  305a4f:	83 ec 08             	sub    $0x8,%esp
  305a52:	83 ec 04             	sub    $0x4,%esp
  305a55:	ff 75 08             	pushl  0x8(%ebp)
  305a58:	ff 75 0c             	pushl  0xc(%ebp)
  305a5b:	68 65 d7 30 00       	push   $0x30d765
  305a60:	e8 80 fe ff ff       	call   3058e5 <die>
  305a65:	83 c4 10             	add    $0x10,%esp
  305a68:	c9                   	leave  
  305a69:	c3                   	ret    

00305a6a <do_copr_seg_overrun>:
  305a6a:	55                   	push   %ebp
  305a6b:	89 e5                	mov    %esp,%ebp
  305a6d:	83 ec 08             	sub    $0x8,%esp
  305a70:	83 ec 04             	sub    $0x4,%esp
  305a73:	ff 75 08             	pushl  0x8(%ebp)
  305a76:	ff 75 0c             	pushl  0xc(%ebp)
  305a79:	68 72 d7 30 00       	push   $0x30d772
  305a7e:	e8 62 fe ff ff       	call   3058e5 <die>
  305a83:	83 c4 10             	add    $0x10,%esp
  305a86:	c9                   	leave  
  305a87:	c3                   	ret    

00305a88 <do_inval_tss>:
  305a88:	55                   	push   %ebp
  305a89:	89 e5                	mov    %esp,%ebp
  305a8b:	83 ec 08             	sub    $0x8,%esp
  305a8e:	83 ec 04             	sub    $0x4,%esp
  305a91:	ff 75 08             	pushl  0x8(%ebp)
  305a94:	ff 75 0c             	pushl  0xc(%ebp)
  305a97:	68 87 d7 30 00       	push   $0x30d787
  305a9c:	e8 44 fe ff ff       	call   3058e5 <die>
  305aa1:	83 c4 10             	add    $0x10,%esp
  305aa4:	c9                   	leave  
  305aa5:	c3                   	ret    

00305aa6 <do_segment_not_present>:
  305aa6:	55                   	push   %ebp
  305aa7:	89 e5                	mov    %esp,%ebp
  305aa9:	83 ec 08             	sub    $0x8,%esp
  305aac:	83 ec 04             	sub    $0x4,%esp
  305aaf:	ff 75 08             	pushl  0x8(%ebp)
  305ab2:	ff 75 0c             	pushl  0xc(%ebp)
  305ab5:	68 91 d7 30 00       	push   $0x30d791
  305aba:	e8 26 fe ff ff       	call   3058e5 <die>
  305abf:	83 c4 10             	add    $0x10,%esp
  305ac2:	c9                   	leave  
  305ac3:	c3                   	ret    

00305ac4 <do_stack_exception>:
  305ac4:	55                   	push   %ebp
  305ac5:	89 e5                	mov    %esp,%ebp
  305ac7:	83 ec 08             	sub    $0x8,%esp
  305aca:	83 ec 04             	sub    $0x4,%esp
  305acd:	ff 75 08             	pushl  0x8(%ebp)
  305ad0:	ff 75 0c             	pushl  0xc(%ebp)
  305ad3:	68 a5 d7 30 00       	push   $0x30d7a5
  305ad8:	e8 08 fe ff ff       	call   3058e5 <die>
  305add:	83 c4 10             	add    $0x10,%esp
  305ae0:	c9                   	leave  
  305ae1:	c3                   	ret    

00305ae2 <do_general_protection>:
  305ae2:	55                   	push   %ebp
  305ae3:	89 e5                	mov    %esp,%ebp
  305ae5:	83 ec 08             	sub    $0x8,%esp
  305ae8:	83 ec 04             	sub    $0x4,%esp
  305aeb:	ff 75 08             	pushl  0x8(%ebp)
  305aee:	ff 75 0c             	pushl  0xc(%ebp)
  305af1:	68 b3 d7 30 00       	push   $0x30d7b3
  305af6:	e8 ea fd ff ff       	call   3058e5 <die>
  305afb:	83 c4 10             	add    $0x10,%esp
  305afe:	c9                   	leave  
  305aff:	c3                   	ret    

00305b00 <do_page_fault>:
  305b00:	55                   	push   %ebp
  305b01:	89 e5                	mov    %esp,%ebp
  305b03:	57                   	push   %edi
  305b04:	56                   	push   %esi
  305b05:	53                   	push   %ebx
  305b06:	83 ec 10             	sub    $0x10,%esp
  305b09:	0f 20 d0             	mov    %cr2,%eax
  305b0c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  305b0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  305b12:	89 45 ec             	mov    %eax,-0x14(%ebp)
  305b15:	8b 45 08             	mov    0x8(%ebp),%eax
  305b18:	83 e0 01             	and    $0x1,%eax
  305b1b:	85 c0                	test   %eax,%eax
  305b1d:	75 23                	jne    305b42 <do_page_fault+0x42>
  305b1f:	b8 01 00 00 00       	mov    $0x1,%eax
  305b24:	bb 03 00 00 00       	mov    $0x3,%ebx
  305b29:	b9 07 00 00 00       	mov    $0x7,%ecx
  305b2e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  305b31:	be 00 00 00 00       	mov    $0x0,%esi
  305b36:	bf 00 00 00 00       	mov    $0x0,%edi
  305b3b:	cd 80                	int    $0x80
  305b3d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  305b40:	eb 2b                	jmp    305b6d <do_page_fault+0x6d>
  305b42:	8b 45 08             	mov    0x8(%ebp),%eax
  305b45:	83 e0 02             	and    $0x2,%eax
  305b48:	85 c0                	test   %eax,%eax
  305b4a:	74 21                	je     305b6d <do_page_fault+0x6d>
  305b4c:	b8 01 00 00 00       	mov    $0x1,%eax
  305b51:	bb 03 00 00 00       	mov    $0x3,%ebx
  305b56:	b9 08 00 00 00       	mov    $0x8,%ecx
  305b5b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  305b5e:	be 00 00 00 00       	mov    $0x0,%esi
  305b63:	bf 00 00 00 00       	mov    $0x0,%edi
  305b68:	cd 80                	int    $0x80
  305b6a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  305b6d:	83 c4 10             	add    $0x10,%esp
  305b70:	5b                   	pop    %ebx
  305b71:	5e                   	pop    %esi
  305b72:	5f                   	pop    %edi
  305b73:	5d                   	pop    %ebp
  305b74:	c3                   	ret    

00305b75 <do_copr_error>:
  305b75:	55                   	push   %ebp
  305b76:	89 e5                	mov    %esp,%ebp
  305b78:	83 ec 08             	sub    $0x8,%esp
  305b7b:	83 ec 04             	sub    $0x4,%esp
  305b7e:	ff 75 08             	pushl  0x8(%ebp)
  305b81:	ff 75 0c             	pushl  0xc(%ebp)
  305b84:	68 c6 d7 30 00       	push   $0x30d7c6
  305b89:	e8 57 fd ff ff       	call   3058e5 <die>
  305b8e:	83 c4 10             	add    $0x10,%esp
  305b91:	c9                   	leave  
  305b92:	c3                   	ret    

00305b93 <do_none>:
  305b93:	55                   	push   %ebp
  305b94:	89 e5                	mov    %esp,%ebp
  305b96:	83 ec 08             	sub    $0x8,%esp
  305b99:	83 ec 04             	sub    $0x4,%esp
  305b9c:	ff 75 08             	pushl  0x8(%ebp)
  305b9f:	ff 75 0c             	pushl  0xc(%ebp)
  305ba2:	68 d1 d7 30 00       	push   $0x30d7d1
  305ba7:	e8 39 fd ff ff       	call   3058e5 <die>
  305bac:	83 c4 10             	add    $0x10,%esp
  305baf:	c9                   	leave  
  305bb0:	c3                   	ret    

00305bb1 <_null>:
  305bb1:	55                   	push   %ebp
  305bb2:	89 e5                	mov    %esp,%ebp
  305bb4:	5d                   	pop    %ebp
  305bb5:	c3                   	ret    

00305bb6 <disable_irq>:
  305bb6:	55                   	push   %ebp
  305bb7:	89 e5                	mov    %esp,%ebp
  305bb9:	83 ec 18             	sub    $0x18,%esp
  305bbc:	83 7d 08 10          	cmpl   $0x10,0x8(%ebp)
  305bc0:	7f 06                	jg     305bc8 <disable_irq+0x12>
  305bc2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  305bc6:	79 10                	jns    305bd8 <disable_irq+0x22>
  305bc8:	83 ec 0c             	sub    $0xc,%esp
  305bcb:	68 e0 d7 30 00       	push   $0x30d7e0
  305bd0:	e8 b7 fa ff ff       	call   30568c <panic>
  305bd5:	83 c4 10             	add    $0x10,%esp
  305bd8:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  305bdc:	7e 1a                	jle    305bf8 <disable_irq+0x42>
  305bde:	8b 45 08             	mov    0x8(%ebp),%eax
  305be1:	83 e8 08             	sub    $0x8,%eax
  305be4:	ba 01 00 00 00       	mov    $0x1,%edx
  305be9:	89 c1                	mov    %eax,%ecx
  305beb:	d3 e2                	shl    %cl,%edx
  305bed:	89 d0                	mov    %edx,%eax
  305bef:	88 45 f7             	mov    %al,-0x9(%ebp)
  305bf2:	c6 45 f6 a1          	movb   $0xa1,-0xa(%ebp)
  305bf6:	eb 15                	jmp    305c0d <disable_irq+0x57>
  305bf8:	8b 45 08             	mov    0x8(%ebp),%eax
  305bfb:	ba 01 00 00 00       	mov    $0x1,%edx
  305c00:	89 c1                	mov    %eax,%ecx
  305c02:	d3 e2                	shl    %cl,%edx
  305c04:	89 d0                	mov    %edx,%eax
  305c06:	88 45 f7             	mov    %al,-0x9(%ebp)
  305c09:	c6 45 f6 21          	movb   $0x21,-0xa(%ebp)
  305c0d:	fa                   	cli    
  305c0e:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  305c12:	89 c2                	mov    %eax,%edx
  305c14:	ec                   	in     (%dx),%al
  305c15:	88 45 f5             	mov    %al,-0xb(%ebp)
  305c18:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  305c1c:	08 45 f7             	or     %al,-0x9(%ebp)
  305c1f:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  305c23:	0f b6 55 f6          	movzbl -0xa(%ebp),%edx
  305c27:	ee                   	out    %al,(%dx)
  305c28:	fb                   	sti    
  305c29:	c9                   	leave  
  305c2a:	c3                   	ret    

00305c2b <enable_irq>:
  305c2b:	55                   	push   %ebp
  305c2c:	89 e5                	mov    %esp,%ebp
  305c2e:	83 ec 18             	sub    $0x18,%esp
  305c31:	83 7d 08 10          	cmpl   $0x10,0x8(%ebp)
  305c35:	7f 06                	jg     305c3d <enable_irq+0x12>
  305c37:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  305c3b:	79 10                	jns    305c4d <enable_irq+0x22>
  305c3d:	83 ec 0c             	sub    $0xc,%esp
  305c40:	68 e0 d7 30 00       	push   $0x30d7e0
  305c45:	e8 42 fa ff ff       	call   30568c <panic>
  305c4a:	83 c4 10             	add    $0x10,%esp
  305c4d:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  305c51:	7e 1c                	jle    305c6f <enable_irq+0x44>
  305c53:	8b 45 08             	mov    0x8(%ebp),%eax
  305c56:	83 e8 08             	sub    $0x8,%eax
  305c59:	ba 01 00 00 00       	mov    $0x1,%edx
  305c5e:	89 c1                	mov    %eax,%ecx
  305c60:	d3 e2                	shl    %cl,%edx
  305c62:	89 d0                	mov    %edx,%eax
  305c64:	f7 d0                	not    %eax
  305c66:	88 45 f7             	mov    %al,-0x9(%ebp)
  305c69:	c6 45 f6 a1          	movb   $0xa1,-0xa(%ebp)
  305c6d:	eb 17                	jmp    305c86 <enable_irq+0x5b>
  305c6f:	8b 45 08             	mov    0x8(%ebp),%eax
  305c72:	ba 01 00 00 00       	mov    $0x1,%edx
  305c77:	89 c1                	mov    %eax,%ecx
  305c79:	d3 e2                	shl    %cl,%edx
  305c7b:	89 d0                	mov    %edx,%eax
  305c7d:	f7 d0                	not    %eax
  305c7f:	88 45 f7             	mov    %al,-0x9(%ebp)
  305c82:	c6 45 f6 21          	movb   $0x21,-0xa(%ebp)
  305c86:	fa                   	cli    
  305c87:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  305c8b:	89 c2                	mov    %eax,%edx
  305c8d:	ec                   	in     (%dx),%al
  305c8e:	eb 00                	jmp    305c90 <enable_irq+0x65>
  305c90:	eb 00                	jmp    305c92 <enable_irq+0x67>
  305c92:	88 45 f5             	mov    %al,-0xb(%ebp)
  305c95:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  305c99:	20 45 f7             	and    %al,-0x9(%ebp)
  305c9c:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  305ca0:	0f b6 55 f6          	movzbl -0xa(%ebp),%edx
  305ca4:	ee                   	out    %al,(%dx)
  305ca5:	eb 00                	jmp    305ca7 <enable_irq+0x7c>
  305ca7:	eb 00                	jmp    305ca9 <enable_irq+0x7e>
  305ca9:	fb                   	sti    
  305caa:	c9                   	leave  
  305cab:	c3                   	ret    

00305cac <spurious_irq>:
  305cac:	55                   	push   %ebp
  305cad:	89 e5                	mov    %esp,%ebp
  305caf:	83 ec 08             	sub    $0x8,%esp
  305cb2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  305cb6:	78 06                	js     305cbe <spurious_irq+0x12>
  305cb8:	83 7d 0c 0f          	cmpl   $0xf,0xc(%ebp)
  305cbc:	7e 10                	jle    305cce <spurious_irq+0x22>
  305cbe:	83 ec 0c             	sub    $0xc,%esp
  305cc1:	68 f8 d7 30 00       	push   $0x30d7f8
  305cc6:	e8 c1 f9 ff ff       	call   30568c <panic>
  305ccb:	83 c4 10             	add    $0x10,%esp
  305cce:	83 ec 08             	sub    $0x8,%esp
  305cd1:	ff 75 0c             	pushl  0xc(%ebp)
  305cd4:	68 15 d8 30 00       	push   $0x30d815
  305cd9:	e8 ca f9 ff ff       	call   3056a8 <printk>
  305cde:	83 c4 10             	add    $0x10,%esp
  305ce1:	b8 01 00 00 00       	mov    $0x1,%eax
  305ce6:	c9                   	leave  
  305ce7:	c3                   	ret    

00305ce8 <put_irq_handler>:
  305ce8:	55                   	push   %ebp
  305ce9:	89 e5                	mov    %esp,%ebp
  305ceb:	83 ec 08             	sub    $0x8,%esp
  305cee:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  305cf2:	78 06                	js     305cfa <put_irq_handler+0x12>
  305cf4:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  305cf8:	7e 10                	jle    305d0a <put_irq_handler+0x22>
  305cfa:	83 ec 0c             	sub    $0xc,%esp
  305cfd:	68 28 d8 30 00       	push   $0x30d828
  305d02:	e8 85 f9 ff ff       	call   30568c <panic>
  305d07:	83 c4 10             	add    $0x10,%esp
  305d0a:	8b 45 08             	mov    0x8(%ebp),%eax
  305d0d:	8b 04 85 40 42 31 00 	mov    0x314240(,%eax,4),%eax
  305d14:	3b 45 0c             	cmp    0xc(%ebp),%eax
  305d17:	75 02                	jne    305d1b <put_irq_handler+0x33>
  305d19:	eb 5b                	jmp    305d76 <put_irq_handler+0x8e>
  305d1b:	8b 45 08             	mov    0x8(%ebp),%eax
  305d1e:	8b 04 85 40 42 31 00 	mov    0x314240(,%eax,4),%eax
  305d25:	3d ac 5c 30 00       	cmp    $0x305cac,%eax
  305d2a:	74 10                	je     305d3c <put_irq_handler+0x54>
  305d2c:	83 ec 0c             	sub    $0xc,%esp
  305d2f:	68 48 d8 30 00       	push   $0x30d848
  305d34:	e8 53 f9 ff ff       	call   30568c <panic>
  305d39:	83 c4 10             	add    $0x10,%esp
  305d3c:	83 ec 0c             	sub    $0xc,%esp
  305d3f:	ff 75 08             	pushl  0x8(%ebp)
  305d42:	e8 6f fe ff ff       	call   305bb6 <disable_irq>
  305d47:	83 c4 10             	add    $0x10,%esp
  305d4a:	8b 45 08             	mov    0x8(%ebp),%eax
  305d4d:	8b 55 0c             	mov    0xc(%ebp),%edx
  305d50:	89 14 85 40 42 31 00 	mov    %edx,0x314240(,%eax,4)
  305d57:	a1 04 26 31 00       	mov    0x312604,%eax
  305d5c:	8b 10                	mov    (%eax),%edx
  305d5e:	8b 45 08             	mov    0x8(%ebp),%eax
  305d61:	89 14 85 00 42 31 00 	mov    %edx,0x314200(,%eax,4)
  305d68:	83 ec 0c             	sub    $0xc,%esp
  305d6b:	ff 75 08             	pushl  0x8(%ebp)
  305d6e:	e8 b8 fe ff ff       	call   305c2b <enable_irq>
  305d73:	83 c4 10             	add    $0x10,%esp
  305d76:	c9                   	leave  
  305d77:	c3                   	ret    

00305d78 <trap_init>:
  305d78:	55                   	push   %ebp
  305d79:	89 e5                	mov    %esp,%ebp
  305d7b:	83 ec 10             	sub    $0x10,%esp
  305d7e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  305d85:	eb 3d                	jmp    305dc4 <trap_init+0x4c>
  305d87:	b8 00 00 20 00       	mov    $0x200000,%eax
  305d8c:	8b 55 fc             	mov    -0x4(%ebp),%edx
  305d8f:	c1 e2 03             	shl    $0x3,%edx
  305d92:	01 d0                	add    %edx,%eax
  305d94:	ba 31 51 30 00       	mov    $0x305131,%edx
  305d99:	0f b7 d2             	movzwl %dx,%edx
  305d9c:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305da2:	89 10                	mov    %edx,(%eax)
  305da4:	b8 00 00 20 00       	mov    $0x200000,%eax
  305da9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  305dac:	c1 e2 03             	shl    $0x3,%edx
  305daf:	01 d0                	add    %edx,%eax
  305db1:	ba 31 51 30 00       	mov    $0x305131,%edx
  305db6:	66 ba 00 00          	mov    $0x0,%dx
  305dba:	80 ce 8e             	or     $0x8e,%dh
  305dbd:	89 50 04             	mov    %edx,0x4(%eax)
  305dc0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  305dc4:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  305dcb:	7e ba                	jle    305d87 <trap_init+0xf>
  305dcd:	b8 00 00 20 00       	mov    $0x200000,%eax
  305dd2:	ba 68 50 30 00       	mov    $0x305068,%edx
  305dd7:	0f b7 d2             	movzwl %dx,%edx
  305dda:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305de0:	89 10                	mov    %edx,(%eax)
  305de2:	b8 00 00 20 00       	mov    $0x200000,%eax
  305de7:	ba 68 50 30 00       	mov    $0x305068,%edx
  305dec:	66 ba 00 00          	mov    $0x0,%dx
  305df0:	80 ce 8f             	or     $0x8f,%dh
  305df3:	89 50 04             	mov    %edx,0x4(%eax)
  305df6:	b8 00 00 20 00       	mov    $0x200000,%eax
  305dfb:	83 c0 08             	add    $0x8,%eax
  305dfe:	ba a1 50 30 00       	mov    $0x3050a1,%edx
  305e03:	0f b7 d2             	movzwl %dx,%edx
  305e06:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305e0c:	89 10                	mov    %edx,(%eax)
  305e0e:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e13:	83 c0 08             	add    $0x8,%eax
  305e16:	ba a1 50 30 00       	mov    $0x3050a1,%edx
  305e1b:	66 ba 00 00          	mov    $0x0,%dx
  305e1f:	80 ce 8f             	or     $0x8f,%dh
  305e22:	89 50 04             	mov    %edx,0x4(%eax)
  305e25:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e2a:	83 c0 10             	add    $0x10,%eax
  305e2d:	ba aa 50 30 00       	mov    $0x3050aa,%edx
  305e32:	0f b7 d2             	movzwl %dx,%edx
  305e35:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305e3b:	89 10                	mov    %edx,(%eax)
  305e3d:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e42:	83 c0 10             	add    $0x10,%eax
  305e45:	ba aa 50 30 00       	mov    $0x3050aa,%edx
  305e4a:	66 ba 00 00          	mov    $0x0,%dx
  305e4e:	80 ce 8e             	or     $0x8e,%dh
  305e51:	89 50 04             	mov    %edx,0x4(%eax)
  305e54:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e59:	83 c0 18             	add    $0x18,%eax
  305e5c:	ba b3 50 30 00       	mov    $0x3050b3,%edx
  305e61:	0f b7 d2             	movzwl %dx,%edx
  305e64:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305e6a:	89 10                	mov    %edx,(%eax)
  305e6c:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e71:	83 c0 18             	add    $0x18,%eax
  305e74:	ba b3 50 30 00       	mov    $0x3050b3,%edx
  305e79:	66 ba 00 00          	mov    $0x0,%dx
  305e7d:	80 ce 8f             	or     $0x8f,%dh
  305e80:	89 50 04             	mov    %edx,0x4(%eax)
  305e83:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e88:	83 c0 20             	add    $0x20,%eax
  305e8b:	ba bc 50 30 00       	mov    $0x3050bc,%edx
  305e90:	0f b7 d2             	movzwl %dx,%edx
  305e93:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305e99:	89 10                	mov    %edx,(%eax)
  305e9b:	b8 00 00 20 00       	mov    $0x200000,%eax
  305ea0:	83 c0 20             	add    $0x20,%eax
  305ea3:	ba bc 50 30 00       	mov    $0x3050bc,%edx
  305ea8:	66 ba 00 00          	mov    $0x0,%dx
  305eac:	80 ce 8f             	or     $0x8f,%dh
  305eaf:	89 50 04             	mov    %edx,0x4(%eax)
  305eb2:	b8 00 00 20 00       	mov    $0x200000,%eax
  305eb7:	83 c0 28             	add    $0x28,%eax
  305eba:	ba c5 50 30 00       	mov    $0x3050c5,%edx
  305ebf:	0f b7 d2             	movzwl %dx,%edx
  305ec2:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305ec8:	89 10                	mov    %edx,(%eax)
  305eca:	b8 00 00 20 00       	mov    $0x200000,%eax
  305ecf:	83 c0 28             	add    $0x28,%eax
  305ed2:	ba c5 50 30 00       	mov    $0x3050c5,%edx
  305ed7:	66 ba 00 00          	mov    $0x0,%dx
  305edb:	80 ce 8f             	or     $0x8f,%dh
  305ede:	89 50 04             	mov    %edx,0x4(%eax)
  305ee1:	b8 00 00 20 00       	mov    $0x200000,%eax
  305ee6:	83 c0 30             	add    $0x30,%eax
  305ee9:	ba ce 50 30 00       	mov    $0x3050ce,%edx
  305eee:	0f b7 d2             	movzwl %dx,%edx
  305ef1:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305ef7:	89 10                	mov    %edx,(%eax)
  305ef9:	b8 00 00 20 00       	mov    $0x200000,%eax
  305efe:	83 c0 30             	add    $0x30,%eax
  305f01:	ba ce 50 30 00       	mov    $0x3050ce,%edx
  305f06:	66 ba 00 00          	mov    $0x0,%dx
  305f0a:	80 ce 8f             	or     $0x8f,%dh
  305f0d:	89 50 04             	mov    %edx,0x4(%eax)
  305f10:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f15:	83 c0 38             	add    $0x38,%eax
  305f18:	ba d7 50 30 00       	mov    $0x3050d7,%edx
  305f1d:	0f b7 d2             	movzwl %dx,%edx
  305f20:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305f26:	89 10                	mov    %edx,(%eax)
  305f28:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f2d:	83 c0 38             	add    $0x38,%eax
  305f30:	ba d7 50 30 00       	mov    $0x3050d7,%edx
  305f35:	66 ba 00 00          	mov    $0x0,%dx
  305f39:	80 ce 8f             	or     $0x8f,%dh
  305f3c:	89 50 04             	mov    %edx,0x4(%eax)
  305f3f:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f44:	83 c0 40             	add    $0x40,%eax
  305f47:	ba e0 50 30 00       	mov    $0x3050e0,%edx
  305f4c:	0f b7 d2             	movzwl %dx,%edx
  305f4f:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305f55:	89 10                	mov    %edx,(%eax)
  305f57:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f5c:	83 c0 40             	add    $0x40,%eax
  305f5f:	ba e0 50 30 00       	mov    $0x3050e0,%edx
  305f64:	66 ba 00 00          	mov    $0x0,%dx
  305f68:	80 ce 8f             	or     $0x8f,%dh
  305f6b:	89 50 04             	mov    %edx,0x4(%eax)
  305f6e:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f73:	83 c0 48             	add    $0x48,%eax
  305f76:	ba e7 50 30 00       	mov    $0x3050e7,%edx
  305f7b:	0f b7 d2             	movzwl %dx,%edx
  305f7e:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305f84:	89 10                	mov    %edx,(%eax)
  305f86:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f8b:	83 c0 48             	add    $0x48,%eax
  305f8e:	ba e7 50 30 00       	mov    $0x3050e7,%edx
  305f93:	66 ba 00 00          	mov    $0x0,%dx
  305f97:	80 ce 8f             	or     $0x8f,%dh
  305f9a:	89 50 04             	mov    %edx,0x4(%eax)
  305f9d:	b8 00 00 20 00       	mov    $0x200000,%eax
  305fa2:	83 c0 50             	add    $0x50,%eax
  305fa5:	ba f3 50 30 00       	mov    $0x3050f3,%edx
  305faa:	0f b7 d2             	movzwl %dx,%edx
  305fad:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305fb3:	89 10                	mov    %edx,(%eax)
  305fb5:	b8 00 00 20 00       	mov    $0x200000,%eax
  305fba:	83 c0 50             	add    $0x50,%eax
  305fbd:	ba f3 50 30 00       	mov    $0x3050f3,%edx
  305fc2:	66 ba 00 00          	mov    $0x0,%dx
  305fc6:	80 ce 8f             	or     $0x8f,%dh
  305fc9:	89 50 04             	mov    %edx,0x4(%eax)
  305fcc:	b8 00 00 20 00       	mov    $0x200000,%eax
  305fd1:	83 c0 58             	add    $0x58,%eax
  305fd4:	ba fd 50 30 00       	mov    $0x3050fd,%edx
  305fd9:	0f b7 d2             	movzwl %dx,%edx
  305fdc:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305fe2:	89 10                	mov    %edx,(%eax)
  305fe4:	b8 00 00 20 00       	mov    $0x200000,%eax
  305fe9:	83 c0 58             	add    $0x58,%eax
  305fec:	ba fd 50 30 00       	mov    $0x3050fd,%edx
  305ff1:	66 ba 00 00          	mov    $0x0,%dx
  305ff5:	80 ce 8f             	or     $0x8f,%dh
  305ff8:	89 50 04             	mov    %edx,0x4(%eax)
  305ffb:	b8 00 00 20 00       	mov    $0x200000,%eax
  306000:	83 c0 60             	add    $0x60,%eax
  306003:	ba 07 51 30 00       	mov    $0x305107,%edx
  306008:	0f b7 d2             	movzwl %dx,%edx
  30600b:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306011:	89 10                	mov    %edx,(%eax)
  306013:	b8 00 00 20 00       	mov    $0x200000,%eax
  306018:	83 c0 60             	add    $0x60,%eax
  30601b:	ba 07 51 30 00       	mov    $0x305107,%edx
  306020:	66 ba 00 00          	mov    $0x0,%dx
  306024:	80 ce 8f             	or     $0x8f,%dh
  306027:	89 50 04             	mov    %edx,0x4(%eax)
  30602a:	b8 00 00 20 00       	mov    $0x200000,%eax
  30602f:	83 c0 68             	add    $0x68,%eax
  306032:	ba 11 51 30 00       	mov    $0x305111,%edx
  306037:	0f b7 d2             	movzwl %dx,%edx
  30603a:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306040:	89 10                	mov    %edx,(%eax)
  306042:	b8 00 00 20 00       	mov    $0x200000,%eax
  306047:	83 c0 68             	add    $0x68,%eax
  30604a:	ba 11 51 30 00       	mov    $0x305111,%edx
  30604f:	66 ba 00 00          	mov    $0x0,%dx
  306053:	80 ce 8f             	or     $0x8f,%dh
  306056:	89 50 04             	mov    %edx,0x4(%eax)
  306059:	b8 00 00 20 00       	mov    $0x200000,%eax
  30605e:	83 c0 70             	add    $0x70,%eax
  306061:	ba 1b 51 30 00       	mov    $0x30511b,%edx
  306066:	0f b7 d2             	movzwl %dx,%edx
  306069:	81 ca 00 00 08 00    	or     $0x80000,%edx
  30606f:	89 10                	mov    %edx,(%eax)
  306071:	b8 00 00 20 00       	mov    $0x200000,%eax
  306076:	83 c0 70             	add    $0x70,%eax
  306079:	ba 1b 51 30 00       	mov    $0x30511b,%edx
  30607e:	66 ba 00 00          	mov    $0x0,%dx
  306082:	80 ce 8f             	or     $0x8f,%dh
  306085:	89 50 04             	mov    %edx,0x4(%eax)
  306088:	b8 00 00 20 00       	mov    $0x200000,%eax
  30608d:	83 e8 80             	sub    $0xffffff80,%eax
  306090:	ba 25 51 30 00       	mov    $0x305125,%edx
  306095:	0f b7 d2             	movzwl %dx,%edx
  306098:	81 ca 00 00 08 00    	or     $0x80000,%edx
  30609e:	89 10                	mov    %edx,(%eax)
  3060a0:	b8 00 00 20 00       	mov    $0x200000,%eax
  3060a5:	83 e8 80             	sub    $0xffffff80,%eax
  3060a8:	ba 25 51 30 00       	mov    $0x305125,%edx
  3060ad:	66 ba 00 00          	mov    $0x0,%dx
  3060b1:	80 ce 8f             	or     $0x8f,%dh
  3060b4:	89 50 04             	mov    %edx,0x4(%eax)
  3060b7:	b8 00 00 20 00       	mov    $0x200000,%eax
  3060bc:	05 00 01 00 00       	add    $0x100,%eax
  3060c1:	ba 79 51 30 00       	mov    $0x305179,%edx
  3060c6:	0f b7 d2             	movzwl %dx,%edx
  3060c9:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3060cf:	89 10                	mov    %edx,(%eax)
  3060d1:	b8 00 00 20 00       	mov    $0x200000,%eax
  3060d6:	05 00 01 00 00       	add    $0x100,%eax
  3060db:	ba 79 51 30 00       	mov    $0x305179,%edx
  3060e0:	66 ba 00 00          	mov    $0x0,%dx
  3060e4:	80 ce 8e             	or     $0x8e,%dh
  3060e7:	89 50 04             	mov    %edx,0x4(%eax)
  3060ea:	b8 00 00 20 00       	mov    $0x200000,%eax
  3060ef:	05 08 01 00 00       	add    $0x108,%eax
  3060f4:	ba e7 51 30 00       	mov    $0x3051e7,%edx
  3060f9:	0f b7 d2             	movzwl %dx,%edx
  3060fc:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306102:	89 10                	mov    %edx,(%eax)
  306104:	b8 00 00 20 00       	mov    $0x200000,%eax
  306109:	05 08 01 00 00       	add    $0x108,%eax
  30610e:	ba e7 51 30 00       	mov    $0x3051e7,%edx
  306113:	66 ba 00 00          	mov    $0x0,%dx
  306117:	80 ce 8e             	or     $0x8e,%dh
  30611a:	89 50 04             	mov    %edx,0x4(%eax)
  30611d:	b8 00 00 20 00       	mov    $0x200000,%eax
  306122:	05 10 01 00 00       	add    $0x110,%eax
  306127:	ba 2d 52 30 00       	mov    $0x30522d,%edx
  30612c:	0f b7 d2             	movzwl %dx,%edx
  30612f:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306135:	89 10                	mov    %edx,(%eax)
  306137:	b8 00 00 20 00       	mov    $0x200000,%eax
  30613c:	05 10 01 00 00       	add    $0x110,%eax
  306141:	ba 2d 52 30 00       	mov    $0x30522d,%edx
  306146:	66 ba 00 00          	mov    $0x0,%dx
  30614a:	80 ce 8e             	or     $0x8e,%dh
  30614d:	89 50 04             	mov    %edx,0x4(%eax)
  306150:	b8 00 00 20 00       	mov    $0x200000,%eax
  306155:	05 18 01 00 00       	add    $0x118,%eax
  30615a:	ba 73 52 30 00       	mov    $0x305273,%edx
  30615f:	0f b7 d2             	movzwl %dx,%edx
  306162:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306168:	89 10                	mov    %edx,(%eax)
  30616a:	b8 00 00 20 00       	mov    $0x200000,%eax
  30616f:	05 18 01 00 00       	add    $0x118,%eax
  306174:	ba 73 52 30 00       	mov    $0x305273,%edx
  306179:	66 ba 00 00          	mov    $0x0,%dx
  30617d:	80 ce 8e             	or     $0x8e,%dh
  306180:	89 50 04             	mov    %edx,0x4(%eax)
  306183:	b8 00 00 20 00       	mov    $0x200000,%eax
  306188:	05 20 01 00 00       	add    $0x120,%eax
  30618d:	ba b9 52 30 00       	mov    $0x3052b9,%edx
  306192:	0f b7 d2             	movzwl %dx,%edx
  306195:	81 ca 00 00 08 00    	or     $0x80000,%edx
  30619b:	89 10                	mov    %edx,(%eax)
  30619d:	b8 00 00 20 00       	mov    $0x200000,%eax
  3061a2:	05 20 01 00 00       	add    $0x120,%eax
  3061a7:	ba b9 52 30 00       	mov    $0x3052b9,%edx
  3061ac:	66 ba 00 00          	mov    $0x0,%dx
  3061b0:	80 ce 8e             	or     $0x8e,%dh
  3061b3:	89 50 04             	mov    %edx,0x4(%eax)
  3061b6:	b8 00 00 20 00       	mov    $0x200000,%eax
  3061bb:	05 28 01 00 00       	add    $0x128,%eax
  3061c0:	ba ff 52 30 00       	mov    $0x3052ff,%edx
  3061c5:	0f b7 d2             	movzwl %dx,%edx
  3061c8:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3061ce:	89 10                	mov    %edx,(%eax)
  3061d0:	b8 00 00 20 00       	mov    $0x200000,%eax
  3061d5:	05 28 01 00 00       	add    $0x128,%eax
  3061da:	ba ff 52 30 00       	mov    $0x3052ff,%edx
  3061df:	66 ba 00 00          	mov    $0x0,%dx
  3061e3:	80 ce 8e             	or     $0x8e,%dh
  3061e6:	89 50 04             	mov    %edx,0x4(%eax)
  3061e9:	b8 00 00 20 00       	mov    $0x200000,%eax
  3061ee:	05 30 01 00 00       	add    $0x130,%eax
  3061f3:	ba 45 53 30 00       	mov    $0x305345,%edx
  3061f8:	0f b7 d2             	movzwl %dx,%edx
  3061fb:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306201:	89 10                	mov    %edx,(%eax)
  306203:	b8 00 00 20 00       	mov    $0x200000,%eax
  306208:	05 30 01 00 00       	add    $0x130,%eax
  30620d:	ba 45 53 30 00       	mov    $0x305345,%edx
  306212:	66 ba 00 00          	mov    $0x0,%dx
  306216:	80 ce 8e             	or     $0x8e,%dh
  306219:	89 50 04             	mov    %edx,0x4(%eax)
  30621c:	b8 00 00 20 00       	mov    $0x200000,%eax
  306221:	05 38 01 00 00       	add    $0x138,%eax
  306226:	ba 8b 53 30 00       	mov    $0x30538b,%edx
  30622b:	0f b7 d2             	movzwl %dx,%edx
  30622e:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306234:	89 10                	mov    %edx,(%eax)
  306236:	b8 00 00 20 00       	mov    $0x200000,%eax
  30623b:	05 38 01 00 00       	add    $0x138,%eax
  306240:	ba 8b 53 30 00       	mov    $0x30538b,%edx
  306245:	66 ba 00 00          	mov    $0x0,%dx
  306249:	80 ce 8e             	or     $0x8e,%dh
  30624c:	89 50 04             	mov    %edx,0x4(%eax)
  30624f:	b8 00 00 20 00       	mov    $0x200000,%eax
  306254:	05 40 01 00 00       	add    $0x140,%eax
  306259:	ba d1 53 30 00       	mov    $0x3053d1,%edx
  30625e:	0f b7 d2             	movzwl %dx,%edx
  306261:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306267:	89 10                	mov    %edx,(%eax)
  306269:	b8 00 00 20 00       	mov    $0x200000,%eax
  30626e:	05 40 01 00 00       	add    $0x140,%eax
  306273:	ba d1 53 30 00       	mov    $0x3053d1,%edx
  306278:	66 ba 00 00          	mov    $0x0,%dx
  30627c:	80 ce 8e             	or     $0x8e,%dh
  30627f:	89 50 04             	mov    %edx,0x4(%eax)
  306282:	b8 00 00 20 00       	mov    $0x200000,%eax
  306287:	05 48 01 00 00       	add    $0x148,%eax
  30628c:	ba 1b 54 30 00       	mov    $0x30541b,%edx
  306291:	0f b7 d2             	movzwl %dx,%edx
  306294:	81 ca 00 00 08 00    	or     $0x80000,%edx
  30629a:	89 10                	mov    %edx,(%eax)
  30629c:	b8 00 00 20 00       	mov    $0x200000,%eax
  3062a1:	05 48 01 00 00       	add    $0x148,%eax
  3062a6:	ba 1b 54 30 00       	mov    $0x30541b,%edx
  3062ab:	66 ba 00 00          	mov    $0x0,%dx
  3062af:	80 ce 8e             	or     $0x8e,%dh
  3062b2:	89 50 04             	mov    %edx,0x4(%eax)
  3062b5:	b8 00 00 20 00       	mov    $0x200000,%eax
  3062ba:	05 50 01 00 00       	add    $0x150,%eax
  3062bf:	ba 65 54 30 00       	mov    $0x305465,%edx
  3062c4:	0f b7 d2             	movzwl %dx,%edx
  3062c7:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3062cd:	89 10                	mov    %edx,(%eax)
  3062cf:	b8 00 00 20 00       	mov    $0x200000,%eax
  3062d4:	05 50 01 00 00       	add    $0x150,%eax
  3062d9:	ba 65 54 30 00       	mov    $0x305465,%edx
  3062de:	66 ba 00 00          	mov    $0x0,%dx
  3062e2:	80 ce 8e             	or     $0x8e,%dh
  3062e5:	89 50 04             	mov    %edx,0x4(%eax)
  3062e8:	b8 00 00 20 00       	mov    $0x200000,%eax
  3062ed:	05 58 01 00 00       	add    $0x158,%eax
  3062f2:	ba af 54 30 00       	mov    $0x3054af,%edx
  3062f7:	0f b7 d2             	movzwl %dx,%edx
  3062fa:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306300:	89 10                	mov    %edx,(%eax)
  306302:	b8 00 00 20 00       	mov    $0x200000,%eax
  306307:	05 58 01 00 00       	add    $0x158,%eax
  30630c:	ba af 54 30 00       	mov    $0x3054af,%edx
  306311:	66 ba 00 00          	mov    $0x0,%dx
  306315:	80 ce 8e             	or     $0x8e,%dh
  306318:	89 50 04             	mov    %edx,0x4(%eax)
  30631b:	b8 00 00 20 00       	mov    $0x200000,%eax
  306320:	05 60 01 00 00       	add    $0x160,%eax
  306325:	ba f9 54 30 00       	mov    $0x3054f9,%edx
  30632a:	0f b7 d2             	movzwl %dx,%edx
  30632d:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306333:	89 10                	mov    %edx,(%eax)
  306335:	b8 00 00 20 00       	mov    $0x200000,%eax
  30633a:	05 60 01 00 00       	add    $0x160,%eax
  30633f:	ba f9 54 30 00       	mov    $0x3054f9,%edx
  306344:	66 ba 00 00          	mov    $0x0,%dx
  306348:	80 ce 8e             	or     $0x8e,%dh
  30634b:	89 50 04             	mov    %edx,0x4(%eax)
  30634e:	b8 00 00 20 00       	mov    $0x200000,%eax
  306353:	05 68 01 00 00       	add    $0x168,%eax
  306358:	ba 43 55 30 00       	mov    $0x305543,%edx
  30635d:	0f b7 d2             	movzwl %dx,%edx
  306360:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306366:	89 10                	mov    %edx,(%eax)
  306368:	b8 00 00 20 00       	mov    $0x200000,%eax
  30636d:	05 68 01 00 00       	add    $0x168,%eax
  306372:	ba 43 55 30 00       	mov    $0x305543,%edx
  306377:	66 ba 00 00          	mov    $0x0,%dx
  30637b:	80 ce 8e             	or     $0x8e,%dh
  30637e:	89 50 04             	mov    %edx,0x4(%eax)
  306381:	b8 00 00 20 00       	mov    $0x200000,%eax
  306386:	05 70 01 00 00       	add    $0x170,%eax
  30638b:	ba 8d 55 30 00       	mov    $0x30558d,%edx
  306390:	0f b7 d2             	movzwl %dx,%edx
  306393:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306399:	89 10                	mov    %edx,(%eax)
  30639b:	b8 00 00 20 00       	mov    $0x200000,%eax
  3063a0:	05 70 01 00 00       	add    $0x170,%eax
  3063a5:	ba 8d 55 30 00       	mov    $0x30558d,%edx
  3063aa:	66 ba 00 00          	mov    $0x0,%dx
  3063ae:	80 ce 8e             	or     $0x8e,%dh
  3063b1:	89 50 04             	mov    %edx,0x4(%eax)
  3063b4:	b8 00 00 20 00       	mov    $0x200000,%eax
  3063b9:	05 78 01 00 00       	add    $0x178,%eax
  3063be:	ba d7 55 30 00       	mov    $0x3055d7,%edx
  3063c3:	0f b7 d2             	movzwl %dx,%edx
  3063c6:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3063cc:	89 10                	mov    %edx,(%eax)
  3063ce:	b8 00 00 20 00       	mov    $0x200000,%eax
  3063d3:	05 78 01 00 00       	add    $0x178,%eax
  3063d8:	ba d7 55 30 00       	mov    $0x3055d7,%edx
  3063dd:	66 ba 00 00          	mov    $0x0,%dx
  3063e1:	80 ce 8e             	or     $0x8e,%dh
  3063e4:	89 50 04             	mov    %edx,0x4(%eax)
  3063e7:	b8 00 00 20 00       	mov    $0x200000,%eax
  3063ec:	05 00 04 00 00       	add    $0x400,%eax
  3063f1:	ba 55 56 30 00       	mov    $0x305655,%edx
  3063f6:	0f b7 d2             	movzwl %dx,%edx
  3063f9:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3063ff:	89 10                	mov    %edx,(%eax)
  306401:	b8 00 00 20 00       	mov    $0x200000,%eax
  306406:	05 00 04 00 00       	add    $0x400,%eax
  30640b:	ba 55 56 30 00       	mov    $0x305655,%edx
  306410:	66 ba 00 00          	mov    $0x0,%dx
  306414:	80 ce ee             	or     $0xee,%dh
  306417:	89 50 04             	mov    %edx,0x4(%eax)
  30641a:	b8 00 00 20 00       	mov    $0x200000,%eax
  30641f:	05 08 04 00 00       	add    $0x408,%eax
  306424:	ba 3d 51 30 00       	mov    $0x30513d,%edx
  306429:	0f b7 d2             	movzwl %dx,%edx
  30642c:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306432:	89 10                	mov    %edx,(%eax)
  306434:	b8 00 00 20 00       	mov    $0x200000,%eax
  306439:	05 08 04 00 00       	add    $0x408,%eax
  30643e:	ba 3d 51 30 00       	mov    $0x30513d,%edx
  306443:	66 ba 00 00          	mov    $0x0,%dx
  306447:	80 ce ee             	or     $0xee,%dh
  30644a:	89 50 04             	mov    %edx,0x4(%eax)
  30644d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  306454:	eb 12                	jmp    306468 <trap_init+0x6f0>
  306456:	8b 45 f8             	mov    -0x8(%ebp),%eax
  306459:	c7 04 85 40 42 31 00 	movl   $0x305cac,0x314240(,%eax,4)
  306460:	ac 5c 30 00 
  306464:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  306468:	83 7d f8 0f          	cmpl   $0xf,-0x8(%ebp)
  30646c:	7e e8                	jle    306456 <trap_init+0x6de>
  30646e:	b8 11 00 00 00       	mov    $0x11,%eax
  306473:	ba 20 00 00 00       	mov    $0x20,%edx
  306478:	ee                   	out    %al,(%dx)
  306479:	eb 00                	jmp    30647b <trap_init+0x703>
  30647b:	eb 00                	jmp    30647d <trap_init+0x705>
  30647d:	b8 20 00 00 00       	mov    $0x20,%eax
  306482:	ba 21 00 00 00       	mov    $0x21,%edx
  306487:	ee                   	out    %al,(%dx)
  306488:	eb 00                	jmp    30648a <trap_init+0x712>
  30648a:	eb 00                	jmp    30648c <trap_init+0x714>
  30648c:	b8 04 00 00 00       	mov    $0x4,%eax
  306491:	ba 21 00 00 00       	mov    $0x21,%edx
  306496:	ee                   	out    %al,(%dx)
  306497:	eb 00                	jmp    306499 <trap_init+0x721>
  306499:	eb 00                	jmp    30649b <trap_init+0x723>
  30649b:	b8 01 00 00 00       	mov    $0x1,%eax
  3064a0:	ba 21 00 00 00       	mov    $0x21,%edx
  3064a5:	ee                   	out    %al,(%dx)
  3064a6:	eb 00                	jmp    3064a8 <trap_init+0x730>
  3064a8:	eb 00                	jmp    3064aa <trap_init+0x732>
  3064aa:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
  3064af:	ba 21 00 00 00       	mov    $0x21,%edx
  3064b4:	ee                   	out    %al,(%dx)
  3064b5:	eb 00                	jmp    3064b7 <trap_init+0x73f>
  3064b7:	eb 00                	jmp    3064b9 <trap_init+0x741>
  3064b9:	b8 11 00 00 00       	mov    $0x11,%eax
  3064be:	ba a0 00 00 00       	mov    $0xa0,%edx
  3064c3:	ee                   	out    %al,(%dx)
  3064c4:	eb 00                	jmp    3064c6 <trap_init+0x74e>
  3064c6:	eb 00                	jmp    3064c8 <trap_init+0x750>
  3064c8:	b8 28 00 00 00       	mov    $0x28,%eax
  3064cd:	ba a1 00 00 00       	mov    $0xa1,%edx
  3064d2:	ee                   	out    %al,(%dx)
  3064d3:	eb 00                	jmp    3064d5 <trap_init+0x75d>
  3064d5:	eb 00                	jmp    3064d7 <trap_init+0x75f>
  3064d7:	b8 02 00 00 00       	mov    $0x2,%eax
  3064dc:	ba a1 00 00 00       	mov    $0xa1,%edx
  3064e1:	ee                   	out    %al,(%dx)
  3064e2:	eb 00                	jmp    3064e4 <trap_init+0x76c>
  3064e4:	eb 00                	jmp    3064e6 <trap_init+0x76e>
  3064e6:	b8 01 00 00 00       	mov    $0x1,%eax
  3064eb:	ba a1 00 00 00       	mov    $0xa1,%edx
  3064f0:	ee                   	out    %al,(%dx)
  3064f1:	eb 00                	jmp    3064f3 <trap_init+0x77b>
  3064f3:	eb 00                	jmp    3064f5 <trap_init+0x77d>
  3064f5:	b8 ff 00 00 00       	mov    $0xff,%eax
  3064fa:	ba a1 00 00 00       	mov    $0xa1,%edx
  3064ff:	ee                   	out    %al,(%dx)
  306500:	eb 00                	jmp    306502 <trap_init+0x78a>
  306502:	eb 00                	jmp    306504 <trap_init+0x78c>
  306504:	c9                   	leave  
  306505:	c3                   	ret    
  306506:	66 90                	xchg   %ax,%ax

00306508 <ret>:
  306508:	55                   	push   %ebp
  306509:	89 e5                	mov    %esp,%ebp
  30650b:	57                   	push   %edi
  30650c:	56                   	push   %esi
  30650d:	53                   	push   %ebx
  30650e:	83 ec 10             	sub    $0x10,%esp
  306511:	b8 02 00 00 00       	mov    $0x2,%eax
  306516:	8b 5d 08             	mov    0x8(%ebp),%ebx
  306519:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30651c:	ba 00 00 00 00       	mov    $0x0,%edx
  306521:	be 00 00 00 00       	mov    $0x0,%esi
  306526:	bf 00 00 00 00       	mov    $0x0,%edi
  30652b:	cd 80                	int    $0x80
  30652d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  306530:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306533:	83 c4 10             	add    $0x10,%esp
  306536:	5b                   	pop    %ebx
  306537:	5e                   	pop    %esi
  306538:	5f                   	pop    %edi
  306539:	5d                   	pop    %ebp
  30653a:	c3                   	ret    

0030653b <strcpy>:
  30653b:	55                   	push   %ebp
  30653c:	89 e5                	mov    %esp,%ebp
  30653e:	57                   	push   %edi
  30653f:	56                   	push   %esi
  306540:	8b 55 0c             	mov    0xc(%ebp),%edx
  306543:	8b 4d 08             	mov    0x8(%ebp),%ecx
  306546:	89 d6                	mov    %edx,%esi
  306548:	89 cf                	mov    %ecx,%edi
  30654a:	fc                   	cld    
  30654b:	ac                   	lods   %ds:(%esi),%al
  30654c:	aa                   	stos   %al,%es:(%edi)
  30654d:	84 c0                	test   %al,%al
  30654f:	75 fa                	jne    30654b <strcpy+0x10>
  306551:	8b 45 08             	mov    0x8(%ebp),%eax
  306554:	5e                   	pop    %esi
  306555:	5f                   	pop    %edi
  306556:	5d                   	pop    %ebp
  306557:	c3                   	ret    

00306558 <memcpy>:
  306558:	55                   	push   %ebp
  306559:	89 e5                	mov    %esp,%ebp
  30655b:	57                   	push   %edi
  30655c:	56                   	push   %esi
  30655d:	53                   	push   %ebx
  30655e:	8b 45 10             	mov    0x10(%ebp),%eax
  306561:	8b 55 0c             	mov    0xc(%ebp),%edx
  306564:	8b 5d 08             	mov    0x8(%ebp),%ebx
  306567:	89 c1                	mov    %eax,%ecx
  306569:	89 d6                	mov    %edx,%esi
  30656b:	89 df                	mov    %ebx,%edi
  30656d:	fc                   	cld    
  30656e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  306570:	8b 45 08             	mov    0x8(%ebp),%eax
  306573:	5b                   	pop    %ebx
  306574:	5e                   	pop    %esi
  306575:	5f                   	pop    %edi
  306576:	5d                   	pop    %ebp
  306577:	c3                   	ret    

00306578 <pick_task>:
  306578:	55                   	push   %ebp
  306579:	89 e5                	mov    %esp,%ebp
  30657b:	83 ec 18             	sub    $0x18,%esp
  30657e:	a1 04 26 31 00       	mov    0x312604,%eax
  306583:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306586:	a1 0c 26 31 00       	mov    0x31260c,%eax
  30658b:	85 c0                	test   %eax,%eax
  30658d:	74 0c                	je     30659b <pick_task+0x23>
  30658f:	a1 0c 26 31 00       	mov    0x31260c,%eax
  306594:	a3 04 26 31 00       	mov    %eax,0x312604
  306599:	eb 1f                	jmp    3065ba <pick_task+0x42>
  30659b:	a1 10 26 31 00       	mov    0x312610,%eax
  3065a0:	85 c0                	test   %eax,%eax
  3065a2:	74 0c                	je     3065b0 <pick_task+0x38>
  3065a4:	a1 10 26 31 00       	mov    0x312610,%eax
  3065a9:	a3 04 26 31 00       	mov    %eax,0x312604
  3065ae:	eb 0a                	jmp    3065ba <pick_task+0x42>
  3065b0:	a1 14 26 31 00       	mov    0x312614,%eax
  3065b5:	a3 04 26 31 00       	mov    %eax,0x312604
  3065ba:	a1 24 26 31 00       	mov    0x312624,%eax
  3065bf:	8b 15 04 26 31 00    	mov    0x312604,%edx
  3065c5:	81 c2 00 10 00 00    	add    $0x1000,%edx
  3065cb:	89 50 04             	mov    %edx,0x4(%eax)
  3065ce:	a1 04 26 31 00       	mov    0x312604,%eax
  3065d3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  3065d6:	74 2a                	je     306602 <pick_task+0x8a>
  3065d8:	a1 04 26 31 00       	mov    0x312604,%eax
  3065dd:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  3065e3:	8b 15 04 26 31 00    	mov    0x312604,%edx
  3065e9:	8d 4a 18             	lea    0x18(%edx),%ecx
  3065ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
  3065ef:	83 c2 18             	add    $0x18,%edx
  3065f2:	50                   	push   %eax
  3065f3:	51                   	push   %ecx
  3065f4:	52                   	push   %edx
  3065f5:	68 78 d8 30 00       	push   $0x30d878
  3065fa:	e8 a9 f0 ff ff       	call   3056a8 <printk>
  3065ff:	83 c4 10             	add    $0x10,%esp
  306602:	c9                   	leave  
  306603:	c3                   	ret    

00306604 <sched>:
  306604:	55                   	push   %ebp
  306605:	89 e5                	mov    %esp,%ebp
  306607:	83 ec 08             	sub    $0x8,%esp
  30660a:	a1 10 26 31 00       	mov    0x312610,%eax
  30660f:	85 c0                	test   %eax,%eax
  306611:	74 60                	je     306673 <sched+0x6f>
  306613:	a1 10 26 31 00       	mov    0x312610,%eax
  306618:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
  30661e:	85 c0                	test   %eax,%eax
  306620:	75 51                	jne    306673 <sched+0x6f>
  306622:	a1 1c 26 31 00       	mov    0x31261c,%eax
  306627:	8b 15 10 26 31 00    	mov    0x312610,%edx
  30662d:	89 90 b8 00 00 00    	mov    %edx,0xb8(%eax)
  306633:	a1 10 26 31 00       	mov    0x312610,%eax
  306638:	a3 1c 26 31 00       	mov    %eax,0x31261c
  30663d:	a1 10 26 31 00       	mov    0x312610,%eax
  306642:	8b 80 b8 00 00 00    	mov    0xb8(%eax),%eax
  306648:	a3 10 26 31 00       	mov    %eax,0x312610
  30664d:	a1 1c 26 31 00       	mov    0x31261c,%eax
  306652:	c7 80 b8 00 00 00 00 	movl   $0x0,0xb8(%eax)
  306659:	00 00 00 
  30665c:	a1 10 26 31 00       	mov    0x312610,%eax
  306661:	8b 15 10 26 31 00    	mov    0x312610,%edx
  306667:	8b 92 a4 00 00 00    	mov    0xa4(%edx),%edx
  30666d:	89 90 a8 00 00 00    	mov    %edx,0xa8(%eax)
  306673:	e8 00 ff ff ff       	call   306578 <pick_task>
  306678:	c9                   	leave  
  306679:	c3                   	ret    

0030667a <ready>:
  30667a:	55                   	push   %ebp
  30667b:	89 e5                	mov    %esp,%ebp
  30667d:	83 ec 08             	sub    $0x8,%esp
  306680:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  306684:	75 10                	jne    306696 <ready+0x1c>
  306686:	83 ec 0c             	sub    $0xc,%esp
  306689:	68 8e d8 30 00       	push   $0x30d88e
  30668e:	e8 f9 ef ff ff       	call   30568c <panic>
  306693:	83 c4 10             	add    $0x10,%esp
  306696:	8b 45 08             	mov    0x8(%ebp),%eax
  306699:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  30669f:	8b 04 85 0c 26 31 00 	mov    0x31260c(,%eax,4),%eax
  3066a6:	85 c0                	test   %eax,%eax
  3066a8:	75 15                	jne    3066bf <ready+0x45>
  3066aa:	8b 45 08             	mov    0x8(%ebp),%eax
  3066ad:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  3066b3:	8b 55 08             	mov    0x8(%ebp),%edx
  3066b6:	89 14 85 0c 26 31 00 	mov    %edx,0x31260c(,%eax,4)
  3066bd:	eb 19                	jmp    3066d8 <ready+0x5e>
  3066bf:	8b 45 08             	mov    0x8(%ebp),%eax
  3066c2:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  3066c8:	8b 04 85 18 26 31 00 	mov    0x312618(,%eax,4),%eax
  3066cf:	8b 55 08             	mov    0x8(%ebp),%edx
  3066d2:	89 90 b8 00 00 00    	mov    %edx,0xb8(%eax)
  3066d8:	8b 45 08             	mov    0x8(%ebp),%eax
  3066db:	c7 80 b8 00 00 00 00 	movl   $0x0,0xb8(%eax)
  3066e2:	00 00 00 
  3066e5:	8b 45 08             	mov    0x8(%ebp),%eax
  3066e8:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  3066ee:	8b 55 08             	mov    0x8(%ebp),%edx
  3066f1:	89 14 85 18 26 31 00 	mov    %edx,0x312618(,%eax,4)
  3066f8:	c9                   	leave  
  3066f9:	c3                   	ret    

003066fa <unready>:
  3066fa:	55                   	push   %ebp
  3066fb:	89 e5                	mov    %esp,%ebp
  3066fd:	83 ec 18             	sub    $0x18,%esp
  306700:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  306704:	75 10                	jne    306716 <unready+0x1c>
  306706:	83 ec 0c             	sub    $0xc,%esp
  306709:	68 ac d8 30 00       	push   $0x30d8ac
  30670e:	e8 79 ef ff ff       	call   30568c <panic>
  306713:	83 c4 10             	add    $0x10,%esp
  306716:	8b 45 08             	mov    0x8(%ebp),%eax
  306719:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  30671f:	8b 04 85 0c 26 31 00 	mov    0x31260c(,%eax,4),%eax
  306726:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306729:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  30672d:	0f 84 95 00 00 00    	je     3067c8 <unready+0xce>
  306733:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306736:	3b 45 08             	cmp    0x8(%ebp),%eax
  306739:	75 1b                	jne    306756 <unready+0x5c>
  30673b:	8b 45 08             	mov    0x8(%ebp),%eax
  30673e:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  306744:	8b 55 08             	mov    0x8(%ebp),%edx
  306747:	8b 92 b8 00 00 00    	mov    0xb8(%edx),%edx
  30674d:	89 14 85 0c 26 31 00 	mov    %edx,0x31260c(,%eax,4)
  306754:	eb 72                	jmp    3067c8 <unready+0xce>
  306756:	eb 22                	jmp    30677a <unready+0x80>
  306758:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30675b:	8b 80 b8 00 00 00    	mov    0xb8(%eax),%eax
  306761:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306764:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  306768:	75 10                	jne    30677a <unready+0x80>
  30676a:	83 ec 0c             	sub    $0xc,%esp
  30676d:	68 d0 d8 30 00       	push   $0x30d8d0
  306772:	e8 15 ef ff ff       	call   30568c <panic>
  306777:	83 c4 10             	add    $0x10,%esp
  30677a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30677d:	8b 80 b8 00 00 00    	mov    0xb8(%eax),%eax
  306783:	3b 45 08             	cmp    0x8(%ebp),%eax
  306786:	75 d0                	jne    306758 <unready+0x5e>
  306788:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30678b:	8b 80 b8 00 00 00    	mov    0xb8(%eax),%eax
  306791:	8b 90 b8 00 00 00    	mov    0xb8(%eax),%edx
  306797:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30679a:	89 90 b8 00 00 00    	mov    %edx,0xb8(%eax)
  3067a0:	8b 45 08             	mov    0x8(%ebp),%eax
  3067a3:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  3067a9:	8b 04 85 18 26 31 00 	mov    0x312618(,%eax,4),%eax
  3067b0:	3b 45 08             	cmp    0x8(%ebp),%eax
  3067b3:	75 13                	jne    3067c8 <unready+0xce>
  3067b5:	8b 45 08             	mov    0x8(%ebp),%eax
  3067b8:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  3067be:	8b 55 f4             	mov    -0xc(%ebp),%edx
  3067c1:	89 14 85 18 26 31 00 	mov    %edx,0x312618(,%eax,4)
  3067c8:	cd 81                	int    $0x81
  3067ca:	c9                   	leave  
  3067cb:	c3                   	ret    

003067cc <_sleep>:
  3067cc:	55                   	push   %ebp
  3067cd:	89 e5                	mov    %esp,%ebp
  3067cf:	83 ec 18             	sub    $0x18,%esp
  3067d2:	8b 45 08             	mov    0x8(%ebp),%eax
  3067d5:	c7 80 8c 00 00 00 01 	movl   $0x1,0x8c(%eax)
  3067dc:	00 00 00 
  3067df:	8b 45 08             	mov    0x8(%ebp),%eax
  3067e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3067e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3067e8:	83 ec 0c             	sub    $0xc,%esp
  3067eb:	50                   	push   %eax
  3067ec:	e8 09 ff ff ff       	call   3066fa <unready>
  3067f1:	83 c4 10             	add    $0x10,%esp
  3067f4:	c9                   	leave  
  3067f5:	c3                   	ret    

003067f6 <_wait>:
  3067f6:	55                   	push   %ebp
  3067f7:	89 e5                	mov    %esp,%ebp
  3067f9:	83 ec 18             	sub    $0x18,%esp
  3067fc:	8b 45 08             	mov    0x8(%ebp),%eax
  3067ff:	c7 80 8c 00 00 00 00 	movl   $0x0,0x8c(%eax)
  306806:	00 00 00 
  306809:	8b 45 08             	mov    0x8(%ebp),%eax
  30680c:	8b 55 0c             	mov    0xc(%ebp),%edx
  30680f:	89 90 84 00 00 00    	mov    %edx,0x84(%eax)
  306815:	8b 45 08             	mov    0x8(%ebp),%eax
  306818:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30681b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30681e:	83 ec 0c             	sub    $0xc,%esp
  306821:	50                   	push   %eax
  306822:	e8 d3 fe ff ff       	call   3066fa <unready>
  306827:	83 c4 10             	add    $0x10,%esp
  30682a:	c9                   	leave  
  30682b:	c3                   	ret    

0030682c <_wakeup>:
  30682c:	55                   	push   %ebp
  30682d:	89 e5                	mov    %esp,%ebp
  30682f:	83 ec 18             	sub    $0x18,%esp
  306832:	8b 45 08             	mov    0x8(%ebp),%eax
  306835:	c7 80 8c 00 00 00 02 	movl   $0x2,0x8c(%eax)
  30683c:	00 00 00 
  30683f:	8b 45 08             	mov    0x8(%ebp),%eax
  306842:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
  306849:	00 00 00 
  30684c:	8b 45 08             	mov    0x8(%ebp),%eax
  30684f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306852:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306855:	83 ec 0c             	sub    $0xc,%esp
  306858:	50                   	push   %eax
  306859:	e8 1c fe ff ff       	call   30667a <ready>
  30685e:	83 c4 10             	add    $0x10,%esp
  306861:	c9                   	leave  
  306862:	c3                   	ret    

00306863 <dohook>:
  306863:	55                   	push   %ebp
  306864:	89 e5                	mov    %esp,%ebp
  306866:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  30686a:	77 19                	ja     306885 <dohook+0x22>
  30686c:	a1 04 26 31 00       	mov    0x312604,%eax
  306871:	8b 55 08             	mov    0x8(%ebp),%edx
  306874:	8d 4a 10             	lea    0x10(%edx),%ecx
  306877:	8b 55 0c             	mov    0xc(%ebp),%edx
  30687a:	89 54 88 04          	mov    %edx,0x4(%eax,%ecx,4)
  30687e:	b8 00 00 00 00       	mov    $0x0,%eax
  306883:	eb 05                	jmp    30688a <dohook+0x27>
  306885:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
  30688a:	5d                   	pop    %ebp
  30688b:	c3                   	ret    

0030688c <dofn>:
  30688c:	55                   	push   %ebp
  30688d:	89 e5                	mov    %esp,%ebp
  30688f:	83 ec 18             	sub    $0x18,%esp
  306892:	8b 45 08             	mov    0x8(%ebp),%eax
  306895:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306898:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  30689c:	7f 18                	jg     3068b6 <dofn+0x2a>
  30689e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3068a2:	78 12                	js     3068b6 <dofn+0x2a>
  3068a4:	a1 04 26 31 00       	mov    0x312604,%eax
  3068a9:	8b 55 08             	mov    0x8(%ebp),%edx
  3068ac:	83 c2 08             	add    $0x8,%edx
  3068af:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  3068b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3068b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3068b9:	8b 04 85 80 42 31 00 	mov    0x314280(,%eax,4),%eax
  3068c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3068c3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  3068c7:	75 0a                	jne    3068d3 <dofn+0x47>
  3068c9:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
  3068ce:	e9 b8 00 00 00       	jmp    30698b <dofn+0xff>
  3068d3:	a1 04 26 31 00       	mov    0x312604,%eax
  3068d8:	8b 55 0c             	mov    0xc(%ebp),%edx
  3068db:	89 50 34             	mov    %edx,0x34(%eax)
  3068de:	a1 04 26 31 00       	mov    0x312604,%eax
  3068e3:	8b 55 10             	mov    0x10(%ebp),%edx
  3068e6:	89 50 38             	mov    %edx,0x38(%eax)
  3068e9:	a1 04 26 31 00       	mov    0x312604,%eax
  3068ee:	8b 55 14             	mov    0x14(%ebp),%edx
  3068f1:	89 50 3c             	mov    %edx,0x3c(%eax)
  3068f4:	a1 04 26 31 00       	mov    0x312604,%eax
  3068f9:	8b 55 18             	mov    0x18(%ebp),%edx
  3068fc:	89 50 40             	mov    %edx,0x40(%eax)
  3068ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306902:	8b 80 90 00 00 00    	mov    0x90(%eax),%eax
  306908:	85 c0                	test   %eax,%eax
  30690a:	75 11                	jne    30691d <dofn+0x91>
  30690c:	8b 15 04 26 31 00    	mov    0x312604,%edx
  306912:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306915:	89 90 90 00 00 00    	mov    %edx,0x90(%eax)
  30691b:	eb 15                	jmp    306932 <dofn+0xa6>
  30691d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306920:	8b 80 98 00 00 00    	mov    0x98(%eax),%eax
  306926:	8b 15 04 26 31 00    	mov    0x312604,%edx
  30692c:	89 90 94 00 00 00    	mov    %edx,0x94(%eax)
  306932:	a1 04 26 31 00       	mov    0x312604,%eax
  306937:	c7 80 94 00 00 00 00 	movl   $0x0,0x94(%eax)
  30693e:	00 00 00 
  306941:	8b 15 04 26 31 00    	mov    0x312604,%edx
  306947:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30694a:	89 90 98 00 00 00    	mov    %edx,0x98(%eax)
  306950:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306953:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
  306959:	83 f8 01             	cmp    $0x1,%eax
  30695c:	75 0e                	jne    30696c <dofn+0xe0>
  30695e:	83 ec 0c             	sub    $0xc,%esp
  306961:	ff 75 f0             	pushl  -0x10(%ebp)
  306964:	e8 c3 fe ff ff       	call   30682c <_wakeup>
  306969:	83 c4 10             	add    $0x10,%esp
  30696c:	a1 04 26 31 00       	mov    0x312604,%eax
  306971:	83 ec 08             	sub    $0x8,%esp
  306974:	ff 75 f0             	pushl  -0x10(%ebp)
  306977:	50                   	push   %eax
  306978:	e8 79 fe ff ff       	call   3067f6 <_wait>
  30697d:	83 c4 10             	add    $0x10,%esp
  306980:	a1 04 26 31 00       	mov    0x312604,%eax
  306985:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
  30698b:	c9                   	leave  
  30698c:	c3                   	ret    

0030698d <doint>:
  30698d:	55                   	push   %ebp
  30698e:	89 e5                	mov    %esp,%ebp
  306990:	83 ec 18             	sub    $0x18,%esp
  306993:	8b 45 08             	mov    0x8(%ebp),%eax
  306996:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306999:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  30699d:	7f 18                	jg     3069b7 <doint+0x2a>
  30699f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3069a3:	78 12                	js     3069b7 <doint+0x2a>
  3069a5:	a1 04 26 31 00       	mov    0x312604,%eax
  3069aa:	8b 55 08             	mov    0x8(%ebp),%edx
  3069ad:	83 c2 08             	add    $0x8,%edx
  3069b0:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  3069b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3069b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3069ba:	8b 04 85 80 42 31 00 	mov    0x314280(,%eax,4),%eax
  3069c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3069c4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  3069c8:	75 10                	jne    3069da <doint+0x4d>
  3069ca:	83 ec 0c             	sub    $0xc,%esp
  3069cd:	68 f1 d8 30 00       	push   $0x30d8f1
  3069d2:	e8 b5 ec ff ff       	call   30568c <panic>
  3069d7:	83 c4 10             	add    $0x10,%esp
  3069da:	83 ec 0c             	sub    $0xc,%esp
  3069dd:	6a 18                	push   $0x18
  3069df:	e8 9f 12 00 00       	call   307c83 <kalloc>
  3069e4:	83 c4 10             	add    $0x10,%esp
  3069e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3069ea:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  3069ee:	75 10                	jne    306a00 <doint+0x73>
  3069f0:	83 ec 0c             	sub    $0xc,%esp
  3069f3:	68 09 d9 30 00       	push   $0x30d909
  3069f8:	e8 8f ec ff ff       	call   30568c <panic>
  3069fd:	83 c4 10             	add    $0x10,%esp
  306a00:	8b 55 0c             	mov    0xc(%ebp),%edx
  306a03:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a06:	89 50 04             	mov    %edx,0x4(%eax)
  306a09:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a0c:	8b 55 10             	mov    0x10(%ebp),%edx
  306a0f:	89 50 08             	mov    %edx,0x8(%eax)
  306a12:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a15:	8b 55 14             	mov    0x14(%ebp),%edx
  306a18:	89 50 0c             	mov    %edx,0xc(%eax)
  306a1b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a1e:	8b 55 18             	mov    0x18(%ebp),%edx
  306a21:	89 50 10             	mov    %edx,0x10(%eax)
  306a24:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a27:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  306a2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306a31:	8b 80 9c 00 00 00    	mov    0x9c(%eax),%eax
  306a37:	85 c0                	test   %eax,%eax
  306a39:	74 0f                	je     306a4a <doint+0xbd>
  306a3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306a3e:	8b 90 9c 00 00 00    	mov    0x9c(%eax),%edx
  306a44:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a47:	89 50 14             	mov    %edx,0x14(%eax)
  306a4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306a4d:	8b 55 ec             	mov    -0x14(%ebp),%edx
  306a50:	89 90 9c 00 00 00    	mov    %edx,0x9c(%eax)
  306a56:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306a59:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
  306a5f:	83 f8 01             	cmp    $0x1,%eax
  306a62:	75 0e                	jne    306a72 <doint+0xe5>
  306a64:	83 ec 0c             	sub    $0xc,%esp
  306a67:	ff 75 f0             	pushl  -0x10(%ebp)
  306a6a:	e8 bd fd ff ff       	call   30682c <_wakeup>
  306a6f:	83 c4 10             	add    $0x10,%esp
  306a72:	b8 00 00 00 00       	mov    $0x0,%eax
  306a77:	c9                   	leave  
  306a78:	c3                   	ret    

00306a79 <doret>:
  306a79:	55                   	push   %ebp
  306a7a:	89 e5                	mov    %esp,%ebp
  306a7c:	83 ec 18             	sub    $0x18,%esp
  306a7f:	8b 45 08             	mov    0x8(%ebp),%eax
  306a82:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306a85:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  306a89:	7f 18                	jg     306aa3 <doret+0x2a>
  306a8b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  306a8f:	78 12                	js     306aa3 <doret+0x2a>
  306a91:	a1 04 26 31 00       	mov    0x312604,%eax
  306a96:	8b 55 08             	mov    0x8(%ebp),%edx
  306a99:	83 c2 08             	add    $0x8,%edx
  306a9c:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  306aa0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306aa3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306aa6:	8b 04 85 80 42 31 00 	mov    0x314280(,%eax,4),%eax
  306aad:	89 45 f0             	mov    %eax,-0x10(%ebp)
  306ab0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  306ab4:	74 2c                	je     306ae2 <doret+0x69>
  306ab6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306ab9:	8b 90 84 00 00 00    	mov    0x84(%eax),%edx
  306abf:	a1 04 26 31 00       	mov    0x312604,%eax
  306ac4:	39 c2                	cmp    %eax,%edx
  306ac6:	75 1a                	jne    306ae2 <doret+0x69>
  306ac8:	8b 55 0c             	mov    0xc(%ebp),%edx
  306acb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306ace:	89 90 88 00 00 00    	mov    %edx,0x88(%eax)
  306ad4:	83 ec 0c             	sub    $0xc,%esp
  306ad7:	ff 75 f0             	pushl  -0x10(%ebp)
  306ada:	e8 4d fd ff ff       	call   30682c <_wakeup>
  306adf:	83 c4 10             	add    $0x10,%esp
  306ae2:	b8 00 00 00 00       	mov    $0x0,%eax
  306ae7:	c9                   	leave  
  306ae8:	c3                   	ret    

00306ae9 <doloop>:
  306ae9:	55                   	push   %ebp
  306aea:	89 e5                	mov    %esp,%ebp
  306aec:	57                   	push   %edi
  306aed:	56                   	push   %esi
  306aee:	53                   	push   %ebx
  306aef:	83 ec 2c             	sub    $0x2c,%esp
  306af2:	a1 04 26 31 00       	mov    0x312604,%eax
  306af7:	8b 80 9c 00 00 00    	mov    0x9c(%eax),%eax
  306afd:	85 c0                	test   %eax,%eax
  306aff:	74 5c                	je     306b5d <doloop+0x74>
  306b01:	a1 04 26 31 00       	mov    0x312604,%eax
  306b06:	8b 80 9c 00 00 00    	mov    0x9c(%eax),%eax
  306b0c:	89 45 cc             	mov    %eax,-0x34(%ebp)
  306b0f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  306b16:	8b 45 cc             	mov    -0x34(%ebp),%eax
  306b19:	8b 40 04             	mov    0x4(%eax),%eax
  306b1c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  306b1f:	8b 45 cc             	mov    -0x34(%ebp),%eax
  306b22:	8b 40 08             	mov    0x8(%eax),%eax
  306b25:	89 45 e0             	mov    %eax,-0x20(%ebp)
  306b28:	8b 45 cc             	mov    -0x34(%ebp),%eax
  306b2b:	8b 40 0c             	mov    0xc(%eax),%eax
  306b2e:	89 45 dc             	mov    %eax,-0x24(%ebp)
  306b31:	8b 45 cc             	mov    -0x34(%ebp),%eax
  306b34:	8b 40 10             	mov    0x10(%eax),%eax
  306b37:	89 45 d8             	mov    %eax,-0x28(%ebp)
  306b3a:	a1 04 26 31 00       	mov    0x312604,%eax
  306b3f:	8b 55 cc             	mov    -0x34(%ebp),%edx
  306b42:	8b 52 14             	mov    0x14(%edx),%edx
  306b45:	89 90 9c 00 00 00    	mov    %edx,0x9c(%eax)
  306b4b:	83 ec 08             	sub    $0x8,%esp
  306b4e:	6a 00                	push   $0x0
  306b50:	ff 75 cc             	pushl  -0x34(%ebp)
  306b53:	e8 97 12 00 00       	call   307def <kfree_s>
  306b58:	83 c4 10             	add    $0x10,%esp
  306b5b:	eb 75                	jmp    306bd2 <doloop+0xe9>
  306b5d:	a1 04 26 31 00       	mov    0x312604,%eax
  306b62:	8b 80 90 00 00 00    	mov    0x90(%eax),%eax
  306b68:	85 c0                	test   %eax,%eax
  306b6a:	74 50                	je     306bbc <doloop+0xd3>
  306b6c:	a1 04 26 31 00       	mov    0x312604,%eax
  306b71:	8b 80 90 00 00 00    	mov    0x90(%eax),%eax
  306b77:	89 45 d0             	mov    %eax,-0x30(%ebp)
  306b7a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  306b7d:	8b 00                	mov    (%eax),%eax
  306b7f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  306b82:	8b 45 d0             	mov    -0x30(%ebp),%eax
  306b85:	8b 40 34             	mov    0x34(%eax),%eax
  306b88:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  306b8b:	8b 45 d0             	mov    -0x30(%ebp),%eax
  306b8e:	8b 40 38             	mov    0x38(%eax),%eax
  306b91:	89 45 e0             	mov    %eax,-0x20(%ebp)
  306b94:	8b 45 d0             	mov    -0x30(%ebp),%eax
  306b97:	8b 40 3c             	mov    0x3c(%eax),%eax
  306b9a:	89 45 dc             	mov    %eax,-0x24(%ebp)
  306b9d:	8b 45 d0             	mov    -0x30(%ebp),%eax
  306ba0:	8b 40 40             	mov    0x40(%eax),%eax
  306ba3:	89 45 d8             	mov    %eax,-0x28(%ebp)
  306ba6:	a1 04 26 31 00       	mov    0x312604,%eax
  306bab:	8b 55 d0             	mov    -0x30(%ebp),%edx
  306bae:	8b 92 94 00 00 00    	mov    0x94(%edx),%edx
  306bb4:	89 90 90 00 00 00    	mov    %edx,0x90(%eax)
  306bba:	eb 16                	jmp    306bd2 <doloop+0xe9>
  306bbc:	a1 04 26 31 00       	mov    0x312604,%eax
  306bc1:	83 ec 0c             	sub    $0xc,%esp
  306bc4:	50                   	push   %eax
  306bc5:	e8 02 fc ff ff       	call   3067cc <_sleep>
  306bca:	83 c4 10             	add    $0x10,%esp
  306bcd:	e9 20 ff ff ff       	jmp    306af2 <doloop+0x9>
  306bd2:	a1 04 26 31 00       	mov    0x312604,%eax
  306bd7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  306bda:	83 c2 10             	add    $0x10,%edx
  306bdd:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  306be1:	85 c0                	test   %eax,%eax
  306be3:	75 15                	jne    306bfa <doloop+0x111>
  306be5:	83 ec 08             	sub    $0x8,%esp
  306be8:	6a da                	push   $0xffffffda
  306bea:	ff 75 d4             	pushl  -0x2c(%ebp)
  306bed:	e8 16 f9 ff ff       	call   306508 <ret>
  306bf2:	83 c4 10             	add    $0x10,%esp
  306bf5:	e9 f8 fe ff ff       	jmp    306af2 <doloop+0x9>
  306bfa:	a1 04 26 31 00       	mov    0x312604,%eax
  306bff:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  306c02:	83 c2 10             	add    $0x10,%edx
  306c05:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  306c09:	89 45 c8             	mov    %eax,-0x38(%ebp)
  306c0c:	8b 45 c8             	mov    -0x38(%ebp),%eax
  306c0f:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
  306c12:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  306c15:	8b 55 dc             	mov    -0x24(%ebp),%edx
  306c18:	8b 75 d8             	mov    -0x28(%ebp),%esi
  306c1b:	89 f7                	mov    %esi,%edi
  306c1d:	c9                   	leave  
  306c1e:	c3                   	ret    
  306c1f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  306c22:	5b                   	pop    %ebx
  306c23:	5e                   	pop    %esi
  306c24:	5f                   	pop    %edi
  306c25:	5d                   	pop    %ebp
  306c26:	c3                   	ret    

00306c27 <gam>:
  306c27:	55                   	push   %ebp
  306c28:	89 e5                	mov    %esp,%ebp
  306c2a:	8b 45 08             	mov    0x8(%ebp),%eax
  306c2d:	c7 40 28 06 00 00 00 	movl   $0x6,0x28(%eax)
  306c34:	8b 45 08             	mov    0x8(%ebp),%eax
  306c37:	c7 40 2c 06 00 00 00 	movl   $0x6,0x2c(%eax)
  306c3e:	8b 45 08             	mov    0x8(%ebp),%eax
  306c41:	c7 40 30 06 00 00 00 	movl   $0x6,0x30(%eax)
  306c48:	5d                   	pop    %ebp
  306c49:	c3                   	ret    

00306c4a <make_task>:
  306c4a:	55                   	push   %ebp
  306c4b:	89 e5                	mov    %esp,%ebp
  306c4d:	57                   	push   %edi
  306c4e:	53                   	push   %ebx
  306c4f:	83 ec 50             	sub    $0x50,%esp
  306c52:	e8 fe 05 00 00       	call   307255 <get_kfree_page>
  306c57:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306c5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c5d:	8b 55 08             	mov    0x8(%ebp),%edx
  306c60:	89 10                	mov    %edx,(%eax)
  306c62:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c65:	8b 55 18             	mov    0x18(%ebp),%edx
  306c68:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
  306c6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c71:	c7 80 a4 00 00 00 14 	movl   $0x14,0xa4(%eax)
  306c78:	00 00 00 
  306c7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c7e:	c7 80 a8 00 00 00 14 	movl   $0x14,0xa8(%eax)
  306c85:	00 00 00 
  306c88:	0f 20 d8             	mov    %cr3,%eax
  306c8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  306c8e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  306c91:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c94:	89 90 b4 00 00 00    	mov    %edx,0xb4(%eax)
  306c9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c9d:	8d 90 bc 0f 00 00    	lea    0xfbc(%eax),%edx
  306ca3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306ca6:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
  306cac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306caf:	83 c0 18             	add    $0x18,%eax
  306cb2:	83 ec 08             	sub    $0x8,%esp
  306cb5:	ff 75 0c             	pushl  0xc(%ebp)
  306cb8:	50                   	push   %eax
  306cb9:	e8 7d f8 ff ff       	call   30653b <strcpy>
  306cbe:	83 c4 10             	add    $0x10,%esp
  306cc1:	8d 5d ac             	lea    -0x54(%ebp),%ebx
  306cc4:	b8 00 00 00 00       	mov    $0x0,%eax
  306cc9:	ba 11 00 00 00       	mov    $0x11,%edx
  306cce:	89 df                	mov    %ebx,%edi
  306cd0:	89 d1                	mov    %edx,%ecx
  306cd2:	f3 ab                	rep stos %eax,%es:(%edi)
  306cd4:	8b 45 10             	mov    0x10(%ebp),%eax
  306cd7:	89 45 ac             	mov    %eax,-0x54(%ebp)
  306cda:	8b 45 10             	mov    0x10(%ebp),%eax
  306cdd:	89 45 b0             	mov    %eax,-0x50(%ebp)
  306ce0:	8b 45 10             	mov    0x10(%ebp),%eax
  306ce3:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  306ce6:	8b 45 10             	mov    0x10(%ebp),%eax
  306ce9:	89 45 b8             	mov    %eax,-0x48(%ebp)
  306cec:	8b 45 1c             	mov    0x1c(%ebp),%eax
  306cef:	89 45 dc             	mov    %eax,-0x24(%ebp)
  306cf2:	8b 45 14             	mov    0x14(%ebp),%eax
  306cf5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  306cf8:	c7 45 e4 00 02 00 00 	movl   $0x200,-0x1c(%ebp)
  306cff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306d02:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
  306d08:	83 ec 04             	sub    $0x4,%esp
  306d0b:	6a 44                	push   $0x44
  306d0d:	8d 55 ac             	lea    -0x54(%ebp),%edx
  306d10:	52                   	push   %edx
  306d11:	50                   	push   %eax
  306d12:	e8 41 f8 ff ff       	call   306558 <memcpy>
  306d17:	83 c4 10             	add    $0x10,%esp
  306d1a:	8b 45 08             	mov    0x8(%ebp),%eax
  306d1d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  306d20:	89 14 85 80 42 31 00 	mov    %edx,0x314280(,%eax,4)
  306d27:	83 ec 0c             	sub    $0xc,%esp
  306d2a:	ff 75 f4             	pushl  -0xc(%ebp)
  306d2d:	e8 f5 fe ff ff       	call   306c27 <gam>
  306d32:	83 c4 10             	add    $0x10,%esp
  306d35:	83 ec 0c             	sub    $0xc,%esp
  306d38:	ff 75 f4             	pushl  -0xc(%ebp)
  306d3b:	e8 3a f9 ff ff       	call   30667a <ready>
  306d40:	83 c4 10             	add    $0x10,%esp
  306d43:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306d46:	8d 65 f8             	lea    -0x8(%ebp),%esp
  306d49:	5b                   	pop    %ebx
  306d4a:	5f                   	pop    %edi
  306d4b:	5d                   	pop    %ebp
  306d4c:	c3                   	ret    

00306d4d <god_init>:
  306d4d:	55                   	push   %ebp
  306d4e:	89 e5                	mov    %esp,%ebp
  306d50:	83 ec 18             	sub    $0x18,%esp
  306d53:	c7 45 f0 38 00 00 00 	movl   $0x38,-0x10(%ebp)
  306d5a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  306d61:	eb 26                	jmp    306d89 <god_init+0x3c>
  306d63:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306d66:	c7 04 85 18 26 31 00 	movl   $0x0,0x312618(,%eax,4)
  306d6d:	00 00 00 00 
  306d71:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306d74:	8b 14 85 18 26 31 00 	mov    0x312618(,%eax,4),%edx
  306d7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306d7e:	89 14 85 0c 26 31 00 	mov    %edx,0x31260c(,%eax,4)
  306d85:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  306d89:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  306d8d:	7e d4                	jle    306d63 <god_init+0x16>
  306d8f:	83 ec 08             	sub    $0x8,%esp
  306d92:	6a 00                	push   $0x0
  306d94:	6a 02                	push   $0x2
  306d96:	6a 08                	push   $0x8
  306d98:	6a 10                	push   $0x10
  306d9a:	68 25 d9 30 00       	push   $0x30d925
  306d9f:	6a 00                	push   $0x0
  306da1:	e8 a4 fe ff ff       	call   306c4a <make_task>
  306da6:	83 c4 20             	add    $0x20,%esp
  306da9:	a3 04 26 31 00       	mov    %eax,0x312604
  306dae:	a1 04 26 31 00       	mov    0x312604,%eax
  306db3:	8b 15 04 26 31 00    	mov    0x312604,%edx
  306db9:	89 90 b8 00 00 00    	mov    %edx,0xb8(%eax)
  306dbf:	83 ec 08             	sub    $0x8,%esp
  306dc2:	68 ae 8d 30 00       	push   $0x308dae
  306dc7:	6a 00                	push   $0x0
  306dc9:	6a 08                	push   $0x8
  306dcb:	6a 10                	push   $0x10
  306dcd:	68 29 d9 30 00       	push   $0x30d929
  306dd2:	6a 03                	push   $0x3
  306dd4:	e8 71 fe ff ff       	call   306c4a <make_task>
  306dd9:	83 c4 20             	add    $0x20,%esp
  306ddc:	c7 05 24 26 31 00 00 	movl   $0x200800,0x312624
  306de3:	08 20 00 
  306de6:	a1 24 26 31 00       	mov    0x312624,%eax
  306deb:	c7 40 08 10 00 00 00 	movl   $0x10,0x8(%eax)
  306df2:	a1 24 26 31 00       	mov    0x312624,%eax
  306df7:	8b 15 04 26 31 00    	mov    0x312604,%edx
  306dfd:	81 c2 00 10 00 00    	add    $0x1000,%edx
  306e03:	89 50 04             	mov    %edx,0x4(%eax)
  306e06:	a1 24 26 31 00       	mov    0x312624,%eax
  306e0b:	c7 40 60 00 00 00 00 	movl   $0x0,0x60(%eax)
  306e12:	a1 24 26 31 00       	mov    0x312624,%eax
  306e17:	c7 40 64 00 00 ff ff 	movl   $0xffff0000,0x64(%eax)
  306e1e:	a1 24 26 31 00       	mov    0x312624,%eax
  306e23:	c7 40 24 00 02 00 00 	movl   $0x200,0x24(%eax)
  306e2a:	0f 00 5d f0          	ltr    -0x10(%ebp)
  306e2e:	cd 81                	int    $0x81
  306e30:	c9                   	leave  
  306e31:	c3                   	ret    
  306e32:	66 90                	xchg   %ax,%ax

00306e34 <ret>:
  306e34:	55                   	push   %ebp
  306e35:	89 e5                	mov    %esp,%ebp
  306e37:	57                   	push   %edi
  306e38:	56                   	push   %esi
  306e39:	53                   	push   %ebx
  306e3a:	83 ec 10             	sub    $0x10,%esp
  306e3d:	b8 02 00 00 00       	mov    $0x2,%eax
  306e42:	8b 5d 08             	mov    0x8(%ebp),%ebx
  306e45:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  306e48:	ba 00 00 00 00       	mov    $0x0,%edx
  306e4d:	be 00 00 00 00       	mov    $0x0,%esi
  306e52:	bf 00 00 00 00       	mov    $0x0,%edi
  306e57:	cd 80                	int    $0x80
  306e59:	89 45 f0             	mov    %eax,-0x10(%ebp)
  306e5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306e5f:	83 c4 10             	add    $0x10,%esp
  306e62:	5b                   	pop    %ebx
  306e63:	5e                   	pop    %esi
  306e64:	5f                   	pop    %edi
  306e65:	5d                   	pop    %ebp
  306e66:	c3                   	ret    

00306e67 <strlen>:
  306e67:	55                   	push   %ebp
  306e68:	89 e5                	mov    %esp,%ebp
  306e6a:	57                   	push   %edi
  306e6b:	8b 55 08             	mov    0x8(%ebp),%edx
  306e6e:	b8 00 00 00 00       	mov    $0x0,%eax
  306e73:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  306e78:	89 d7                	mov    %edx,%edi
  306e7a:	fc                   	cld    
  306e7b:	f2 ae                	repnz scas %es:(%edi),%al
  306e7d:	f7 d1                	not    %ecx
  306e7f:	49                   	dec    %ecx
  306e80:	89 c8                	mov    %ecx,%eax
  306e82:	5f                   	pop    %edi
  306e83:	5d                   	pop    %ebp
  306e84:	c3                   	ret    

00306e85 <memcpy>:
  306e85:	55                   	push   %ebp
  306e86:	89 e5                	mov    %esp,%ebp
  306e88:	57                   	push   %edi
  306e89:	56                   	push   %esi
  306e8a:	53                   	push   %ebx
  306e8b:	8b 45 10             	mov    0x10(%ebp),%eax
  306e8e:	8b 55 0c             	mov    0xc(%ebp),%edx
  306e91:	8b 5d 08             	mov    0x8(%ebp),%ebx
  306e94:	89 c1                	mov    %eax,%ecx
  306e96:	89 d6                	mov    %edx,%esi
  306e98:	89 df                	mov    %ebx,%edi
  306e9a:	fc                   	cld    
  306e9b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  306e9d:	8b 45 08             	mov    0x8(%ebp),%eax
  306ea0:	5b                   	pop    %ebx
  306ea1:	5e                   	pop    %esi
  306ea2:	5f                   	pop    %edi
  306ea3:	5d                   	pop    %ebp
  306ea4:	c3                   	ret    

00306ea5 <system_shell>:
  306ea5:	55                   	push   %ebp
  306ea6:	89 e5                	mov    %esp,%ebp
  306ea8:	57                   	push   %edi
  306ea9:	56                   	push   %esi
  306eaa:	53                   	push   %ebx
  306eab:	83 ec 1c             	sub    $0x1c,%esp
  306eae:	b8 01 00 00 00       	mov    $0x1,%eax
  306eb3:	bb 04 00 00 00       	mov    $0x4,%ebx
  306eb8:	b9 01 00 00 00       	mov    $0x1,%ecx
  306ebd:	ba 01 00 00 00       	mov    $0x1,%edx
  306ec2:	be 00 00 00 00       	mov    $0x0,%esi
  306ec7:	bf 00 00 00 00       	mov    $0x0,%edi
  306ecc:	cd 80                	int    $0x80
  306ece:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  306ed1:	83 ec 04             	sub    $0x4,%esp
  306ed4:	6a 00                	push   $0x0
  306ed6:	6a 00                	push   $0x0
  306ed8:	68 68 d9 30 00       	push   $0x30d968
  306edd:	e8 e5 5b 00 00       	call   30cac7 <exec>
  306ee2:	83 c4 10             	add    $0x10,%esp
  306ee5:	8d 65 f4             	lea    -0xc(%ebp),%esp
  306ee8:	5b                   	pop    %ebx
  306ee9:	5e                   	pop    %esi
  306eea:	5f                   	pop    %edi
  306eeb:	5d                   	pop    %ebp
  306eec:	c3                   	ret    

00306eed <system_dup2>:
  306eed:	55                   	push   %ebp
  306eee:	89 e5                	mov    %esp,%ebp
  306ef0:	83 ec 10             	sub    $0x10,%esp
  306ef3:	8b 45 08             	mov    0x8(%ebp),%eax
  306ef6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  306ef9:	83 7d fc 02          	cmpl   $0x2,-0x4(%ebp)
  306efd:	7f 18                	jg     306f17 <system_dup2+0x2a>
  306eff:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  306f03:	78 12                	js     306f17 <system_dup2+0x2a>
  306f05:	a1 04 26 31 00       	mov    0x312604,%eax
  306f0a:	8b 55 08             	mov    0x8(%ebp),%edx
  306f0d:	83 c2 08             	add    $0x8,%edx
  306f10:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  306f14:	89 45 fc             	mov    %eax,-0x4(%ebp)
  306f17:	8b 45 fc             	mov    -0x4(%ebp),%eax
  306f1a:	8b 04 85 80 42 31 00 	mov    0x314280(,%eax,4),%eax
  306f21:	89 45 f8             	mov    %eax,-0x8(%ebp)
  306f24:	8b 45 f8             	mov    -0x8(%ebp),%eax
  306f27:	8b 40 38             	mov    0x38(%eax),%eax
  306f2a:	83 f8 02             	cmp    $0x2,%eax
  306f2d:	77 1d                	ja     306f4c <system_dup2+0x5f>
  306f2f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  306f32:	8b 55 0c             	mov    0xc(%ebp),%edx
  306f35:	8d 4a 08             	lea    0x8(%edx),%ecx
  306f38:	8b 55 10             	mov    0x10(%ebp),%edx
  306f3b:	89 54 88 08          	mov    %edx,0x8(%eax,%ecx,4)
  306f3f:	6a 00                	push   $0x0
  306f41:	ff 75 08             	pushl  0x8(%ebp)
  306f44:	e8 eb fe ff ff       	call   306e34 <ret>
  306f49:	83 c4 08             	add    $0x8,%esp
  306f4c:	6a ff                	push   $0xffffffff
  306f4e:	ff 75 08             	pushl  0x8(%ebp)
  306f51:	e8 de fe ff ff       	call   306e34 <ret>
  306f56:	83 c4 08             	add    $0x8,%esp
  306f59:	c9                   	leave  
  306f5a:	c3                   	ret    

00306f5b <system_pri>:
  306f5b:	55                   	push   %ebp
  306f5c:	89 e5                	mov    %esp,%ebp
  306f5e:	83 ec 10             	sub    $0x10,%esp
  306f61:	8b 45 08             	mov    0x8(%ebp),%eax
  306f64:	89 45 fc             	mov    %eax,-0x4(%ebp)
  306f67:	8b 45 fc             	mov    -0x4(%ebp),%eax
  306f6a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  306f6d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  306f70:	8b 55 0c             	mov    0xc(%ebp),%edx
  306f73:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
  306f79:	6a 00                	push   $0x0
  306f7b:	ff 75 08             	pushl  0x8(%ebp)
  306f7e:	e8 b1 fe ff ff       	call   306e34 <ret>
  306f83:	83 c4 08             	add    $0x8,%esp
  306f86:	c9                   	leave  
  306f87:	c3                   	ret    

00306f88 <system_init>:
  306f88:	55                   	push   %ebp
  306f89:	89 e5                	mov    %esp,%ebp
  306f8b:	57                   	push   %edi
  306f8c:	56                   	push   %esi
  306f8d:	53                   	push   %ebx
  306f8e:	83 ec 10             	sub    $0x10,%esp
  306f91:	b8 03 00 00 00       	mov    $0x3,%eax
  306f96:	bb 09 00 00 00       	mov    $0x9,%ebx
  306f9b:	b9 ed 6e 30 00       	mov    $0x306eed,%ecx
  306fa0:	ba 00 00 00 00       	mov    $0x0,%edx
  306fa5:	be 00 00 00 00       	mov    $0x0,%esi
  306faa:	bf 00 00 00 00       	mov    $0x0,%edi
  306faf:	cd 80                	int    $0x80
  306fb1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  306fb4:	b8 03 00 00 00       	mov    $0x3,%eax
  306fb9:	bb 01 00 00 00       	mov    $0x1,%ebx
  306fbe:	b9 5b 6f 30 00       	mov    $0x306f5b,%ecx
  306fc3:	ba 00 00 00 00       	mov    $0x0,%edx
  306fc8:	be 00 00 00 00       	mov    $0x0,%esi
  306fcd:	bf 00 00 00 00       	mov    $0x0,%edi
  306fd2:	cd 80                	int    $0x80
  306fd4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  306fd7:	83 c4 10             	add    $0x10,%esp
  306fda:	5b                   	pop    %ebx
  306fdb:	5e                   	pop    %esi
  306fdc:	5f                   	pop    %edi
  306fdd:	5d                   	pop    %ebp
  306fde:	c3                   	ret    

00306fdf <system_main>:
  306fdf:	55                   	push   %ebp
  306fe0:	89 e5                	mov    %esp,%ebp
  306fe2:	57                   	push   %edi
  306fe3:	56                   	push   %esi
  306fe4:	53                   	push   %ebx
  306fe5:	83 ec 1c             	sub    $0x1c,%esp
  306fe8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  306fef:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  306ff6:	e8 8d ff ff ff       	call   306f88 <system_init>
  306ffb:	e8 ec 5c 00 00       	call   30ccec <fork>
  307000:	89 45 e0             	mov    %eax,-0x20(%ebp)
  307003:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  307007:	79 12                	jns    30701b <system_main+0x3c>
  307009:	83 ec 0c             	sub    $0xc,%esp
  30700c:	68 72 d9 30 00       	push   $0x30d972
  307011:	e8 92 e6 ff ff       	call   3056a8 <printk>
  307016:	83 c4 10             	add    $0x10,%esp
  307019:	eb 5a                	jmp    307075 <system_main+0x96>
  30701b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  30701f:	75 48                	jne    307069 <system_main+0x8a>
  307021:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  307024:	8b 04 c5 80 20 31 00 	mov    0x312080(,%eax,8),%eax
  30702b:	83 ec 0c             	sub    $0xc,%esp
  30702e:	50                   	push   %eax
  30702f:	e8 33 fe ff ff       	call   306e67 <strlen>
  307034:	83 c4 10             	add    $0x10,%esp
  307037:	8d 48 01             	lea    0x1(%eax),%ecx
  30703a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30703d:	8b 04 c5 80 20 31 00 	mov    0x312080(,%eax,8),%eax
  307044:	8b 15 04 26 31 00    	mov    0x312604,%edx
  30704a:	83 c2 18             	add    $0x18,%edx
  30704d:	83 ec 04             	sub    $0x4,%esp
  307050:	51                   	push   %ecx
  307051:	50                   	push   %eax
  307052:	52                   	push   %edx
  307053:	e8 2d fe ff ff       	call   306e85 <memcpy>
  307058:	83 c4 10             	add    $0x10,%esp
  30705b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30705e:	8b 04 c5 84 20 31 00 	mov    0x312084(,%eax,8),%eax
  307065:	ff d0                	call   *%eax
  307067:	eb 0c                	jmp    307075 <system_main+0x96>
  307069:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  30706d:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
  307071:	77 02                	ja     307075 <system_main+0x96>
  307073:	eb 86                	jmp    306ffb <system_main+0x1c>
  307075:	b8 00 00 00 00       	mov    $0x0,%eax
  30707a:	bb 00 00 00 00       	mov    $0x0,%ebx
  30707f:	b9 00 00 00 00       	mov    $0x0,%ecx
  307084:	ba 00 00 00 00       	mov    $0x0,%edx
  307089:	be 00 00 00 00       	mov    $0x0,%esi
  30708e:	bf 00 00 00 00       	mov    $0x0,%edi
  307093:	cd 80                	int    $0x80
  307095:	89 45 dc             	mov    %eax,-0x24(%ebp)
  307098:	b8 00 00 00 00       	mov    $0x0,%eax
  30709d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3070a0:	5b                   	pop    %ebx
  3070a1:	5e                   	pop    %esi
  3070a2:	5f                   	pop    %edi
  3070a3:	5d                   	pop    %ebp
  3070a4:	c3                   	ret    
  3070a5:	66 90                	xchg   %ax,%ax
  3070a7:	90                   	nop

003070a8 <memcpy>:
  3070a8:	55                   	push   %ebp
  3070a9:	89 e5                	mov    %esp,%ebp
  3070ab:	57                   	push   %edi
  3070ac:	56                   	push   %esi
  3070ad:	53                   	push   %ebx
  3070ae:	8b 45 10             	mov    0x10(%ebp),%eax
  3070b1:	8b 55 0c             	mov    0xc(%ebp),%edx
  3070b4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3070b7:	89 c1                	mov    %eax,%ecx
  3070b9:	89 d6                	mov    %edx,%esi
  3070bb:	89 df                	mov    %ebx,%edi
  3070bd:	fc                   	cld    
  3070be:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  3070c0:	8b 45 08             	mov    0x8(%ebp),%eax
  3070c3:	5b                   	pop    %ebx
  3070c4:	5e                   	pop    %esi
  3070c5:	5f                   	pop    %edi
  3070c6:	5d                   	pop    %ebp
  3070c7:	c3                   	ret    

003070c8 <getFreeObject>:
  3070c8:	55                   	push   %ebp
  3070c9:	89 e5                	mov    %esp,%ebp
  3070cb:	83 ec 10             	sub    $0x10,%esp
  3070ce:	c7 45 fc 03 00 00 00 	movl   $0x3,-0x4(%ebp)
  3070d5:	eb 17                	jmp    3070ee <getFreeObject+0x26>
  3070d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3070da:	8b 04 85 80 42 31 00 	mov    0x314280(,%eax,4),%eax
  3070e1:	85 c0                	test   %eax,%eax
  3070e3:	75 05                	jne    3070ea <getFreeObject+0x22>
  3070e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3070e8:	eb 12                	jmp    3070fc <getFreeObject+0x34>
  3070ea:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  3070ee:	81 7d fc ff 02 00 00 	cmpl   $0x2ff,-0x4(%ebp)
  3070f5:	7e e0                	jle    3070d7 <getFreeObject+0xf>
  3070f7:	b8 00 00 00 00       	mov    $0x0,%eax
  3070fc:	c9                   	leave  
  3070fd:	c3                   	ret    

003070fe <cloneObject>:
  3070fe:	55                   	push   %ebp
  3070ff:	89 e5                	mov    %esp,%ebp
  307101:	83 ec 18             	sub    $0x18,%esp
  307104:	e8 bf ff ff ff       	call   3070c8 <getFreeObject>
  307109:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30710c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  307110:	74 49                	je     30715b <cloneObject+0x5d>
  307112:	e8 3e 01 00 00       	call   307255 <get_kfree_page>
  307117:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30711a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  30711e:	74 3b                	je     30715b <cloneObject+0x5d>
  307120:	83 ec 04             	sub    $0x4,%esp
  307123:	68 00 10 00 00       	push   $0x1000
  307128:	ff 75 08             	pushl  0x8(%ebp)
  30712b:	ff 75 f0             	pushl  -0x10(%ebp)
  30712e:	e8 75 ff ff ff       	call   3070a8 <memcpy>
  307133:	83 c4 10             	add    $0x10,%esp
  307136:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307139:	8b 55 f0             	mov    -0x10(%ebp),%edx
  30713c:	89 14 85 80 42 31 00 	mov    %edx,0x314280(,%eax,4)
  307143:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307146:	8b 55 f4             	mov    -0xc(%ebp),%edx
  307149:	89 10                	mov    %edx,(%eax)
  30714b:	8b 45 08             	mov    0x8(%ebp),%eax
  30714e:	8b 10                	mov    (%eax),%edx
  307150:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307153:	89 50 0c             	mov    %edx,0xc(%eax)
  307156:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307159:	eb 05                	jmp    307160 <cloneObject+0x62>
  30715b:	b8 00 00 00 00       	mov    $0x0,%eax
  307160:	c9                   	leave  
  307161:	c3                   	ret    

00307162 <byName>:
  307162:	55                   	push   %ebp
  307163:	89 e5                	mov    %esp,%ebp
  307165:	57                   	push   %edi
  307166:	56                   	push   %esi
  307167:	53                   	push   %ebx
  307168:	83 ec 10             	sub    $0x10,%esp
  30716b:	b8 01 00 00 00       	mov    $0x1,%eax
  307170:	bb 08 00 00 00       	mov    $0x8,%ebx
  307175:	b9 02 00 00 00       	mov    $0x2,%ecx
  30717a:	8b 55 08             	mov    0x8(%ebp),%edx
  30717d:	be 00 00 00 00       	mov    $0x0,%esi
  307182:	bf 00 00 00 00       	mov    $0x0,%edi
  307187:	cd 80                	int    $0x80
  307189:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30718c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30718f:	83 c4 10             	add    $0x10,%esp
  307192:	5b                   	pop    %ebx
  307193:	5e                   	pop    %esi
  307194:	5f                   	pop    %edi
  307195:	5d                   	pop    %ebp
  307196:	c3                   	ret    

00307197 <byId>:
  307197:	55                   	push   %ebp
  307198:	89 e5                	mov    %esp,%ebp
  30719a:	b8 00 00 00 00       	mov    $0x0,%eax
  30719f:	5d                   	pop    %ebp
  3071a0:	c3                   	ret    
  3071a1:	66 90                	xchg   %ax,%ax
  3071a3:	90                   	nop

003071a4 <memcpy>:
  3071a4:	55                   	push   %ebp
  3071a5:	89 e5                	mov    %esp,%ebp
  3071a7:	57                   	push   %edi
  3071a8:	56                   	push   %esi
  3071a9:	53                   	push   %ebx
  3071aa:	8b 45 10             	mov    0x10(%ebp),%eax
  3071ad:	8b 55 0c             	mov    0xc(%ebp),%edx
  3071b0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3071b3:	89 c1                	mov    %eax,%ecx
  3071b5:	89 d6                	mov    %edx,%esi
  3071b7:	89 df                	mov    %ebx,%edi
  3071b9:	fc                   	cld    
  3071ba:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  3071bc:	8b 45 08             	mov    0x8(%ebp),%eax
  3071bf:	5b                   	pop    %ebx
  3071c0:	5e                   	pop    %esi
  3071c1:	5f                   	pop    %edi
  3071c2:	5d                   	pop    %ebp
  3071c3:	c3                   	ret    

003071c4 <memset>:
  3071c4:	55                   	push   %ebp
  3071c5:	89 e5                	mov    %esp,%ebp
  3071c7:	57                   	push   %edi
  3071c8:	83 ec 04             	sub    $0x4,%esp
  3071cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  3071ce:	88 45 f8             	mov    %al,-0x8(%ebp)
  3071d1:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  3071d5:	8b 55 08             	mov    0x8(%ebp),%edx
  3071d8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  3071db:	89 d7                	mov    %edx,%edi
  3071dd:	fc                   	cld    
  3071de:	f3 aa                	rep stos %al,%es:(%edi)
  3071e0:	8b 45 08             	mov    0x8(%ebp),%eax
  3071e3:	83 c4 04             	add    $0x4,%esp
  3071e6:	5f                   	pop    %edi
  3071e7:	5d                   	pop    %ebp
  3071e8:	c3                   	ret    

003071e9 <get_free_page>:
  3071e9:	55                   	push   %ebp
  3071ea:	89 e5                	mov    %esp,%ebp
  3071ec:	57                   	push   %edi
  3071ed:	53                   	push   %ebx
  3071ee:	83 ec 10             	sub    $0x10,%esp
  3071f1:	c7 45 f4 00 08 00 00 	movl   $0x800,-0xc(%ebp)
  3071f8:	eb 49                	jmp    307243 <get_free_page+0x5a>
  3071fa:	8b 15 c0 20 31 00    	mov    0x3120c0,%edx
  307200:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307203:	01 d0                	add    %edx,%eax
  307205:	0f b6 00             	movzbl (%eax),%eax
  307208:	84 c0                	test   %al,%al
  30720a:	75 33                	jne    30723f <get_free_page+0x56>
  30720c:	8b 15 c0 20 31 00    	mov    0x3120c0,%edx
  307212:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307215:	01 d0                	add    %edx,%eax
  307217:	0f b6 10             	movzbl (%eax),%edx
  30721a:	83 c2 01             	add    $0x1,%edx
  30721d:	88 10                	mov    %dl,(%eax)
  30721f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307222:	c1 e0 0c             	shl    $0xc,%eax
  307225:	89 c3                	mov    %eax,%ebx
  307227:	b8 00 00 00 00       	mov    $0x0,%eax
  30722c:	ba 00 04 00 00       	mov    $0x400,%edx
  307231:	89 d1                	mov    %edx,%ecx
  307233:	89 df                	mov    %ebx,%edi
  307235:	f3 ab                	rep stos %eax,%es:(%edi)
  307237:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30723a:	c1 e0 0c             	shl    $0xc,%eax
  30723d:	eb 0f                	jmp    30724e <get_free_page+0x65>
  30723f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  307243:	81 7d f4 ff ff 03 00 	cmpl   $0x3ffff,-0xc(%ebp)
  30724a:	7e ae                	jle    3071fa <get_free_page+0x11>
  30724c:	eb a3                	jmp    3071f1 <get_free_page+0x8>
  30724e:	83 c4 10             	add    $0x10,%esp
  307251:	5b                   	pop    %ebx
  307252:	5f                   	pop    %edi
  307253:	5d                   	pop    %ebp
  307254:	c3                   	ret    

00307255 <get_kfree_page>:
  307255:	55                   	push   %ebp
  307256:	89 e5                	mov    %esp,%ebp
  307258:	57                   	push   %edi
  307259:	53                   	push   %ebx
  30725a:	83 ec 10             	sub    $0x10,%esp
  30725d:	c7 45 f4 00 04 00 00 	movl   $0x400,-0xc(%ebp)
  307264:	eb 49                	jmp    3072af <get_kfree_page+0x5a>
  307266:	8b 15 c0 20 31 00    	mov    0x3120c0,%edx
  30726c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30726f:	01 d0                	add    %edx,%eax
  307271:	0f b6 00             	movzbl (%eax),%eax
  307274:	84 c0                	test   %al,%al
  307276:	75 33                	jne    3072ab <get_kfree_page+0x56>
  307278:	8b 15 c0 20 31 00    	mov    0x3120c0,%edx
  30727e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307281:	01 d0                	add    %edx,%eax
  307283:	0f b6 10             	movzbl (%eax),%edx
  307286:	83 c2 01             	add    $0x1,%edx
  307289:	88 10                	mov    %dl,(%eax)
  30728b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30728e:	c1 e0 0c             	shl    $0xc,%eax
  307291:	89 c3                	mov    %eax,%ebx
  307293:	b8 00 00 00 00       	mov    $0x0,%eax
  307298:	ba 00 04 00 00       	mov    $0x400,%edx
  30729d:	89 d1                	mov    %edx,%ecx
  30729f:	89 df                	mov    %ebx,%edi
  3072a1:	f3 ab                	rep stos %eax,%es:(%edi)
  3072a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3072a6:	c1 e0 0c             	shl    $0xc,%eax
  3072a9:	eb 12                	jmp    3072bd <get_kfree_page+0x68>
  3072ab:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3072af:	81 7d f4 ff 07 00 00 	cmpl   $0x7ff,-0xc(%ebp)
  3072b6:	7e ae                	jle    307266 <get_kfree_page+0x11>
  3072b8:	b8 00 00 00 00       	mov    $0x0,%eax
  3072bd:	83 c4 10             	add    $0x10,%esp
  3072c0:	5b                   	pop    %ebx
  3072c1:	5f                   	pop    %edi
  3072c2:	5d                   	pop    %ebp
  3072c3:	c3                   	ret    

003072c4 <share_page>:
  3072c4:	55                   	push   %ebp
  3072c5:	89 e5                	mov    %esp,%ebp
  3072c7:	83 ec 08             	sub    $0x8,%esp
  3072ca:	81 7d 08 ff ff 3f 00 	cmpl   $0x3fffff,0x8(%ebp)
  3072d1:	77 1a                	ja     3072ed <share_page+0x29>
  3072d3:	83 ec 08             	sub    $0x8,%esp
  3072d6:	ff 75 08             	pushl  0x8(%ebp)
  3072d9:	68 80 d9 30 00       	push   $0x30d980
  3072de:	e8 c5 e3 ff ff       	call   3056a8 <printk>
  3072e3:	83 c4 10             	add    $0x10,%esp
  3072e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  3072eb:	eb 1a                	jmp    307307 <share_page+0x43>
  3072ed:	a1 c0 20 31 00       	mov    0x3120c0,%eax
  3072f2:	8b 55 08             	mov    0x8(%ebp),%edx
  3072f5:	c1 ea 0c             	shr    $0xc,%edx
  3072f8:	01 d0                	add    %edx,%eax
  3072fa:	0f b6 10             	movzbl (%eax),%edx
  3072fd:	83 c2 01             	add    $0x1,%edx
  307300:	88 10                	mov    %dl,(%eax)
  307302:	b8 00 00 00 00       	mov    $0x0,%eax
  307307:	c9                   	leave  
  307308:	c3                   	ret    

00307309 <page_share_nr>:
  307309:	55                   	push   %ebp
  30730a:	89 e5                	mov    %esp,%ebp
  30730c:	a1 c0 20 31 00       	mov    0x3120c0,%eax
  307311:	8b 55 08             	mov    0x8(%ebp),%edx
  307314:	c1 ea 0c             	shr    $0xc,%edx
  307317:	01 d0                	add    %edx,%eax
  307319:	0f b6 00             	movzbl (%eax),%eax
  30731c:	0f b6 c0             	movzbl %al,%eax
  30731f:	5d                   	pop    %ebp
  307320:	c3                   	ret    

00307321 <free_page>:
  307321:	55                   	push   %ebp
  307322:	89 e5                	mov    %esp,%ebp
  307324:	83 ec 08             	sub    $0x8,%esp
  307327:	81 7d 08 ff ff 3f 00 	cmpl   $0x3fffff,0x8(%ebp)
  30732e:	77 1a                	ja     30734a <free_page+0x29>
  307330:	83 ec 08             	sub    $0x8,%esp
  307333:	ff 75 08             	pushl  0x8(%ebp)
  307336:	68 c8 d9 30 00       	push   $0x30d9c8
  30733b:	e8 68 e3 ff ff       	call   3056a8 <printk>
  307340:	83 c4 10             	add    $0x10,%esp
  307343:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  307348:	eb 48                	jmp    307392 <free_page+0x71>
  30734a:	a1 c0 20 31 00       	mov    0x3120c0,%eax
  30734f:	8b 55 08             	mov    0x8(%ebp),%edx
  307352:	c1 ea 0c             	shr    $0xc,%edx
  307355:	01 d0                	add    %edx,%eax
  307357:	0f b6 00             	movzbl (%eax),%eax
  30735a:	84 c0                	test   %al,%al
  30735c:	75 1a                	jne    307378 <free_page+0x57>
  30735e:	83 ec 08             	sub    $0x8,%esp
  307361:	ff 75 08             	pushl  0x8(%ebp)
  307364:	68 f8 d9 30 00       	push   $0x30d9f8
  307369:	e8 3a e3 ff ff       	call   3056a8 <printk>
  30736e:	83 c4 10             	add    $0x10,%esp
  307371:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  307376:	eb 1a                	jmp    307392 <free_page+0x71>
  307378:	a1 c0 20 31 00       	mov    0x3120c0,%eax
  30737d:	8b 55 08             	mov    0x8(%ebp),%edx
  307380:	c1 ea 0c             	shr    $0xc,%edx
  307383:	01 d0                	add    %edx,%eax
  307385:	0f b6 10             	movzbl (%eax),%edx
  307388:	83 ea 01             	sub    $0x1,%edx
  30738b:	88 10                	mov    %dl,(%eax)
  30738d:	b8 00 00 00 00       	mov    $0x0,%eax
  307392:	c9                   	leave  
  307393:	c3                   	ret    

00307394 <open_pagination>:
  307394:	55                   	push   %ebp
  307395:	89 e5                	mov    %esp,%ebp
  307397:	83 ec 20             	sub    $0x20,%esp
  30739a:	c7 45 e4 00 30 20 00 	movl   $0x203000,-0x1c(%ebp)
  3073a1:	c7 45 fc 00 40 20 00 	movl   $0x204000,-0x4(%ebp)
  3073a8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  3073af:	68 00 10 00 00       	push   $0x1000
  3073b4:	6a 00                	push   $0x0
  3073b6:	ff 75 e4             	pushl  -0x1c(%ebp)
  3073b9:	e8 06 fe ff ff       	call   3071c4 <memset>
  3073be:	83 c4 0c             	add    $0xc,%esp
  3073c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3073c4:	83 c8 07             	or     $0x7,%eax
  3073c7:	89 c2                	mov    %eax,%edx
  3073c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3073cc:	89 10                	mov    %edx,(%eax)
  3073ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3073d5:	eb 1e                	jmp    3073f5 <open_pagination+0x61>
  3073d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3073da:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3073e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3073e4:	01 c2                	add    %eax,%edx
  3073e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3073e9:	c1 e0 0c             	shl    $0xc,%eax
  3073ec:	83 c8 07             	or     $0x7,%eax
  3073ef:	89 02                	mov    %eax,(%edx)
  3073f1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3073f5:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  3073fc:	7e d9                	jle    3073d7 <open_pagination+0x43>
  3073fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  307405:	eb 5d                	jmp    307464 <open_pagination+0xd0>
  307407:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30740a:	05 00 10 00 00       	add    $0x1000,%eax
  30740f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  307412:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307415:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30741c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30741f:	01 d0                	add    %edx,%eax
  307421:	8b 55 fc             	mov    -0x4(%ebp),%edx
  307424:	83 ca 07             	or     $0x7,%edx
  307427:	89 10                	mov    %edx,(%eax)
  307429:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  307430:	eb 25                	jmp    307457 <open_pagination+0xc3>
  307432:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307435:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30743c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30743f:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  307442:	8b 45 f8             	mov    -0x8(%ebp),%eax
  307445:	8d 50 01             	lea    0x1(%eax),%edx
  307448:	89 55 f8             	mov    %edx,-0x8(%ebp)
  30744b:	c1 e0 0c             	shl    $0xc,%eax
  30744e:	83 c8 07             	or     $0x7,%eax
  307451:	89 01                	mov    %eax,(%ecx)
  307453:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  307457:	81 7d ec ff 03 00 00 	cmpl   $0x3ff,-0x14(%ebp)
  30745e:	7e d2                	jle    307432 <open_pagination+0x9e>
  307460:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  307464:	81 7d f0 ff 00 00 00 	cmpl   $0xff,-0x10(%ebp)
  30746b:	7e 9a                	jle    307407 <open_pagination+0x73>
  30746d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  307470:	05 fc 0f 00 00       	add    $0xffc,%eax
  307475:	8b 00                	mov    (%eax),%eax
  307477:	25 00 f3 ff ff       	and    $0xfffff300,%eax
  30747c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30747f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  307486:	eb 20                	jmp    3074a8 <open_pagination+0x114>
  307488:	8b 45 e8             	mov    -0x18(%ebp),%eax
  30748b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  307492:	8b 45 fc             	mov    -0x4(%ebp),%eax
  307495:	01 c2                	add    %eax,%edx
  307497:	8b 45 e8             	mov    -0x18(%ebp),%eax
  30749a:	c1 e0 0c             	shl    $0xc,%eax
  30749d:	0d 07 00 c0 ff       	or     $0xffc00007,%eax
  3074a2:	89 02                	mov    %eax,(%edx)
  3074a4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  3074a8:	81 7d e8 ff 03 00 00 	cmpl   $0x3ff,-0x18(%ebp)
  3074af:	7e d7                	jle    307488 <open_pagination+0xf4>
  3074b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3074b4:	0f 22 d8             	mov    %eax,%cr3
  3074b7:	0f 20 c0             	mov    %cr0,%eax
  3074ba:	0d 00 00 01 80       	or     $0x80010000,%eax
  3074bf:	0f 22 c0             	mov    %eax,%cr0
  3074c2:	c9                   	leave  
  3074c3:	c3                   	ret    

003074c4 <mm_init>:
  3074c4:	55                   	push   %ebp
  3074c5:	89 e5                	mov    %esp,%ebp
  3074c7:	83 ec 38             	sub    $0x38,%esp
  3074ca:	a1 00 20 31 00       	mov    0x312000,%eax
  3074cf:	8b 40 30             	mov    0x30(%eax),%eax
  3074d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3074d5:	a1 00 20 31 00       	mov    0x312000,%eax
  3074da:	8b 50 30             	mov    0x30(%eax),%edx
  3074dd:	a1 00 20 31 00       	mov    0x312000,%eax
  3074e2:	8b 40 2c             	mov    0x2c(%eax),%eax
  3074e5:	01 d0                	add    %edx,%eax
  3074e7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3074ea:	a1 00 20 31 00       	mov    0x312000,%eax
  3074ef:	8b 40 18             	mov    0x18(%eax),%eax
  3074f2:	89 45 dc             	mov    %eax,-0x24(%ebp)
  3074f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3074f8:	8b 00                	mov    (%eax),%eax
  3074fa:	89 45 d8             	mov    %eax,-0x28(%ebp)
  3074fd:	8b 45 dc             	mov    -0x24(%ebp),%eax
  307500:	8b 50 04             	mov    0x4(%eax),%edx
  307503:	8b 45 dc             	mov    -0x24(%ebp),%eax
  307506:	8b 00                	mov    (%eax),%eax
  307508:	29 c2                	sub    %eax,%edx
  30750a:	89 d0                	mov    %edx,%eax
  30750c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  30750f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  307512:	50                   	push   %eax
  307513:	ff 75 d8             	pushl  -0x28(%ebp)
  307516:	68 00 50 31 00       	push   $0x315000
  30751b:	e8 84 fc ff ff       	call   3071a4 <memcpy>
  307520:	83 c4 0c             	add    $0xc,%esp
  307523:	c6 45 f3 64          	movb   $0x64,-0xd(%ebp)
  307527:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  30752e:	eb 12                	jmp    307542 <mm_init+0x7e>
  307530:	8b 15 c0 20 31 00    	mov    0x3120c0,%edx
  307536:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307539:	01 d0                	add    %edx,%eax
  30753b:	c6 00 64             	movb   $0x64,(%eax)
  30753e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  307542:	8b 15 c0 20 31 00    	mov    0x3120c0,%edx
  307548:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30754b:	01 d0                	add    %edx,%eax
  30754d:	3d ff ff 1f 00       	cmp    $0x1fffff,%eax
  307552:	76 dc                	jbe    307530 <mm_init+0x6c>
  307554:	eb 65                	jmp    3075bb <mm_init+0xf7>
  307556:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307559:	8b 40 14             	mov    0x14(%eax),%eax
  30755c:	83 f8 01             	cmp    $0x1,%eax
  30755f:	75 19                	jne    30757a <mm_init+0xb6>
  307561:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  307565:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307568:	8b 50 04             	mov    0x4(%eax),%edx
  30756b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30756e:	8b 40 0c             	mov    0xc(%eax),%eax
  307571:	01 d0                	add    %edx,%eax
  307573:	a3 30 26 31 00       	mov    %eax,0x312630
  307578:	eb 04                	jmp    30757e <mm_init+0xba>
  30757a:	c6 45 f3 64          	movb   $0x64,-0xd(%ebp)
  30757e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307581:	8b 40 04             	mov    0x4(%eax),%eax
  307584:	c1 e8 0c             	shr    $0xc,%eax
  307587:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30758a:	eb 15                	jmp    3075a1 <mm_init+0xdd>
  30758c:	8b 15 c0 20 31 00    	mov    0x3120c0,%edx
  307592:	8b 45 e8             	mov    -0x18(%ebp),%eax
  307595:	01 c2                	add    %eax,%edx
  307597:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  30759b:	88 02                	mov    %al,(%edx)
  30759d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  3075a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3075a4:	8b 50 04             	mov    0x4(%eax),%edx
  3075a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3075aa:	8b 40 0c             	mov    0xc(%eax),%eax
  3075ad:	01 d0                	add    %edx,%eax
  3075af:	c1 e8 0c             	shr    $0xc,%eax
  3075b2:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  3075b5:	77 d5                	ja     30758c <mm_init+0xc8>
  3075b7:	83 45 f4 18          	addl   $0x18,-0xc(%ebp)
  3075bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3075be:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  3075c1:	72 93                	jb     307556 <mm_init+0x92>
  3075c3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  3075ca:	eb 12                	jmp    3075de <mm_init+0x11a>
  3075cc:	8b 15 c0 20 31 00    	mov    0x3120c0,%edx
  3075d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3075d5:	01 d0                	add    %edx,%eax
  3075d7:	c6 00 64             	movb   $0x64,(%eax)
  3075da:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  3075de:	81 7d e4 ff 03 00 00 	cmpl   $0x3ff,-0x1c(%ebp)
  3075e5:	7e e5                	jle    3075cc <mm_init+0x108>
  3075e7:	a1 30 26 31 00       	mov    0x312630,%eax
  3075ec:	3d 00 00 00 40       	cmp    $0x40000000,%eax
  3075f1:	76 0c                	jbe    3075ff <mm_init+0x13b>
  3075f3:	c7 05 34 26 31 00 00 	movl   $0x40000000,0x312634
  3075fa:	00 00 40 
  3075fd:	eb 0a                	jmp    307609 <mm_init+0x145>
  3075ff:	a1 30 26 31 00       	mov    0x312630,%eax
  307604:	a3 34 26 31 00       	mov    %eax,0x312634
  307609:	e8 de 04 00 00       	call   307aec <buffer_init>
  30760e:	e8 81 fd ff ff       	call   307394 <open_pagination>
  307613:	c9                   	leave  
  307614:	c3                   	ret    
  307615:	66 90                	xchg   %ax,%ax
  307617:	90                   	nop

00307618 <ret>:
  307618:	55                   	push   %ebp
  307619:	89 e5                	mov    %esp,%ebp
  30761b:	57                   	push   %edi
  30761c:	56                   	push   %esi
  30761d:	53                   	push   %ebx
  30761e:	83 ec 10             	sub    $0x10,%esp
  307621:	b8 02 00 00 00       	mov    $0x2,%eax
  307626:	8b 5d 08             	mov    0x8(%ebp),%ebx
  307629:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30762c:	ba 00 00 00 00       	mov    $0x0,%edx
  307631:	be 00 00 00 00       	mov    $0x0,%esi
  307636:	bf 00 00 00 00       	mov    $0x0,%edi
  30763b:	cd 80                	int    $0x80
  30763d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  307640:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307643:	83 c4 10             	add    $0x10,%esp
  307646:	5b                   	pop    %ebx
  307647:	5e                   	pop    %esi
  307648:	5f                   	pop    %edi
  307649:	5d                   	pop    %ebp
  30764a:	c3                   	ret    

0030764b <clock_handler>:
  30764b:	55                   	push   %ebp
  30764c:	89 e5                	mov    %esp,%ebp
  30764e:	83 ec 18             	sub    $0x18,%esp
  307651:	a1 04 26 31 00       	mov    0x312604,%eax
  307656:	89 45 f4             	mov    %eax,-0xc(%ebp)
  307659:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30765c:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
  307662:	85 c0                	test   %eax,%eax
  307664:	74 1a                	je     307680 <clock_handler+0x35>
  307666:	a1 04 26 31 00       	mov    0x312604,%eax
  30766b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30766e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307671:	8b 90 a8 00 00 00    	mov    0xa8(%eax),%edx
  307677:	83 ea 01             	sub    $0x1,%edx
  30767a:	89 90 a8 00 00 00    	mov    %edx,0xa8(%eax)
  307680:	8b 0d 40 26 31 00    	mov    0x312640,%ecx
  307686:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
  30768b:	89 c8                	mov    %ecx,%eax
  30768d:	f7 e2                	mul    %edx
  30768f:	89 d0                	mov    %edx,%eax
  307691:	c1 e8 06             	shr    $0x6,%eax
  307694:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
  30769a:	29 c1                	sub    %eax,%ecx
  30769c:	89 c8                	mov    %ecx,%eax
  30769e:	85 c0                	test   %eax,%eax
  3076a0:	75 16                	jne    3076b8 <clock_handler+0x6d>
  3076a2:	83 ec 0c             	sub    $0xc,%esp
  3076a5:	6a 00                	push   $0x0
  3076a7:	6a 00                	push   $0x0
  3076a9:	6a 00                	push   $0x0
  3076ab:	6a 01                	push   $0x1
  3076ad:	ff 75 08             	pushl  0x8(%ebp)
  3076b0:	e8 d8 f2 ff ff       	call   30698d <doint>
  3076b5:	83 c4 20             	add    $0x20,%esp
  3076b8:	b8 00 00 00 00       	mov    $0x0,%eax
  3076bd:	c9                   	leave  
  3076be:	c3                   	ret    

003076bf <mktime>:
  3076bf:	55                   	push   %ebp
  3076c0:	89 e5                	mov    %esp,%ebp
  3076c2:	83 ec 10             	sub    $0x10,%esp
  3076c5:	8b 45 08             	mov    0x8(%ebp),%eax
  3076c8:	8b 40 14             	mov    0x14(%eax),%eax
  3076cb:	69 d0 80 33 e1 01    	imul   $0x1e13380,%eax,%edx
  3076d1:	8b 45 08             	mov    0x8(%ebp),%eax
  3076d4:	8b 40 14             	mov    0x14(%eax),%eax
  3076d7:	83 c0 03             	add    $0x3,%eax
  3076da:	69 c0 80 51 01 00    	imul   $0x15180,%eax,%eax
  3076e0:	8d 48 03             	lea    0x3(%eax),%ecx
  3076e3:	85 c0                	test   %eax,%eax
  3076e5:	0f 48 c1             	cmovs  %ecx,%eax
  3076e8:	c1 f8 02             	sar    $0x2,%eax
  3076eb:	01 d0                	add    %edx,%eax
  3076ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
  3076f0:	8b 45 08             	mov    0x8(%ebp),%eax
  3076f3:	8b 40 10             	mov    0x10(%eax),%eax
  3076f6:	8b 04 85 40 da 30 00 	mov    0x30da40(,%eax,4),%eax
  3076fd:	69 c0 80 51 01 00    	imul   $0x15180,%eax,%eax
  307703:	01 45 fc             	add    %eax,-0x4(%ebp)
  307706:	8b 45 08             	mov    0x8(%ebp),%eax
  307709:	8b 40 10             	mov    0x10(%eax),%eax
  30770c:	83 f8 01             	cmp    $0x1,%eax
  30770f:	7e 14                	jle    307725 <mktime+0x66>
  307711:	8b 45 08             	mov    0x8(%ebp),%eax
  307714:	8b 40 14             	mov    0x14(%eax),%eax
  307717:	83 e0 03             	and    $0x3,%eax
  30771a:	85 c0                	test   %eax,%eax
  30771c:	75 07                	jne    307725 <mktime+0x66>
  30771e:	81 45 fc 80 51 01 00 	addl   $0x15180,-0x4(%ebp)
  307725:	8b 45 08             	mov    0x8(%ebp),%eax
  307728:	8b 40 0c             	mov    0xc(%eax),%eax
  30772b:	83 e8 01             	sub    $0x1,%eax
  30772e:	69 c0 80 51 01 00    	imul   $0x15180,%eax,%eax
  307734:	01 45 fc             	add    %eax,-0x4(%ebp)
  307737:	8b 45 08             	mov    0x8(%ebp),%eax
  30773a:	8b 40 08             	mov    0x8(%eax),%eax
  30773d:	69 c0 10 0e 00 00    	imul   $0xe10,%eax,%eax
  307743:	01 45 fc             	add    %eax,-0x4(%ebp)
  307746:	8b 45 08             	mov    0x8(%ebp),%eax
  307749:	8b 40 04             	mov    0x4(%eax),%eax
  30774c:	c1 e0 02             	shl    $0x2,%eax
  30774f:	89 c2                	mov    %eax,%edx
  307751:	c1 e2 04             	shl    $0x4,%edx
  307754:	29 c2                	sub    %eax,%edx
  307756:	89 d0                	mov    %edx,%eax
  307758:	01 45 fc             	add    %eax,-0x4(%ebp)
  30775b:	8b 45 08             	mov    0x8(%ebp),%eax
  30775e:	8b 00                	mov    (%eax),%eax
  307760:	01 45 fc             	add    %eax,-0x4(%ebp)
  307763:	8b 45 fc             	mov    -0x4(%ebp),%eax
  307766:	c9                   	leave  
  307767:	c3                   	ret    

00307768 <cmos_time>:
  307768:	55                   	push   %ebp
  307769:	89 e5                	mov    %esp,%ebp
  30776b:	83 ec 10             	sub    $0x10,%esp
  30776e:	b8 80 00 00 00       	mov    $0x80,%eax
  307773:	ba 70 00 00 00       	mov    $0x70,%edx
  307778:	ee                   	out    %al,(%dx)
  307779:	eb 00                	jmp    30777b <cmos_time+0x13>
  30777b:	eb 00                	jmp    30777d <cmos_time+0x15>
  30777d:	b8 71 00 00 00       	mov    $0x71,%eax
  307782:	89 c2                	mov    %eax,%edx
  307784:	ec                   	in     (%dx),%al
  307785:	eb 00                	jmp    307787 <cmos_time+0x1f>
  307787:	eb 00                	jmp    307789 <cmos_time+0x21>
  307789:	88 45 ff             	mov    %al,-0x1(%ebp)
  30778c:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  307790:	0f b6 c0             	movzbl %al,%eax
  307793:	a3 60 26 31 00       	mov    %eax,0x312660
  307798:	b8 82 00 00 00       	mov    $0x82,%eax
  30779d:	ba 70 00 00 00       	mov    $0x70,%edx
  3077a2:	ee                   	out    %al,(%dx)
  3077a3:	eb 00                	jmp    3077a5 <cmos_time+0x3d>
  3077a5:	eb 00                	jmp    3077a7 <cmos_time+0x3f>
  3077a7:	b8 71 00 00 00       	mov    $0x71,%eax
  3077ac:	89 c2                	mov    %eax,%edx
  3077ae:	ec                   	in     (%dx),%al
  3077af:	eb 00                	jmp    3077b1 <cmos_time+0x49>
  3077b1:	eb 00                	jmp    3077b3 <cmos_time+0x4b>
  3077b3:	88 45 fe             	mov    %al,-0x2(%ebp)
  3077b6:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  3077ba:	0f b6 c0             	movzbl %al,%eax
  3077bd:	a3 64 26 31 00       	mov    %eax,0x312664
  3077c2:	b8 84 00 00 00       	mov    $0x84,%eax
  3077c7:	ba 70 00 00 00       	mov    $0x70,%edx
  3077cc:	ee                   	out    %al,(%dx)
  3077cd:	eb 00                	jmp    3077cf <cmos_time+0x67>
  3077cf:	eb 00                	jmp    3077d1 <cmos_time+0x69>
  3077d1:	b8 71 00 00 00       	mov    $0x71,%eax
  3077d6:	89 c2                	mov    %eax,%edx
  3077d8:	ec                   	in     (%dx),%al
  3077d9:	eb 00                	jmp    3077db <cmos_time+0x73>
  3077db:	eb 00                	jmp    3077dd <cmos_time+0x75>
  3077dd:	88 45 fd             	mov    %al,-0x3(%ebp)
  3077e0:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  3077e4:	0f b6 c0             	movzbl %al,%eax
  3077e7:	a3 68 26 31 00       	mov    %eax,0x312668
  3077ec:	b8 87 00 00 00       	mov    $0x87,%eax
  3077f1:	ba 70 00 00 00       	mov    $0x70,%edx
  3077f6:	ee                   	out    %al,(%dx)
  3077f7:	eb 00                	jmp    3077f9 <cmos_time+0x91>
  3077f9:	eb 00                	jmp    3077fb <cmos_time+0x93>
  3077fb:	b8 71 00 00 00       	mov    $0x71,%eax
  307800:	89 c2                	mov    %eax,%edx
  307802:	ec                   	in     (%dx),%al
  307803:	eb 00                	jmp    307805 <cmos_time+0x9d>
  307805:	eb 00                	jmp    307807 <cmos_time+0x9f>
  307807:	88 45 fc             	mov    %al,-0x4(%ebp)
  30780a:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  30780e:	0f b6 c0             	movzbl %al,%eax
  307811:	a3 6c 26 31 00       	mov    %eax,0x31266c
  307816:	b8 88 00 00 00       	mov    $0x88,%eax
  30781b:	ba 70 00 00 00       	mov    $0x70,%edx
  307820:	ee                   	out    %al,(%dx)
  307821:	eb 00                	jmp    307823 <cmos_time+0xbb>
  307823:	eb 00                	jmp    307825 <cmos_time+0xbd>
  307825:	b8 71 00 00 00       	mov    $0x71,%eax
  30782a:	89 c2                	mov    %eax,%edx
  30782c:	ec                   	in     (%dx),%al
  30782d:	eb 00                	jmp    30782f <cmos_time+0xc7>
  30782f:	eb 00                	jmp    307831 <cmos_time+0xc9>
  307831:	88 45 fb             	mov    %al,-0x5(%ebp)
  307834:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  307838:	0f b6 c0             	movzbl %al,%eax
  30783b:	a3 70 26 31 00       	mov    %eax,0x312670
  307840:	b8 89 00 00 00       	mov    $0x89,%eax
  307845:	ba 70 00 00 00       	mov    $0x70,%edx
  30784a:	ee                   	out    %al,(%dx)
  30784b:	eb 00                	jmp    30784d <cmos_time+0xe5>
  30784d:	eb 00                	jmp    30784f <cmos_time+0xe7>
  30784f:	b8 71 00 00 00       	mov    $0x71,%eax
  307854:	89 c2                	mov    %eax,%edx
  307856:	ec                   	in     (%dx),%al
  307857:	eb 00                	jmp    307859 <cmos_time+0xf1>
  307859:	eb 00                	jmp    30785b <cmos_time+0xf3>
  30785b:	88 45 fa             	mov    %al,-0x6(%ebp)
  30785e:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  307862:	0f b6 c0             	movzbl %al,%eax
  307865:	a3 74 26 31 00       	mov    %eax,0x312674
  30786a:	8b 0d 60 26 31 00    	mov    0x312660,%ecx
  307870:	b8 80 00 00 00       	mov    $0x80,%eax
  307875:	ba 70 00 00 00       	mov    $0x70,%edx
  30787a:	ee                   	out    %al,(%dx)
  30787b:	eb 00                	jmp    30787d <cmos_time+0x115>
  30787d:	eb 00                	jmp    30787f <cmos_time+0x117>
  30787f:	b8 71 00 00 00       	mov    $0x71,%eax
  307884:	89 c2                	mov    %eax,%edx
  307886:	ec                   	in     (%dx),%al
  307887:	eb 00                	jmp    307889 <cmos_time+0x121>
  307889:	eb 00                	jmp    30788b <cmos_time+0x123>
  30788b:	88 45 f9             	mov    %al,-0x7(%ebp)
  30788e:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  307892:	0f b6 c0             	movzbl %al,%eax
  307895:	39 c1                	cmp    %eax,%ecx
  307897:	0f 85 d1 fe ff ff    	jne    30776e <cmos_time+0x6>
  30789d:	a1 60 26 31 00       	mov    0x312660,%eax
  3078a2:	83 e0 0f             	and    $0xf,%eax
  3078a5:	89 c1                	mov    %eax,%ecx
  3078a7:	a1 60 26 31 00       	mov    0x312660,%eax
  3078ac:	c1 f8 04             	sar    $0x4,%eax
  3078af:	89 c2                	mov    %eax,%edx
  3078b1:	89 d0                	mov    %edx,%eax
  3078b3:	c1 e0 02             	shl    $0x2,%eax
  3078b6:	01 d0                	add    %edx,%eax
  3078b8:	01 c0                	add    %eax,%eax
  3078ba:	01 c8                	add    %ecx,%eax
  3078bc:	a3 60 26 31 00       	mov    %eax,0x312660
  3078c1:	a1 64 26 31 00       	mov    0x312664,%eax
  3078c6:	83 e0 0f             	and    $0xf,%eax
  3078c9:	89 c1                	mov    %eax,%ecx
  3078cb:	a1 64 26 31 00       	mov    0x312664,%eax
  3078d0:	c1 f8 04             	sar    $0x4,%eax
  3078d3:	89 c2                	mov    %eax,%edx
  3078d5:	89 d0                	mov    %edx,%eax
  3078d7:	c1 e0 02             	shl    $0x2,%eax
  3078da:	01 d0                	add    %edx,%eax
  3078dc:	01 c0                	add    %eax,%eax
  3078de:	01 c8                	add    %ecx,%eax
  3078e0:	a3 64 26 31 00       	mov    %eax,0x312664
  3078e5:	a1 68 26 31 00       	mov    0x312668,%eax
  3078ea:	83 e0 0f             	and    $0xf,%eax
  3078ed:	89 c1                	mov    %eax,%ecx
  3078ef:	a1 68 26 31 00       	mov    0x312668,%eax
  3078f4:	c1 f8 04             	sar    $0x4,%eax
  3078f7:	89 c2                	mov    %eax,%edx
  3078f9:	89 d0                	mov    %edx,%eax
  3078fb:	c1 e0 02             	shl    $0x2,%eax
  3078fe:	01 d0                	add    %edx,%eax
  307900:	01 c0                	add    %eax,%eax
  307902:	01 c8                	add    %ecx,%eax
  307904:	a3 68 26 31 00       	mov    %eax,0x312668
  307909:	a1 6c 26 31 00       	mov    0x31266c,%eax
  30790e:	83 e0 0f             	and    $0xf,%eax
  307911:	89 c1                	mov    %eax,%ecx
  307913:	a1 6c 26 31 00       	mov    0x31266c,%eax
  307918:	c1 f8 04             	sar    $0x4,%eax
  30791b:	89 c2                	mov    %eax,%edx
  30791d:	89 d0                	mov    %edx,%eax
  30791f:	c1 e0 02             	shl    $0x2,%eax
  307922:	01 d0                	add    %edx,%eax
  307924:	01 c0                	add    %eax,%eax
  307926:	01 c8                	add    %ecx,%eax
  307928:	a3 6c 26 31 00       	mov    %eax,0x31266c
  30792d:	a1 70 26 31 00       	mov    0x312670,%eax
  307932:	83 e0 0f             	and    $0xf,%eax
  307935:	89 c1                	mov    %eax,%ecx
  307937:	a1 70 26 31 00       	mov    0x312670,%eax
  30793c:	c1 f8 04             	sar    $0x4,%eax
  30793f:	89 c2                	mov    %eax,%edx
  307941:	89 d0                	mov    %edx,%eax
  307943:	c1 e0 02             	shl    $0x2,%eax
  307946:	01 d0                	add    %edx,%eax
  307948:	01 c0                	add    %eax,%eax
  30794a:	01 c8                	add    %ecx,%eax
  30794c:	a3 70 26 31 00       	mov    %eax,0x312670
  307951:	a1 74 26 31 00       	mov    0x312674,%eax
  307956:	83 e0 0f             	and    $0xf,%eax
  307959:	89 c1                	mov    %eax,%ecx
  30795b:	a1 74 26 31 00       	mov    0x312674,%eax
  307960:	c1 f8 04             	sar    $0x4,%eax
  307963:	89 c2                	mov    %eax,%edx
  307965:	89 d0                	mov    %edx,%eax
  307967:	c1 e0 02             	shl    $0x2,%eax
  30796a:	01 d0                	add    %edx,%eax
  30796c:	01 c0                	add    %eax,%eax
  30796e:	01 c8                	add    %ecx,%eax
  307970:	a3 74 26 31 00       	mov    %eax,0x312674
  307975:	a1 70 26 31 00       	mov    0x312670,%eax
  30797a:	83 e8 01             	sub    $0x1,%eax
  30797d:	a3 70 26 31 00       	mov    %eax,0x312670
  307982:	68 60 26 31 00       	push   $0x312660
  307987:	e8 33 fd ff ff       	call   3076bf <mktime>
  30798c:	83 c4 04             	add    $0x4,%esp
  30798f:	a3 48 26 31 00       	mov    %eax,0x312648
  307994:	c9                   	leave  
  307995:	c3                   	ret    

00307996 <get_time>:
  307996:	55                   	push   %ebp
  307997:	89 e5                	mov    %esp,%ebp
  307999:	a1 48 26 31 00       	mov    0x312648,%eax
  30799e:	50                   	push   %eax
  30799f:	ff 75 08             	pushl  0x8(%ebp)
  3079a2:	e8 71 fc ff ff       	call   307618 <ret>
  3079a7:	83 c4 08             	add    $0x8,%esp
  3079aa:	c9                   	leave  
  3079ab:	c3                   	ret    

003079ac <_clk>:
  3079ac:	55                   	push   %ebp
  3079ad:	89 e5                	mov    %esp,%ebp
  3079af:	a1 48 26 31 00       	mov    0x312648,%eax
  3079b4:	83 c0 01             	add    $0x1,%eax
  3079b7:	a3 48 26 31 00       	mov    %eax,0x312648
  3079bc:	5d                   	pop    %ebp
  3079bd:	c3                   	ret    

003079be <clock_init>:
  3079be:	55                   	push   %ebp
  3079bf:	89 e5                	mov    %esp,%ebp
  3079c1:	57                   	push   %edi
  3079c2:	56                   	push   %esi
  3079c3:	53                   	push   %ebx
  3079c4:	83 ec 1c             	sub    $0x1c,%esp
  3079c7:	b8 03 00 00 00       	mov    $0x3,%eax
  3079cc:	bb 00 00 00 00       	mov    $0x0,%ebx
  3079d1:	b9 96 79 30 00       	mov    $0x307996,%ecx
  3079d6:	ba 00 00 00 00       	mov    $0x0,%edx
  3079db:	be 00 00 00 00       	mov    $0x0,%esi
  3079e0:	bf 00 00 00 00       	mov    $0x0,%edi
  3079e5:	cd 80                	int    $0x80
  3079e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3079ea:	b8 03 00 00 00       	mov    $0x3,%eax
  3079ef:	bb 01 00 00 00       	mov    $0x1,%ebx
  3079f4:	b9 ac 79 30 00       	mov    $0x3079ac,%ecx
  3079f9:	ba 00 00 00 00       	mov    $0x0,%edx
  3079fe:	be 00 00 00 00       	mov    $0x0,%esi
  307a03:	bf 00 00 00 00       	mov    $0x0,%edi
  307a08:	cd 80                	int    $0x80
  307a0a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  307a0d:	e8 56 fd ff ff       	call   307768 <cmos_time>
  307a12:	b8 36 00 00 00       	mov    $0x36,%eax
  307a17:	ba 43 00 00 00       	mov    $0x43,%edx
  307a1c:	ee                   	out    %al,(%dx)
  307a1d:	eb 00                	jmp    307a1f <clock_init+0x61>
  307a1f:	eb 00                	jmp    307a21 <clock_init+0x63>
  307a21:	b8 9c 00 00 00       	mov    $0x9c,%eax
  307a26:	ba 40 00 00 00       	mov    $0x40,%edx
  307a2b:	ee                   	out    %al,(%dx)
  307a2c:	eb 00                	jmp    307a2e <clock_init+0x70>
  307a2e:	eb 00                	jmp    307a30 <clock_init+0x72>
  307a30:	b8 2e 00 00 00       	mov    $0x2e,%eax
  307a35:	ba 40 00 00 00       	mov    $0x40,%edx
  307a3a:	ee                   	out    %al,(%dx)
  307a3b:	eb 00                	jmp    307a3d <clock_init+0x7f>
  307a3d:	eb 00                	jmp    307a3f <clock_init+0x81>
  307a3f:	83 ec 08             	sub    $0x8,%esp
  307a42:	68 4b 76 30 00       	push   $0x30764b
  307a47:	6a 00                	push   $0x0
  307a49:	e8 9a e2 ff ff       	call   305ce8 <put_irq_handler>
  307a4e:	83 c4 10             	add    $0x10,%esp
  307a51:	8d 65 f4             	lea    -0xc(%ebp),%esp
  307a54:	5b                   	pop    %ebx
  307a55:	5e                   	pop    %esi
  307a56:	5f                   	pop    %edi
  307a57:	5d                   	pop    %ebp
  307a58:	c3                   	ret    

00307a59 <clock_main>:
  307a59:	55                   	push   %ebp
  307a5a:	89 e5                	mov    %esp,%ebp
  307a5c:	57                   	push   %edi
  307a5d:	56                   	push   %esi
  307a5e:	53                   	push   %ebx
  307a5f:	83 ec 1c             	sub    $0x1c,%esp
  307a62:	e8 57 ff ff ff       	call   3079be <clock_init>
  307a67:	b8 00 00 00 00       	mov    $0x0,%eax
  307a6c:	bb 00 00 00 00       	mov    $0x0,%ebx
  307a71:	b9 00 00 00 00       	mov    $0x0,%ecx
  307a76:	ba 00 00 00 00       	mov    $0x0,%edx
  307a7b:	be 00 00 00 00       	mov    $0x0,%esi
  307a80:	bf 00 00 00 00       	mov    $0x0,%edi
  307a85:	cd 80                	int    $0x80
  307a87:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  307a8a:	b8 00 00 00 00       	mov    $0x0,%eax
  307a8f:	83 c4 1c             	add    $0x1c,%esp
  307a92:	5b                   	pop    %ebx
  307a93:	5e                   	pop    %esi
  307a94:	5f                   	pop    %edi
  307a95:	5d                   	pop    %ebp
  307a96:	c3                   	ret    
  307a97:	90                   	nop

00307a98 <main>:
  307a98:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  307a9c:	83 e4 f0             	and    $0xfffffff0,%esp
  307a9f:	ff 71 fc             	pushl  -0x4(%ecx)
  307aa2:	55                   	push   %ebp
  307aa3:	89 e5                	mov    %esp,%ebp
  307aa5:	51                   	push   %ecx
  307aa6:	83 ec 04             	sub    $0x4,%esp
  307aa9:	fa                   	cli    
  307aaa:	e8 bb 43 00 00       	call   30be6a <cons_init>
  307aaf:	e8 10 fa ff ff       	call   3074c4 <mm_init>
  307ab4:	e8 bf e2 ff ff       	call   305d78 <trap_init>
  307ab9:	e8 8f f2 ff ff       	call   306d4d <god_init>
  307abe:	b8 00 00 00 00       	mov    $0x0,%eax
  307ac3:	83 c4 04             	add    $0x4,%esp
  307ac6:	59                   	pop    %ecx
  307ac7:	5d                   	pop    %ebp
  307ac8:	8d 61 fc             	lea    -0x4(%ecx),%esp
  307acb:	c3                   	ret    

00307acc <memcpy>:
  307acc:	55                   	push   %ebp
  307acd:	89 e5                	mov    %esp,%ebp
  307acf:	57                   	push   %edi
  307ad0:	56                   	push   %esi
  307ad1:	53                   	push   %ebx
  307ad2:	8b 45 10             	mov    0x10(%ebp),%eax
  307ad5:	8b 55 0c             	mov    0xc(%ebp),%edx
  307ad8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  307adb:	89 c1                	mov    %eax,%ecx
  307add:	89 d6                	mov    %edx,%esi
  307adf:	89 df                	mov    %ebx,%edi
  307ae1:	fc                   	cld    
  307ae2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  307ae4:	8b 45 08             	mov    0x8(%ebp),%eax
  307ae7:	5b                   	pop    %ebx
  307ae8:	5e                   	pop    %esi
  307ae9:	5f                   	pop    %edi
  307aea:	5d                   	pop    %ebp
  307aeb:	c3                   	ret    

00307aec <buffer_init>:
  307aec:	55                   	push   %ebp
  307aed:	89 e5                	mov    %esp,%ebp
  307aef:	83 ec 10             	sub    $0x10,%esp
  307af2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  307af9:	c7 45 f8 00 00 01 00 	movl   $0x10000,-0x8(%ebp)
  307b00:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  307b07:	eb 23                	jmp    307b2c <buffer_init+0x40>
  307b09:	8b 45 fc             	mov    -0x4(%ebp),%eax
  307b0c:	c1 e0 0c             	shl    $0xc,%eax
  307b0f:	89 c2                	mov    %eax,%edx
  307b11:	8b 45 f8             	mov    -0x8(%ebp),%eax
  307b14:	01 d0                	add    %edx,%eax
  307b16:	8b 55 fc             	mov    -0x4(%ebp),%edx
  307b19:	83 c2 01             	add    $0x1,%edx
  307b1c:	89 d1                	mov    %edx,%ecx
  307b1e:	c1 e1 0c             	shl    $0xc,%ecx
  307b21:	8b 55 f8             	mov    -0x8(%ebp),%edx
  307b24:	01 ca                	add    %ecx,%edx
  307b26:	89 10                	mov    %edx,(%eax)
  307b28:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  307b2c:	81 7d fc 8e 00 00 00 	cmpl   $0x8e,-0x4(%ebp)
  307b33:	7e d4                	jle    307b09 <buffer_init+0x1d>
  307b35:	8b 45 fc             	mov    -0x4(%ebp),%eax
  307b38:	c1 e0 0c             	shl    $0xc,%eax
  307b3b:	89 c2                	mov    %eax,%edx
  307b3d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  307b40:	01 d0                	add    %edx,%eax
  307b42:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  307b48:	8b 45 f8             	mov    -0x8(%ebp),%eax
  307b4b:	a3 88 26 31 00       	mov    %eax,0x312688
  307b50:	c9                   	leave  
  307b51:	c3                   	ret    

00307b52 <get_buffer>:
  307b52:	55                   	push   %ebp
  307b53:	89 e5                	mov    %esp,%ebp
  307b55:	83 ec 10             	sub    $0x10,%esp
  307b58:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  307b5f:	a1 88 26 31 00       	mov    0x312688,%eax
  307b64:	85 c0                	test   %eax,%eax
  307b66:	74 14                	je     307b7c <get_buffer+0x2a>
  307b68:	a1 88 26 31 00       	mov    0x312688,%eax
  307b6d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  307b70:	a1 88 26 31 00       	mov    0x312688,%eax
  307b75:	8b 00                	mov    (%eax),%eax
  307b77:	a3 88 26 31 00       	mov    %eax,0x312688
  307b7c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  307b7f:	c9                   	leave  
  307b80:	c3                   	ret    

00307b81 <free_buffer>:
  307b81:	55                   	push   %ebp
  307b82:	89 e5                	mov    %esp,%ebp
  307b84:	83 ec 08             	sub    $0x8,%esp
  307b87:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  307b8b:	75 10                	jne    307b9d <free_buffer+0x1c>
  307b8d:	83 ec 0c             	sub    $0xc,%esp
  307b90:	68 70 da 30 00       	push   $0x30da70
  307b95:	e8 f2 da ff ff       	call   30568c <panic>
  307b9a:	83 c4 10             	add    $0x10,%esp
  307b9d:	8b 45 08             	mov    0x8(%ebp),%eax
  307ba0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  307ba5:	89 45 08             	mov    %eax,0x8(%ebp)
  307ba8:	8b 15 88 26 31 00    	mov    0x312688,%edx
  307bae:	8b 45 08             	mov    0x8(%ebp),%eax
  307bb1:	89 10                	mov    %edx,(%eax)
  307bb3:	8b 45 08             	mov    0x8(%ebp),%eax
  307bb6:	a3 88 26 31 00       	mov    %eax,0x312688
  307bbb:	c9                   	leave  
  307bbc:	c3                   	ret    

00307bbd <dobuffer>:
  307bbd:	55                   	push   %ebp
  307bbe:	89 e5                	mov    %esp,%ebp
  307bc0:	83 ec 18             	sub    $0x18,%esp
  307bc3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  307bca:	81 65 10 ff 0f 00 00 	andl   $0xfff,0x10(%ebp)
  307bd1:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  307bd5:	75 2e                	jne    307c05 <dobuffer+0x48>
  307bd7:	e8 76 ff ff ff       	call   307b52 <get_buffer>
  307bdc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  307bdf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  307be3:	74 34                	je     307c19 <dobuffer+0x5c>
  307be5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  307be9:	74 2e                	je     307c19 <dobuffer+0x5c>
  307beb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  307bef:	74 28                	je     307c19 <dobuffer+0x5c>
  307bf1:	8b 45 10             	mov    0x10(%ebp),%eax
  307bf4:	50                   	push   %eax
  307bf5:	ff 75 0c             	pushl  0xc(%ebp)
  307bf8:	ff 75 f4             	pushl  -0xc(%ebp)
  307bfb:	e8 cc fe ff ff       	call   307acc <memcpy>
  307c00:	83 c4 0c             	add    $0xc,%esp
  307c03:	eb 14                	jmp    307c19 <dobuffer+0x5c>
  307c05:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  307c09:	75 0e                	jne    307c19 <dobuffer+0x5c>
  307c0b:	83 ec 0c             	sub    $0xc,%esp
  307c0e:	ff 75 0c             	pushl  0xc(%ebp)
  307c11:	e8 6b ff ff ff       	call   307b81 <free_buffer>
  307c16:	83 c4 10             	add    $0x10,%esp
  307c19:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307c1c:	c9                   	leave  
  307c1d:	c3                   	ret    
  307c1e:	66 90                	xchg   %ax,%ax

00307c20 <bucket_init>:
  307c20:	55                   	push   %ebp
  307c21:	89 e5                	mov    %esp,%ebp
  307c23:	83 ec 18             	sub    $0x18,%esp
  307c26:	e8 2a f6 ff ff       	call   307255 <get_kfree_page>
  307c2b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  307c2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307c31:	89 45 ec             	mov    %eax,-0x14(%ebp)
  307c34:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  307c38:	75 10                	jne    307c4a <bucket_init+0x2a>
  307c3a:	83 ec 0c             	sub    $0xc,%esp
  307c3d:	68 84 da 30 00       	push   $0x30da84
  307c42:	e8 45 da ff ff       	call   30568c <panic>
  307c47:	83 c4 10             	add    $0x10,%esp
  307c4a:	c7 45 f0 00 01 00 00 	movl   $0x100,-0x10(%ebp)
  307c51:	eb 14                	jmp    307c67 <bucket_init+0x47>
  307c53:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307c56:	8d 50 10             	lea    0x10(%eax),%edx
  307c59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307c5c:	89 50 04             	mov    %edx,0x4(%eax)
  307c5f:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
  307c63:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
  307c67:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
  307c6b:	7f e6                	jg     307c53 <bucket_init+0x33>
  307c6d:	8b 15 8c 26 31 00    	mov    0x31268c,%edx
  307c73:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307c76:	89 50 04             	mov    %edx,0x4(%eax)
  307c79:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307c7c:	a3 8c 26 31 00       	mov    %eax,0x31268c
  307c81:	c9                   	leave  
  307c82:	c3                   	ret    

00307c83 <kalloc>:
  307c83:	55                   	push   %ebp
  307c84:	89 e5                	mov    %esp,%ebp
  307c86:	83 ec 28             	sub    $0x28,%esp
  307c89:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  307c90:	c7 45 f0 00 21 31 00 	movl   $0x312100,-0x10(%ebp)
  307c97:	eb 10                	jmp    307ca9 <kalloc+0x26>
  307c99:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307c9c:	8b 00                	mov    (%eax),%eax
  307c9e:	3b 45 08             	cmp    0x8(%ebp),%eax
  307ca1:	76 02                	jbe    307ca5 <kalloc+0x22>
  307ca3:	eb 0d                	jmp    307cb2 <kalloc+0x2f>
  307ca5:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
  307ca9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307cac:	8b 00                	mov    (%eax),%eax
  307cae:	85 c0                	test   %eax,%eax
  307cb0:	75 e7                	jne    307c99 <kalloc+0x16>
  307cb2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307cb5:	8b 00                	mov    (%eax),%eax
  307cb7:	85 c0                	test   %eax,%eax
  307cb9:	75 10                	jne    307ccb <kalloc+0x48>
  307cbb:	83 ec 0c             	sub    $0xc,%esp
  307cbe:	68 a8 da 30 00       	push   $0x30daa8
  307cc3:	e8 c4 d9 ff ff       	call   30568c <panic>
  307cc8:	83 c4 10             	add    $0x10,%esp
  307ccb:	fa                   	cli    
  307ccc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307ccf:	8b 40 04             	mov    0x4(%eax),%eax
  307cd2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  307cd5:	eb 15                	jmp    307cec <kalloc+0x69>
  307cd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307cda:	8b 40 08             	mov    0x8(%eax),%eax
  307cdd:	85 c0                	test   %eax,%eax
  307cdf:	74 02                	je     307ce3 <kalloc+0x60>
  307ce1:	eb 0f                	jmp    307cf2 <kalloc+0x6f>
  307ce3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307ce6:	8b 40 04             	mov    0x4(%eax),%eax
  307ce9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  307cec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  307cf0:	75 e5                	jne    307cd7 <kalloc+0x54>
  307cf2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  307cf6:	0f 85 c8 00 00 00    	jne    307dc4 <kalloc+0x141>
  307cfc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  307d03:	a1 8c 26 31 00       	mov    0x31268c,%eax
  307d08:	85 c0                	test   %eax,%eax
  307d0a:	75 05                	jne    307d11 <kalloc+0x8e>
  307d0c:	e8 0f ff ff ff       	call   307c20 <bucket_init>
  307d11:	a1 8c 26 31 00       	mov    0x31268c,%eax
  307d16:	89 45 f4             	mov    %eax,-0xc(%ebp)
  307d19:	a1 8c 26 31 00       	mov    0x31268c,%eax
  307d1e:	8b 40 04             	mov    0x4(%eax),%eax
  307d21:	a3 8c 26 31 00       	mov    %eax,0x31268c
  307d26:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307d29:	66 c7 40 0c 00 00    	movw   $0x0,0xc(%eax)
  307d2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307d32:	8b 00                	mov    (%eax),%eax
  307d34:	89 c2                	mov    %eax,%edx
  307d36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307d39:	66 89 50 0e          	mov    %dx,0xe(%eax)
  307d3d:	e8 13 f5 ff ff       	call   307255 <get_kfree_page>
  307d42:	89 45 ec             	mov    %eax,-0x14(%ebp)
  307d45:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307d48:	8b 55 ec             	mov    -0x14(%ebp),%edx
  307d4b:	89 50 08             	mov    %edx,0x8(%eax)
  307d4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307d51:	8b 50 08             	mov    0x8(%eax),%edx
  307d54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307d57:	89 10                	mov    %edx,(%eax)
  307d59:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  307d5d:	75 10                	jne    307d6f <kalloc+0xec>
  307d5f:	83 ec 0c             	sub    $0xc,%esp
  307d62:	68 c4 da 30 00       	push   $0x30dac4
  307d67:	e8 20 d9 ff ff       	call   30568c <panic>
  307d6c:	83 c4 10             	add    $0x10,%esp
  307d6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307d72:	8b 08                	mov    (%eax),%ecx
  307d74:	b8 00 10 00 00       	mov    $0x1000,%eax
  307d79:	ba 00 00 00 00       	mov    $0x0,%edx
  307d7e:	f7 f1                	div    %ecx
  307d80:	89 45 e8             	mov    %eax,-0x18(%ebp)
  307d83:	eb 1b                	jmp    307da0 <kalloc+0x11d>
  307d85:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307d88:	8b 10                	mov    (%eax),%edx
  307d8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307d8d:	01 c2                	add    %eax,%edx
  307d8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307d92:	89 10                	mov    %edx,(%eax)
  307d94:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307d97:	8b 00                	mov    (%eax),%eax
  307d99:	01 45 ec             	add    %eax,-0x14(%ebp)
  307d9c:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  307da0:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
  307da4:	7f df                	jg     307d85 <kalloc+0x102>
  307da6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307da9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  307daf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307db2:	8b 50 04             	mov    0x4(%eax),%edx
  307db5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307db8:	89 50 04             	mov    %edx,0x4(%eax)
  307dbb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307dbe:	8b 55 f4             	mov    -0xc(%ebp),%edx
  307dc1:	89 50 04             	mov    %edx,0x4(%eax)
  307dc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307dc7:	8b 40 08             	mov    0x8(%eax),%eax
  307dca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  307dcd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  307dd0:	8b 10                	mov    (%eax),%edx
  307dd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307dd5:	89 50 08             	mov    %edx,0x8(%eax)
  307dd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307ddb:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
  307ddf:	8d 50 01             	lea    0x1(%eax),%edx
  307de2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307de5:	66 89 50 0c          	mov    %dx,0xc(%eax)
  307de9:	fb                   	sti    
  307dea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  307ded:	c9                   	leave  
  307dee:	c3                   	ret    

00307def <kfree_s>:
  307def:	55                   	push   %ebp
  307df0:	89 e5                	mov    %esp,%ebp
  307df2:	83 ec 18             	sub    $0x18,%esp
  307df5:	8b 45 08             	mov    0x8(%ebp),%eax
  307df8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  307dfd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  307e00:	c7 45 f4 00 21 31 00 	movl   $0x312100,-0xc(%ebp)
  307e07:	eb 43                	jmp    307e4c <kfree_s+0x5d>
  307e09:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  307e10:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307e13:	8b 00                	mov    (%eax),%eax
  307e15:	3b 45 0c             	cmp    0xc(%ebp),%eax
  307e18:	73 02                	jae    307e1c <kfree_s+0x2d>
  307e1a:	eb 2c                	jmp    307e48 <kfree_s+0x59>
  307e1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307e1f:	8b 40 04             	mov    0x4(%eax),%eax
  307e22:	89 45 f0             	mov    %eax,-0x10(%ebp)
  307e25:	eb 1b                	jmp    307e42 <kfree_s+0x53>
  307e27:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e2a:	8b 00                	mov    (%eax),%eax
  307e2c:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  307e2f:	75 02                	jne    307e33 <kfree_s+0x44>
  307e31:	eb 45                	jmp    307e78 <kfree_s+0x89>
  307e33:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e36:	89 45 ec             	mov    %eax,-0x14(%ebp)
  307e39:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e3c:	8b 40 04             	mov    0x4(%eax),%eax
  307e3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  307e42:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  307e46:	75 df                	jne    307e27 <kfree_s+0x38>
  307e48:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
  307e4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307e4f:	8b 00                	mov    (%eax),%eax
  307e51:	85 c0                	test   %eax,%eax
  307e53:	75 b4                	jne    307e09 <kfree_s+0x1a>
  307e55:	83 ec 08             	sub    $0x8,%esp
  307e58:	ff 75 08             	pushl  0x8(%ebp)
  307e5b:	68 e6 da 30 00       	push   $0x30dae6
  307e60:	e8 43 d8 ff ff       	call   3056a8 <printk>
  307e65:	83 c4 10             	add    $0x10,%esp
  307e68:	83 ec 0c             	sub    $0xc,%esp
  307e6b:	68 f0 da 30 00       	push   $0x30daf0
  307e70:	e8 17 d8 ff ff       	call   30568c <panic>
  307e75:	83 c4 10             	add    $0x10,%esp
  307e78:	fa                   	cli    
  307e79:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e7c:	8b 50 08             	mov    0x8(%eax),%edx
  307e7f:	8b 45 08             	mov    0x8(%ebp),%eax
  307e82:	89 10                	mov    %edx,(%eax)
  307e84:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e87:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
  307e8b:	8d 50 ff             	lea    -0x1(%eax),%edx
  307e8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e91:	66 89 50 0c          	mov    %dx,0xc(%eax)
  307e95:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e98:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
  307e9c:	66 85 c0             	test   %ax,%ax
  307e9f:	0f 85 a9 00 00 00    	jne    307f4e <kfree_s+0x15f>
  307ea5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  307ea9:	74 0b                	je     307eb6 <kfree_s+0xc7>
  307eab:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307eae:	8b 40 04             	mov    0x4(%eax),%eax
  307eb1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  307eb4:	75 11                	jne    307ec7 <kfree_s+0xd8>
  307eb6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  307eba:	75 32                	jne    307eee <kfree_s+0xff>
  307ebc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307ebf:	8b 40 04             	mov    0x4(%eax),%eax
  307ec2:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  307ec5:	74 27                	je     307eee <kfree_s+0xff>
  307ec7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307eca:	8b 40 04             	mov    0x4(%eax),%eax
  307ecd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  307ed0:	eb 16                	jmp    307ee8 <kfree_s+0xf9>
  307ed2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307ed5:	8b 40 04             	mov    0x4(%eax),%eax
  307ed8:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  307edb:	75 02                	jne    307edf <kfree_s+0xf0>
  307edd:	eb 0f                	jmp    307eee <kfree_s+0xff>
  307edf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307ee2:	8b 40 04             	mov    0x4(%eax),%eax
  307ee5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  307ee8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  307eec:	75 e4                	jne    307ed2 <kfree_s+0xe3>
  307eee:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  307ef2:	74 0e                	je     307f02 <kfree_s+0x113>
  307ef4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307ef7:	8b 50 04             	mov    0x4(%eax),%edx
  307efa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307efd:	89 50 04             	mov    %edx,0x4(%eax)
  307f00:	eb 27                	jmp    307f29 <kfree_s+0x13a>
  307f02:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307f05:	8b 40 04             	mov    0x4(%eax),%eax
  307f08:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  307f0b:	74 10                	je     307f1d <kfree_s+0x12e>
  307f0d:	83 ec 0c             	sub    $0xc,%esp
  307f10:	68 16 db 30 00       	push   $0x30db16
  307f15:	e8 72 d7 ff ff       	call   30568c <panic>
  307f1a:	83 c4 10             	add    $0x10,%esp
  307f1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307f20:	8b 50 04             	mov    0x4(%eax),%edx
  307f23:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307f26:	89 50 04             	mov    %edx,0x4(%eax)
  307f29:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307f2c:	8b 00                	mov    (%eax),%eax
  307f2e:	83 ec 0c             	sub    $0xc,%esp
  307f31:	50                   	push   %eax
  307f32:	e8 ea f3 ff ff       	call   307321 <free_page>
  307f37:	83 c4 10             	add    $0x10,%esp
  307f3a:	8b 15 8c 26 31 00    	mov    0x31268c,%edx
  307f40:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307f43:	89 50 04             	mov    %edx,0x4(%eax)
  307f46:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307f49:	a3 8c 26 31 00       	mov    %eax,0x31268c
  307f4e:	fb                   	sti    
  307f4f:	c9                   	leave  
  307f50:	c3                   	ret    
  307f51:	66 90                	xchg   %ax,%ax
  307f53:	90                   	nop

00307f54 <ret>:
  307f54:	55                   	push   %ebp
  307f55:	89 e5                	mov    %esp,%ebp
  307f57:	57                   	push   %edi
  307f58:	56                   	push   %esi
  307f59:	53                   	push   %ebx
  307f5a:	83 ec 10             	sub    $0x10,%esp
  307f5d:	b8 02 00 00 00       	mov    $0x2,%eax
  307f62:	8b 5d 08             	mov    0x8(%ebp),%ebx
  307f65:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  307f68:	ba 00 00 00 00       	mov    $0x0,%edx
  307f6d:	be 00 00 00 00       	mov    $0x0,%esi
  307f72:	bf 00 00 00 00       	mov    $0x0,%edi
  307f77:	cd 80                	int    $0x80
  307f79:	89 45 f0             	mov    %eax,-0x10(%ebp)
  307f7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307f7f:	83 c4 10             	add    $0x10,%esp
  307f82:	5b                   	pop    %ebx
  307f83:	5e                   	pop    %esi
  307f84:	5f                   	pop    %edi
  307f85:	5d                   	pop    %ebp
  307f86:	c3                   	ret    

00307f87 <strcpy>:
  307f87:	55                   	push   %ebp
  307f88:	89 e5                	mov    %esp,%ebp
  307f8a:	57                   	push   %edi
  307f8b:	56                   	push   %esi
  307f8c:	8b 55 0c             	mov    0xc(%ebp),%edx
  307f8f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  307f92:	89 d6                	mov    %edx,%esi
  307f94:	89 cf                	mov    %ecx,%edi
  307f96:	fc                   	cld    
  307f97:	ac                   	lods   %ds:(%esi),%al
  307f98:	aa                   	stos   %al,%es:(%edi)
  307f99:	84 c0                	test   %al,%al
  307f9b:	75 fa                	jne    307f97 <strcpy+0x10>
  307f9d:	8b 45 08             	mov    0x8(%ebp),%eax
  307fa0:	5e                   	pop    %esi
  307fa1:	5f                   	pop    %edi
  307fa2:	5d                   	pop    %ebp
  307fa3:	c3                   	ret    

00307fa4 <memcpy>:
  307fa4:	55                   	push   %ebp
  307fa5:	89 e5                	mov    %esp,%ebp
  307fa7:	57                   	push   %edi
  307fa8:	56                   	push   %esi
  307fa9:	53                   	push   %ebx
  307faa:	8b 45 10             	mov    0x10(%ebp),%eax
  307fad:	8b 55 0c             	mov    0xc(%ebp),%edx
  307fb0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  307fb3:	89 c1                	mov    %eax,%ecx
  307fb5:	89 d6                	mov    %edx,%esi
  307fb7:	89 df                	mov    %ebx,%edi
  307fb9:	fc                   	cld    
  307fba:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  307fbc:	8b 45 08             	mov    0x8(%ebp),%eax
  307fbf:	5b                   	pop    %ebx
  307fc0:	5e                   	pop    %esi
  307fc1:	5f                   	pop    %edi
  307fc2:	5d                   	pop    %ebp
  307fc3:	c3                   	ret    

00307fc4 <share_items>:
  307fc4:	55                   	push   %ebp
  307fc5:	89 e5                	mov    %esp,%ebp
  307fc7:	83 ec 18             	sub    $0x18,%esp
  307fca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  307fd1:	eb 3a                	jmp    30800d <share_items+0x49>
  307fd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307fd6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  307fdd:	8b 45 08             	mov    0x8(%ebp),%eax
  307fe0:	01 d0                	add    %edx,%eax
  307fe2:	0f b6 00             	movzbl (%eax),%eax
  307fe5:	83 e0 01             	and    $0x1,%eax
  307fe8:	84 c0                	test   %al,%al
  307fea:	74 1d                	je     308009 <share_items+0x45>
  307fec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307fef:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  307ff6:	8b 45 08             	mov    0x8(%ebp),%eax
  307ff9:	01 d0                	add    %edx,%eax
  307ffb:	8b 00                	mov    (%eax),%eax
  307ffd:	83 ec 0c             	sub    $0xc,%esp
  308000:	50                   	push   %eax
  308001:	e8 be f2 ff ff       	call   3072c4 <share_page>
  308006:	83 c4 10             	add    $0x10,%esp
  308009:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  30800d:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  308014:	7e bd                	jle    307fd3 <share_items+0xf>
  308016:	c9                   	leave  
  308017:	c3                   	ret    

00308018 <copy_dir>:
  308018:	55                   	push   %ebp
  308019:	89 e5                	mov    %esp,%ebp
  30801b:	57                   	push   %edi
  30801c:	56                   	push   %esi
  30801d:	83 ec 10             	sub    $0x10,%esp
  308020:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  308027:	e8 bd f1 ff ff       	call   3071e9 <get_free_page>
  30802c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30802f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  308033:	75 10                	jne    308045 <copy_dir+0x2d>
  308035:	83 ec 0c             	sub    $0xc,%esp
  308038:	68 30 db 30 00       	push   $0x30db30
  30803d:	e8 4a d6 ff ff       	call   30568c <panic>
  308042:	83 c4 10             	add    $0x10,%esp
  308045:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
  30804c:	eb 73                	jmp    3080c1 <copy_dir+0xa9>
  30804e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308051:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308058:	8b 45 08             	mov    0x8(%ebp),%eax
  30805b:	01 d0                	add    %edx,%eax
  30805d:	0f b6 10             	movzbl (%eax),%edx
  308060:	83 e2 fd             	and    $0xfffffffd,%edx
  308063:	88 10                	mov    %dl,(%eax)
  308065:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308068:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30806f:	8b 45 08             	mov    0x8(%ebp),%eax
  308072:	01 d0                	add    %edx,%eax
  308074:	0f b6 00             	movzbl (%eax),%eax
  308077:	83 e0 01             	and    $0x1,%eax
  30807a:	84 c0                	test   %al,%al
  30807c:	74 3f                	je     3080bd <copy_dir+0xa5>
  30807e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308081:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308088:	8b 45 08             	mov    0x8(%ebp),%eax
  30808b:	01 d0                	add    %edx,%eax
  30808d:	8b 00                	mov    (%eax),%eax
  30808f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  308094:	83 ec 0c             	sub    $0xc,%esp
  308097:	50                   	push   %eax
  308098:	e8 27 ff ff ff       	call   307fc4 <share_items>
  30809d:	83 c4 10             	add    $0x10,%esp
  3080a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3080a3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3080aa:	8b 45 08             	mov    0x8(%ebp),%eax
  3080ad:	01 d0                	add    %edx,%eax
  3080af:	8b 00                	mov    (%eax),%eax
  3080b1:	83 ec 0c             	sub    $0xc,%esp
  3080b4:	50                   	push   %eax
  3080b5:	e8 0a f2 ff ff       	call   3072c4 <share_page>
  3080ba:	83 c4 10             	add    $0x10,%esp
  3080bd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3080c1:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  3080c8:	7e 84                	jle    30804e <copy_dir+0x36>
  3080ca:	8b 45 08             	mov    0x8(%ebp),%eax
  3080cd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  3080d0:	b9 00 04 00 00       	mov    $0x400,%ecx
  3080d5:	89 c6                	mov    %eax,%esi
  3080d7:	89 d7                	mov    %edx,%edi
  3080d9:	fc                   	cld    
  3080da:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  3080dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3080df:	8d 65 f8             	lea    -0x8(%ebp),%esp
  3080e2:	5e                   	pop    %esi
  3080e3:	5f                   	pop    %edi
  3080e4:	5d                   	pop    %ebp
  3080e5:	c3                   	ret    

003080e6 <put_item>:
  3080e6:	55                   	push   %ebp
  3080e7:	89 e5                	mov    %esp,%ebp
  3080e9:	8b 45 10             	mov    0x10(%ebp),%eax
  3080ec:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3080f3:	8b 45 08             	mov    0x8(%ebp),%eax
  3080f6:	01 d0                	add    %edx,%eax
  3080f8:	8b 55 0c             	mov    0xc(%ebp),%edx
  3080fb:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  308101:	83 ca 07             	or     $0x7,%edx
  308104:	89 10                	mov    %edx,(%eax)
  308106:	5d                   	pop    %ebp
  308107:	c3                   	ret    

00308108 <clone_space>:
  308108:	55                   	push   %ebp
  308109:	89 e5                	mov    %esp,%ebp
  30810b:	57                   	push   %edi
  30810c:	56                   	push   %esi
  30810d:	83 ec 10             	sub    $0x10,%esp
  308110:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  308117:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  30811e:	8b 45 08             	mov    0x8(%ebp),%eax
  308121:	83 c0 04             	add    $0x4,%eax
  308124:	8b 00                	mov    (%eax),%eax
  308126:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  30812b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30812e:	83 ec 0c             	sub    $0xc,%esp
  308131:	ff 75 08             	pushl  0x8(%ebp)
  308134:	e8 df fe ff ff       	call   308018 <copy_dir>
  308139:	83 c4 10             	add    $0x10,%esp
  30813c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30813f:	e8 a5 f0 ff ff       	call   3071e9 <get_free_page>
  308144:	89 45 e8             	mov    %eax,-0x18(%ebp)
  308147:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  30814b:	75 17                	jne    308164 <clone_space+0x5c>
  30814d:	83 ec 04             	sub    $0x4,%esp
  308150:	6a 4f                	push   $0x4f
  308152:	68 4e db 30 00       	push   $0x30db4e
  308157:	68 58 db 30 00       	push   $0x30db58
  30815c:	e8 47 d5 ff ff       	call   3056a8 <printk>
  308161:	83 c4 10             	add    $0x10,%esp
  308164:	8b 45 e8             	mov    -0x18(%ebp),%eax
  308167:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30816a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30816d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  308170:	b9 00 04 00 00       	mov    $0x400,%ecx
  308175:	89 c6                	mov    %eax,%esi
  308177:	89 d7                	mov    %edx,%edi
  308179:	fc                   	cld    
  30817a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  30817c:	6a 07                	push   $0x7
  30817e:	68 ff 03 00 00       	push   $0x3ff
  308183:	ff 75 0c             	pushl  0xc(%ebp)
  308186:	ff 75 f0             	pushl  -0x10(%ebp)
  308189:	e8 58 ff ff ff       	call   3080e6 <put_item>
  30818e:	83 c4 10             	add    $0x10,%esp
  308191:	6a 07                	push   $0x7
  308193:	6a 01                	push   $0x1
  308195:	ff 75 f0             	pushl  -0x10(%ebp)
  308198:	ff 75 f4             	pushl  -0xc(%ebp)
  30819b:	e8 46 ff ff ff       	call   3080e6 <put_item>
  3081a0:	83 c4 10             	add    $0x10,%esp
  3081a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3081a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  3081a9:	5e                   	pop    %esi
  3081aa:	5f                   	pop    %edi
  3081ab:	5d                   	pop    %ebp
  3081ac:	c3                   	ret    

003081ad <clone>:
  3081ad:	55                   	push   %ebp
  3081ae:	89 e5                	mov    %esp,%ebp
  3081b0:	83 ec 28             	sub    $0x28,%esp
  3081b3:	8b 45 08             	mov    0x8(%ebp),%eax
  3081b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3081b9:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  3081bd:	7f 18                	jg     3081d7 <clone+0x2a>
  3081bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3081c3:	78 12                	js     3081d7 <clone+0x2a>
  3081c5:	a1 04 26 31 00       	mov    0x312604,%eax
  3081ca:	8b 55 08             	mov    0x8(%ebp),%edx
  3081cd:	83 c2 08             	add    $0x8,%edx
  3081d0:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  3081d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3081d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3081da:	8b 04 85 80 42 31 00 	mov    0x314280(,%eax,4),%eax
  3081e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3081e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3081e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3081ea:	83 ec 0c             	sub    $0xc,%esp
  3081ed:	ff 75 ec             	pushl  -0x14(%ebp)
  3081f0:	e8 09 ef ff ff       	call   3070fe <cloneObject>
  3081f5:	83 c4 10             	add    $0x10,%esp
  3081f8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3081fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3081fe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  308201:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  308205:	75 12                	jne    308219 <clone+0x6c>
  308207:	83 ec 08             	sub    $0x8,%esp
  30820a:	6a f4                	push   $0xfffffff4
  30820c:	ff 75 08             	pushl  0x8(%ebp)
  30820f:	e8 40 fd ff ff       	call   307f54 <ret>
  308214:	83 c4 10             	add    $0x10,%esp
  308217:	eb 5f                	jmp    308278 <clone+0xcb>
  308219:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30821c:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  308222:	83 ec 08             	sub    $0x8,%esp
  308225:	ff 75 e4             	pushl  -0x1c(%ebp)
  308228:	50                   	push   %eax
  308229:	e8 da fe ff ff       	call   308108 <clone_space>
  30822e:	83 c4 10             	add    $0x10,%esp
  308231:	89 c2                	mov    %eax,%edx
  308233:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  308236:	89 90 b4 00 00 00    	mov    %edx,0xb4(%eax)
  30823c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30823f:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
  308245:	83 ec 0c             	sub    $0xc,%esp
  308248:	50                   	push   %eax
  308249:	e8 b2 0f 00 00       	call   309200 <copyvm>
  30824e:	83 c4 10             	add    $0x10,%esp
  308251:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  308254:	8b 00                	mov    (%eax),%eax
  308256:	83 ec 08             	sub    $0x8,%esp
  308259:	6a 00                	push   $0x0
  30825b:	50                   	push   %eax
  30825c:	e8 f3 fc ff ff       	call   307f54 <ret>
  308261:	83 c4 10             	add    $0x10,%esp
  308264:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  308267:	8b 00                	mov    (%eax),%eax
  308269:	83 ec 08             	sub    $0x8,%esp
  30826c:	50                   	push   %eax
  30826d:	ff 75 08             	pushl  0x8(%ebp)
  308270:	e8 df fc ff ff       	call   307f54 <ret>
  308275:	83 c4 10             	add    $0x10,%esp
  308278:	c9                   	leave  
  308279:	c3                   	ret    

0030827a <delete_table>:
  30827a:	55                   	push   %ebp
  30827b:	89 e5                	mov    %esp,%ebp
  30827d:	83 ec 18             	sub    $0x18,%esp
  308280:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  308287:	e9 8d 00 00 00       	jmp    308319 <delete_table+0x9f>
  30828c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30828f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308296:	8b 45 08             	mov    0x8(%ebp),%eax
  308299:	01 d0                	add    %edx,%eax
  30829b:	0f b6 00             	movzbl (%eax),%eax
  30829e:	83 e0 01             	and    $0x1,%eax
  3082a1:	84 c0                	test   %al,%al
  3082a3:	74 70                	je     308315 <delete_table+0x9b>
  3082a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3082a8:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3082af:	8b 45 08             	mov    0x8(%ebp),%eax
  3082b2:	01 d0                	add    %edx,%eax
  3082b4:	8b 00                	mov    (%eax),%eax
  3082b6:	83 ec 0c             	sub    $0xc,%esp
  3082b9:	50                   	push   %eax
  3082ba:	e8 62 f0 ff ff       	call   307321 <free_page>
  3082bf:	83 c4 10             	add    $0x10,%esp
  3082c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3082c5:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  3082c9:	75 4a                	jne    308315 <delete_table+0x9b>
  3082cb:	83 ec 04             	sub    $0x4,%esp
  3082ce:	6a 6a                	push   $0x6a
  3082d0:	68 4e db 30 00       	push   $0x30db4e
  3082d5:	68 7c db 30 00       	push   $0x30db7c
  3082da:	e8 c9 d3 ff ff       	call   3056a8 <printk>
  3082df:	83 c4 10             	add    $0x10,%esp
  3082e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3082e5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3082ec:	8b 45 08             	mov    0x8(%ebp),%eax
  3082ef:	01 d0                	add    %edx,%eax
  3082f1:	8b 00                	mov    (%eax),%eax
  3082f3:	83 ec 0c             	sub    $0xc,%esp
  3082f6:	6a 6a                	push   $0x6a
  3082f8:	68 4e db 30 00       	push   $0x30db4e
  3082fd:	50                   	push   %eax
  3082fe:	ff 75 f4             	pushl  -0xc(%ebp)
  308301:	68 ac db 30 00       	push   $0x30dbac
  308306:	e8 9d d3 ff ff       	call   3056a8 <printk>
  30830b:	83 c4 20             	add    $0x20,%esp
  30830e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  308313:	eb 16                	jmp    30832b <delete_table+0xb1>
  308315:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  308319:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  308320:	0f 8e 66 ff ff ff    	jle    30828c <delete_table+0x12>
  308326:	b8 00 00 00 00       	mov    $0x0,%eax
  30832b:	c9                   	leave  
  30832c:	c3                   	ret    

0030832d <_delete>:
  30832d:	55                   	push   %ebp
  30832e:	89 e5                	mov    %esp,%ebp
  308330:	83 ec 18             	sub    $0x18,%esp
  308333:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
  30833a:	e9 bd 00 00 00       	jmp    3083fc <_delete+0xcf>
  30833f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308342:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308349:	8b 45 08             	mov    0x8(%ebp),%eax
  30834c:	01 d0                	add    %edx,%eax
  30834e:	0f b6 00             	movzbl (%eax),%eax
  308351:	83 e0 01             	and    $0x1,%eax
  308354:	84 c0                	test   %al,%al
  308356:	0f 84 9c 00 00 00    	je     3083f8 <_delete+0xcb>
  30835c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30835f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308366:	8b 45 08             	mov    0x8(%ebp),%eax
  308369:	01 d0                	add    %edx,%eax
  30836b:	8b 00                	mov    (%eax),%eax
  30836d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  308372:	83 ec 0c             	sub    $0xc,%esp
  308375:	50                   	push   %eax
  308376:	e8 ff fe ff ff       	call   30827a <delete_table>
  30837b:	83 c4 10             	add    $0x10,%esp
  30837e:	83 f8 ff             	cmp    $0xffffffff,%eax
  308381:	74 22                	je     3083a5 <_delete+0x78>
  308383:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308386:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30838d:	8b 45 08             	mov    0x8(%ebp),%eax
  308390:	01 d0                	add    %edx,%eax
  308392:	8b 00                	mov    (%eax),%eax
  308394:	83 ec 0c             	sub    $0xc,%esp
  308397:	50                   	push   %eax
  308398:	e8 84 ef ff ff       	call   307321 <free_page>
  30839d:	83 c4 10             	add    $0x10,%esp
  3083a0:	83 f8 ff             	cmp    $0xffffffff,%eax
  3083a3:	75 3c                	jne    3083e1 <_delete+0xb4>
  3083a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3083a8:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3083af:	8b 45 08             	mov    0x8(%ebp),%eax
  3083b2:	01 d0                	add    %edx,%eax
  3083b4:	8b 00                	mov    (%eax),%eax
  3083b6:	83 ec 0c             	sub    $0xc,%esp
  3083b9:	6a 77                	push   $0x77
  3083bb:	68 4e db 30 00       	push   $0x30db4e
  3083c0:	50                   	push   %eax
  3083c1:	ff 75 f4             	pushl  -0xc(%ebp)
  3083c4:	68 d4 db 30 00       	push   $0x30dbd4
  3083c9:	e8 da d2 ff ff       	call   3056a8 <printk>
  3083ce:	83 c4 20             	add    $0x20,%esp
  3083d1:	83 ec 0c             	sub    $0xc,%esp
  3083d4:	68 fa db 30 00       	push   $0x30dbfa
  3083d9:	e8 ae d2 ff ff       	call   30568c <panic>
  3083de:	83 c4 10             	add    $0x10,%esp
  3083e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3083e4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3083eb:	8b 45 08             	mov    0x8(%ebp),%eax
  3083ee:	01 d0                	add    %edx,%eax
  3083f0:	0f b6 10             	movzbl (%eax),%edx
  3083f3:	83 e2 fe             	and    $0xfffffffe,%edx
  3083f6:	88 10                	mov    %dl,(%eax)
  3083f8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3083fc:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  308403:	0f 8e 36 ff ff ff    	jle    30833f <_delete+0x12>
  308409:	c9                   	leave  
  30840a:	c3                   	ret    

0030840b <delete>:
  30840b:	55                   	push   %ebp
  30840c:	89 e5                	mov    %esp,%ebp
  30840e:	83 ec 28             	sub    $0x28,%esp
  308411:	8b 45 08             	mov    0x8(%ebp),%eax
  308414:	89 45 f4             	mov    %eax,-0xc(%ebp)
  308417:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  30841b:	7f 18                	jg     308435 <delete+0x2a>
  30841d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  308421:	78 12                	js     308435 <delete+0x2a>
  308423:	a1 04 26 31 00       	mov    0x312604,%eax
  308428:	8b 55 08             	mov    0x8(%ebp),%edx
  30842b:	83 c2 08             	add    $0x8,%edx
  30842e:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  308432:	89 45 f4             	mov    %eax,-0xc(%ebp)
  308435:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308438:	8b 04 85 80 42 31 00 	mov    0x314280(,%eax,4),%eax
  30843f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  308442:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308445:	89 45 ec             	mov    %eax,-0x14(%ebp)
  308448:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30844b:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  308451:	89 45 e8             	mov    %eax,-0x18(%ebp)
  308454:	83 ec 0c             	sub    $0xc,%esp
  308457:	ff 75 e8             	pushl  -0x18(%ebp)
  30845a:	e8 ce fe ff ff       	call   30832d <_delete>
  30845f:	83 c4 10             	add    $0x10,%esp
  308462:	8b 45 e8             	mov    -0x18(%ebp),%eax
  308465:	83 ec 0c             	sub    $0xc,%esp
  308468:	50                   	push   %eax
  308469:	e8 b3 ee ff ff       	call   307321 <free_page>
  30846e:	83 c4 10             	add    $0x10,%esp
  308471:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  308474:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
  308478:	75 2a                	jne    3084a4 <delete+0x99>
  30847a:	83 ec 04             	sub    $0x4,%esp
  30847d:	68 85 00 00 00       	push   $0x85
  308482:	68 4e db 30 00       	push   $0x30db4e
  308487:	68 0c dc 30 00       	push   $0x30dc0c
  30848c:	e8 17 d2 ff ff       	call   3056a8 <printk>
  308491:	83 c4 10             	add    $0x10,%esp
  308494:	83 ec 0c             	sub    $0xc,%esp
  308497:	68 fa db 30 00       	push   $0x30dbfa
  30849c:	e8 eb d1 ff ff       	call   30568c <panic>
  3084a1:	83 c4 10             	add    $0x10,%esp
  3084a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3084a7:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
  3084ad:	83 ec 0c             	sub    $0xc,%esp
  3084b0:	50                   	push   %eax
  3084b1:	e8 be 0c 00 00       	call   309174 <delvm>
  3084b6:	83 c4 10             	add    $0x10,%esp
  3084b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3084bc:	c7 80 a0 00 00 00 00 	movl   $0x0,0xa0(%eax)
  3084c3:	00 00 00 
  3084c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3084c9:	8b 40 0c             	mov    0xc(%eax),%eax
  3084cc:	83 ec 08             	sub    $0x8,%esp
  3084cf:	ff 75 08             	pushl  0x8(%ebp)
  3084d2:	50                   	push   %eax
  3084d3:	e8 7c fa ff ff       	call   307f54 <ret>
  3084d8:	83 c4 10             	add    $0x10,%esp
  3084db:	c9                   	leave  
  3084dc:	c3                   	ret    

003084dd <put_page>:
  3084dd:	55                   	push   %ebp
  3084de:	89 e5                	mov    %esp,%ebp
  3084e0:	83 ec 18             	sub    $0x18,%esp
  3084e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3084ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  3084ed:	c1 e8 16             	shr    $0x16,%eax
  3084f0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3084f7:	8b 45 08             	mov    0x8(%ebp),%eax
  3084fa:	01 d0                	add    %edx,%eax
  3084fc:	0f b6 00             	movzbl (%eax),%eax
  3084ff:	83 e0 01             	and    $0x1,%eax
  308502:	84 c0                	test   %al,%al
  308504:	75 2c                	jne    308532 <put_page+0x55>
  308506:	e8 de ec ff ff       	call   3071e9 <get_free_page>
  30850b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30850e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  308512:	75 07                	jne    30851b <put_page+0x3e>
  308514:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  308519:	eb 61                	jmp    30857c <put_page+0x9f>
  30851b:	8b 45 0c             	mov    0xc(%ebp),%eax
  30851e:	c1 e8 16             	shr    $0x16,%eax
  308521:	6a 07                	push   $0x7
  308523:	50                   	push   %eax
  308524:	ff 75 f4             	pushl  -0xc(%ebp)
  308527:	ff 75 08             	pushl  0x8(%ebp)
  30852a:	e8 b7 fb ff ff       	call   3080e6 <put_item>
  30852f:	83 c4 10             	add    $0x10,%esp
  308532:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  308536:	75 07                	jne    30853f <put_page+0x62>
  308538:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  30853d:	eb 3d                	jmp    30857c <put_page+0x9f>
  30853f:	8b 45 0c             	mov    0xc(%ebp),%eax
  308542:	c1 e8 16             	shr    $0x16,%eax
  308545:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30854c:	8b 45 08             	mov    0x8(%ebp),%eax
  30854f:	01 d0                	add    %edx,%eax
  308551:	8b 00                	mov    (%eax),%eax
  308553:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  308558:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30855b:	8b 45 0c             	mov    0xc(%ebp),%eax
  30855e:	c1 e8 0c             	shr    $0xc,%eax
  308561:	25 ff 03 00 00       	and    $0x3ff,%eax
  308566:	6a 07                	push   $0x7
  308568:	50                   	push   %eax
  308569:	ff 75 10             	pushl  0x10(%ebp)
  30856c:	ff 75 f4             	pushl  -0xc(%ebp)
  30856f:	e8 72 fb ff ff       	call   3080e6 <put_item>
  308574:	83 c4 10             	add    $0x10,%esp
  308577:	b8 00 00 00 00       	mov    $0x0,%eax
  30857c:	c9                   	leave  
  30857d:	c3                   	ret    

0030857e <np_page>:
  30857e:	55                   	push   %ebp
  30857f:	89 e5                	mov    %esp,%ebp
  308581:	83 ec 18             	sub    $0x18,%esp
  308584:	8b 45 08             	mov    0x8(%ebp),%eax
  308587:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30858a:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  30858e:	7f 18                	jg     3085a8 <np_page+0x2a>
  308590:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  308594:	78 12                	js     3085a8 <np_page+0x2a>
  308596:	a1 04 26 31 00       	mov    0x312604,%eax
  30859b:	8b 55 08             	mov    0x8(%ebp),%edx
  30859e:	83 c2 08             	add    $0x8,%edx
  3085a1:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  3085a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3085a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3085ab:	8b 04 85 80 42 31 00 	mov    0x314280(,%eax,4),%eax
  3085b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3085b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3085b8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3085bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3085be:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
  3085c4:	83 ec 08             	sub    $0x8,%esp
  3085c7:	ff 75 0c             	pushl  0xc(%ebp)
  3085ca:	50                   	push   %eax
  3085cb:	e8 9c 0c 00 00       	call   30926c <dovm>
  3085d0:	83 c4 10             	add    $0x10,%esp
  3085d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3085d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3085d9:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  3085df:	83 ec 04             	sub    $0x4,%esp
  3085e2:	ff 75 e8             	pushl  -0x18(%ebp)
  3085e5:	ff 75 0c             	pushl  0xc(%ebp)
  3085e8:	50                   	push   %eax
  3085e9:	e8 ef fe ff ff       	call   3084dd <put_page>
  3085ee:	83 c4 10             	add    $0x10,%esp
  3085f1:	83 ec 08             	sub    $0x8,%esp
  3085f4:	50                   	push   %eax
  3085f5:	ff 75 08             	pushl  0x8(%ebp)
  3085f8:	e8 57 f9 ff ff       	call   307f54 <ret>
  3085fd:	83 c4 10             	add    $0x10,%esp
  308600:	c9                   	leave  
  308601:	c3                   	ret    

00308602 <_un_table>:
  308602:	55                   	push   %ebp
  308603:	89 e5                	mov    %esp,%ebp
  308605:	57                   	push   %edi
  308606:	56                   	push   %esi
  308607:	83 ec 10             	sub    $0x10,%esp
  30860a:	8b 45 0c             	mov    0xc(%ebp),%eax
  30860d:	c1 e8 16             	shr    $0x16,%eax
  308610:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308617:	8b 45 08             	mov    0x8(%ebp),%eax
  30861a:	01 d0                	add    %edx,%eax
  30861c:	8b 00                	mov    (%eax),%eax
  30861e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  308623:	89 45 f4             	mov    %eax,-0xc(%ebp)
  308626:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  30862d:	8b 45 0c             	mov    0xc(%ebp),%eax
  308630:	c1 e8 16             	shr    $0x16,%eax
  308633:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30863a:	8b 45 08             	mov    0x8(%ebp),%eax
  30863d:	01 d0                	add    %edx,%eax
  30863f:	0f b6 00             	movzbl (%eax),%eax
  308642:	83 e0 01             	and    $0x1,%eax
  308645:	84 c0                	test   %al,%al
  308647:	75 24                	jne    30866d <_un_table+0x6b>
  308649:	68 a5 00 00 00       	push   $0xa5
  30864e:	68 4e db 30 00       	push   $0x30db4e
  308653:	ff 75 0c             	pushl  0xc(%ebp)
  308656:	68 3c dc 30 00       	push   $0x30dc3c
  30865b:	e8 48 d0 ff ff       	call   3056a8 <printk>
  308660:	83 c4 10             	add    $0x10,%esp
  308663:	b8 00 00 00 00       	mov    $0x0,%eax
  308668:	e9 fc 00 00 00       	jmp    308769 <_un_table+0x167>
  30866d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  308674:	eb 34                	jmp    3086aa <_un_table+0xa8>
  308676:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308679:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308680:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308683:	01 d0                	add    %edx,%eax
  308685:	0f b6 00             	movzbl (%eax),%eax
  308688:	83 e0 01             	and    $0x1,%eax
  30868b:	84 c0                	test   %al,%al
  30868d:	74 17                	je     3086a6 <_un_table+0xa4>
  30868f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308692:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308699:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30869c:	01 d0                	add    %edx,%eax
  30869e:	0f b6 10             	movzbl (%eax),%edx
  3086a1:	83 e2 fd             	and    $0xfffffffd,%edx
  3086a4:	88 10                	mov    %dl,(%eax)
  3086a6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  3086aa:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
  3086b1:	7e c3                	jle    308676 <_un_table+0x74>
  3086b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  3086b6:	c1 e8 16             	shr    $0x16,%eax
  3086b9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3086c0:	8b 45 08             	mov    0x8(%ebp),%eax
  3086c3:	01 d0                	add    %edx,%eax
  3086c5:	8b 00                	mov    (%eax),%eax
  3086c7:	83 ec 0c             	sub    $0xc,%esp
  3086ca:	50                   	push   %eax
  3086cb:	e8 39 ec ff ff       	call   307309 <page_share_nr>
  3086d0:	83 c4 10             	add    $0x10,%esp
  3086d3:	83 f8 01             	cmp    $0x1,%eax
  3086d6:	0f 8e 8a 00 00 00    	jle    308766 <_un_table+0x164>
  3086dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  3086df:	c1 e8 16             	shr    $0x16,%eax
  3086e2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3086e9:	8b 45 08             	mov    0x8(%ebp),%eax
  3086ec:	01 d0                	add    %edx,%eax
  3086ee:	8b 00                	mov    (%eax),%eax
  3086f0:	83 ec 0c             	sub    $0xc,%esp
  3086f3:	50                   	push   %eax
  3086f4:	e8 28 ec ff ff       	call   307321 <free_page>
  3086f9:	83 c4 10             	add    $0x10,%esp
  3086fc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3086ff:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%ebp)
  308703:	75 34                	jne    308739 <_un_table+0x137>
  308705:	83 ec 04             	sub    $0x4,%esp
  308708:	68 b2 00 00 00       	push   $0xb2
  30870d:	68 4e db 30 00       	push   $0x30db4e
  308712:	68 74 dc 30 00       	push   $0x30dc74
  308717:	e8 8c cf ff ff       	call   3056a8 <printk>
  30871c:	83 c4 10             	add    $0x10,%esp
  30871f:	68 b2 00 00 00       	push   $0xb2
  308724:	68 4e db 30 00       	push   $0x30db4e
  308729:	ff 75 0c             	pushl  0xc(%ebp)
  30872c:	68 b8 dc 30 00       	push   $0x30dcb8
  308731:	e8 72 cf ff ff       	call   3056a8 <printk>
  308736:	83 c4 10             	add    $0x10,%esp
  308739:	e8 ab ea ff ff       	call   3071e9 <get_free_page>
  30873e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  308741:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  308745:	75 07                	jne    30874e <_un_table+0x14c>
  308747:	b8 00 00 00 00       	mov    $0x0,%eax
  30874c:	eb 1b                	jmp    308769 <_un_table+0x167>
  30874e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308751:	8b 55 ec             	mov    -0x14(%ebp),%edx
  308754:	b9 00 04 00 00       	mov    $0x400,%ecx
  308759:	89 c6                	mov    %eax,%esi
  30875b:	89 d7                	mov    %edx,%edi
  30875d:	fc                   	cld    
  30875e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  308760:	8b 45 ec             	mov    -0x14(%ebp),%eax
  308763:	89 45 f4             	mov    %eax,-0xc(%ebp)
  308766:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308769:	8d 65 f8             	lea    -0x8(%ebp),%esp
  30876c:	5e                   	pop    %esi
  30876d:	5f                   	pop    %edi
  30876e:	5d                   	pop    %ebp
  30876f:	c3                   	ret    

00308770 <_un_page>:
  308770:	55                   	push   %ebp
  308771:	89 e5                	mov    %esp,%ebp
  308773:	57                   	push   %edi
  308774:	56                   	push   %esi
  308775:	83 ec 10             	sub    $0x10,%esp
  308778:	8b 45 0c             	mov    0xc(%ebp),%eax
  30877b:	c1 e8 0c             	shr    $0xc,%eax
  30877e:	25 ff 03 00 00       	and    $0x3ff,%eax
  308783:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30878a:	8b 45 08             	mov    0x8(%ebp),%eax
  30878d:	01 d0                	add    %edx,%eax
  30878f:	8b 00                	mov    (%eax),%eax
  308791:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  308796:	89 45 f4             	mov    %eax,-0xc(%ebp)
  308799:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  3087a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  3087a3:	c1 e8 0c             	shr    $0xc,%eax
  3087a6:	25 ff 03 00 00       	and    $0x3ff,%eax
  3087ab:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3087b2:	8b 45 08             	mov    0x8(%ebp),%eax
  3087b5:	01 d0                	add    %edx,%eax
  3087b7:	0f b6 00             	movzbl (%eax),%eax
  3087ba:	83 e0 01             	and    $0x1,%eax
  3087bd:	84 c0                	test   %al,%al
  3087bf:	75 24                	jne    3087e5 <_un_page+0x75>
  3087c1:	68 c1 00 00 00       	push   $0xc1
  3087c6:	68 4e db 30 00       	push   $0x30db4e
  3087cb:	ff 75 0c             	pushl  0xc(%ebp)
  3087ce:	68 fc dc 30 00       	push   $0x30dcfc
  3087d3:	e8 d0 ce ff ff       	call   3056a8 <printk>
  3087d8:	83 c4 10             	add    $0x10,%esp
  3087db:	b8 00 00 00 00       	mov    $0x0,%eax
  3087e0:	e9 c0 00 00 00       	jmp    3088a5 <_un_page+0x135>
  3087e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  3087e8:	c1 e8 0c             	shr    $0xc,%eax
  3087eb:	25 ff 03 00 00       	and    $0x3ff,%eax
  3087f0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3087f7:	8b 45 08             	mov    0x8(%ebp),%eax
  3087fa:	01 d0                	add    %edx,%eax
  3087fc:	8b 00                	mov    (%eax),%eax
  3087fe:	83 ec 0c             	sub    $0xc,%esp
  308801:	50                   	push   %eax
  308802:	e8 02 eb ff ff       	call   307309 <page_share_nr>
  308807:	83 c4 10             	add    $0x10,%esp
  30880a:	83 f8 01             	cmp    $0x1,%eax
  30880d:	0f 8e 8f 00 00 00    	jle    3088a2 <_un_page+0x132>
  308813:	8b 45 0c             	mov    0xc(%ebp),%eax
  308816:	c1 e8 0c             	shr    $0xc,%eax
  308819:	25 ff 03 00 00       	and    $0x3ff,%eax
  30881e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308825:	8b 45 08             	mov    0x8(%ebp),%eax
  308828:	01 d0                	add    %edx,%eax
  30882a:	8b 00                	mov    (%eax),%eax
  30882c:	83 ec 0c             	sub    $0xc,%esp
  30882f:	50                   	push   %eax
  308830:	e8 ec ea ff ff       	call   307321 <free_page>
  308835:	83 c4 10             	add    $0x10,%esp
  308838:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30883b:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  30883f:	75 34                	jne    308875 <_un_page+0x105>
  308841:	83 ec 04             	sub    $0x4,%esp
  308844:	68 c8 00 00 00       	push   $0xc8
  308849:	68 4e db 30 00       	push   $0x30db4e
  30884e:	68 28 dd 30 00       	push   $0x30dd28
  308853:	e8 50 ce ff ff       	call   3056a8 <printk>
  308858:	83 c4 10             	add    $0x10,%esp
  30885b:	68 c8 00 00 00       	push   $0xc8
  308860:	68 4e db 30 00       	push   $0x30db4e
  308865:	ff 75 0c             	pushl  0xc(%ebp)
  308868:	68 b8 dc 30 00       	push   $0x30dcb8
  30886d:	e8 36 ce ff ff       	call   3056a8 <printk>
  308872:	83 c4 10             	add    $0x10,%esp
  308875:	e8 6f e9 ff ff       	call   3071e9 <get_free_page>
  30887a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30887d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  308881:	75 07                	jne    30888a <_un_page+0x11a>
  308883:	b8 00 00 00 00       	mov    $0x0,%eax
  308888:	eb 1b                	jmp    3088a5 <_un_page+0x135>
  30888a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30888d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  308890:	b9 00 04 00 00       	mov    $0x400,%ecx
  308895:	89 c6                	mov    %eax,%esi
  308897:	89 d7                	mov    %edx,%edi
  308899:	fc                   	cld    
  30889a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  30889c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30889f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3088a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3088a5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  3088a8:	5e                   	pop    %esi
  3088a9:	5f                   	pop    %edi
  3088aa:	5d                   	pop    %ebp
  3088ab:	c3                   	ret    

003088ac <nw_page>:
  3088ac:	55                   	push   %ebp
  3088ad:	89 e5                	mov    %esp,%ebp
  3088af:	83 ec 28             	sub    $0x28,%esp
  3088b2:	8b 45 08             	mov    0x8(%ebp),%eax
  3088b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3088b8:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  3088bc:	7f 18                	jg     3088d6 <nw_page+0x2a>
  3088be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3088c2:	78 12                	js     3088d6 <nw_page+0x2a>
  3088c4:	a1 04 26 31 00       	mov    0x312604,%eax
  3088c9:	8b 55 08             	mov    0x8(%ebp),%edx
  3088cc:	83 c2 08             	add    $0x8,%edx
  3088cf:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  3088d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3088d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3088d9:	8b 04 85 80 42 31 00 	mov    0x314280(,%eax,4),%eax
  3088e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3088e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3088e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3088e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3088ec:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  3088f2:	83 ec 08             	sub    $0x8,%esp
  3088f5:	ff 75 0c             	pushl  0xc(%ebp)
  3088f8:	50                   	push   %eax
  3088f9:	e8 04 fd ff ff       	call   308602 <_un_table>
  3088fe:	83 c4 10             	add    $0x10,%esp
  308901:	89 45 e8             	mov    %eax,-0x18(%ebp)
  308904:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  308908:	75 10                	jne    30891a <nw_page+0x6e>
  30890a:	83 ec 08             	sub    $0x8,%esp
  30890d:	6a ff                	push   $0xffffffff
  30890f:	ff 75 08             	pushl  0x8(%ebp)
  308912:	e8 3d f6 ff ff       	call   307f54 <ret>
  308917:	83 c4 10             	add    $0x10,%esp
  30891a:	8b 45 0c             	mov    0xc(%ebp),%eax
  30891d:	c1 e8 16             	shr    $0x16,%eax
  308920:	89 c2                	mov    %eax,%edx
  308922:	8b 45 ec             	mov    -0x14(%ebp),%eax
  308925:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  30892b:	6a 07                	push   $0x7
  30892d:	52                   	push   %edx
  30892e:	ff 75 e8             	pushl  -0x18(%ebp)
  308931:	50                   	push   %eax
  308932:	e8 af f7 ff ff       	call   3080e6 <put_item>
  308937:	83 c4 10             	add    $0x10,%esp
  30893a:	83 ec 08             	sub    $0x8,%esp
  30893d:	ff 75 0c             	pushl  0xc(%ebp)
  308940:	ff 75 e8             	pushl  -0x18(%ebp)
  308943:	e8 28 fe ff ff       	call   308770 <_un_page>
  308948:	83 c4 10             	add    $0x10,%esp
  30894b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30894e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  308952:	75 10                	jne    308964 <nw_page+0xb8>
  308954:	83 ec 08             	sub    $0x8,%esp
  308957:	6a ff                	push   $0xffffffff
  308959:	ff 75 08             	pushl  0x8(%ebp)
  30895c:	e8 f3 f5 ff ff       	call   307f54 <ret>
  308961:	83 c4 10             	add    $0x10,%esp
  308964:	8b 45 0c             	mov    0xc(%ebp),%eax
  308967:	c1 e8 0c             	shr    $0xc,%eax
  30896a:	25 ff 03 00 00       	and    $0x3ff,%eax
  30896f:	6a 07                	push   $0x7
  308971:	50                   	push   %eax
  308972:	ff 75 e4             	pushl  -0x1c(%ebp)
  308975:	ff 75 e8             	pushl  -0x18(%ebp)
  308978:	e8 69 f7 ff ff       	call   3080e6 <put_item>
  30897d:	83 c4 10             	add    $0x10,%esp
  308980:	83 ec 08             	sub    $0x8,%esp
  308983:	6a 00                	push   $0x0
  308985:	ff 75 08             	pushl  0x8(%ebp)
  308988:	e8 c7 f5 ff ff       	call   307f54 <ret>
  30898d:	83 c4 10             	add    $0x10,%esp
  308990:	c9                   	leave  
  308991:	c3                   	ret    

00308992 <__va>:
  308992:	55                   	push   %ebp
  308993:	89 e5                	mov    %esp,%ebp
  308995:	83 ec 10             	sub    $0x10,%esp
  308998:	8b 45 0c             	mov    0xc(%ebp),%eax
  30899b:	c1 e8 16             	shr    $0x16,%eax
  30899e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3089a5:	8b 45 08             	mov    0x8(%ebp),%eax
  3089a8:	01 d0                	add    %edx,%eax
  3089aa:	8b 00                	mov    (%eax),%eax
  3089ac:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  3089b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  3089b4:	8b 45 0c             	mov    0xc(%ebp),%eax
  3089b7:	c1 e8 0c             	shr    $0xc,%eax
  3089ba:	25 ff 03 00 00       	and    $0x3ff,%eax
  3089bf:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3089c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3089c9:	01 d0                	add    %edx,%eax
  3089cb:	8b 00                	mov    (%eax),%eax
  3089cd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  3089d2:	89 c2                	mov    %eax,%edx
  3089d4:	8b 45 0c             	mov    0xc(%ebp),%eax
  3089d7:	25 ff 0f 00 00       	and    $0xfff,%eax
  3089dc:	01 d0                	add    %edx,%eax
  3089de:	c9                   	leave  
  3089df:	c3                   	ret    

003089e0 <mm_execvp>:
  3089e0:	55                   	push   %ebp
  3089e1:	89 e5                	mov    %esp,%ebp
  3089e3:	83 ec 28             	sub    $0x28,%esp
  3089e6:	8b 45 08             	mov    0x8(%ebp),%eax
  3089e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3089ec:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  3089f0:	7f 18                	jg     308a0a <mm_execvp+0x2a>
  3089f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3089f6:	78 12                	js     308a0a <mm_execvp+0x2a>
  3089f8:	a1 04 26 31 00       	mov    0x312604,%eax
  3089fd:	8b 55 08             	mov    0x8(%ebp),%edx
  308a00:	83 c2 08             	add    $0x8,%edx
  308a03:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  308a07:	89 45 f4             	mov    %eax,-0xc(%ebp)
  308a0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308a0d:	8b 04 85 80 42 31 00 	mov    0x314280(,%eax,4),%eax
  308a14:	89 45 f0             	mov    %eax,-0x10(%ebp)
  308a17:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308a1a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  308a1d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  308a20:	c7 80 b0 00 00 00 bc 	movl   $0x7fffbc,0xb0(%eax)
  308a27:	ff 7f 00 
  308a2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  308a2d:	8b 90 b0 00 00 00    	mov    0xb0(%eax),%edx
  308a33:	8b 45 ec             	mov    -0x14(%ebp),%eax
  308a36:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  308a3c:	52                   	push   %edx
  308a3d:	50                   	push   %eax
  308a3e:	e8 4f ff ff ff       	call   308992 <__va>
  308a43:	83 c4 08             	add    $0x8,%esp
  308a46:	89 45 e8             	mov    %eax,-0x18(%ebp)
  308a49:	8b 45 ec             	mov    -0x14(%ebp),%eax
  308a4c:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
  308a52:	83 ec 0c             	sub    $0xc,%esp
  308a55:	50                   	push   %eax
  308a56:	e8 19 07 00 00       	call   309174 <delvm>
  308a5b:	83 c4 10             	add    $0x10,%esp
  308a5e:	ff 75 e8             	pushl  -0x18(%ebp)
  308a61:	ff 75 14             	pushl  0x14(%ebp)
  308a64:	ff 75 10             	pushl  0x10(%ebp)
  308a67:	ff 75 0c             	pushl  0xc(%ebp)
  308a6a:	e8 f3 03 00 00       	call   308e62 <mkvm>
  308a6f:	83 c4 10             	add    $0x10,%esp
  308a72:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  308a75:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  308a79:	75 1a                	jne    308a95 <mm_execvp+0xb5>
  308a7b:	83 ec 04             	sub    $0x4,%esp
  308a7e:	68 e9 00 00 00       	push   $0xe9
  308a83:	68 4e db 30 00       	push   $0x30db4e
  308a88:	68 70 dd 30 00       	push   $0x30dd70
  308a8d:	e8 16 cc ff ff       	call   3056a8 <printk>
  308a92:	83 c4 10             	add    $0x10,%esp
  308a95:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  308a98:	8b 45 ec             	mov    -0x14(%ebp),%eax
  308a9b:	89 90 a0 00 00 00    	mov    %edx,0xa0(%eax)
  308aa1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  308aa4:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  308aaa:	83 ec 0c             	sub    $0xc,%esp
  308aad:	50                   	push   %eax
  308aae:	e8 7a f8 ff ff       	call   30832d <_delete>
  308ab3:	83 c4 10             	add    $0x10,%esp
  308ab6:	83 ec 08             	sub    $0x8,%esp
  308ab9:	6a 00                	push   $0x0
  308abb:	ff 75 08             	pushl  0x8(%ebp)
  308abe:	e8 91 f4 ff ff       	call   307f54 <ret>
  308ac3:	83 c4 10             	add    $0x10,%esp
  308ac6:	c9                   	leave  
  308ac7:	c3                   	ret    

00308ac8 <_wait>:
  308ac8:	55                   	push   %ebp
  308ac9:	89 e5                	mov    %esp,%ebp
  308acb:	5d                   	pop    %ebp
  308acc:	c3                   	ret    

00308acd <__clone_space__>:
  308acd:	55                   	push   %ebp
  308ace:	89 e5                	mov    %esp,%ebp
  308ad0:	57                   	push   %edi
  308ad1:	56                   	push   %esi
  308ad2:	83 ec 10             	sub    $0x10,%esp
  308ad5:	e8 0f e7 ff ff       	call   3071e9 <get_free_page>
  308ada:	89 45 f0             	mov    %eax,-0x10(%ebp)
  308add:	e8 07 e7 ff ff       	call   3071e9 <get_free_page>
  308ae2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  308ae5:	8b 45 08             	mov    0x8(%ebp),%eax
  308ae8:	83 c0 04             	add    $0x4,%eax
  308aeb:	8b 00                	mov    (%eax),%eax
  308aed:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  308af2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  308af5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  308af9:	74 06                	je     308b01 <__clone_space__+0x34>
  308afb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  308aff:	75 10                	jne    308b11 <__clone_space__+0x44>
  308b01:	83 ec 0c             	sub    $0xc,%esp
  308b04:	68 9c dd 30 00       	push   $0x30dd9c
  308b09:	e8 7e cb ff ff       	call   30568c <panic>
  308b0e:	83 c4 10             	add    $0x10,%esp
  308b11:	8b 45 08             	mov    0x8(%ebp),%eax
  308b14:	8b 55 f0             	mov    -0x10(%ebp),%edx
  308b17:	b9 00 04 00 00       	mov    $0x400,%ecx
  308b1c:	89 c6                	mov    %eax,%esi
  308b1e:	89 d7                	mov    %edx,%edi
  308b20:	fc                   	cld    
  308b21:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  308b23:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
  308b2a:	eb 1b                	jmp    308b47 <__clone_space__+0x7a>
  308b2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308b2f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308b36:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308b39:	01 d0                	add    %edx,%eax
  308b3b:	0f b6 10             	movzbl (%eax),%edx
  308b3e:	83 e2 fe             	and    $0xfffffffe,%edx
  308b41:	88 10                	mov    %dl,(%eax)
  308b43:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  308b47:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  308b4e:	7e dc                	jle    308b2c <__clone_space__+0x5f>
  308b50:	8b 45 e8             	mov    -0x18(%ebp),%eax
  308b53:	8b 55 ec             	mov    -0x14(%ebp),%edx
  308b56:	b9 00 04 00 00       	mov    $0x400,%ecx
  308b5b:	89 c6                	mov    %eax,%esi
  308b5d:	89 d7                	mov    %edx,%edi
  308b5f:	fc                   	cld    
  308b60:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  308b62:	6a 07                	push   $0x7
  308b64:	68 ff 03 00 00       	push   $0x3ff
  308b69:	ff 75 0c             	pushl  0xc(%ebp)
  308b6c:	ff 75 ec             	pushl  -0x14(%ebp)
  308b6f:	e8 72 f5 ff ff       	call   3080e6 <put_item>
  308b74:	83 c4 10             	add    $0x10,%esp
  308b77:	6a 07                	push   $0x7
  308b79:	6a 01                	push   $0x1
  308b7b:	ff 75 ec             	pushl  -0x14(%ebp)
  308b7e:	ff 75 f0             	pushl  -0x10(%ebp)
  308b81:	e8 60 f5 ff ff       	call   3080e6 <put_item>
  308b86:	83 c4 10             	add    $0x10,%esp
  308b89:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308b8c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  308b8f:	5e                   	pop    %esi
  308b90:	5f                   	pop    %edi
  308b91:	5d                   	pop    %ebp
  308b92:	c3                   	ret    

00308b93 <make_task>:
  308b93:	55                   	push   %ebp
  308b94:	89 e5                	mov    %esp,%ebp
  308b96:	57                   	push   %edi
  308b97:	53                   	push   %ebx
  308b98:	83 ec 50             	sub    $0x50,%esp
  308b9b:	a1 04 26 31 00       	mov    0x312604,%eax
  308ba0:	83 ec 0c             	sub    $0xc,%esp
  308ba3:	50                   	push   %eax
  308ba4:	e8 55 e5 ff ff       	call   3070fe <cloneObject>
  308ba9:	83 c4 10             	add    $0x10,%esp
  308bac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  308baf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308bb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  308bb5:	a1 04 26 31 00       	mov    0x312604,%eax
  308bba:	89 45 ec             	mov    %eax,-0x14(%ebp)
  308bbd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  308bc0:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  308bc6:	83 ec 08             	sub    $0x8,%esp
  308bc9:	ff 75 f0             	pushl  -0x10(%ebp)
  308bcc:	50                   	push   %eax
  308bcd:	e8 fb fe ff ff       	call   308acd <__clone_space__>
  308bd2:	83 c4 10             	add    $0x10,%esp
  308bd5:	89 c2                	mov    %eax,%edx
  308bd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308bda:	89 90 b4 00 00 00    	mov    %edx,0xb4(%eax)
  308be0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308be3:	c7 80 b0 00 00 00 bc 	movl   $0x7fffbc,0xb0(%eax)
  308bea:	ff 7f 00 
  308bed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308bf0:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
  308bf7:	00 00 00 
  308bfa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308bfd:	c7 80 a4 00 00 00 14 	movl   $0x14,0xa4(%eax)
  308c04:	00 00 00 
  308c07:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308c0a:	c7 80 a8 00 00 00 14 	movl   $0x14,0xa8(%eax)
  308c11:	00 00 00 
  308c14:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308c17:	83 c0 18             	add    $0x18,%eax
  308c1a:	83 ec 08             	sub    $0x8,%esp
  308c1d:	ff 75 08             	pushl  0x8(%ebp)
  308c20:	50                   	push   %eax
  308c21:	e8 61 f3 ff ff       	call   307f87 <strcpy>
  308c26:	83 c4 10             	add    $0x10,%esp
  308c29:	8d 5d a8             	lea    -0x58(%ebp),%ebx
  308c2c:	b8 00 00 00 00       	mov    $0x0,%eax
  308c31:	ba 11 00 00 00       	mov    $0x11,%edx
  308c36:	89 df                	mov    %ebx,%edi
  308c38:	89 d1                	mov    %edx,%ecx
  308c3a:	f3 ab                	rep stos %eax,%es:(%edi)
  308c3c:	c7 45 a8 10 00 00 00 	movl   $0x10,-0x58(%ebp)
  308c43:	c7 45 ac 10 00 00 00 	movl   $0x10,-0x54(%ebp)
  308c4a:	c7 45 b0 10 00 00 00 	movl   $0x10,-0x50(%ebp)
  308c51:	c7 45 b4 10 00 00 00 	movl   $0x10,-0x4c(%ebp)
  308c58:	8b 45 0c             	mov    0xc(%ebp),%eax
  308c5b:	89 45 d8             	mov    %eax,-0x28(%ebp)
  308c5e:	c7 45 dc 08 00 00 00 	movl   $0x8,-0x24(%ebp)
  308c65:	c7 45 e0 00 02 00 00 	movl   $0x200,-0x20(%ebp)
  308c6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308c6f:	8d 90 bc 0f 00 00    	lea    0xfbc(%eax),%edx
  308c75:	83 ec 04             	sub    $0x4,%esp
  308c78:	6a 44                	push   $0x44
  308c7a:	8d 45 a8             	lea    -0x58(%ebp),%eax
  308c7d:	50                   	push   %eax
  308c7e:	52                   	push   %edx
  308c7f:	e8 20 f3 ff ff       	call   307fa4 <memcpy>
  308c84:	83 c4 10             	add    $0x10,%esp
  308c87:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308c8a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  308c8d:	5b                   	pop    %ebx
  308c8e:	5f                   	pop    %edi
  308c8f:	5d                   	pop    %ebp
  308c90:	c3                   	ret    

00308c91 <_mm_init>:
  308c91:	55                   	push   %ebp
  308c92:	89 e5                	mov    %esp,%ebp
  308c94:	57                   	push   %edi
  308c95:	56                   	push   %esi
  308c96:	53                   	push   %ebx
  308c97:	83 ec 2c             	sub    $0x2c,%esp
  308c9a:	b8 03 00 00 00       	mov    $0x3,%eax
  308c9f:	bb 04 00 00 00       	mov    $0x4,%ebx
  308ca4:	b9 ad 81 30 00       	mov    $0x3081ad,%ecx
  308ca9:	ba 00 00 00 00       	mov    $0x0,%edx
  308cae:	be 00 00 00 00       	mov    $0x0,%esi
  308cb3:	bf 00 00 00 00       	mov    $0x0,%edi
  308cb8:	cd 80                	int    $0x80
  308cba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  308cbd:	b8 03 00 00 00       	mov    $0x3,%eax
  308cc2:	bb 03 00 00 00       	mov    $0x3,%ebx
  308cc7:	b9 0b 84 30 00       	mov    $0x30840b,%ecx
  308ccc:	ba 00 00 00 00       	mov    $0x0,%edx
  308cd1:	be 00 00 00 00       	mov    $0x0,%esi
  308cd6:	bf 00 00 00 00       	mov    $0x0,%edi
  308cdb:	cd 80                	int    $0x80
  308cdd:	89 45 e0             	mov    %eax,-0x20(%ebp)
  308ce0:	b8 03 00 00 00       	mov    $0x3,%eax
  308ce5:	bb 07 00 00 00       	mov    $0x7,%ebx
  308cea:	b9 7e 85 30 00       	mov    $0x30857e,%ecx
  308cef:	ba 00 00 00 00       	mov    $0x0,%edx
  308cf4:	be 00 00 00 00       	mov    $0x0,%esi
  308cf9:	bf 00 00 00 00       	mov    $0x0,%edi
  308cfe:	cd 80                	int    $0x80
  308d00:	89 45 dc             	mov    %eax,-0x24(%ebp)
  308d03:	b8 03 00 00 00       	mov    $0x3,%eax
  308d08:	bb 08 00 00 00       	mov    $0x8,%ebx
  308d0d:	b9 ac 88 30 00       	mov    $0x3088ac,%ecx
  308d12:	ba 00 00 00 00       	mov    $0x0,%edx
  308d17:	be 00 00 00 00       	mov    $0x0,%esi
  308d1c:	bf 00 00 00 00       	mov    $0x0,%edi
  308d21:	cd 80                	int    $0x80
  308d23:	89 45 d8             	mov    %eax,-0x28(%ebp)
  308d26:	b8 03 00 00 00       	mov    $0x3,%eax
  308d2b:	bb 0b 00 00 00       	mov    $0xb,%ebx
  308d30:	b9 e0 89 30 00       	mov    $0x3089e0,%ecx
  308d35:	ba 00 00 00 00       	mov    $0x0,%edx
  308d3a:	be 00 00 00 00       	mov    $0x0,%esi
  308d3f:	bf 00 00 00 00       	mov    $0x0,%edi
  308d44:	cd 80                	int    $0x80
  308d46:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  308d49:	b8 03 00 00 00       	mov    $0x3,%eax
  308d4e:	bb 0f 00 00 00       	mov    $0xf,%ebx
  308d53:	b9 c8 8a 30 00       	mov    $0x308ac8,%ecx
  308d58:	ba 00 00 00 00       	mov    $0x0,%edx
  308d5d:	be 00 00 00 00       	mov    $0x0,%esi
  308d62:	bf 00 00 00 00       	mov    $0x0,%edi
  308d67:	cd 80                	int    $0x80
  308d69:	89 45 d0             	mov    %eax,-0x30(%ebp)
  308d6c:	83 ec 08             	sub    $0x8,%esp
  308d6f:	68 df 6f 30 00       	push   $0x306fdf
  308d74:	68 b5 dd 30 00       	push   $0x30ddb5
  308d79:	e8 15 fe ff ff       	call   308b93 <make_task>
  308d7e:	83 c4 10             	add    $0x10,%esp
  308d81:	89 45 cc             	mov    %eax,-0x34(%ebp)
  308d84:	8b 15 04 26 31 00    	mov    0x312604,%edx
  308d8a:	8b 45 cc             	mov    -0x34(%ebp),%eax
  308d8d:	89 90 84 00 00 00    	mov    %edx,0x84(%eax)
  308d93:	8b 45 cc             	mov    -0x34(%ebp),%eax
  308d96:	8b 00                	mov    (%eax),%eax
  308d98:	83 ec 08             	sub    $0x8,%esp
  308d9b:	6a 00                	push   $0x0
  308d9d:	50                   	push   %eax
  308d9e:	e8 b1 f1 ff ff       	call   307f54 <ret>
  308da3:	83 c4 10             	add    $0x10,%esp
  308da6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  308da9:	5b                   	pop    %ebx
  308daa:	5e                   	pop    %esi
  308dab:	5f                   	pop    %edi
  308dac:	5d                   	pop    %ebp
  308dad:	c3                   	ret    

00308dae <mm_main>:
  308dae:	55                   	push   %ebp
  308daf:	89 e5                	mov    %esp,%ebp
  308db1:	57                   	push   %edi
  308db2:	56                   	push   %esi
  308db3:	53                   	push   %ebx
  308db4:	83 ec 1c             	sub    $0x1c,%esp
  308db7:	e8 d5 fe ff ff       	call   308c91 <_mm_init>
  308dbc:	b8 00 00 00 00       	mov    $0x0,%eax
  308dc1:	bb 00 00 00 00       	mov    $0x0,%ebx
  308dc6:	b9 00 00 00 00       	mov    $0x0,%ecx
  308dcb:	ba 00 00 00 00       	mov    $0x0,%edx
  308dd0:	be 00 00 00 00       	mov    $0x0,%esi
  308dd5:	bf 00 00 00 00       	mov    $0x0,%edi
  308dda:	cd 80                	int    $0x80
  308ddc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  308ddf:	b8 00 00 00 00       	mov    $0x0,%eax
  308de4:	83 c4 1c             	add    $0x1c,%esp
  308de7:	5b                   	pop    %ebx
  308de8:	5e                   	pop    %esi
  308de9:	5f                   	pop    %edi
  308dea:	5d                   	pop    %ebp
  308deb:	c3                   	ret    

00308dec <INIT_LIST_HEAD>:
  308dec:	55                   	push   %ebp
  308ded:	89 e5                	mov    %esp,%ebp
  308def:	8b 45 08             	mov    0x8(%ebp),%eax
  308df2:	8b 55 08             	mov    0x8(%ebp),%edx
  308df5:	89 10                	mov    %edx,(%eax)
  308df7:	8b 45 08             	mov    0x8(%ebp),%eax
  308dfa:	8b 55 08             	mov    0x8(%ebp),%edx
  308dfd:	89 50 04             	mov    %edx,0x4(%eax)
  308e00:	5d                   	pop    %ebp
  308e01:	c3                   	ret    

00308e02 <__list_add>:
  308e02:	55                   	push   %ebp
  308e03:	89 e5                	mov    %esp,%ebp
  308e05:	8b 45 10             	mov    0x10(%ebp),%eax
  308e08:	8b 55 08             	mov    0x8(%ebp),%edx
  308e0b:	89 50 04             	mov    %edx,0x4(%eax)
  308e0e:	8b 45 08             	mov    0x8(%ebp),%eax
  308e11:	8b 55 10             	mov    0x10(%ebp),%edx
  308e14:	89 10                	mov    %edx,(%eax)
  308e16:	8b 45 08             	mov    0x8(%ebp),%eax
  308e19:	8b 55 0c             	mov    0xc(%ebp),%edx
  308e1c:	89 50 04             	mov    %edx,0x4(%eax)
  308e1f:	8b 45 0c             	mov    0xc(%ebp),%eax
  308e22:	8b 55 08             	mov    0x8(%ebp),%edx
  308e25:	89 10                	mov    %edx,(%eax)
  308e27:	5d                   	pop    %ebp
  308e28:	c3                   	ret    

00308e29 <list_add>:
  308e29:	55                   	push   %ebp
  308e2a:	89 e5                	mov    %esp,%ebp
  308e2c:	8b 45 0c             	mov    0xc(%ebp),%eax
  308e2f:	8b 00                	mov    (%eax),%eax
  308e31:	50                   	push   %eax
  308e32:	ff 75 0c             	pushl  0xc(%ebp)
  308e35:	ff 75 08             	pushl  0x8(%ebp)
  308e38:	e8 c5 ff ff ff       	call   308e02 <__list_add>
  308e3d:	83 c4 0c             	add    $0xc,%esp
  308e40:	c9                   	leave  
  308e41:	c3                   	ret    

00308e42 <memcpy>:
  308e42:	55                   	push   %ebp
  308e43:	89 e5                	mov    %esp,%ebp
  308e45:	57                   	push   %edi
  308e46:	56                   	push   %esi
  308e47:	53                   	push   %ebx
  308e48:	8b 45 10             	mov    0x10(%ebp),%eax
  308e4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  308e4e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  308e51:	89 c1                	mov    %eax,%ecx
  308e53:	89 d6                	mov    %edx,%esi
  308e55:	89 df                	mov    %ebx,%edi
  308e57:	fc                   	cld    
  308e58:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  308e5a:	8b 45 08             	mov    0x8(%ebp),%eax
  308e5d:	5b                   	pop    %ebx
  308e5e:	5e                   	pop    %esi
  308e5f:	5f                   	pop    %edi
  308e60:	5d                   	pop    %ebp
  308e61:	c3                   	ret    

00308e62 <mkvm>:
  308e62:	55                   	push   %ebp
  308e63:	89 e5                	mov    %esp,%ebp
  308e65:	57                   	push   %edi
  308e66:	53                   	push   %ebx
  308e67:	81 ec b0 00 00 00    	sub    $0xb0,%esp
  308e6d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  308e74:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  308e7b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  308e82:	8b 45 0c             	mov    0xc(%ebp),%eax
  308e85:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  308e88:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  308e8f:	83 ec 04             	sub    $0x4,%esp
  308e92:	6a 34                	push   $0x34
  308e94:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
  308e9a:	50                   	push   %eax
  308e9b:	ff 75 08             	pushl  0x8(%ebp)
  308e9e:	e8 a1 3e 00 00       	call   30cd44 <read>
  308ea3:	83 c4 10             	add    $0x10,%esp
  308ea6:	89 45 dc             	mov    %eax,-0x24(%ebp)
  308ea9:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%ebp)
  308ead:	75 1c                	jne    308ecb <mkvm+0x69>
  308eaf:	83 ec 04             	sub    $0x4,%esp
  308eb2:	6a 1a                	push   $0x1a
  308eb4:	68 bc dd 30 00       	push   $0x30ddbc
  308eb9:	68 c4 dd 30 00       	push   $0x30ddc4
  308ebe:	e8 e5 c7 ff ff       	call   3056a8 <printk>
  308ec3:	83 c4 10             	add    $0x10,%esp
  308ec6:	e9 72 02 00 00       	jmp    30913d <mkvm+0x2db>
  308ecb:	8b 45 dc             	mov    -0x24(%ebp),%eax
  308ece:	89 45 e0             	mov    %eax,-0x20(%ebp)
  308ed1:	8d 5d 84             	lea    -0x7c(%ebp),%ebx
  308ed4:	b8 00 00 00 00       	mov    $0x0,%eax
  308ed9:	ba 11 00 00 00       	mov    $0x11,%edx
  308ede:	89 df                	mov    %ebx,%edi
  308ee0:	89 d1                	mov    %edx,%ecx
  308ee2:	f3 ab                	rep stos %eax,%es:(%edi)
  308ee4:	c7 45 84 10 00 00 00 	movl   $0x10,-0x7c(%ebp)
  308eeb:	c7 45 88 10 00 00 00 	movl   $0x10,-0x78(%ebp)
  308ef2:	c7 45 8c 10 00 00 00 	movl   $0x10,-0x74(%ebp)
  308ef9:	c7 45 90 10 00 00 00 	movl   $0x10,-0x70(%ebp)
  308f00:	8b 45 10             	mov    0x10(%ebp),%eax
  308f03:	89 45 ac             	mov    %eax,-0x54(%ebp)
  308f06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  308f09:	89 45 b0             	mov    %eax,-0x50(%ebp)
  308f0c:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
  308f12:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  308f15:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%ebp)
  308f1c:	c7 45 bc 00 02 00 00 	movl   $0x200,-0x44(%ebp)
  308f23:	83 ec 04             	sub    $0x4,%esp
  308f26:	6a 44                	push   $0x44
  308f28:	8d 45 84             	lea    -0x7c(%ebp),%eax
  308f2b:	50                   	push   %eax
  308f2c:	ff 75 14             	pushl  0x14(%ebp)
  308f2f:	e8 0e ff ff ff       	call   308e42 <memcpy>
  308f34:	83 c4 10             	add    $0x10,%esp
  308f37:	0f b7 85 7a ff ff ff 	movzwl -0x86(%ebp),%eax
  308f3e:	0f b7 d0             	movzwl %ax,%edx
  308f41:	0f b7 85 7c ff ff ff 	movzwl -0x84(%ebp),%eax
  308f48:	0f b7 c0             	movzwl %ax,%eax
  308f4b:	0f af c2             	imul   %edx,%eax
  308f4e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  308f51:	83 ec 0c             	sub    $0xc,%esp
  308f54:	ff 75 e8             	pushl  -0x18(%ebp)
  308f57:	e8 27 ed ff ff       	call   307c83 <kalloc>
  308f5c:	83 c4 10             	add    $0x10,%esp
  308f5f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  308f62:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  308f66:	75 1c                	jne    308f84 <mkvm+0x122>
  308f68:	83 ec 04             	sub    $0x4,%esp
  308f6b:	6a 27                	push   $0x27
  308f6d:	68 bc dd 30 00       	push   $0x30ddbc
  308f72:	68 f4 dd 30 00       	push   $0x30ddf4
  308f77:	e8 2c c7 ff ff       	call   3056a8 <printk>
  308f7c:	83 c4 10             	add    $0x10,%esp
  308f7f:	e9 b9 01 00 00       	jmp    30913d <mkvm+0x2db>
  308f84:	8b 45 d8             	mov    -0x28(%ebp),%eax
  308f87:	89 45 ec             	mov    %eax,-0x14(%ebp)
  308f8a:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
  308f90:	83 ec 04             	sub    $0x4,%esp
  308f93:	6a 00                	push   $0x0
  308f95:	50                   	push   %eax
  308f96:	ff 75 08             	pushl  0x8(%ebp)
  308f99:	e8 1a 3d 00 00       	call   30ccb8 <lseek>
  308f9e:	83 c4 10             	add    $0x10,%esp
  308fa1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  308fa4:	83 ec 04             	sub    $0x4,%esp
  308fa7:	50                   	push   %eax
  308fa8:	ff 75 ec             	pushl  -0x14(%ebp)
  308fab:	ff 75 08             	pushl  0x8(%ebp)
  308fae:	e8 91 3d 00 00       	call   30cd44 <read>
  308fb3:	83 c4 10             	add    $0x10,%esp
  308fb6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  308fb9:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%ebp)
  308fbd:	75 1c                	jne    308fdb <mkvm+0x179>
  308fbf:	83 ec 04             	sub    $0x4,%esp
  308fc2:	6a 29                	push   $0x29
  308fc4:	68 bc dd 30 00       	push   $0x30ddbc
  308fc9:	68 18 de 30 00       	push   $0x30de18
  308fce:	e8 d5 c6 ff ff       	call   3056a8 <printk>
  308fd3:	83 c4 10             	add    $0x10,%esp
  308fd6:	e9 62 01 00 00       	jmp    30913d <mkvm+0x2db>
  308fdb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  308fde:	89 45 e0             	mov    %eax,-0x20(%ebp)
  308fe1:	83 ec 0c             	sub    $0xc,%esp
  308fe4:	6a 10                	push   $0x10
  308fe6:	e8 98 ec ff ff       	call   307c83 <kalloc>
  308feb:	83 c4 10             	add    $0x10,%esp
  308fee:	89 45 d0             	mov    %eax,-0x30(%ebp)
  308ff1:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  308ff5:	75 1c                	jne    309013 <mkvm+0x1b1>
  308ff7:	83 ec 04             	sub    $0x4,%esp
  308ffa:	6a 2b                	push   $0x2b
  308ffc:	68 bc dd 30 00       	push   $0x30ddbc
  309001:	68 40 de 30 00       	push   $0x30de40
  309006:	e8 9d c6 ff ff       	call   3056a8 <printk>
  30900b:	83 c4 10             	add    $0x10,%esp
  30900e:	e9 2a 01 00 00       	jmp    30913d <mkvm+0x2db>
  309013:	8b 45 d0             	mov    -0x30(%ebp),%eax
  309016:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309019:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30901c:	8b 55 08             	mov    0x8(%ebp),%edx
  30901f:	89 50 04             	mov    %edx,0x4(%eax)
  309022:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309025:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  30902b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30902e:	83 c0 08             	add    $0x8,%eax
  309031:	83 ec 0c             	sub    $0xc,%esp
  309034:	50                   	push   %eax
  309035:	e8 b2 fd ff ff       	call   308dec <INIT_LIST_HEAD>
  30903a:	83 c4 10             	add    $0x10,%esp
  30903d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  309044:	e9 dc 00 00 00       	jmp    309125 <mkvm+0x2c3>
  309049:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30904c:	c1 e0 05             	shl    $0x5,%eax
  30904f:	89 c2                	mov    %eax,%edx
  309051:	8b 45 ec             	mov    -0x14(%ebp),%eax
  309054:	01 d0                	add    %edx,%eax
  309056:	8b 00                	mov    (%eax),%eax
  309058:	83 f8 01             	cmp    $0x1,%eax
  30905b:	0f 85 c0 00 00 00    	jne    309121 <mkvm+0x2bf>
  309061:	83 ec 0c             	sub    $0xc,%esp
  309064:	6a 1c                	push   $0x1c
  309066:	e8 18 ec ff ff       	call   307c83 <kalloc>
  30906b:	83 c4 10             	add    $0x10,%esp
  30906e:	89 45 cc             	mov    %eax,-0x34(%ebp)
  309071:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
  309075:	75 1c                	jne    309093 <mkvm+0x231>
  309077:	83 ec 04             	sub    $0x4,%esp
  30907a:	6a 31                	push   $0x31
  30907c:	68 bc dd 30 00       	push   $0x30ddbc
  309081:	68 6c de 30 00       	push   $0x30de6c
  309086:	e8 1d c6 ff ff       	call   3056a8 <printk>
  30908b:	83 c4 10             	add    $0x10,%esp
  30908e:	e9 aa 00 00 00       	jmp    30913d <mkvm+0x2db>
  309093:	8b 45 cc             	mov    -0x34(%ebp),%eax
  309096:	89 45 c8             	mov    %eax,-0x38(%ebp)
  309099:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30909c:	c1 e0 05             	shl    $0x5,%eax
  30909f:	89 c2                	mov    %eax,%edx
  3090a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3090a4:	01 d0                	add    %edx,%eax
  3090a6:	8b 50 18             	mov    0x18(%eax),%edx
  3090a9:	8b 45 c8             	mov    -0x38(%ebp),%eax
  3090ac:	89 10                	mov    %edx,(%eax)
  3090ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3090b1:	c1 e0 05             	shl    $0x5,%eax
  3090b4:	89 c2                	mov    %eax,%edx
  3090b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3090b9:	01 d0                	add    %edx,%eax
  3090bb:	8b 40 08             	mov    0x8(%eax),%eax
  3090be:	89 c2                	mov    %eax,%edx
  3090c0:	8b 45 c8             	mov    -0x38(%ebp),%eax
  3090c3:	89 50 04             	mov    %edx,0x4(%eax)
  3090c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3090c9:	c1 e0 05             	shl    $0x5,%eax
  3090cc:	89 c2                	mov    %eax,%edx
  3090ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3090d1:	01 d0                	add    %edx,%eax
  3090d3:	8b 50 04             	mov    0x4(%eax),%edx
  3090d6:	8b 45 c8             	mov    -0x38(%ebp),%eax
  3090d9:	89 50 10             	mov    %edx,0x10(%eax)
  3090dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3090df:	c1 e0 05             	shl    $0x5,%eax
  3090e2:	89 c2                	mov    %eax,%edx
  3090e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3090e7:	01 d0                	add    %edx,%eax
  3090e9:	8b 50 14             	mov    0x14(%eax),%edx
  3090ec:	8b 45 c8             	mov    -0x38(%ebp),%eax
  3090ef:	89 50 08             	mov    %edx,0x8(%eax)
  3090f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3090f5:	c1 e0 05             	shl    $0x5,%eax
  3090f8:	89 c2                	mov    %eax,%edx
  3090fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3090fd:	01 d0                	add    %edx,%eax
  3090ff:	8b 50 10             	mov    0x10(%eax),%edx
  309102:	8b 45 c8             	mov    -0x38(%ebp),%eax
  309105:	89 50 0c             	mov    %edx,0xc(%eax)
  309108:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30910b:	8d 50 08             	lea    0x8(%eax),%edx
  30910e:	8b 45 c8             	mov    -0x38(%ebp),%eax
  309111:	83 c0 14             	add    $0x14,%eax
  309114:	83 ec 08             	sub    $0x8,%esp
  309117:	52                   	push   %edx
  309118:	50                   	push   %eax
  309119:	e8 0b fd ff ff       	call   308e29 <list_add>
  30911e:	83 c4 10             	add    $0x10,%esp
  309121:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  309125:	0f b7 85 7c ff ff ff 	movzwl -0x84(%ebp),%eax
  30912c:	0f b7 c0             	movzwl %ax,%eax
  30912f:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  309132:	0f 8f 11 ff ff ff    	jg     309049 <mkvm+0x1e7>
  309138:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30913b:	eb 30                	jmp    30916d <mkvm+0x30b>
  30913d:	83 ec 0c             	sub    $0xc,%esp
  309140:	ff 75 f4             	pushl  -0xc(%ebp)
  309143:	e8 2c 00 00 00       	call   309174 <delvm>
  309148:	83 c4 10             	add    $0x10,%esp
  30914b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  30914f:	74 10                	je     309161 <mkvm+0x2ff>
  309151:	83 ec 08             	sub    $0x8,%esp
  309154:	6a 00                	push   $0x0
  309156:	ff 75 f4             	pushl  -0xc(%ebp)
  309159:	e8 91 ec ff ff       	call   307def <kfree_s>
  30915e:	83 c4 10             	add    $0x10,%esp
  309161:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  309168:	b8 00 00 00 00       	mov    $0x0,%eax
  30916d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  309170:	5b                   	pop    %ebx
  309171:	5f                   	pop    %edi
  309172:	5d                   	pop    %ebp
  309173:	c3                   	ret    

00309174 <delvm>:
  309174:	55                   	push   %ebp
  309175:	89 e5                	mov    %esp,%ebp
  309177:	83 ec 18             	sub    $0x18,%esp
  30917a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  30917e:	74 7e                	je     3091fe <delvm+0x8a>
  309180:	8b 45 08             	mov    0x8(%ebp),%eax
  309183:	8b 00                	mov    (%eax),%eax
  309185:	8d 50 ff             	lea    -0x1(%eax),%edx
  309188:	8b 45 08             	mov    0x8(%ebp),%eax
  30918b:	89 10                	mov    %edx,(%eax)
  30918d:	8b 45 08             	mov    0x8(%ebp),%eax
  309190:	8b 00                	mov    (%eax),%eax
  309192:	85 c0                	test   %eax,%eax
  309194:	75 68                	jne    3091fe <delvm+0x8a>
  309196:	83 ec 04             	sub    $0x4,%esp
  309199:	6a 45                	push   $0x45
  30919b:	68 bc dd 30 00       	push   $0x30ddbc
  3091a0:	68 94 de 30 00       	push   $0x30de94
  3091a5:	e8 fe c4 ff ff       	call   3056a8 <printk>
  3091aa:	83 c4 10             	add    $0x10,%esp
  3091ad:	8b 45 08             	mov    0x8(%ebp),%eax
  3091b0:	83 c0 08             	add    $0x8,%eax
  3091b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3091b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3091b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3091bc:	eb 28                	jmp    3091e6 <delvm+0x72>
  3091be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3091c1:	8b 00                	mov    (%eax),%eax
  3091c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3091c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3091c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3091cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3091cf:	83 e8 14             	sub    $0x14,%eax
  3091d2:	83 ec 08             	sub    $0x8,%esp
  3091d5:	6a 00                	push   $0x0
  3091d7:	50                   	push   %eax
  3091d8:	e8 12 ec ff ff       	call   307def <kfree_s>
  3091dd:	83 c4 10             	add    $0x10,%esp
  3091e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3091e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3091e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3091e9:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  3091ec:	75 d0                	jne    3091be <delvm+0x4a>
  3091ee:	83 ec 08             	sub    $0x8,%esp
  3091f1:	6a 00                	push   $0x0
  3091f3:	ff 75 08             	pushl  0x8(%ebp)
  3091f6:	e8 f4 eb ff ff       	call   307def <kfree_s>
  3091fb:	83 c4 10             	add    $0x10,%esp
  3091fe:	c9                   	leave  
  3091ff:	c3                   	ret    

00309200 <copyvm>:
  309200:	55                   	push   %ebp
  309201:	89 e5                	mov    %esp,%ebp
  309203:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  309207:	74 0d                	je     309216 <copyvm+0x16>
  309209:	8b 45 08             	mov    0x8(%ebp),%eax
  30920c:	8b 00                	mov    (%eax),%eax
  30920e:	8d 50 ff             	lea    -0x1(%eax),%edx
  309211:	8b 45 08             	mov    0x8(%ebp),%eax
  309214:	89 10                	mov    %edx,(%eax)
  309216:	5d                   	pop    %ebp
  309217:	c3                   	ret    

00309218 <clr>:
  309218:	55                   	push   %ebp
  309219:	89 e5                	mov    %esp,%ebp
  30921b:	83 ec 10             	sub    $0x10,%esp
  30921e:	8b 55 0c             	mov    0xc(%ebp),%edx
  309221:	8b 45 08             	mov    0x8(%ebp),%eax
  309224:	8b 40 04             	mov    0x4(%eax),%eax
  309227:	29 c2                	sub    %eax,%edx
  309229:	89 d0                	mov    %edx,%eax
  30922b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  309230:	89 45 fc             	mov    %eax,-0x4(%ebp)
  309233:	8b 45 08             	mov    0x8(%ebp),%eax
  309236:	8b 40 0c             	mov    0xc(%eax),%eax
  309239:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  30923c:	73 07                	jae    309245 <clr+0x2d>
  30923e:	b8 00 00 00 00       	mov    $0x0,%eax
  309243:	eb 25                	jmp    30926a <clr+0x52>
  309245:	8b 45 fc             	mov    -0x4(%ebp),%eax
  309248:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  30924e:	8b 45 08             	mov    0x8(%ebp),%eax
  309251:	8b 40 0c             	mov    0xc(%eax),%eax
  309254:	39 c2                	cmp    %eax,%edx
  309256:	76 0d                	jbe    309265 <clr+0x4d>
  309258:	8b 45 08             	mov    0x8(%ebp),%eax
  30925b:	8b 40 0c             	mov    0xc(%eax),%eax
  30925e:	25 ff 0f 00 00       	and    $0xfff,%eax
  309263:	eb 05                	jmp    30926a <clr+0x52>
  309265:	b8 00 10 00 00       	mov    $0x1000,%eax
  30926a:	c9                   	leave  
  30926b:	c3                   	ret    

0030926c <dovm>:
  30926c:	55                   	push   %ebp
  30926d:	89 e5                	mov    %esp,%ebp
  30926f:	83 ec 28             	sub    $0x28,%esp
  309272:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  309276:	0f 84 23 01 00 00    	je     30939f <dovm+0x133>
  30927c:	e8 68 df ff ff       	call   3071e9 <get_free_page>
  309281:	89 45 f0             	mov    %eax,-0x10(%ebp)
  309284:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  309288:	75 1c                	jne    3092a6 <dovm+0x3a>
  30928a:	83 ec 04             	sub    $0x4,%esp
  30928d:	6a 62                	push   $0x62
  30928f:	68 bc dd 30 00       	push   $0x30ddbc
  309294:	68 e4 de 30 00       	push   $0x30dee4
  309299:	e8 0a c4 ff ff       	call   3056a8 <printk>
  30929e:	83 c4 10             	add    $0x10,%esp
  3092a1:	e9 f9 00 00 00       	jmp    30939f <dovm+0x133>
  3092a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3092a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3092ac:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  3092b3:	8b 45 08             	mov    0x8(%ebp),%eax
  3092b6:	83 c0 08             	add    $0x8,%eax
  3092b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3092bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3092bf:	8b 00                	mov    (%eax),%eax
  3092c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3092c4:	e9 c5 00 00 00       	jmp    30938e <dovm+0x122>
  3092c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3092cc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3092cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3092d2:	83 e8 14             	sub    $0x14,%eax
  3092d5:	89 45 dc             	mov    %eax,-0x24(%ebp)
  3092d8:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3092db:	8b 40 04             	mov    0x4(%eax),%eax
  3092de:	3b 45 0c             	cmp    0xc(%ebp),%eax
  3092e1:	0f 87 9f 00 00 00    	ja     309386 <dovm+0x11a>
  3092e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3092ea:	8b 50 04             	mov    0x4(%eax),%edx
  3092ed:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3092f0:	8b 40 08             	mov    0x8(%eax),%eax
  3092f3:	01 d0                	add    %edx,%eax
  3092f5:	3b 45 0c             	cmp    0xc(%ebp),%eax
  3092f8:	0f 86 88 00 00 00    	jbe    309386 <dovm+0x11a>
  3092fe:	83 ec 08             	sub    $0x8,%esp
  309301:	ff 75 0c             	pushl  0xc(%ebp)
  309304:	ff 75 dc             	pushl  -0x24(%ebp)
  309307:	e8 0c ff ff ff       	call   309218 <clr>
  30930c:	83 c4 10             	add    $0x10,%esp
  30930f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  309312:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  309316:	74 6c                	je     309384 <dovm+0x118>
  309318:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30931b:	8b 50 10             	mov    0x10(%eax),%edx
  30931e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  309321:	8b 45 dc             	mov    -0x24(%ebp),%eax
  309324:	8b 40 04             	mov    0x4(%eax),%eax
  309327:	29 c1                	sub    %eax,%ecx
  309329:	89 c8                	mov    %ecx,%eax
  30932b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  309330:	01 c2                	add    %eax,%edx
  309332:	8b 45 08             	mov    0x8(%ebp),%eax
  309335:	8b 40 04             	mov    0x4(%eax),%eax
  309338:	83 ec 04             	sub    $0x4,%esp
  30933b:	6a 00                	push   $0x0
  30933d:	52                   	push   %edx
  30933e:	50                   	push   %eax
  30933f:	e8 74 39 00 00       	call   30ccb8 <lseek>
  309344:	83 c4 10             	add    $0x10,%esp
  309347:	8b 55 e8             	mov    -0x18(%ebp),%edx
  30934a:	8b 45 08             	mov    0x8(%ebp),%eax
  30934d:	8b 40 04             	mov    0x4(%eax),%eax
  309350:	83 ec 04             	sub    $0x4,%esp
  309353:	52                   	push   %edx
  309354:	ff 75 ec             	pushl  -0x14(%ebp)
  309357:	50                   	push   %eax
  309358:	e8 e7 39 00 00       	call   30cd44 <read>
  30935d:	83 c4 10             	add    $0x10,%esp
  309360:	89 45 d8             	mov    %eax,-0x28(%ebp)
  309363:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
  309367:	75 19                	jne    309382 <dovm+0x116>
  309369:	83 ec 04             	sub    $0x4,%esp
  30936c:	6a 6b                	push   $0x6b
  30936e:	68 bc dd 30 00       	push   $0x30ddbc
  309373:	68 08 df 30 00       	push   $0x30df08
  309378:	e8 2b c3 ff ff       	call   3056a8 <printk>
  30937d:	83 c4 10             	add    $0x10,%esp
  309380:	eb 1d                	jmp    30939f <dovm+0x133>
  309382:	eb 16                	jmp    30939a <dovm+0x12e>
  309384:	eb 14                	jmp    30939a <dovm+0x12e>
  309386:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309389:	8b 00                	mov    (%eax),%eax
  30938b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30938e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309391:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  309394:	0f 85 2f ff ff ff    	jne    3092c9 <dovm+0x5d>
  30939a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30939d:	eb 05                	jmp    3093a4 <dovm+0x138>
  30939f:	b8 00 00 00 00       	mov    $0x0,%eax
  3093a4:	c9                   	leave  
  3093a5:	c3                   	ret    
  3093a6:	66 90                	xchg   %ax,%ax

003093a8 <ret>:
  3093a8:	55                   	push   %ebp
  3093a9:	89 e5                	mov    %esp,%ebp
  3093ab:	57                   	push   %edi
  3093ac:	56                   	push   %esi
  3093ad:	53                   	push   %ebx
  3093ae:	83 ec 10             	sub    $0x10,%esp
  3093b1:	b8 02 00 00 00       	mov    $0x2,%eax
  3093b6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3093b9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  3093bc:	ba 00 00 00 00       	mov    $0x0,%edx
  3093c1:	be 00 00 00 00       	mov    $0x0,%esi
  3093c6:	bf 00 00 00 00       	mov    $0x0,%edi
  3093cb:	cd 80                	int    $0x80
  3093cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3093d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3093d3:	83 c4 10             	add    $0x10,%esp
  3093d6:	5b                   	pop    %ebx
  3093d7:	5e                   	pop    %esi
  3093d8:	5f                   	pop    %edi
  3093d9:	5d                   	pop    %ebp
  3093da:	c3                   	ret    

003093db <strlen>:
  3093db:	55                   	push   %ebp
  3093dc:	89 e5                	mov    %esp,%ebp
  3093de:	57                   	push   %edi
  3093df:	8b 55 08             	mov    0x8(%ebp),%edx
  3093e2:	b8 00 00 00 00       	mov    $0x0,%eax
  3093e7:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  3093ec:	89 d7                	mov    %edx,%edi
  3093ee:	fc                   	cld    
  3093ef:	f2 ae                	repnz scas %es:(%edi),%al
  3093f1:	f7 d1                	not    %ecx
  3093f3:	49                   	dec    %ecx
  3093f4:	89 c8                	mov    %ecx,%eax
  3093f6:	5f                   	pop    %edi
  3093f7:	5d                   	pop    %ebp
  3093f8:	c3                   	ret    

003093f9 <memcpy>:
  3093f9:	55                   	push   %ebp
  3093fa:	89 e5                	mov    %esp,%ebp
  3093fc:	57                   	push   %edi
  3093fd:	56                   	push   %esi
  3093fe:	53                   	push   %ebx
  3093ff:	8b 45 10             	mov    0x10(%ebp),%eax
  309402:	8b 55 0c             	mov    0xc(%ebp),%edx
  309405:	8b 5d 08             	mov    0x8(%ebp),%ebx
  309408:	89 c1                	mov    %eax,%ecx
  30940a:	89 d6                	mov    %edx,%esi
  30940c:	89 df                	mov    %ebx,%edi
  30940e:	fc                   	cld    
  30940f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  309411:	8b 45 08             	mov    0x8(%ebp),%eax
  309414:	5b                   	pop    %ebx
  309415:	5e                   	pop    %esi
  309416:	5f                   	pop    %edi
  309417:	5d                   	pop    %ebp
  309418:	c3                   	ret    

00309419 <do_read>:
  309419:	55                   	push   %ebp
  30941a:	89 e5                	mov    %esp,%ebp
  30941c:	83 ec 28             	sub    $0x28,%esp
  30941f:	8b 45 10             	mov    0x10(%ebp),%eax
  309422:	c1 e8 0a             	shr    $0xa,%eax
  309425:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309428:	8b 45 10             	mov    0x10(%ebp),%eax
  30942b:	25 ff 03 00 00       	and    $0x3ff,%eax
  309430:	89 c2                	mov    %eax,%edx
  309432:	b8 00 04 00 00       	mov    $0x400,%eax
  309437:	29 d0                	sub    %edx,%eax
  309439:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30943c:	8b 45 08             	mov    0x8(%ebp),%eax
  30943f:	8b 40 08             	mov    0x8(%eax),%eax
  309442:	2b 45 10             	sub    0x10(%ebp),%eax
  309445:	89 c2                	mov    %eax,%edx
  309447:	8b 45 14             	mov    0x14(%ebp),%eax
  30944a:	39 c2                	cmp    %eax,%edx
  30944c:	0f 46 c2             	cmovbe %edx,%eax
  30944f:	89 45 14             	mov    %eax,0x14(%ebp)
  309452:	8b 45 14             	mov    0x14(%ebp),%eax
  309455:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  309458:	0f 46 45 f0          	cmovbe -0x10(%ebp),%eax
  30945c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30945f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  309463:	74 5c                	je     3094c1 <do_read+0xa8>
  309465:	68 00 2b 31 00       	push   $0x312b00
  30946a:	ff 75 f4             	pushl  -0xc(%ebp)
  30946d:	6a 00                	push   $0x0
  30946f:	ff 75 08             	pushl  0x8(%ebp)
  309472:	e8 6b 08 00 00       	call   309ce2 <zone_rw>
  309477:	83 c4 10             	add    $0x10,%esp
  30947a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30947d:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%ebp)
  309481:	75 1c                	jne    30949f <do_read+0x86>
  309483:	83 ec 04             	sub    $0x4,%esp
  309486:	6a 1c                	push   $0x1c
  309488:	68 3c df 30 00       	push   $0x30df3c
  30948d:	68 44 df 30 00       	push   $0x30df44
  309492:	e8 11 c2 ff ff       	call   3056a8 <printk>
  309497:	83 c4 10             	add    $0x10,%esp
  30949a:	e9 13 01 00 00       	jmp    3095b2 <do_read+0x199>
  30949f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3094a2:	8b 55 10             	mov    0x10(%ebp),%edx
  3094a5:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  3094ab:	81 c2 00 2b 31 00    	add    $0x312b00,%edx
  3094b1:	83 ec 04             	sub    $0x4,%esp
  3094b4:	50                   	push   %eax
  3094b5:	52                   	push   %edx
  3094b6:	ff 75 0c             	pushl  0xc(%ebp)
  3094b9:	e8 3b ff ff ff       	call   3093f9 <memcpy>
  3094be:	83 c4 10             	add    $0x10,%esp
  3094c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3094c4:	29 45 14             	sub    %eax,0x14(%ebp)
  3094c7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3094cb:	8b 45 14             	mov    0x14(%ebp),%eax
  3094ce:	c1 e8 0a             	shr    $0xa,%eax
  3094d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3094d4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  3094db:	eb 6d                	jmp    30954a <do_read+0x131>
  3094dd:	68 00 2b 31 00       	push   $0x312b00
  3094e2:	ff 75 f4             	pushl  -0xc(%ebp)
  3094e5:	6a 00                	push   $0x0
  3094e7:	ff 75 08             	pushl  0x8(%ebp)
  3094ea:	e8 f3 07 00 00       	call   309ce2 <zone_rw>
  3094ef:	83 c4 10             	add    $0x10,%esp
  3094f2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3094f5:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
  3094f9:	75 1c                	jne    309517 <do_read+0xfe>
  3094fb:	83 ec 04             	sub    $0x4,%esp
  3094fe:	6a 24                	push   $0x24
  309500:	68 3c df 30 00       	push   $0x30df3c
  309505:	68 44 df 30 00       	push   $0x30df44
  30950a:	e8 99 c1 ff ff       	call   3056a8 <printk>
  30950f:	83 c4 10             	add    $0x10,%esp
  309512:	e9 9b 00 00 00       	jmp    3095b2 <do_read+0x199>
  309517:	8b 45 14             	mov    0x14(%ebp),%eax
  30951a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30951d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  309520:	01 ca                	add    %ecx,%edx
  309522:	83 ec 04             	sub    $0x4,%esp
  309525:	50                   	push   %eax
  309526:	68 00 2b 31 00       	push   $0x312b00
  30952b:	52                   	push   %edx
  30952c:	e8 c8 fe ff ff       	call   3093f9 <memcpy>
  309531:	83 c4 10             	add    $0x10,%esp
  309534:	81 6d 14 00 04 00 00 	subl   $0x400,0x14(%ebp)
  30953b:	81 45 f0 00 04 00 00 	addl   $0x400,-0x10(%ebp)
  309542:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  309546:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  30954a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30954d:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  309550:	72 8b                	jb     3094dd <do_read+0xc4>
  309552:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  309556:	74 5a                	je     3095b2 <do_read+0x199>
  309558:	68 00 2b 31 00       	push   $0x312b00
  30955d:	ff 75 f4             	pushl  -0xc(%ebp)
  309560:	6a 00                	push   $0x0
  309562:	ff 75 08             	pushl  0x8(%ebp)
  309565:	e8 78 07 00 00       	call   309ce2 <zone_rw>
  30956a:	83 c4 10             	add    $0x10,%esp
  30956d:	89 45 dc             	mov    %eax,-0x24(%ebp)
  309570:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%ebp)
  309574:	75 19                	jne    30958f <do_read+0x176>
  309576:	83 ec 04             	sub    $0x4,%esp
  309579:	6a 2c                	push   $0x2c
  30957b:	68 3c df 30 00       	push   $0x30df3c
  309580:	68 44 df 30 00       	push   $0x30df44
  309585:	e8 1e c1 ff ff       	call   3056a8 <printk>
  30958a:	83 c4 10             	add    $0x10,%esp
  30958d:	eb 23                	jmp    3095b2 <do_read+0x199>
  30958f:	8b 45 14             	mov    0x14(%ebp),%eax
  309592:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  309595:	8b 55 f0             	mov    -0x10(%ebp),%edx
  309598:	01 ca                	add    %ecx,%edx
  30959a:	83 ec 04             	sub    $0x4,%esp
  30959d:	50                   	push   %eax
  30959e:	68 00 2b 31 00       	push   $0x312b00
  3095a3:	52                   	push   %edx
  3095a4:	e8 50 fe ff ff       	call   3093f9 <memcpy>
  3095a9:	83 c4 10             	add    $0x10,%esp
  3095ac:	8b 45 14             	mov    0x14(%ebp),%eax
  3095af:	01 45 f0             	add    %eax,-0x10(%ebp)
  3095b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3095b5:	c9                   	leave  
  3095b6:	c3                   	ret    

003095b7 <fs_read>:
  3095b7:	55                   	push   %ebp
  3095b8:	89 e5                	mov    %esp,%ebp
  3095ba:	83 ec 18             	sub    $0x18,%esp
  3095bd:	a1 04 26 31 00       	mov    0x312604,%eax
  3095c2:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
  3095c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3095cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3095ce:	8b 50 5c             	mov    0x5c(%eax),%edx
  3095d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3095d4:	ff 75 10             	pushl  0x10(%ebp)
  3095d7:	52                   	push   %edx
  3095d8:	ff 75 0c             	pushl  0xc(%ebp)
  3095db:	50                   	push   %eax
  3095dc:	e8 38 fe ff ff       	call   309419 <do_read>
  3095e1:	83 c4 10             	add    $0x10,%esp
  3095e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3095e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3095ea:	8b 50 5c             	mov    0x5c(%eax),%edx
  3095ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3095f0:	01 c2                	add    %eax,%edx
  3095f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3095f5:	89 50 5c             	mov    %edx,0x5c(%eax)
  3095f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3095fb:	83 ec 08             	sub    $0x8,%esp
  3095fe:	50                   	push   %eax
  3095ff:	ff 75 08             	pushl  0x8(%ebp)
  309602:	e8 a1 fd ff ff       	call   3093a8 <ret>
  309607:	83 c4 10             	add    $0x10,%esp
  30960a:	c9                   	leave  
  30960b:	c3                   	ret    

0030960c <fs_write>:
  30960c:	55                   	push   %ebp
  30960d:	89 e5                	mov    %esp,%ebp
  30960f:	83 ec 38             	sub    $0x38,%esp
  309612:	a1 04 26 31 00       	mov    0x312604,%eax
  309617:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
  30961d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  309620:	8b 45 e8             	mov    -0x18(%ebp),%eax
  309623:	8b 40 5c             	mov    0x5c(%eax),%eax
  309626:	c1 e8 0a             	shr    $0xa,%eax
  309629:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30962c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  30962f:	8b 40 5c             	mov    0x5c(%eax),%eax
  309632:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  309635:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  309638:	8b 45 10             	mov    0x10(%ebp),%eax
  30963b:	01 c2                	add    %eax,%edx
  30963d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  309640:	8b 40 08             	mov    0x8(%eax),%eax
  309643:	39 c2                	cmp    %eax,%edx
  309645:	76 0c                	jbe    309653 <fs_write+0x47>
  309647:	8b 45 e8             	mov    -0x18(%ebp),%eax
  30964a:	8b 40 08             	mov    0x8(%eax),%eax
  30964d:	2b 45 e4             	sub    -0x1c(%ebp),%eax
  309650:	89 45 10             	mov    %eax,0x10(%ebp)
  309653:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  309656:	25 ff 03 00 00       	and    $0x3ff,%eax
  30965b:	89 c2                	mov    %eax,%edx
  30965d:	b8 00 04 00 00       	mov    $0x400,%eax
  309662:	29 d0                	sub    %edx,%eax
  309664:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309667:	8b 45 10             	mov    0x10(%ebp),%eax
  30966a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  30966d:	0f 46 45 f4          	cmovbe -0xc(%ebp),%eax
  309671:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309674:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  309678:	0f 84 98 00 00 00    	je     309716 <fs_write+0x10a>
  30967e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  309681:	68 00 27 31 00       	push   $0x312700
  309686:	ff 75 f0             	pushl  -0x10(%ebp)
  309689:	6a 00                	push   $0x0
  30968b:	50                   	push   %eax
  30968c:	e8 51 06 00 00       	call   309ce2 <zone_rw>
  309691:	83 c4 10             	add    $0x10,%esp
  309694:	89 45 e0             	mov    %eax,-0x20(%ebp)
  309697:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
  30969b:	75 1c                	jne    3096b9 <fs_write+0xad>
  30969d:	83 ec 04             	sub    $0x4,%esp
  3096a0:	6a 4f                	push   $0x4f
  3096a2:	68 3c df 30 00       	push   $0x30df3c
  3096a7:	68 78 df 30 00       	push   $0x30df78
  3096ac:	e8 f7 bf ff ff       	call   3056a8 <printk>
  3096b1:	83 c4 10             	add    $0x10,%esp
  3096b4:	e9 53 01 00 00       	jmp    30980c <fs_write+0x200>
  3096b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3096bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  3096bf:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  3096c5:	81 c2 00 27 31 00    	add    $0x312700,%edx
  3096cb:	83 ec 04             	sub    $0x4,%esp
  3096ce:	50                   	push   %eax
  3096cf:	ff 75 0c             	pushl  0xc(%ebp)
  3096d2:	52                   	push   %edx
  3096d3:	e8 21 fd ff ff       	call   3093f9 <memcpy>
  3096d8:	83 c4 10             	add    $0x10,%esp
  3096db:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3096de:	68 00 27 31 00       	push   $0x312700
  3096e3:	ff 75 f0             	pushl  -0x10(%ebp)
  3096e6:	6a 01                	push   $0x1
  3096e8:	50                   	push   %eax
  3096e9:	e8 f4 05 00 00       	call   309ce2 <zone_rw>
  3096ee:	83 c4 10             	add    $0x10,%esp
  3096f1:	89 45 dc             	mov    %eax,-0x24(%ebp)
  3096f4:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%ebp)
  3096f8:	75 1c                	jne    309716 <fs_write+0x10a>
  3096fa:	83 ec 04             	sub    $0x4,%esp
  3096fd:	6a 51                	push   $0x51
  3096ff:	68 3c df 30 00       	push   $0x30df3c
  309704:	68 b4 df 30 00       	push   $0x30dfb4
  309709:	e8 9a bf ff ff       	call   3056a8 <printk>
  30970e:	83 c4 10             	add    $0x10,%esp
  309711:	e9 f6 00 00 00       	jmp    30980c <fs_write+0x200>
  309716:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309719:	29 45 10             	sub    %eax,0x10(%ebp)
  30971c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  309720:	8b 45 10             	mov    0x10(%ebp),%eax
  309723:	c1 e8 0a             	shr    $0xa,%eax
  309726:	89 45 d8             	mov    %eax,-0x28(%ebp)
  309729:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  309730:	eb 6f                	jmp    3097a1 <fs_write+0x195>
  309732:	8b 55 0c             	mov    0xc(%ebp),%edx
  309735:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309738:	01 d0                	add    %edx,%eax
  30973a:	83 ec 04             	sub    $0x4,%esp
  30973d:	68 00 04 00 00       	push   $0x400
  309742:	50                   	push   %eax
  309743:	68 00 27 31 00       	push   $0x312700
  309748:	e8 ac fc ff ff       	call   3093f9 <memcpy>
  30974d:	83 c4 10             	add    $0x10,%esp
  309750:	8b 45 e8             	mov    -0x18(%ebp),%eax
  309753:	68 00 27 31 00       	push   $0x312700
  309758:	ff 75 f0             	pushl  -0x10(%ebp)
  30975b:	6a 01                	push   $0x1
  30975d:	50                   	push   %eax
  30975e:	e8 7f 05 00 00       	call   309ce2 <zone_rw>
  309763:	83 c4 10             	add    $0x10,%esp
  309766:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  309769:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%ebp)
  30976d:	75 1c                	jne    30978b <fs_write+0x17f>
  30976f:	83 ec 04             	sub    $0x4,%esp
  309772:	6a 59                	push   $0x59
  309774:	68 3c df 30 00       	push   $0x30df3c
  309779:	68 b4 df 30 00       	push   $0x30dfb4
  30977e:	e8 25 bf ff ff       	call   3056a8 <printk>
  309783:	83 c4 10             	add    $0x10,%esp
  309786:	e9 81 00 00 00       	jmp    30980c <fs_write+0x200>
  30978b:	81 6d 10 00 04 00 00 	subl   $0x400,0x10(%ebp)
  309792:	81 45 f4 00 04 00 00 	addl   $0x400,-0xc(%ebp)
  309799:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  30979d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  3097a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3097a4:	3b 45 d8             	cmp    -0x28(%ebp),%eax
  3097a7:	72 89                	jb     309732 <fs_write+0x126>
  3097a9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  3097ad:	74 5d                	je     30980c <fs_write+0x200>
  3097af:	8b 45 10             	mov    0x10(%ebp),%eax
  3097b2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  3097b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  3097b8:	01 ca                	add    %ecx,%edx
  3097ba:	83 ec 04             	sub    $0x4,%esp
  3097bd:	50                   	push   %eax
  3097be:	52                   	push   %edx
  3097bf:	68 00 27 31 00       	push   $0x312700
  3097c4:	e8 30 fc ff ff       	call   3093f9 <memcpy>
  3097c9:	83 c4 10             	add    $0x10,%esp
  3097cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3097cf:	68 00 27 31 00       	push   $0x312700
  3097d4:	ff 75 f0             	pushl  -0x10(%ebp)
  3097d7:	6a 01                	push   $0x1
  3097d9:	50                   	push   %eax
  3097da:	e8 03 05 00 00       	call   309ce2 <zone_rw>
  3097df:	83 c4 10             	add    $0x10,%esp
  3097e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  3097e5:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
  3097e9:	75 19                	jne    309804 <fs_write+0x1f8>
  3097eb:	83 ec 04             	sub    $0x4,%esp
  3097ee:	6a 61                	push   $0x61
  3097f0:	68 3c df 30 00       	push   $0x30df3c
  3097f5:	68 b4 df 30 00       	push   $0x30dfb4
  3097fa:	e8 a9 be ff ff       	call   3056a8 <printk>
  3097ff:	83 c4 10             	add    $0x10,%esp
  309802:	eb 08                	jmp    30980c <fs_write+0x200>
  309804:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309807:	01 c0                	add    %eax,%eax
  309809:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30980c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30980f:	01 45 e4             	add    %eax,-0x1c(%ebp)
  309812:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309815:	83 ec 08             	sub    $0x8,%esp
  309818:	50                   	push   %eax
  309819:	ff 75 08             	pushl  0x8(%ebp)
  30981c:	e8 87 fb ff ff       	call   3093a8 <ret>
  309821:	83 c4 10             	add    $0x10,%esp
  309824:	c9                   	leave  
  309825:	c3                   	ret    

00309826 <fs_close>:
  309826:	55                   	push   %ebp
  309827:	89 e5                	mov    %esp,%ebp
  309829:	57                   	push   %edi
  30982a:	56                   	push   %esi
  30982b:	53                   	push   %ebx
  30982c:	83 ec 1c             	sub    $0x1c,%esp
  30982f:	6a 00                	push   $0x0
  309831:	ff 75 08             	pushl  0x8(%ebp)
  309834:	e8 6f fb ff ff       	call   3093a8 <ret>
  309839:	83 c4 08             	add    $0x8,%esp
  30983c:	a1 04 26 31 00       	mov    0x312604,%eax
  309841:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
  309847:	83 ec 08             	sub    $0x8,%esp
  30984a:	6a 00                	push   $0x0
  30984c:	50                   	push   %eax
  30984d:	e8 9d e5 ff ff       	call   307def <kfree_s>
  309852:	83 c4 10             	add    $0x10,%esp
  309855:	a1 04 26 31 00       	mov    0x312604,%eax
  30985a:	c7 80 a0 00 00 00 00 	movl   $0x0,0xa0(%eax)
  309861:	00 00 00 
  309864:	b8 01 00 00 00       	mov    $0x1,%eax
  309869:	bb 03 00 00 00       	mov    $0x3,%ebx
  30986e:	b9 03 00 00 00       	mov    $0x3,%ecx
  309873:	ba 00 00 00 00       	mov    $0x0,%edx
  309878:	be 00 00 00 00       	mov    $0x0,%esi
  30987d:	bf 00 00 00 00       	mov    $0x0,%edi
  309882:	cd 80                	int    $0x80
  309884:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  309887:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30988a:	5b                   	pop    %ebx
  30988b:	5e                   	pop    %esi
  30988c:	5f                   	pop    %edi
  30988d:	5d                   	pop    %ebp
  30988e:	c3                   	ret    

0030988f <fs_seek>:
  30988f:	55                   	push   %ebp
  309890:	89 e5                	mov    %esp,%ebp
  309892:	83 ec 10             	sub    $0x10,%esp
  309895:	a1 04 26 31 00       	mov    0x312604,%eax
  30989a:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
  3098a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  3098a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  3098a6:	83 f8 01             	cmp    $0x1,%eax
  3098a9:	74 14                	je     3098bf <fs_seek+0x30>
  3098ab:	83 f8 02             	cmp    $0x2,%eax
  3098ae:	74 22                	je     3098d2 <fs_seek+0x43>
  3098b0:	85 c0                	test   %eax,%eax
  3098b2:	75 30                	jne    3098e4 <fs_seek+0x55>
  3098b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3098b7:	8b 55 10             	mov    0x10(%ebp),%edx
  3098ba:	89 50 5c             	mov    %edx,0x5c(%eax)
  3098bd:	eb 25                	jmp    3098e4 <fs_seek+0x55>
  3098bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3098c2:	8b 50 5c             	mov    0x5c(%eax),%edx
  3098c5:	8b 45 10             	mov    0x10(%ebp),%eax
  3098c8:	01 c2                	add    %eax,%edx
  3098ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3098cd:	89 50 5c             	mov    %edx,0x5c(%eax)
  3098d0:	eb 12                	jmp    3098e4 <fs_seek+0x55>
  3098d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3098d5:	8b 50 08             	mov    0x8(%eax),%edx
  3098d8:	8b 45 10             	mov    0x10(%ebp),%eax
  3098db:	01 c2                	add    %eax,%edx
  3098dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3098e0:	89 50 5c             	mov    %edx,0x5c(%eax)
  3098e3:	90                   	nop
  3098e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3098e7:	8b 40 5c             	mov    0x5c(%eax),%eax
  3098ea:	50                   	push   %eax
  3098eb:	ff 75 08             	pushl  0x8(%ebp)
  3098ee:	e8 b5 fa ff ff       	call   3093a8 <ret>
  3098f3:	83 c4 08             	add    $0x8,%esp
  3098f6:	c9                   	leave  
  3098f7:	c3                   	ret    

003098f8 <fs_open>:
  3098f8:	55                   	push   %ebp
  3098f9:	89 e5                	mov    %esp,%ebp
  3098fb:	57                   	push   %edi
  3098fc:	56                   	push   %esi
  3098fd:	53                   	push   %ebx
  3098fe:	83 ec 2c             	sub    $0x2c,%esp
  309901:	83 ec 0c             	sub    $0xc,%esp
  309904:	ff 75 0c             	pushl  0xc(%ebp)
  309907:	e8 22 06 00 00       	call   309f2e <eat_path>
  30990c:	83 c4 10             	add    $0x10,%esp
  30990f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  309912:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  309916:	0f 84 43 01 00 00    	je     309a5f <fs_open+0x167>
  30991c:	e8 cb 33 00 00       	call   30ccec <fork>
  309921:	89 45 e0             	mov    %eax,-0x20(%ebp)
  309924:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  309928:	0f 85 16 01 00 00    	jne    309a44 <fs_open+0x14c>
  30992e:	83 ec 0c             	sub    $0xc,%esp
  309931:	6a 60                	push   $0x60
  309933:	e8 4b e3 ff ff       	call   307c83 <kalloc>
  309938:	83 c4 10             	add    $0x10,%esp
  30993b:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30993e:	83 ec 0c             	sub    $0xc,%esp
  309941:	ff 75 0c             	pushl  0xc(%ebp)
  309944:	e8 92 fa ff ff       	call   3093db <strlen>
  309949:	83 c4 10             	add    $0x10,%esp
  30994c:	8d 50 01             	lea    0x1(%eax),%edx
  30994f:	a1 04 26 31 00       	mov    0x312604,%eax
  309954:	83 c0 18             	add    $0x18,%eax
  309957:	83 ec 04             	sub    $0x4,%esp
  30995a:	52                   	push   %edx
  30995b:	ff 75 0c             	pushl  0xc(%ebp)
  30995e:	50                   	push   %eax
  30995f:	e8 95 fa ff ff       	call   3093f9 <memcpy>
  309964:	83 c4 10             	add    $0x10,%esp
  309967:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30996a:	83 ec 04             	sub    $0x4,%esp
  30996d:	6a 5c                	push   $0x5c
  30996f:	ff 75 e4             	pushl  -0x1c(%ebp)
  309972:	50                   	push   %eax
  309973:	e8 81 fa ff ff       	call   3093f9 <memcpy>
  309978:	83 c4 10             	add    $0x10,%esp
  30997b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30997e:	c7 40 5c 00 00 00 00 	movl   $0x0,0x5c(%eax)
  309985:	a1 04 26 31 00       	mov    0x312604,%eax
  30998a:	8b 55 dc             	mov    -0x24(%ebp),%edx
  30998d:	89 90 a0 00 00 00    	mov    %edx,0xa0(%eax)
  309993:	b8 03 00 00 00       	mov    $0x3,%eax
  309998:	bb 00 00 00 00       	mov    $0x0,%ebx
  30999d:	b9 b7 95 30 00       	mov    $0x3095b7,%ecx
  3099a2:	ba 00 00 00 00       	mov    $0x0,%edx
  3099a7:	be 00 00 00 00       	mov    $0x0,%esi
  3099ac:	bf 00 00 00 00       	mov    $0x0,%edi
  3099b1:	cd 80                	int    $0x80
  3099b3:	89 45 d8             	mov    %eax,-0x28(%ebp)
  3099b6:	b8 03 00 00 00       	mov    $0x3,%eax
  3099bb:	bb 01 00 00 00       	mov    $0x1,%ebx
  3099c0:	b9 0c 96 30 00       	mov    $0x30960c,%ecx
  3099c5:	ba 00 00 00 00       	mov    $0x0,%edx
  3099ca:	be 00 00 00 00       	mov    $0x0,%esi
  3099cf:	bf 00 00 00 00       	mov    $0x0,%edi
  3099d4:	cd 80                	int    $0x80
  3099d6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  3099d9:	b8 03 00 00 00       	mov    $0x3,%eax
  3099de:	bb 03 00 00 00       	mov    $0x3,%ebx
  3099e3:	b9 26 98 30 00       	mov    $0x309826,%ecx
  3099e8:	ba 00 00 00 00       	mov    $0x0,%edx
  3099ed:	be 00 00 00 00       	mov    $0x0,%esi
  3099f2:	bf 00 00 00 00       	mov    $0x0,%edi
  3099f7:	cd 80                	int    $0x80
  3099f9:	89 45 d0             	mov    %eax,-0x30(%ebp)
  3099fc:	b8 03 00 00 00       	mov    $0x3,%eax
  309a01:	bb 0c 00 00 00       	mov    $0xc,%ebx
  309a06:	b9 8f 98 30 00       	mov    $0x30988f,%ecx
  309a0b:	ba 00 00 00 00       	mov    $0x0,%edx
  309a10:	be 00 00 00 00       	mov    $0x0,%esi
  309a15:	bf 00 00 00 00       	mov    $0x0,%edi
  309a1a:	cd 80                	int    $0x80
  309a1c:	89 45 cc             	mov    %eax,-0x34(%ebp)
  309a1f:	b8 00 00 00 00       	mov    $0x0,%eax
  309a24:	bb 00 00 00 00       	mov    $0x0,%ebx
  309a29:	b9 00 00 00 00       	mov    $0x0,%ecx
  309a2e:	ba 00 00 00 00       	mov    $0x0,%edx
  309a33:	be 00 00 00 00       	mov    $0x0,%esi
  309a38:	bf 00 00 00 00       	mov    $0x0,%edi
  309a3d:	cd 80                	int    $0x80
  309a3f:	89 45 c8             	mov    %eax,-0x38(%ebp)
  309a42:	eb 19                	jmp    309a5d <fs_open+0x165>
  309a44:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  309a48:	7e 13                	jle    309a5d <fs_open+0x165>
  309a4a:	83 ec 08             	sub    $0x8,%esp
  309a4d:	ff 75 e0             	pushl  -0x20(%ebp)
  309a50:	ff 75 08             	pushl  0x8(%ebp)
  309a53:	e8 50 f9 ff ff       	call   3093a8 <ret>
  309a58:	83 c4 10             	add    $0x10,%esp
  309a5b:	eb 12                	jmp    309a6f <fs_open+0x177>
  309a5d:	eb 10                	jmp    309a6f <fs_open+0x177>
  309a5f:	83 ec 08             	sub    $0x8,%esp
  309a62:	6a e9                	push   $0xffffffe9
  309a64:	ff 75 08             	pushl  0x8(%ebp)
  309a67:	e8 3c f9 ff ff       	call   3093a8 <ret>
  309a6c:	83 c4 10             	add    $0x10,%esp
  309a6f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  309a72:	5b                   	pop    %ebx
  309a73:	5e                   	pop    %esi
  309a74:	5f                   	pop    %edi
  309a75:	5d                   	pop    %ebp
  309a76:	c3                   	ret    

00309a77 <fs_init>:
  309a77:	55                   	push   %ebp
  309a78:	89 e5                	mov    %esp,%ebp
  309a7a:	57                   	push   %edi
  309a7b:	56                   	push   %esi
  309a7c:	53                   	push   %ebx
  309a7d:	83 ec 1c             	sub    $0x1c,%esp
  309a80:	b8 03 00 00 00       	mov    $0x3,%eax
  309a85:	bb 02 00 00 00       	mov    $0x2,%ebx
  309a8a:	b9 f8 98 30 00       	mov    $0x3098f8,%ecx
  309a8f:	ba 00 00 00 00       	mov    $0x0,%edx
  309a94:	be 00 00 00 00       	mov    $0x0,%esi
  309a99:	bf 00 00 00 00       	mov    $0x0,%edi
  309a9e:	cd 80                	int    $0x80
  309aa0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  309aa3:	83 ec 0c             	sub    $0xc,%esp
  309aa6:	6a 07                	push   $0x7
  309aa8:	e8 13 05 00 00       	call   309fc0 <read_super>
  309aad:	83 c4 10             	add    $0x10,%esp
  309ab0:	a3 80 4e 31 00       	mov    %eax,0x314e80
  309ab5:	a1 80 4e 31 00       	mov    0x314e80,%eax
  309aba:	85 c0                	test   %eax,%eax
  309abc:	75 12                	jne    309ad0 <fs_init+0x59>
  309abe:	83 ec 0c             	sub    $0xc,%esp
  309ac1:	68 ef df 30 00       	push   $0x30dfef
  309ac6:	e8 c1 bb ff ff       	call   30568c <panic>
  309acb:	83 c4 10             	add    $0x10,%esp
  309ace:	eb 27                	jmp    309af7 <fs_init+0x80>
  309ad0:	83 ec 08             	sub    $0x8,%esp
  309ad3:	68 c0 4e 31 00       	push   $0x314ec0
  309ad8:	6a 01                	push   $0x1
  309ada:	e8 49 05 00 00       	call   30a028 <get_inode>
  309adf:	83 c4 10             	add    $0x10,%esp
  309ae2:	83 f8 ff             	cmp    $0xffffffff,%eax
  309ae5:	75 10                	jne    309af7 <fs_init+0x80>
  309ae7:	83 ec 0c             	sub    $0xc,%esp
  309aea:	68 0c e0 30 00       	push   $0x30e00c
  309aef:	e8 98 bb ff ff       	call   30568c <panic>
  309af4:	83 c4 10             	add    $0x10,%esp
  309af7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  309afa:	5b                   	pop    %ebx
  309afb:	5e                   	pop    %esi
  309afc:	5f                   	pop    %edi
  309afd:	5d                   	pop    %ebp
  309afe:	c3                   	ret    

00309aff <fs_main>:
  309aff:	55                   	push   %ebp
  309b00:	89 e5                	mov    %esp,%ebp
  309b02:	57                   	push   %edi
  309b03:	56                   	push   %esi
  309b04:	53                   	push   %ebx
  309b05:	83 ec 1c             	sub    $0x1c,%esp
  309b08:	e8 6a ff ff ff       	call   309a77 <fs_init>
  309b0d:	b8 00 00 00 00       	mov    $0x0,%eax
  309b12:	bb 00 00 00 00       	mov    $0x0,%ebx
  309b17:	b9 00 00 00 00       	mov    $0x0,%ecx
  309b1c:	ba 00 00 00 00       	mov    $0x0,%edx
  309b21:	be 00 00 00 00       	mov    $0x0,%esi
  309b26:	bf 00 00 00 00       	mov    $0x0,%edi
  309b2b:	cd 80                	int    $0x80
  309b2d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  309b30:	b8 00 00 00 00       	mov    $0x0,%eax
  309b35:	83 c4 1c             	add    $0x1c,%esp
  309b38:	5b                   	pop    %ebx
  309b39:	5e                   	pop    %esi
  309b3a:	5f                   	pop    %edi
  309b3b:	5d                   	pop    %ebp
  309b3c:	c3                   	ret    
  309b3d:	66 90                	xchg   %ax,%ax
  309b3f:	90                   	nop

00309b40 <block_rw>:
  309b40:	55                   	push   %ebp
  309b41:	89 e5                	mov    %esp,%ebp
  309b43:	57                   	push   %edi
  309b44:	56                   	push   %esi
  309b45:	53                   	push   %ebx
  309b46:	83 ec 14             	sub    $0x14,%esp
  309b49:	8b 45 08             	mov    0x8(%ebp),%eax
  309b4c:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
  309b50:	8b 45 18             	mov    0x18(%ebp),%eax
  309b53:	8d 34 00             	lea    (%eax,%eax,1),%esi
  309b56:	8b 45 14             	mov    0x14(%ebp),%eax
  309b59:	8d 3c 00             	lea    (%eax,%eax,1),%edi
  309b5c:	b8 01 00 00 00       	mov    $0x1,%eax
  309b61:	0f b7 5d e0          	movzwl -0x20(%ebp),%ebx
  309b65:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  309b68:	8b 55 10             	mov    0x10(%ebp),%edx
  309b6b:	cd 80                	int    $0x80
  309b6d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  309b70:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309b73:	83 c4 14             	add    $0x14,%esp
  309b76:	5b                   	pop    %ebx
  309b77:	5e                   	pop    %esi
  309b78:	5f                   	pop    %edi
  309b79:	5d                   	pop    %ebp
  309b7a:	c3                   	ret    

00309b7b <get_indir>:
  309b7b:	55                   	push   %ebp
  309b7c:	89 e5                	mov    %esp,%ebp
  309b7e:	8b 45 08             	mov    0x8(%ebp),%eax
  309b81:	0f b7 40 40          	movzwl 0x40(%eax),%eax
  309b85:	98                   	cwtl   
  309b86:	6a 01                	push   $0x1
  309b88:	ff 75 0c             	pushl  0xc(%ebp)
  309b8b:	68 40 2f 31 00       	push   $0x312f40
  309b90:	6a 00                	push   $0x0
  309b92:	50                   	push   %eax
  309b93:	e8 a8 ff ff ff       	call   309b40 <block_rw>
  309b98:	83 c4 14             	add    $0x14,%esp
  309b9b:	85 c0                	test   %eax,%eax
  309b9d:	74 07                	je     309ba6 <get_indir+0x2b>
  309b9f:	b8 00 00 00 00       	mov    $0x0,%eax
  309ba4:	eb 0d                	jmp    309bb3 <get_indir+0x38>
  309ba6:	8b 45 10             	mov    0x10(%ebp),%eax
  309ba9:	c1 e0 02             	shl    $0x2,%eax
  309bac:	05 40 2f 31 00       	add    $0x312f40,%eax
  309bb1:	8b 00                	mov    (%eax),%eax
  309bb3:	c9                   	leave  
  309bb4:	c3                   	ret    

00309bb5 <_get_zone>:
  309bb5:	55                   	push   %ebp
  309bb6:	89 e5                	mov    %esp,%ebp
  309bb8:	83 ec 18             	sub    $0x18,%esp
  309bbb:	8b 45 08             	mov    0x8(%ebp),%eax
  309bbe:	8b 40 08             	mov    0x8(%eax),%eax
  309bc1:	05 ff 03 00 00       	add    $0x3ff,%eax
  309bc6:	c1 e8 0a             	shr    $0xa,%eax
  309bc9:	3b 45 0c             	cmp    0xc(%ebp),%eax
  309bcc:	73 0a                	jae    309bd8 <_get_zone+0x23>
  309bce:	b8 00 00 00 00       	mov    $0x0,%eax
  309bd3:	e9 08 01 00 00       	jmp    309ce0 <_get_zone+0x12b>
  309bd8:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
  309bdc:	77 12                	ja     309bf0 <_get_zone+0x3b>
  309bde:	8b 45 08             	mov    0x8(%ebp),%eax
  309be1:	8b 55 0c             	mov    0xc(%ebp),%edx
  309be4:	83 c2 04             	add    $0x4,%edx
  309be7:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  309beb:	e9 f0 00 00 00       	jmp    309ce0 <_get_zone+0x12b>
  309bf0:	83 6d 0c 07          	subl   $0x7,0xc(%ebp)
  309bf4:	81 7d 0c ff 00 00 00 	cmpl   $0xff,0xc(%ebp)
  309bfb:	77 1b                	ja     309c18 <_get_zone+0x63>
  309bfd:	8b 55 0c             	mov    0xc(%ebp),%edx
  309c00:	8b 45 08             	mov    0x8(%ebp),%eax
  309c03:	8b 40 34             	mov    0x34(%eax),%eax
  309c06:	52                   	push   %edx
  309c07:	50                   	push   %eax
  309c08:	ff 75 08             	pushl  0x8(%ebp)
  309c0b:	e8 6b ff ff ff       	call   309b7b <get_indir>
  309c10:	83 c4 0c             	add    $0xc,%esp
  309c13:	e9 c8 00 00 00       	jmp    309ce0 <_get_zone+0x12b>
  309c18:	81 6d 0c 00 01 00 00 	subl   $0x100,0xc(%ebp)
  309c1f:	81 7d 0c ff ff 00 00 	cmpl   $0xffff,0xc(%ebp)
  309c26:	77 3b                	ja     309c63 <_get_zone+0xae>
  309c28:	8b 45 0c             	mov    0xc(%ebp),%eax
  309c2b:	c1 e8 08             	shr    $0x8,%eax
  309c2e:	89 c2                	mov    %eax,%edx
  309c30:	8b 45 08             	mov    0x8(%ebp),%eax
  309c33:	8b 40 38             	mov    0x38(%eax),%eax
  309c36:	52                   	push   %edx
  309c37:	50                   	push   %eax
  309c38:	ff 75 08             	pushl  0x8(%ebp)
  309c3b:	e8 3b ff ff ff       	call   309b7b <get_indir>
  309c40:	83 c4 0c             	add    $0xc,%esp
  309c43:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309c46:	8b 45 0c             	mov    0xc(%ebp),%eax
  309c49:	0f b6 c0             	movzbl %al,%eax
  309c4c:	50                   	push   %eax
  309c4d:	ff 75 f4             	pushl  -0xc(%ebp)
  309c50:	ff 75 08             	pushl  0x8(%ebp)
  309c53:	e8 23 ff ff ff       	call   309b7b <get_indir>
  309c58:	83 c4 0c             	add    $0xc,%esp
  309c5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309c5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309c61:	eb 7d                	jmp    309ce0 <_get_zone+0x12b>
  309c63:	81 6d 0c 00 00 01 00 	subl   $0x10000,0xc(%ebp)
  309c6a:	81 7d 0c ff ff ff 00 	cmpl   $0xffffff,0xc(%ebp)
  309c71:	77 56                	ja     309cc9 <_get_zone+0x114>
  309c73:	8b 45 0c             	mov    0xc(%ebp),%eax
  309c76:	c1 e8 10             	shr    $0x10,%eax
  309c79:	89 c2                	mov    %eax,%edx
  309c7b:	8b 45 08             	mov    0x8(%ebp),%eax
  309c7e:	8b 40 3c             	mov    0x3c(%eax),%eax
  309c81:	52                   	push   %edx
  309c82:	50                   	push   %eax
  309c83:	ff 75 08             	pushl  0x8(%ebp)
  309c86:	e8 f0 fe ff ff       	call   309b7b <get_indir>
  309c8b:	83 c4 0c             	add    $0xc,%esp
  309c8e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309c91:	8b 45 0c             	mov    0xc(%ebp),%eax
  309c94:	c1 e8 08             	shr    $0x8,%eax
  309c97:	0f b6 c0             	movzbl %al,%eax
  309c9a:	50                   	push   %eax
  309c9b:	ff 75 0c             	pushl  0xc(%ebp)
  309c9e:	ff 75 08             	pushl  0x8(%ebp)
  309ca1:	e8 d5 fe ff ff       	call   309b7b <get_indir>
  309ca6:	83 c4 0c             	add    $0xc,%esp
  309ca9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309cac:	8b 45 0c             	mov    0xc(%ebp),%eax
  309caf:	0f b6 c0             	movzbl %al,%eax
  309cb2:	50                   	push   %eax
  309cb3:	ff 75 0c             	pushl  0xc(%ebp)
  309cb6:	ff 75 08             	pushl  0x8(%ebp)
  309cb9:	e8 bd fe ff ff       	call   309b7b <get_indir>
  309cbe:	83 c4 0c             	add    $0xc,%esp
  309cc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309cc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309cc7:	eb 17                	jmp    309ce0 <_get_zone+0x12b>
  309cc9:	83 ec 08             	sub    $0x8,%esp
  309ccc:	6a 31                	push   $0x31
  309cce:	68 2c e0 30 00       	push   $0x30e02c
  309cd3:	e8 d0 b9 ff ff       	call   3056a8 <printk>
  309cd8:	83 c4 10             	add    $0x10,%esp
  309cdb:	b8 00 00 00 00       	mov    $0x0,%eax
  309ce0:	c9                   	leave  
  309ce1:	c3                   	ret    

00309ce2 <zone_rw>:
  309ce2:	55                   	push   %ebp
  309ce3:	89 e5                	mov    %esp,%ebp
  309ce5:	83 ec 18             	sub    $0x18,%esp
  309ce8:	8b 45 08             	mov    0x8(%ebp),%eax
  309ceb:	0f b7 40 40          	movzwl 0x40(%eax),%eax
  309cef:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  309cf3:	83 ec 08             	sub    $0x8,%esp
  309cf6:	ff 75 10             	pushl  0x10(%ebp)
  309cf9:	ff 75 08             	pushl  0x8(%ebp)
  309cfc:	e8 b4 fe ff ff       	call   309bb5 <_get_zone>
  309d01:	83 c4 10             	add    $0x10,%esp
  309d04:	89 45 f0             	mov    %eax,-0x10(%ebp)
  309d07:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  309d0b:	75 1a                	jne    309d27 <zone_rw+0x45>
  309d0d:	83 ec 08             	sub    $0x8,%esp
  309d10:	ff 75 10             	pushl  0x10(%ebp)
  309d13:	68 48 e0 30 00       	push   $0x30e048
  309d18:	e8 8b b9 ff ff       	call   3056a8 <printk>
  309d1d:	83 c4 10             	add    $0x10,%esp
  309d20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  309d25:	eb 1b                	jmp    309d42 <zone_rw+0x60>
  309d27:	0f bf 45 f6          	movswl -0xa(%ebp),%eax
  309d2b:	83 ec 0c             	sub    $0xc,%esp
  309d2e:	6a 01                	push   $0x1
  309d30:	ff 75 f0             	pushl  -0x10(%ebp)
  309d33:	ff 75 14             	pushl  0x14(%ebp)
  309d36:	ff 75 0c             	pushl  0xc(%ebp)
  309d39:	50                   	push   %eax
  309d3a:	e8 01 fe ff ff       	call   309b40 <block_rw>
  309d3f:	83 c4 20             	add    $0x20,%esp
  309d42:	c9                   	leave  
  309d43:	c3                   	ret    

00309d44 <strncmp>:
  309d44:	55                   	push   %ebp
  309d45:	89 e5                	mov    %esp,%ebp
  309d47:	57                   	push   %edi
  309d48:	56                   	push   %esi
  309d49:	8b 45 08             	mov    0x8(%ebp),%eax
  309d4c:	8b 55 0c             	mov    0xc(%ebp),%edx
  309d4f:	8b 4d 10             	mov    0x10(%ebp),%ecx
  309d52:	89 c7                	mov    %eax,%edi
  309d54:	89 d6                	mov    %edx,%esi
  309d56:	fc                   	cld    
  309d57:	49                   	dec    %ecx
  309d58:	78 08                	js     309d62 <strncmp+0x1e>
  309d5a:	ac                   	lods   %ds:(%esi),%al
  309d5b:	ae                   	scas   %es:(%edi),%al
  309d5c:	75 08                	jne    309d66 <strncmp+0x22>
  309d5e:	84 c0                	test   %al,%al
  309d60:	75 f5                	jne    309d57 <strncmp+0x13>
  309d62:	31 c0                	xor    %eax,%eax
  309d64:	eb 09                	jmp    309d6f <strncmp+0x2b>
  309d66:	b8 01 00 00 00       	mov    $0x1,%eax
  309d6b:	7c 02                	jl     309d6f <strncmp+0x2b>
  309d6d:	f7 d8                	neg    %eax
  309d6f:	5e                   	pop    %esi
  309d70:	5f                   	pop    %edi
  309d71:	5d                   	pop    %ebp
  309d72:	c3                   	ret    

00309d73 <memcpy>:
  309d73:	55                   	push   %ebp
  309d74:	89 e5                	mov    %esp,%ebp
  309d76:	57                   	push   %edi
  309d77:	56                   	push   %esi
  309d78:	53                   	push   %ebx
  309d79:	8b 45 10             	mov    0x10(%ebp),%eax
  309d7c:	8b 55 0c             	mov    0xc(%ebp),%edx
  309d7f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  309d82:	89 c1                	mov    %eax,%ecx
  309d84:	89 d6                	mov    %edx,%esi
  309d86:	89 df                	mov    %ebx,%edi
  309d88:	fc                   	cld    
  309d89:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  309d8b:	8b 45 08             	mov    0x8(%ebp),%eax
  309d8e:	5b                   	pop    %ebx
  309d8f:	5e                   	pop    %esi
  309d90:	5f                   	pop    %edi
  309d91:	5d                   	pop    %ebp
  309d92:	c3                   	ret    

00309d93 <memset>:
  309d93:	55                   	push   %ebp
  309d94:	89 e5                	mov    %esp,%ebp
  309d96:	57                   	push   %edi
  309d97:	83 ec 04             	sub    $0x4,%esp
  309d9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  309d9d:	88 45 f8             	mov    %al,-0x8(%ebp)
  309da0:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  309da4:	8b 55 08             	mov    0x8(%ebp),%edx
  309da7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  309daa:	89 d7                	mov    %edx,%edi
  309dac:	fc                   	cld    
  309dad:	f3 aa                	rep stos %al,%es:(%edi)
  309daf:	8b 45 08             	mov    0x8(%ebp),%eax
  309db2:	83 c4 04             	add    $0x4,%esp
  309db5:	5f                   	pop    %edi
  309db6:	5d                   	pop    %ebp
  309db7:	c3                   	ret    

00309db8 <_get_name>:
  309db8:	55                   	push   %ebp
  309db9:	89 e5                	mov    %esp,%ebp
  309dbb:	83 ec 10             	sub    $0x10,%esp
  309dbe:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  309dc2:	75 07                	jne    309dcb <_get_name+0x13>
  309dc4:	b8 00 00 00 00       	mov    $0x0,%eax
  309dc9:	eb 4a                	jmp    309e15 <_get_name+0x5d>
  309dcb:	8b 45 08             	mov    0x8(%ebp),%eax
  309dce:	0f b6 00             	movzbl (%eax),%eax
  309dd1:	3c 2f                	cmp    $0x2f,%al
  309dd3:	75 04                	jne    309dd9 <_get_name+0x21>
  309dd5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  309dd9:	8b 45 08             	mov    0x8(%ebp),%eax
  309ddc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  309ddf:	eb 04                	jmp    309de5 <_get_name+0x2d>
  309de1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  309de5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  309de8:	0f b6 00             	movzbl (%eax),%eax
  309deb:	84 c0                	test   %al,%al
  309ded:	74 0a                	je     309df9 <_get_name+0x41>
  309def:	8b 45 fc             	mov    -0x4(%ebp),%eax
  309df2:	0f b6 00             	movzbl (%eax),%eax
  309df5:	3c 2f                	cmp    $0x2f,%al
  309df7:	75 e8                	jne    309de1 <_get_name+0x29>
  309df9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  309dfc:	8b 45 08             	mov    0x8(%ebp),%eax
  309dff:	29 c2                	sub    %eax,%edx
  309e01:	89 d0                	mov    %edx,%eax
  309e03:	50                   	push   %eax
  309e04:	ff 75 08             	pushl  0x8(%ebp)
  309e07:	ff 75 0c             	pushl  0xc(%ebp)
  309e0a:	e8 64 ff ff ff       	call   309d73 <memcpy>
  309e0f:	83 c4 0c             	add    $0xc,%esp
  309e12:	8b 45 fc             	mov    -0x4(%ebp),%eax
  309e15:	c9                   	leave  
  309e16:	c3                   	ret    

00309e17 <search_dir>:
  309e17:	55                   	push   %ebp
  309e18:	89 e5                	mov    %esp,%ebp
  309e1a:	83 ec 28             	sub    $0x28,%esp
  309e1d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  309e21:	75 0a                	jne    309e2d <search_dir+0x16>
  309e23:	b8 00 00 00 00       	mov    $0x0,%eax
  309e28:	e9 ff 00 00 00       	jmp    309f2c <search_dir+0x115>
  309e2d:	c7 45 ec 80 33 31 00 	movl   $0x313380,-0x14(%ebp)
  309e34:	83 ec 0c             	sub    $0xc,%esp
  309e37:	6a 5c                	push   $0x5c
  309e39:	e8 45 de ff ff       	call   307c83 <kalloc>
  309e3e:	83 c4 10             	add    $0x10,%esp
  309e41:	89 45 e8             	mov    %eax,-0x18(%ebp)
  309e44:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  309e48:	75 05                	jne    309e4f <search_dir+0x38>
  309e4a:	e9 c2 00 00 00       	jmp    309f11 <search_dir+0xfa>
  309e4f:	8b 45 08             	mov    0x8(%ebp),%eax
  309e52:	8b 40 08             	mov    0x8(%eax),%eax
  309e55:	05 ff 03 00 00       	add    $0x3ff,%eax
  309e5a:	c1 e8 0a             	shr    $0xa,%eax
  309e5d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  309e60:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  309e67:	e9 99 00 00 00       	jmp    309f05 <search_dir+0xee>
  309e6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309e6f:	68 80 33 31 00       	push   $0x313380
  309e74:	50                   	push   %eax
  309e75:	6a 00                	push   $0x0
  309e77:	ff 75 08             	pushl  0x8(%ebp)
  309e7a:	e8 63 fe ff ff       	call   309ce2 <zone_rw>
  309e7f:	83 c4 10             	add    $0x10,%esp
  309e82:	83 f8 ff             	cmp    $0xffffffff,%eax
  309e85:	75 12                	jne    309e99 <search_dir+0x82>
  309e87:	83 ec 0c             	sub    $0xc,%esp
  309e8a:	68 70 e0 30 00       	push   $0x30e070
  309e8f:	e8 14 b8 ff ff       	call   3056a8 <printk>
  309e94:	83 c4 10             	add    $0x10,%esp
  309e97:	eb 78                	jmp    309f11 <search_dir+0xfa>
  309e99:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  309ea0:	eb 57                	jmp    309ef9 <search_dir+0xe2>
  309ea2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309ea5:	c1 e0 05             	shl    $0x5,%eax
  309ea8:	89 c2                	mov    %eax,%edx
  309eaa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  309ead:	01 d0                	add    %edx,%eax
  309eaf:	83 c0 02             	add    $0x2,%eax
  309eb2:	83 ec 04             	sub    $0x4,%esp
  309eb5:	6a 1e                	push   $0x1e
  309eb7:	50                   	push   %eax
  309eb8:	ff 75 0c             	pushl  0xc(%ebp)
  309ebb:	e8 84 fe ff ff       	call   309d44 <strncmp>
  309ec0:	83 c4 10             	add    $0x10,%esp
  309ec3:	85 c0                	test   %eax,%eax
  309ec5:	75 2e                	jne    309ef5 <search_dir+0xde>
  309ec7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309eca:	c1 e0 05             	shl    $0x5,%eax
  309ecd:	89 c2                	mov    %eax,%edx
  309ecf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  309ed2:	01 d0                	add    %edx,%eax
  309ed4:	0f b7 00             	movzwl (%eax),%eax
  309ed7:	0f b7 c0             	movzwl %ax,%eax
  309eda:	83 ec 08             	sub    $0x8,%esp
  309edd:	ff 75 e8             	pushl  -0x18(%ebp)
  309ee0:	50                   	push   %eax
  309ee1:	e8 42 01 00 00       	call   30a028 <get_inode>
  309ee6:	83 c4 10             	add    $0x10,%esp
  309ee9:	83 f8 ff             	cmp    $0xffffffff,%eax
  309eec:	75 02                	jne    309ef0 <search_dir+0xd9>
  309eee:	eb 21                	jmp    309f11 <search_dir+0xfa>
  309ef0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  309ef3:	eb 37                	jmp    309f2c <search_dir+0x115>
  309ef5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  309ef9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309efc:	83 f8 1f             	cmp    $0x1f,%eax
  309eff:	76 a1                	jbe    309ea2 <search_dir+0x8b>
  309f01:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  309f05:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309f08:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  309f0b:	0f 82 5b ff ff ff    	jb     309e6c <search_dir+0x55>
  309f11:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  309f15:	74 10                	je     309f27 <search_dir+0x110>
  309f17:	83 ec 08             	sub    $0x8,%esp
  309f1a:	6a 00                	push   $0x0
  309f1c:	ff 75 e8             	pushl  -0x18(%ebp)
  309f1f:	e8 cb de ff ff       	call   307def <kfree_s>
  309f24:	83 c4 10             	add    $0x10,%esp
  309f27:	b8 00 00 00 00       	mov    $0x0,%eax
  309f2c:	c9                   	leave  
  309f2d:	c3                   	ret    

00309f2e <eat_path>:
  309f2e:	55                   	push   %ebp
  309f2f:	89 e5                	mov    %esp,%ebp
  309f31:	83 ec 38             	sub    $0x38,%esp
  309f34:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  309f38:	74 0a                	je     309f44 <eat_path+0x16>
  309f3a:	8b 45 08             	mov    0x8(%ebp),%eax
  309f3d:	0f b6 00             	movzbl (%eax),%eax
  309f40:	84 c0                	test   %al,%al
  309f42:	75 07                	jne    309f4b <eat_path+0x1d>
  309f44:	b8 00 00 00 00       	mov    $0x0,%eax
  309f49:	eb 70                	jmp    309fbb <eat_path+0x8d>
  309f4b:	8b 45 08             	mov    0x8(%ebp),%eax
  309f4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309f51:	c7 45 f0 c0 4e 31 00 	movl   $0x314ec0,-0x10(%ebp)
  309f58:	eb 37                	jmp    309f91 <eat_path+0x63>
  309f5a:	6a 1e                	push   $0x1e
  309f5c:	6a 00                	push   $0x0
  309f5e:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  309f61:	50                   	push   %eax
  309f62:	e8 2c fe ff ff       	call   309d93 <memset>
  309f67:	83 c4 0c             	add    $0xc,%esp
  309f6a:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  309f6d:	50                   	push   %eax
  309f6e:	ff 75 f4             	pushl  -0xc(%ebp)
  309f71:	e8 42 fe ff ff       	call   309db8 <_get_name>
  309f76:	83 c4 08             	add    $0x8,%esp
  309f79:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309f7c:	83 ec 08             	sub    $0x8,%esp
  309f7f:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  309f82:	50                   	push   %eax
  309f83:	ff 75 f0             	pushl  -0x10(%ebp)
  309f86:	e8 8c fe ff ff       	call   309e17 <search_dir>
  309f8b:	83 c4 10             	add    $0x10,%esp
  309f8e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  309f91:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309f94:	0f b6 00             	movzbl (%eax),%eax
  309f97:	84 c0                	test   %al,%al
  309f99:	74 1d                	je     309fb8 <eat_path+0x8a>
  309f9b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  309f9f:	74 17                	je     309fb8 <eat_path+0x8a>
  309fa1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309fa4:	0f b6 00             	movzbl (%eax),%eax
  309fa7:	3c 2f                	cmp    $0x2f,%al
  309fa9:	75 af                	jne    309f5a <eat_path+0x2c>
  309fab:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309fae:	83 c0 01             	add    $0x1,%eax
  309fb1:	0f b6 00             	movzbl (%eax),%eax
  309fb4:	84 c0                	test   %al,%al
  309fb6:	75 a2                	jne    309f5a <eat_path+0x2c>
  309fb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309fbb:	c9                   	leave  
  309fbc:	c3                   	ret    
  309fbd:	66 90                	xchg   %ax,%ax
  309fbf:	90                   	nop

00309fc0 <read_super>:
  309fc0:	55                   	push   %ebp
  309fc1:	89 e5                	mov    %esp,%ebp
  309fc3:	83 ec 18             	sub    $0x18,%esp
  309fc6:	8b 45 08             	mov    0x8(%ebp),%eax
  309fc9:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  309fcd:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
  309fd1:	83 ec 0c             	sub    $0xc,%esp
  309fd4:	6a 01                	push   $0x1
  309fd6:	6a 01                	push   $0x1
  309fd8:	68 c0 37 31 00       	push   $0x3137c0
  309fdd:	6a 00                	push   $0x0
  309fdf:	50                   	push   %eax
  309fe0:	e8 5b fb ff ff       	call   309b40 <block_rw>
  309fe5:	83 c4 20             	add    $0x20,%esp
  309fe8:	85 c0                	test   %eax,%eax
  309fea:	74 07                	je     309ff3 <read_super+0x33>
  309fec:	b8 00 00 00 00       	mov    $0x0,%eax
  309ff1:	eb 12                	jmp    30a005 <read_super+0x45>
  309ff3:	b8 c0 37 31 00       	mov    $0x3137c0,%eax
  309ff8:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  309ffc:	66 89 50 24          	mov    %dx,0x24(%eax)
  30a000:	b8 c0 37 31 00       	mov    $0x3137c0,%eax
  30a005:	c9                   	leave  
  30a006:	c3                   	ret    
  30a007:	90                   	nop

0030a008 <memcpy>:
  30a008:	55                   	push   %ebp
  30a009:	89 e5                	mov    %esp,%ebp
  30a00b:	57                   	push   %edi
  30a00c:	56                   	push   %esi
  30a00d:	53                   	push   %ebx
  30a00e:	8b 45 10             	mov    0x10(%ebp),%eax
  30a011:	8b 55 0c             	mov    0xc(%ebp),%edx
  30a014:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30a017:	89 c1                	mov    %eax,%ecx
  30a019:	89 d6                	mov    %edx,%esi
  30a01b:	89 df                	mov    %ebx,%edi
  30a01d:	fc                   	cld    
  30a01e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  30a020:	8b 45 08             	mov    0x8(%ebp),%eax
  30a023:	5b                   	pop    %ebx
  30a024:	5e                   	pop    %esi
  30a025:	5f                   	pop    %edi
  30a026:	5d                   	pop    %ebp
  30a027:	c3                   	ret    

0030a028 <get_inode>:
  30a028:	55                   	push   %ebp
  30a029:	89 e5                	mov    %esp,%ebp
  30a02b:	83 ec 18             	sub    $0x18,%esp
  30a02e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  30a032:	75 0a                	jne    30a03e <get_inode+0x16>
  30a034:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  30a039:	e9 ac 00 00 00       	jmp    30a0ea <get_inode+0xc2>
  30a03e:	8b 45 08             	mov    0x8(%ebp),%eax
  30a041:	83 e8 01             	sub    $0x1,%eax
  30a044:	c1 e8 04             	shr    $0x4,%eax
  30a047:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30a04a:	8b 45 08             	mov    0x8(%ebp),%eax
  30a04d:	83 e8 01             	sub    $0x1,%eax
  30a050:	83 e0 0f             	and    $0xf,%eax
  30a053:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30a056:	a1 80 4e 31 00       	mov    0x314e80,%eax
  30a05b:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  30a05f:	98                   	cwtl   
  30a060:	8d 50 02             	lea    0x2(%eax),%edx
  30a063:	a1 80 4e 31 00       	mov    0x314e80,%eax
  30a068:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  30a06c:	98                   	cwtl   
  30a06d:	01 c2                	add    %eax,%edx
  30a06f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a072:	01 d0                	add    %edx,%eax
  30a074:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30a077:	a1 80 4e 31 00       	mov    0x314e80,%eax
  30a07c:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  30a080:	98                   	cwtl   
  30a081:	83 ec 0c             	sub    $0xc,%esp
  30a084:	6a 01                	push   $0x1
  30a086:	ff 75 ec             	pushl  -0x14(%ebp)
  30a089:	68 00 3c 31 00       	push   $0x313c00
  30a08e:	6a 00                	push   $0x0
  30a090:	50                   	push   %eax
  30a091:	e8 aa fa ff ff       	call   309b40 <block_rw>
  30a096:	83 c4 20             	add    $0x20,%esp
  30a099:	85 c0                	test   %eax,%eax
  30a09b:	74 10                	je     30a0ad <get_inode+0x85>
  30a09d:	83 ec 0c             	sub    $0xc,%esp
  30a0a0:	68 90 e0 30 00       	push   $0x30e090
  30a0a5:	e8 e2 b5 ff ff       	call   30568c <panic>
  30a0aa:	83 c4 10             	add    $0x10,%esp
  30a0ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30a0b0:	c1 e0 06             	shl    $0x6,%eax
  30a0b3:	05 00 3c 31 00       	add    $0x313c00,%eax
  30a0b8:	83 ec 04             	sub    $0x4,%esp
  30a0bb:	6a 40                	push   $0x40
  30a0bd:	50                   	push   %eax
  30a0be:	ff 75 0c             	pushl  0xc(%ebp)
  30a0c1:	e8 42 ff ff ff       	call   30a008 <memcpy>
  30a0c6:	83 c4 10             	add    $0x10,%esp
  30a0c9:	8b 15 80 4e 31 00    	mov    0x314e80,%edx
  30a0cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a0d2:	89 50 50             	mov    %edx,0x50(%eax)
  30a0d5:	a1 80 4e 31 00       	mov    0x314e80,%eax
  30a0da:	0f b7 50 24          	movzwl 0x24(%eax),%edx
  30a0de:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a0e1:	66 89 50 40          	mov    %dx,0x40(%eax)
  30a0e5:	b8 00 00 00 00       	mov    $0x0,%eax
  30a0ea:	c9                   	leave  
  30a0eb:	c3                   	ret    

0030a0ec <ret>:
  30a0ec:	55                   	push   %ebp
  30a0ed:	89 e5                	mov    %esp,%ebp
  30a0ef:	57                   	push   %edi
  30a0f0:	56                   	push   %esi
  30a0f1:	53                   	push   %ebx
  30a0f2:	83 ec 10             	sub    $0x10,%esp
  30a0f5:	b8 02 00 00 00       	mov    $0x2,%eax
  30a0fa:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30a0fd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30a100:	ba 00 00 00 00       	mov    $0x0,%edx
  30a105:	be 00 00 00 00       	mov    $0x0,%esi
  30a10a:	bf 00 00 00 00       	mov    $0x0,%edi
  30a10f:	cd 80                	int    $0x80
  30a111:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30a114:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30a117:	83 c4 10             	add    $0x10,%esp
  30a11a:	5b                   	pop    %ebx
  30a11b:	5e                   	pop    %esi
  30a11c:	5f                   	pop    %edi
  30a11d:	5d                   	pop    %ebp
  30a11e:	c3                   	ret    

0030a11f <NICtoPC>:
  30a11f:	55                   	push   %ebp
  30a120:	89 e5                	mov    %esp,%ebp
  30a122:	57                   	push   %edi
  30a123:	53                   	push   %ebx
  30a124:	83 ec 14             	sub    $0x14,%esp
  30a127:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a12a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
  30a12e:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  30a132:	8b 45 10             	mov    0x10(%ebp),%eax
  30a135:	25 fe 00 00 00       	and    $0xfe,%eax
  30a13a:	ba 0a 03 00 00       	mov    $0x30a,%edx
  30a13f:	ee                   	out    %al,(%dx)
  30a140:	8b 45 10             	mov    0x10(%ebp),%eax
  30a143:	c1 f8 08             	sar    $0x8,%eax
  30a146:	0f b6 c0             	movzbl %al,%eax
  30a149:	ba 0b 03 00 00       	mov    $0x30b,%edx
  30a14e:	ee                   	out    %al,(%dx)
  30a14f:	d1 7d 10             	sarl   0x10(%ebp)
  30a152:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  30a156:	0f b6 c0             	movzbl %al,%eax
  30a159:	ba 08 03 00 00       	mov    $0x308,%edx
  30a15e:	ee                   	out    %al,(%dx)
  30a15f:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  30a163:	66 c1 e8 08          	shr    $0x8,%ax
  30a167:	0f b7 c0             	movzwl %ax,%eax
  30a16a:	0f b6 c0             	movzbl %al,%eax
  30a16d:	ba 09 03 00 00       	mov    $0x309,%edx
  30a172:	ee                   	out    %al,(%dx)
  30a173:	b8 0a 00 00 00       	mov    $0xa,%eax
  30a178:	ba 00 03 00 00       	mov    $0x300,%edx
  30a17d:	ee                   	out    %al,(%dx)
  30a17e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30a181:	8b 4d 10             	mov    0x10(%ebp),%ecx
  30a184:	ba 10 03 00 00       	mov    $0x310,%edx
  30a189:	89 df                	mov    %ebx,%edi
  30a18b:	66 ed                	in     (%dx),%ax
  30a18d:	66 ab                	stos   %ax,%es:(%edi)
  30a18f:	e2 fa                	loop   30a18b <NICtoPC+0x6c>
  30a191:	90                   	nop
  30a192:	b8 07 03 00 00       	mov    $0x307,%eax
  30a197:	89 c2                	mov    %eax,%edx
  30a199:	ec                   	in     (%dx),%al
  30a19a:	88 45 f7             	mov    %al,-0x9(%ebp)
  30a19d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30a1a1:	83 e0 40             	and    $0x40,%eax
  30a1a4:	84 c0                	test   %al,%al
  30a1a6:	74 ea                	je     30a192 <NICtoPC+0x73>
  30a1a8:	b8 40 00 00 00       	mov    $0x40,%eax
  30a1ad:	ba 07 03 00 00       	mov    $0x307,%edx
  30a1b2:	ee                   	out    %al,(%dx)
  30a1b3:	83 c4 14             	add    $0x14,%esp
  30a1b6:	5b                   	pop    %ebx
  30a1b7:	5f                   	pop    %edi
  30a1b8:	5d                   	pop    %ebp
  30a1b9:	c3                   	ret    

0030a1ba <PCtoNIC>:
  30a1ba:	55                   	push   %ebp
  30a1bb:	89 e5                	mov    %esp,%ebp
  30a1bd:	56                   	push   %esi
  30a1be:	53                   	push   %ebx
  30a1bf:	83 ec 14             	sub    $0x14,%esp
  30a1c2:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a1c5:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
  30a1c9:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  30a1cd:	8b 45 10             	mov    0x10(%ebp),%eax
  30a1d0:	25 fe 00 00 00       	and    $0xfe,%eax
  30a1d5:	ba 0a 03 00 00       	mov    $0x30a,%edx
  30a1da:	ee                   	out    %al,(%dx)
  30a1db:	8b 45 10             	mov    0x10(%ebp),%eax
  30a1de:	c1 f8 08             	sar    $0x8,%eax
  30a1e1:	0f b6 c0             	movzbl %al,%eax
  30a1e4:	ba 0b 03 00 00       	mov    $0x30b,%edx
  30a1e9:	ee                   	out    %al,(%dx)
  30a1ea:	d1 7d 10             	sarl   0x10(%ebp)
  30a1ed:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  30a1f1:	0f b6 c0             	movzbl %al,%eax
  30a1f4:	ba 08 03 00 00       	mov    $0x308,%edx
  30a1f9:	ee                   	out    %al,(%dx)
  30a1fa:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  30a1fe:	66 c1 e8 08          	shr    $0x8,%ax
  30a202:	0f b7 c0             	movzwl %ax,%eax
  30a205:	0f b6 c0             	movzbl %al,%eax
  30a208:	ba 09 03 00 00       	mov    $0x309,%edx
  30a20d:	ee                   	out    %al,(%dx)
  30a20e:	b8 12 00 00 00       	mov    $0x12,%eax
  30a213:	ba 00 03 00 00       	mov    $0x300,%edx
  30a218:	ee                   	out    %al,(%dx)
  30a219:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30a21c:	8b 4d 10             	mov    0x10(%ebp),%ecx
  30a21f:	ba 10 03 00 00       	mov    $0x310,%edx
  30a224:	89 de                	mov    %ebx,%esi
  30a226:	66 ad                	lods   %ds:(%esi),%ax
  30a228:	66 ef                	out    %ax,(%dx)
  30a22a:	e2 fa                	loop   30a226 <PCtoNIC+0x6c>
  30a22c:	90                   	nop
  30a22d:	b8 07 03 00 00       	mov    $0x307,%eax
  30a232:	89 c2                	mov    %eax,%edx
  30a234:	ec                   	in     (%dx),%al
  30a235:	88 45 f7             	mov    %al,-0x9(%ebp)
  30a238:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30a23c:	83 e0 40             	and    $0x40,%eax
  30a23f:	84 c0                	test   %al,%al
  30a241:	74 ea                	je     30a22d <PCtoNIC+0x73>
  30a243:	b8 40 00 00 00       	mov    $0x40,%eax
  30a248:	ba 07 03 00 00       	mov    $0x307,%edx
  30a24d:	ee                   	out    %al,(%dx)
  30a24e:	83 c4 14             	add    $0x14,%esp
  30a251:	5b                   	pop    %ebx
  30a252:	5e                   	pop    %esi
  30a253:	5d                   	pop    %ebp
  30a254:	c3                   	ret    

0030a255 <ne2kInit>:
  30a255:	55                   	push   %ebp
  30a256:	89 e5                	mov    %esp,%ebp
  30a258:	b8 21 00 00 00       	mov    $0x21,%eax
  30a25d:	ba 00 03 00 00       	mov    $0x300,%edx
  30a262:	ee                   	out    %al,(%dx)
  30a263:	b8 9b 00 00 00       	mov    $0x9b,%eax
  30a268:	ba 0e 03 00 00       	mov    $0x30e,%edx
  30a26d:	ee                   	out    %al,(%dx)
  30a26e:	b8 00 00 00 00       	mov    $0x0,%eax
  30a273:	ba 0a 03 00 00       	mov    $0x30a,%edx
  30a278:	ee                   	out    %al,(%dx)
  30a279:	b8 00 00 00 00       	mov    $0x0,%eax
  30a27e:	ba 0b 03 00 00       	mov    $0x30b,%edx
  30a283:	ee                   	out    %al,(%dx)
  30a284:	b8 03 00 00 00       	mov    $0x3,%eax
  30a289:	ba 0c 03 00 00       	mov    $0x30c,%edx
  30a28e:	ee                   	out    %al,(%dx)
  30a28f:	b8 40 00 00 00       	mov    $0x40,%eax
  30a294:	ba 04 03 00 00       	mov    $0x304,%edx
  30a299:	ee                   	out    %al,(%dx)
  30a29a:	b8 e0 00 00 00       	mov    $0xe0,%eax
  30a29f:	ba 0d 03 00 00       	mov    $0x30d,%edx
  30a2a4:	ee                   	out    %al,(%dx)
  30a2a5:	b8 46 00 00 00       	mov    $0x46,%eax
  30a2aa:	ba 01 03 00 00       	mov    $0x301,%edx
  30a2af:	ee                   	out    %al,(%dx)
  30a2b0:	b8 7f 00 00 00       	mov    $0x7f,%eax
  30a2b5:	ba 02 03 00 00       	mov    $0x302,%edx
  30a2ba:	ee                   	out    %al,(%dx)
  30a2bb:	b8 46 00 00 00       	mov    $0x46,%eax
  30a2c0:	ba 03 03 00 00       	mov    $0x303,%edx
  30a2c5:	ee                   	out    %al,(%dx)
  30a2c6:	b8 61 00 00 00       	mov    $0x61,%eax
  30a2cb:	ba 00 03 00 00       	mov    $0x300,%edx
  30a2d0:	ee                   	out    %al,(%dx)
  30a2d1:	b8 47 00 00 00       	mov    $0x47,%eax
  30a2d6:	ba 07 03 00 00       	mov    $0x307,%edx
  30a2db:	ee                   	out    %al,(%dx)
  30a2dc:	b8 22 00 00 00       	mov    $0x22,%eax
  30a2e1:	ba 00 03 00 00       	mov    $0x300,%edx
  30a2e6:	ee                   	out    %al,(%dx)
  30a2e7:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a2ec:	ba 07 03 00 00       	mov    $0x307,%edx
  30a2f1:	ee                   	out    %al,(%dx)
  30a2f2:	0f b6 05 50 21 31 00 	movzbl 0x312150,%eax
  30a2f9:	ba 0f 03 00 00       	mov    $0x30f,%edx
  30a2fe:	ee                   	out    %al,(%dx)
  30a2ff:	b8 22 00 00 00       	mov    $0x22,%eax
  30a304:	ba 00 03 00 00       	mov    $0x300,%edx
  30a309:	ee                   	out    %al,(%dx)
  30a30a:	6a 0c                	push   $0xc
  30a30c:	6a 00                	push   $0x0
  30a30e:	ff 75 08             	pushl  0x8(%ebp)
  30a311:	e8 09 fe ff ff       	call   30a11f <NICtoPC>
  30a316:	83 c4 0c             	add    $0xc,%esp
  30a319:	8b 45 08             	mov    0x8(%ebp),%eax
  30a31c:	8d 50 01             	lea    0x1(%eax),%edx
  30a31f:	8b 45 08             	mov    0x8(%ebp),%eax
  30a322:	0f b6 40 02          	movzbl 0x2(%eax),%eax
  30a326:	88 02                	mov    %al,(%edx)
  30a328:	8b 45 08             	mov    0x8(%ebp),%eax
  30a32b:	8d 50 02             	lea    0x2(%eax),%edx
  30a32e:	8b 45 08             	mov    0x8(%ebp),%eax
  30a331:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  30a335:	88 02                	mov    %al,(%edx)
  30a337:	8b 45 08             	mov    0x8(%ebp),%eax
  30a33a:	8d 50 03             	lea    0x3(%eax),%edx
  30a33d:	8b 45 08             	mov    0x8(%ebp),%eax
  30a340:	0f b6 40 06          	movzbl 0x6(%eax),%eax
  30a344:	88 02                	mov    %al,(%edx)
  30a346:	8b 45 08             	mov    0x8(%ebp),%eax
  30a349:	8d 50 04             	lea    0x4(%eax),%edx
  30a34c:	8b 45 08             	mov    0x8(%ebp),%eax
  30a34f:	0f b6 40 08          	movzbl 0x8(%eax),%eax
  30a353:	88 02                	mov    %al,(%edx)
  30a355:	8b 45 08             	mov    0x8(%ebp),%eax
  30a358:	8d 50 05             	lea    0x5(%eax),%edx
  30a35b:	8b 45 08             	mov    0x8(%ebp),%eax
  30a35e:	0f b6 40 0a          	movzbl 0xa(%eax),%eax
  30a362:	88 02                	mov    %al,(%edx)
  30a364:	b8 61 00 00 00       	mov    $0x61,%eax
  30a369:	ba 00 03 00 00       	mov    $0x300,%edx
  30a36e:	ee                   	out    %al,(%dx)
  30a36f:	8b 45 08             	mov    0x8(%ebp),%eax
  30a372:	8b 00                	mov    (%eax),%eax
  30a374:	0f b6 c0             	movzbl %al,%eax
  30a377:	ba 01 03 00 00       	mov    $0x301,%edx
  30a37c:	ee                   	out    %al,(%dx)
  30a37d:	8b 45 08             	mov    0x8(%ebp),%eax
  30a380:	8b 00                	mov    (%eax),%eax
  30a382:	c1 e8 08             	shr    $0x8,%eax
  30a385:	0f b6 c0             	movzbl %al,%eax
  30a388:	ba 02 03 00 00       	mov    $0x302,%edx
  30a38d:	ee                   	out    %al,(%dx)
  30a38e:	8b 45 08             	mov    0x8(%ebp),%eax
  30a391:	8b 00                	mov    (%eax),%eax
  30a393:	c1 e8 10             	shr    $0x10,%eax
  30a396:	0f b6 c0             	movzbl %al,%eax
  30a399:	ba 03 03 00 00       	mov    $0x303,%edx
  30a39e:	ee                   	out    %al,(%dx)
  30a39f:	8b 45 08             	mov    0x8(%ebp),%eax
  30a3a2:	8b 00                	mov    (%eax),%eax
  30a3a4:	c1 e8 18             	shr    $0x18,%eax
  30a3a7:	ba 04 03 00 00       	mov    $0x304,%edx
  30a3ac:	ee                   	out    %al,(%dx)
  30a3ad:	8b 45 08             	mov    0x8(%ebp),%eax
  30a3b0:	83 c0 04             	add    $0x4,%eax
  30a3b3:	8b 00                	mov    (%eax),%eax
  30a3b5:	0f b6 c0             	movzbl %al,%eax
  30a3b8:	ba 05 03 00 00       	mov    $0x305,%edx
  30a3bd:	ee                   	out    %al,(%dx)
  30a3be:	8b 45 08             	mov    0x8(%ebp),%eax
  30a3c1:	83 c0 04             	add    $0x4,%eax
  30a3c4:	8b 00                	mov    (%eax),%eax
  30a3c6:	c1 e8 08             	shr    $0x8,%eax
  30a3c9:	0f b6 c0             	movzbl %al,%eax
  30a3cc:	ba 06 03 00 00       	mov    $0x306,%edx
  30a3d1:	ee                   	out    %al,(%dx)
  30a3d2:	b8 22 00 00 00       	mov    $0x22,%eax
  30a3d7:	ba 00 03 00 00       	mov    $0x300,%edx
  30a3dc:	ee                   	out    %al,(%dx)
  30a3dd:	b8 61 00 00 00       	mov    $0x61,%eax
  30a3e2:	ba 00 03 00 00       	mov    $0x300,%edx
  30a3e7:	ee                   	out    %al,(%dx)
  30a3e8:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a3ed:	ba 08 03 00 00       	mov    $0x308,%edx
  30a3f2:	ee                   	out    %al,(%dx)
  30a3f3:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a3f8:	ba 09 03 00 00       	mov    $0x309,%edx
  30a3fd:	ee                   	out    %al,(%dx)
  30a3fe:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a403:	ba 0a 03 00 00       	mov    $0x30a,%edx
  30a408:	ee                   	out    %al,(%dx)
  30a409:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a40e:	ba 0b 03 00 00       	mov    $0x30b,%edx
  30a413:	ee                   	out    %al,(%dx)
  30a414:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a419:	ba 0c 03 00 00       	mov    $0x30c,%edx
  30a41e:	ee                   	out    %al,(%dx)
  30a41f:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a424:	ba 0d 03 00 00       	mov    $0x30d,%edx
  30a429:	ee                   	out    %al,(%dx)
  30a42a:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a42f:	ba 0e 03 00 00       	mov    $0x30e,%edx
  30a434:	ee                   	out    %al,(%dx)
  30a435:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a43a:	ba 0f 03 00 00       	mov    $0x30f,%edx
  30a43f:	ee                   	out    %al,(%dx)
  30a440:	b8 22 00 00 00       	mov    $0x22,%eax
  30a445:	ba 00 03 00 00       	mov    $0x300,%edx
  30a44a:	ee                   	out    %al,(%dx)
  30a44b:	c9                   	leave  
  30a44c:	c3                   	ret    

0030a44d <neSend>:
  30a44d:	55                   	push   %ebp
  30a44e:	89 e5                	mov    %esp,%ebp
  30a450:	83 ec 18             	sub    $0x18,%esp
  30a453:	fa                   	cli    
  30a454:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  30a458:	74 6d                	je     30a4c7 <neSend+0x7a>
  30a45a:	b8 00 03 00 00       	mov    $0x300,%eax
  30a45f:	89 c2                	mov    %eax,%edx
  30a461:	ec                   	in     (%dx),%al
  30a462:	88 45 f7             	mov    %al,-0x9(%ebp)
  30a465:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30a469:	3c 26                	cmp    $0x26,%al
  30a46b:	75 12                	jne    30a47f <neSend+0x32>
  30a46d:	83 ec 0c             	sub    $0xc,%esp
  30a470:	68 a2 e0 30 00       	push   $0x30e0a2
  30a475:	e8 2e b2 ff ff       	call   3056a8 <printk>
  30a47a:	83 c4 10             	add    $0x10,%esp
  30a47d:	eb 49                	jmp    30a4c8 <neSend+0x7b>
  30a47f:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a482:	83 ec 04             	sub    $0x4,%esp
  30a485:	50                   	push   %eax
  30a486:	68 00 40 00 00       	push   $0x4000
  30a48b:	ff 75 08             	pushl  0x8(%ebp)
  30a48e:	e8 27 fd ff ff       	call   30a1ba <PCtoNIC>
  30a493:	83 c4 10             	add    $0x10,%esp
  30a496:	b8 40 00 00 00       	mov    $0x40,%eax
  30a49b:	ba 04 03 00 00       	mov    $0x304,%edx
  30a4a0:	ee                   	out    %al,(%dx)
  30a4a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a4a4:	0f b6 c0             	movzbl %al,%eax
  30a4a7:	ba 05 03 00 00       	mov    $0x305,%edx
  30a4ac:	ee                   	out    %al,(%dx)
  30a4ad:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a4b0:	c1 e8 08             	shr    $0x8,%eax
  30a4b3:	0f b6 c0             	movzbl %al,%eax
  30a4b6:	ba 06 03 00 00       	mov    $0x306,%edx
  30a4bb:	ee                   	out    %al,(%dx)
  30a4bc:	b8 26 00 00 00       	mov    $0x26,%eax
  30a4c1:	ba 00 03 00 00       	mov    $0x300,%edx
  30a4c6:	ee                   	out    %al,(%dx)
  30a4c7:	fb                   	sti    
  30a4c8:	c9                   	leave  
  30a4c9:	c3                   	ret    

0030a4ca <neRecv>:
  30a4ca:	55                   	push   %ebp
  30a4cb:	89 e5                	mov    %esp,%ebp
  30a4cd:	83 ec 10             	sub    $0x10,%esp
  30a4d0:	b8 03 03 00 00       	mov    $0x303,%eax
  30a4d5:	89 c2                	mov    %eax,%edx
  30a4d7:	ec                   	in     (%dx),%al
  30a4d8:	88 45 fe             	mov    %al,-0x2(%ebp)
  30a4db:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  30a4df:	83 c0 01             	add    $0x1,%eax
  30a4e2:	88 45 ff             	mov    %al,-0x1(%ebp)
  30a4e5:	b8 62 00 00 00       	mov    $0x62,%eax
  30a4ea:	ba 00 03 00 00       	mov    $0x300,%edx
  30a4ef:	ee                   	out    %al,(%dx)
  30a4f0:	b8 07 03 00 00       	mov    $0x307,%eax
  30a4f5:	89 c2                	mov    %eax,%edx
  30a4f7:	ec                   	in     (%dx),%al
  30a4f8:	88 45 fd             	mov    %al,-0x3(%ebp)
  30a4fb:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  30a4ff:	88 45 fc             	mov    %al,-0x4(%ebp)
  30a502:	b8 22 00 00 00       	mov    $0x22,%eax
  30a507:	ba 00 03 00 00       	mov    $0x300,%edx
  30a50c:	ee                   	out    %al,(%dx)
  30a50d:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  30a511:	88 45 fb             	mov    %al,-0x5(%ebp)
  30a514:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  30a518:	84 c0                	test   %al,%al
  30a51a:	79 04                	jns    30a520 <neRecv+0x56>
  30a51c:	c6 45 ff 46          	movb   $0x46,-0x1(%ebp)
  30a520:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  30a524:	3a 45 fb             	cmp    -0x5(%ebp),%al
  30a527:	0f 84 a4 00 00 00    	je     30a5d1 <neRecv+0x107>
  30a52d:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  30a531:	c1 e0 08             	shl    $0x8,%eax
  30a534:	0f b7 c0             	movzwl %ax,%eax
  30a537:	6a 04                	push   $0x4
  30a539:	50                   	push   %eax
  30a53a:	8d 45 f7             	lea    -0x9(%ebp),%eax
  30a53d:	50                   	push   %eax
  30a53e:	e8 dc fb ff ff       	call   30a11f <NICtoPC>
  30a543:	83 c4 0c             	add    $0xc,%esp
  30a546:	0f b7 45 f9          	movzwl -0x7(%ebp),%eax
  30a54a:	83 e8 04             	sub    $0x4,%eax
  30a54d:	66 89 45 f9          	mov    %ax,-0x7(%ebp)
  30a551:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  30a555:	84 c0                	test   %al,%al
  30a557:	78 12                	js     30a56b <neRecv+0xa1>
  30a559:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  30a55d:	3c 45                	cmp    $0x45,%al
  30a55f:	76 0a                	jbe    30a56b <neRecv+0xa1>
  30a561:	0f b7 45 f9          	movzwl -0x7(%ebp),%eax
  30a565:	66 3d 00 06          	cmp    $0x600,%ax
  30a569:	76 33                	jbe    30a59e <neRecv+0xd4>
  30a56b:	b8 61 00 00 00       	mov    $0x61,%eax
  30a570:	ba 00 03 00 00       	mov    $0x300,%edx
  30a575:	ee                   	out    %al,(%dx)
  30a576:	b8 46 00 00 00       	mov    $0x46,%eax
  30a57b:	ba 07 03 00 00       	mov    $0x307,%edx
  30a580:	ee                   	out    %al,(%dx)
  30a581:	b8 22 00 00 00       	mov    $0x22,%eax
  30a586:	ba 00 03 00 00       	mov    $0x300,%edx
  30a58b:	ee                   	out    %al,(%dx)
  30a58c:	b8 7f 00 00 00       	mov    $0x7f,%eax
  30a591:	ba 03 03 00 00       	mov    $0x303,%edx
  30a596:	ee                   	out    %al,(%dx)
  30a597:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  30a59c:	eb 36                	jmp    30a5d4 <neRecv+0x10a>
  30a59e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  30a5a2:	74 2d                	je     30a5d1 <neRecv+0x107>
  30a5a4:	8b 55 0c             	mov    0xc(%ebp),%edx
  30a5a7:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  30a5ab:	c1 e0 08             	shl    $0x8,%eax
  30a5ae:	83 c8 04             	or     $0x4,%eax
  30a5b1:	0f b7 c0             	movzwl %ax,%eax
  30a5b4:	52                   	push   %edx
  30a5b5:	50                   	push   %eax
  30a5b6:	ff 75 08             	pushl  0x8(%ebp)
  30a5b9:	e8 61 fb ff ff       	call   30a11f <NICtoPC>
  30a5be:	83 c4 0c             	add    $0xc,%esp
  30a5c1:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  30a5c5:	0f b6 c0             	movzbl %al,%eax
  30a5c8:	83 e8 01             	sub    $0x1,%eax
  30a5cb:	ba 03 03 00 00       	mov    $0x303,%edx
  30a5d0:	ee                   	out    %al,(%dx)
  30a5d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a5d4:	c9                   	leave  
  30a5d5:	c3                   	ret    

0030a5d6 <ne2k_handler>:
  30a5d6:	55                   	push   %ebp
  30a5d7:	89 e5                	mov    %esp,%ebp
  30a5d9:	83 ec 18             	sub    $0x18,%esp
  30a5dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30a5e3:	b8 07 03 00 00       	mov    $0x307,%eax
  30a5e8:	89 c2                	mov    %eax,%edx
  30a5ea:	ec                   	in     (%dx),%al
  30a5eb:	88 45 f3             	mov    %al,-0xd(%ebp)
  30a5ee:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  30a5f2:	0f b6 c0             	movzbl %al,%eax
  30a5f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30a5f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a5fb:	83 ec 0c             	sub    $0xc,%esp
  30a5fe:	6a 00                	push   $0x0
  30a600:	6a 00                	push   $0x0
  30a602:	50                   	push   %eax
  30a603:	6a 06                	push   $0x6
  30a605:	ff 75 08             	pushl  0x8(%ebp)
  30a608:	e8 80 c3 ff ff       	call   30698d <doint>
  30a60d:	83 c4 20             	add    $0x20,%esp
  30a610:	fa                   	cli    
  30a611:	0f b6 05 50 21 31 00 	movzbl 0x312150,%eax
  30a618:	ba 0f 03 00 00       	mov    $0x30f,%edx
  30a61d:	ee                   	out    %al,(%dx)
  30a61e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a621:	ba 07 03 00 00       	mov    $0x307,%edx
  30a626:	ee                   	out    %al,(%dx)
  30a627:	fb                   	sti    
  30a628:	b8 00 00 00 00       	mov    $0x0,%eax
  30a62d:	c9                   	leave  
  30a62e:	c3                   	ret    

0030a62f <ne2k_push>:
  30a62f:	55                   	push   %ebp
  30a630:	89 e5                	mov    %esp,%ebp
  30a632:	a1 04 40 31 00       	mov    0x314004,%eax
  30a637:	85 c0                	test   %eax,%eax
  30a639:	75 12                	jne    30a64d <ne2k_push+0x1e>
  30a63b:	8b 45 08             	mov    0x8(%ebp),%eax
  30a63e:	a3 04 40 31 00       	mov    %eax,0x314004
  30a643:	a1 04 40 31 00       	mov    0x314004,%eax
  30a648:	a3 08 40 31 00       	mov    %eax,0x314008
  30a64d:	a1 08 40 31 00       	mov    0x314008,%eax
  30a652:	8b 55 08             	mov    0x8(%ebp),%edx
  30a655:	89 50 0c             	mov    %edx,0xc(%eax)
  30a658:	8b 45 08             	mov    0x8(%ebp),%eax
  30a65b:	a3 08 40 31 00       	mov    %eax,0x314008
  30a660:	a1 08 40 31 00       	mov    0x314008,%eax
  30a665:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  30a66c:	5d                   	pop    %ebp
  30a66d:	c3                   	ret    

0030a66e <ne2k_pop>:
  30a66e:	55                   	push   %ebp
  30a66f:	89 e5                	mov    %esp,%ebp
  30a671:	83 ec 18             	sub    $0x18,%esp
  30a674:	a1 04 40 31 00       	mov    0x314004,%eax
  30a679:	85 c0                	test   %eax,%eax
  30a67b:	74 25                	je     30a6a2 <ne2k_pop+0x34>
  30a67d:	a1 04 40 31 00       	mov    0x314004,%eax
  30a682:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30a685:	a1 04 40 31 00       	mov    0x314004,%eax
  30a68a:	8b 40 0c             	mov    0xc(%eax),%eax
  30a68d:	a3 04 40 31 00       	mov    %eax,0x314004
  30a692:	83 ec 08             	sub    $0x8,%esp
  30a695:	6a 00                	push   $0x0
  30a697:	ff 75 f4             	pushl  -0xc(%ebp)
  30a69a:	e8 50 d7 ff ff       	call   307def <kfree_s>
  30a69f:	83 c4 10             	add    $0x10,%esp
  30a6a2:	c9                   	leave  
  30a6a3:	c3                   	ret    

0030a6a4 <_rw>:
  30a6a4:	55                   	push   %ebp
  30a6a5:	89 e5                	mov    %esp,%ebp
  30a6a7:	83 ec 18             	sub    $0x18,%esp
  30a6aa:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  30a6ae:	75 23                	jne    30a6d3 <_rw+0x2f>
  30a6b0:	83 ec 08             	sub    $0x8,%esp
  30a6b3:	ff 75 14             	pushl  0x14(%ebp)
  30a6b6:	ff 75 10             	pushl  0x10(%ebp)
  30a6b9:	e8 8f fd ff ff       	call   30a44d <neSend>
  30a6be:	83 c4 10             	add    $0x10,%esp
  30a6c1:	83 ec 08             	sub    $0x8,%esp
  30a6c4:	6a 00                	push   $0x0
  30a6c6:	ff 75 08             	pushl  0x8(%ebp)
  30a6c9:	e8 1e fa ff ff       	call   30a0ec <ret>
  30a6ce:	83 c4 10             	add    $0x10,%esp
  30a6d1:	eb 5a                	jmp    30a72d <_rw+0x89>
  30a6d3:	83 ec 0c             	sub    $0xc,%esp
  30a6d6:	6a 10                	push   $0x10
  30a6d8:	e8 a6 d5 ff ff       	call   307c83 <kalloc>
  30a6dd:	83 c4 10             	add    $0x10,%esp
  30a6e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30a6e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  30a6e7:	74 34                	je     30a71d <_rw+0x79>
  30a6e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a6ec:	8b 55 08             	mov    0x8(%ebp),%edx
  30a6ef:	89 10                	mov    %edx,(%eax)
  30a6f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a6f4:	8b 55 10             	mov    0x10(%ebp),%edx
  30a6f7:	89 50 08             	mov    %edx,0x8(%eax)
  30a6fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a6fd:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  30a704:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a707:	8b 55 14             	mov    0x14(%ebp),%edx
  30a70a:	89 50 04             	mov    %edx,0x4(%eax)
  30a70d:	83 ec 0c             	sub    $0xc,%esp
  30a710:	ff 75 f4             	pushl  -0xc(%ebp)
  30a713:	e8 17 ff ff ff       	call   30a62f <ne2k_push>
  30a718:	83 c4 10             	add    $0x10,%esp
  30a71b:	eb 10                	jmp    30a72d <_rw+0x89>
  30a71d:	83 ec 08             	sub    $0x8,%esp
  30a720:	6a ff                	push   $0xffffffff
  30a722:	ff 75 08             	pushl  0x8(%ebp)
  30a725:	e8 c2 f9 ff ff       	call   30a0ec <ret>
  30a72a:	83 c4 10             	add    $0x10,%esp
  30a72d:	c9                   	leave  
  30a72e:	c3                   	ret    

0030a72f <_io>:
  30a72f:	55                   	push   %ebp
  30a730:	89 e5                	mov    %esp,%ebp
  30a732:	83 ec 18             	sub    $0x18,%esp
  30a735:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a738:	83 e0 01             	and    $0x1,%eax
  30a73b:	85 c0                	test   %eax,%eax
  30a73d:	74 3f                	je     30a77e <_io+0x4f>
  30a73f:	a1 04 40 31 00       	mov    0x314004,%eax
  30a744:	85 c0                	test   %eax,%eax
  30a746:	74 36                	je     30a77e <_io+0x4f>
  30a748:	a1 04 40 31 00       	mov    0x314004,%eax
  30a74d:	8b 50 04             	mov    0x4(%eax),%edx
  30a750:	a1 04 40 31 00       	mov    0x314004,%eax
  30a755:	8b 40 08             	mov    0x8(%eax),%eax
  30a758:	52                   	push   %edx
  30a759:	50                   	push   %eax
  30a75a:	e8 6b fd ff ff       	call   30a4ca <neRecv>
  30a75f:	83 c4 08             	add    $0x8,%esp
  30a762:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30a765:	8b 55 f4             	mov    -0xc(%ebp),%edx
  30a768:	a1 04 40 31 00       	mov    0x314004,%eax
  30a76d:	8b 00                	mov    (%eax),%eax
  30a76f:	52                   	push   %edx
  30a770:	50                   	push   %eax
  30a771:	e8 76 f9 ff ff       	call   30a0ec <ret>
  30a776:	83 c4 08             	add    $0x8,%esp
  30a779:	e8 f0 fe ff ff       	call   30a66e <ne2k_pop>
  30a77e:	c9                   	leave  
  30a77f:	c3                   	ret    

0030a780 <ne2k_init>:
  30a780:	55                   	push   %ebp
  30a781:	89 e5                	mov    %esp,%ebp
  30a783:	57                   	push   %edi
  30a784:	56                   	push   %esi
  30a785:	53                   	push   %ebx
  30a786:	83 ec 1c             	sub    $0x1c,%esp
  30a789:	b8 03 00 00 00       	mov    $0x3,%eax
  30a78e:	bb 01 00 00 00       	mov    $0x1,%ebx
  30a793:	b9 a4 a6 30 00       	mov    $0x30a6a4,%ecx
  30a798:	ba 00 00 00 00       	mov    $0x0,%edx
  30a79d:	be 00 00 00 00       	mov    $0x0,%esi
  30a7a2:	bf 00 00 00 00       	mov    $0x0,%edi
  30a7a7:	cd 80                	int    $0x80
  30a7a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30a7ac:	b8 03 00 00 00       	mov    $0x3,%eax
  30a7b1:	bb 00 00 00 00       	mov    $0x0,%ebx
  30a7b6:	b9 a4 a6 30 00       	mov    $0x30a6a4,%ecx
  30a7bb:	ba 00 00 00 00       	mov    $0x0,%edx
  30a7c0:	be 00 00 00 00       	mov    $0x0,%esi
  30a7c5:	bf 00 00 00 00       	mov    $0x0,%edi
  30a7ca:	cd 80                	int    $0x80
  30a7cc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30a7cf:	b8 03 00 00 00       	mov    $0x3,%eax
  30a7d4:	bb 06 00 00 00       	mov    $0x6,%ebx
  30a7d9:	b9 2f a7 30 00       	mov    $0x30a72f,%ecx
  30a7de:	ba 00 00 00 00       	mov    $0x0,%edx
  30a7e3:	be 00 00 00 00       	mov    $0x0,%esi
  30a7e8:	bf 00 00 00 00       	mov    $0x0,%edi
  30a7ed:	cd 80                	int    $0x80
  30a7ef:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30a7f2:	83 ec 08             	sub    $0x8,%esp
  30a7f5:	68 d6 a5 30 00       	push   $0x30a5d6
  30a7fa:	6a 03                	push   $0x3
  30a7fc:	e8 e7 b4 ff ff       	call   305ce8 <put_irq_handler>
  30a801:	83 c4 10             	add    $0x10,%esp
  30a804:	83 ec 0c             	sub    $0xc,%esp
  30a807:	68 0c 40 31 00       	push   $0x31400c
  30a80c:	e8 44 fa ff ff       	call   30a255 <ne2kInit>
  30a811:	83 c4 10             	add    $0x10,%esp
  30a814:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30a817:	5b                   	pop    %ebx
  30a818:	5e                   	pop    %esi
  30a819:	5f                   	pop    %edi
  30a81a:	5d                   	pop    %ebp
  30a81b:	c3                   	ret    

0030a81c <ne2k_main>:
  30a81c:	55                   	push   %ebp
  30a81d:	89 e5                	mov    %esp,%ebp
  30a81f:	57                   	push   %edi
  30a820:	56                   	push   %esi
  30a821:	53                   	push   %ebx
  30a822:	83 ec 1c             	sub    $0x1c,%esp
  30a825:	e8 56 ff ff ff       	call   30a780 <ne2k_init>
  30a82a:	b8 00 00 00 00       	mov    $0x0,%eax
  30a82f:	bb 00 00 00 00       	mov    $0x0,%ebx
  30a834:	b9 00 00 00 00       	mov    $0x0,%ecx
  30a839:	ba 00 00 00 00       	mov    $0x0,%edx
  30a83e:	be 00 00 00 00       	mov    $0x0,%esi
  30a843:	bf 00 00 00 00       	mov    $0x0,%edi
  30a848:	cd 80                	int    $0x80
  30a84a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30a84d:	b8 00 00 00 00       	mov    $0x0,%eax
  30a852:	83 c4 1c             	add    $0x1c,%esp
  30a855:	5b                   	pop    %ebx
  30a856:	5e                   	pop    %esi
  30a857:	5f                   	pop    %edi
  30a858:	5d                   	pop    %ebp
  30a859:	c3                   	ret    
  30a85a:	66 90                	xchg   %ax,%ax

0030a85c <ret>:
  30a85c:	55                   	push   %ebp
  30a85d:	89 e5                	mov    %esp,%ebp
  30a85f:	57                   	push   %edi
  30a860:	56                   	push   %esi
  30a861:	53                   	push   %ebx
  30a862:	83 ec 10             	sub    $0x10,%esp
  30a865:	b8 02 00 00 00       	mov    $0x2,%eax
  30a86a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30a86d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30a870:	ba 00 00 00 00       	mov    $0x0,%edx
  30a875:	be 00 00 00 00       	mov    $0x0,%esi
  30a87a:	bf 00 00 00 00       	mov    $0x0,%edi
  30a87f:	cd 80                	int    $0x80
  30a881:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30a884:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30a887:	83 c4 10             	add    $0x10,%esp
  30a88a:	5b                   	pop    %ebx
  30a88b:	5e                   	pop    %esi
  30a88c:	5f                   	pop    %edi
  30a88d:	5d                   	pop    %ebp
  30a88e:	c3                   	ret    

0030a88f <_add>:
  30a88f:	55                   	push   %ebp
  30a890:	89 e5                	mov    %esp,%ebp
  30a892:	83 ec 10             	sub    $0x10,%esp
  30a895:	a1 1c 40 31 00       	mov    0x31401c,%eax
  30a89a:	85 c0                	test   %eax,%eax
  30a89c:	75 26                	jne    30a8c4 <_add+0x35>
  30a89e:	8b 45 08             	mov    0x8(%ebp),%eax
  30a8a1:	a3 1c 40 31 00       	mov    %eax,0x31401c
  30a8a6:	a1 1c 40 31 00       	mov    0x31401c,%eax
  30a8ab:	8b 15 1c 40 31 00    	mov    0x31401c,%edx
  30a8b1:	89 50 14             	mov    %edx,0x14(%eax)
  30a8b4:	a1 1c 40 31 00       	mov    0x31401c,%eax
  30a8b9:	8b 15 1c 40 31 00    	mov    0x31401c,%edx
  30a8bf:	89 50 18             	mov    %edx,0x18(%eax)
  30a8c2:	eb 6c                	jmp    30a930 <_add+0xa1>
  30a8c4:	a1 1c 40 31 00       	mov    0x31401c,%eax
  30a8c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30a8cc:	8b 45 08             	mov    0x8(%ebp),%eax
  30a8cf:	8b 50 08             	mov    0x8(%eax),%edx
  30a8d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30a8d5:	8b 40 08             	mov    0x8(%eax),%eax
  30a8d8:	39 c2                	cmp    %eax,%edx
  30a8da:	73 02                	jae    30a8de <_add+0x4f>
  30a8dc:	eb 13                	jmp    30a8f1 <_add+0x62>
  30a8de:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30a8e1:	8b 40 14             	mov    0x14(%eax),%eax
  30a8e4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30a8e7:	a1 1c 40 31 00       	mov    0x31401c,%eax
  30a8ec:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  30a8ef:	75 db                	jne    30a8cc <_add+0x3d>
  30a8f1:	8b 45 08             	mov    0x8(%ebp),%eax
  30a8f4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  30a8f7:	89 50 14             	mov    %edx,0x14(%eax)
  30a8fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30a8fd:	8b 50 18             	mov    0x18(%eax),%edx
  30a900:	8b 45 08             	mov    0x8(%ebp),%eax
  30a903:	89 50 18             	mov    %edx,0x18(%eax)
  30a906:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30a909:	8b 55 08             	mov    0x8(%ebp),%edx
  30a90c:	89 50 18             	mov    %edx,0x18(%eax)
  30a90f:	a1 1c 40 31 00       	mov    0x31401c,%eax
  30a914:	8b 50 08             	mov    0x8(%eax),%edx
  30a917:	8b 45 08             	mov    0x8(%ebp),%eax
  30a91a:	8b 40 08             	mov    0x8(%eax),%eax
  30a91d:	39 c2                	cmp    %eax,%edx
  30a91f:	76 05                	jbe    30a926 <_add+0x97>
  30a921:	8b 45 08             	mov    0x8(%ebp),%eax
  30a924:	eb 05                	jmp    30a92b <_add+0x9c>
  30a926:	a1 1c 40 31 00       	mov    0x31401c,%eax
  30a92b:	a3 1c 40 31 00       	mov    %eax,0x31401c
  30a930:	c9                   	leave  
  30a931:	c3                   	ret    

0030a932 <_sub>:
  30a932:	55                   	push   %ebp
  30a933:	89 e5                	mov    %esp,%ebp
  30a935:	83 ec 18             	sub    $0x18,%esp
  30a938:	a1 20 40 31 00       	mov    0x314020,%eax
  30a93d:	85 c0                	test   %eax,%eax
  30a93f:	74 61                	je     30a9a2 <_sub+0x70>
  30a941:	a1 20 40 31 00       	mov    0x314020,%eax
  30a946:	8b 40 14             	mov    0x14(%eax),%eax
  30a949:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30a94c:	a1 20 40 31 00       	mov    0x314020,%eax
  30a951:	8b 40 18             	mov    0x18(%eax),%eax
  30a954:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30a957:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a95a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  30a95d:	89 50 18             	mov    %edx,0x18(%eax)
  30a960:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30a963:	8b 55 f4             	mov    -0xc(%ebp),%edx
  30a966:	89 50 14             	mov    %edx,0x14(%eax)
  30a969:	a1 20 40 31 00       	mov    0x314020,%eax
  30a96e:	83 ec 08             	sub    $0x8,%esp
  30a971:	6a 00                	push   $0x0
  30a973:	50                   	push   %eax
  30a974:	e8 76 d4 ff ff       	call   307def <kfree_s>
  30a979:	83 c4 10             	add    $0x10,%esp
  30a97c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30a97f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  30a982:	74 0a                	je     30a98e <_sub+0x5c>
  30a984:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a987:	a3 20 40 31 00       	mov    %eax,0x314020
  30a98c:	eb 14                	jmp    30a9a2 <_sub+0x70>
  30a98e:	c7 05 20 40 31 00 00 	movl   $0x0,0x314020
  30a995:	00 00 00 
  30a998:	a1 20 40 31 00       	mov    0x314020,%eax
  30a99d:	a3 1c 40 31 00       	mov    %eax,0x31401c
  30a9a2:	c9                   	leave  
  30a9a3:	c3                   	ret    

0030a9a4 <at_isbusy>:
  30a9a4:	55                   	push   %ebp
  30a9a5:	89 e5                	mov    %esp,%ebp
  30a9a7:	83 ec 18             	sub    $0x18,%esp
  30a9aa:	c7 45 f4 50 c3 00 00 	movl   $0xc350,-0xc(%ebp)
  30a9b1:	eb 2b                	jmp    30a9de <at_isbusy+0x3a>
  30a9b3:	b8 f7 01 00 00       	mov    $0x1f7,%eax
  30a9b8:	89 c2                	mov    %eax,%edx
  30a9ba:	ec                   	in     (%dx),%al
  30a9bb:	eb 00                	jmp    30a9bd <at_isbusy+0x19>
  30a9bd:	eb 00                	jmp    30a9bf <at_isbusy+0x1b>
  30a9bf:	88 45 f3             	mov    %al,-0xd(%ebp)
  30a9c2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  30a9c6:	88 45 f2             	mov    %al,-0xe(%ebp)
  30a9c9:	80 65 f2 d0          	andb   $0xd0,-0xe(%ebp)
  30a9cd:	80 7d f2 50          	cmpb   $0x50,-0xe(%ebp)
  30a9d1:	75 07                	jne    30a9da <at_isbusy+0x36>
  30a9d3:	b8 00 00 00 00       	mov    $0x0,%eax
  30a9d8:	eb 1f                	jmp    30a9f9 <at_isbusy+0x55>
  30a9da:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  30a9de:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  30a9e2:	75 cf                	jne    30a9b3 <at_isbusy+0xf>
  30a9e4:	83 ec 0c             	sub    $0xc,%esp
  30a9e7:	68 a8 e0 30 00       	push   $0x30e0a8
  30a9ec:	e8 b7 ac ff ff       	call   3056a8 <printk>
  30a9f1:	83 c4 10             	add    $0x10,%esp
  30a9f4:	b8 01 00 00 00       	mov    $0x1,%eax
  30a9f9:	c9                   	leave  
  30a9fa:	c3                   	ret    

0030a9fb <at_cmd>:
  30a9fb:	55                   	push   %ebp
  30a9fc:	89 e5                	mov    %esp,%ebp
  30a9fe:	53                   	push   %ebx
  30a9ff:	83 ec 2c             	sub    $0x2c,%esp
  30aa02:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30aa05:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30aa08:	8b 55 10             	mov    0x10(%ebp),%edx
  30aa0b:	8b 45 1c             	mov    0x1c(%ebp),%eax
  30aa0e:	88 5d e4             	mov    %bl,-0x1c(%ebp)
  30aa11:	88 4d e0             	mov    %cl,-0x20(%ebp)
  30aa14:	88 55 dc             	mov    %dl,-0x24(%ebp)
  30aa17:	8b 55 14             	mov    0x14(%ebp),%edx
  30aa1a:	89 55 d0             	mov    %edx,-0x30(%ebp)
  30aa1d:	8b 55 18             	mov    0x18(%ebp),%edx
  30aa20:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  30aa23:	88 45 d8             	mov    %al,-0x28(%ebp)
  30aa26:	c6 45 f7 e0          	movb   $0xe0,-0x9(%ebp)
  30aa2a:	80 7d d8 00          	cmpb   $0x0,-0x28(%ebp)
  30aa2e:	74 04                	je     30aa34 <at_cmd+0x39>
  30aa30:	80 4d f7 10          	orb    $0x10,-0x9(%ebp)
  30aa34:	8b 45 d0             	mov    -0x30(%ebp),%eax
  30aa37:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  30aa3a:	0f ac d0 18          	shrd   $0x18,%edx,%eax
  30aa3e:	c1 ea 18             	shr    $0x18,%edx
  30aa41:	83 e0 0f             	and    $0xf,%eax
  30aa44:	08 45 f7             	or     %al,-0x9(%ebp)
  30aa47:	8b 45 d0             	mov    -0x30(%ebp),%eax
  30aa4a:	88 45 f6             	mov    %al,-0xa(%ebp)
  30aa4d:	8b 45 d0             	mov    -0x30(%ebp),%eax
  30aa50:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  30aa53:	0f ac d0 08          	shrd   $0x8,%edx,%eax
  30aa57:	c1 ea 08             	shr    $0x8,%edx
  30aa5a:	88 45 f5             	mov    %al,-0xb(%ebp)
  30aa5d:	8b 45 d0             	mov    -0x30(%ebp),%eax
  30aa60:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  30aa63:	0f ac d0 10          	shrd   $0x10,%edx,%eax
  30aa67:	c1 ea 10             	shr    $0x10,%edx
  30aa6a:	88 45 f4             	mov    %al,-0xc(%ebp)
  30aa6d:	b8 00 00 00 00       	mov    $0x0,%eax
  30aa72:	ba f6 03 00 00       	mov    $0x3f6,%edx
  30aa77:	ee                   	out    %al,(%dx)
  30aa78:	eb 00                	jmp    30aa7a <at_cmd+0x7f>
  30aa7a:	eb 00                	jmp    30aa7c <at_cmd+0x81>
  30aa7c:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  30aa80:	ba f1 01 00 00       	mov    $0x1f1,%edx
  30aa85:	ee                   	out    %al,(%dx)
  30aa86:	eb 00                	jmp    30aa88 <at_cmd+0x8d>
  30aa88:	eb 00                	jmp    30aa8a <at_cmd+0x8f>
  30aa8a:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  30aa8e:	ba f2 01 00 00       	mov    $0x1f2,%edx
  30aa93:	ee                   	out    %al,(%dx)
  30aa94:	eb 00                	jmp    30aa96 <at_cmd+0x9b>
  30aa96:	eb 00                	jmp    30aa98 <at_cmd+0x9d>
  30aa98:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  30aa9c:	ba f3 01 00 00       	mov    $0x1f3,%edx
  30aaa1:	ee                   	out    %al,(%dx)
  30aaa2:	eb 00                	jmp    30aaa4 <at_cmd+0xa9>
  30aaa4:	eb 00                	jmp    30aaa6 <at_cmd+0xab>
  30aaa6:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  30aaaa:	ba f4 01 00 00       	mov    $0x1f4,%edx
  30aaaf:	ee                   	out    %al,(%dx)
  30aab0:	eb 00                	jmp    30aab2 <at_cmd+0xb7>
  30aab2:	eb 00                	jmp    30aab4 <at_cmd+0xb9>
  30aab4:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
  30aab8:	ba f5 01 00 00       	mov    $0x1f5,%edx
  30aabd:	ee                   	out    %al,(%dx)
  30aabe:	eb 00                	jmp    30aac0 <at_cmd+0xc5>
  30aac0:	eb 00                	jmp    30aac2 <at_cmd+0xc7>
  30aac2:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30aac6:	ba f6 01 00 00       	mov    $0x1f6,%edx
  30aacb:	ee                   	out    %al,(%dx)
  30aacc:	eb 00                	jmp    30aace <at_cmd+0xd3>
  30aace:	eb 00                	jmp    30aad0 <at_cmd+0xd5>
  30aad0:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  30aad4:	ba f7 01 00 00       	mov    $0x1f7,%edx
  30aad9:	ee                   	out    %al,(%dx)
  30aada:	eb 00                	jmp    30aadc <at_cmd+0xe1>
  30aadc:	eb 00                	jmp    30aade <at_cmd+0xe3>
  30aade:	83 c4 2c             	add    $0x2c,%esp
  30aae1:	5b                   	pop    %ebx
  30aae2:	5d                   	pop    %ebp
  30aae3:	c3                   	ret    

0030aae4 <_doio>:
  30aae4:	55                   	push   %ebp
  30aae5:	89 e5                	mov    %esp,%ebp
  30aae7:	56                   	push   %esi
  30aae8:	53                   	push   %ebx
  30aae9:	83 ec 20             	sub    $0x20,%esp
  30aaec:	a1 20 40 31 00       	mov    0x314020,%eax
  30aaf1:	8b 40 04             	mov    0x4(%eax),%eax
  30aaf4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30aaf7:	a1 20 40 31 00       	mov    0x314020,%eax
  30aafc:	8b 40 0c             	mov    0xc(%eax),%eax
  30aaff:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30ab02:	a1 20 40 31 00       	mov    0x314020,%eax
  30ab07:	8b 40 08             	mov    0x8(%eax),%eax
  30ab0a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30ab0d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  30ab10:	ba 00 00 00 00       	mov    $0x0,%edx
  30ab15:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  30ab18:	0f b6 d9             	movzbl %cl,%ebx
  30ab1b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  30ab1e:	0f b6 c9             	movzbl %cl,%ecx
  30ab21:	6a 00                	push   $0x0
  30ab23:	52                   	push   %edx
  30ab24:	50                   	push   %eax
  30ab25:	53                   	push   %ebx
  30ab26:	6a 00                	push   $0x0
  30ab28:	51                   	push   %ecx
  30ab29:	e8 cd fe ff ff       	call   30a9fb <at_cmd>
  30ab2e:	83 c4 18             	add    $0x18,%esp
  30ab31:	e8 6e fe ff ff       	call   30a9a4 <at_isbusy>
  30ab36:	84 c0                	test   %al,%al
  30ab38:	74 1a                	je     30ab54 <_doio+0x70>
  30ab3a:	a1 20 40 31 00       	mov    0x314020,%eax
  30ab3f:	8b 00                	mov    (%eax),%eax
  30ab41:	83 ec 08             	sub    $0x8,%esp
  30ab44:	6a f0                	push   $0xfffffff0
  30ab46:	50                   	push   %eax
  30ab47:	e8 10 fd ff ff       	call   30a85c <ret>
  30ab4c:	83 c4 10             	add    $0x10,%esp
  30ab4f:	e8 de fd ff ff       	call   30a932 <_sub>
  30ab54:	83 7d f0 30          	cmpl   $0x30,-0x10(%ebp)
  30ab58:	75 6c                	jne    30abc6 <_doio+0xe2>
  30ab5a:	a1 20 40 31 00       	mov    0x314020,%eax
  30ab5f:	8b 40 10             	mov    0x10(%eax),%eax
  30ab62:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30ab65:	c7 45 f4 50 c3 00 00 	movl   $0xc350,-0xc(%ebp)
  30ab6c:	eb 04                	jmp    30ab72 <_doio+0x8e>
  30ab6e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  30ab72:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  30ab76:	74 1d                	je     30ab95 <_doio+0xb1>
  30ab78:	b8 f7 01 00 00       	mov    $0x1f7,%eax
  30ab7d:	89 c2                	mov    %eax,%edx
  30ab7f:	ec                   	in     (%dx),%al
  30ab80:	eb 00                	jmp    30ab82 <_doio+0x9e>
  30ab82:	eb 00                	jmp    30ab84 <_doio+0xa0>
  30ab84:	88 45 e3             	mov    %al,-0x1d(%ebp)
  30ab87:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  30ab8b:	0f b6 c0             	movzbl %al,%eax
  30ab8e:	83 e0 08             	and    $0x8,%eax
  30ab91:	85 c0                	test   %eax,%eax
  30ab93:	74 d9                	je     30ab6e <_doio+0x8a>
  30ab95:	b8 f0 01 00 00       	mov    $0x1f0,%eax
  30ab9a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
  30ab9d:	b9 00 01 00 00       	mov    $0x100,%ecx
  30aba2:	89 c2                	mov    %eax,%edx
  30aba4:	89 de                	mov    %ebx,%esi
  30aba6:	fc                   	cld    
  30aba7:	f3 66 6f             	rep outsw %ds:(%esi),(%dx)
  30abaa:	a1 20 40 31 00       	mov    0x314020,%eax
  30abaf:	8b 50 08             	mov    0x8(%eax),%edx
  30abb2:	83 c2 01             	add    $0x1,%edx
  30abb5:	89 50 08             	mov    %edx,0x8(%eax)
  30abb8:	a1 20 40 31 00       	mov    0x314020,%eax
  30abbd:	8b 50 0c             	mov    0xc(%eax),%edx
  30abc0:	83 ea 01             	sub    $0x1,%edx
  30abc3:	89 50 0c             	mov    %edx,0xc(%eax)
  30abc6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  30abc9:	5b                   	pop    %ebx
  30abca:	5e                   	pop    %esi
  30abcb:	5d                   	pop    %ebp
  30abcc:	c3                   	ret    

0030abcd <_rw>:
  30abcd:	55                   	push   %ebp
  30abce:	89 e5                	mov    %esp,%ebp
  30abd0:	83 ec 18             	sub    $0x18,%esp
  30abd3:	83 ec 0c             	sub    $0xc,%esp
  30abd6:	6a 1c                	push   $0x1c
  30abd8:	e8 a6 d0 ff ff       	call   307c83 <kalloc>
  30abdd:	83 c4 10             	add    $0x10,%esp
  30abe0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30abe3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  30abe7:	74 52                	je     30ac3b <_rw+0x6e>
  30abe9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30abec:	8b 55 08             	mov    0x8(%ebp),%edx
  30abef:	89 10                	mov    %edx,(%eax)
  30abf1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30abf4:	8b 55 0c             	mov    0xc(%ebp),%edx
  30abf7:	89 50 04             	mov    %edx,0x4(%eax)
  30abfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30abfd:	8b 55 14             	mov    0x14(%ebp),%edx
  30ac00:	89 50 08             	mov    %edx,0x8(%eax)
  30ac03:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30ac06:	8b 55 18             	mov    0x18(%ebp),%edx
  30ac09:	89 50 0c             	mov    %edx,0xc(%eax)
  30ac0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30ac0f:	8b 55 10             	mov    0x10(%ebp),%edx
  30ac12:	89 50 10             	mov    %edx,0x10(%eax)
  30ac15:	83 ec 0c             	sub    $0xc,%esp
  30ac18:	ff 75 f4             	pushl  -0xc(%ebp)
  30ac1b:	e8 6f fc ff ff       	call   30a88f <_add>
  30ac20:	83 c4 10             	add    $0x10,%esp
  30ac23:	a1 20 40 31 00       	mov    0x314020,%eax
  30ac28:	85 c0                	test   %eax,%eax
  30ac2a:	75 1f                	jne    30ac4b <_rw+0x7e>
  30ac2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30ac2f:	a3 20 40 31 00       	mov    %eax,0x314020
  30ac34:	e8 ab fe ff ff       	call   30aae4 <_doio>
  30ac39:	eb 10                	jmp    30ac4b <_rw+0x7e>
  30ac3b:	83 ec 08             	sub    $0x8,%esp
  30ac3e:	6a f4                	push   $0xfffffff4
  30ac40:	ff 75 08             	pushl  0x8(%ebp)
  30ac43:	e8 14 fc ff ff       	call   30a85c <ret>
  30ac48:	83 c4 10             	add    $0x10,%esp
  30ac4b:	c9                   	leave  
  30ac4c:	c3                   	ret    

0030ac4d <at_read>:
  30ac4d:	55                   	push   %ebp
  30ac4e:	89 e5                	mov    %esp,%ebp
  30ac50:	83 ec 08             	sub    $0x8,%esp
  30ac53:	83 ec 0c             	sub    $0xc,%esp
  30ac56:	ff 75 14             	pushl  0x14(%ebp)
  30ac59:	ff 75 10             	pushl  0x10(%ebp)
  30ac5c:	ff 75 0c             	pushl  0xc(%ebp)
  30ac5f:	6a 20                	push   $0x20
  30ac61:	ff 75 08             	pushl  0x8(%ebp)
  30ac64:	e8 64 ff ff ff       	call   30abcd <_rw>
  30ac69:	83 c4 20             	add    $0x20,%esp
  30ac6c:	c9                   	leave  
  30ac6d:	c3                   	ret    

0030ac6e <at_write>:
  30ac6e:	55                   	push   %ebp
  30ac6f:	89 e5                	mov    %esp,%ebp
  30ac71:	83 ec 08             	sub    $0x8,%esp
  30ac74:	83 ec 0c             	sub    $0xc,%esp
  30ac77:	ff 75 14             	pushl  0x14(%ebp)
  30ac7a:	ff 75 10             	pushl  0x10(%ebp)
  30ac7d:	ff 75 0c             	pushl  0xc(%ebp)
  30ac80:	6a 30                	push   $0x30
  30ac82:	ff 75 08             	pushl  0x8(%ebp)
  30ac85:	e8 43 ff ff ff       	call   30abcd <_rw>
  30ac8a:	83 c4 20             	add    $0x20,%esp
  30ac8d:	c9                   	leave  
  30ac8e:	c3                   	ret    

0030ac8f <at_handler>:
  30ac8f:	55                   	push   %ebp
  30ac90:	89 e5                	mov    %esp,%ebp
  30ac92:	83 ec 18             	sub    $0x18,%esp
  30ac95:	b8 f7 01 00 00       	mov    $0x1f7,%eax
  30ac9a:	89 c2                	mov    %eax,%edx
  30ac9c:	ec                   	in     (%dx),%al
  30ac9d:	88 45 f7             	mov    %al,-0x9(%ebp)
  30aca0:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30aca4:	0f b6 c0             	movzbl %al,%eax
  30aca7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30acaa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30acad:	83 ec 0c             	sub    $0xc,%esp
  30acb0:	6a 00                	push   $0x0
  30acb2:	6a 00                	push   $0x0
  30acb4:	50                   	push   %eax
  30acb5:	6a 06                	push   $0x6
  30acb7:	ff 75 08             	pushl  0x8(%ebp)
  30acba:	e8 ce bc ff ff       	call   30698d <doint>
  30acbf:	83 c4 20             	add    $0x20,%esp
  30acc2:	b8 00 00 00 00       	mov    $0x0,%eax
  30acc7:	c9                   	leave  
  30acc8:	c3                   	ret    

0030acc9 <_io>:
  30acc9:	55                   	push   %ebp
  30acca:	89 e5                	mov    %esp,%ebp
  30accc:	57                   	push   %edi
  30accd:	56                   	push   %esi
  30acce:	53                   	push   %ebx
  30accf:	83 ec 1c             	sub    $0x1c,%esp
  30acd2:	a1 20 40 31 00       	mov    0x314020,%eax
  30acd7:	85 c0                	test   %eax,%eax
  30acd9:	0f 84 31 01 00 00    	je     30ae10 <_io+0x147>
  30acdf:	a1 20 40 31 00       	mov    0x314020,%eax
  30ace4:	8b 40 10             	mov    0x10(%eax),%eax
  30ace7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30acea:	e8 b5 fc ff ff       	call   30a9a4 <at_isbusy>
  30acef:	84 c0                	test   %al,%al
  30acf1:	74 15                	je     30ad08 <_io+0x3f>
  30acf3:	a1 20 40 31 00       	mov    0x314020,%eax
  30acf8:	8b 00                	mov    (%eax),%eax
  30acfa:	83 ec 08             	sub    $0x8,%esp
  30acfd:	6a f0                	push   $0xfffffff0
  30acff:	50                   	push   %eax
  30ad00:	e8 57 fb ff ff       	call   30a85c <ret>
  30ad05:	83 c4 10             	add    $0x10,%esp
  30ad08:	8b 45 0c             	mov    0xc(%ebp),%eax
  30ad0b:	83 e0 40             	and    $0x40,%eax
  30ad0e:	85 c0                	test   %eax,%eax
  30ad10:	0f 84 c6 00 00 00    	je     30addc <_io+0x113>
  30ad16:	a1 20 40 31 00       	mov    0x314020,%eax
  30ad1b:	8b 40 04             	mov    0x4(%eax),%eax
  30ad1e:	83 f8 20             	cmp    $0x20,%eax
  30ad21:	75 17                	jne    30ad3a <_io+0x71>
  30ad23:	b8 f0 01 00 00       	mov    $0x1f0,%eax
  30ad28:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  30ad2b:	b9 00 01 00 00       	mov    $0x100,%ecx
  30ad30:	89 c2                	mov    %eax,%edx
  30ad32:	89 df                	mov    %ebx,%edi
  30ad34:	fc                   	cld    
  30ad35:	f3 66 6d             	rep insw (%dx),%es:(%edi)
  30ad38:	eb 7d                	jmp    30adb7 <_io+0xee>
  30ad3a:	a1 20 40 31 00       	mov    0x314020,%eax
  30ad3f:	8b 40 04             	mov    0x4(%eax),%eax
  30ad42:	83 f8 30             	cmp    $0x30,%eax
  30ad45:	75 47                	jne    30ad8e <_io+0xc5>
  30ad47:	c7 45 e4 50 c3 00 00 	movl   $0xc350,-0x1c(%ebp)
  30ad4e:	eb 04                	jmp    30ad54 <_io+0x8b>
  30ad50:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  30ad54:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  30ad58:	74 1d                	je     30ad77 <_io+0xae>
  30ad5a:	b8 f7 01 00 00       	mov    $0x1f7,%eax
  30ad5f:	89 c2                	mov    %eax,%edx
  30ad61:	ec                   	in     (%dx),%al
  30ad62:	eb 00                	jmp    30ad64 <_io+0x9b>
  30ad64:	eb 00                	jmp    30ad66 <_io+0x9d>
  30ad66:	88 45 df             	mov    %al,-0x21(%ebp)
  30ad69:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  30ad6d:	0f b6 c0             	movzbl %al,%eax
  30ad70:	83 e0 08             	and    $0x8,%eax
  30ad73:	85 c0                	test   %eax,%eax
  30ad75:	74 d9                	je     30ad50 <_io+0x87>
  30ad77:	b8 f0 01 00 00       	mov    $0x1f0,%eax
  30ad7c:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  30ad7f:	b9 00 01 00 00       	mov    $0x100,%ecx
  30ad84:	89 c2                	mov    %eax,%edx
  30ad86:	89 de                	mov    %ebx,%esi
  30ad88:	fc                   	cld    
  30ad89:	f3 66 6f             	rep outsw %ds:(%esi),(%dx)
  30ad8c:	eb 29                	jmp    30adb7 <_io+0xee>
  30ad8e:	a1 20 40 31 00       	mov    0x314020,%eax
  30ad93:	8b 40 04             	mov    0x4(%eax),%eax
  30ad96:	83 ec 08             	sub    $0x8,%esp
  30ad99:	50                   	push   %eax
  30ad9a:	68 ce e0 30 00       	push   $0x30e0ce
  30ad9f:	e8 04 a9 ff ff       	call   3056a8 <printk>
  30ada4:	83 c4 10             	add    $0x10,%esp
  30ada7:	83 ec 0c             	sub    $0xc,%esp
  30adaa:	68 e8 e0 30 00       	push   $0x30e0e8
  30adaf:	e8 d8 a8 ff ff       	call   30568c <panic>
  30adb4:	83 c4 10             	add    $0x10,%esp
  30adb7:	a1 20 40 31 00       	mov    0x314020,%eax
  30adbc:	8b 15 20 40 31 00    	mov    0x314020,%edx
  30adc2:	8b 52 10             	mov    0x10(%edx),%edx
  30adc5:	81 c2 00 02 00 00    	add    $0x200,%edx
  30adcb:	89 50 10             	mov    %edx,0x10(%eax)
  30adce:	a1 20 40 31 00       	mov    0x314020,%eax
  30add3:	8b 50 0c             	mov    0xc(%eax),%edx
  30add6:	83 ea 01             	sub    $0x1,%edx
  30add9:	89 50 0c             	mov    %edx,0xc(%eax)
  30addc:	a1 20 40 31 00       	mov    0x314020,%eax
  30ade1:	8b 40 0c             	mov    0xc(%eax),%eax
  30ade4:	85 c0                	test   %eax,%eax
  30ade6:	75 28                	jne    30ae10 <_io+0x147>
  30ade8:	a1 20 40 31 00       	mov    0x314020,%eax
  30aded:	8b 00                	mov    (%eax),%eax
  30adef:	83 ec 08             	sub    $0x8,%esp
  30adf2:	6a 00                	push   $0x0
  30adf4:	50                   	push   %eax
  30adf5:	e8 62 fa ff ff       	call   30a85c <ret>
  30adfa:	83 c4 10             	add    $0x10,%esp
  30adfd:	e8 30 fb ff ff       	call   30a932 <_sub>
  30ae02:	a1 20 40 31 00       	mov    0x314020,%eax
  30ae07:	85 c0                	test   %eax,%eax
  30ae09:	74 05                	je     30ae10 <_io+0x147>
  30ae0b:	e8 d4 fc ff ff       	call   30aae4 <_doio>
  30ae10:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30ae13:	5b                   	pop    %ebx
  30ae14:	5e                   	pop    %esi
  30ae15:	5f                   	pop    %edi
  30ae16:	5d                   	pop    %ebp
  30ae17:	c3                   	ret    

0030ae18 <at_init>:
  30ae18:	55                   	push   %ebp
  30ae19:	89 e5                	mov    %esp,%ebp
  30ae1b:	57                   	push   %edi
  30ae1c:	56                   	push   %esi
  30ae1d:	53                   	push   %ebx
  30ae1e:	83 ec 1c             	sub    $0x1c,%esp
  30ae21:	b8 03 00 00 00       	mov    $0x3,%eax
  30ae26:	bb 01 00 00 00       	mov    $0x1,%ebx
  30ae2b:	b9 6e ac 30 00       	mov    $0x30ac6e,%ecx
  30ae30:	ba 00 00 00 00       	mov    $0x0,%edx
  30ae35:	be 00 00 00 00       	mov    $0x0,%esi
  30ae3a:	bf 00 00 00 00       	mov    $0x0,%edi
  30ae3f:	cd 80                	int    $0x80
  30ae41:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30ae44:	b8 03 00 00 00       	mov    $0x3,%eax
  30ae49:	bb 00 00 00 00       	mov    $0x0,%ebx
  30ae4e:	b9 4d ac 30 00       	mov    $0x30ac4d,%ecx
  30ae53:	ba 00 00 00 00       	mov    $0x0,%edx
  30ae58:	be 00 00 00 00       	mov    $0x0,%esi
  30ae5d:	bf 00 00 00 00       	mov    $0x0,%edi
  30ae62:	cd 80                	int    $0x80
  30ae64:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30ae67:	b8 03 00 00 00       	mov    $0x3,%eax
  30ae6c:	bb 06 00 00 00       	mov    $0x6,%ebx
  30ae71:	b9 c9 ac 30 00       	mov    $0x30acc9,%ecx
  30ae76:	ba 00 00 00 00       	mov    $0x0,%edx
  30ae7b:	be 00 00 00 00       	mov    $0x0,%esi
  30ae80:	bf 00 00 00 00       	mov    $0x0,%edi
  30ae85:	cd 80                	int    $0x80
  30ae87:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30ae8a:	83 ec 08             	sub    $0x8,%esp
  30ae8d:	68 8f ac 30 00       	push   $0x30ac8f
  30ae92:	6a 0e                	push   $0xe
  30ae94:	e8 4f ae ff ff       	call   305ce8 <put_irq_handler>
  30ae99:	83 c4 10             	add    $0x10,%esp
  30ae9c:	b8 0c 00 00 00       	mov    $0xc,%eax
  30aea1:	ba f6 03 00 00       	mov    $0x3f6,%edx
  30aea6:	ee                   	out    %al,(%dx)
  30aea7:	eb 00                	jmp    30aea9 <at_init+0x91>
  30aea9:	eb 00                	jmp    30aeab <at_init+0x93>
  30aeab:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30aeae:	5b                   	pop    %ebx
  30aeaf:	5e                   	pop    %esi
  30aeb0:	5f                   	pop    %edi
  30aeb1:	5d                   	pop    %ebp
  30aeb2:	c3                   	ret    

0030aeb3 <at_main>:
  30aeb3:	55                   	push   %ebp
  30aeb4:	89 e5                	mov    %esp,%ebp
  30aeb6:	57                   	push   %edi
  30aeb7:	56                   	push   %esi
  30aeb8:	53                   	push   %ebx
  30aeb9:	83 ec 1c             	sub    $0x1c,%esp
  30aebc:	e8 57 ff ff ff       	call   30ae18 <at_init>
  30aec1:	b8 00 00 00 00       	mov    $0x0,%eax
  30aec6:	bb 00 00 00 00       	mov    $0x0,%ebx
  30aecb:	b9 00 00 00 00       	mov    $0x0,%ecx
  30aed0:	ba 00 00 00 00       	mov    $0x0,%edx
  30aed5:	be 00 00 00 00       	mov    $0x0,%esi
  30aeda:	bf 00 00 00 00       	mov    $0x0,%edi
  30aedf:	cd 80                	int    $0x80
  30aee1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30aee4:	b8 00 00 00 00       	mov    $0x0,%eax
  30aee9:	83 c4 1c             	add    $0x1c,%esp
  30aeec:	5b                   	pop    %ebx
  30aeed:	5e                   	pop    %esi
  30aeee:	5f                   	pop    %edi
  30aeef:	5d                   	pop    %ebp
  30aef0:	c3                   	ret    
  30aef1:	66 90                	xchg   %ax,%ax
  30aef3:	90                   	nop

0030aef4 <ret>:
  30aef4:	55                   	push   %ebp
  30aef5:	89 e5                	mov    %esp,%ebp
  30aef7:	57                   	push   %edi
  30aef8:	56                   	push   %esi
  30aef9:	53                   	push   %ebx
  30aefa:	83 ec 10             	sub    $0x10,%esp
  30aefd:	b8 02 00 00 00       	mov    $0x2,%eax
  30af02:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30af05:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30af08:	ba 00 00 00 00       	mov    $0x0,%edx
  30af0d:	be 00 00 00 00       	mov    $0x0,%esi
  30af12:	bf 00 00 00 00       	mov    $0x0,%edi
  30af17:	cd 80                	int    $0x80
  30af19:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30af1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30af1f:	83 c4 10             	add    $0x10,%esp
  30af22:	5b                   	pop    %ebx
  30af23:	5e                   	pop    %esi
  30af24:	5f                   	pop    %edi
  30af25:	5d                   	pop    %ebp
  30af26:	c3                   	ret    

0030af27 <memcpy>:
  30af27:	55                   	push   %ebp
  30af28:	89 e5                	mov    %esp,%ebp
  30af2a:	57                   	push   %edi
  30af2b:	56                   	push   %esi
  30af2c:	53                   	push   %ebx
  30af2d:	8b 45 10             	mov    0x10(%ebp),%eax
  30af30:	8b 55 0c             	mov    0xc(%ebp),%edx
  30af33:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30af36:	89 c1                	mov    %eax,%ecx
  30af38:	89 d6                	mov    %edx,%esi
  30af3a:	89 df                	mov    %ebx,%edi
  30af3c:	fc                   	cld    
  30af3d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  30af3f:	8b 45 08             	mov    0x8(%ebp),%eax
  30af42:	5b                   	pop    %ebx
  30af43:	5e                   	pop    %esi
  30af44:	5f                   	pop    %edi
  30af45:	5d                   	pop    %ebp
  30af46:	c3                   	ret    

0030af47 <ramdisk_read>:
  30af47:	55                   	push   %ebp
  30af48:	89 e5                	mov    %esp,%ebp
  30af4a:	83 ec 10             	sub    $0x10,%esp
  30af4d:	8b 45 10             	mov    0x10(%ebp),%eax
  30af50:	c1 e0 09             	shl    $0x9,%eax
  30af53:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30af56:	8b 45 14             	mov    0x14(%ebp),%eax
  30af59:	c1 e0 09             	shl    $0x9,%eax
  30af5c:	89 c2                	mov    %eax,%edx
  30af5e:	a1 2c 40 31 00       	mov    0x31402c,%eax
  30af63:	2b 45 fc             	sub    -0x4(%ebp),%eax
  30af66:	39 c2                	cmp    %eax,%edx
  30af68:	0f 46 c2             	cmovbe %edx,%eax
  30af6b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30af6e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  30af71:	8b 0d 28 40 31 00    	mov    0x314028,%ecx
  30af77:	8b 55 fc             	mov    -0x4(%ebp),%edx
  30af7a:	01 ca                	add    %ecx,%edx
  30af7c:	50                   	push   %eax
  30af7d:	52                   	push   %edx
  30af7e:	ff 75 0c             	pushl  0xc(%ebp)
  30af81:	e8 a1 ff ff ff       	call   30af27 <memcpy>
  30af86:	83 c4 0c             	add    $0xc,%esp
  30af89:	6a 00                	push   $0x0
  30af8b:	ff 75 08             	pushl  0x8(%ebp)
  30af8e:	e8 61 ff ff ff       	call   30aef4 <ret>
  30af93:	83 c4 08             	add    $0x8,%esp
  30af96:	c9                   	leave  
  30af97:	c3                   	ret    

0030af98 <ramdisk_write>:
  30af98:	55                   	push   %ebp
  30af99:	89 e5                	mov    %esp,%ebp
  30af9b:	83 ec 10             	sub    $0x10,%esp
  30af9e:	8b 45 10             	mov    0x10(%ebp),%eax
  30afa1:	c1 e0 09             	shl    $0x9,%eax
  30afa4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30afa7:	8b 45 14             	mov    0x14(%ebp),%eax
  30afaa:	c1 e0 09             	shl    $0x9,%eax
  30afad:	89 c2                	mov    %eax,%edx
  30afaf:	a1 2c 40 31 00       	mov    0x31402c,%eax
  30afb4:	2b 45 fc             	sub    -0x4(%ebp),%eax
  30afb7:	39 c2                	cmp    %eax,%edx
  30afb9:	0f 46 c2             	cmovbe %edx,%eax
  30afbc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30afbf:	8b 45 f8             	mov    -0x8(%ebp),%eax
  30afc2:	8b 0d 28 40 31 00    	mov    0x314028,%ecx
  30afc8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  30afcb:	01 ca                	add    %ecx,%edx
  30afcd:	50                   	push   %eax
  30afce:	ff 75 0c             	pushl  0xc(%ebp)
  30afd1:	52                   	push   %edx
  30afd2:	e8 50 ff ff ff       	call   30af27 <memcpy>
  30afd7:	83 c4 0c             	add    $0xc,%esp
  30afda:	6a 00                	push   $0x0
  30afdc:	ff 75 08             	pushl  0x8(%ebp)
  30afdf:	e8 10 ff ff ff       	call   30aef4 <ret>
  30afe4:	83 c4 08             	add    $0x8,%esp
  30afe7:	c9                   	leave  
  30afe8:	c3                   	ret    

0030afe9 <ramdisk_init>:
  30afe9:	55                   	push   %ebp
  30afea:	89 e5                	mov    %esp,%ebp
  30afec:	57                   	push   %edi
  30afed:	56                   	push   %esi
  30afee:	53                   	push   %ebx
  30afef:	83 ec 10             	sub    $0x10,%esp
  30aff2:	c7 05 28 40 31 00 00 	movl   $0x315000,0x314028
  30aff9:	50 31 00 
  30affc:	c7 05 2c 40 31 00 00 	movl   $0x28000,0x31402c
  30b003:	80 02 00 
  30b006:	b8 03 00 00 00       	mov    $0x3,%eax
  30b00b:	bb 01 00 00 00       	mov    $0x1,%ebx
  30b010:	b9 98 af 30 00       	mov    $0x30af98,%ecx
  30b015:	ba 00 00 00 00       	mov    $0x0,%edx
  30b01a:	be 00 00 00 00       	mov    $0x0,%esi
  30b01f:	bf 00 00 00 00       	mov    $0x0,%edi
  30b024:	cd 80                	int    $0x80
  30b026:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30b029:	b8 03 00 00 00       	mov    $0x3,%eax
  30b02e:	bb 00 00 00 00       	mov    $0x0,%ebx
  30b033:	b9 47 af 30 00       	mov    $0x30af47,%ecx
  30b038:	ba 00 00 00 00       	mov    $0x0,%edx
  30b03d:	be 00 00 00 00       	mov    $0x0,%esi
  30b042:	bf 00 00 00 00       	mov    $0x0,%edi
  30b047:	cd 80                	int    $0x80
  30b049:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30b04c:	83 c4 10             	add    $0x10,%esp
  30b04f:	5b                   	pop    %ebx
  30b050:	5e                   	pop    %esi
  30b051:	5f                   	pop    %edi
  30b052:	5d                   	pop    %ebp
  30b053:	c3                   	ret    

0030b054 <ramdisk_main>:
  30b054:	55                   	push   %ebp
  30b055:	89 e5                	mov    %esp,%ebp
  30b057:	57                   	push   %edi
  30b058:	56                   	push   %esi
  30b059:	53                   	push   %ebx
  30b05a:	83 ec 10             	sub    $0x10,%esp
  30b05d:	e8 87 ff ff ff       	call   30afe9 <ramdisk_init>
  30b062:	b8 00 00 00 00       	mov    $0x0,%eax
  30b067:	bb 00 00 00 00       	mov    $0x0,%ebx
  30b06c:	b9 00 00 00 00       	mov    $0x0,%ecx
  30b071:	ba 00 00 00 00       	mov    $0x0,%edx
  30b076:	be 00 00 00 00       	mov    $0x0,%esi
  30b07b:	bf 00 00 00 00       	mov    $0x0,%edi
  30b080:	cd 80                	int    $0x80
  30b082:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30b085:	b8 00 00 00 00       	mov    $0x0,%eax
  30b08a:	83 c4 10             	add    $0x10,%esp
  30b08d:	5b                   	pop    %ebx
  30b08e:	5e                   	pop    %esi
  30b08f:	5f                   	pop    %edi
  30b090:	5d                   	pop    %ebp
  30b091:	c3                   	ret    
  30b092:	66 90                	xchg   %ax,%ax

0030b094 <ret>:
  30b094:	55                   	push   %ebp
  30b095:	89 e5                	mov    %esp,%ebp
  30b097:	57                   	push   %edi
  30b098:	56                   	push   %esi
  30b099:	53                   	push   %ebx
  30b09a:	83 ec 10             	sub    $0x10,%esp
  30b09d:	b8 02 00 00 00       	mov    $0x2,%eax
  30b0a2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30b0a5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30b0a8:	ba 00 00 00 00       	mov    $0x0,%edx
  30b0ad:	be 00 00 00 00       	mov    $0x0,%esi
  30b0b2:	bf 00 00 00 00       	mov    $0x0,%edi
  30b0b7:	cd 80                	int    $0x80
  30b0b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30b0bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30b0bf:	83 c4 10             	add    $0x10,%esp
  30b0c2:	5b                   	pop    %ebx
  30b0c3:	5e                   	pop    %esi
  30b0c4:	5f                   	pop    %edi
  30b0c5:	5d                   	pop    %ebp
  30b0c6:	c3                   	ret    

0030b0c7 <set_top>:
  30b0c7:	55                   	push   %ebp
  30b0c8:	89 e5                	mov    %esp,%ebp
  30b0ca:	a1 44 40 31 00       	mov    0x314044,%eax
  30b0cf:	39 45 08             	cmp    %eax,0x8(%ebp)
  30b0d2:	74 05                	je     30b0d9 <set_top+0x12>
  30b0d4:	e9 81 00 00 00       	jmp    30b15a <set_top+0x93>
  30b0d9:	b8 0c 00 00 00       	mov    $0xc,%eax
  30b0de:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30b0e3:	ee                   	out    %al,(%dx)
  30b0e4:	eb 00                	jmp    30b0e6 <set_top+0x1f>
  30b0e6:	eb 00                	jmp    30b0e8 <set_top+0x21>
  30b0e8:	8b 45 08             	mov    0x8(%ebp),%eax
  30b0eb:	c1 e0 02             	shl    $0x2,%eax
  30b0ee:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b0f5:	29 c2                	sub    %eax,%edx
  30b0f7:	89 d0                	mov    %edx,%eax
  30b0f9:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b0fe:	8b 50 0c             	mov    0xc(%eax),%edx
  30b101:	a1 34 40 31 00       	mov    0x314034,%eax
  30b106:	29 c2                	sub    %eax,%edx
  30b108:	89 d0                	mov    %edx,%eax
  30b10a:	c1 e8 09             	shr    $0x9,%eax
  30b10d:	0f b6 c0             	movzbl %al,%eax
  30b110:	ba d5 03 00 00       	mov    $0x3d5,%edx
  30b115:	ee                   	out    %al,(%dx)
  30b116:	eb 00                	jmp    30b118 <set_top+0x51>
  30b118:	eb 00                	jmp    30b11a <set_top+0x53>
  30b11a:	b8 0d 00 00 00       	mov    $0xd,%eax
  30b11f:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30b124:	ee                   	out    %al,(%dx)
  30b125:	eb 00                	jmp    30b127 <set_top+0x60>
  30b127:	eb 00                	jmp    30b129 <set_top+0x62>
  30b129:	8b 45 08             	mov    0x8(%ebp),%eax
  30b12c:	c1 e0 02             	shl    $0x2,%eax
  30b12f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b136:	29 c2                	sub    %eax,%edx
  30b138:	89 d0                	mov    %edx,%eax
  30b13a:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b13f:	8b 50 0c             	mov    0xc(%eax),%edx
  30b142:	a1 34 40 31 00       	mov    0x314034,%eax
  30b147:	29 c2                	sub    %eax,%edx
  30b149:	89 d0                	mov    %edx,%eax
  30b14b:	d1 e8                	shr    %eax
  30b14d:	0f b6 c0             	movzbl %al,%eax
  30b150:	ba d5 03 00 00       	mov    $0x3d5,%edx
  30b155:	ee                   	out    %al,(%dx)
  30b156:	eb 00                	jmp    30b158 <set_top+0x91>
  30b158:	eb 00                	jmp    30b15a <set_top+0x93>
  30b15a:	5d                   	pop    %ebp
  30b15b:	c3                   	ret    

0030b15c <set_cur>:
  30b15c:	55                   	push   %ebp
  30b15d:	89 e5                	mov    %esp,%ebp
  30b15f:	a1 44 40 31 00       	mov    0x314044,%eax
  30b164:	39 45 08             	cmp    %eax,0x8(%ebp)
  30b167:	74 05                	je     30b16e <set_cur+0x12>
  30b169:	e9 81 00 00 00       	jmp    30b1ef <set_cur+0x93>
  30b16e:	b8 0e 00 00 00       	mov    $0xe,%eax
  30b173:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30b178:	ee                   	out    %al,(%dx)
  30b179:	eb 00                	jmp    30b17b <set_cur+0x1f>
  30b17b:	eb 00                	jmp    30b17d <set_cur+0x21>
  30b17d:	8b 45 08             	mov    0x8(%ebp),%eax
  30b180:	c1 e0 02             	shl    $0x2,%eax
  30b183:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b18a:	29 c2                	sub    %eax,%edx
  30b18c:	89 d0                	mov    %edx,%eax
  30b18e:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b193:	8b 50 04             	mov    0x4(%eax),%edx
  30b196:	a1 34 40 31 00       	mov    0x314034,%eax
  30b19b:	29 c2                	sub    %eax,%edx
  30b19d:	89 d0                	mov    %edx,%eax
  30b19f:	c1 e8 09             	shr    $0x9,%eax
  30b1a2:	0f b6 c0             	movzbl %al,%eax
  30b1a5:	ba d5 03 00 00       	mov    $0x3d5,%edx
  30b1aa:	ee                   	out    %al,(%dx)
  30b1ab:	eb 00                	jmp    30b1ad <set_cur+0x51>
  30b1ad:	eb 00                	jmp    30b1af <set_cur+0x53>
  30b1af:	b8 0f 00 00 00       	mov    $0xf,%eax
  30b1b4:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30b1b9:	ee                   	out    %al,(%dx)
  30b1ba:	eb 00                	jmp    30b1bc <set_cur+0x60>
  30b1bc:	eb 00                	jmp    30b1be <set_cur+0x62>
  30b1be:	8b 45 08             	mov    0x8(%ebp),%eax
  30b1c1:	c1 e0 02             	shl    $0x2,%eax
  30b1c4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b1cb:	29 c2                	sub    %eax,%edx
  30b1cd:	89 d0                	mov    %edx,%eax
  30b1cf:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b1d4:	8b 50 04             	mov    0x4(%eax),%edx
  30b1d7:	a1 34 40 31 00       	mov    0x314034,%eax
  30b1dc:	29 c2                	sub    %eax,%edx
  30b1de:	89 d0                	mov    %edx,%eax
  30b1e0:	d1 e8                	shr    %eax
  30b1e2:	0f b6 c0             	movzbl %al,%eax
  30b1e5:	ba d5 03 00 00       	mov    $0x3d5,%edx
  30b1ea:	ee                   	out    %al,(%dx)
  30b1eb:	eb 00                	jmp    30b1ed <set_cur+0x91>
  30b1ed:	eb 00                	jmp    30b1ef <set_cur+0x93>
  30b1ef:	5d                   	pop    %ebp
  30b1f0:	c3                   	ret    

0030b1f1 <scrup>:
  30b1f1:	55                   	push   %ebp
  30b1f2:	89 e5                	mov    %esp,%ebp
  30b1f4:	8b 45 08             	mov    0x8(%ebp),%eax
  30b1f7:	c1 e0 02             	shl    $0x2,%eax
  30b1fa:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b201:	29 c2                	sub    %eax,%edx
  30b203:	89 d0                	mov    %edx,%eax
  30b205:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b20a:	8b 10                	mov    (%eax),%edx
  30b20c:	8b 45 08             	mov    0x8(%ebp),%eax
  30b20f:	c1 e0 02             	shl    $0x2,%eax
  30b212:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b219:	29 c1                	sub    %eax,%ecx
  30b21b:	89 c8                	mov    %ecx,%eax
  30b21d:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b222:	8b 40 04             	mov    0x4(%eax),%eax
  30b225:	39 c2                	cmp    %eax,%edx
  30b227:	76 02                	jbe    30b22b <scrup+0x3a>
  30b229:	eb 7b                	jmp    30b2a6 <scrup+0xb5>
  30b22b:	8b 45 08             	mov    0x8(%ebp),%eax
  30b22e:	c1 e0 02             	shl    $0x2,%eax
  30b231:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b238:	29 c2                	sub    %eax,%edx
  30b23a:	89 d0                	mov    %edx,%eax
  30b23c:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b241:	8b 50 0c             	mov    0xc(%eax),%edx
  30b244:	a1 40 40 31 00       	mov    0x314040,%eax
  30b249:	01 c2                	add    %eax,%edx
  30b24b:	8b 45 08             	mov    0x8(%ebp),%eax
  30b24e:	c1 e0 02             	shl    $0x2,%eax
  30b251:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b258:	29 c1                	sub    %eax,%ecx
  30b25a:	89 c8                	mov    %ecx,%eax
  30b25c:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b261:	89 50 0c             	mov    %edx,0xc(%eax)
  30b264:	8b 45 08             	mov    0x8(%ebp),%eax
  30b267:	c1 e0 02             	shl    $0x2,%eax
  30b26a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b271:	29 c2                	sub    %eax,%edx
  30b273:	89 d0                	mov    %edx,%eax
  30b275:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b27a:	8b 10                	mov    (%eax),%edx
  30b27c:	a1 40 40 31 00       	mov    0x314040,%eax
  30b281:	01 c2                	add    %eax,%edx
  30b283:	8b 45 08             	mov    0x8(%ebp),%eax
  30b286:	c1 e0 02             	shl    $0x2,%eax
  30b289:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b290:	29 c1                	sub    %eax,%ecx
  30b292:	89 c8                	mov    %ecx,%eax
  30b294:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b299:	89 10                	mov    %edx,(%eax)
  30b29b:	ff 75 08             	pushl  0x8(%ebp)
  30b29e:	e8 24 fe ff ff       	call   30b0c7 <set_top>
  30b2a3:	83 c4 04             	add    $0x4,%esp
  30b2a6:	c9                   	leave  
  30b2a7:	c3                   	ret    

0030b2a8 <scrtop>:
  30b2a8:	55                   	push   %ebp
  30b2a9:	89 e5                	mov    %esp,%ebp
  30b2ab:	57                   	push   %edi
  30b2ac:	56                   	push   %esi
  30b2ad:	53                   	push   %ebx
  30b2ae:	8b 45 08             	mov    0x8(%ebp),%eax
  30b2b1:	c1 e0 02             	shl    $0x2,%eax
  30b2b4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b2bb:	29 c2                	sub    %eax,%edx
  30b2bd:	89 d0                	mov    %edx,%eax
  30b2bf:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b2c4:	8b 10                	mov    (%eax),%edx
  30b2c6:	8b 45 08             	mov    0x8(%ebp),%eax
  30b2c9:	c1 e0 02             	shl    $0x2,%eax
  30b2cc:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b2d3:	29 c1                	sub    %eax,%ecx
  30b2d5:	89 c8                	mov    %ecx,%eax
  30b2d7:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b2dc:	8b 40 08             	mov    0x8(%eax),%eax
  30b2df:	39 c2                	cmp    %eax,%edx
  30b2e1:	0f 86 79 01 00 00    	jbe    30b460 <scrtop+0x1b8>
  30b2e7:	a1 3c 40 31 00       	mov    0x31403c,%eax
  30b2ec:	8d 50 ff             	lea    -0x1(%eax),%edx
  30b2ef:	a1 40 40 31 00       	mov    0x314040,%eax
  30b2f4:	0f af c2             	imul   %edx,%eax
  30b2f7:	c1 e8 02             	shr    $0x2,%eax
  30b2fa:	89 c1                	mov    %eax,%ecx
  30b2fc:	8b 45 08             	mov    0x8(%ebp),%eax
  30b2ff:	c1 e0 02             	shl    $0x2,%eax
  30b302:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b309:	29 c2                	sub    %eax,%edx
  30b30b:	89 d0                	mov    %edx,%eax
  30b30d:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b312:	8b 50 04             	mov    0x4(%eax),%edx
  30b315:	8b 45 08             	mov    0x8(%ebp),%eax
  30b318:	c1 e0 02             	shl    $0x2,%eax
  30b31b:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  30b322:	29 c3                	sub    %eax,%ebx
  30b324:	89 d8                	mov    %ebx,%eax
  30b326:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b32b:	8b 58 0c             	mov    0xc(%eax),%ebx
  30b32e:	8b 45 08             	mov    0x8(%ebp),%eax
  30b331:	c1 e0 02             	shl    $0x2,%eax
  30b334:	8d 34 c5 00 00 00 00 	lea    0x0(,%eax,8),%esi
  30b33b:	29 c6                	sub    %eax,%esi
  30b33d:	89 f0                	mov    %esi,%eax
  30b33f:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b344:	0f b7 40 02          	movzwl 0x2(%eax),%eax
  30b348:	89 d7                	mov    %edx,%edi
  30b34a:	89 de                	mov    %ebx,%esi
  30b34c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  30b34e:	8b 0d 38 40 31 00    	mov    0x314038,%ecx
  30b354:	66 f3 ab             	rep stos %ax,%es:(%edi)
  30b357:	8b 45 08             	mov    0x8(%ebp),%eax
  30b35a:	c1 e0 02             	shl    $0x2,%eax
  30b35d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b364:	29 c2                	sub    %eax,%edx
  30b366:	89 d0                	mov    %edx,%eax
  30b368:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b36d:	8b 10                	mov    (%eax),%edx
  30b36f:	8b 45 08             	mov    0x8(%ebp),%eax
  30b372:	c1 e0 02             	shl    $0x2,%eax
  30b375:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b37c:	29 c1                	sub    %eax,%ecx
  30b37e:	89 c8                	mov    %ecx,%eax
  30b380:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b385:	8b 48 04             	mov    0x4(%eax),%ecx
  30b388:	8b 45 08             	mov    0x8(%ebp),%eax
  30b38b:	c1 e0 02             	shl    $0x2,%eax
  30b38e:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  30b395:	29 c3                	sub    %eax,%ebx
  30b397:	89 d8                	mov    %ebx,%eax
  30b399:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b39e:	8b 40 0c             	mov    0xc(%eax),%eax
  30b3a1:	29 c1                	sub    %eax,%ecx
  30b3a3:	89 c8                	mov    %ecx,%eax
  30b3a5:	01 c2                	add    %eax,%edx
  30b3a7:	8b 45 08             	mov    0x8(%ebp),%eax
  30b3aa:	c1 e0 02             	shl    $0x2,%eax
  30b3ad:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b3b4:	29 c1                	sub    %eax,%ecx
  30b3b6:	89 c8                	mov    %ecx,%eax
  30b3b8:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b3bd:	89 10                	mov    %edx,(%eax)
  30b3bf:	8b 45 08             	mov    0x8(%ebp),%eax
  30b3c2:	c1 e0 02             	shl    $0x2,%eax
  30b3c5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b3cc:	29 c2                	sub    %eax,%edx
  30b3ce:	89 d0                	mov    %edx,%eax
  30b3d0:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b3d5:	8b 50 04             	mov    0x4(%eax),%edx
  30b3d8:	8b 45 08             	mov    0x8(%ebp),%eax
  30b3db:	c1 e0 02             	shl    $0x2,%eax
  30b3de:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b3e5:	29 c1                	sub    %eax,%ecx
  30b3e7:	89 c8                	mov    %ecx,%eax
  30b3e9:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b3ee:	8b 48 04             	mov    0x4(%eax),%ecx
  30b3f1:	8b 45 08             	mov    0x8(%ebp),%eax
  30b3f4:	c1 e0 02             	shl    $0x2,%eax
  30b3f7:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  30b3fe:	29 c3                	sub    %eax,%ebx
  30b400:	89 d8                	mov    %ebx,%eax
  30b402:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b407:	8b 40 0c             	mov    0xc(%eax),%eax
  30b40a:	29 c1                	sub    %eax,%ecx
  30b40c:	89 c8                	mov    %ecx,%eax
  30b40e:	01 c2                	add    %eax,%edx
  30b410:	8b 45 08             	mov    0x8(%ebp),%eax
  30b413:	c1 e0 02             	shl    $0x2,%eax
  30b416:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b41d:	29 c1                	sub    %eax,%ecx
  30b41f:	89 c8                	mov    %ecx,%eax
  30b421:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b426:	89 50 04             	mov    %edx,0x4(%eax)
  30b429:	8b 45 08             	mov    0x8(%ebp),%eax
  30b42c:	c1 e0 02             	shl    $0x2,%eax
  30b42f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b436:	29 c2                	sub    %eax,%edx
  30b438:	89 d0                	mov    %edx,%eax
  30b43a:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b43f:	8b 50 04             	mov    0x4(%eax),%edx
  30b442:	8b 45 08             	mov    0x8(%ebp),%eax
  30b445:	c1 e0 02             	shl    $0x2,%eax
  30b448:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b44f:	29 c1                	sub    %eax,%ecx
  30b451:	89 c8                	mov    %ecx,%eax
  30b453:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b458:	89 50 0c             	mov    %edx,0xc(%eax)
  30b45b:	e9 ad 00 00 00       	jmp    30b50d <scrtop+0x265>
  30b460:	8b 45 08             	mov    0x8(%ebp),%eax
  30b463:	c1 e0 02             	shl    $0x2,%eax
  30b466:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b46d:	29 c2                	sub    %eax,%edx
  30b46f:	89 d0                	mov    %edx,%eax
  30b471:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b476:	8b 10                	mov    (%eax),%edx
  30b478:	8b 0d 38 40 31 00    	mov    0x314038,%ecx
  30b47e:	8b 45 08             	mov    0x8(%ebp),%eax
  30b481:	c1 e0 02             	shl    $0x2,%eax
  30b484:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  30b48b:	29 c3                	sub    %eax,%ebx
  30b48d:	89 d8                	mov    %ebx,%eax
  30b48f:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b494:	0f b7 40 02          	movzwl 0x2(%eax),%eax
  30b498:	89 d7                	mov    %edx,%edi
  30b49a:	66 f3 ab             	rep stos %ax,%es:(%edi)
  30b49d:	8b 45 08             	mov    0x8(%ebp),%eax
  30b4a0:	c1 e0 02             	shl    $0x2,%eax
  30b4a3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b4aa:	29 c2                	sub    %eax,%edx
  30b4ac:	89 d0                	mov    %edx,%eax
  30b4ae:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b4b3:	8b 50 0c             	mov    0xc(%eax),%edx
  30b4b6:	a1 40 40 31 00       	mov    0x314040,%eax
  30b4bb:	01 c2                	add    %eax,%edx
  30b4bd:	8b 45 08             	mov    0x8(%ebp),%eax
  30b4c0:	c1 e0 02             	shl    $0x2,%eax
  30b4c3:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b4ca:	29 c1                	sub    %eax,%ecx
  30b4cc:	89 c8                	mov    %ecx,%eax
  30b4ce:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b4d3:	89 50 0c             	mov    %edx,0xc(%eax)
  30b4d6:	8b 45 08             	mov    0x8(%ebp),%eax
  30b4d9:	c1 e0 02             	shl    $0x2,%eax
  30b4dc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b4e3:	29 c2                	sub    %eax,%edx
  30b4e5:	89 d0                	mov    %edx,%eax
  30b4e7:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b4ec:	8b 10                	mov    (%eax),%edx
  30b4ee:	a1 40 40 31 00       	mov    0x314040,%eax
  30b4f3:	01 c2                	add    %eax,%edx
  30b4f5:	8b 45 08             	mov    0x8(%ebp),%eax
  30b4f8:	c1 e0 02             	shl    $0x2,%eax
  30b4fb:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b502:	29 c1                	sub    %eax,%ecx
  30b504:	89 c8                	mov    %ecx,%eax
  30b506:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b50b:	89 10                	mov    %edx,(%eax)
  30b50d:	ff 75 08             	pushl  0x8(%ebp)
  30b510:	e8 b2 fb ff ff       	call   30b0c7 <set_top>
  30b515:	83 c4 04             	add    $0x4,%esp
  30b518:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30b51b:	5b                   	pop    %ebx
  30b51c:	5e                   	pop    %esi
  30b51d:	5f                   	pop    %edi
  30b51e:	5d                   	pop    %ebp
  30b51f:	c3                   	ret    

0030b520 <scrdown>:
  30b520:	55                   	push   %ebp
  30b521:	89 e5                	mov    %esp,%ebp
  30b523:	8b 45 08             	mov    0x8(%ebp),%eax
  30b526:	c1 e0 02             	shl    $0x2,%eax
  30b529:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b530:	29 c2                	sub    %eax,%edx
  30b532:	89 d0                	mov    %edx,%eax
  30b534:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b539:	8b 50 0c             	mov    0xc(%eax),%edx
  30b53c:	a1 40 40 31 00       	mov    0x314040,%eax
  30b541:	89 d1                	mov    %edx,%ecx
  30b543:	29 c1                	sub    %eax,%ecx
  30b545:	8b 45 08             	mov    0x8(%ebp),%eax
  30b548:	c1 e0 02             	shl    $0x2,%eax
  30b54b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b552:	29 c2                	sub    %eax,%edx
  30b554:	89 d0                	mov    %edx,%eax
  30b556:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b55b:	8b 40 04             	mov    0x4(%eax),%eax
  30b55e:	39 c1                	cmp    %eax,%ecx
  30b560:	77 02                	ja     30b564 <scrdown+0x44>
  30b562:	eb 7b                	jmp    30b5df <scrdown+0xbf>
  30b564:	8b 45 08             	mov    0x8(%ebp),%eax
  30b567:	c1 e0 02             	shl    $0x2,%eax
  30b56a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b571:	29 c2                	sub    %eax,%edx
  30b573:	89 d0                	mov    %edx,%eax
  30b575:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b57a:	8b 50 0c             	mov    0xc(%eax),%edx
  30b57d:	a1 40 40 31 00       	mov    0x314040,%eax
  30b582:	29 c2                	sub    %eax,%edx
  30b584:	8b 45 08             	mov    0x8(%ebp),%eax
  30b587:	c1 e0 02             	shl    $0x2,%eax
  30b58a:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b591:	29 c1                	sub    %eax,%ecx
  30b593:	89 c8                	mov    %ecx,%eax
  30b595:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b59a:	89 50 0c             	mov    %edx,0xc(%eax)
  30b59d:	8b 45 08             	mov    0x8(%ebp),%eax
  30b5a0:	c1 e0 02             	shl    $0x2,%eax
  30b5a3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b5aa:	29 c2                	sub    %eax,%edx
  30b5ac:	89 d0                	mov    %edx,%eax
  30b5ae:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b5b3:	8b 10                	mov    (%eax),%edx
  30b5b5:	a1 40 40 31 00       	mov    0x314040,%eax
  30b5ba:	29 c2                	sub    %eax,%edx
  30b5bc:	8b 45 08             	mov    0x8(%ebp),%eax
  30b5bf:	c1 e0 02             	shl    $0x2,%eax
  30b5c2:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b5c9:	29 c1                	sub    %eax,%ecx
  30b5cb:	89 c8                	mov    %ecx,%eax
  30b5cd:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b5d2:	89 10                	mov    %edx,(%eax)
  30b5d4:	ff 75 08             	pushl  0x8(%ebp)
  30b5d7:	e8 eb fa ff ff       	call   30b0c7 <set_top>
  30b5dc:	83 c4 04             	add    $0x4,%esp
  30b5df:	c9                   	leave  
  30b5e0:	c3                   	ret    

0030b5e1 <lf>:
  30b5e1:	55                   	push   %ebp
  30b5e2:	89 e5                	mov    %esp,%ebp
  30b5e4:	8b 45 08             	mov    0x8(%ebp),%eax
  30b5e7:	c1 e0 02             	shl    $0x2,%eax
  30b5ea:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b5f1:	29 c2                	sub    %eax,%edx
  30b5f3:	89 d0                	mov    %edx,%eax
  30b5f5:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b5fa:	8b 50 04             	mov    0x4(%eax),%edx
  30b5fd:	a1 40 40 31 00       	mov    0x314040,%eax
  30b602:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  30b605:	8b 45 08             	mov    0x8(%ebp),%eax
  30b608:	c1 e0 02             	shl    $0x2,%eax
  30b60b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b612:	29 c2                	sub    %eax,%edx
  30b614:	89 d0                	mov    %edx,%eax
  30b616:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b61b:	8b 00                	mov    (%eax),%eax
  30b61d:	39 c1                	cmp    %eax,%ecx
  30b61f:	76 0b                	jbe    30b62c <lf+0x4b>
  30b621:	ff 75 08             	pushl  0x8(%ebp)
  30b624:	e8 7f fc ff ff       	call   30b2a8 <scrtop>
  30b629:	83 c4 04             	add    $0x4,%esp
  30b62c:	8b 45 08             	mov    0x8(%ebp),%eax
  30b62f:	c1 e0 02             	shl    $0x2,%eax
  30b632:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b639:	29 c2                	sub    %eax,%edx
  30b63b:	89 d0                	mov    %edx,%eax
  30b63d:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b642:	8b 50 04             	mov    0x4(%eax),%edx
  30b645:	a1 40 40 31 00       	mov    0x314040,%eax
  30b64a:	01 c2                	add    %eax,%edx
  30b64c:	8b 45 08             	mov    0x8(%ebp),%eax
  30b64f:	c1 e0 02             	shl    $0x2,%eax
  30b652:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b659:	29 c1                	sub    %eax,%ecx
  30b65b:	89 c8                	mov    %ecx,%eax
  30b65d:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b662:	89 50 04             	mov    %edx,0x4(%eax)
  30b665:	ff 75 08             	pushl  0x8(%ebp)
  30b668:	e8 ef fa ff ff       	call   30b15c <set_cur>
  30b66d:	83 c4 04             	add    $0x4,%esp
  30b670:	c9                   	leave  
  30b671:	c3                   	ret    

0030b672 <cr>:
  30b672:	55                   	push   %ebp
  30b673:	89 e5                	mov    %esp,%ebp
  30b675:	53                   	push   %ebx
  30b676:	8b 45 08             	mov    0x8(%ebp),%eax
  30b679:	c1 e0 02             	shl    $0x2,%eax
  30b67c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b683:	29 c2                	sub    %eax,%edx
  30b685:	89 d0                	mov    %edx,%eax
  30b687:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b68c:	8b 48 04             	mov    0x4(%eax),%ecx
  30b68f:	8b 45 08             	mov    0x8(%ebp),%eax
  30b692:	c1 e0 02             	shl    $0x2,%eax
  30b695:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b69c:	29 c2                	sub    %eax,%edx
  30b69e:	89 d0                	mov    %edx,%eax
  30b6a0:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b6a5:	8b 50 04             	mov    0x4(%eax),%edx
  30b6a8:	8b 45 08             	mov    0x8(%ebp),%eax
  30b6ab:	c1 e0 02             	shl    $0x2,%eax
  30b6ae:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  30b6b5:	29 c3                	sub    %eax,%ebx
  30b6b7:	89 d8                	mov    %ebx,%eax
  30b6b9:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b6be:	8b 40 04             	mov    0x4(%eax),%eax
  30b6c1:	29 c2                	sub    %eax,%edx
  30b6c3:	89 d0                	mov    %edx,%eax
  30b6c5:	8b 1d 40 40 31 00    	mov    0x314040,%ebx
  30b6cb:	ba 00 00 00 00       	mov    $0x0,%edx
  30b6d0:	f7 f3                	div    %ebx
  30b6d2:	89 d0                	mov    %edx,%eax
  30b6d4:	29 c1                	sub    %eax,%ecx
  30b6d6:	89 ca                	mov    %ecx,%edx
  30b6d8:	8b 45 08             	mov    0x8(%ebp),%eax
  30b6db:	c1 e0 02             	shl    $0x2,%eax
  30b6de:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b6e5:	29 c1                	sub    %eax,%ecx
  30b6e7:	89 c8                	mov    %ecx,%eax
  30b6e9:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b6ee:	89 50 04             	mov    %edx,0x4(%eax)
  30b6f1:	ff 75 08             	pushl  0x8(%ebp)
  30b6f4:	e8 63 fa ff ff       	call   30b15c <set_cur>
  30b6f9:	83 c4 04             	add    $0x4,%esp
  30b6fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  30b6ff:	c9                   	leave  
  30b700:	c3                   	ret    

0030b701 <del>:
  30b701:	55                   	push   %ebp
  30b702:	89 e5                	mov    %esp,%ebp
  30b704:	8b 45 08             	mov    0x8(%ebp),%eax
  30b707:	c1 e0 02             	shl    $0x2,%eax
  30b70a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b711:	29 c2                	sub    %eax,%edx
  30b713:	89 d0                	mov    %edx,%eax
  30b715:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b71a:	8b 50 04             	mov    0x4(%eax),%edx
  30b71d:	8b 45 08             	mov    0x8(%ebp),%eax
  30b720:	c1 e0 02             	shl    $0x2,%eax
  30b723:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b72a:	29 c1                	sub    %eax,%ecx
  30b72c:	89 c8                	mov    %ecx,%eax
  30b72e:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b733:	8b 40 04             	mov    0x4(%eax),%eax
  30b736:	29 c2                	sub    %eax,%edx
  30b738:	89 d0                	mov    %edx,%eax
  30b73a:	8b 0d 40 40 31 00    	mov    0x314040,%ecx
  30b740:	ba 00 00 00 00       	mov    $0x0,%edx
  30b745:	f7 f1                	div    %ecx
  30b747:	89 d0                	mov    %edx,%eax
  30b749:	85 c0                	test   %eax,%eax
  30b74b:	74 6d                	je     30b7ba <del+0xb9>
  30b74d:	8b 45 08             	mov    0x8(%ebp),%eax
  30b750:	c1 e0 02             	shl    $0x2,%eax
  30b753:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b75a:	29 c2                	sub    %eax,%edx
  30b75c:	89 d0                	mov    %edx,%eax
  30b75e:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b763:	8b 40 04             	mov    0x4(%eax),%eax
  30b766:	8d 50 fe             	lea    -0x2(%eax),%edx
  30b769:	8b 45 08             	mov    0x8(%ebp),%eax
  30b76c:	c1 e0 02             	shl    $0x2,%eax
  30b76f:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b776:	29 c1                	sub    %eax,%ecx
  30b778:	89 c8                	mov    %ecx,%eax
  30b77a:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b77f:	89 50 04             	mov    %edx,0x4(%eax)
  30b782:	8b 45 08             	mov    0x8(%ebp),%eax
  30b785:	c1 e0 02             	shl    $0x2,%eax
  30b788:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b78f:	29 c2                	sub    %eax,%edx
  30b791:	89 d0                	mov    %edx,%eax
  30b793:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b798:	8b 40 04             	mov    0x4(%eax),%eax
  30b79b:	89 c2                	mov    %eax,%edx
  30b79d:	8b 45 08             	mov    0x8(%ebp),%eax
  30b7a0:	c1 e0 02             	shl    $0x2,%eax
  30b7a3:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b7aa:	29 c1                	sub    %eax,%ecx
  30b7ac:	89 c8                	mov    %ecx,%eax
  30b7ae:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b7b3:	0f b7 40 02          	movzwl 0x2(%eax),%eax
  30b7b7:	66 89 02             	mov    %ax,(%edx)
  30b7ba:	ff 75 08             	pushl  0x8(%ebp)
  30b7bd:	e8 9a f9 ff ff       	call   30b15c <set_cur>
  30b7c2:	83 c4 04             	add    $0x4,%esp
  30b7c5:	c9                   	leave  
  30b7c6:	c3                   	ret    

0030b7c7 <insert>:
  30b7c7:	55                   	push   %ebp
  30b7c8:	89 e5                	mov    %esp,%ebp
  30b7ca:	53                   	push   %ebx
  30b7cb:	83 ec 04             	sub    $0x4,%esp
  30b7ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  30b7d1:	88 45 f8             	mov    %al,-0x8(%ebp)
  30b7d4:	8b 45 08             	mov    0x8(%ebp),%eax
  30b7d7:	c1 e0 02             	shl    $0x2,%eax
  30b7da:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b7e1:	29 c2                	sub    %eax,%edx
  30b7e3:	89 d0                	mov    %edx,%eax
  30b7e5:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b7ea:	8b 40 04             	mov    0x4(%eax),%eax
  30b7ed:	89 c2                	mov    %eax,%edx
  30b7ef:	0f b6 4d f8          	movzbl -0x8(%ebp),%ecx
  30b7f3:	8b 45 08             	mov    0x8(%ebp),%eax
  30b7f6:	c1 e0 02             	shl    $0x2,%eax
  30b7f9:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  30b800:	29 c3                	sub    %eax,%ebx
  30b802:	89 d8                	mov    %ebx,%eax
  30b804:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b809:	0f b6 00             	movzbl (%eax),%eax
  30b80c:	0f b6 c0             	movzbl %al,%eax
  30b80f:	c1 e0 08             	shl    $0x8,%eax
  30b812:	09 c8                	or     %ecx,%eax
  30b814:	66 89 02             	mov    %ax,(%edx)
  30b817:	8b 45 08             	mov    0x8(%ebp),%eax
  30b81a:	c1 e0 02             	shl    $0x2,%eax
  30b81d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b824:	29 c2                	sub    %eax,%edx
  30b826:	89 d0                	mov    %edx,%eax
  30b828:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b82d:	8b 40 04             	mov    0x4(%eax),%eax
  30b830:	8d 48 02             	lea    0x2(%eax),%ecx
  30b833:	8b 45 08             	mov    0x8(%ebp),%eax
  30b836:	c1 e0 02             	shl    $0x2,%eax
  30b839:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b840:	29 c2                	sub    %eax,%edx
  30b842:	89 d0                	mov    %edx,%eax
  30b844:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b849:	8b 00                	mov    (%eax),%eax
  30b84b:	39 c1                	cmp    %eax,%ecx
  30b84d:	76 0b                	jbe    30b85a <insert+0x93>
  30b84f:	ff 75 08             	pushl  0x8(%ebp)
  30b852:	e8 9a f9 ff ff       	call   30b1f1 <scrup>
  30b857:	83 c4 04             	add    $0x4,%esp
  30b85a:	8b 45 08             	mov    0x8(%ebp),%eax
  30b85d:	c1 e0 02             	shl    $0x2,%eax
  30b860:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b867:	29 c2                	sub    %eax,%edx
  30b869:	89 d0                	mov    %edx,%eax
  30b86b:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b870:	8b 40 04             	mov    0x4(%eax),%eax
  30b873:	8d 50 02             	lea    0x2(%eax),%edx
  30b876:	8b 45 08             	mov    0x8(%ebp),%eax
  30b879:	c1 e0 02             	shl    $0x2,%eax
  30b87c:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b883:	29 c1                	sub    %eax,%ecx
  30b885:	89 c8                	mov    %ecx,%eax
  30b887:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b88c:	89 50 04             	mov    %edx,0x4(%eax)
  30b88f:	ff 75 08             	pushl  0x8(%ebp)
  30b892:	e8 c5 f8 ff ff       	call   30b15c <set_cur>
  30b897:	83 c4 04             	add    $0x4,%esp
  30b89a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  30b89d:	c9                   	leave  
  30b89e:	c3                   	ret    

0030b89f <cons_print>:
  30b89f:	55                   	push   %ebp
  30b8a0:	89 e5                	mov    %esp,%ebp
  30b8a2:	83 ec 10             	sub    $0x10,%esp
  30b8a5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30b8ac:	e9 ab 05 00 00       	jmp    30be5c <cons_print+0x5bd>
  30b8b1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  30b8b4:	8b 45 0c             	mov    0xc(%ebp),%eax
  30b8b7:	01 d0                	add    %edx,%eax
  30b8b9:	0f b6 00             	movzbl (%eax),%eax
  30b8bc:	88 45 fb             	mov    %al,-0x5(%ebp)
  30b8bf:	8b 45 08             	mov    0x8(%ebp),%eax
  30b8c2:	c1 e0 02             	shl    $0x2,%eax
  30b8c5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b8cc:	29 c2                	sub    %eax,%edx
  30b8ce:	89 d0                	mov    %edx,%eax
  30b8d0:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30b8d5:	8b 40 08             	mov    0x8(%eax),%eax
  30b8d8:	83 f8 01             	cmp    $0x1,%eax
  30b8db:	0f 85 11 05 00 00    	jne    30bdf2 <cons_print+0x553>
  30b8e1:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  30b8e5:	83 e8 42             	sub    $0x42,%eax
  30b8e8:	83 f8 37             	cmp    $0x37,%eax
  30b8eb:	0f 87 e2 04 00 00    	ja     30bdd3 <cons_print+0x534>
  30b8f1:	8b 04 85 04 e1 30 00 	mov    0x30e104(,%eax,4),%eax
  30b8f8:	ff e0                	jmp    *%eax
  30b8fa:	8b 45 08             	mov    0x8(%ebp),%eax
  30b8fd:	c1 e0 02             	shl    $0x2,%eax
  30b900:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b907:	29 c2                	sub    %eax,%edx
  30b909:	89 d0                	mov    %edx,%eax
  30b90b:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b910:	0f b6 00             	movzbl (%eax),%eax
  30b913:	83 e0 f0             	and    $0xfffffff0,%eax
  30b916:	89 c2                	mov    %eax,%edx
  30b918:	8b 45 08             	mov    0x8(%ebp),%eax
  30b91b:	c1 e0 02             	shl    $0x2,%eax
  30b91e:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b925:	29 c1                	sub    %eax,%ecx
  30b927:	89 c8                	mov    %ecx,%eax
  30b929:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b92e:	88 10                	mov    %dl,(%eax)
  30b930:	e9 9e 04 00 00       	jmp    30bdd3 <cons_print+0x534>
  30b935:	8b 45 08             	mov    0x8(%ebp),%eax
  30b938:	c1 e0 02             	shl    $0x2,%eax
  30b93b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b942:	29 c2                	sub    %eax,%edx
  30b944:	89 d0                	mov    %edx,%eax
  30b946:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b94b:	0f b6 00             	movzbl (%eax),%eax
  30b94e:	83 e0 0f             	and    $0xf,%eax
  30b951:	89 c2                	mov    %eax,%edx
  30b953:	8b 45 08             	mov    0x8(%ebp),%eax
  30b956:	c1 e0 02             	shl    $0x2,%eax
  30b959:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b960:	29 c1                	sub    %eax,%ecx
  30b962:	89 c8                	mov    %ecx,%eax
  30b964:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b969:	88 10                	mov    %dl,(%eax)
  30b96b:	e9 63 04 00 00       	jmp    30bdd3 <cons_print+0x534>
  30b970:	8b 45 08             	mov    0x8(%ebp),%eax
  30b973:	c1 e0 02             	shl    $0x2,%eax
  30b976:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b97d:	29 c2                	sub    %eax,%edx
  30b97f:	89 d0                	mov    %edx,%eax
  30b981:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b986:	0f b6 00             	movzbl (%eax),%eax
  30b989:	83 e0 f0             	and    $0xfffffff0,%eax
  30b98c:	83 c8 01             	or     $0x1,%eax
  30b98f:	89 c2                	mov    %eax,%edx
  30b991:	8b 45 08             	mov    0x8(%ebp),%eax
  30b994:	c1 e0 02             	shl    $0x2,%eax
  30b997:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b99e:	29 c1                	sub    %eax,%ecx
  30b9a0:	89 c8                	mov    %ecx,%eax
  30b9a2:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b9a7:	88 10                	mov    %dl,(%eax)
  30b9a9:	e9 25 04 00 00       	jmp    30bdd3 <cons_print+0x534>
  30b9ae:	8b 45 08             	mov    0x8(%ebp),%eax
  30b9b1:	c1 e0 02             	shl    $0x2,%eax
  30b9b4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b9bb:	29 c2                	sub    %eax,%edx
  30b9bd:	89 d0                	mov    %edx,%eax
  30b9bf:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b9c4:	0f b6 00             	movzbl (%eax),%eax
  30b9c7:	83 e0 0f             	and    $0xf,%eax
  30b9ca:	83 c8 10             	or     $0x10,%eax
  30b9cd:	89 c2                	mov    %eax,%edx
  30b9cf:	8b 45 08             	mov    0x8(%ebp),%eax
  30b9d2:	c1 e0 02             	shl    $0x2,%eax
  30b9d5:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b9dc:	29 c1                	sub    %eax,%ecx
  30b9de:	89 c8                	mov    %ecx,%eax
  30b9e0:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30b9e5:	88 10                	mov    %dl,(%eax)
  30b9e7:	e9 e7 03 00 00       	jmp    30bdd3 <cons_print+0x534>
  30b9ec:	8b 45 08             	mov    0x8(%ebp),%eax
  30b9ef:	c1 e0 02             	shl    $0x2,%eax
  30b9f2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b9f9:	29 c2                	sub    %eax,%edx
  30b9fb:	89 d0                	mov    %edx,%eax
  30b9fd:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30ba02:	0f b6 00             	movzbl (%eax),%eax
  30ba05:	83 e0 f0             	and    $0xfffffff0,%eax
  30ba08:	83 c8 02             	or     $0x2,%eax
  30ba0b:	89 c2                	mov    %eax,%edx
  30ba0d:	8b 45 08             	mov    0x8(%ebp),%eax
  30ba10:	c1 e0 02             	shl    $0x2,%eax
  30ba13:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30ba1a:	29 c1                	sub    %eax,%ecx
  30ba1c:	89 c8                	mov    %ecx,%eax
  30ba1e:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30ba23:	88 10                	mov    %dl,(%eax)
  30ba25:	e9 a9 03 00 00       	jmp    30bdd3 <cons_print+0x534>
  30ba2a:	8b 45 08             	mov    0x8(%ebp),%eax
  30ba2d:	c1 e0 02             	shl    $0x2,%eax
  30ba30:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30ba37:	29 c2                	sub    %eax,%edx
  30ba39:	89 d0                	mov    %edx,%eax
  30ba3b:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30ba40:	0f b6 00             	movzbl (%eax),%eax
  30ba43:	83 e0 0f             	and    $0xf,%eax
  30ba46:	83 c8 20             	or     $0x20,%eax
  30ba49:	89 c2                	mov    %eax,%edx
  30ba4b:	8b 45 08             	mov    0x8(%ebp),%eax
  30ba4e:	c1 e0 02             	shl    $0x2,%eax
  30ba51:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30ba58:	29 c1                	sub    %eax,%ecx
  30ba5a:	89 c8                	mov    %ecx,%eax
  30ba5c:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30ba61:	88 10                	mov    %dl,(%eax)
  30ba63:	e9 6b 03 00 00       	jmp    30bdd3 <cons_print+0x534>
  30ba68:	8b 45 08             	mov    0x8(%ebp),%eax
  30ba6b:	c1 e0 02             	shl    $0x2,%eax
  30ba6e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30ba75:	29 c2                	sub    %eax,%edx
  30ba77:	89 d0                	mov    %edx,%eax
  30ba79:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30ba7e:	0f b6 00             	movzbl (%eax),%eax
  30ba81:	83 e0 f0             	and    $0xfffffff0,%eax
  30ba84:	83 c8 03             	or     $0x3,%eax
  30ba87:	89 c2                	mov    %eax,%edx
  30ba89:	8b 45 08             	mov    0x8(%ebp),%eax
  30ba8c:	c1 e0 02             	shl    $0x2,%eax
  30ba8f:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30ba96:	29 c1                	sub    %eax,%ecx
  30ba98:	89 c8                	mov    %ecx,%eax
  30ba9a:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30ba9f:	88 10                	mov    %dl,(%eax)
  30baa1:	e9 2d 03 00 00       	jmp    30bdd3 <cons_print+0x534>
  30baa6:	8b 45 08             	mov    0x8(%ebp),%eax
  30baa9:	c1 e0 02             	shl    $0x2,%eax
  30baac:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bab3:	29 c2                	sub    %eax,%edx
  30bab5:	89 d0                	mov    %edx,%eax
  30bab7:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30babc:	0f b6 00             	movzbl (%eax),%eax
  30babf:	83 e0 0f             	and    $0xf,%eax
  30bac2:	83 c8 30             	or     $0x30,%eax
  30bac5:	89 c2                	mov    %eax,%edx
  30bac7:	8b 45 08             	mov    0x8(%ebp),%eax
  30baca:	c1 e0 02             	shl    $0x2,%eax
  30bacd:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bad4:	29 c1                	sub    %eax,%ecx
  30bad6:	89 c8                	mov    %ecx,%eax
  30bad8:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30badd:	88 10                	mov    %dl,(%eax)
  30badf:	e9 ef 02 00 00       	jmp    30bdd3 <cons_print+0x534>
  30bae4:	8b 45 08             	mov    0x8(%ebp),%eax
  30bae7:	c1 e0 02             	shl    $0x2,%eax
  30baea:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30baf1:	29 c2                	sub    %eax,%edx
  30baf3:	89 d0                	mov    %edx,%eax
  30baf5:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bafa:	0f b6 00             	movzbl (%eax),%eax
  30bafd:	83 e0 f0             	and    $0xfffffff0,%eax
  30bb00:	83 c8 04             	or     $0x4,%eax
  30bb03:	89 c2                	mov    %eax,%edx
  30bb05:	8b 45 08             	mov    0x8(%ebp),%eax
  30bb08:	c1 e0 02             	shl    $0x2,%eax
  30bb0b:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bb12:	29 c1                	sub    %eax,%ecx
  30bb14:	89 c8                	mov    %ecx,%eax
  30bb16:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bb1b:	88 10                	mov    %dl,(%eax)
  30bb1d:	e9 b1 02 00 00       	jmp    30bdd3 <cons_print+0x534>
  30bb22:	8b 45 08             	mov    0x8(%ebp),%eax
  30bb25:	c1 e0 02             	shl    $0x2,%eax
  30bb28:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bb2f:	29 c2                	sub    %eax,%edx
  30bb31:	89 d0                	mov    %edx,%eax
  30bb33:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bb38:	0f b6 00             	movzbl (%eax),%eax
  30bb3b:	83 e0 0f             	and    $0xf,%eax
  30bb3e:	83 c8 40             	or     $0x40,%eax
  30bb41:	89 c2                	mov    %eax,%edx
  30bb43:	8b 45 08             	mov    0x8(%ebp),%eax
  30bb46:	c1 e0 02             	shl    $0x2,%eax
  30bb49:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bb50:	29 c1                	sub    %eax,%ecx
  30bb52:	89 c8                	mov    %ecx,%eax
  30bb54:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bb59:	88 10                	mov    %dl,(%eax)
  30bb5b:	e9 73 02 00 00       	jmp    30bdd3 <cons_print+0x534>
  30bb60:	8b 45 08             	mov    0x8(%ebp),%eax
  30bb63:	c1 e0 02             	shl    $0x2,%eax
  30bb66:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bb6d:	29 c2                	sub    %eax,%edx
  30bb6f:	89 d0                	mov    %edx,%eax
  30bb71:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bb76:	0f b6 00             	movzbl (%eax),%eax
  30bb79:	83 e0 f0             	and    $0xfffffff0,%eax
  30bb7c:	83 c8 05             	or     $0x5,%eax
  30bb7f:	89 c2                	mov    %eax,%edx
  30bb81:	8b 45 08             	mov    0x8(%ebp),%eax
  30bb84:	c1 e0 02             	shl    $0x2,%eax
  30bb87:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bb8e:	29 c1                	sub    %eax,%ecx
  30bb90:	89 c8                	mov    %ecx,%eax
  30bb92:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bb97:	88 10                	mov    %dl,(%eax)
  30bb99:	e9 35 02 00 00       	jmp    30bdd3 <cons_print+0x534>
  30bb9e:	8b 45 08             	mov    0x8(%ebp),%eax
  30bba1:	c1 e0 02             	shl    $0x2,%eax
  30bba4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bbab:	29 c2                	sub    %eax,%edx
  30bbad:	89 d0                	mov    %edx,%eax
  30bbaf:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bbb4:	0f b6 00             	movzbl (%eax),%eax
  30bbb7:	83 e0 0f             	and    $0xf,%eax
  30bbba:	83 c8 50             	or     $0x50,%eax
  30bbbd:	89 c2                	mov    %eax,%edx
  30bbbf:	8b 45 08             	mov    0x8(%ebp),%eax
  30bbc2:	c1 e0 02             	shl    $0x2,%eax
  30bbc5:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bbcc:	29 c1                	sub    %eax,%ecx
  30bbce:	89 c8                	mov    %ecx,%eax
  30bbd0:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bbd5:	88 10                	mov    %dl,(%eax)
  30bbd7:	e9 f7 01 00 00       	jmp    30bdd3 <cons_print+0x534>
  30bbdc:	8b 45 08             	mov    0x8(%ebp),%eax
  30bbdf:	c1 e0 02             	shl    $0x2,%eax
  30bbe2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bbe9:	29 c2                	sub    %eax,%edx
  30bbeb:	89 d0                	mov    %edx,%eax
  30bbed:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bbf2:	0f b6 00             	movzbl (%eax),%eax
  30bbf5:	83 e0 f0             	and    $0xfffffff0,%eax
  30bbf8:	83 c8 06             	or     $0x6,%eax
  30bbfb:	89 c2                	mov    %eax,%edx
  30bbfd:	8b 45 08             	mov    0x8(%ebp),%eax
  30bc00:	c1 e0 02             	shl    $0x2,%eax
  30bc03:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bc0a:	29 c1                	sub    %eax,%ecx
  30bc0c:	89 c8                	mov    %ecx,%eax
  30bc0e:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bc13:	88 10                	mov    %dl,(%eax)
  30bc15:	e9 b9 01 00 00       	jmp    30bdd3 <cons_print+0x534>
  30bc1a:	8b 45 08             	mov    0x8(%ebp),%eax
  30bc1d:	c1 e0 02             	shl    $0x2,%eax
  30bc20:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bc27:	29 c2                	sub    %eax,%edx
  30bc29:	89 d0                	mov    %edx,%eax
  30bc2b:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bc30:	0f b6 00             	movzbl (%eax),%eax
  30bc33:	83 e0 0f             	and    $0xf,%eax
  30bc36:	83 c8 60             	or     $0x60,%eax
  30bc39:	89 c2                	mov    %eax,%edx
  30bc3b:	8b 45 08             	mov    0x8(%ebp),%eax
  30bc3e:	c1 e0 02             	shl    $0x2,%eax
  30bc41:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bc48:	29 c1                	sub    %eax,%ecx
  30bc4a:	89 c8                	mov    %ecx,%eax
  30bc4c:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bc51:	88 10                	mov    %dl,(%eax)
  30bc53:	e9 7b 01 00 00       	jmp    30bdd3 <cons_print+0x534>
  30bc58:	8b 45 08             	mov    0x8(%ebp),%eax
  30bc5b:	c1 e0 02             	shl    $0x2,%eax
  30bc5e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bc65:	29 c2                	sub    %eax,%edx
  30bc67:	89 d0                	mov    %edx,%eax
  30bc69:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bc6e:	0f b6 00             	movzbl (%eax),%eax
  30bc71:	83 e0 f0             	and    $0xfffffff0,%eax
  30bc74:	83 c8 07             	or     $0x7,%eax
  30bc77:	89 c2                	mov    %eax,%edx
  30bc79:	8b 45 08             	mov    0x8(%ebp),%eax
  30bc7c:	c1 e0 02             	shl    $0x2,%eax
  30bc7f:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bc86:	29 c1                	sub    %eax,%ecx
  30bc88:	89 c8                	mov    %ecx,%eax
  30bc8a:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bc8f:	88 10                	mov    %dl,(%eax)
  30bc91:	e9 3d 01 00 00       	jmp    30bdd3 <cons_print+0x534>
  30bc96:	8b 45 08             	mov    0x8(%ebp),%eax
  30bc99:	c1 e0 02             	shl    $0x2,%eax
  30bc9c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bca3:	29 c2                	sub    %eax,%edx
  30bca5:	89 d0                	mov    %edx,%eax
  30bca7:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bcac:	0f b6 00             	movzbl (%eax),%eax
  30bcaf:	83 e0 0f             	and    $0xf,%eax
  30bcb2:	83 c8 70             	or     $0x70,%eax
  30bcb5:	89 c2                	mov    %eax,%edx
  30bcb7:	8b 45 08             	mov    0x8(%ebp),%eax
  30bcba:	c1 e0 02             	shl    $0x2,%eax
  30bcbd:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bcc4:	29 c1                	sub    %eax,%ecx
  30bcc6:	89 c8                	mov    %ecx,%eax
  30bcc8:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bccd:	88 10                	mov    %dl,(%eax)
  30bccf:	e9 ff 00 00 00       	jmp    30bdd3 <cons_print+0x534>
  30bcd4:	8b 45 08             	mov    0x8(%ebp),%eax
  30bcd7:	c1 e0 02             	shl    $0x2,%eax
  30bcda:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bce1:	29 c2                	sub    %eax,%edx
  30bce3:	89 d0                	mov    %edx,%eax
  30bce5:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bcea:	0f b6 00             	movzbl (%eax),%eax
  30bced:	83 c8 08             	or     $0x8,%eax
  30bcf0:	89 c2                	mov    %eax,%edx
  30bcf2:	8b 45 08             	mov    0x8(%ebp),%eax
  30bcf5:	c1 e0 02             	shl    $0x2,%eax
  30bcf8:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bcff:	29 c1                	sub    %eax,%ecx
  30bd01:	89 c8                	mov    %ecx,%eax
  30bd03:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bd08:	88 10                	mov    %dl,(%eax)
  30bd0a:	e9 c4 00 00 00       	jmp    30bdd3 <cons_print+0x534>
  30bd0f:	8b 45 08             	mov    0x8(%ebp),%eax
  30bd12:	c1 e0 02             	shl    $0x2,%eax
  30bd15:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bd1c:	29 c2                	sub    %eax,%edx
  30bd1e:	89 d0                	mov    %edx,%eax
  30bd20:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bd25:	0f b6 00             	movzbl (%eax),%eax
  30bd28:	83 e0 f7             	and    $0xfffffff7,%eax
  30bd2b:	89 c2                	mov    %eax,%edx
  30bd2d:	8b 45 08             	mov    0x8(%ebp),%eax
  30bd30:	c1 e0 02             	shl    $0x2,%eax
  30bd33:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bd3a:	29 c1                	sub    %eax,%ecx
  30bd3c:	89 c8                	mov    %ecx,%eax
  30bd3e:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bd43:	88 10                	mov    %dl,(%eax)
  30bd45:	e9 89 00 00 00       	jmp    30bdd3 <cons_print+0x534>
  30bd4a:	8b 45 08             	mov    0x8(%ebp),%eax
  30bd4d:	c1 e0 02             	shl    $0x2,%eax
  30bd50:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bd57:	29 c2                	sub    %eax,%edx
  30bd59:	89 d0                	mov    %edx,%eax
  30bd5b:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bd60:	0f b6 00             	movzbl (%eax),%eax
  30bd63:	83 c8 80             	or     $0xffffff80,%eax
  30bd66:	89 c2                	mov    %eax,%edx
  30bd68:	8b 45 08             	mov    0x8(%ebp),%eax
  30bd6b:	c1 e0 02             	shl    $0x2,%eax
  30bd6e:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bd75:	29 c1                	sub    %eax,%ecx
  30bd77:	89 c8                	mov    %ecx,%eax
  30bd79:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bd7e:	88 10                	mov    %dl,(%eax)
  30bd80:	eb 51                	jmp    30bdd3 <cons_print+0x534>
  30bd82:	8b 45 08             	mov    0x8(%ebp),%eax
  30bd85:	c1 e0 02             	shl    $0x2,%eax
  30bd88:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bd8f:	29 c2                	sub    %eax,%edx
  30bd91:	89 d0                	mov    %edx,%eax
  30bd93:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bd98:	0f b6 00             	movzbl (%eax),%eax
  30bd9b:	83 e0 7f             	and    $0x7f,%eax
  30bd9e:	89 c2                	mov    %eax,%edx
  30bda0:	8b 45 08             	mov    0x8(%ebp),%eax
  30bda3:	c1 e0 02             	shl    $0x2,%eax
  30bda6:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bdad:	29 c1                	sub    %eax,%ecx
  30bdaf:	89 c8                	mov    %ecx,%eax
  30bdb1:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bdb6:	88 10                	mov    %dl,(%eax)
  30bdb8:	eb 19                	jmp    30bdd3 <cons_print+0x534>
  30bdba:	ff 75 08             	pushl  0x8(%ebp)
  30bdbd:	e8 5e f7 ff ff       	call   30b520 <scrdown>
  30bdc2:	83 c4 04             	add    $0x4,%esp
  30bdc5:	eb 0c                	jmp    30bdd3 <cons_print+0x534>
  30bdc7:	ff 75 08             	pushl  0x8(%ebp)
  30bdca:	e8 22 f4 ff ff       	call   30b1f1 <scrup>
  30bdcf:	83 c4 04             	add    $0x4,%esp
  30bdd2:	90                   	nop
  30bdd3:	8b 45 08             	mov    0x8(%ebp),%eax
  30bdd6:	c1 e0 02             	shl    $0x2,%eax
  30bdd9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bde0:	29 c2                	sub    %eax,%edx
  30bde2:	89 d0                	mov    %edx,%eax
  30bde4:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30bde9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  30bdf0:	eb 66                	jmp    30be58 <cons_print+0x5b9>
  30bdf2:	80 7d fb 1b          	cmpb   $0x1b,-0x5(%ebp)
  30bdf6:	75 1f                	jne    30be17 <cons_print+0x578>
  30bdf8:	8b 45 08             	mov    0x8(%ebp),%eax
  30bdfb:	c1 e0 02             	shl    $0x2,%eax
  30bdfe:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30be05:	29 c2                	sub    %eax,%edx
  30be07:	89 d0                	mov    %edx,%eax
  30be09:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30be0e:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
  30be15:	eb 41                	jmp    30be58 <cons_print+0x5b9>
  30be17:	80 7d fb 08          	cmpb   $0x8,-0x5(%ebp)
  30be1b:	75 0d                	jne    30be2a <cons_print+0x58b>
  30be1d:	ff 75 08             	pushl  0x8(%ebp)
  30be20:	e8 dc f8 ff ff       	call   30b701 <del>
  30be25:	83 c4 04             	add    $0x4,%esp
  30be28:	eb 2e                	jmp    30be58 <cons_print+0x5b9>
  30be2a:	80 7d fb 0a          	cmpb   $0xa,-0x5(%ebp)
  30be2e:	75 18                	jne    30be48 <cons_print+0x5a9>
  30be30:	ff 75 08             	pushl  0x8(%ebp)
  30be33:	e8 a9 f7 ff ff       	call   30b5e1 <lf>
  30be38:	83 c4 04             	add    $0x4,%esp
  30be3b:	ff 75 08             	pushl  0x8(%ebp)
  30be3e:	e8 2f f8 ff ff       	call   30b672 <cr>
  30be43:	83 c4 04             	add    $0x4,%esp
  30be46:	eb 10                	jmp    30be58 <cons_print+0x5b9>
  30be48:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  30be4c:	50                   	push   %eax
  30be4d:	ff 75 08             	pushl  0x8(%ebp)
  30be50:	e8 72 f9 ff ff       	call   30b7c7 <insert>
  30be55:	83 c4 08             	add    $0x8,%esp
  30be58:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  30be5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30be5f:	3b 45 10             	cmp    0x10(%ebp),%eax
  30be62:	0f 82 49 fa ff ff    	jb     30b8b1 <cons_print+0x12>
  30be68:	c9                   	leave  
  30be69:	c3                   	ret    

0030be6a <cons_init>:
  30be6a:	55                   	push   %ebp
  30be6b:	89 e5                	mov    %esp,%ebp
  30be6d:	83 ec 10             	sub    $0x10,%esp
  30be70:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30be77:	c7 05 44 40 31 00 00 	movl   $0x0,0x314044
  30be7e:	00 00 00 
  30be81:	c7 05 34 40 31 00 00 	movl   $0xb8000,0x314034
  30be88:	80 0b 00 
  30be8b:	c7 05 3c 40 31 00 19 	movl   $0x19,0x31403c
  30be92:	00 00 00 
  30be95:	c7 05 38 40 31 00 50 	movl   $0x50,0x314038
  30be9c:	00 00 00 
  30be9f:	a1 38 40 31 00       	mov    0x314038,%eax
  30bea4:	01 c0                	add    %eax,%eax
  30bea6:	a3 40 40 31 00       	mov    %eax,0x314040
  30beab:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30beae:	c1 e0 02             	shl    $0x2,%eax
  30beb1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30beb8:	29 c2                	sub    %eax,%edx
  30beba:	89 d0                	mov    %edx,%eax
  30bebc:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bec1:	c6 00 0f             	movb   $0xf,(%eax)
  30bec4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30bec7:	c1 e0 02             	shl    $0x2,%eax
  30beca:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bed1:	29 c2                	sub    %eax,%edx
  30bed3:	89 d0                	mov    %edx,%eax
  30bed5:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30beda:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  30bee1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30bee4:	c1 e0 02             	shl    $0x2,%eax
  30bee7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30beee:	29 c2                	sub    %eax,%edx
  30bef0:	89 d0                	mov    %edx,%eax
  30bef2:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bef7:	66 c7 40 02 20 0f    	movw   $0xf20,0x2(%eax)
  30befd:	8b 15 34 40 31 00    	mov    0x314034,%edx
  30bf03:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30bf06:	c1 e0 02             	shl    $0x2,%eax
  30bf09:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bf10:	29 c1                	sub    %eax,%ecx
  30bf12:	89 c8                	mov    %ecx,%eax
  30bf14:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bf19:	89 50 04             	mov    %edx,0x4(%eax)
  30bf1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30bf1f:	c1 e0 02             	shl    $0x2,%eax
  30bf22:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bf29:	29 c2                	sub    %eax,%edx
  30bf2b:	89 d0                	mov    %edx,%eax
  30bf2d:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bf32:	8b 40 04             	mov    0x4(%eax),%eax
  30bf35:	8d 90 e0 2e 00 00    	lea    0x2ee0(%eax),%edx
  30bf3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30bf3e:	c1 e0 02             	shl    $0x2,%eax
  30bf41:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bf48:	29 c1                	sub    %eax,%ecx
  30bf4a:	89 c8                	mov    %ecx,%eax
  30bf4c:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bf51:	89 50 08             	mov    %edx,0x8(%eax)
  30bf54:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
  30bf58:	b8 0c 00 00 00       	mov    $0xc,%eax
  30bf5d:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30bf62:	ee                   	out    %al,(%dx)
  30bf63:	eb 00                	jmp    30bf65 <cons_init+0xfb>
  30bf65:	eb 00                	jmp    30bf67 <cons_init+0xfd>
  30bf67:	b8 d5 03 00 00       	mov    $0x3d5,%eax
  30bf6c:	89 c2                	mov    %eax,%edx
  30bf6e:	ec                   	in     (%dx),%al
  30bf6f:	eb 00                	jmp    30bf71 <cons_init+0x107>
  30bf71:	eb 00                	jmp    30bf73 <cons_init+0x109>
  30bf73:	88 45 fa             	mov    %al,-0x6(%ebp)
  30bf76:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  30bf7a:	88 45 fb             	mov    %al,-0x5(%ebp)
  30bf7d:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  30bf81:	0f b6 c0             	movzbl %al,%eax
  30bf84:	c1 e0 09             	shl    $0x9,%eax
  30bf87:	89 c1                	mov    %eax,%ecx
  30bf89:	c6 45 f9 00          	movb   $0x0,-0x7(%ebp)
  30bf8d:	b8 0d 00 00 00       	mov    $0xd,%eax
  30bf92:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30bf97:	ee                   	out    %al,(%dx)
  30bf98:	eb 00                	jmp    30bf9a <cons_init+0x130>
  30bf9a:	eb 00                	jmp    30bf9c <cons_init+0x132>
  30bf9c:	b8 d5 03 00 00       	mov    $0x3d5,%eax
  30bfa1:	89 c2                	mov    %eax,%edx
  30bfa3:	ec                   	in     (%dx),%al
  30bfa4:	eb 00                	jmp    30bfa6 <cons_init+0x13c>
  30bfa6:	eb 00                	jmp    30bfa8 <cons_init+0x13e>
  30bfa8:	88 45 f8             	mov    %al,-0x8(%ebp)
  30bfab:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  30bfaf:	88 45 f9             	mov    %al,-0x7(%ebp)
  30bfb2:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  30bfb6:	0f b6 c0             	movzbl %al,%eax
  30bfb9:	01 c0                	add    %eax,%eax
  30bfbb:	09 c8                	or     %ecx,%eax
  30bfbd:	89 c2                	mov    %eax,%edx
  30bfbf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30bfc2:	c1 e0 02             	shl    $0x2,%eax
  30bfc5:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bfcc:	29 c1                	sub    %eax,%ecx
  30bfce:	89 c8                	mov    %ecx,%eax
  30bfd0:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bfd5:	8b 40 04             	mov    0x4(%eax),%eax
  30bfd8:	01 c2                	add    %eax,%edx
  30bfda:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30bfdd:	c1 e0 02             	shl    $0x2,%eax
  30bfe0:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bfe7:	29 c1                	sub    %eax,%ecx
  30bfe9:	89 c8                	mov    %ecx,%eax
  30bfeb:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30bff0:	89 50 0c             	mov    %edx,0xc(%eax)
  30bff3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30bff6:	c1 e0 02             	shl    $0x2,%eax
  30bff9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30c000:	29 c2                	sub    %eax,%edx
  30c002:	89 d0                	mov    %edx,%eax
  30c004:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30c009:	8b 40 0c             	mov    0xc(%eax),%eax
  30c00c:	8d 90 a0 0f 00 00    	lea    0xfa0(%eax),%edx
  30c012:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30c015:	c1 e0 02             	shl    $0x2,%eax
  30c018:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30c01f:	29 c1                	sub    %eax,%ecx
  30c021:	89 c8                	mov    %ecx,%eax
  30c023:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30c028:	89 10                	mov    %edx,(%eax)
  30c02a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  30c02e:	b8 0e 00 00 00       	mov    $0xe,%eax
  30c033:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30c038:	ee                   	out    %al,(%dx)
  30c039:	eb 00                	jmp    30c03b <cons_init+0x1d1>
  30c03b:	eb 00                	jmp    30c03d <cons_init+0x1d3>
  30c03d:	b8 d5 03 00 00       	mov    $0x3d5,%eax
  30c042:	89 c2                	mov    %eax,%edx
  30c044:	ec                   	in     (%dx),%al
  30c045:	eb 00                	jmp    30c047 <cons_init+0x1dd>
  30c047:	eb 00                	jmp    30c049 <cons_init+0x1df>
  30c049:	88 45 f6             	mov    %al,-0xa(%ebp)
  30c04c:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  30c050:	88 45 f7             	mov    %al,-0x9(%ebp)
  30c053:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30c057:	0f b6 c0             	movzbl %al,%eax
  30c05a:	c1 e0 09             	shl    $0x9,%eax
  30c05d:	89 c1                	mov    %eax,%ecx
  30c05f:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
  30c063:	b8 0f 00 00 00       	mov    $0xf,%eax
  30c068:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30c06d:	ee                   	out    %al,(%dx)
  30c06e:	eb 00                	jmp    30c070 <cons_init+0x206>
  30c070:	eb 00                	jmp    30c072 <cons_init+0x208>
  30c072:	b8 d5 03 00 00       	mov    $0x3d5,%eax
  30c077:	89 c2                	mov    %eax,%edx
  30c079:	ec                   	in     (%dx),%al
  30c07a:	eb 00                	jmp    30c07c <cons_init+0x212>
  30c07c:	eb 00                	jmp    30c07e <cons_init+0x214>
  30c07e:	88 45 f4             	mov    %al,-0xc(%ebp)
  30c081:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
  30c085:	88 45 f5             	mov    %al,-0xb(%ebp)
  30c088:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  30c08c:	0f b6 c0             	movzbl %al,%eax
  30c08f:	01 c0                	add    %eax,%eax
  30c091:	09 c8                	or     %ecx,%eax
  30c093:	89 c2                	mov    %eax,%edx
  30c095:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30c098:	c1 e0 02             	shl    $0x2,%eax
  30c09b:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30c0a2:	29 c1                	sub    %eax,%ecx
  30c0a4:	89 c8                	mov    %ecx,%eax
  30c0a6:	05 1c 4f 31 00       	add    $0x314f1c,%eax
  30c0ab:	8b 40 04             	mov    0x4(%eax),%eax
  30c0ae:	01 c2                	add    %eax,%edx
  30c0b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30c0b3:	c1 e0 02             	shl    $0x2,%eax
  30c0b6:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30c0bd:	29 c1                	sub    %eax,%ecx
  30c0bf:	89 c8                	mov    %ecx,%eax
  30c0c1:	05 2c 4f 31 00       	add    $0x314f2c,%eax
  30c0c6:	89 50 04             	mov    %edx,0x4(%eax)
  30c0c9:	c9                   	leave  
  30c0ca:	c3                   	ret    

0030c0cb <cons_write>:
  30c0cb:	55                   	push   %ebp
  30c0cc:	89 e5                	mov    %esp,%ebp
  30c0ce:	ff 75 10             	pushl  0x10(%ebp)
  30c0d1:	ff 75 0c             	pushl  0xc(%ebp)
  30c0d4:	6a 00                	push   $0x0
  30c0d6:	e8 c4 f7 ff ff       	call   30b89f <cons_print>
  30c0db:	83 c4 0c             	add    $0xc,%esp
  30c0de:	6a 00                	push   $0x0
  30c0e0:	ff 75 08             	pushl  0x8(%ebp)
  30c0e3:	e8 ac ef ff ff       	call   30b094 <ret>
  30c0e8:	83 c4 08             	add    $0x8,%esp
  30c0eb:	c9                   	leave  
  30c0ec:	c3                   	ret    

0030c0ed <cons_read>:
  30c0ed:	55                   	push   %ebp
  30c0ee:	89 e5                	mov    %esp,%ebp
  30c0f0:	83 ec 08             	sub    $0x8,%esp
  30c0f3:	83 ec 04             	sub    $0x4,%esp
  30c0f6:	ff 75 10             	pushl  0x10(%ebp)
  30c0f9:	ff 75 0c             	pushl  0xc(%ebp)
  30c0fc:	ff 75 08             	pushl  0x8(%ebp)
  30c0ff:	e8 b8 07 00 00       	call   30c8bc <copy_buffer>
  30c104:	83 c4 10             	add    $0x10,%esp
  30c107:	c9                   	leave  
  30c108:	c3                   	ret    

0030c109 <cons_main>:
  30c109:	55                   	push   %ebp
  30c10a:	89 e5                	mov    %esp,%ebp
  30c10c:	57                   	push   %edi
  30c10d:	56                   	push   %esi
  30c10e:	53                   	push   %ebx
  30c10f:	83 ec 1c             	sub    $0x1c,%esp
  30c112:	e8 53 fd ff ff       	call   30be6a <cons_init>
  30c117:	e8 9a 08 00 00       	call   30c9b6 <keyboard_init>
  30c11c:	b8 03 00 00 00       	mov    $0x3,%eax
  30c121:	bb 00 00 00 00       	mov    $0x0,%ebx
  30c126:	b9 ed c0 30 00       	mov    $0x30c0ed,%ecx
  30c12b:	ba 00 00 00 00       	mov    $0x0,%edx
  30c130:	be 00 00 00 00       	mov    $0x0,%esi
  30c135:	bf 00 00 00 00       	mov    $0x0,%edi
  30c13a:	cd 80                	int    $0x80
  30c13c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30c13f:	b8 03 00 00 00       	mov    $0x3,%eax
  30c144:	bb 01 00 00 00       	mov    $0x1,%ebx
  30c149:	b9 cb c0 30 00       	mov    $0x30c0cb,%ecx
  30c14e:	ba 00 00 00 00       	mov    $0x0,%edx
  30c153:	be 00 00 00 00       	mov    $0x0,%esi
  30c158:	bf 00 00 00 00       	mov    $0x0,%edi
  30c15d:	cd 80                	int    $0x80
  30c15f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30c162:	b8 00 00 00 00       	mov    $0x0,%eax
  30c167:	bb 00 00 00 00       	mov    $0x0,%ebx
  30c16c:	b9 00 00 00 00       	mov    $0x0,%ecx
  30c171:	ba 00 00 00 00       	mov    $0x0,%edx
  30c176:	be 00 00 00 00       	mov    $0x0,%esi
  30c17b:	bf 00 00 00 00       	mov    $0x0,%edi
  30c180:	cd 80                	int    $0x80
  30c182:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30c185:	b8 00 00 00 00       	mov    $0x0,%eax
  30c18a:	83 c4 1c             	add    $0x1c,%esp
  30c18d:	5b                   	pop    %ebx
  30c18e:	5e                   	pop    %esi
  30c18f:	5f                   	pop    %edi
  30c190:	5d                   	pop    %ebp
  30c191:	c3                   	ret    
  30c192:	66 90                	xchg   %ax,%ax

0030c194 <ret>:
  30c194:	55                   	push   %ebp
  30c195:	89 e5                	mov    %esp,%ebp
  30c197:	57                   	push   %edi
  30c198:	56                   	push   %esi
  30c199:	53                   	push   %ebx
  30c19a:	83 ec 10             	sub    $0x10,%esp
  30c19d:	b8 02 00 00 00       	mov    $0x2,%eax
  30c1a2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30c1a5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30c1a8:	ba 00 00 00 00       	mov    $0x0,%edx
  30c1ad:	be 00 00 00 00       	mov    $0x0,%esi
  30c1b2:	bf 00 00 00 00       	mov    $0x0,%edi
  30c1b7:	cd 80                	int    $0x80
  30c1b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30c1bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30c1bf:	83 c4 10             	add    $0x10,%esp
  30c1c2:	5b                   	pop    %ebx
  30c1c3:	5e                   	pop    %esi
  30c1c4:	5f                   	pop    %edi
  30c1c5:	5d                   	pop    %ebp
  30c1c6:	c3                   	ret    

0030c1c7 <sl_init>:
  30c1c7:	55                   	push   %ebp
  30c1c8:	89 e5                	mov    %esp,%ebp
  30c1ca:	83 ec 10             	sub    $0x10,%esp
  30c1cd:	8b 45 08             	mov    0x8(%ebp),%eax
  30c1d0:	8d 50 03             	lea    0x3(%eax),%edx
  30c1d3:	b8 80 00 00 00       	mov    $0x80,%eax
  30c1d8:	ee                   	out    %al,(%dx)
  30c1d9:	eb 00                	jmp    30c1db <sl_init+0x14>
  30c1db:	eb 00                	jmp    30c1dd <sl_init+0x16>
  30c1dd:	b8 30 00 00 00       	mov    $0x30,%eax
  30c1e2:	8b 55 08             	mov    0x8(%ebp),%edx
  30c1e5:	ee                   	out    %al,(%dx)
  30c1e6:	eb 00                	jmp    30c1e8 <sl_init+0x21>
  30c1e8:	eb 00                	jmp    30c1ea <sl_init+0x23>
  30c1ea:	8b 45 08             	mov    0x8(%ebp),%eax
  30c1ed:	8d 50 01             	lea    0x1(%eax),%edx
  30c1f0:	b8 00 00 00 00       	mov    $0x0,%eax
  30c1f5:	ee                   	out    %al,(%dx)
  30c1f6:	eb 00                	jmp    30c1f8 <sl_init+0x31>
  30c1f8:	eb 00                	jmp    30c1fa <sl_init+0x33>
  30c1fa:	8b 45 08             	mov    0x8(%ebp),%eax
  30c1fd:	8d 50 03             	lea    0x3(%eax),%edx
  30c200:	b8 03 00 00 00       	mov    $0x3,%eax
  30c205:	ee                   	out    %al,(%dx)
  30c206:	eb 00                	jmp    30c208 <sl_init+0x41>
  30c208:	eb 00                	jmp    30c20a <sl_init+0x43>
  30c20a:	8b 45 08             	mov    0x8(%ebp),%eax
  30c20d:	8d 50 04             	lea    0x4(%eax),%edx
  30c210:	b8 0b 00 00 00       	mov    $0xb,%eax
  30c215:	ee                   	out    %al,(%dx)
  30c216:	eb 00                	jmp    30c218 <sl_init+0x51>
  30c218:	eb 00                	jmp    30c21a <sl_init+0x53>
  30c21a:	8b 45 08             	mov    0x8(%ebp),%eax
  30c21d:	8d 50 01             	lea    0x1(%eax),%edx
  30c220:	b8 0d 00 00 00       	mov    $0xd,%eax
  30c225:	ee                   	out    %al,(%dx)
  30c226:	eb 00                	jmp    30c228 <sl_init+0x61>
  30c228:	eb 00                	jmp    30c22a <sl_init+0x63>
  30c22a:	8b 45 08             	mov    0x8(%ebp),%eax
  30c22d:	89 c2                	mov    %eax,%edx
  30c22f:	ec                   	in     (%dx),%al
  30c230:	88 45 ff             	mov    %al,-0x1(%ebp)
  30c233:	c9                   	leave  
  30c234:	c3                   	ret    

0030c235 <rs_handler>:
  30c235:	55                   	push   %ebp
  30c236:	89 e5                	mov    %esp,%ebp
  30c238:	83 ec 08             	sub    $0x8,%esp
  30c23b:	83 ec 0c             	sub    $0xc,%esp
  30c23e:	6a 00                	push   $0x0
  30c240:	6a 00                	push   $0x0
  30c242:	6a 00                	push   $0x0
  30c244:	6a 06                	push   $0x6
  30c246:	ff 75 08             	pushl  0x8(%ebp)
  30c249:	e8 3f a7 ff ff       	call   30698d <doint>
  30c24e:	83 c4 20             	add    $0x20,%esp
  30c251:	b8 00 00 00 00       	mov    $0x0,%eax
  30c256:	c9                   	leave  
  30c257:	c3                   	ret    

0030c258 <rs_push>:
  30c258:	55                   	push   %ebp
  30c259:	89 e5                	mov    %esp,%ebp
  30c25b:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c260:	85 c0                	test   %eax,%eax
  30c262:	75 12                	jne    30c276 <rs_push+0x1e>
  30c264:	8b 45 08             	mov    0x8(%ebp),%eax
  30c267:	a3 4c 40 31 00       	mov    %eax,0x31404c
  30c26c:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c271:	a3 50 40 31 00       	mov    %eax,0x314050
  30c276:	a1 50 40 31 00       	mov    0x314050,%eax
  30c27b:	8b 55 08             	mov    0x8(%ebp),%edx
  30c27e:	89 50 10             	mov    %edx,0x10(%eax)
  30c281:	8b 45 08             	mov    0x8(%ebp),%eax
  30c284:	a3 50 40 31 00       	mov    %eax,0x314050
  30c289:	a1 50 40 31 00       	mov    0x314050,%eax
  30c28e:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  30c295:	5d                   	pop    %ebp
  30c296:	c3                   	ret    

0030c297 <rs_pop>:
  30c297:	55                   	push   %ebp
  30c298:	89 e5                	mov    %esp,%ebp
  30c29a:	83 ec 18             	sub    $0x18,%esp
  30c29d:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c2a2:	85 c0                	test   %eax,%eax
  30c2a4:	74 25                	je     30c2cb <rs_pop+0x34>
  30c2a6:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c2ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30c2ae:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c2b3:	8b 40 10             	mov    0x10(%eax),%eax
  30c2b6:	a3 4c 40 31 00       	mov    %eax,0x31404c
  30c2bb:	83 ec 08             	sub    $0x8,%esp
  30c2be:	6a 00                	push   $0x0
  30c2c0:	ff 75 f4             	pushl  -0xc(%ebp)
  30c2c3:	e8 27 bb ff ff       	call   307def <kfree_s>
  30c2c8:	83 c4 10             	add    $0x10,%esp
  30c2cb:	c9                   	leave  
  30c2cc:	c3                   	ret    

0030c2cd <rs_write>:
  30c2cd:	55                   	push   %ebp
  30c2ce:	89 e5                	mov    %esp,%ebp
  30c2d0:	83 ec 18             	sub    $0x18,%esp
  30c2d3:	83 ec 0c             	sub    $0xc,%esp
  30c2d6:	6a 14                	push   $0x14
  30c2d8:	e8 a6 b9 ff ff       	call   307c83 <kalloc>
  30c2dd:	83 c4 10             	add    $0x10,%esp
  30c2e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30c2e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  30c2e7:	74 3c                	je     30c325 <rs_write+0x58>
  30c2e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30c2ec:	8b 55 08             	mov    0x8(%ebp),%edx
  30c2ef:	89 10                	mov    %edx,(%eax)
  30c2f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30c2f4:	8b 55 0c             	mov    0xc(%ebp),%edx
  30c2f7:	89 50 0c             	mov    %edx,0xc(%eax)
  30c2fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30c2fd:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  30c304:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30c307:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  30c30e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30c311:	8b 55 10             	mov    0x10(%ebp),%edx
  30c314:	89 50 04             	mov    %edx,0x4(%eax)
  30c317:	83 ec 0c             	sub    $0xc,%esp
  30c31a:	ff 75 f4             	pushl  -0xc(%ebp)
  30c31d:	e8 36 ff ff ff       	call   30c258 <rs_push>
  30c322:	83 c4 10             	add    $0x10,%esp
  30c325:	b8 f9 03 00 00       	mov    $0x3f9,%eax
  30c32a:	89 c2                	mov    %eax,%edx
  30c32c:	ec                   	in     (%dx),%al
  30c32d:	eb 00                	jmp    30c32f <rs_write+0x62>
  30c32f:	eb 00                	jmp    30c331 <rs_write+0x64>
  30c331:	88 45 f3             	mov    %al,-0xd(%ebp)
  30c334:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  30c338:	83 c8 02             	or     $0x2,%eax
  30c33b:	0f b6 c0             	movzbl %al,%eax
  30c33e:	ba f9 03 00 00       	mov    $0x3f9,%edx
  30c343:	ee                   	out    %al,(%dx)
  30c344:	c9                   	leave  
  30c345:	c3                   	ret    

0030c346 <_io>:
  30c346:	55                   	push   %ebp
  30c347:	89 e5                	mov    %esp,%ebp
  30c349:	83 ec 18             	sub    $0x18,%esp
  30c34c:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c351:	85 c0                	test   %eax,%eax
  30c353:	0f 84 2c 01 00 00    	je     30c485 <_io+0x13f>
  30c359:	b8 fa 03 00 00       	mov    $0x3fa,%eax
  30c35e:	89 c2                	mov    %eax,%edx
  30c360:	ec                   	in     (%dx),%al
  30c361:	eb 00                	jmp    30c363 <_io+0x1d>
  30c363:	eb 00                	jmp    30c365 <_io+0x1f>
  30c365:	88 45 f7             	mov    %al,-0x9(%ebp)
  30c368:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30c36c:	0f b6 c0             	movzbl %al,%eax
  30c36f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30c372:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30c375:	83 e0 01             	and    $0x1,%eax
  30c378:	85 c0                	test   %eax,%eax
  30c37a:	0f 85 05 01 00 00    	jne    30c485 <_io+0x13f>
  30c380:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30c383:	83 f8 02             	cmp    $0x2,%eax
  30c386:	74 71                	je     30c3f9 <_io+0xb3>
  30c388:	83 f8 02             	cmp    $0x2,%eax
  30c38b:	7f 09                	jg     30c396 <_io+0x50>
  30c38d:	85 c0                	test   %eax,%eax
  30c38f:	74 14                	je     30c3a5 <_io+0x5f>
  30c391:	e9 ef 00 00 00       	jmp    30c485 <_io+0x13f>
  30c396:	83 f8 04             	cmp    $0x4,%eax
  30c399:	74 32                	je     30c3cd <_io+0x87>
  30c39b:	83 f8 06             	cmp    $0x6,%eax
  30c39e:	74 19                	je     30c3b9 <_io+0x73>
  30c3a0:	e9 e0 00 00 00       	jmp    30c485 <_io+0x13f>
  30c3a5:	b8 fe 03 00 00       	mov    $0x3fe,%eax
  30c3aa:	89 c2                	mov    %eax,%edx
  30c3ac:	ec                   	in     (%dx),%al
  30c3ad:	eb 00                	jmp    30c3af <_io+0x69>
  30c3af:	eb 00                	jmp    30c3b1 <_io+0x6b>
  30c3b1:	88 45 ef             	mov    %al,-0x11(%ebp)
  30c3b4:	e9 cc 00 00 00       	jmp    30c485 <_io+0x13f>
  30c3b9:	b8 fd 03 00 00       	mov    $0x3fd,%eax
  30c3be:	89 c2                	mov    %eax,%edx
  30c3c0:	ec                   	in     (%dx),%al
  30c3c1:	eb 00                	jmp    30c3c3 <_io+0x7d>
  30c3c3:	eb 00                	jmp    30c3c5 <_io+0x7f>
  30c3c5:	88 45 ee             	mov    %al,-0x12(%ebp)
  30c3c8:	e9 b8 00 00 00       	jmp    30c485 <_io+0x13f>
  30c3cd:	b8 f8 03 00 00       	mov    $0x3f8,%eax
  30c3d2:	89 c2                	mov    %eax,%edx
  30c3d4:	ec                   	in     (%dx),%al
  30c3d5:	eb 00                	jmp    30c3d7 <_io+0x91>
  30c3d7:	eb 00                	jmp    30c3d9 <_io+0x93>
  30c3d9:	88 45 ed             	mov    %al,-0x13(%ebp)
  30c3dc:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  30c3e0:	0f b6 c0             	movzbl %al,%eax
  30c3e3:	83 ec 08             	sub    $0x8,%esp
  30c3e6:	50                   	push   %eax
  30c3e7:	68 e4 e1 30 00       	push   $0x30e1e4
  30c3ec:	e8 b7 92 ff ff       	call   3056a8 <printk>
  30c3f1:	83 c4 10             	add    $0x10,%esp
  30c3f4:	e9 8c 00 00 00       	jmp    30c485 <_io+0x13f>
  30c3f9:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c3fe:	85 c0                	test   %eax,%eax
  30c400:	74 5f                	je     30c461 <_io+0x11b>
  30c402:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c407:	8b 50 08             	mov    0x8(%eax),%edx
  30c40a:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c40f:	8b 40 04             	mov    0x4(%eax),%eax
  30c412:	39 c2                	cmp    %eax,%edx
  30c414:	73 2f                	jae    30c445 <_io+0xff>
  30c416:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c41b:	8b 50 0c             	mov    0xc(%eax),%edx
  30c41e:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c423:	8b 40 08             	mov    0x8(%eax),%eax
  30c426:	01 d0                	add    %edx,%eax
  30c428:	0f b6 00             	movzbl (%eax),%eax
  30c42b:	ba f8 03 00 00       	mov    $0x3f8,%edx
  30c430:	ee                   	out    %al,(%dx)
  30c431:	eb 00                	jmp    30c433 <_io+0xed>
  30c433:	eb 00                	jmp    30c435 <_io+0xef>
  30c435:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c43a:	8b 50 08             	mov    0x8(%eax),%edx
  30c43d:	83 c2 01             	add    $0x1,%edx
  30c440:	89 50 08             	mov    %edx,0x8(%eax)
  30c443:	eb 3f                	jmp    30c484 <_io+0x13e>
  30c445:	a1 4c 40 31 00       	mov    0x31404c,%eax
  30c44a:	8b 00                	mov    (%eax),%eax
  30c44c:	83 ec 08             	sub    $0x8,%esp
  30c44f:	6a 00                	push   $0x0
  30c451:	50                   	push   %eax
  30c452:	e8 3d fd ff ff       	call   30c194 <ret>
  30c457:	83 c4 10             	add    $0x10,%esp
  30c45a:	e8 38 fe ff ff       	call   30c297 <rs_pop>
  30c45f:	eb 98                	jmp    30c3f9 <_io+0xb3>
  30c461:	b8 f9 03 00 00       	mov    $0x3f9,%eax
  30c466:	89 c2                	mov    %eax,%edx
  30c468:	ec                   	in     (%dx),%al
  30c469:	eb 00                	jmp    30c46b <_io+0x125>
  30c46b:	eb 00                	jmp    30c46d <_io+0x127>
  30c46d:	88 45 ec             	mov    %al,-0x14(%ebp)
  30c470:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  30c474:	0f b6 c0             	movzbl %al,%eax
  30c477:	83 e0 0d             	and    $0xd,%eax
  30c47a:	ba f9 03 00 00       	mov    $0x3f9,%edx
  30c47f:	ee                   	out    %al,(%dx)
  30c480:	eb 00                	jmp    30c482 <_io+0x13c>
  30c482:	eb 00                	jmp    30c484 <_io+0x13e>
  30c484:	90                   	nop
  30c485:	c9                   	leave  
  30c486:	c3                   	ret    

0030c487 <rs_init>:
  30c487:	55                   	push   %ebp
  30c488:	89 e5                	mov    %esp,%ebp
  30c48a:	57                   	push   %edi
  30c48b:	56                   	push   %esi
  30c48c:	53                   	push   %ebx
  30c48d:	83 ec 1c             	sub    $0x1c,%esp
  30c490:	68 f8 03 00 00       	push   $0x3f8
  30c495:	e8 2d fd ff ff       	call   30c1c7 <sl_init>
  30c49a:	83 c4 04             	add    $0x4,%esp
  30c49d:	b8 03 00 00 00       	mov    $0x3,%eax
  30c4a2:	bb 01 00 00 00       	mov    $0x1,%ebx
  30c4a7:	b9 cd c2 30 00       	mov    $0x30c2cd,%ecx
  30c4ac:	ba 00 00 00 00       	mov    $0x0,%edx
  30c4b1:	be 00 00 00 00       	mov    $0x0,%esi
  30c4b6:	bf 00 00 00 00       	mov    $0x0,%edi
  30c4bb:	cd 80                	int    $0x80
  30c4bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30c4c0:	b8 03 00 00 00       	mov    $0x3,%eax
  30c4c5:	bb 06 00 00 00       	mov    $0x6,%ebx
  30c4ca:	b9 46 c3 30 00       	mov    $0x30c346,%ecx
  30c4cf:	ba 00 00 00 00       	mov    $0x0,%edx
  30c4d4:	be 00 00 00 00       	mov    $0x0,%esi
  30c4d9:	bf 00 00 00 00       	mov    $0x0,%edi
  30c4de:	cd 80                	int    $0x80
  30c4e0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30c4e3:	83 ec 08             	sub    $0x8,%esp
  30c4e6:	68 35 c2 30 00       	push   $0x30c235
  30c4eb:	6a 04                	push   $0x4
  30c4ed:	e8 f6 97 ff ff       	call   305ce8 <put_irq_handler>
  30c4f2:	83 c4 10             	add    $0x10,%esp
  30c4f5:	83 ec 0c             	sub    $0xc,%esp
  30c4f8:	6a 04                	push   $0x4
  30c4fa:	e8 2c 97 ff ff       	call   305c2b <enable_irq>
  30c4ff:	83 c4 10             	add    $0x10,%esp
  30c502:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30c505:	5b                   	pop    %ebx
  30c506:	5e                   	pop    %esi
  30c507:	5f                   	pop    %edi
  30c508:	5d                   	pop    %ebp
  30c509:	c3                   	ret    

0030c50a <rs_main>:
  30c50a:	55                   	push   %ebp
  30c50b:	89 e5                	mov    %esp,%ebp
  30c50d:	57                   	push   %edi
  30c50e:	56                   	push   %esi
  30c50f:	53                   	push   %ebx
  30c510:	83 ec 1c             	sub    $0x1c,%esp
  30c513:	e8 6f ff ff ff       	call   30c487 <rs_init>
  30c518:	b8 00 00 00 00       	mov    $0x0,%eax
  30c51d:	bb 00 00 00 00       	mov    $0x0,%ebx
  30c522:	b9 00 00 00 00       	mov    $0x0,%ecx
  30c527:	ba 00 00 00 00       	mov    $0x0,%edx
  30c52c:	be 00 00 00 00       	mov    $0x0,%esi
  30c531:	bf 00 00 00 00       	mov    $0x0,%edi
  30c536:	cd 80                	int    $0x80
  30c538:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30c53b:	b8 00 00 00 00       	mov    $0x0,%eax
  30c540:	83 c4 1c             	add    $0x1c,%esp
  30c543:	5b                   	pop    %ebx
  30c544:	5e                   	pop    %esi
  30c545:	5f                   	pop    %edi
  30c546:	5d                   	pop    %ebp
  30c547:	c3                   	ret    

0030c548 <ret>:
  30c548:	55                   	push   %ebp
  30c549:	89 e5                	mov    %esp,%ebp
  30c54b:	57                   	push   %edi
  30c54c:	56                   	push   %esi
  30c54d:	53                   	push   %ebx
  30c54e:	83 ec 10             	sub    $0x10,%esp
  30c551:	b8 02 00 00 00       	mov    $0x2,%eax
  30c556:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30c559:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30c55c:	ba 00 00 00 00       	mov    $0x0,%edx
  30c561:	be 00 00 00 00       	mov    $0x0,%esi
  30c566:	bf 00 00 00 00       	mov    $0x0,%edi
  30c56b:	cd 80                	int    $0x80
  30c56d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30c570:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30c573:	83 c4 10             	add    $0x10,%esp
  30c576:	5b                   	pop    %ebx
  30c577:	5e                   	pop    %esi
  30c578:	5f                   	pop    %edi
  30c579:	5d                   	pop    %ebp
  30c57a:	c3                   	ret    

0030c57b <memcpy>:
  30c57b:	55                   	push   %ebp
  30c57c:	89 e5                	mov    %esp,%ebp
  30c57e:	57                   	push   %edi
  30c57f:	56                   	push   %esi
  30c580:	53                   	push   %ebx
  30c581:	8b 45 10             	mov    0x10(%ebp),%eax
  30c584:	8b 55 0c             	mov    0xc(%ebp),%edx
  30c587:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30c58a:	89 c1                	mov    %eax,%ecx
  30c58c:	89 d6                	mov    %edx,%esi
  30c58e:	89 df                	mov    %ebx,%edi
  30c590:	fc                   	cld    
  30c591:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  30c593:	8b 45 08             	mov    0x8(%ebp),%eax
  30c596:	5b                   	pop    %ebx
  30c597:	5e                   	pop    %esi
  30c598:	5f                   	pop    %edi
  30c599:	5d                   	pop    %ebp
  30c59a:	c3                   	ret    

0030c59b <push>:
  30c59b:	55                   	push   %ebp
  30c59c:	89 e5                	mov    %esp,%ebp
  30c59e:	83 ec 04             	sub    $0x4,%esp
  30c5a1:	8b 45 08             	mov    0x8(%ebp),%eax
  30c5a4:	88 45 fc             	mov    %al,-0x4(%ebp)
  30c5a7:	8b 15 40 4f 31 00    	mov    0x314f40,%edx
  30c5ad:	a1 44 4f 31 00       	mov    0x314f44,%eax
  30c5b2:	39 c2                	cmp    %eax,%edx
  30c5b4:	75 0e                	jne    30c5c4 <push+0x29>
  30c5b6:	0f b6 05 48 4f 31 00 	movzbl 0x314f48,%eax
  30c5bd:	83 f0 01             	xor    $0x1,%eax
  30c5c0:	84 c0                	test   %al,%al
  30c5c2:	74 4e                	je     30c612 <push+0x77>
  30c5c4:	a1 40 4f 31 00       	mov    0x314f40,%eax
  30c5c9:	8d 48 01             	lea    0x1(%eax),%ecx
  30c5cc:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  30c5d1:	89 c8                	mov    %ecx,%eax
  30c5d3:	f7 ea                	imul   %edx
  30c5d5:	c1 fa 04             	sar    $0x4,%edx
  30c5d8:	89 c8                	mov    %ecx,%eax
  30c5da:	c1 f8 1f             	sar    $0x1f,%eax
  30c5dd:	29 c2                	sub    %eax,%edx
  30c5df:	89 d0                	mov    %edx,%eax
  30c5e1:	6b c0 32             	imul   $0x32,%eax,%eax
  30c5e4:	29 c1                	sub    %eax,%ecx
  30c5e6:	89 c8                	mov    %ecx,%eax
  30c5e8:	a3 40 4f 31 00       	mov    %eax,0x314f40
  30c5ed:	a1 40 4f 31 00       	mov    0x314f40,%eax
  30c5f2:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
  30c5f6:	88 90 49 4f 31 00    	mov    %dl,0x314f49(%eax)
  30c5fc:	8b 15 40 4f 31 00    	mov    0x314f40,%edx
  30c602:	a1 44 4f 31 00       	mov    0x314f44,%eax
  30c607:	39 c2                	cmp    %eax,%edx
  30c609:	75 07                	jne    30c612 <push+0x77>
  30c60b:	c6 05 48 4f 31 00 01 	movb   $0x1,0x314f48
  30c612:	c9                   	leave  
  30c613:	c3                   	ret    

0030c614 <pop>:
  30c614:	55                   	push   %ebp
  30c615:	89 e5                	mov    %esp,%ebp
  30c617:	83 ec 10             	sub    $0x10,%esp
  30c61a:	c6 45 ff ff          	movb   $0xff,-0x1(%ebp)
  30c61e:	8b 15 44 4f 31 00    	mov    0x314f44,%edx
  30c624:	a1 40 4f 31 00       	mov    0x314f40,%eax
  30c629:	39 c2                	cmp    %eax,%edx
  30c62b:	75 0b                	jne    30c638 <pop+0x24>
  30c62d:	0f b6 05 48 4f 31 00 	movzbl 0x314f48,%eax
  30c634:	84 c0                	test   %al,%al
  30c636:	74 4e                	je     30c686 <pop+0x72>
  30c638:	a1 44 4f 31 00       	mov    0x314f44,%eax
  30c63d:	0f b6 80 49 4f 31 00 	movzbl 0x314f49(%eax),%eax
  30c644:	88 45 ff             	mov    %al,-0x1(%ebp)
  30c647:	a1 44 4f 31 00       	mov    0x314f44,%eax
  30c64c:	8d 48 01             	lea    0x1(%eax),%ecx
  30c64f:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  30c654:	89 c8                	mov    %ecx,%eax
  30c656:	f7 ea                	imul   %edx
  30c658:	c1 fa 04             	sar    $0x4,%edx
  30c65b:	89 c8                	mov    %ecx,%eax
  30c65d:	c1 f8 1f             	sar    $0x1f,%eax
  30c660:	29 c2                	sub    %eax,%edx
  30c662:	89 d0                	mov    %edx,%eax
  30c664:	6b c0 32             	imul   $0x32,%eax,%eax
  30c667:	29 c1                	sub    %eax,%ecx
  30c669:	89 c8                	mov    %ecx,%eax
  30c66b:	a3 44 4f 31 00       	mov    %eax,0x314f44
  30c670:	8b 15 44 4f 31 00    	mov    0x314f44,%edx
  30c676:	a1 40 4f 31 00       	mov    0x314f40,%eax
  30c67b:	39 c2                	cmp    %eax,%edx
  30c67d:	75 07                	jne    30c686 <pop+0x72>
  30c67f:	c6 05 48 4f 31 00 00 	movb   $0x0,0x314f48
  30c686:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  30c68a:	c9                   	leave  
  30c68b:	c3                   	ret    

0030c68c <keyboard_handler>:
  30c68c:	55                   	push   %ebp
  30c68d:	89 e5                	mov    %esp,%ebp
  30c68f:	83 ec 18             	sub    $0x18,%esp
  30c692:	b8 60 00 00 00       	mov    $0x60,%eax
  30c697:	89 c2                	mov    %eax,%edx
  30c699:	ec                   	in     (%dx),%al
  30c69a:	88 45 f7             	mov    %al,-0x9(%ebp)
  30c69d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30c6a1:	88 45 f6             	mov    %al,-0xa(%ebp)
  30c6a4:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  30c6a8:	50                   	push   %eax
  30c6a9:	e8 ed fe ff ff       	call   30c59b <push>
  30c6ae:	83 c4 04             	add    $0x4,%esp
  30c6b1:	83 ec 0c             	sub    $0xc,%esp
  30c6b4:	6a 00                	push   $0x0
  30c6b6:	6a 00                	push   $0x0
  30c6b8:	6a 00                	push   $0x0
  30c6ba:	6a 06                	push   $0x6
  30c6bc:	ff 75 08             	pushl  0x8(%ebp)
  30c6bf:	e8 c9 a2 ff ff       	call   30698d <doint>
  30c6c4:	83 c4 20             	add    $0x20,%esp
  30c6c7:	b8 00 00 00 00       	mov    $0x0,%eax
  30c6cc:	c9                   	leave  
  30c6cd:	c3                   	ret    

0030c6ce <_ispress>:
  30c6ce:	55                   	push   %ebp
  30c6cf:	89 e5                	mov    %esp,%ebp
  30c6d1:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c6d6:	50                   	push   %eax
  30c6d7:	ff 75 08             	pushl  0x8(%ebp)
  30c6da:	e8 69 fe ff ff       	call   30c548 <ret>
  30c6df:	83 c4 08             	add    $0x8,%esp
  30c6e2:	c9                   	leave  
  30c6e3:	c3                   	ret    

0030c6e4 <_input>:
  30c6e4:	55                   	push   %ebp
  30c6e5:	89 e5                	mov    %esp,%ebp
  30c6e7:	83 ec 18             	sub    $0x18,%esp
  30c6ea:	e8 25 ff ff ff       	call   30c614 <pop>
  30c6ef:	0f b6 c0             	movzbl %al,%eax
  30c6f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30c6f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30c6f8:	83 f8 2a             	cmp    $0x2a,%eax
  30c6fb:	0f 84 87 00 00 00    	je     30c788 <_input+0xa4>
  30c701:	83 f8 2a             	cmp    $0x2a,%eax
  30c704:	77 39                	ja     30c73f <_input+0x5b>
  30c706:	83 f8 1b             	cmp    $0x1b,%eax
  30c709:	77 1d                	ja     30c728 <_input+0x44>
  30c70b:	83 f8 0f             	cmp    $0xf,%eax
  30c70e:	0f 83 c4 00 00 00    	jae    30c7d8 <_input+0xf4>
  30c714:	83 f8 01             	cmp    $0x1,%eax
  30c717:	0f 82 9d 01 00 00    	jb     30c8ba <_input+0x1d6>
  30c71d:	83 f8 0d             	cmp    $0xd,%eax
  30c720:	0f 86 b2 00 00 00    	jbe    30c7d8 <_input+0xf4>
  30c726:	eb 7e                	jmp    30c7a6 <_input+0xc2>
  30c728:	83 f8 1c             	cmp    $0x1c,%eax
  30c72b:	0f 84 04 01 00 00    	je     30c835 <_input+0x151>
  30c731:	83 f8 1e             	cmp    $0x1e,%eax
  30c734:	0f 82 80 01 00 00    	jb     30c8ba <_input+0x1d6>
  30c73a:	e9 99 00 00 00       	jmp    30c7d8 <_input+0xf4>
  30c73f:	83 f8 39             	cmp    $0x39,%eax
  30c742:	0f 84 90 00 00 00    	je     30c7d8 <_input+0xf4>
  30c748:	83 f8 39             	cmp    $0x39,%eax
  30c74b:	77 13                	ja     30c760 <_input+0x7c>
  30c74d:	83 f8 35             	cmp    $0x35,%eax
  30c750:	0f 86 82 00 00 00    	jbe    30c7d8 <_input+0xf4>
  30c756:	83 f8 36             	cmp    $0x36,%eax
  30c759:	74 2d                	je     30c788 <_input+0xa4>
  30c75b:	e9 5a 01 00 00       	jmp    30c8ba <_input+0x1d6>
  30c760:	3d aa 00 00 00       	cmp    $0xaa,%eax
  30c765:	74 30                	je     30c797 <_input+0xb3>
  30c767:	3d aa 00 00 00       	cmp    $0xaa,%eax
  30c76c:	77 0e                	ja     30c77c <_input+0x98>
  30c76e:	83 e8 47             	sub    $0x47,%eax
  30c771:	83 f8 0c             	cmp    $0xc,%eax
  30c774:	0f 87 40 01 00 00    	ja     30c8ba <_input+0x1d6>
  30c77a:	eb 5c                	jmp    30c7d8 <_input+0xf4>
  30c77c:	3d b6 00 00 00       	cmp    $0xb6,%eax
  30c781:	74 14                	je     30c797 <_input+0xb3>
  30c783:	e9 32 01 00 00       	jmp    30c8ba <_input+0x1d6>
  30c788:	c7 05 54 21 31 00 00 	movl   $0x30e600,0x312154
  30c78f:	e6 30 00 
  30c792:	e9 23 01 00 00       	jmp    30c8ba <_input+0x1d6>
  30c797:	c7 05 54 21 31 00 00 	movl   $0x30e200,0x312154
  30c79e:	e2 30 00 
  30c7a1:	e9 14 01 00 00       	jmp    30c8ba <_input+0x1d6>
  30c7a6:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c7ab:	85 c0                	test   %eax,%eax
  30c7ad:	74 24                	je     30c7d3 <_input+0xef>
  30c7af:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c7b4:	83 e8 01             	sub    $0x1,%eax
  30c7b7:	a3 c0 41 31 00       	mov    %eax,0x3141c0
  30c7bc:	83 ec 08             	sub    $0x8,%esp
  30c7bf:	6a 08                	push   $0x8
  30c7c1:	68 00 ea 30 00       	push   $0x30ea00
  30c7c6:	e8 dd 8e ff ff       	call   3056a8 <printk>
  30c7cb:	83 c4 10             	add    $0x10,%esp
  30c7ce:	e9 e7 00 00 00       	jmp    30c8ba <_input+0x1d6>
  30c7d3:	e9 e2 00 00 00       	jmp    30c8ba <_input+0x1d6>
  30c7d8:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c7dd:	3d fe 00 00 00       	cmp    $0xfe,%eax
  30c7e2:	77 4c                	ja     30c830 <_input+0x14c>
  30c7e4:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c7e9:	8d 50 01             	lea    0x1(%eax),%edx
  30c7ec:	89 15 c0 41 31 00    	mov    %edx,0x3141c0
  30c7f2:	8b 15 54 21 31 00    	mov    0x312154,%edx
  30c7f8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  30c7fb:	c1 e1 02             	shl    $0x2,%ecx
  30c7fe:	01 ca                	add    %ecx,%edx
  30c800:	8b 12                	mov    (%edx),%edx
  30c802:	88 90 c0 40 31 00    	mov    %dl,0x3140c0(%eax)
  30c808:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c80d:	83 e8 01             	sub    $0x1,%eax
  30c810:	0f b6 80 c0 40 31 00 	movzbl 0x3140c0(%eax),%eax
  30c817:	0f be c0             	movsbl %al,%eax
  30c81a:	83 ec 08             	sub    $0x8,%esp
  30c81d:	50                   	push   %eax
  30c81e:	68 00 ea 30 00       	push   $0x30ea00
  30c823:	e8 80 8e ff ff       	call   3056a8 <printk>
  30c828:	83 c4 10             	add    $0x10,%esp
  30c82b:	e9 8a 00 00 00       	jmp    30c8ba <_input+0x1d6>
  30c830:	e9 85 00 00 00       	jmp    30c8ba <_input+0x1d6>
  30c835:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c83a:	3d fe 00 00 00       	cmp    $0xfe,%eax
  30c83f:	77 47                	ja     30c888 <_input+0x1a4>
  30c841:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c846:	8d 50 01             	lea    0x1(%eax),%edx
  30c849:	89 15 c0 41 31 00    	mov    %edx,0x3141c0
  30c84f:	8b 15 54 21 31 00    	mov    0x312154,%edx
  30c855:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  30c858:	c1 e1 02             	shl    $0x2,%ecx
  30c85b:	01 ca                	add    %ecx,%edx
  30c85d:	8b 12                	mov    (%edx),%edx
  30c85f:	88 90 c0 40 31 00    	mov    %dl,0x3140c0(%eax)
  30c865:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c86a:	83 e8 01             	sub    $0x1,%eax
  30c86d:	0f b6 80 c0 40 31 00 	movzbl 0x3140c0(%eax),%eax
  30c874:	0f be c0             	movsbl %al,%eax
  30c877:	83 ec 08             	sub    $0x8,%esp
  30c87a:	50                   	push   %eax
  30c87b:	68 00 ea 30 00       	push   $0x30ea00
  30c880:	e8 23 8e ff ff       	call   3056a8 <printk>
  30c885:	83 c4 10             	add    $0x10,%esp
  30c888:	a1 c4 41 31 00       	mov    0x3141c4,%eax
  30c88d:	85 c0                	test   %eax,%eax
  30c88f:	74 28                	je     30c8b9 <_input+0x1d5>
  30c891:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c896:	85 c0                	test   %eax,%eax
  30c898:	74 1f                	je     30c8b9 <_input+0x1d5>
  30c89a:	8b 0d c8 41 31 00    	mov    0x3141c8,%ecx
  30c8a0:	8b 15 cc 41 31 00    	mov    0x3141cc,%edx
  30c8a6:	a1 c4 41 31 00       	mov    0x3141c4,%eax
  30c8ab:	83 ec 04             	sub    $0x4,%esp
  30c8ae:	51                   	push   %ecx
  30c8af:	52                   	push   %edx
  30c8b0:	50                   	push   %eax
  30c8b1:	e8 06 00 00 00       	call   30c8bc <copy_buffer>
  30c8b6:	83 c4 10             	add    $0x10,%esp
  30c8b9:	90                   	nop
  30c8ba:	c9                   	leave  
  30c8bb:	c3                   	ret    

0030c8bc <copy_buffer>:
  30c8bc:	55                   	push   %ebp
  30c8bd:	89 e5                	mov    %esp,%ebp
  30c8bf:	83 ec 10             	sub    $0x10,%esp
  30c8c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30c8c9:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c8ce:	85 c0                	test   %eax,%eax
  30c8d0:	75 1d                	jne    30c8ef <copy_buffer+0x33>
  30c8d2:	8b 45 08             	mov    0x8(%ebp),%eax
  30c8d5:	a3 c4 41 31 00       	mov    %eax,0x3141c4
  30c8da:	8b 45 10             	mov    0x10(%ebp),%eax
  30c8dd:	a3 c8 41 31 00       	mov    %eax,0x3141c8
  30c8e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  30c8e5:	a3 cc 41 31 00       	mov    %eax,0x3141cc
  30c8ea:	e9 a4 00 00 00       	jmp    30c993 <copy_buffer+0xd7>
  30c8ef:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c8f4:	39 45 10             	cmp    %eax,0x10(%ebp)
  30c8f7:	72 2a                	jb     30c923 <copy_buffer+0x67>
  30c8f9:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c8fe:	50                   	push   %eax
  30c8ff:	68 c0 40 31 00       	push   $0x3140c0
  30c904:	ff 75 0c             	pushl  0xc(%ebp)
  30c907:	e8 6f fc ff ff       	call   30c57b <memcpy>
  30c90c:	83 c4 0c             	add    $0xc,%esp
  30c90f:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c914:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30c917:	c7 05 c0 41 31 00 00 	movl   $0x0,0x3141c0
  30c91e:	00 00 00 
  30c921:	eb 44                	jmp    30c967 <copy_buffer+0xab>
  30c923:	8b 45 10             	mov    0x10(%ebp),%eax
  30c926:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30c929:	8b 45 10             	mov    0x10(%ebp),%eax
  30c92c:	50                   	push   %eax
  30c92d:	68 c0 40 31 00       	push   $0x3140c0
  30c932:	ff 75 0c             	pushl  0xc(%ebp)
  30c935:	e8 41 fc ff ff       	call   30c57b <memcpy>
  30c93a:	83 c4 0c             	add    $0xc,%esp
  30c93d:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c942:	2b 45 10             	sub    0x10(%ebp),%eax
  30c945:	a3 c0 41 31 00       	mov    %eax,0x3141c0
  30c94a:	a1 c0 41 31 00       	mov    0x3141c0,%eax
  30c94f:	8b 55 10             	mov    0x10(%ebp),%edx
  30c952:	81 c2 c0 40 31 00    	add    $0x3140c0,%edx
  30c958:	50                   	push   %eax
  30c959:	52                   	push   %edx
  30c95a:	68 c0 40 31 00       	push   $0x3140c0
  30c95f:	e8 17 fc ff ff       	call   30c57b <memcpy>
  30c964:	83 c4 0c             	add    $0xc,%esp
  30c967:	ff 75 fc             	pushl  -0x4(%ebp)
  30c96a:	ff 75 08             	pushl  0x8(%ebp)
  30c96d:	e8 d6 fb ff ff       	call   30c548 <ret>
  30c972:	83 c4 08             	add    $0x8,%esp
  30c975:	c7 05 c4 41 31 00 00 	movl   $0x0,0x3141c4
  30c97c:	00 00 00 
  30c97f:	c7 05 c8 41 31 00 00 	movl   $0x0,0x3141c8
  30c986:	00 00 00 
  30c989:	c7 05 cc 41 31 00 00 	movl   $0x0,0x3141cc
  30c990:	00 00 00 
  30c993:	c9                   	leave  
  30c994:	c3                   	ret    

0030c995 <_reset>:
  30c995:	55                   	push   %ebp
  30c996:	89 e5                	mov    %esp,%ebp
  30c998:	b8 fe 00 00 00       	mov    $0xfe,%eax
  30c99d:	ba 64 00 00 00       	mov    $0x64,%edx
  30c9a2:	ee                   	out    %al,(%dx)
  30c9a3:	eb 00                	jmp    30c9a5 <_reset+0x10>
  30c9a5:	eb 00                	jmp    30c9a7 <_reset+0x12>
  30c9a7:	6a 00                	push   $0x0
  30c9a9:	ff 75 08             	pushl  0x8(%ebp)
  30c9ac:	e8 97 fb ff ff       	call   30c548 <ret>
  30c9b1:	83 c4 08             	add    $0x8,%esp
  30c9b4:	c9                   	leave  
  30c9b5:	c3                   	ret    

0030c9b6 <keyboard_init>:
  30c9b6:	55                   	push   %ebp
  30c9b7:	89 e5                	mov    %esp,%ebp
  30c9b9:	57                   	push   %edi
  30c9ba:	56                   	push   %esi
  30c9bb:	53                   	push   %ebx
  30c9bc:	83 ec 1c             	sub    $0x1c,%esp
  30c9bf:	c7 05 44 4f 31 00 00 	movl   $0x0,0x314f44
  30c9c6:	00 00 00 
  30c9c9:	a1 44 4f 31 00       	mov    0x314f44,%eax
  30c9ce:	a3 40 4f 31 00       	mov    %eax,0x314f40
  30c9d3:	c6 05 48 4f 31 00 00 	movb   $0x0,0x314f48
  30c9da:	b8 03 00 00 00       	mov    $0x3,%eax
  30c9df:	bb 06 00 00 00       	mov    $0x6,%ebx
  30c9e4:	b9 e4 c6 30 00       	mov    $0x30c6e4,%ecx
  30c9e9:	ba 00 00 00 00       	mov    $0x0,%edx
  30c9ee:	be 00 00 00 00       	mov    $0x0,%esi
  30c9f3:	bf 00 00 00 00       	mov    $0x0,%edi
  30c9f8:	cd 80                	int    $0x80
  30c9fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30c9fd:	b8 03 00 00 00       	mov    $0x3,%eax
  30ca02:	bb 03 00 00 00       	mov    $0x3,%ebx
  30ca07:	b9 95 c9 30 00       	mov    $0x30c995,%ecx
  30ca0c:	ba 00 00 00 00       	mov    $0x0,%edx
  30ca11:	be 00 00 00 00       	mov    $0x0,%esi
  30ca16:	bf 00 00 00 00       	mov    $0x0,%edi
  30ca1b:	cd 80                	int    $0x80
  30ca1d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30ca20:	b8 03 00 00 00       	mov    $0x3,%eax
  30ca25:	bb 0a 00 00 00       	mov    $0xa,%ebx
  30ca2a:	b9 ce c6 30 00       	mov    $0x30c6ce,%ecx
  30ca2f:	ba 00 00 00 00       	mov    $0x0,%edx
  30ca34:	be 00 00 00 00       	mov    $0x0,%esi
  30ca39:	bf 00 00 00 00       	mov    $0x0,%edi
  30ca3e:	cd 80                	int    $0x80
  30ca40:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30ca43:	83 ec 08             	sub    $0x8,%esp
  30ca46:	68 8c c6 30 00       	push   $0x30c68c
  30ca4b:	6a 01                	push   $0x1
  30ca4d:	e8 96 92 ff ff       	call   305ce8 <put_irq_handler>
  30ca52:	83 c4 10             	add    $0x10,%esp
  30ca55:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30ca58:	5b                   	pop    %ebx
  30ca59:	5e                   	pop    %esi
  30ca5a:	5f                   	pop    %edi
  30ca5b:	5d                   	pop    %ebp
  30ca5c:	c3                   	ret    
  30ca5d:	66 90                	xchg   %ax,%ax
  30ca5f:	90                   	nop

0030ca60 <strcpy>:
  30ca60:	55                   	push   %ebp
  30ca61:	89 e5                	mov    %esp,%ebp
  30ca63:	57                   	push   %edi
  30ca64:	56                   	push   %esi
  30ca65:	8b 55 0c             	mov    0xc(%ebp),%edx
  30ca68:	8b 4d 08             	mov    0x8(%ebp),%ecx
  30ca6b:	89 d6                	mov    %edx,%esi
  30ca6d:	89 cf                	mov    %ecx,%edi
  30ca6f:	fc                   	cld    
  30ca70:	ac                   	lods   %ds:(%esi),%al
  30ca71:	aa                   	stos   %al,%es:(%edi)
  30ca72:	84 c0                	test   %al,%al
  30ca74:	75 fa                	jne    30ca70 <strcpy+0x10>
  30ca76:	8b 45 08             	mov    0x8(%ebp),%eax
  30ca79:	5e                   	pop    %esi
  30ca7a:	5f                   	pop    %edi
  30ca7b:	5d                   	pop    %ebp
  30ca7c:	c3                   	ret    

0030ca7d <strcat>:
  30ca7d:	55                   	push   %ebp
  30ca7e:	89 e5                	mov    %esp,%ebp
  30ca80:	57                   	push   %edi
  30ca81:	56                   	push   %esi
  30ca82:	53                   	push   %ebx
  30ca83:	8b 55 0c             	mov    0xc(%ebp),%edx
  30ca86:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30ca89:	b8 00 00 00 00       	mov    $0x0,%eax
  30ca8e:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30ca93:	89 d6                	mov    %edx,%esi
  30ca95:	89 df                	mov    %ebx,%edi
  30ca97:	fc                   	cld    
  30ca98:	f2 ae                	repnz scas %es:(%edi),%al
  30ca9a:	4f                   	dec    %edi
  30ca9b:	ac                   	lods   %ds:(%esi),%al
  30ca9c:	aa                   	stos   %al,%es:(%edi)
  30ca9d:	84 c0                	test   %al,%al
  30ca9f:	75 fa                	jne    30ca9b <strcat+0x1e>
  30caa1:	8b 45 08             	mov    0x8(%ebp),%eax
  30caa4:	5b                   	pop    %ebx
  30caa5:	5e                   	pop    %esi
  30caa6:	5f                   	pop    %edi
  30caa7:	5d                   	pop    %ebp
  30caa8:	c3                   	ret    

0030caa9 <strlen>:
  30caa9:	55                   	push   %ebp
  30caaa:	89 e5                	mov    %esp,%ebp
  30caac:	57                   	push   %edi
  30caad:	8b 55 08             	mov    0x8(%ebp),%edx
  30cab0:	b8 00 00 00 00       	mov    $0x0,%eax
  30cab5:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30caba:	89 d7                	mov    %edx,%edi
  30cabc:	fc                   	cld    
  30cabd:	f2 ae                	repnz scas %es:(%edi),%al
  30cabf:	f7 d1                	not    %ecx
  30cac1:	49                   	dec    %ecx
  30cac2:	89 c8                	mov    %ecx,%eax
  30cac4:	5f                   	pop    %edi
  30cac5:	5d                   	pop    %ebp
  30cac6:	c3                   	ret    

0030cac7 <exec>:
  30cac7:	55                   	push   %ebp
  30cac8:	89 e5                	mov    %esp,%ebp
  30caca:	57                   	push   %edi
  30cacb:	56                   	push   %esi
  30cacc:	53                   	push   %ebx
  30cacd:	81 ec bc 00 00 00    	sub    $0xbc,%esp
  30cad3:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  30cada:	c7 85 43 ff ff ff 2f 	movl   $0x6e69622f,-0xbd(%ebp)
  30cae1:	62 69 6e 
  30cae4:	c7 85 47 ff ff ff 2f 	movl   $0x2f,-0xb9(%ebp)
  30caeb:	00 00 00 
  30caee:	8d 85 4b ff ff ff    	lea    -0xb5(%ebp),%eax
  30caf4:	ba 75 00 00 00       	mov    $0x75,%edx
  30caf9:	be 00 00 00 00       	mov    $0x0,%esi
  30cafe:	89 30                	mov    %esi,(%eax)
  30cb00:	89 74 10 fc          	mov    %esi,-0x4(%eax,%edx,1)
  30cb04:	8d 58 04             	lea    0x4(%eax),%ebx
  30cb07:	83 e3 fc             	and    $0xfffffffc,%ebx
  30cb0a:	29 d8                	sub    %ebx,%eax
  30cb0c:	01 c2                	add    %eax,%edx
  30cb0e:	83 e2 fc             	and    $0xfffffffc,%edx
  30cb11:	c1 ea 02             	shr    $0x2,%edx
  30cb14:	89 df                	mov    %ebx,%edi
  30cb16:	89 d1                	mov    %edx,%ecx
  30cb18:	89 f0                	mov    %esi,%eax
  30cb1a:	f3 ab                	rep stos %eax,%es:(%edi)
  30cb1c:	8b 45 08             	mov    0x8(%ebp),%eax
  30cb1f:	0f b6 00             	movzbl (%eax),%eax
  30cb22:	3c 2e                	cmp    $0x2e,%al
  30cb24:	74 0a                	je     30cb30 <exec+0x69>
  30cb26:	8b 45 08             	mov    0x8(%ebp),%eax
  30cb29:	0f b6 00             	movzbl (%eax),%eax
  30cb2c:	3c 2f                	cmp    $0x2f,%al
  30cb2e:	75 14                	jne    30cb44 <exec+0x7d>
  30cb30:	ff 75 08             	pushl  0x8(%ebp)
  30cb33:	8d 85 43 ff ff ff    	lea    -0xbd(%ebp),%eax
  30cb39:	50                   	push   %eax
  30cb3a:	e8 21 ff ff ff       	call   30ca60 <strcpy>
  30cb3f:	83 c4 08             	add    $0x8,%esp
  30cb42:	eb 12                	jmp    30cb56 <exec+0x8f>
  30cb44:	ff 75 08             	pushl  0x8(%ebp)
  30cb47:	8d 85 43 ff ff ff    	lea    -0xbd(%ebp),%eax
  30cb4d:	50                   	push   %eax
  30cb4e:	e8 2a ff ff ff       	call   30ca7d <strcat>
  30cb53:	83 c4 08             	add    $0x8,%esp
  30cb56:	83 ec 08             	sub    $0x8,%esp
  30cb59:	6a 00                	push   $0x0
  30cb5b:	8d 85 43 ff ff ff    	lea    -0xbd(%ebp),%eax
  30cb61:	50                   	push   %eax
  30cb62:	e8 93 02 00 00       	call   30cdfa <open>
  30cb67:	83 c4 10             	add    $0x10,%esp
  30cb6a:	89 45 d8             	mov    %eax,-0x28(%ebp)
  30cb6d:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
  30cb71:	75 05                	jne    30cb78 <exec+0xb1>
  30cb73:	e9 e1 00 00 00       	jmp    30cc59 <exec+0x192>
  30cb78:	8b 45 d8             	mov    -0x28(%ebp),%eax
  30cb7b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  30cb7e:	b8 1f 00 00 00       	mov    $0x1f,%eax
  30cb83:	83 7d 0c 1f          	cmpl   $0x1f,0xc(%ebp)
  30cb87:	0f 4e 45 0c          	cmovle 0xc(%ebp),%eax
  30cb8b:	89 45 d0             	mov    %eax,-0x30(%ebp)
  30cb8e:	b8 04 00 00 00       	mov    $0x4,%eax
  30cb93:	bb 01 00 00 00       	mov    $0x1,%ebx
  30cb98:	b9 00 00 00 00       	mov    $0x0,%ecx
  30cb9d:	ba 00 00 00 00       	mov    $0x0,%edx
  30cba2:	be 00 00 00 00       	mov    $0x0,%esi
  30cba7:	bf 00 00 00 00       	mov    $0x0,%edi
  30cbac:	cd 80                	int    $0x80
  30cbae:	89 45 cc             	mov    %eax,-0x34(%ebp)
  30cbb1:	8b 45 cc             	mov    -0x34(%ebp),%eax
  30cbb4:	89 45 c8             	mov    %eax,-0x38(%ebp)
  30cbb7:	8b 45 c8             	mov    -0x38(%ebp),%eax
  30cbba:	83 e8 80             	sub    $0xffffff80,%eax
  30cbbd:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30cbc0:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  30cbc7:	eb 44                	jmp    30cc0d <exec+0x146>
  30cbc9:	8b 45 c8             	mov    -0x38(%ebp),%eax
  30cbcc:	8b 55 dc             	mov    -0x24(%ebp),%edx
  30cbcf:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  30cbd2:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  30cbd5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30cbd8:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30cbdf:	8b 45 10             	mov    0x10(%ebp),%eax
  30cbe2:	01 d0                	add    %edx,%eax
  30cbe4:	8b 00                	mov    (%eax),%eax
  30cbe6:	83 ec 08             	sub    $0x8,%esp
  30cbe9:	50                   	push   %eax
  30cbea:	ff 75 e0             	pushl  -0x20(%ebp)
  30cbed:	e8 6e fe ff ff       	call   30ca60 <strcpy>
  30cbf2:	83 c4 10             	add    $0x10,%esp
  30cbf5:	83 ec 0c             	sub    $0xc,%esp
  30cbf8:	ff 75 e0             	pushl  -0x20(%ebp)
  30cbfb:	e8 a9 fe ff ff       	call   30caa9 <strlen>
  30cc00:	83 c4 10             	add    $0x10,%esp
  30cc03:	83 c0 01             	add    $0x1,%eax
  30cc06:	01 45 e0             	add    %eax,-0x20(%ebp)
  30cc09:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
  30cc0d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30cc10:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  30cc13:	72 b4                	jb     30cbc9 <exec+0x102>
  30cc15:	b8 01 00 00 00       	mov    $0x1,%eax
  30cc1a:	bb 03 00 00 00       	mov    $0x3,%ebx
  30cc1f:	b9 0b 00 00 00       	mov    $0xb,%ecx
  30cc24:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  30cc27:	8b 75 0c             	mov    0xc(%ebp),%esi
  30cc2a:	8b 7d c8             	mov    -0x38(%ebp),%edi
  30cc2d:	cd 80                	int    $0x80
  30cc2f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  30cc32:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  30cc35:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30cc38:	b8 04 00 00 00       	mov    $0x4,%eax
  30cc3d:	bb 00 00 00 00       	mov    $0x0,%ebx
  30cc42:	8b 4d c8             	mov    -0x38(%ebp),%ecx
  30cc45:	ba 00 00 00 00       	mov    $0x0,%edx
  30cc4a:	be 00 00 00 00       	mov    $0x0,%esi
  30cc4f:	bf 00 00 00 00       	mov    $0x0,%edi
  30cc54:	cd 80                	int    $0x80
  30cc56:	89 45 c0             	mov    %eax,-0x40(%ebp)
  30cc59:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30cc5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30cc5f:	5b                   	pop    %ebx
  30cc60:	5e                   	pop    %esi
  30cc61:	5f                   	pop    %edi
  30cc62:	5d                   	pop    %ebp
  30cc63:	c3                   	ret    

0030cc64 <execvp>:
  30cc64:	55                   	push   %ebp
  30cc65:	89 e5                	mov    %esp,%ebp
  30cc67:	83 ec 18             	sub    $0x18,%esp
  30cc6a:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  30cc71:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  30cc78:	eb 32                	jmp    30ccac <execvp+0x48>
  30cc7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30cc7d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30cc84:	8b 45 0c             	mov    0xc(%ebp),%eax
  30cc87:	01 d0                	add    %edx,%eax
  30cc89:	8b 00                	mov    (%eax),%eax
  30cc8b:	85 c0                	test   %eax,%eax
  30cc8d:	75 19                	jne    30cca8 <execvp+0x44>
  30cc8f:	83 ec 04             	sub    $0x4,%esp
  30cc92:	ff 75 0c             	pushl  0xc(%ebp)
  30cc95:	ff 75 f0             	pushl  -0x10(%ebp)
  30cc98:	ff 75 08             	pushl  0x8(%ebp)
  30cc9b:	e8 27 fe ff ff       	call   30cac7 <exec>
  30cca0:	83 c4 10             	add    $0x10,%esp
  30cca3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30cca6:	eb 0a                	jmp    30ccb2 <execvp+0x4e>
  30cca8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  30ccac:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  30ccb0:	7e c8                	jle    30cc7a <execvp+0x16>
  30ccb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30ccb5:	c9                   	leave  
  30ccb6:	c3                   	ret    
  30ccb7:	90                   	nop

0030ccb8 <lseek>:
  30ccb8:	55                   	push   %ebp
  30ccb9:	89 e5                	mov    %esp,%ebp
  30ccbb:	57                   	push   %edi
  30ccbc:	56                   	push   %esi
  30ccbd:	53                   	push   %ebx
  30ccbe:	83 ec 10             	sub    $0x10,%esp
  30ccc1:	b8 01 00 00 00       	mov    $0x1,%eax
  30ccc6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30ccc9:	b9 0c 00 00 00       	mov    $0xc,%ecx
  30ccce:	8b 55 10             	mov    0x10(%ebp),%edx
  30ccd1:	be 00 00 00 00       	mov    $0x0,%esi
  30ccd6:	8b 7d 0c             	mov    0xc(%ebp),%edi
  30ccd9:	cd 80                	int    $0x80
  30ccdb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30ccde:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30cce1:	83 c4 10             	add    $0x10,%esp
  30cce4:	5b                   	pop    %ebx
  30cce5:	5e                   	pop    %esi
  30cce6:	5f                   	pop    %edi
  30cce7:	5d                   	pop    %ebp
  30cce8:	c3                   	ret    
  30cce9:	66 90                	xchg   %ax,%ax
  30cceb:	90                   	nop

0030ccec <fork>:
  30ccec:	55                   	push   %ebp
  30cced:	89 e5                	mov    %esp,%ebp
  30ccef:	57                   	push   %edi
  30ccf0:	56                   	push   %esi
  30ccf1:	53                   	push   %ebx
  30ccf2:	83 ec 10             	sub    $0x10,%esp
  30ccf5:	b8 01 00 00 00       	mov    $0x1,%eax
  30ccfa:	bb 03 00 00 00       	mov    $0x3,%ebx
  30ccff:	b9 04 00 00 00       	mov    $0x4,%ecx
  30cd04:	ba 00 00 00 00       	mov    $0x0,%edx
  30cd09:	be 00 00 00 00       	mov    $0x0,%esi
  30cd0e:	bf 00 00 00 00       	mov    $0x0,%edi
  30cd13:	cd 80                	int    $0x80
  30cd15:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30cd18:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30cd1b:	83 c4 10             	add    $0x10,%esp
  30cd1e:	5b                   	pop    %ebx
  30cd1f:	5e                   	pop    %esi
  30cd20:	5f                   	pop    %edi
  30cd21:	5d                   	pop    %ebp
  30cd22:	c3                   	ret    
  30cd23:	90                   	nop

0030cd24 <memcpy>:
  30cd24:	55                   	push   %ebp
  30cd25:	89 e5                	mov    %esp,%ebp
  30cd27:	57                   	push   %edi
  30cd28:	56                   	push   %esi
  30cd29:	53                   	push   %ebx
  30cd2a:	8b 45 10             	mov    0x10(%ebp),%eax
  30cd2d:	8b 55 0c             	mov    0xc(%ebp),%edx
  30cd30:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30cd33:	89 c1                	mov    %eax,%ecx
  30cd35:	89 d6                	mov    %edx,%esi
  30cd37:	89 df                	mov    %ebx,%edi
  30cd39:	fc                   	cld    
  30cd3a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  30cd3c:	8b 45 08             	mov    0x8(%ebp),%eax
  30cd3f:	5b                   	pop    %ebx
  30cd40:	5e                   	pop    %esi
  30cd41:	5f                   	pop    %edi
  30cd42:	5d                   	pop    %ebp
  30cd43:	c3                   	ret    

0030cd44 <read>:
  30cd44:	55                   	push   %ebp
  30cd45:	89 e5                	mov    %esp,%ebp
  30cd47:	57                   	push   %edi
  30cd48:	56                   	push   %esi
  30cd49:	53                   	push   %ebx
  30cd4a:	83 ec 20             	sub    $0x20,%esp
  30cd4d:	b8 04 00 00 00       	mov    $0x4,%eax
  30cd52:	bb 01 00 00 00       	mov    $0x1,%ebx
  30cd57:	b9 00 00 00 00       	mov    $0x0,%ecx
  30cd5c:	8b 55 10             	mov    0x10(%ebp),%edx
  30cd5f:	be 00 00 00 00       	mov    $0x0,%esi
  30cd64:	bf 00 00 00 00       	mov    $0x0,%edi
  30cd69:	cd 80                	int    $0x80
  30cd6b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30cd6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30cd71:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30cd74:	b8 01 00 00 00       	mov    $0x1,%eax
  30cd79:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30cd7c:	b9 00 00 00 00       	mov    $0x0,%ecx
  30cd81:	8b 55 ec             	mov    -0x14(%ebp),%edx
  30cd84:	be 00 00 00 00       	mov    $0x0,%esi
  30cd89:	8b 7d 10             	mov    0x10(%ebp),%edi
  30cd8c:	cd 80                	int    $0x80
  30cd8e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30cd91:	8b 45 e8             	mov    -0x18(%ebp),%eax
  30cd94:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30cd97:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
  30cd9b:	74 11                	je     30cdae <read+0x6a>
  30cd9d:	ff 75 e4             	pushl  -0x1c(%ebp)
  30cda0:	ff 75 ec             	pushl  -0x14(%ebp)
  30cda3:	ff 75 0c             	pushl  0xc(%ebp)
  30cda6:	e8 79 ff ff ff       	call   30cd24 <memcpy>
  30cdab:	83 c4 0c             	add    $0xc,%esp
  30cdae:	b8 04 00 00 00       	mov    $0x4,%eax
  30cdb3:	bb 00 00 00 00       	mov    $0x0,%ebx
  30cdb8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  30cdbb:	ba 00 00 00 00       	mov    $0x0,%edx
  30cdc0:	be 00 00 00 00       	mov    $0x0,%esi
  30cdc5:	bf 00 00 00 00       	mov    $0x0,%edi
  30cdca:	cd 80                	int    $0x80
  30cdcc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30cdcf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30cdd2:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30cdd5:	5b                   	pop    %ebx
  30cdd6:	5e                   	pop    %esi
  30cdd7:	5f                   	pop    %edi
  30cdd8:	5d                   	pop    %ebp
  30cdd9:	c3                   	ret    
  30cdda:	66 90                	xchg   %ax,%ax

0030cddc <strlen>:
  30cddc:	55                   	push   %ebp
  30cddd:	89 e5                	mov    %esp,%ebp
  30cddf:	57                   	push   %edi
  30cde0:	8b 55 08             	mov    0x8(%ebp),%edx
  30cde3:	b8 00 00 00 00       	mov    $0x0,%eax
  30cde8:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30cded:	89 d7                	mov    %edx,%edi
  30cdef:	fc                   	cld    
  30cdf0:	f2 ae                	repnz scas %es:(%edi),%al
  30cdf2:	f7 d1                	not    %ecx
  30cdf4:	49                   	dec    %ecx
  30cdf5:	89 c8                	mov    %ecx,%eax
  30cdf7:	5f                   	pop    %edi
  30cdf8:	5d                   	pop    %ebp
  30cdf9:	c3                   	ret    

0030cdfa <open>:
  30cdfa:	55                   	push   %ebp
  30cdfb:	89 e5                	mov    %esp,%ebp
  30cdfd:	57                   	push   %edi
  30cdfe:	56                   	push   %esi
  30cdff:	53                   	push   %ebx
  30ce00:	83 ec 20             	sub    $0x20,%esp
  30ce03:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  30ce0a:	ff 75 08             	pushl  0x8(%ebp)
  30ce0d:	e8 ca ff ff ff       	call   30cddc <strlen>
  30ce12:	83 c4 04             	add    $0x4,%esp
  30ce15:	8d 50 01             	lea    0x1(%eax),%edx
  30ce18:	b8 04 00 00 00       	mov    $0x4,%eax
  30ce1d:	bb 01 00 00 00       	mov    $0x1,%ebx
  30ce22:	8b 4d 08             	mov    0x8(%ebp),%ecx
  30ce25:	be 00 00 00 00       	mov    $0x0,%esi
  30ce2a:	bf 00 00 00 00       	mov    $0x0,%edi
  30ce2f:	cd 80                	int    $0x80
  30ce31:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30ce34:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30ce37:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30ce3a:	b8 01 00 00 00       	mov    $0x1,%eax
  30ce3f:	bb 08 00 00 00       	mov    $0x8,%ebx
  30ce44:	b9 02 00 00 00       	mov    $0x2,%ecx
  30ce49:	8b 55 e8             	mov    -0x18(%ebp),%edx
  30ce4c:	be 00 00 00 00       	mov    $0x0,%esi
  30ce51:	8b 7d 0c             	mov    0xc(%ebp),%edi
  30ce54:	cd 80                	int    $0x80
  30ce56:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30ce59:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30ce5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30ce5f:	b8 04 00 00 00       	mov    $0x4,%eax
  30ce64:	bb 00 00 00 00       	mov    $0x0,%ebx
  30ce69:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  30ce6c:	ba 00 00 00 00       	mov    $0x0,%edx
  30ce71:	be 00 00 00 00       	mov    $0x0,%esi
  30ce76:	bf 00 00 00 00       	mov    $0x0,%edi
  30ce7b:	cd 80                	int    $0x80
  30ce7d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30ce80:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30ce83:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30ce86:	5b                   	pop    %ebx
  30ce87:	5e                   	pop    %esi
  30ce88:	5f                   	pop    %edi
  30ce89:	5d                   	pop    %ebp
  30ce8a:	c3                   	ret    

0030ce8b <close>:
  30ce8b:	55                   	push   %ebp
  30ce8c:	89 e5                	mov    %esp,%ebp
  30ce8e:	57                   	push   %edi
  30ce8f:	56                   	push   %esi
  30ce90:	53                   	push   %ebx
  30ce91:	83 ec 10             	sub    $0x10,%esp
  30ce94:	b8 01 00 00 00       	mov    $0x1,%eax
  30ce99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30ce9c:	b9 03 00 00 00       	mov    $0x3,%ecx
  30cea1:	ba 00 00 00 00       	mov    $0x0,%edx
  30cea6:	be 00 00 00 00       	mov    $0x0,%esi
  30ceab:	bf 00 00 00 00       	mov    $0x0,%edi
  30ceb0:	cd 80                	int    $0x80
  30ceb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30ceb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30ceb8:	83 c4 10             	add    $0x10,%esp
  30cebb:	5b                   	pop    %ebx
  30cebc:	5e                   	pop    %esi
  30cebd:	5f                   	pop    %edi
  30cebe:	5d                   	pop    %ebp
  30cebf:	c3                   	ret    

0030cec0 <strlen>:
  30cec0:	55                   	push   %ebp
  30cec1:	89 e5                	mov    %esp,%ebp
  30cec3:	57                   	push   %edi
  30cec4:	8b 55 08             	mov    0x8(%ebp),%edx
  30cec7:	b8 00 00 00 00       	mov    $0x0,%eax
  30cecc:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30ced1:	89 d7                	mov    %edx,%edi
  30ced3:	fc                   	cld    
  30ced4:	f2 ae                	repnz scas %es:(%edi),%al
  30ced6:	f7 d1                	not    %ecx
  30ced8:	49                   	dec    %ecx
  30ced9:	89 c8                	mov    %ecx,%eax
  30cedb:	5f                   	pop    %edi
  30cedc:	5d                   	pop    %ebp
  30cedd:	c3                   	ret    

0030cede <memcpy>:
  30cede:	55                   	push   %ebp
  30cedf:	89 e5                	mov    %esp,%ebp
  30cee1:	57                   	push   %edi
  30cee2:	56                   	push   %esi
  30cee3:	53                   	push   %ebx
  30cee4:	8b 45 10             	mov    0x10(%ebp),%eax
  30cee7:	8b 55 0c             	mov    0xc(%ebp),%edx
  30ceea:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30ceed:	89 c1                	mov    %eax,%ecx
  30ceef:	89 d6                	mov    %edx,%esi
  30cef1:	89 df                	mov    %ebx,%edi
  30cef3:	fc                   	cld    
  30cef4:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  30cef6:	8b 45 08             	mov    0x8(%ebp),%eax
  30cef9:	5b                   	pop    %ebx
  30cefa:	5e                   	pop    %esi
  30cefb:	5f                   	pop    %edi
  30cefc:	5d                   	pop    %ebp
  30cefd:	c3                   	ret    

0030cefe <_atoi>:
  30cefe:	55                   	push   %ebp
  30ceff:	89 e5                	mov    %esp,%ebp
  30cf01:	53                   	push   %ebx
  30cf02:	83 ec 10             	sub    $0x10,%esp
  30cf05:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  30cf0c:	eb 29                	jmp    30cf37 <_atoi+0x39>
  30cf0e:	8b 55 f8             	mov    -0x8(%ebp),%edx
  30cf11:	89 d0                	mov    %edx,%eax
  30cf13:	c1 e0 02             	shl    $0x2,%eax
  30cf16:	01 d0                	add    %edx,%eax
  30cf18:	01 c0                	add    %eax,%eax
  30cf1a:	89 c3                	mov    %eax,%ebx
  30cf1c:	8b 45 08             	mov    0x8(%ebp),%eax
  30cf1f:	8b 00                	mov    (%eax),%eax
  30cf21:	8d 48 01             	lea    0x1(%eax),%ecx
  30cf24:	8b 55 08             	mov    0x8(%ebp),%edx
  30cf27:	89 0a                	mov    %ecx,(%edx)
  30cf29:	0f b6 00             	movzbl (%eax),%eax
  30cf2c:	0f be c0             	movsbl %al,%eax
  30cf2f:	01 d8                	add    %ebx,%eax
  30cf31:	83 e8 30             	sub    $0x30,%eax
  30cf34:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30cf37:	8b 45 08             	mov    0x8(%ebp),%eax
  30cf3a:	8b 00                	mov    (%eax),%eax
  30cf3c:	0f b6 00             	movzbl (%eax),%eax
  30cf3f:	3c 2f                	cmp    $0x2f,%al
  30cf41:	7e 0c                	jle    30cf4f <_atoi+0x51>
  30cf43:	8b 45 08             	mov    0x8(%ebp),%eax
  30cf46:	8b 00                	mov    (%eax),%eax
  30cf48:	0f b6 00             	movzbl (%eax),%eax
  30cf4b:	3c 39                	cmp    $0x39,%al
  30cf4d:	7e bf                	jle    30cf0e <_atoi+0x10>
  30cf4f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  30cf52:	83 c4 10             	add    $0x10,%esp
  30cf55:	5b                   	pop    %ebx
  30cf56:	5d                   	pop    %ebp
  30cf57:	c3                   	ret    

0030cf58 <_octal>:
  30cf58:	55                   	push   %ebp
  30cf59:	89 e5                	mov    %esp,%ebp
  30cf5b:	83 ec 10             	sub    $0x10,%esp
  30cf5e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30cf65:	8b 45 08             	mov    0x8(%ebp),%eax
  30cf68:	8d 50 04             	lea    0x4(%eax),%edx
  30cf6b:	89 55 08             	mov    %edx,0x8(%ebp)
  30cf6e:	8b 55 0c             	mov    0xc(%ebp),%edx
  30cf71:	83 e2 07             	and    $0x7,%edx
  30cf74:	89 10                	mov    %edx,(%eax)
  30cf76:	c1 6d 0c 03          	shrl   $0x3,0xc(%ebp)
  30cf7a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  30cf7e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  30cf82:	75 e1                	jne    30cf65 <_octal+0xd>
  30cf84:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30cf87:	c9                   	leave  
  30cf88:	c3                   	ret    

0030cf89 <_decimal>:
  30cf89:	55                   	push   %ebp
  30cf8a:	89 e5                	mov    %esp,%ebp
  30cf8c:	53                   	push   %ebx
  30cf8d:	83 ec 10             	sub    $0x10,%esp
  30cf90:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  30cf97:	8b 4d 08             	mov    0x8(%ebp),%ecx
  30cf9a:	8d 41 04             	lea    0x4(%ecx),%eax
  30cf9d:	89 45 08             	mov    %eax,0x8(%ebp)
  30cfa0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  30cfa3:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  30cfa8:	89 d8                	mov    %ebx,%eax
  30cfaa:	f7 e2                	mul    %edx
  30cfac:	c1 ea 03             	shr    $0x3,%edx
  30cfaf:	89 d0                	mov    %edx,%eax
  30cfb1:	c1 e0 02             	shl    $0x2,%eax
  30cfb4:	01 d0                	add    %edx,%eax
  30cfb6:	01 c0                	add    %eax,%eax
  30cfb8:	29 c3                	sub    %eax,%ebx
  30cfba:	89 da                	mov    %ebx,%edx
  30cfbc:	89 d0                	mov    %edx,%eax
  30cfbe:	89 01                	mov    %eax,(%ecx)
  30cfc0:	8b 45 0c             	mov    0xc(%ebp),%eax
  30cfc3:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  30cfc8:	f7 e2                	mul    %edx
  30cfca:	89 d0                	mov    %edx,%eax
  30cfcc:	c1 e8 03             	shr    $0x3,%eax
  30cfcf:	89 45 0c             	mov    %eax,0xc(%ebp)
  30cfd2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  30cfd6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  30cfda:	75 bb                	jne    30cf97 <_decimal+0xe>
  30cfdc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  30cfdf:	83 c4 10             	add    $0x10,%esp
  30cfe2:	5b                   	pop    %ebx
  30cfe3:	5d                   	pop    %ebp
  30cfe4:	c3                   	ret    

0030cfe5 <_hex>:
  30cfe5:	55                   	push   %ebp
  30cfe6:	89 e5                	mov    %esp,%ebp
  30cfe8:	83 ec 10             	sub    $0x10,%esp
  30cfeb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30cff2:	8b 45 08             	mov    0x8(%ebp),%eax
  30cff5:	8d 50 04             	lea    0x4(%eax),%edx
  30cff8:	89 55 08             	mov    %edx,0x8(%ebp)
  30cffb:	8b 55 0c             	mov    0xc(%ebp),%edx
  30cffe:	83 e2 0f             	and    $0xf,%edx
  30d001:	89 10                	mov    %edx,(%eax)
  30d003:	c1 6d 0c 04          	shrl   $0x4,0xc(%ebp)
  30d007:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  30d00b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  30d00f:	75 e1                	jne    30cff2 <_hex+0xd>
  30d011:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30d014:	c9                   	leave  
  30d015:	c3                   	ret    

0030d016 <_toNumber>:
  30d016:	55                   	push   %ebp
  30d017:	89 e5                	mov    %esp,%ebp
  30d019:	81 ec 18 01 00 00    	sub    $0x118,%esp
  30d01f:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d022:	89 85 e8 fe ff ff    	mov    %eax,-0x118(%ebp)
  30d028:	8b 45 10             	mov    0x10(%ebp),%eax
  30d02b:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
  30d031:	c6 45 ff 2b          	movb   $0x2b,-0x1(%ebp)
  30d035:	c7 45 f8 04 ea 30 00 	movl   $0x30ea04,-0x8(%ebp)
  30d03c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30d043:	8b 45 20             	mov    0x20(%ebp),%eax
  30d046:	83 e0 10             	and    $0x10,%eax
  30d049:	85 c0                	test   %eax,%eax
  30d04b:	74 07                	je     30d054 <_toNumber+0x3e>
  30d04d:	c7 45 f8 1c ea 30 00 	movl   $0x30ea1c,-0x8(%ebp)
  30d054:	8b 45 20             	mov    0x20(%ebp),%eax
  30d057:	83 e0 01             	and    $0x1,%eax
  30d05a:	85 c0                	test   %eax,%eax
  30d05c:	74 04                	je     30d062 <_toNumber+0x4c>
  30d05e:	83 65 20 f7          	andl   $0xfffffff7,0x20(%ebp)
  30d062:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
  30d066:	74 0d                	je     30d075 <_toNumber+0x5f>
  30d068:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
  30d06f:	83 65 20 fd          	andl   $0xfffffffd,0x20(%ebp)
  30d073:	eb 04                	jmp    30d079 <_toNumber+0x63>
  30d075:	83 65 20 fb          	andl   $0xfffffffb,0x20(%ebp)
  30d079:	8b 45 20             	mov    0x20(%ebp),%eax
  30d07c:	83 e0 04             	and    $0x4,%eax
  30d07f:	85 c0                	test   %eax,%eax
  30d081:	74 16                	je     30d099 <_toNumber+0x83>
  30d083:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
  30d087:	75 06                	jne    30d08f <_toNumber+0x79>
  30d089:	83 6d 1c 02          	subl   $0x2,0x1c(%ebp)
  30d08d:	eb 0a                	jmp    30d099 <_toNumber+0x83>
  30d08f:	83 7d 18 08          	cmpl   $0x8,0x18(%ebp)
  30d093:	75 04                	jne    30d099 <_toNumber+0x83>
  30d095:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  30d099:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
  30d09d:	75 2b                	jne    30d0ca <_toNumber+0xb4>
  30d09f:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  30d0a5:	8b 95 ec fe ff ff    	mov    -0x114(%ebp),%edx
  30d0ab:	85 d2                	test   %edx,%edx
  30d0ad:	79 1b                	jns    30d0ca <_toNumber+0xb4>
  30d0af:	83 4d 20 02          	orl    $0x2,0x20(%ebp)
  30d0b3:	f7 9d e8 fe ff ff    	negl   -0x118(%ebp)
  30d0b9:	83 95 ec fe ff ff 00 	adcl   $0x0,-0x114(%ebp)
  30d0c0:	f7 9d ec fe ff ff    	negl   -0x114(%ebp)
  30d0c6:	c6 45 ff 2d          	movb   $0x2d,-0x1(%ebp)
  30d0ca:	8b 45 24             	mov    0x24(%ebp),%eax
  30d0cd:	99                   	cltd   
  30d0ce:	21 85 e8 fe ff ff    	and    %eax,-0x118(%ebp)
  30d0d4:	21 95 ec fe ff ff    	and    %edx,-0x114(%ebp)
  30d0da:	8b 45 20             	mov    0x20(%ebp),%eax
  30d0dd:	83 e0 02             	and    $0x2,%eax
  30d0e0:	85 c0                	test   %eax,%eax
  30d0e2:	74 04                	je     30d0e8 <_toNumber+0xd2>
  30d0e4:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  30d0e8:	8b 45 18             	mov    0x18(%ebp),%eax
  30d0eb:	83 f8 0a             	cmp    $0xa,%eax
  30d0ee:	74 25                	je     30d115 <_toNumber+0xff>
  30d0f0:	83 f8 10             	cmp    $0x10,%eax
  30d0f3:	74 3b                	je     30d130 <_toNumber+0x11a>
  30d0f5:	83 f8 08             	cmp    $0x8,%eax
  30d0f8:	75 50                	jne    30d14a <_toNumber+0x134>
  30d0fa:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  30d100:	50                   	push   %eax
  30d101:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  30d107:	50                   	push   %eax
  30d108:	e8 4b fe ff ff       	call   30cf58 <_octal>
  30d10d:	83 c4 08             	add    $0x8,%esp
  30d110:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30d113:	eb 35                	jmp    30d14a <_toNumber+0x134>
  30d115:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  30d11b:	50                   	push   %eax
  30d11c:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  30d122:	50                   	push   %eax
  30d123:	e8 61 fe ff ff       	call   30cf89 <_decimal>
  30d128:	83 c4 08             	add    $0x8,%esp
  30d12b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30d12e:	eb 1a                	jmp    30d14a <_toNumber+0x134>
  30d130:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  30d136:	50                   	push   %eax
  30d137:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  30d13d:	50                   	push   %eax
  30d13e:	e8 a2 fe ff ff       	call   30cfe5 <_hex>
  30d143:	83 c4 08             	add    $0x8,%esp
  30d146:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30d149:	90                   	nop
  30d14a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30d14d:	29 45 1c             	sub    %eax,0x1c(%ebp)
  30d150:	8b 45 20             	mov    0x20(%ebp),%eax
  30d153:	83 e0 09             	and    $0x9,%eax
  30d156:	85 c0                	test   %eax,%eax
  30d158:	75 1b                	jne    30d175 <_toNumber+0x15f>
  30d15a:	eb 0c                	jmp    30d168 <_toNumber+0x152>
  30d15c:	8b 45 08             	mov    0x8(%ebp),%eax
  30d15f:	8d 50 01             	lea    0x1(%eax),%edx
  30d162:	89 55 08             	mov    %edx,0x8(%ebp)
  30d165:	c6 00 20             	movb   $0x20,(%eax)
  30d168:	8b 45 1c             	mov    0x1c(%ebp),%eax
  30d16b:	8d 50 ff             	lea    -0x1(%eax),%edx
  30d16e:	89 55 1c             	mov    %edx,0x1c(%ebp)
  30d171:	85 c0                	test   %eax,%eax
  30d173:	7f e7                	jg     30d15c <_toNumber+0x146>
  30d175:	8b 45 20             	mov    0x20(%ebp),%eax
  30d178:	83 e0 02             	and    $0x2,%eax
  30d17b:	85 c0                	test   %eax,%eax
  30d17d:	74 0f                	je     30d18e <_toNumber+0x178>
  30d17f:	8b 45 08             	mov    0x8(%ebp),%eax
  30d182:	8d 50 01             	lea    0x1(%eax),%edx
  30d185:	89 55 08             	mov    %edx,0x8(%ebp)
  30d188:	0f b6 55 ff          	movzbl -0x1(%ebp),%edx
  30d18c:	88 10                	mov    %dl,(%eax)
  30d18e:	8b 45 20             	mov    0x20(%ebp),%eax
  30d191:	83 e0 04             	and    $0x4,%eax
  30d194:	85 c0                	test   %eax,%eax
  30d196:	74 24                	je     30d1bc <_toNumber+0x1a6>
  30d198:	8b 45 08             	mov    0x8(%ebp),%eax
  30d19b:	8d 50 01             	lea    0x1(%eax),%edx
  30d19e:	89 55 08             	mov    %edx,0x8(%ebp)
  30d1a1:	c6 00 30             	movb   $0x30,(%eax)
  30d1a4:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
  30d1a8:	75 12                	jne    30d1bc <_toNumber+0x1a6>
  30d1aa:	8b 45 08             	mov    0x8(%ebp),%eax
  30d1ad:	8d 50 01             	lea    0x1(%eax),%edx
  30d1b0:	89 55 08             	mov    %edx,0x8(%ebp)
  30d1b3:	8b 55 f8             	mov    -0x8(%ebp),%edx
  30d1b6:	0f b6 52 10          	movzbl 0x10(%edx),%edx
  30d1ba:	88 10                	mov    %dl,(%eax)
  30d1bc:	8b 45 20             	mov    0x20(%ebp),%eax
  30d1bf:	83 e0 08             	and    $0x8,%eax
  30d1c2:	85 c0                	test   %eax,%eax
  30d1c4:	74 1b                	je     30d1e1 <_toNumber+0x1cb>
  30d1c6:	eb 0c                	jmp    30d1d4 <_toNumber+0x1be>
  30d1c8:	8b 45 08             	mov    0x8(%ebp),%eax
  30d1cb:	8d 50 01             	lea    0x1(%eax),%edx
  30d1ce:	89 55 08             	mov    %edx,0x8(%ebp)
  30d1d1:	c6 00 30             	movb   $0x30,(%eax)
  30d1d4:	8b 45 1c             	mov    0x1c(%ebp),%eax
  30d1d7:	8d 50 ff             	lea    -0x1(%eax),%edx
  30d1da:	89 55 1c             	mov    %edx,0x1c(%ebp)
  30d1dd:	85 c0                	test   %eax,%eax
  30d1df:	7f e7                	jg     30d1c8 <_toNumber+0x1b2>
  30d1e1:	eb 1f                	jmp    30d202 <_toNumber+0x1ec>
  30d1e3:	8b 45 08             	mov    0x8(%ebp),%eax
  30d1e6:	8d 50 01             	lea    0x1(%eax),%edx
  30d1e9:	89 55 08             	mov    %edx,0x8(%ebp)
  30d1ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
  30d1ef:	8b 94 95 f4 fe ff ff 	mov    -0x10c(%ebp,%edx,4),%edx
  30d1f6:	89 d1                	mov    %edx,%ecx
  30d1f8:	8b 55 f8             	mov    -0x8(%ebp),%edx
  30d1fb:	01 ca                	add    %ecx,%edx
  30d1fd:	0f b6 12             	movzbl (%edx),%edx
  30d200:	88 10                	mov    %dl,(%eax)
  30d202:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30d205:	8d 50 ff             	lea    -0x1(%eax),%edx
  30d208:	89 55 f4             	mov    %edx,-0xc(%ebp)
  30d20b:	85 c0                	test   %eax,%eax
  30d20d:	7f d4                	jg     30d1e3 <_toNumber+0x1cd>
  30d20f:	8b 45 20             	mov    0x20(%ebp),%eax
  30d212:	83 e0 01             	and    $0x1,%eax
  30d215:	85 c0                	test   %eax,%eax
  30d217:	74 1b                	je     30d234 <_toNumber+0x21e>
  30d219:	eb 0c                	jmp    30d227 <_toNumber+0x211>
  30d21b:	8b 45 08             	mov    0x8(%ebp),%eax
  30d21e:	8d 50 01             	lea    0x1(%eax),%edx
  30d221:	89 55 08             	mov    %edx,0x8(%ebp)
  30d224:	c6 00 20             	movb   $0x20,(%eax)
  30d227:	8b 45 1c             	mov    0x1c(%ebp),%eax
  30d22a:	8d 50 ff             	lea    -0x1(%eax),%edx
  30d22d:	89 55 1c             	mov    %edx,0x1c(%ebp)
  30d230:	85 c0                	test   %eax,%eax
  30d232:	7f e7                	jg     30d21b <_toNumber+0x205>
  30d234:	8b 45 08             	mov    0x8(%ebp),%eax
  30d237:	c9                   	leave  
  30d238:	c3                   	ret    

0030d239 <_toString>:
  30d239:	55                   	push   %ebp
  30d23a:	89 e5                	mov    %esp,%ebp
  30d23c:	83 ec 10             	sub    $0x10,%esp
  30d23f:	ff 75 0c             	pushl  0xc(%ebp)
  30d242:	e8 79 fc ff ff       	call   30cec0 <strlen>
  30d247:	83 c4 04             	add    $0x4,%esp
  30d24a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30d24d:	8b 45 08             	mov    0x8(%ebp),%eax
  30d250:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30d253:	8b 45 08             	mov    0x8(%ebp),%eax
  30d256:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30d259:	8b 45 14             	mov    0x14(%ebp),%eax
  30d25c:	83 e0 01             	and    $0x1,%eax
  30d25f:	85 c0                	test   %eax,%eax
  30d261:	74 0d                	je     30d270 <_toString+0x37>
  30d263:	8b 55 f0             	mov    -0x10(%ebp),%edx
  30d266:	8b 45 08             	mov    0x8(%ebp),%eax
  30d269:	01 d0                	add    %edx,%eax
  30d26b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30d26e:	eb 0b                	jmp    30d27b <_toString+0x42>
  30d270:	8b 55 f0             	mov    -0x10(%ebp),%edx
  30d273:	8b 45 08             	mov    0x8(%ebp),%eax
  30d276:	01 d0                	add    %edx,%eax
  30d278:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30d27b:	ff 75 f0             	pushl  -0x10(%ebp)
  30d27e:	ff 75 0c             	pushl  0xc(%ebp)
  30d281:	ff 75 fc             	pushl  -0x4(%ebp)
  30d284:	e8 55 fc ff ff       	call   30cede <memcpy>
  30d289:	83 c4 0c             	add    $0xc,%esp
  30d28c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30d293:	eb 10                	jmp    30d2a5 <_toString+0x6c>
  30d295:	8b 45 f8             	mov    -0x8(%ebp),%eax
  30d298:	8d 50 01             	lea    0x1(%eax),%edx
  30d29b:	89 55 f8             	mov    %edx,-0x8(%ebp)
  30d29e:	c6 00 20             	movb   $0x20,(%eax)
  30d2a1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  30d2a5:	8b 45 10             	mov    0x10(%ebp),%eax
  30d2a8:	2b 45 f0             	sub    -0x10(%ebp),%eax
  30d2ab:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  30d2ae:	7f e5                	jg     30d295 <_toString+0x5c>
  30d2b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30d2b3:	39 45 10             	cmp    %eax,0x10(%ebp)
  30d2b6:	0f 4d 45 10          	cmovge 0x10(%ebp),%eax
  30d2ba:	89 c2                	mov    %eax,%edx
  30d2bc:	8b 45 08             	mov    0x8(%ebp),%eax
  30d2bf:	01 d0                	add    %edx,%eax
  30d2c1:	c9                   	leave  
  30d2c2:	c3                   	ret    

0030d2c3 <vsprintf>:
  30d2c3:	55                   	push   %ebp
  30d2c4:	89 e5                	mov    %esp,%ebp
  30d2c6:	83 ec 30             	sub    $0x30,%esp
  30d2c9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30d2d0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  30d2d7:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  30d2de:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  30d2e5:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  30d2ec:	c7 45 e4 6c 00 00 00 	movl   $0x6c,-0x1c(%ebp)
  30d2f3:	8b 45 08             	mov    0x8(%ebp),%eax
  30d2f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30d2f9:	e9 69 02 00 00       	jmp    30d567 <vsprintf+0x2a4>
  30d2fe:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d301:	0f b6 00             	movzbl (%eax),%eax
  30d304:	3c 25                	cmp    $0x25,%al
  30d306:	0f 85 41 02 00 00    	jne    30d54d <vsprintf+0x28a>
  30d30c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30d313:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30d31a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  30d321:	c7 45 e4 6c 00 00 00 	movl   $0x6c,-0x1c(%ebp)
  30d328:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d32b:	83 c0 01             	add    $0x1,%eax
  30d32e:	89 45 0c             	mov    %eax,0xc(%ebp)
  30d331:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d334:	0f b6 00             	movzbl (%eax),%eax
  30d337:	0f be c0             	movsbl %al,%eax
  30d33a:	83 e8 20             	sub    $0x20,%eax
  30d33d:	83 f8 10             	cmp    $0x10,%eax
  30d340:	77 27                	ja     30d369 <vsprintf+0xa6>
  30d342:	8b 04 85 3c ea 30 00 	mov    0x30ea3c(,%eax,4),%eax
  30d349:	ff e0                	jmp    *%eax
  30d34b:	83 4d fc 01          	orl    $0x1,-0x4(%ebp)
  30d34f:	eb d7                	jmp    30d328 <vsprintf+0x65>
  30d351:	83 4d fc 02          	orl    $0x2,-0x4(%ebp)
  30d355:	eb d1                	jmp    30d328 <vsprintf+0x65>
  30d357:	83 4d fc 02          	orl    $0x2,-0x4(%ebp)
  30d35b:	eb cb                	jmp    30d328 <vsprintf+0x65>
  30d35d:	83 4d fc 08          	orl    $0x8,-0x4(%ebp)
  30d361:	eb c5                	jmp    30d328 <vsprintf+0x65>
  30d363:	83 4d fc 04          	orl    $0x4,-0x4(%ebp)
  30d367:	eb bf                	jmp    30d328 <vsprintf+0x65>
  30d369:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d36c:	0f b6 00             	movzbl (%eax),%eax
  30d36f:	3c 2f                	cmp    $0x2f,%al
  30d371:	7e 1b                	jle    30d38e <vsprintf+0xcb>
  30d373:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d376:	0f b6 00             	movzbl (%eax),%eax
  30d379:	3c 39                	cmp    $0x39,%al
  30d37b:	7f 11                	jg     30d38e <vsprintf+0xcb>
  30d37d:	8d 45 0c             	lea    0xc(%ebp),%eax
  30d380:	50                   	push   %eax
  30d381:	e8 78 fb ff ff       	call   30cefe <_atoi>
  30d386:	83 c4 04             	add    $0x4,%esp
  30d389:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30d38c:	eb 21                	jmp    30d3af <vsprintf+0xec>
  30d38e:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d391:	0f b6 00             	movzbl (%eax),%eax
  30d394:	3c 2a                	cmp    $0x2a,%al
  30d396:	75 17                	jne    30d3af <vsprintf+0xec>
  30d398:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d39b:	83 c0 01             	add    $0x1,%eax
  30d39e:	89 45 0c             	mov    %eax,0xc(%ebp)
  30d3a1:	8b 45 10             	mov    0x10(%ebp),%eax
  30d3a4:	8d 50 04             	lea    0x4(%eax),%edx
  30d3a7:	89 55 10             	mov    %edx,0x10(%ebp)
  30d3aa:	8b 00                	mov    (%eax),%eax
  30d3ac:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30d3af:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d3b2:	0f b6 00             	movzbl (%eax),%eax
  30d3b5:	3c 68                	cmp    $0x68,%al
  30d3b7:	74 1e                	je     30d3d7 <vsprintf+0x114>
  30d3b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d3bc:	0f b6 00             	movzbl (%eax),%eax
  30d3bf:	3c 6c                	cmp    $0x6c,%al
  30d3c1:	74 14                	je     30d3d7 <vsprintf+0x114>
  30d3c3:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d3c6:	0f b6 00             	movzbl (%eax),%eax
  30d3c9:	3c 4c                	cmp    $0x4c,%al
  30d3cb:	74 0a                	je     30d3d7 <vsprintf+0x114>
  30d3cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d3d0:	0f b6 00             	movzbl (%eax),%eax
  30d3d3:	3c 48                	cmp    $0x48,%al
  30d3d5:	75 15                	jne    30d3ec <vsprintf+0x129>
  30d3d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d3da:	0f b6 00             	movzbl (%eax),%eax
  30d3dd:	0f be c0             	movsbl %al,%eax
  30d3e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30d3e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d3e6:	83 c0 01             	add    $0x1,%eax
  30d3e9:	89 45 0c             	mov    %eax,0xc(%ebp)
  30d3ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d3ef:	0f b6 00             	movzbl (%eax),%eax
  30d3f2:	0f be c0             	movsbl %al,%eax
  30d3f5:	83 e8 58             	sub    $0x58,%eax
  30d3f8:	83 f8 20             	cmp    $0x20,%eax
  30d3fb:	77 57                	ja     30d454 <vsprintf+0x191>
  30d3fd:	8b 04 85 80 ea 30 00 	mov    0x30ea80(,%eax,4),%eax
  30d404:	ff e0                	jmp    *%eax
  30d406:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30d409:	8d 50 01             	lea    0x1(%eax),%edx
  30d40c:	89 55 ec             	mov    %edx,-0x14(%ebp)
  30d40f:	8b 55 10             	mov    0x10(%ebp),%edx
  30d412:	8d 4a 04             	lea    0x4(%edx),%ecx
  30d415:	89 4d 10             	mov    %ecx,0x10(%ebp)
  30d418:	8b 12                	mov    (%edx),%edx
  30d41a:	88 10                	mov    %dl,(%eax)
  30d41c:	e9 3d 01 00 00       	jmp    30d55e <vsprintf+0x29b>
  30d421:	c7 45 e4 73 00 00 00 	movl   $0x73,-0x1c(%ebp)
  30d428:	eb 50                	jmp    30d47a <vsprintf+0x1b7>
  30d42a:	83 4d fc 04          	orl    $0x4,-0x4(%ebp)
  30d42e:	83 4d fc 10          	orl    $0x10,-0x4(%ebp)
  30d432:	c7 45 f0 10 00 00 00 	movl   $0x10,-0x10(%ebp)
  30d439:	eb 3f                	jmp    30d47a <vsprintf+0x1b7>
  30d43b:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  30d442:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  30d449:	eb 2e                	jmp    30d479 <vsprintf+0x1b6>
  30d44b:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
  30d452:	eb 26                	jmp    30d47a <vsprintf+0x1b7>
  30d454:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d457:	0f b6 00             	movzbl (%eax),%eax
  30d45a:	84 c0                	test   %al,%al
  30d45c:	74 16                	je     30d474 <vsprintf+0x1b1>
  30d45e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30d461:	8d 50 01             	lea    0x1(%eax),%edx
  30d464:	89 55 ec             	mov    %edx,-0x14(%ebp)
  30d467:	8b 55 0c             	mov    0xc(%ebp),%edx
  30d46a:	0f b6 12             	movzbl (%edx),%edx
  30d46d:	88 10                	mov    %dl,(%eax)
  30d46f:	e9 ea 00 00 00       	jmp    30d55e <vsprintf+0x29b>
  30d474:	e9 e5 00 00 00       	jmp    30d55e <vsprintf+0x29b>
  30d479:	90                   	nop
  30d47a:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  30d481:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30d484:	83 e8 48             	sub    $0x48,%eax
  30d487:	83 f8 2b             	cmp    $0x2b,%eax
  30d48a:	0f 87 ce 00 00 00    	ja     30d55e <vsprintf+0x29b>
  30d490:	8b 04 85 04 eb 30 00 	mov    0x30eb04(,%eax,4),%eax
  30d497:	ff e0                	jmp    *%eax
  30d499:	c7 45 e0 ff 00 00 00 	movl   $0xff,-0x20(%ebp)
  30d4a0:	81 65 e0 ff ff 00 00 	andl   $0xffff,-0x20(%ebp)
  30d4a7:	8b 45 10             	mov    0x10(%ebp),%eax
  30d4aa:	8d 50 04             	lea    0x4(%eax),%edx
  30d4ad:	89 55 10             	mov    %edx,0x10(%ebp)
  30d4b0:	8b 00                	mov    (%eax),%eax
  30d4b2:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30d4b5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30d4b8:	ba 00 00 00 00       	mov    $0x0,%edx
  30d4bd:	ff 75 e0             	pushl  -0x20(%ebp)
  30d4c0:	ff 75 fc             	pushl  -0x4(%ebp)
  30d4c3:	ff 75 f8             	pushl  -0x8(%ebp)
  30d4c6:	ff 75 f0             	pushl  -0x10(%ebp)
  30d4c9:	ff 75 f4             	pushl  -0xc(%ebp)
  30d4cc:	52                   	push   %edx
  30d4cd:	50                   	push   %eax
  30d4ce:	ff 75 ec             	pushl  -0x14(%ebp)
  30d4d1:	e8 40 fb ff ff       	call   30d016 <_toNumber>
  30d4d6:	83 c4 20             	add    $0x20,%esp
  30d4d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30d4dc:	eb 6d                	jmp    30d54b <vsprintf+0x288>
  30d4de:	8b 45 10             	mov    0x10(%ebp),%eax
  30d4e1:	8d 50 08             	lea    0x8(%eax),%edx
  30d4e4:	89 55 10             	mov    %edx,0x10(%ebp)
  30d4e7:	8b 50 04             	mov    0x4(%eax),%edx
  30d4ea:	8b 00                	mov    (%eax),%eax
  30d4ec:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30d4ef:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30d4f2:	ba 00 00 00 00       	mov    $0x0,%edx
  30d4f7:	ff 75 e0             	pushl  -0x20(%ebp)
  30d4fa:	ff 75 fc             	pushl  -0x4(%ebp)
  30d4fd:	ff 75 f8             	pushl  -0x8(%ebp)
  30d500:	ff 75 f0             	pushl  -0x10(%ebp)
  30d503:	ff 75 f4             	pushl  -0xc(%ebp)
  30d506:	52                   	push   %edx
  30d507:	50                   	push   %eax
  30d508:	ff 75 ec             	pushl  -0x14(%ebp)
  30d50b:	e8 06 fb ff ff       	call   30d016 <_toNumber>
  30d510:	83 c4 20             	add    $0x20,%esp
  30d513:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30d516:	eb 33                	jmp    30d54b <vsprintf+0x288>
  30d518:	8b 45 10             	mov    0x10(%ebp),%eax
  30d51b:	8d 50 04             	lea    0x4(%eax),%edx
  30d51e:	89 55 10             	mov    %edx,0x10(%ebp)
  30d521:	8b 00                	mov    (%eax),%eax
  30d523:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30d526:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  30d52a:	75 07                	jne    30d533 <vsprintf+0x270>
  30d52c:	c7 45 e8 34 ea 30 00 	movl   $0x30ea34,-0x18(%ebp)
  30d533:	ff 75 fc             	pushl  -0x4(%ebp)
  30d536:	ff 75 f8             	pushl  -0x8(%ebp)
  30d539:	ff 75 e8             	pushl  -0x18(%ebp)
  30d53c:	ff 75 ec             	pushl  -0x14(%ebp)
  30d53f:	e8 f5 fc ff ff       	call   30d239 <_toString>
  30d544:	83 c4 10             	add    $0x10,%esp
  30d547:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30d54a:	90                   	nop
  30d54b:	eb 11                	jmp    30d55e <vsprintf+0x29b>
  30d54d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30d550:	8d 50 01             	lea    0x1(%eax),%edx
  30d553:	89 55 ec             	mov    %edx,-0x14(%ebp)
  30d556:	8b 55 0c             	mov    0xc(%ebp),%edx
  30d559:	0f b6 12             	movzbl (%edx),%edx
  30d55c:	88 10                	mov    %dl,(%eax)
  30d55e:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d561:	83 c0 01             	add    $0x1,%eax
  30d564:	89 45 0c             	mov    %eax,0xc(%ebp)
  30d567:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d56a:	0f b6 00             	movzbl (%eax),%eax
  30d56d:	84 c0                	test   %al,%al
  30d56f:	0f 85 89 fd ff ff    	jne    30d2fe <vsprintf+0x3b>
  30d575:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30d578:	c6 00 00             	movb   $0x0,(%eax)
  30d57b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  30d57e:	8b 45 08             	mov    0x8(%ebp),%eax
  30d581:	29 c2                	sub    %eax,%edx
  30d583:	89 d0                	mov    %edx,%eax
  30d585:	c9                   	leave  
  30d586:	c3                   	ret    

0030d587 <sprintf>:
  30d587:	55                   	push   %ebp
  30d588:	89 e5                	mov    %esp,%ebp
  30d58a:	83 ec 10             	sub    $0x10,%esp
  30d58d:	8d 45 10             	lea    0x10(%ebp),%eax
  30d590:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30d593:	8b 45 f8             	mov    -0x8(%ebp),%eax
  30d596:	83 ec 04             	sub    $0x4,%esp
  30d599:	50                   	push   %eax
  30d59a:	ff 75 0c             	pushl  0xc(%ebp)
  30d59d:	ff 75 08             	pushl  0x8(%ebp)
  30d5a0:	e8 1e fd ff ff       	call   30d2c3 <vsprintf>
  30d5a5:	83 c4 10             	add    $0x10,%esp
  30d5a8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30d5ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30d5ae:	c9                   	leave  
  30d5af:	c3                   	ret    
