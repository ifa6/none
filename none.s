
objs/bin/none:     file format elf32-i386


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
  305011:	89 1d 00 30 31 00    	mov    %ebx,0x313000
  305017:	0f 20 c0             	mov    %cr0,%eax
  30501a:	83 c8 20             	or     $0x20,%eax
  30501d:	0f 22 c0             	mov    %eax,%cr0
  305020:	bf 00 09 20 00       	mov    $0x200900,%edi
  305025:	be 10 30 31 00       	mov    $0x313010,%esi
  30502a:	b9 40 00 00 00       	mov    $0x40,%ecx
  30502f:	c1 e9 02             	shr    $0x2,%ecx
  305032:	fc                   	cld    
  305033:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  305035:	0f 01 15 04 30 31 00 	lgdtl  0x313004
  30503c:	0f 01 1d 0a 30 31 00 	lidtl  0x31300a
  305043:	ea 4a 50 30 00 08 00 	ljmp   $0x8,$0x30504a

0030504a <new_env>:
  30504a:	b8 10 00 00 00       	mov    $0x10,%eax
  30504f:	8e d8                	mov    %eax,%ds
  305051:	8e c0                	mov    %eax,%es
  305053:	8e d0                	mov    %eax,%ss
  305055:	8e e0                	mov    %eax,%fs
  305057:	8e e8                	mov    %eax,%gs
  305059:	bc f0 ff 3f 00       	mov    $0x3ffff0,%esp
  30505e:	e8 05 2a 00 00       	call   307a68 <main>
  305063:	fb                   	sti    
  305064:	eb fe                	jmp    305064 <new_env+0x1a>
  305066:	66 90                	xchg   %ax,%ax

00305068 <divide_error>:
  305068:	6a 00                	push   $0x0
  30506a:	68 16 59 30 00       	push   $0x305916

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
  3050a3:	68 34 59 30 00       	push   $0x305934
  3050a8:	eb c5                	jmp    30506f <error_code>

003050aa <nmi>:
  3050aa:	6a 00                	push   $0x0
  3050ac:	68 62 59 30 00       	push   $0x305962
  3050b1:	eb bc                	jmp    30506f <error_code>

003050b3 <breakpoint_exception>:
  3050b3:	6a 00                	push   $0x0
  3050b5:	68 80 59 30 00       	push   $0x305980
  3050ba:	eb b3                	jmp    30506f <error_code>

003050bc <overflow>:
  3050bc:	6a 00                	push   $0x0
  3050be:	68 ae 59 30 00       	push   $0x3059ae
  3050c3:	eb aa                	jmp    30506f <error_code>

003050c5 <bounds_check>:
  3050c5:	6a 00                	push   $0x0
  3050c7:	68 cc 59 30 00       	push   $0x3059cc
  3050cc:	eb a1                	jmp    30506f <error_code>

003050ce <inval_opcode>:
  3050ce:	6a 00                	push   $0x0
  3050d0:	68 ea 59 30 00       	push   $0x3059ea
  3050d5:	eb 98                	jmp    30506f <error_code>

003050d7 <copr_not_available>:
  3050d7:	6a 00                	push   $0x0
  3050d9:	68 08 5a 30 00       	push   $0x305a08
  3050de:	eb 8f                	jmp    30506f <error_code>

003050e0 <double_fault>:
  3050e0:	68 26 5a 30 00       	push   $0x305a26
  3050e5:	eb 88                	jmp    30506f <error_code>

003050e7 <copr_seg_overrun>:
  3050e7:	6a 00                	push   $0x0
  3050e9:	68 44 5a 30 00       	push   $0x305a44
  3050ee:	e9 7c ff ff ff       	jmp    30506f <error_code>

003050f3 <inval_tss>:
  3050f3:	68 62 5a 30 00       	push   $0x305a62
  3050f8:	e9 72 ff ff ff       	jmp    30506f <error_code>

003050fd <segment_not_present>:
  3050fd:	68 80 5a 30 00       	push   $0x305a80
  305102:	e9 68 ff ff ff       	jmp    30506f <error_code>

00305107 <stack_exception>:
  305107:	68 9e 5a 30 00       	push   $0x305a9e
  30510c:	e9 5e ff ff ff       	jmp    30506f <error_code>

00305111 <general_protection>:
  305111:	68 bc 5a 30 00       	push   $0x305abc
  305116:	e9 54 ff ff ff       	jmp    30506f <error_code>

0030511b <page_fault>:
  30511b:	68 da 5a 30 00       	push   $0x305ada
  305120:	e9 4a ff ff ff       	jmp    30506f <error_code>

00305125 <copr_error>:
  305125:	6a 00                	push   $0x0
  305127:	68 64 5b 30 00       	push   $0x305b64
  30512c:	e9 3e ff ff ff       	jmp    30506f <error_code>

00305131 <none>:
  305131:	6a 00                	push   $0x0
  305133:	68 82 5b 30 00       	push   $0x305b82
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
  305151:	54                   	push   %esp
  305152:	e8 bd 14 00 00       	call   306614 <sched>
  305157:	89 c4                	mov    %eax,%esp
  305159:	a1 08 36 31 00       	mov    0x313608,%eax
  30515e:	0f 22 d8             	mov    %eax,%cr3
  305161:	0f a9                	pop    %gs
  305163:	0f a1                	pop    %fs
  305165:	1f                   	pop    %ds
  305166:	07                   	pop    %es
  305167:	61                   	popa   
  305168:	cf                   	iret   

00305169 <hwint00>:
  305169:	60                   	pusha  
  30516a:	06                   	push   %es
  30516b:	1e                   	push   %ds
  30516c:	0f a0                	push   %fs
  30516e:	0f a8                	push   %gs
  305170:	b8 10 00 00 00       	mov    $0x10,%eax
  305175:	8e d8                	mov    %eax,%ds
  305177:	8e c0                	mov    %eax,%es
  305179:	8e e0                	mov    %eax,%fs
  30517b:	8e e8                	mov    %eax,%gs
  30517d:	e4 21                	in     $0x21,%al
  30517f:	0a 05 01 00 00 00    	or     0x1,%al
  305185:	e6 21                	out    %al,$0x21
  305187:	b0 20                	mov    $0x20,%al
  305189:	e6 20                	out    %al,$0x20
  30518b:	ff 05 40 36 31 00    	incl   0x313640
  305191:	6a 00                	push   $0x0
  305193:	b8 00 00 00 00       	mov    $0x0,%eax
  305198:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  30519f:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  3051a6:	83 c4 08             	add    $0x8,%esp
  3051a9:	54                   	push   %esp
  3051aa:	e8 65 14 00 00       	call   306614 <sched>
  3051af:	89 c4                	mov    %eax,%esp
  3051b1:	a1 08 36 31 00       	mov    0x313608,%eax
  3051b6:	0f 22 d8             	mov    %eax,%cr3
  3051b9:	e4 21                	in     $0x21,%al
  3051bb:	24 fe                	and    $0xfe,%al
  3051bd:	e6 21                	out    %al,$0x21
  3051bf:	0f a9                	pop    %gs
  3051c1:	0f a1                	pop    %fs
  3051c3:	1f                   	pop    %ds
  3051c4:	07                   	pop    %es
  3051c5:	61                   	popa   
  3051c6:	cf                   	iret   

003051c7 <hwint01>:
  3051c7:	60                   	pusha  
  3051c8:	06                   	push   %es
  3051c9:	1e                   	push   %ds
  3051ca:	0f a0                	push   %fs
  3051cc:	0f a8                	push   %gs
  3051ce:	b8 10 00 00 00       	mov    $0x10,%eax
  3051d3:	8e d8                	mov    %eax,%ds
  3051d5:	8e c0                	mov    %eax,%es
  3051d7:	8e e0                	mov    %eax,%fs
  3051d9:	8e e8                	mov    %eax,%gs
  3051db:	e4 21                	in     $0x21,%al
  3051dd:	0c 02                	or     $0x2,%al
  3051df:	e6 21                	out    %al,$0x21
  3051e1:	b0 20                	mov    $0x20,%al
  3051e3:	e6 20                	out    %al,$0x20
  3051e5:	b8 01 00 00 00       	mov    $0x1,%eax
  3051ea:	fb                   	sti    
  3051eb:	6a 01                	push   $0x1
  3051ed:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  3051f4:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  3051fb:	83 c4 08             	add    $0x8,%esp
  3051fe:	fa                   	cli    
  3051ff:	e4 21                	in     $0x21,%al
  305201:	24 fd                	and    $0xfd,%al
  305203:	e6 21                	out    %al,$0x21
  305205:	0f a9                	pop    %gs
  305207:	0f a1                	pop    %fs
  305209:	1f                   	pop    %ds
  30520a:	07                   	pop    %es
  30520b:	61                   	popa   
  30520c:	cf                   	iret   

0030520d <hwint02>:
  30520d:	60                   	pusha  
  30520e:	06                   	push   %es
  30520f:	1e                   	push   %ds
  305210:	0f a0                	push   %fs
  305212:	0f a8                	push   %gs
  305214:	b8 10 00 00 00       	mov    $0x10,%eax
  305219:	8e d8                	mov    %eax,%ds
  30521b:	8e c0                	mov    %eax,%es
  30521d:	8e e0                	mov    %eax,%fs
  30521f:	8e e8                	mov    %eax,%gs
  305221:	e4 21                	in     $0x21,%al
  305223:	0c 04                	or     $0x4,%al
  305225:	e6 21                	out    %al,$0x21
  305227:	b0 20                	mov    $0x20,%al
  305229:	e6 20                	out    %al,$0x20
  30522b:	b8 02 00 00 00       	mov    $0x2,%eax
  305230:	fb                   	sti    
  305231:	6a 02                	push   $0x2
  305233:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  30523a:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  305241:	83 c4 08             	add    $0x8,%esp
  305244:	fa                   	cli    
  305245:	e4 21                	in     $0x21,%al
  305247:	24 fb                	and    $0xfb,%al
  305249:	e6 21                	out    %al,$0x21
  30524b:	0f a9                	pop    %gs
  30524d:	0f a1                	pop    %fs
  30524f:	1f                   	pop    %ds
  305250:	07                   	pop    %es
  305251:	61                   	popa   
  305252:	cf                   	iret   

00305253 <hwint03>:
  305253:	60                   	pusha  
  305254:	06                   	push   %es
  305255:	1e                   	push   %ds
  305256:	0f a0                	push   %fs
  305258:	0f a8                	push   %gs
  30525a:	b8 10 00 00 00       	mov    $0x10,%eax
  30525f:	8e d8                	mov    %eax,%ds
  305261:	8e c0                	mov    %eax,%es
  305263:	8e e0                	mov    %eax,%fs
  305265:	8e e8                	mov    %eax,%gs
  305267:	e4 21                	in     $0x21,%al
  305269:	0c 08                	or     $0x8,%al
  30526b:	e6 21                	out    %al,$0x21
  30526d:	b0 20                	mov    $0x20,%al
  30526f:	e6 20                	out    %al,$0x20
  305271:	b8 03 00 00 00       	mov    $0x3,%eax
  305276:	fb                   	sti    
  305277:	6a 03                	push   $0x3
  305279:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  305280:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  305287:	83 c4 08             	add    $0x8,%esp
  30528a:	fa                   	cli    
  30528b:	e4 21                	in     $0x21,%al
  30528d:	24 f7                	and    $0xf7,%al
  30528f:	e6 21                	out    %al,$0x21
  305291:	0f a9                	pop    %gs
  305293:	0f a1                	pop    %fs
  305295:	1f                   	pop    %ds
  305296:	07                   	pop    %es
  305297:	61                   	popa   
  305298:	cf                   	iret   

00305299 <hwint04>:
  305299:	60                   	pusha  
  30529a:	06                   	push   %es
  30529b:	1e                   	push   %ds
  30529c:	0f a0                	push   %fs
  30529e:	0f a8                	push   %gs
  3052a0:	b8 10 00 00 00       	mov    $0x10,%eax
  3052a5:	8e d8                	mov    %eax,%ds
  3052a7:	8e c0                	mov    %eax,%es
  3052a9:	8e e0                	mov    %eax,%fs
  3052ab:	8e e8                	mov    %eax,%gs
  3052ad:	e4 21                	in     $0x21,%al
  3052af:	0c 10                	or     $0x10,%al
  3052b1:	e6 21                	out    %al,$0x21
  3052b3:	b0 20                	mov    $0x20,%al
  3052b5:	e6 20                	out    %al,$0x20
  3052b7:	b8 04 00 00 00       	mov    $0x4,%eax
  3052bc:	fb                   	sti    
  3052bd:	6a 04                	push   $0x4
  3052bf:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  3052c6:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  3052cd:	83 c4 08             	add    $0x8,%esp
  3052d0:	fa                   	cli    
  3052d1:	e4 21                	in     $0x21,%al
  3052d3:	24 ef                	and    $0xef,%al
  3052d5:	e6 21                	out    %al,$0x21
  3052d7:	0f a9                	pop    %gs
  3052d9:	0f a1                	pop    %fs
  3052db:	1f                   	pop    %ds
  3052dc:	07                   	pop    %es
  3052dd:	61                   	popa   
  3052de:	cf                   	iret   

003052df <hwint05>:
  3052df:	60                   	pusha  
  3052e0:	06                   	push   %es
  3052e1:	1e                   	push   %ds
  3052e2:	0f a0                	push   %fs
  3052e4:	0f a8                	push   %gs
  3052e6:	b8 10 00 00 00       	mov    $0x10,%eax
  3052eb:	8e d8                	mov    %eax,%ds
  3052ed:	8e c0                	mov    %eax,%es
  3052ef:	8e e0                	mov    %eax,%fs
  3052f1:	8e e8                	mov    %eax,%gs
  3052f3:	e4 21                	in     $0x21,%al
  3052f5:	0c 20                	or     $0x20,%al
  3052f7:	e6 21                	out    %al,$0x21
  3052f9:	b0 20                	mov    $0x20,%al
  3052fb:	e6 20                	out    %al,$0x20
  3052fd:	b8 05 00 00 00       	mov    $0x5,%eax
  305302:	fb                   	sti    
  305303:	6a 05                	push   $0x5
  305305:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  30530c:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  305313:	83 c4 08             	add    $0x8,%esp
  305316:	fa                   	cli    
  305317:	e4 21                	in     $0x21,%al
  305319:	24 df                	and    $0xdf,%al
  30531b:	e6 21                	out    %al,$0x21
  30531d:	0f a9                	pop    %gs
  30531f:	0f a1                	pop    %fs
  305321:	1f                   	pop    %ds
  305322:	07                   	pop    %es
  305323:	61                   	popa   
  305324:	cf                   	iret   

00305325 <hwint06>:
  305325:	60                   	pusha  
  305326:	06                   	push   %es
  305327:	1e                   	push   %ds
  305328:	0f a0                	push   %fs
  30532a:	0f a8                	push   %gs
  30532c:	b8 10 00 00 00       	mov    $0x10,%eax
  305331:	8e d8                	mov    %eax,%ds
  305333:	8e c0                	mov    %eax,%es
  305335:	8e e0                	mov    %eax,%fs
  305337:	8e e8                	mov    %eax,%gs
  305339:	e4 21                	in     $0x21,%al
  30533b:	0c 40                	or     $0x40,%al
  30533d:	e6 21                	out    %al,$0x21
  30533f:	b0 20                	mov    $0x20,%al
  305341:	e6 20                	out    %al,$0x20
  305343:	b8 06 00 00 00       	mov    $0x6,%eax
  305348:	fb                   	sti    
  305349:	6a 06                	push   $0x6
  30534b:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  305352:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  305359:	83 c4 08             	add    $0x8,%esp
  30535c:	fa                   	cli    
  30535d:	e4 21                	in     $0x21,%al
  30535f:	24 bf                	and    $0xbf,%al
  305361:	e6 21                	out    %al,$0x21
  305363:	0f a9                	pop    %gs
  305365:	0f a1                	pop    %fs
  305367:	1f                   	pop    %ds
  305368:	07                   	pop    %es
  305369:	61                   	popa   
  30536a:	cf                   	iret   

0030536b <hwint07>:
  30536b:	60                   	pusha  
  30536c:	06                   	push   %es
  30536d:	1e                   	push   %ds
  30536e:	0f a0                	push   %fs
  305370:	0f a8                	push   %gs
  305372:	b8 10 00 00 00       	mov    $0x10,%eax
  305377:	8e d8                	mov    %eax,%ds
  305379:	8e c0                	mov    %eax,%es
  30537b:	8e e0                	mov    %eax,%fs
  30537d:	8e e8                	mov    %eax,%gs
  30537f:	e4 21                	in     $0x21,%al
  305381:	0c 80                	or     $0x80,%al
  305383:	e6 21                	out    %al,$0x21
  305385:	b0 20                	mov    $0x20,%al
  305387:	e6 20                	out    %al,$0x20
  305389:	b8 07 00 00 00       	mov    $0x7,%eax
  30538e:	fb                   	sti    
  30538f:	6a 07                	push   $0x7
  305391:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  305398:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  30539f:	83 c4 08             	add    $0x8,%esp
  3053a2:	fa                   	cli    
  3053a3:	e4 21                	in     $0x21,%al
  3053a5:	24 7f                	and    $0x7f,%al
  3053a7:	e6 21                	out    %al,$0x21
  3053a9:	0f a9                	pop    %gs
  3053ab:	0f a1                	pop    %fs
  3053ad:	1f                   	pop    %ds
  3053ae:	07                   	pop    %es
  3053af:	61                   	popa   
  3053b0:	cf                   	iret   

003053b1 <hwint08>:
  3053b1:	60                   	pusha  
  3053b2:	06                   	push   %es
  3053b3:	1e                   	push   %ds
  3053b4:	0f a0                	push   %fs
  3053b6:	0f a8                	push   %gs
  3053b8:	b8 10 00 00 00       	mov    $0x10,%eax
  3053bd:	8e d8                	mov    %eax,%ds
  3053bf:	8e c0                	mov    %eax,%es
  3053c1:	8e e0                	mov    %eax,%fs
  3053c3:	8e e8                	mov    %eax,%gs
  3053c5:	e4 a1                	in     $0xa1,%al
  3053c7:	0c 01                	or     $0x1,%al
  3053c9:	e6 a1                	out    %al,$0xa1
  3053cb:	b0 20                	mov    $0x20,%al
  3053cd:	e6 20                	out    %al,$0x20
  3053cf:	eb 00                	jmp    3053d1 <hwint08+0x20>
  3053d1:	e6 a0                	out    %al,$0xa0
  3053d3:	b8 08 00 00 00       	mov    $0x8,%eax
  3053d8:	fb                   	sti    
  3053d9:	6a 08                	push   $0x8
  3053db:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  3053e2:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  3053e9:	83 c4 08             	add    $0x8,%esp
  3053ec:	fa                   	cli    
  3053ed:	e4 a1                	in     $0xa1,%al
  3053ef:	24 fe                	and    $0xfe,%al
  3053f1:	e6 a1                	out    %al,$0xa1
  3053f3:	0f a9                	pop    %gs
  3053f5:	0f a1                	pop    %fs
  3053f7:	1f                   	pop    %ds
  3053f8:	07                   	pop    %es
  3053f9:	61                   	popa   
  3053fa:	cf                   	iret   

003053fb <hwint09>:
  3053fb:	60                   	pusha  
  3053fc:	06                   	push   %es
  3053fd:	1e                   	push   %ds
  3053fe:	0f a0                	push   %fs
  305400:	0f a8                	push   %gs
  305402:	b8 10 00 00 00       	mov    $0x10,%eax
  305407:	8e d8                	mov    %eax,%ds
  305409:	8e c0                	mov    %eax,%es
  30540b:	8e e0                	mov    %eax,%fs
  30540d:	8e e8                	mov    %eax,%gs
  30540f:	e4 a1                	in     $0xa1,%al
  305411:	0c 02                	or     $0x2,%al
  305413:	e6 a1                	out    %al,$0xa1
  305415:	b0 20                	mov    $0x20,%al
  305417:	e6 20                	out    %al,$0x20
  305419:	eb 00                	jmp    30541b <hwint09+0x20>
  30541b:	e6 a0                	out    %al,$0xa0
  30541d:	b8 09 00 00 00       	mov    $0x9,%eax
  305422:	fb                   	sti    
  305423:	6a 09                	push   $0x9
  305425:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  30542c:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  305433:	83 c4 08             	add    $0x8,%esp
  305436:	fa                   	cli    
  305437:	e4 a1                	in     $0xa1,%al
  305439:	24 fd                	and    $0xfd,%al
  30543b:	e6 a1                	out    %al,$0xa1
  30543d:	0f a9                	pop    %gs
  30543f:	0f a1                	pop    %fs
  305441:	1f                   	pop    %ds
  305442:	07                   	pop    %es
  305443:	61                   	popa   
  305444:	cf                   	iret   

00305445 <hwint10>:
  305445:	60                   	pusha  
  305446:	06                   	push   %es
  305447:	1e                   	push   %ds
  305448:	0f a0                	push   %fs
  30544a:	0f a8                	push   %gs
  30544c:	b8 10 00 00 00       	mov    $0x10,%eax
  305451:	8e d8                	mov    %eax,%ds
  305453:	8e c0                	mov    %eax,%es
  305455:	8e e0                	mov    %eax,%fs
  305457:	8e e8                	mov    %eax,%gs
  305459:	e4 a1                	in     $0xa1,%al
  30545b:	0c 04                	or     $0x4,%al
  30545d:	e6 a1                	out    %al,$0xa1
  30545f:	b0 20                	mov    $0x20,%al
  305461:	e6 20                	out    %al,$0x20
  305463:	eb 00                	jmp    305465 <hwint10+0x20>
  305465:	e6 a0                	out    %al,$0xa0
  305467:	b8 0a 00 00 00       	mov    $0xa,%eax
  30546c:	fb                   	sti    
  30546d:	6a 0a                	push   $0xa
  30546f:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  305476:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  30547d:	83 c4 08             	add    $0x8,%esp
  305480:	fa                   	cli    
  305481:	e4 a1                	in     $0xa1,%al
  305483:	24 fb                	and    $0xfb,%al
  305485:	e6 a1                	out    %al,$0xa1
  305487:	0f a9                	pop    %gs
  305489:	0f a1                	pop    %fs
  30548b:	1f                   	pop    %ds
  30548c:	07                   	pop    %es
  30548d:	61                   	popa   
  30548e:	cf                   	iret   

0030548f <hwint11>:
  30548f:	60                   	pusha  
  305490:	06                   	push   %es
  305491:	1e                   	push   %ds
  305492:	0f a0                	push   %fs
  305494:	0f a8                	push   %gs
  305496:	b8 10 00 00 00       	mov    $0x10,%eax
  30549b:	8e d8                	mov    %eax,%ds
  30549d:	8e c0                	mov    %eax,%es
  30549f:	8e e0                	mov    %eax,%fs
  3054a1:	8e e8                	mov    %eax,%gs
  3054a3:	e4 a1                	in     $0xa1,%al
  3054a5:	0c 08                	or     $0x8,%al
  3054a7:	e6 a1                	out    %al,$0xa1
  3054a9:	b0 20                	mov    $0x20,%al
  3054ab:	e6 20                	out    %al,$0x20
  3054ad:	eb 00                	jmp    3054af <hwint11+0x20>
  3054af:	e6 a0                	out    %al,$0xa0
  3054b1:	b8 0b 00 00 00       	mov    $0xb,%eax
  3054b6:	fb                   	sti    
  3054b7:	6a 0b                	push   $0xb
  3054b9:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  3054c0:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  3054c7:	83 c4 08             	add    $0x8,%esp
  3054ca:	fa                   	cli    
  3054cb:	e4 a1                	in     $0xa1,%al
  3054cd:	24 f7                	and    $0xf7,%al
  3054cf:	e6 a1                	out    %al,$0xa1
  3054d1:	0f a9                	pop    %gs
  3054d3:	0f a1                	pop    %fs
  3054d5:	1f                   	pop    %ds
  3054d6:	07                   	pop    %es
  3054d7:	61                   	popa   
  3054d8:	cf                   	iret   

003054d9 <hwint12>:
  3054d9:	60                   	pusha  
  3054da:	06                   	push   %es
  3054db:	1e                   	push   %ds
  3054dc:	0f a0                	push   %fs
  3054de:	0f a8                	push   %gs
  3054e0:	b8 10 00 00 00       	mov    $0x10,%eax
  3054e5:	8e d8                	mov    %eax,%ds
  3054e7:	8e c0                	mov    %eax,%es
  3054e9:	8e e0                	mov    %eax,%fs
  3054eb:	8e e8                	mov    %eax,%gs
  3054ed:	e4 a1                	in     $0xa1,%al
  3054ef:	0c 10                	or     $0x10,%al
  3054f1:	e6 a1                	out    %al,$0xa1
  3054f3:	b0 20                	mov    $0x20,%al
  3054f5:	e6 20                	out    %al,$0x20
  3054f7:	eb 00                	jmp    3054f9 <hwint12+0x20>
  3054f9:	e6 a0                	out    %al,$0xa0
  3054fb:	b8 0c 00 00 00       	mov    $0xc,%eax
  305500:	fb                   	sti    
  305501:	6a 0c                	push   $0xc
  305503:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  30550a:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  305511:	83 c4 08             	add    $0x8,%esp
  305514:	fa                   	cli    
  305515:	e4 a1                	in     $0xa1,%al
  305517:	24 ef                	and    $0xef,%al
  305519:	e6 a1                	out    %al,$0xa1
  30551b:	0f a9                	pop    %gs
  30551d:	0f a1                	pop    %fs
  30551f:	1f                   	pop    %ds
  305520:	07                   	pop    %es
  305521:	61                   	popa   
  305522:	cf                   	iret   

00305523 <hwint13>:
  305523:	60                   	pusha  
  305524:	06                   	push   %es
  305525:	1e                   	push   %ds
  305526:	0f a0                	push   %fs
  305528:	0f a8                	push   %gs
  30552a:	b8 10 00 00 00       	mov    $0x10,%eax
  30552f:	8e d8                	mov    %eax,%ds
  305531:	8e c0                	mov    %eax,%es
  305533:	8e e0                	mov    %eax,%fs
  305535:	8e e8                	mov    %eax,%gs
  305537:	e4 a1                	in     $0xa1,%al
  305539:	0c 20                	or     $0x20,%al
  30553b:	e6 a1                	out    %al,$0xa1
  30553d:	b0 20                	mov    $0x20,%al
  30553f:	e6 20                	out    %al,$0x20
  305541:	eb 00                	jmp    305543 <hwint13+0x20>
  305543:	e6 a0                	out    %al,$0xa0
  305545:	b8 0d 00 00 00       	mov    $0xd,%eax
  30554a:	fb                   	sti    
  30554b:	6a 0d                	push   $0xd
  30554d:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  305554:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  30555b:	83 c4 08             	add    $0x8,%esp
  30555e:	fa                   	cli    
  30555f:	e4 a1                	in     $0xa1,%al
  305561:	24 df                	and    $0xdf,%al
  305563:	e6 a1                	out    %al,$0xa1
  305565:	0f a9                	pop    %gs
  305567:	0f a1                	pop    %fs
  305569:	1f                   	pop    %ds
  30556a:	07                   	pop    %es
  30556b:	61                   	popa   
  30556c:	cf                   	iret   

0030556d <hwint14>:
  30556d:	60                   	pusha  
  30556e:	06                   	push   %es
  30556f:	1e                   	push   %ds
  305570:	0f a0                	push   %fs
  305572:	0f a8                	push   %gs
  305574:	b8 10 00 00 00       	mov    $0x10,%eax
  305579:	8e d8                	mov    %eax,%ds
  30557b:	8e c0                	mov    %eax,%es
  30557d:	8e e0                	mov    %eax,%fs
  30557f:	8e e8                	mov    %eax,%gs
  305581:	e4 a1                	in     $0xa1,%al
  305583:	0c 40                	or     $0x40,%al
  305585:	e6 a1                	out    %al,$0xa1
  305587:	b0 20                	mov    $0x20,%al
  305589:	e6 20                	out    %al,$0x20
  30558b:	eb 00                	jmp    30558d <hwint14+0x20>
  30558d:	e6 a0                	out    %al,$0xa0
  30558f:	b8 0e 00 00 00       	mov    $0xe,%eax
  305594:	fb                   	sti    
  305595:	6a 0e                	push   $0xe
  305597:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  30559e:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  3055a5:	83 c4 08             	add    $0x8,%esp
  3055a8:	fa                   	cli    
  3055a9:	e4 a1                	in     $0xa1,%al
  3055ab:	24 bf                	and    $0xbf,%al
  3055ad:	e6 a1                	out    %al,$0xa1
  3055af:	0f a9                	pop    %gs
  3055b1:	0f a1                	pop    %fs
  3055b3:	1f                   	pop    %ds
  3055b4:	07                   	pop    %es
  3055b5:	61                   	popa   
  3055b6:	cf                   	iret   

003055b7 <hwint15>:
  3055b7:	60                   	pusha  
  3055b8:	06                   	push   %es
  3055b9:	1e                   	push   %ds
  3055ba:	0f a0                	push   %fs
  3055bc:	0f a8                	push   %gs
  3055be:	b8 10 00 00 00       	mov    $0x10,%eax
  3055c3:	8e d8                	mov    %eax,%ds
  3055c5:	8e c0                	mov    %eax,%es
  3055c7:	8e e0                	mov    %eax,%fs
  3055c9:	8e e8                	mov    %eax,%gs
  3055cb:	e4 a1                	in     $0xa1,%al
  3055cd:	0c 80                	or     $0x80,%al
  3055cf:	e6 a1                	out    %al,$0xa1
  3055d1:	b0 20                	mov    $0x20,%al
  3055d3:	e6 20                	out    %al,$0x20
  3055d5:	eb 00                	jmp    3055d7 <hwint15+0x20>
  3055d7:	e6 a0                	out    %al,$0xa0
  3055d9:	b8 0f 00 00 00       	mov    $0xf,%eax
  3055de:	fb                   	sti    
  3055df:	6a 0f                	push   $0xf
  3055e1:	ff 34 85 00 52 31 00 	pushl  0x315200(,%eax,4)
  3055e8:	ff 14 85 40 52 31 00 	call   *0x315240(,%eax,4)
  3055ef:	83 c4 08             	add    $0x8,%esp
  3055f2:	fa                   	cli    
  3055f3:	e4 a1                	in     $0xa1,%al
  3055f5:	24 7f                	and    $0x7f,%al
  3055f7:	e6 a1                	out    %al,$0xa1
  3055f9:	0f a9                	pop    %gs
  3055fb:	0f a1                	pop    %fs
  3055fd:	1f                   	pop    %ds
  3055fe:	07                   	pop    %es
  3055ff:	61                   	popa   
  305600:	cf                   	iret   

00305601 <bad_sys_call>:
  305601:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  305606:	eb 24                	jmp    30562c <ret_from_sys_call>

00305608 <sys_call>:
  305608:	fa                   	cli    
  305609:	1e                   	push   %ds
  30560a:	06                   	push   %es
  30560b:	0f a0                	push   %fs
  30560d:	56                   	push   %esi
  30560e:	57                   	push   %edi
  30560f:	52                   	push   %edx
  305610:	51                   	push   %ecx
  305611:	53                   	push   %ebx
  305612:	3b 05 64 30 31 00    	cmp    0x313064,%eax
  305618:	73 e7                	jae    305601 <bad_sys_call>
  30561a:	ba 10 00 00 00       	mov    $0x10,%edx
  30561f:	8e da                	mov    %edx,%ds
  305621:	8e c2                	mov    %edx,%es
  305623:	8e e2                	mov    %edx,%fs
  305625:	ff 14 85 50 30 31 00 	call   *0x313050(,%eax,4)

0030562c <ret_from_sys_call>:
  30562c:	5b                   	pop    %ebx
  30562d:	59                   	pop    %ecx
  30562e:	5a                   	pop    %edx
  30562f:	5f                   	pop    %edi
  305630:	5e                   	pop    %esi
  305631:	0f a1                	pop    %fs
  305633:	07                   	pop    %es
  305634:	1f                   	pop    %ds
  305635:	fb                   	sti    
  305636:	cf                   	iret   
  305637:	90                   	nop

00305638 <panic>:
  305638:	55                   	push   %ebp
  305639:	89 e5                	mov    %esp,%ebp
  30563b:	83 ec 08             	sub    $0x8,%esp
  30563e:	83 ec 08             	sub    $0x8,%esp
  305641:	ff 75 08             	pushl  0x8(%ebp)
  305644:	68 80 d8 30 00       	push   $0x30d880
  305649:	e8 06 00 00 00       	call   305654 <printk>
  30564e:	83 c4 10             	add    $0x10,%esp
  305651:	fa                   	cli    
  305652:	eb fe                	jmp    305652 <panic+0x1a>

00305654 <printk>:
  305654:	55                   	push   %ebp
  305655:	89 e5                	mov    %esp,%ebp
  305657:	83 ec 18             	sub    $0x18,%esp
  30565a:	8d 45 0c             	lea    0xc(%ebp),%eax
  30565d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  305660:	8b 45 f0             	mov    -0x10(%ebp),%eax
  305663:	83 ec 04             	sub    $0x4,%esp
  305666:	50                   	push   %eax
  305667:	ff 75 08             	pushl  0x8(%ebp)
  30566a:	68 00 32 31 00       	push   $0x313200
  30566f:	e8 17 7f 00 00       	call   30d58b <vsprintf>
  305674:	83 c4 10             	add    $0x10,%esp
  305677:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30567a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30567d:	83 ec 04             	sub    $0x4,%esp
  305680:	50                   	push   %eax
  305681:	68 00 32 31 00       	push   $0x313200
  305686:	6a 00                	push   $0x0
  305688:	e8 18 63 00 00       	call   30b9a5 <cons_print>
  30568d:	83 c4 10             	add    $0x10,%esp
  305690:	8b 45 f4             	mov    -0xc(%ebp),%eax
  305693:	c9                   	leave  
  305694:	c3                   	ret    

00305695 <printx>:
  305695:	55                   	push   %ebp
  305696:	89 e5                	mov    %esp,%ebp
  305698:	83 ec 18             	sub    $0x18,%esp
  30569b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3056a2:	e9 d9 00 00 00       	jmp    305780 <printx+0xeb>
  3056a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3056aa:	83 e0 0f             	and    $0xf,%eax
  3056ad:	85 c0                	test   %eax,%eax
  3056af:	0f 85 8e 00 00 00    	jne    305743 <printx+0xae>
  3056b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3056b9:	74 73                	je     30572e <printx+0x99>
  3056bb:	83 ec 0c             	sub    $0xc,%esp
  3056be:	68 93 d8 30 00       	push   $0x30d893
  3056c3:	e8 8c ff ff ff       	call   305654 <printk>
  3056c8:	83 c4 10             	add    $0x10,%esp
  3056cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  3056d2:	eb 44                	jmp    305718 <printx+0x83>
  3056d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3056d7:	8d 50 f0             	lea    -0x10(%eax),%edx
  3056da:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3056dd:	01 d0                	add    %edx,%eax
  3056df:	89 c2                	mov    %eax,%edx
  3056e1:	8b 45 08             	mov    0x8(%ebp),%eax
  3056e4:	01 d0                	add    %edx,%eax
  3056e6:	0f b6 00             	movzbl (%eax),%eax
  3056e9:	88 45 ef             	mov    %al,-0x11(%ebp)
  3056ec:	80 7d ef 20          	cmpb   $0x20,-0x11(%ebp)
  3056f0:	7e 0c                	jle    3056fe <printx+0x69>
  3056f2:	80 7d ef 7f          	cmpb   $0x7f,-0x11(%ebp)
  3056f6:	74 06                	je     3056fe <printx+0x69>
  3056f8:	0f be 45 ef          	movsbl -0x11(%ebp),%eax
  3056fc:	eb 05                	jmp    305703 <printx+0x6e>
  3056fe:	b8 2e 00 00 00       	mov    $0x2e,%eax
  305703:	83 ec 08             	sub    $0x8,%esp
  305706:	50                   	push   %eax
  305707:	68 96 d8 30 00       	push   $0x30d896
  30570c:	e8 43 ff ff ff       	call   305654 <printk>
  305711:	83 c4 10             	add    $0x10,%esp
  305714:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  305718:	83 7d f0 0f          	cmpl   $0xf,-0x10(%ebp)
  30571c:	7e b6                	jle    3056d4 <printx+0x3f>
  30571e:	83 ec 0c             	sub    $0xc,%esp
  305721:	68 99 d8 30 00       	push   $0x30d899
  305726:	e8 29 ff ff ff       	call   305654 <printk>
  30572b:	83 c4 10             	add    $0x10,%esp
  30572e:	83 ec 08             	sub    $0x8,%esp
  305731:	ff 75 f4             	pushl  -0xc(%ebp)
  305734:	68 9b d8 30 00       	push   $0x30d89b
  305739:	e8 16 ff ff ff       	call   305654 <printk>
  30573e:	83 c4 10             	add    $0x10,%esp
  305741:	eb 1a                	jmp    30575d <printx+0xc8>
  305743:	8b 45 f4             	mov    -0xc(%ebp),%eax
  305746:	83 e0 07             	and    $0x7,%eax
  305749:	85 c0                	test   %eax,%eax
  30574b:	75 10                	jne    30575d <printx+0xc8>
  30574d:	83 ec 0c             	sub    $0xc,%esp
  305750:	68 a3 d8 30 00       	push   $0x30d8a3
  305755:	e8 fa fe ff ff       	call   305654 <printk>
  30575a:	83 c4 10             	add    $0x10,%esp
  30575d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  305760:	8b 45 08             	mov    0x8(%ebp),%eax
  305763:	01 d0                	add    %edx,%eax
  305765:	0f b6 00             	movzbl (%eax),%eax
  305768:	0f be c0             	movsbl %al,%eax
  30576b:	83 ec 08             	sub    $0x8,%esp
  30576e:	50                   	push   %eax
  30576f:	68 a7 d8 30 00       	push   $0x30d8a7
  305774:	e8 db fe ff ff       	call   305654 <printk>
  305779:	83 c4 10             	add    $0x10,%esp
  30577c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  305780:	8b 45 f4             	mov    -0xc(%ebp),%eax
  305783:	3b 45 0c             	cmp    0xc(%ebp),%eax
  305786:	0f 82 1b ff ff ff    	jb     3056a7 <printx+0x12>
  30578c:	83 ec 0c             	sub    $0xc,%esp
  30578f:	68 99 d8 30 00       	push   $0x30d899
  305794:	e8 bb fe ff ff       	call   305654 <printk>
  305799:	83 c4 10             	add    $0x10,%esp
  30579c:	c9                   	leave  
  30579d:	c3                   	ret    
  30579e:	66 90                	xchg   %ax,%ax

003057a0 <_run>:
  3057a0:	55                   	push   %ebp
  3057a1:	89 e5                	mov    %esp,%ebp
  3057a3:	57                   	push   %edi
  3057a4:	56                   	push   %esi
  3057a5:	53                   	push   %ebx
  3057a6:	83 ec 10             	sub    $0x10,%esp
  3057a9:	8b 55 10             	mov    0x10(%ebp),%edx
  3057ac:	8b 75 18             	mov    0x18(%ebp),%esi
  3057af:	8b 7d 14             	mov    0x14(%ebp),%edi
  3057b2:	b8 00 00 00 00       	mov    $0x0,%eax
  3057b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3057ba:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  3057bd:	cd 80                	int    $0x80
  3057bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3057c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3057c5:	83 c4 10             	add    $0x10,%esp
  3057c8:	5b                   	pop    %ebx
  3057c9:	5e                   	pop    %esi
  3057ca:	5f                   	pop    %edi
  3057cb:	5d                   	pop    %ebp
  3057cc:	c3                   	ret    

003057cd <print_cpu_info>:
  3057cd:	55                   	push   %ebp
  3057ce:	89 e5                	mov    %esp,%ebp
  3057d0:	83 ec 08             	sub    $0x8,%esp
  3057d3:	8b 45 08             	mov    0x8(%ebp),%eax
  3057d6:	8b 50 30             	mov    0x30(%eax),%edx
  3057d9:	8b 45 08             	mov    0x8(%ebp),%eax
  3057dc:	8b 40 34             	mov    0x34(%eax),%eax
  3057df:	83 ec 04             	sub    $0x4,%esp
  3057e2:	52                   	push   %edx
  3057e3:	50                   	push   %eax
  3057e4:	68 b4 d8 30 00       	push   $0x30d8b4
  3057e9:	e8 66 fe ff ff       	call   305654 <printk>
  3057ee:	83 c4 10             	add    $0x10,%esp
  3057f1:	8b 45 08             	mov    0x8(%ebp),%eax
  3057f4:	8b 50 1c             	mov    0x1c(%eax),%edx
  3057f7:	8b 45 08             	mov    0x8(%ebp),%eax
  3057fa:	8b 40 40             	mov    0x40(%eax),%eax
  3057fd:	83 ec 04             	sub    $0x4,%esp
  305800:	52                   	push   %edx
  305801:	50                   	push   %eax
  305802:	68 d0 d8 30 00       	push   $0x30d8d0
  305807:	e8 48 fe ff ff       	call   305654 <printk>
  30580c:	83 c4 10             	add    $0x10,%esp
  30580f:	8b 45 08             	mov    0x8(%ebp),%eax
  305812:	8b 50 10             	mov    0x10(%eax),%edx
  305815:	8b 45 08             	mov    0x8(%ebp),%eax
  305818:	8b 40 08             	mov    0x8(%eax),%eax
  30581b:	83 ec 04             	sub    $0x4,%esp
  30581e:	52                   	push   %edx
  30581f:	50                   	push   %eax
  305820:	68 e9 d8 30 00       	push   $0x30d8e9
  305825:	e8 2a fe ff ff       	call   305654 <printk>
  30582a:	83 c4 10             	add    $0x10,%esp
  30582d:	8b 45 08             	mov    0x8(%ebp),%eax
  305830:	8b 50 14             	mov    0x14(%eax),%edx
  305833:	8b 45 08             	mov    0x8(%ebp),%eax
  305836:	8b 40 0c             	mov    0xc(%eax),%eax
  305839:	83 ec 04             	sub    $0x4,%esp
  30583c:	52                   	push   %edx
  30583d:	50                   	push   %eax
  30583e:	68 05 d9 30 00       	push   $0x30d905
  305843:	e8 0c fe ff ff       	call   305654 <printk>
  305848:	83 c4 10             	add    $0x10,%esp
  30584b:	8b 45 08             	mov    0x8(%ebp),%eax
  30584e:	8b 50 28             	mov    0x28(%eax),%edx
  305851:	8b 45 08             	mov    0x8(%ebp),%eax
  305854:	8b 40 2c             	mov    0x2c(%eax),%eax
  305857:	83 ec 04             	sub    $0x4,%esp
  30585a:	52                   	push   %edx
  30585b:	50                   	push   %eax
  30585c:	68 1e d9 30 00       	push   $0x30d91e
  305861:	e8 ee fd ff ff       	call   305654 <printk>
  305866:	83 c4 10             	add    $0x10,%esp
  305869:	8b 45 08             	mov    0x8(%ebp),%eax
  30586c:	8b 50 24             	mov    0x24(%eax),%edx
  30586f:	8b 45 08             	mov    0x8(%ebp),%eax
  305872:	8b 40 20             	mov    0x20(%eax),%eax
  305875:	83 ec 04             	sub    $0x4,%esp
  305878:	52                   	push   %edx
  305879:	50                   	push   %eax
  30587a:	68 3a d9 30 00       	push   $0x30d93a
  30587f:	e8 d0 fd ff ff       	call   305654 <printk>
  305884:	83 c4 10             	add    $0x10,%esp
  305887:	c9                   	leave  
  305888:	c3                   	ret    

00305889 <print_task_info>:
  305889:	55                   	push   %ebp
  30588a:	89 e5                	mov    %esp,%ebp
  30588c:	83 ec 08             	sub    $0x8,%esp
  30588f:	a1 04 36 31 00       	mov    0x313604,%eax
  305894:	8d 48 14             	lea    0x14(%eax),%ecx
  305897:	a1 04 36 31 00       	mov    0x313604,%eax
  30589c:	8b 10                	mov    (%eax),%edx
  30589e:	a1 04 36 31 00       	mov    0x313604,%eax
  3058a3:	83 ec 08             	sub    $0x8,%esp
  3058a6:	51                   	push   %ecx
  3058a7:	52                   	push   %edx
  3058a8:	50                   	push   %eax
  3058a9:	ff 75 0c             	pushl  0xc(%ebp)
  3058ac:	ff 75 08             	pushl  0x8(%ebp)
  3058af:	68 54 d9 30 00       	push   $0x30d954
  3058b4:	e8 9b fd ff ff       	call   305654 <printk>
  3058b9:	83 c4 20             	add    $0x20,%esp
  3058bc:	c9                   	leave  
  3058bd:	c3                   	ret    

003058be <die>:
  3058be:	55                   	push   %ebp
  3058bf:	89 e5                	mov    %esp,%ebp
  3058c1:	83 ec 18             	sub    $0x18,%esp
  3058c4:	83 ec 08             	sub    $0x8,%esp
  3058c7:	ff 75 10             	pushl  0x10(%ebp)
  3058ca:	ff 75 08             	pushl  0x8(%ebp)
  3058cd:	e8 b7 ff ff ff       	call   305889 <print_task_info>
  3058d2:	83 c4 10             	add    $0x10,%esp
  3058d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  3058d8:	83 e8 04             	sub    $0x4,%eax
  3058db:	83 ec 0c             	sub    $0xc,%esp
  3058de:	50                   	push   %eax
  3058df:	e8 e9 fe ff ff       	call   3057cd <print_cpu_info>
  3058e4:	83 c4 10             	add    $0x10,%esp
  3058e7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  3058ee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  3058f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3058fc:	83 ec 0c             	sub    $0xc,%esp
  3058ff:	ff 75 f4             	pushl  -0xc(%ebp)
  305902:	ff 75 f0             	pushl  -0x10(%ebp)
  305905:	ff 75 ec             	pushl  -0x14(%ebp)
  305908:	6a 03                	push   $0x3
  30590a:	6a 03                	push   $0x3
  30590c:	e8 8f fe ff ff       	call   3057a0 <_run>
  305911:	83 c4 20             	add    $0x20,%esp
  305914:	c9                   	leave  
  305915:	c3                   	ret    

00305916 <do_divide_error>:
  305916:	55                   	push   %ebp
  305917:	89 e5                	mov    %esp,%ebp
  305919:	83 ec 08             	sub    $0x8,%esp
  30591c:	83 ec 04             	sub    $0x4,%esp
  30591f:	ff 75 08             	pushl  0x8(%ebp)
  305922:	ff 75 0c             	pushl  0xc(%ebp)
  305925:	68 78 d9 30 00       	push   $0x30d978
  30592a:	e8 8f ff ff ff       	call   3058be <die>
  30592f:	83 c4 10             	add    $0x10,%esp
  305932:	c9                   	leave  
  305933:	c3                   	ret    

00305934 <do_debug>:
  305934:	55                   	push   %ebp
  305935:	89 e5                	mov    %esp,%ebp
  305937:	83 ec 08             	sub    $0x8,%esp
  30593a:	83 ec 04             	sub    $0x4,%esp
  30593d:	ff 75 08             	pushl  0x8(%ebp)
  305940:	ff 75 0c             	pushl  0xc(%ebp)
  305943:	68 85 d9 30 00       	push   $0x30d985
  305948:	e8 71 ff ff ff       	call   3058be <die>
  30594d:	83 c4 10             	add    $0x10,%esp
  305950:	83 ec 0c             	sub    $0xc,%esp
  305953:	68 94 d9 30 00       	push   $0x30d994
  305958:	e8 f7 fc ff ff       	call   305654 <printk>
  30595d:	83 c4 10             	add    $0x10,%esp
  305960:	c9                   	leave  
  305961:	c3                   	ret    

00305962 <do_nmi>:
  305962:	55                   	push   %ebp
  305963:	89 e5                	mov    %esp,%ebp
  305965:	83 ec 08             	sub    $0x8,%esp
  305968:	83 ec 04             	sub    $0x4,%esp
  30596b:	ff 75 08             	pushl  0x8(%ebp)
  30596e:	ff 75 0c             	pushl  0xc(%ebp)
  305971:	68 be d9 30 00       	push   $0x30d9be
  305976:	e8 43 ff ff ff       	call   3058be <die>
  30597b:	83 c4 10             	add    $0x10,%esp
  30597e:	c9                   	leave  
  30597f:	c3                   	ret    

00305980 <do_breakpoint>:
  305980:	55                   	push   %ebp
  305981:	89 e5                	mov    %esp,%ebp
  305983:	83 ec 08             	sub    $0x8,%esp
  305986:	83 ec 04             	sub    $0x4,%esp
  305989:	ff 75 08             	pushl  0x8(%ebp)
  30598c:	ff 75 0c             	pushl  0xc(%ebp)
  30598f:	68 c9 d9 30 00       	push   $0x30d9c9
  305994:	e8 25 ff ff ff       	call   3058be <die>
  305999:	83 c4 10             	add    $0x10,%esp
  30599c:	83 ec 0c             	sub    $0xc,%esp
  30599f:	68 db d9 30 00       	push   $0x30d9db
  3059a4:	e8 ab fc ff ff       	call   305654 <printk>
  3059a9:	83 c4 10             	add    $0x10,%esp
  3059ac:	c9                   	leave  
  3059ad:	c3                   	ret    

003059ae <do_overflow>:
  3059ae:	55                   	push   %ebp
  3059af:	89 e5                	mov    %esp,%ebp
  3059b1:	83 ec 08             	sub    $0x8,%esp
  3059b4:	83 ec 04             	sub    $0x4,%esp
  3059b7:	ff 75 08             	pushl  0x8(%ebp)
  3059ba:	ff 75 0c             	pushl  0xc(%ebp)
  3059bd:	68 f1 d9 30 00       	push   $0x30d9f1
  3059c2:	e8 f7 fe ff ff       	call   3058be <die>
  3059c7:	83 c4 10             	add    $0x10,%esp
  3059ca:	c9                   	leave  
  3059cb:	c3                   	ret    

003059cc <do_bounds_check>:
  3059cc:	55                   	push   %ebp
  3059cd:	89 e5                	mov    %esp,%ebp
  3059cf:	83 ec 08             	sub    $0x8,%esp
  3059d2:	83 ec 04             	sub    $0x4,%esp
  3059d5:	ff 75 08             	pushl  0x8(%ebp)
  3059d8:	ff 75 0c             	pushl  0xc(%ebp)
  3059db:	68 fa d9 30 00       	push   $0x30d9fa
  3059e0:	e8 d9 fe ff ff       	call   3058be <die>
  3059e5:	83 c4 10             	add    $0x10,%esp
  3059e8:	c9                   	leave  
  3059e9:	c3                   	ret    

003059ea <do_inval_opcode>:
  3059ea:	55                   	push   %ebp
  3059eb:	89 e5                	mov    %esp,%ebp
  3059ed:	83 ec 08             	sub    $0x8,%esp
  3059f0:	83 ec 04             	sub    $0x4,%esp
  3059f3:	ff 75 08             	pushl  0x8(%ebp)
  3059f6:	ff 75 0c             	pushl  0xc(%ebp)
  3059f9:	68 01 da 30 00       	push   $0x30da01
  3059fe:	e8 bb fe ff ff       	call   3058be <die>
  305a03:	83 c4 10             	add    $0x10,%esp
  305a06:	c9                   	leave  
  305a07:	c3                   	ret    

00305a08 <do_copr_not_available>:
  305a08:	55                   	push   %ebp
  305a09:	89 e5                	mov    %esp,%ebp
  305a0b:	83 ec 08             	sub    $0x8,%esp
  305a0e:	83 ec 04             	sub    $0x4,%esp
  305a11:	ff 75 08             	pushl  0x8(%ebp)
  305a14:	ff 75 0c             	pushl  0xc(%ebp)
  305a17:	68 11 da 30 00       	push   $0x30da11
  305a1c:	e8 9d fe ff ff       	call   3058be <die>
  305a21:	83 c4 10             	add    $0x10,%esp
  305a24:	c9                   	leave  
  305a25:	c3                   	ret    

00305a26 <do_double_fault>:
  305a26:	55                   	push   %ebp
  305a27:	89 e5                	mov    %esp,%ebp
  305a29:	83 ec 08             	sub    $0x8,%esp
  305a2c:	83 ec 04             	sub    $0x4,%esp
  305a2f:	ff 75 08             	pushl  0x8(%ebp)
  305a32:	ff 75 0c             	pushl  0xc(%ebp)
  305a35:	68 25 da 30 00       	push   $0x30da25
  305a3a:	e8 7f fe ff ff       	call   3058be <die>
  305a3f:	83 c4 10             	add    $0x10,%esp
  305a42:	c9                   	leave  
  305a43:	c3                   	ret    

00305a44 <do_copr_seg_overrun>:
  305a44:	55                   	push   %ebp
  305a45:	89 e5                	mov    %esp,%ebp
  305a47:	83 ec 08             	sub    $0x8,%esp
  305a4a:	83 ec 04             	sub    $0x4,%esp
  305a4d:	ff 75 08             	pushl  0x8(%ebp)
  305a50:	ff 75 0c             	pushl  0xc(%ebp)
  305a53:	68 32 da 30 00       	push   $0x30da32
  305a58:	e8 61 fe ff ff       	call   3058be <die>
  305a5d:	83 c4 10             	add    $0x10,%esp
  305a60:	c9                   	leave  
  305a61:	c3                   	ret    

00305a62 <do_inval_tss>:
  305a62:	55                   	push   %ebp
  305a63:	89 e5                	mov    %esp,%ebp
  305a65:	83 ec 08             	sub    $0x8,%esp
  305a68:	83 ec 04             	sub    $0x4,%esp
  305a6b:	ff 75 08             	pushl  0x8(%ebp)
  305a6e:	ff 75 0c             	pushl  0xc(%ebp)
  305a71:	68 47 da 30 00       	push   $0x30da47
  305a76:	e8 43 fe ff ff       	call   3058be <die>
  305a7b:	83 c4 10             	add    $0x10,%esp
  305a7e:	c9                   	leave  
  305a7f:	c3                   	ret    

00305a80 <do_segment_not_present>:
  305a80:	55                   	push   %ebp
  305a81:	89 e5                	mov    %esp,%ebp
  305a83:	83 ec 08             	sub    $0x8,%esp
  305a86:	83 ec 04             	sub    $0x4,%esp
  305a89:	ff 75 08             	pushl  0x8(%ebp)
  305a8c:	ff 75 0c             	pushl  0xc(%ebp)
  305a8f:	68 51 da 30 00       	push   $0x30da51
  305a94:	e8 25 fe ff ff       	call   3058be <die>
  305a99:	83 c4 10             	add    $0x10,%esp
  305a9c:	c9                   	leave  
  305a9d:	c3                   	ret    

00305a9e <do_stack_exception>:
  305a9e:	55                   	push   %ebp
  305a9f:	89 e5                	mov    %esp,%ebp
  305aa1:	83 ec 08             	sub    $0x8,%esp
  305aa4:	83 ec 04             	sub    $0x4,%esp
  305aa7:	ff 75 08             	pushl  0x8(%ebp)
  305aaa:	ff 75 0c             	pushl  0xc(%ebp)
  305aad:	68 65 da 30 00       	push   $0x30da65
  305ab2:	e8 07 fe ff ff       	call   3058be <die>
  305ab7:	83 c4 10             	add    $0x10,%esp
  305aba:	c9                   	leave  
  305abb:	c3                   	ret    

00305abc <do_general_protection>:
  305abc:	55                   	push   %ebp
  305abd:	89 e5                	mov    %esp,%ebp
  305abf:	83 ec 08             	sub    $0x8,%esp
  305ac2:	83 ec 04             	sub    $0x4,%esp
  305ac5:	ff 75 08             	pushl  0x8(%ebp)
  305ac8:	ff 75 0c             	pushl  0xc(%ebp)
  305acb:	68 73 da 30 00       	push   $0x30da73
  305ad0:	e8 e9 fd ff ff       	call   3058be <die>
  305ad5:	83 c4 10             	add    $0x10,%esp
  305ad8:	c9                   	leave  
  305ad9:	c3                   	ret    

00305ada <do_page_fault>:
  305ada:	55                   	push   %ebp
  305adb:	89 e5                	mov    %esp,%ebp
  305add:	83 ec 20             	sub    $0x20,%esp
  305ae0:	0f 20 d0             	mov    %cr2,%eax
  305ae3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  305ae6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  305ae9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  305aec:	8b 45 08             	mov    0x8(%ebp),%eax
  305aef:	83 e0 01             	and    $0x1,%eax
  305af2:	85 c0                	test   %eax,%eax
  305af4:	75 32                	jne    305b28 <do_page_fault+0x4e>
  305af6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  305afd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  305b04:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  305b0b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  305b0e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  305b11:	ff 75 e8             	pushl  -0x18(%ebp)
  305b14:	ff 75 e4             	pushl  -0x1c(%ebp)
  305b17:	ff 75 e0             	pushl  -0x20(%ebp)
  305b1a:	6a 07                	push   $0x7
  305b1c:	6a 03                	push   $0x3
  305b1e:	e8 7d fc ff ff       	call   3057a0 <_run>
  305b23:	83 c4 14             	add    $0x14,%esp
  305b26:	eb 3a                	jmp    305b62 <do_page_fault+0x88>
  305b28:	8b 45 08             	mov    0x8(%ebp),%eax
  305b2b:	83 e0 02             	and    $0x2,%eax
  305b2e:	85 c0                	test   %eax,%eax
  305b30:	74 30                	je     305b62 <do_page_fault+0x88>
  305b32:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  305b39:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  305b40:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  305b47:	8b 45 f8             	mov    -0x8(%ebp),%eax
  305b4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  305b4d:	ff 75 f4             	pushl  -0xc(%ebp)
  305b50:	ff 75 f0             	pushl  -0x10(%ebp)
  305b53:	ff 75 ec             	pushl  -0x14(%ebp)
  305b56:	6a 08                	push   $0x8
  305b58:	6a 03                	push   $0x3
  305b5a:	e8 41 fc ff ff       	call   3057a0 <_run>
  305b5f:	83 c4 14             	add    $0x14,%esp
  305b62:	c9                   	leave  
  305b63:	c3                   	ret    

00305b64 <do_copr_error>:
  305b64:	55                   	push   %ebp
  305b65:	89 e5                	mov    %esp,%ebp
  305b67:	83 ec 08             	sub    $0x8,%esp
  305b6a:	83 ec 04             	sub    $0x4,%esp
  305b6d:	ff 75 08             	pushl  0x8(%ebp)
  305b70:	ff 75 0c             	pushl  0xc(%ebp)
  305b73:	68 86 da 30 00       	push   $0x30da86
  305b78:	e8 41 fd ff ff       	call   3058be <die>
  305b7d:	83 c4 10             	add    $0x10,%esp
  305b80:	c9                   	leave  
  305b81:	c3                   	ret    

00305b82 <do_none>:
  305b82:	55                   	push   %ebp
  305b83:	89 e5                	mov    %esp,%ebp
  305b85:	83 ec 08             	sub    $0x8,%esp
  305b88:	83 ec 04             	sub    $0x4,%esp
  305b8b:	ff 75 08             	pushl  0x8(%ebp)
  305b8e:	ff 75 0c             	pushl  0xc(%ebp)
  305b91:	68 91 da 30 00       	push   $0x30da91
  305b96:	e8 23 fd ff ff       	call   3058be <die>
  305b9b:	83 c4 10             	add    $0x10,%esp
  305b9e:	c9                   	leave  
  305b9f:	c3                   	ret    

00305ba0 <_null>:
  305ba0:	55                   	push   %ebp
  305ba1:	89 e5                	mov    %esp,%ebp
  305ba3:	5d                   	pop    %ebp
  305ba4:	c3                   	ret    

00305ba5 <disable_irq>:
  305ba5:	55                   	push   %ebp
  305ba6:	89 e5                	mov    %esp,%ebp
  305ba8:	83 ec 18             	sub    $0x18,%esp
  305bab:	83 7d 08 10          	cmpl   $0x10,0x8(%ebp)
  305baf:	7f 06                	jg     305bb7 <disable_irq+0x12>
  305bb1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  305bb5:	79 10                	jns    305bc7 <disable_irq+0x22>
  305bb7:	83 ec 0c             	sub    $0xc,%esp
  305bba:	68 a0 da 30 00       	push   $0x30daa0
  305bbf:	e8 74 fa ff ff       	call   305638 <panic>
  305bc4:	83 c4 10             	add    $0x10,%esp
  305bc7:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  305bcb:	7e 1a                	jle    305be7 <disable_irq+0x42>
  305bcd:	8b 45 08             	mov    0x8(%ebp),%eax
  305bd0:	83 e8 08             	sub    $0x8,%eax
  305bd3:	ba 01 00 00 00       	mov    $0x1,%edx
  305bd8:	89 c1                	mov    %eax,%ecx
  305bda:	d3 e2                	shl    %cl,%edx
  305bdc:	89 d0                	mov    %edx,%eax
  305bde:	88 45 f7             	mov    %al,-0x9(%ebp)
  305be1:	c6 45 f6 a1          	movb   $0xa1,-0xa(%ebp)
  305be5:	eb 15                	jmp    305bfc <disable_irq+0x57>
  305be7:	8b 45 08             	mov    0x8(%ebp),%eax
  305bea:	ba 01 00 00 00       	mov    $0x1,%edx
  305bef:	89 c1                	mov    %eax,%ecx
  305bf1:	d3 e2                	shl    %cl,%edx
  305bf3:	89 d0                	mov    %edx,%eax
  305bf5:	88 45 f7             	mov    %al,-0x9(%ebp)
  305bf8:	c6 45 f6 21          	movb   $0x21,-0xa(%ebp)
  305bfc:	fa                   	cli    
  305bfd:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  305c01:	89 c2                	mov    %eax,%edx
  305c03:	ec                   	in     (%dx),%al
  305c04:	88 45 f5             	mov    %al,-0xb(%ebp)
  305c07:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  305c0b:	08 45 f7             	or     %al,-0x9(%ebp)
  305c0e:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  305c12:	0f b6 55 f6          	movzbl -0xa(%ebp),%edx
  305c16:	ee                   	out    %al,(%dx)
  305c17:	fb                   	sti    
  305c18:	c9                   	leave  
  305c19:	c3                   	ret    

00305c1a <enable_irq>:
  305c1a:	55                   	push   %ebp
  305c1b:	89 e5                	mov    %esp,%ebp
  305c1d:	83 ec 18             	sub    $0x18,%esp
  305c20:	83 7d 08 10          	cmpl   $0x10,0x8(%ebp)
  305c24:	7f 06                	jg     305c2c <enable_irq+0x12>
  305c26:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  305c2a:	79 10                	jns    305c3c <enable_irq+0x22>
  305c2c:	83 ec 0c             	sub    $0xc,%esp
  305c2f:	68 a0 da 30 00       	push   $0x30daa0
  305c34:	e8 ff f9 ff ff       	call   305638 <panic>
  305c39:	83 c4 10             	add    $0x10,%esp
  305c3c:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  305c40:	7e 1c                	jle    305c5e <enable_irq+0x44>
  305c42:	8b 45 08             	mov    0x8(%ebp),%eax
  305c45:	83 e8 08             	sub    $0x8,%eax
  305c48:	ba 01 00 00 00       	mov    $0x1,%edx
  305c4d:	89 c1                	mov    %eax,%ecx
  305c4f:	d3 e2                	shl    %cl,%edx
  305c51:	89 d0                	mov    %edx,%eax
  305c53:	f7 d0                	not    %eax
  305c55:	88 45 f7             	mov    %al,-0x9(%ebp)
  305c58:	c6 45 f6 a1          	movb   $0xa1,-0xa(%ebp)
  305c5c:	eb 17                	jmp    305c75 <enable_irq+0x5b>
  305c5e:	8b 45 08             	mov    0x8(%ebp),%eax
  305c61:	ba 01 00 00 00       	mov    $0x1,%edx
  305c66:	89 c1                	mov    %eax,%ecx
  305c68:	d3 e2                	shl    %cl,%edx
  305c6a:	89 d0                	mov    %edx,%eax
  305c6c:	f7 d0                	not    %eax
  305c6e:	88 45 f7             	mov    %al,-0x9(%ebp)
  305c71:	c6 45 f6 21          	movb   $0x21,-0xa(%ebp)
  305c75:	fa                   	cli    
  305c76:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  305c7a:	89 c2                	mov    %eax,%edx
  305c7c:	ec                   	in     (%dx),%al
  305c7d:	eb 00                	jmp    305c7f <enable_irq+0x65>
  305c7f:	eb 00                	jmp    305c81 <enable_irq+0x67>
  305c81:	88 45 f5             	mov    %al,-0xb(%ebp)
  305c84:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  305c88:	20 45 f7             	and    %al,-0x9(%ebp)
  305c8b:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  305c8f:	0f b6 55 f6          	movzbl -0xa(%ebp),%edx
  305c93:	ee                   	out    %al,(%dx)
  305c94:	eb 00                	jmp    305c96 <enable_irq+0x7c>
  305c96:	eb 00                	jmp    305c98 <enable_irq+0x7e>
  305c98:	fb                   	sti    
  305c99:	c9                   	leave  
  305c9a:	c3                   	ret    

00305c9b <spurious_irq>:
  305c9b:	55                   	push   %ebp
  305c9c:	89 e5                	mov    %esp,%ebp
  305c9e:	83 ec 08             	sub    $0x8,%esp
  305ca1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  305ca5:	78 06                	js     305cad <spurious_irq+0x12>
  305ca7:	83 7d 0c 0f          	cmpl   $0xf,0xc(%ebp)
  305cab:	7e 10                	jle    305cbd <spurious_irq+0x22>
  305cad:	83 ec 0c             	sub    $0xc,%esp
  305cb0:	68 b8 da 30 00       	push   $0x30dab8
  305cb5:	e8 7e f9 ff ff       	call   305638 <panic>
  305cba:	83 c4 10             	add    $0x10,%esp
  305cbd:	83 ec 08             	sub    $0x8,%esp
  305cc0:	ff 75 0c             	pushl  0xc(%ebp)
  305cc3:	68 d5 da 30 00       	push   $0x30dad5
  305cc8:	e8 87 f9 ff ff       	call   305654 <printk>
  305ccd:	83 c4 10             	add    $0x10,%esp
  305cd0:	b8 01 00 00 00       	mov    $0x1,%eax
  305cd5:	c9                   	leave  
  305cd6:	c3                   	ret    

00305cd7 <put_irq_handler>:
  305cd7:	55                   	push   %ebp
  305cd8:	89 e5                	mov    %esp,%ebp
  305cda:	83 ec 08             	sub    $0x8,%esp
  305cdd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  305ce1:	78 06                	js     305ce9 <put_irq_handler+0x12>
  305ce3:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  305ce7:	7e 10                	jle    305cf9 <put_irq_handler+0x22>
  305ce9:	83 ec 0c             	sub    $0xc,%esp
  305cec:	68 e8 da 30 00       	push   $0x30dae8
  305cf1:	e8 42 f9 ff ff       	call   305638 <panic>
  305cf6:	83 c4 10             	add    $0x10,%esp
  305cf9:	8b 45 08             	mov    0x8(%ebp),%eax
  305cfc:	8b 04 85 40 52 31 00 	mov    0x315240(,%eax,4),%eax
  305d03:	3b 45 0c             	cmp    0xc(%ebp),%eax
  305d06:	75 02                	jne    305d0a <put_irq_handler+0x33>
  305d08:	eb 5b                	jmp    305d65 <put_irq_handler+0x8e>
  305d0a:	8b 45 08             	mov    0x8(%ebp),%eax
  305d0d:	8b 04 85 40 52 31 00 	mov    0x315240(,%eax,4),%eax
  305d14:	3d 9b 5c 30 00       	cmp    $0x305c9b,%eax
  305d19:	74 10                	je     305d2b <put_irq_handler+0x54>
  305d1b:	83 ec 0c             	sub    $0xc,%esp
  305d1e:	68 08 db 30 00       	push   $0x30db08
  305d23:	e8 10 f9 ff ff       	call   305638 <panic>
  305d28:	83 c4 10             	add    $0x10,%esp
  305d2b:	83 ec 0c             	sub    $0xc,%esp
  305d2e:	ff 75 08             	pushl  0x8(%ebp)
  305d31:	e8 6f fe ff ff       	call   305ba5 <disable_irq>
  305d36:	83 c4 10             	add    $0x10,%esp
  305d39:	8b 45 08             	mov    0x8(%ebp),%eax
  305d3c:	8b 55 0c             	mov    0xc(%ebp),%edx
  305d3f:	89 14 85 40 52 31 00 	mov    %edx,0x315240(,%eax,4)
  305d46:	a1 04 36 31 00       	mov    0x313604,%eax
  305d4b:	8b 10                	mov    (%eax),%edx
  305d4d:	8b 45 08             	mov    0x8(%ebp),%eax
  305d50:	89 14 85 00 52 31 00 	mov    %edx,0x315200(,%eax,4)
  305d57:	83 ec 0c             	sub    $0xc,%esp
  305d5a:	ff 75 08             	pushl  0x8(%ebp)
  305d5d:	e8 b8 fe ff ff       	call   305c1a <enable_irq>
  305d62:	83 c4 10             	add    $0x10,%esp
  305d65:	c9                   	leave  
  305d66:	c3                   	ret    

00305d67 <trap_init>:
  305d67:	55                   	push   %ebp
  305d68:	89 e5                	mov    %esp,%ebp
  305d6a:	83 ec 10             	sub    $0x10,%esp
  305d6d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  305d74:	eb 3d                	jmp    305db3 <trap_init+0x4c>
  305d76:	b8 00 00 20 00       	mov    $0x200000,%eax
  305d7b:	8b 55 fc             	mov    -0x4(%ebp),%edx
  305d7e:	c1 e2 03             	shl    $0x3,%edx
  305d81:	01 d0                	add    %edx,%eax
  305d83:	ba 31 51 30 00       	mov    $0x305131,%edx
  305d88:	0f b7 d2             	movzwl %dx,%edx
  305d8b:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305d91:	89 10                	mov    %edx,(%eax)
  305d93:	b8 00 00 20 00       	mov    $0x200000,%eax
  305d98:	8b 55 fc             	mov    -0x4(%ebp),%edx
  305d9b:	c1 e2 03             	shl    $0x3,%edx
  305d9e:	01 d0                	add    %edx,%eax
  305da0:	ba 31 51 30 00       	mov    $0x305131,%edx
  305da5:	66 ba 00 00          	mov    $0x0,%dx
  305da9:	80 ce 8e             	or     $0x8e,%dh
  305dac:	89 50 04             	mov    %edx,0x4(%eax)
  305daf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  305db3:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  305dba:	7e ba                	jle    305d76 <trap_init+0xf>
  305dbc:	b8 00 00 20 00       	mov    $0x200000,%eax
  305dc1:	ba 68 50 30 00       	mov    $0x305068,%edx
  305dc6:	0f b7 d2             	movzwl %dx,%edx
  305dc9:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305dcf:	89 10                	mov    %edx,(%eax)
  305dd1:	b8 00 00 20 00       	mov    $0x200000,%eax
  305dd6:	ba 68 50 30 00       	mov    $0x305068,%edx
  305ddb:	66 ba 00 00          	mov    $0x0,%dx
  305ddf:	80 ce 8f             	or     $0x8f,%dh
  305de2:	89 50 04             	mov    %edx,0x4(%eax)
  305de5:	b8 00 00 20 00       	mov    $0x200000,%eax
  305dea:	83 c0 08             	add    $0x8,%eax
  305ded:	ba a1 50 30 00       	mov    $0x3050a1,%edx
  305df2:	0f b7 d2             	movzwl %dx,%edx
  305df5:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305dfb:	89 10                	mov    %edx,(%eax)
  305dfd:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e02:	83 c0 08             	add    $0x8,%eax
  305e05:	ba a1 50 30 00       	mov    $0x3050a1,%edx
  305e0a:	66 ba 00 00          	mov    $0x0,%dx
  305e0e:	80 ce 8f             	or     $0x8f,%dh
  305e11:	89 50 04             	mov    %edx,0x4(%eax)
  305e14:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e19:	83 c0 10             	add    $0x10,%eax
  305e1c:	ba aa 50 30 00       	mov    $0x3050aa,%edx
  305e21:	0f b7 d2             	movzwl %dx,%edx
  305e24:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305e2a:	89 10                	mov    %edx,(%eax)
  305e2c:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e31:	83 c0 10             	add    $0x10,%eax
  305e34:	ba aa 50 30 00       	mov    $0x3050aa,%edx
  305e39:	66 ba 00 00          	mov    $0x0,%dx
  305e3d:	80 ce 8e             	or     $0x8e,%dh
  305e40:	89 50 04             	mov    %edx,0x4(%eax)
  305e43:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e48:	83 c0 18             	add    $0x18,%eax
  305e4b:	ba b3 50 30 00       	mov    $0x3050b3,%edx
  305e50:	0f b7 d2             	movzwl %dx,%edx
  305e53:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305e59:	89 10                	mov    %edx,(%eax)
  305e5b:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e60:	83 c0 18             	add    $0x18,%eax
  305e63:	ba b3 50 30 00       	mov    $0x3050b3,%edx
  305e68:	66 ba 00 00          	mov    $0x0,%dx
  305e6c:	80 ce 8f             	or     $0x8f,%dh
  305e6f:	89 50 04             	mov    %edx,0x4(%eax)
  305e72:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e77:	83 c0 20             	add    $0x20,%eax
  305e7a:	ba bc 50 30 00       	mov    $0x3050bc,%edx
  305e7f:	0f b7 d2             	movzwl %dx,%edx
  305e82:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305e88:	89 10                	mov    %edx,(%eax)
  305e8a:	b8 00 00 20 00       	mov    $0x200000,%eax
  305e8f:	83 c0 20             	add    $0x20,%eax
  305e92:	ba bc 50 30 00       	mov    $0x3050bc,%edx
  305e97:	66 ba 00 00          	mov    $0x0,%dx
  305e9b:	80 ce 8f             	or     $0x8f,%dh
  305e9e:	89 50 04             	mov    %edx,0x4(%eax)
  305ea1:	b8 00 00 20 00       	mov    $0x200000,%eax
  305ea6:	83 c0 28             	add    $0x28,%eax
  305ea9:	ba c5 50 30 00       	mov    $0x3050c5,%edx
  305eae:	0f b7 d2             	movzwl %dx,%edx
  305eb1:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305eb7:	89 10                	mov    %edx,(%eax)
  305eb9:	b8 00 00 20 00       	mov    $0x200000,%eax
  305ebe:	83 c0 28             	add    $0x28,%eax
  305ec1:	ba c5 50 30 00       	mov    $0x3050c5,%edx
  305ec6:	66 ba 00 00          	mov    $0x0,%dx
  305eca:	80 ce 8f             	or     $0x8f,%dh
  305ecd:	89 50 04             	mov    %edx,0x4(%eax)
  305ed0:	b8 00 00 20 00       	mov    $0x200000,%eax
  305ed5:	83 c0 30             	add    $0x30,%eax
  305ed8:	ba ce 50 30 00       	mov    $0x3050ce,%edx
  305edd:	0f b7 d2             	movzwl %dx,%edx
  305ee0:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305ee6:	89 10                	mov    %edx,(%eax)
  305ee8:	b8 00 00 20 00       	mov    $0x200000,%eax
  305eed:	83 c0 30             	add    $0x30,%eax
  305ef0:	ba ce 50 30 00       	mov    $0x3050ce,%edx
  305ef5:	66 ba 00 00          	mov    $0x0,%dx
  305ef9:	80 ce 8f             	or     $0x8f,%dh
  305efc:	89 50 04             	mov    %edx,0x4(%eax)
  305eff:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f04:	83 c0 38             	add    $0x38,%eax
  305f07:	ba d7 50 30 00       	mov    $0x3050d7,%edx
  305f0c:	0f b7 d2             	movzwl %dx,%edx
  305f0f:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305f15:	89 10                	mov    %edx,(%eax)
  305f17:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f1c:	83 c0 38             	add    $0x38,%eax
  305f1f:	ba d7 50 30 00       	mov    $0x3050d7,%edx
  305f24:	66 ba 00 00          	mov    $0x0,%dx
  305f28:	80 ce 8f             	or     $0x8f,%dh
  305f2b:	89 50 04             	mov    %edx,0x4(%eax)
  305f2e:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f33:	83 c0 40             	add    $0x40,%eax
  305f36:	ba e0 50 30 00       	mov    $0x3050e0,%edx
  305f3b:	0f b7 d2             	movzwl %dx,%edx
  305f3e:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305f44:	89 10                	mov    %edx,(%eax)
  305f46:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f4b:	83 c0 40             	add    $0x40,%eax
  305f4e:	ba e0 50 30 00       	mov    $0x3050e0,%edx
  305f53:	66 ba 00 00          	mov    $0x0,%dx
  305f57:	80 ce 8f             	or     $0x8f,%dh
  305f5a:	89 50 04             	mov    %edx,0x4(%eax)
  305f5d:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f62:	83 c0 48             	add    $0x48,%eax
  305f65:	ba e7 50 30 00       	mov    $0x3050e7,%edx
  305f6a:	0f b7 d2             	movzwl %dx,%edx
  305f6d:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305f73:	89 10                	mov    %edx,(%eax)
  305f75:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f7a:	83 c0 48             	add    $0x48,%eax
  305f7d:	ba e7 50 30 00       	mov    $0x3050e7,%edx
  305f82:	66 ba 00 00          	mov    $0x0,%dx
  305f86:	80 ce 8f             	or     $0x8f,%dh
  305f89:	89 50 04             	mov    %edx,0x4(%eax)
  305f8c:	b8 00 00 20 00       	mov    $0x200000,%eax
  305f91:	83 c0 50             	add    $0x50,%eax
  305f94:	ba f3 50 30 00       	mov    $0x3050f3,%edx
  305f99:	0f b7 d2             	movzwl %dx,%edx
  305f9c:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305fa2:	89 10                	mov    %edx,(%eax)
  305fa4:	b8 00 00 20 00       	mov    $0x200000,%eax
  305fa9:	83 c0 50             	add    $0x50,%eax
  305fac:	ba f3 50 30 00       	mov    $0x3050f3,%edx
  305fb1:	66 ba 00 00          	mov    $0x0,%dx
  305fb5:	80 ce 8f             	or     $0x8f,%dh
  305fb8:	89 50 04             	mov    %edx,0x4(%eax)
  305fbb:	b8 00 00 20 00       	mov    $0x200000,%eax
  305fc0:	83 c0 58             	add    $0x58,%eax
  305fc3:	ba fd 50 30 00       	mov    $0x3050fd,%edx
  305fc8:	0f b7 d2             	movzwl %dx,%edx
  305fcb:	81 ca 00 00 08 00    	or     $0x80000,%edx
  305fd1:	89 10                	mov    %edx,(%eax)
  305fd3:	b8 00 00 20 00       	mov    $0x200000,%eax
  305fd8:	83 c0 58             	add    $0x58,%eax
  305fdb:	ba fd 50 30 00       	mov    $0x3050fd,%edx
  305fe0:	66 ba 00 00          	mov    $0x0,%dx
  305fe4:	80 ce 8f             	or     $0x8f,%dh
  305fe7:	89 50 04             	mov    %edx,0x4(%eax)
  305fea:	b8 00 00 20 00       	mov    $0x200000,%eax
  305fef:	83 c0 60             	add    $0x60,%eax
  305ff2:	ba 07 51 30 00       	mov    $0x305107,%edx
  305ff7:	0f b7 d2             	movzwl %dx,%edx
  305ffa:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306000:	89 10                	mov    %edx,(%eax)
  306002:	b8 00 00 20 00       	mov    $0x200000,%eax
  306007:	83 c0 60             	add    $0x60,%eax
  30600a:	ba 07 51 30 00       	mov    $0x305107,%edx
  30600f:	66 ba 00 00          	mov    $0x0,%dx
  306013:	80 ce 8f             	or     $0x8f,%dh
  306016:	89 50 04             	mov    %edx,0x4(%eax)
  306019:	b8 00 00 20 00       	mov    $0x200000,%eax
  30601e:	83 c0 68             	add    $0x68,%eax
  306021:	ba 11 51 30 00       	mov    $0x305111,%edx
  306026:	0f b7 d2             	movzwl %dx,%edx
  306029:	81 ca 00 00 08 00    	or     $0x80000,%edx
  30602f:	89 10                	mov    %edx,(%eax)
  306031:	b8 00 00 20 00       	mov    $0x200000,%eax
  306036:	83 c0 68             	add    $0x68,%eax
  306039:	ba 11 51 30 00       	mov    $0x305111,%edx
  30603e:	66 ba 00 00          	mov    $0x0,%dx
  306042:	80 ce 8f             	or     $0x8f,%dh
  306045:	89 50 04             	mov    %edx,0x4(%eax)
  306048:	b8 00 00 20 00       	mov    $0x200000,%eax
  30604d:	83 c0 70             	add    $0x70,%eax
  306050:	ba 1b 51 30 00       	mov    $0x30511b,%edx
  306055:	0f b7 d2             	movzwl %dx,%edx
  306058:	81 ca 00 00 08 00    	or     $0x80000,%edx
  30605e:	89 10                	mov    %edx,(%eax)
  306060:	b8 00 00 20 00       	mov    $0x200000,%eax
  306065:	83 c0 70             	add    $0x70,%eax
  306068:	ba 1b 51 30 00       	mov    $0x30511b,%edx
  30606d:	66 ba 00 00          	mov    $0x0,%dx
  306071:	80 ce 8f             	or     $0x8f,%dh
  306074:	89 50 04             	mov    %edx,0x4(%eax)
  306077:	b8 00 00 20 00       	mov    $0x200000,%eax
  30607c:	83 e8 80             	sub    $0xffffff80,%eax
  30607f:	ba 25 51 30 00       	mov    $0x305125,%edx
  306084:	0f b7 d2             	movzwl %dx,%edx
  306087:	81 ca 00 00 08 00    	or     $0x80000,%edx
  30608d:	89 10                	mov    %edx,(%eax)
  30608f:	b8 00 00 20 00       	mov    $0x200000,%eax
  306094:	83 e8 80             	sub    $0xffffff80,%eax
  306097:	ba 25 51 30 00       	mov    $0x305125,%edx
  30609c:	66 ba 00 00          	mov    $0x0,%dx
  3060a0:	80 ce 8f             	or     $0x8f,%dh
  3060a3:	89 50 04             	mov    %edx,0x4(%eax)
  3060a6:	b8 00 00 20 00       	mov    $0x200000,%eax
  3060ab:	05 00 01 00 00       	add    $0x100,%eax
  3060b0:	ba 69 51 30 00       	mov    $0x305169,%edx
  3060b5:	0f b7 d2             	movzwl %dx,%edx
  3060b8:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3060be:	89 10                	mov    %edx,(%eax)
  3060c0:	b8 00 00 20 00       	mov    $0x200000,%eax
  3060c5:	05 00 01 00 00       	add    $0x100,%eax
  3060ca:	ba 69 51 30 00       	mov    $0x305169,%edx
  3060cf:	66 ba 00 00          	mov    $0x0,%dx
  3060d3:	80 ce 8e             	or     $0x8e,%dh
  3060d6:	89 50 04             	mov    %edx,0x4(%eax)
  3060d9:	b8 00 00 20 00       	mov    $0x200000,%eax
  3060de:	05 08 01 00 00       	add    $0x108,%eax
  3060e3:	ba c7 51 30 00       	mov    $0x3051c7,%edx
  3060e8:	0f b7 d2             	movzwl %dx,%edx
  3060eb:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3060f1:	89 10                	mov    %edx,(%eax)
  3060f3:	b8 00 00 20 00       	mov    $0x200000,%eax
  3060f8:	05 08 01 00 00       	add    $0x108,%eax
  3060fd:	ba c7 51 30 00       	mov    $0x3051c7,%edx
  306102:	66 ba 00 00          	mov    $0x0,%dx
  306106:	80 ce 8e             	or     $0x8e,%dh
  306109:	89 50 04             	mov    %edx,0x4(%eax)
  30610c:	b8 00 00 20 00       	mov    $0x200000,%eax
  306111:	05 10 01 00 00       	add    $0x110,%eax
  306116:	ba 0d 52 30 00       	mov    $0x30520d,%edx
  30611b:	0f b7 d2             	movzwl %dx,%edx
  30611e:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306124:	89 10                	mov    %edx,(%eax)
  306126:	b8 00 00 20 00       	mov    $0x200000,%eax
  30612b:	05 10 01 00 00       	add    $0x110,%eax
  306130:	ba 0d 52 30 00       	mov    $0x30520d,%edx
  306135:	66 ba 00 00          	mov    $0x0,%dx
  306139:	80 ce 8e             	or     $0x8e,%dh
  30613c:	89 50 04             	mov    %edx,0x4(%eax)
  30613f:	b8 00 00 20 00       	mov    $0x200000,%eax
  306144:	05 18 01 00 00       	add    $0x118,%eax
  306149:	ba 53 52 30 00       	mov    $0x305253,%edx
  30614e:	0f b7 d2             	movzwl %dx,%edx
  306151:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306157:	89 10                	mov    %edx,(%eax)
  306159:	b8 00 00 20 00       	mov    $0x200000,%eax
  30615e:	05 18 01 00 00       	add    $0x118,%eax
  306163:	ba 53 52 30 00       	mov    $0x305253,%edx
  306168:	66 ba 00 00          	mov    $0x0,%dx
  30616c:	80 ce 8e             	or     $0x8e,%dh
  30616f:	89 50 04             	mov    %edx,0x4(%eax)
  306172:	b8 00 00 20 00       	mov    $0x200000,%eax
  306177:	05 20 01 00 00       	add    $0x120,%eax
  30617c:	ba 99 52 30 00       	mov    $0x305299,%edx
  306181:	0f b7 d2             	movzwl %dx,%edx
  306184:	81 ca 00 00 08 00    	or     $0x80000,%edx
  30618a:	89 10                	mov    %edx,(%eax)
  30618c:	b8 00 00 20 00       	mov    $0x200000,%eax
  306191:	05 20 01 00 00       	add    $0x120,%eax
  306196:	ba 99 52 30 00       	mov    $0x305299,%edx
  30619b:	66 ba 00 00          	mov    $0x0,%dx
  30619f:	80 ce 8e             	or     $0x8e,%dh
  3061a2:	89 50 04             	mov    %edx,0x4(%eax)
  3061a5:	b8 00 00 20 00       	mov    $0x200000,%eax
  3061aa:	05 28 01 00 00       	add    $0x128,%eax
  3061af:	ba df 52 30 00       	mov    $0x3052df,%edx
  3061b4:	0f b7 d2             	movzwl %dx,%edx
  3061b7:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3061bd:	89 10                	mov    %edx,(%eax)
  3061bf:	b8 00 00 20 00       	mov    $0x200000,%eax
  3061c4:	05 28 01 00 00       	add    $0x128,%eax
  3061c9:	ba df 52 30 00       	mov    $0x3052df,%edx
  3061ce:	66 ba 00 00          	mov    $0x0,%dx
  3061d2:	80 ce 8e             	or     $0x8e,%dh
  3061d5:	89 50 04             	mov    %edx,0x4(%eax)
  3061d8:	b8 00 00 20 00       	mov    $0x200000,%eax
  3061dd:	05 30 01 00 00       	add    $0x130,%eax
  3061e2:	ba 25 53 30 00       	mov    $0x305325,%edx
  3061e7:	0f b7 d2             	movzwl %dx,%edx
  3061ea:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3061f0:	89 10                	mov    %edx,(%eax)
  3061f2:	b8 00 00 20 00       	mov    $0x200000,%eax
  3061f7:	05 30 01 00 00       	add    $0x130,%eax
  3061fc:	ba 25 53 30 00       	mov    $0x305325,%edx
  306201:	66 ba 00 00          	mov    $0x0,%dx
  306205:	80 ce 8e             	or     $0x8e,%dh
  306208:	89 50 04             	mov    %edx,0x4(%eax)
  30620b:	b8 00 00 20 00       	mov    $0x200000,%eax
  306210:	05 38 01 00 00       	add    $0x138,%eax
  306215:	ba 6b 53 30 00       	mov    $0x30536b,%edx
  30621a:	0f b7 d2             	movzwl %dx,%edx
  30621d:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306223:	89 10                	mov    %edx,(%eax)
  306225:	b8 00 00 20 00       	mov    $0x200000,%eax
  30622a:	05 38 01 00 00       	add    $0x138,%eax
  30622f:	ba 6b 53 30 00       	mov    $0x30536b,%edx
  306234:	66 ba 00 00          	mov    $0x0,%dx
  306238:	80 ce 8e             	or     $0x8e,%dh
  30623b:	89 50 04             	mov    %edx,0x4(%eax)
  30623e:	b8 00 00 20 00       	mov    $0x200000,%eax
  306243:	05 40 01 00 00       	add    $0x140,%eax
  306248:	ba b1 53 30 00       	mov    $0x3053b1,%edx
  30624d:	0f b7 d2             	movzwl %dx,%edx
  306250:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306256:	89 10                	mov    %edx,(%eax)
  306258:	b8 00 00 20 00       	mov    $0x200000,%eax
  30625d:	05 40 01 00 00       	add    $0x140,%eax
  306262:	ba b1 53 30 00       	mov    $0x3053b1,%edx
  306267:	66 ba 00 00          	mov    $0x0,%dx
  30626b:	80 ce 8e             	or     $0x8e,%dh
  30626e:	89 50 04             	mov    %edx,0x4(%eax)
  306271:	b8 00 00 20 00       	mov    $0x200000,%eax
  306276:	05 48 01 00 00       	add    $0x148,%eax
  30627b:	ba fb 53 30 00       	mov    $0x3053fb,%edx
  306280:	0f b7 d2             	movzwl %dx,%edx
  306283:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306289:	89 10                	mov    %edx,(%eax)
  30628b:	b8 00 00 20 00       	mov    $0x200000,%eax
  306290:	05 48 01 00 00       	add    $0x148,%eax
  306295:	ba fb 53 30 00       	mov    $0x3053fb,%edx
  30629a:	66 ba 00 00          	mov    $0x0,%dx
  30629e:	80 ce 8e             	or     $0x8e,%dh
  3062a1:	89 50 04             	mov    %edx,0x4(%eax)
  3062a4:	b8 00 00 20 00       	mov    $0x200000,%eax
  3062a9:	05 50 01 00 00       	add    $0x150,%eax
  3062ae:	ba 45 54 30 00       	mov    $0x305445,%edx
  3062b3:	0f b7 d2             	movzwl %dx,%edx
  3062b6:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3062bc:	89 10                	mov    %edx,(%eax)
  3062be:	b8 00 00 20 00       	mov    $0x200000,%eax
  3062c3:	05 50 01 00 00       	add    $0x150,%eax
  3062c8:	ba 45 54 30 00       	mov    $0x305445,%edx
  3062cd:	66 ba 00 00          	mov    $0x0,%dx
  3062d1:	80 ce 8e             	or     $0x8e,%dh
  3062d4:	89 50 04             	mov    %edx,0x4(%eax)
  3062d7:	b8 00 00 20 00       	mov    $0x200000,%eax
  3062dc:	05 58 01 00 00       	add    $0x158,%eax
  3062e1:	ba 8f 54 30 00       	mov    $0x30548f,%edx
  3062e6:	0f b7 d2             	movzwl %dx,%edx
  3062e9:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3062ef:	89 10                	mov    %edx,(%eax)
  3062f1:	b8 00 00 20 00       	mov    $0x200000,%eax
  3062f6:	05 58 01 00 00       	add    $0x158,%eax
  3062fb:	ba 8f 54 30 00       	mov    $0x30548f,%edx
  306300:	66 ba 00 00          	mov    $0x0,%dx
  306304:	80 ce 8e             	or     $0x8e,%dh
  306307:	89 50 04             	mov    %edx,0x4(%eax)
  30630a:	b8 00 00 20 00       	mov    $0x200000,%eax
  30630f:	05 60 01 00 00       	add    $0x160,%eax
  306314:	ba d9 54 30 00       	mov    $0x3054d9,%edx
  306319:	0f b7 d2             	movzwl %dx,%edx
  30631c:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306322:	89 10                	mov    %edx,(%eax)
  306324:	b8 00 00 20 00       	mov    $0x200000,%eax
  306329:	05 60 01 00 00       	add    $0x160,%eax
  30632e:	ba d9 54 30 00       	mov    $0x3054d9,%edx
  306333:	66 ba 00 00          	mov    $0x0,%dx
  306337:	80 ce 8e             	or     $0x8e,%dh
  30633a:	89 50 04             	mov    %edx,0x4(%eax)
  30633d:	b8 00 00 20 00       	mov    $0x200000,%eax
  306342:	05 68 01 00 00       	add    $0x168,%eax
  306347:	ba 23 55 30 00       	mov    $0x305523,%edx
  30634c:	0f b7 d2             	movzwl %dx,%edx
  30634f:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306355:	89 10                	mov    %edx,(%eax)
  306357:	b8 00 00 20 00       	mov    $0x200000,%eax
  30635c:	05 68 01 00 00       	add    $0x168,%eax
  306361:	ba 23 55 30 00       	mov    $0x305523,%edx
  306366:	66 ba 00 00          	mov    $0x0,%dx
  30636a:	80 ce 8e             	or     $0x8e,%dh
  30636d:	89 50 04             	mov    %edx,0x4(%eax)
  306370:	b8 00 00 20 00       	mov    $0x200000,%eax
  306375:	05 70 01 00 00       	add    $0x170,%eax
  30637a:	ba 6d 55 30 00       	mov    $0x30556d,%edx
  30637f:	0f b7 d2             	movzwl %dx,%edx
  306382:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306388:	89 10                	mov    %edx,(%eax)
  30638a:	b8 00 00 20 00       	mov    $0x200000,%eax
  30638f:	05 70 01 00 00       	add    $0x170,%eax
  306394:	ba 6d 55 30 00       	mov    $0x30556d,%edx
  306399:	66 ba 00 00          	mov    $0x0,%dx
  30639d:	80 ce 8e             	or     $0x8e,%dh
  3063a0:	89 50 04             	mov    %edx,0x4(%eax)
  3063a3:	b8 00 00 20 00       	mov    $0x200000,%eax
  3063a8:	05 78 01 00 00       	add    $0x178,%eax
  3063ad:	ba b7 55 30 00       	mov    $0x3055b7,%edx
  3063b2:	0f b7 d2             	movzwl %dx,%edx
  3063b5:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3063bb:	89 10                	mov    %edx,(%eax)
  3063bd:	b8 00 00 20 00       	mov    $0x200000,%eax
  3063c2:	05 78 01 00 00       	add    $0x178,%eax
  3063c7:	ba b7 55 30 00       	mov    $0x3055b7,%edx
  3063cc:	66 ba 00 00          	mov    $0x0,%dx
  3063d0:	80 ce 8e             	or     $0x8e,%dh
  3063d3:	89 50 04             	mov    %edx,0x4(%eax)
  3063d6:	b8 00 00 20 00       	mov    $0x200000,%eax
  3063db:	05 00 04 00 00       	add    $0x400,%eax
  3063e0:	ba 08 56 30 00       	mov    $0x305608,%edx
  3063e5:	0f b7 d2             	movzwl %dx,%edx
  3063e8:	81 ca 00 00 08 00    	or     $0x80000,%edx
  3063ee:	89 10                	mov    %edx,(%eax)
  3063f0:	b8 00 00 20 00       	mov    $0x200000,%eax
  3063f5:	05 00 04 00 00       	add    $0x400,%eax
  3063fa:	ba 08 56 30 00       	mov    $0x305608,%edx
  3063ff:	66 ba 00 00          	mov    $0x0,%dx
  306403:	80 ce ee             	or     $0xee,%dh
  306406:	89 50 04             	mov    %edx,0x4(%eax)
  306409:	b8 00 00 20 00       	mov    $0x200000,%eax
  30640e:	05 08 04 00 00       	add    $0x408,%eax
  306413:	ba 3d 51 30 00       	mov    $0x30513d,%edx
  306418:	0f b7 d2             	movzwl %dx,%edx
  30641b:	81 ca 00 00 08 00    	or     $0x80000,%edx
  306421:	89 10                	mov    %edx,(%eax)
  306423:	b8 00 00 20 00       	mov    $0x200000,%eax
  306428:	05 08 04 00 00       	add    $0x408,%eax
  30642d:	ba 3d 51 30 00       	mov    $0x30513d,%edx
  306432:	66 ba 00 00          	mov    $0x0,%dx
  306436:	80 ce ee             	or     $0xee,%dh
  306439:	89 50 04             	mov    %edx,0x4(%eax)
  30643c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  306443:	eb 12                	jmp    306457 <trap_init+0x6f0>
  306445:	8b 45 f8             	mov    -0x8(%ebp),%eax
  306448:	c7 04 85 40 52 31 00 	movl   $0x305c9b,0x315240(,%eax,4)
  30644f:	9b 5c 30 00 
  306453:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  306457:	83 7d f8 0f          	cmpl   $0xf,-0x8(%ebp)
  30645b:	7e e8                	jle    306445 <trap_init+0x6de>
  30645d:	b8 11 00 00 00       	mov    $0x11,%eax
  306462:	ba 20 00 00 00       	mov    $0x20,%edx
  306467:	ee                   	out    %al,(%dx)
  306468:	eb 00                	jmp    30646a <trap_init+0x703>
  30646a:	eb 00                	jmp    30646c <trap_init+0x705>
  30646c:	b8 20 00 00 00       	mov    $0x20,%eax
  306471:	ba 21 00 00 00       	mov    $0x21,%edx
  306476:	ee                   	out    %al,(%dx)
  306477:	eb 00                	jmp    306479 <trap_init+0x712>
  306479:	eb 00                	jmp    30647b <trap_init+0x714>
  30647b:	b8 04 00 00 00       	mov    $0x4,%eax
  306480:	ba 21 00 00 00       	mov    $0x21,%edx
  306485:	ee                   	out    %al,(%dx)
  306486:	eb 00                	jmp    306488 <trap_init+0x721>
  306488:	eb 00                	jmp    30648a <trap_init+0x723>
  30648a:	b8 01 00 00 00       	mov    $0x1,%eax
  30648f:	ba 21 00 00 00       	mov    $0x21,%edx
  306494:	ee                   	out    %al,(%dx)
  306495:	eb 00                	jmp    306497 <trap_init+0x730>
  306497:	eb 00                	jmp    306499 <trap_init+0x732>
  306499:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
  30649e:	ba 21 00 00 00       	mov    $0x21,%edx
  3064a3:	ee                   	out    %al,(%dx)
  3064a4:	eb 00                	jmp    3064a6 <trap_init+0x73f>
  3064a6:	eb 00                	jmp    3064a8 <trap_init+0x741>
  3064a8:	b8 11 00 00 00       	mov    $0x11,%eax
  3064ad:	ba a0 00 00 00       	mov    $0xa0,%edx
  3064b2:	ee                   	out    %al,(%dx)
  3064b3:	eb 00                	jmp    3064b5 <trap_init+0x74e>
  3064b5:	eb 00                	jmp    3064b7 <trap_init+0x750>
  3064b7:	b8 28 00 00 00       	mov    $0x28,%eax
  3064bc:	ba a1 00 00 00       	mov    $0xa1,%edx
  3064c1:	ee                   	out    %al,(%dx)
  3064c2:	eb 00                	jmp    3064c4 <trap_init+0x75d>
  3064c4:	eb 00                	jmp    3064c6 <trap_init+0x75f>
  3064c6:	b8 02 00 00 00       	mov    $0x2,%eax
  3064cb:	ba a1 00 00 00       	mov    $0xa1,%edx
  3064d0:	ee                   	out    %al,(%dx)
  3064d1:	eb 00                	jmp    3064d3 <trap_init+0x76c>
  3064d3:	eb 00                	jmp    3064d5 <trap_init+0x76e>
  3064d5:	b8 01 00 00 00       	mov    $0x1,%eax
  3064da:	ba a1 00 00 00       	mov    $0xa1,%edx
  3064df:	ee                   	out    %al,(%dx)
  3064e0:	eb 00                	jmp    3064e2 <trap_init+0x77b>
  3064e2:	eb 00                	jmp    3064e4 <trap_init+0x77d>
  3064e4:	b8 ff 00 00 00       	mov    $0xff,%eax
  3064e9:	ba a1 00 00 00       	mov    $0xa1,%edx
  3064ee:	ee                   	out    %al,(%dx)
  3064ef:	eb 00                	jmp    3064f1 <trap_init+0x78a>
  3064f1:	eb 00                	jmp    3064f3 <trap_init+0x78c>
  3064f3:	c9                   	leave  
  3064f4:	c3                   	ret    
  3064f5:	66 90                	xchg   %ax,%ax
  3064f7:	90                   	nop

003064f8 <strcpy>:
  3064f8:	55                   	push   %ebp
  3064f9:	89 e5                	mov    %esp,%ebp
  3064fb:	57                   	push   %edi
  3064fc:	56                   	push   %esi
  3064fd:	8b 55 0c             	mov    0xc(%ebp),%edx
  306500:	8b 4d 08             	mov    0x8(%ebp),%ecx
  306503:	89 d6                	mov    %edx,%esi
  306505:	89 cf                	mov    %ecx,%edi
  306507:	fc                   	cld    
  306508:	ac                   	lods   %ds:(%esi),%al
  306509:	aa                   	stos   %al,%es:(%edi)
  30650a:	84 c0                	test   %al,%al
  30650c:	75 fa                	jne    306508 <strcpy+0x10>
  30650e:	8b 45 08             	mov    0x8(%ebp),%eax
  306511:	5e                   	pop    %esi
  306512:	5f                   	pop    %edi
  306513:	5d                   	pop    %ebp
  306514:	c3                   	ret    

00306515 <memcpy>:
  306515:	55                   	push   %ebp
  306516:	89 e5                	mov    %esp,%ebp
  306518:	57                   	push   %edi
  306519:	56                   	push   %esi
  30651a:	53                   	push   %ebx
  30651b:	8b 45 10             	mov    0x10(%ebp),%eax
  30651e:	8b 55 0c             	mov    0xc(%ebp),%edx
  306521:	8b 5d 08             	mov    0x8(%ebp),%ebx
  306524:	89 c1                	mov    %eax,%ecx
  306526:	89 d6                	mov    %edx,%esi
  306528:	89 df                	mov    %ebx,%edi
  30652a:	fc                   	cld    
  30652b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  30652d:	8b 45 08             	mov    0x8(%ebp),%eax
  306530:	5b                   	pop    %ebx
  306531:	5e                   	pop    %esi
  306532:	5f                   	pop    %edi
  306533:	5d                   	pop    %ebp
  306534:	c3                   	ret    

00306535 <pick_task>:
  306535:	55                   	push   %ebp
  306536:	89 e5                	mov    %esp,%ebp
  306538:	83 ec 18             	sub    $0x18,%esp
  30653b:	a1 04 36 31 00       	mov    0x313604,%eax
  306540:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306543:	a1 04 36 31 00       	mov    0x313604,%eax
  306548:	8b 55 08             	mov    0x8(%ebp),%edx
  30654b:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
  306551:	a1 10 36 31 00       	mov    0x313610,%eax
  306556:	85 c0                	test   %eax,%eax
  306558:	74 0c                	je     306566 <pick_task+0x31>
  30655a:	a1 10 36 31 00       	mov    0x313610,%eax
  30655f:	a3 04 36 31 00       	mov    %eax,0x313604
  306564:	eb 1f                	jmp    306585 <pick_task+0x50>
  306566:	a1 14 36 31 00       	mov    0x313614,%eax
  30656b:	85 c0                	test   %eax,%eax
  30656d:	74 0c                	je     30657b <pick_task+0x46>
  30656f:	a1 14 36 31 00       	mov    0x313614,%eax
  306574:	a3 04 36 31 00       	mov    %eax,0x313604
  306579:	eb 0a                	jmp    306585 <pick_task+0x50>
  30657b:	a1 18 36 31 00       	mov    0x313618,%eax
  306580:	a3 04 36 31 00       	mov    %eax,0x313604
  306585:	a1 28 36 31 00       	mov    0x313628,%eax
  30658a:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306590:	81 c2 00 10 00 00    	add    $0x1000,%edx
  306596:	89 50 04             	mov    %edx,0x4(%eax)
  306599:	a1 04 36 31 00       	mov    0x313604,%eax
  30659e:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  3065a4:	a3 08 36 31 00       	mov    %eax,0x313608
  3065a9:	a1 08 36 31 00       	mov    0x313608,%eax
  3065ae:	3d d4 f0 7f 00       	cmp    $0x7ff0d4,%eax
  3065b3:	75 52                	jne    306607 <pick_task+0xd2>
  3065b5:	a1 08 36 31 00       	mov    0x313608,%eax
  3065ba:	8b 15 04 36 31 00    	mov    0x313604,%edx
  3065c0:	8d 4a 14             	lea    0x14(%edx),%ecx
  3065c3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  3065c6:	83 c2 14             	add    $0x14,%edx
  3065c9:	50                   	push   %eax
  3065ca:	51                   	push   %ecx
  3065cb:	52                   	push   %edx
  3065cc:	68 38 db 30 00       	push   $0x30db38
  3065d1:	e8 7e f0 ff ff       	call   305654 <printk>
  3065d6:	83 c4 10             	add    $0x10,%esp
  3065d9:	a1 04 36 31 00       	mov    0x313604,%eax
  3065de:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
  3065e4:	8b 50 30             	mov    0x30(%eax),%edx
  3065e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3065ea:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
  3065f0:	8b 40 30             	mov    0x30(%eax),%eax
  3065f3:	83 ec 04             	sub    $0x4,%esp
  3065f6:	52                   	push   %edx
  3065f7:	50                   	push   %eax
  3065f8:	68 4e db 30 00       	push   $0x30db4e
  3065fd:	e8 52 f0 ff ff       	call   305654 <printk>
  306602:	83 c4 10             	add    $0x10,%esp
  306605:	eb fe                	jmp    306605 <pick_task+0xd0>
  306607:	a1 04 36 31 00       	mov    0x313604,%eax
  30660c:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
  306612:	c9                   	leave  
  306613:	c3                   	ret    

00306614 <sched>:
  306614:	55                   	push   %ebp
  306615:	89 e5                	mov    %esp,%ebp
  306617:	83 ec 08             	sub    $0x8,%esp
  30661a:	a1 14 36 31 00       	mov    0x313614,%eax
  30661f:	85 c0                	test   %eax,%eax
  306621:	74 60                	je     306683 <sched+0x6f>
  306623:	a1 14 36 31 00       	mov    0x313614,%eax
  306628:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
  30662e:	85 c0                	test   %eax,%eax
  306630:	75 51                	jne    306683 <sched+0x6f>
  306632:	a1 20 36 31 00       	mov    0x313620,%eax
  306637:	8b 15 14 36 31 00    	mov    0x313614,%edx
  30663d:	89 90 b8 00 00 00    	mov    %edx,0xb8(%eax)
  306643:	a1 14 36 31 00       	mov    0x313614,%eax
  306648:	a3 20 36 31 00       	mov    %eax,0x313620
  30664d:	a1 14 36 31 00       	mov    0x313614,%eax
  306652:	8b 80 b8 00 00 00    	mov    0xb8(%eax),%eax
  306658:	a3 14 36 31 00       	mov    %eax,0x313614
  30665d:	a1 20 36 31 00       	mov    0x313620,%eax
  306662:	c7 80 b8 00 00 00 00 	movl   $0x0,0xb8(%eax)
  306669:	00 00 00 
  30666c:	a1 14 36 31 00       	mov    0x313614,%eax
  306671:	8b 15 14 36 31 00    	mov    0x313614,%edx
  306677:	8b 92 a4 00 00 00    	mov    0xa4(%edx),%edx
  30667d:	89 90 a8 00 00 00    	mov    %edx,0xa8(%eax)
  306683:	83 ec 0c             	sub    $0xc,%esp
  306686:	ff 75 08             	pushl  0x8(%ebp)
  306689:	e8 a7 fe ff ff       	call   306535 <pick_task>
  30668e:	83 c4 10             	add    $0x10,%esp
  306691:	c9                   	leave  
  306692:	c3                   	ret    

00306693 <ready>:
  306693:	55                   	push   %ebp
  306694:	89 e5                	mov    %esp,%ebp
  306696:	83 ec 08             	sub    $0x8,%esp
  306699:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  30669d:	75 10                	jne    3066af <ready+0x1c>
  30669f:	83 ec 0c             	sub    $0xc,%esp
  3066a2:	68 60 db 30 00       	push   $0x30db60
  3066a7:	e8 8c ef ff ff       	call   305638 <panic>
  3066ac:	83 c4 10             	add    $0x10,%esp
  3066af:	8b 45 08             	mov    0x8(%ebp),%eax
  3066b2:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  3066b8:	8b 04 85 10 36 31 00 	mov    0x313610(,%eax,4),%eax
  3066bf:	85 c0                	test   %eax,%eax
  3066c1:	75 15                	jne    3066d8 <ready+0x45>
  3066c3:	8b 45 08             	mov    0x8(%ebp),%eax
  3066c6:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  3066cc:	8b 55 08             	mov    0x8(%ebp),%edx
  3066cf:	89 14 85 10 36 31 00 	mov    %edx,0x313610(,%eax,4)
  3066d6:	eb 19                	jmp    3066f1 <ready+0x5e>
  3066d8:	8b 45 08             	mov    0x8(%ebp),%eax
  3066db:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  3066e1:	8b 04 85 1c 36 31 00 	mov    0x31361c(,%eax,4),%eax
  3066e8:	8b 55 08             	mov    0x8(%ebp),%edx
  3066eb:	89 90 b8 00 00 00    	mov    %edx,0xb8(%eax)
  3066f1:	8b 45 08             	mov    0x8(%ebp),%eax
  3066f4:	c7 80 b8 00 00 00 00 	movl   $0x0,0xb8(%eax)
  3066fb:	00 00 00 
  3066fe:	8b 45 08             	mov    0x8(%ebp),%eax
  306701:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  306707:	8b 55 08             	mov    0x8(%ebp),%edx
  30670a:	89 14 85 1c 36 31 00 	mov    %edx,0x31361c(,%eax,4)
  306711:	c9                   	leave  
  306712:	c3                   	ret    

00306713 <unready>:
  306713:	55                   	push   %ebp
  306714:	89 e5                	mov    %esp,%ebp
  306716:	83 ec 18             	sub    $0x18,%esp
  306719:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  30671d:	75 10                	jne    30672f <unready+0x1c>
  30671f:	83 ec 0c             	sub    $0xc,%esp
  306722:	68 80 db 30 00       	push   $0x30db80
  306727:	e8 0c ef ff ff       	call   305638 <panic>
  30672c:	83 c4 10             	add    $0x10,%esp
  30672f:	8b 45 08             	mov    0x8(%ebp),%eax
  306732:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  306738:	8b 04 85 10 36 31 00 	mov    0x313610(,%eax,4),%eax
  30673f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306742:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  306746:	0f 84 95 00 00 00    	je     3067e1 <unready+0xce>
  30674c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30674f:	3b 45 08             	cmp    0x8(%ebp),%eax
  306752:	75 1b                	jne    30676f <unready+0x5c>
  306754:	8b 45 08             	mov    0x8(%ebp),%eax
  306757:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  30675d:	8b 55 08             	mov    0x8(%ebp),%edx
  306760:	8b 92 b8 00 00 00    	mov    0xb8(%edx),%edx
  306766:	89 14 85 10 36 31 00 	mov    %edx,0x313610(,%eax,4)
  30676d:	eb 72                	jmp    3067e1 <unready+0xce>
  30676f:	eb 22                	jmp    306793 <unready+0x80>
  306771:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306774:	8b 80 b8 00 00 00    	mov    0xb8(%eax),%eax
  30677a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30677d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  306781:	75 10                	jne    306793 <unready+0x80>
  306783:	83 ec 0c             	sub    $0xc,%esp
  306786:	68 a4 db 30 00       	push   $0x30dba4
  30678b:	e8 a8 ee ff ff       	call   305638 <panic>
  306790:	83 c4 10             	add    $0x10,%esp
  306793:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306796:	8b 80 b8 00 00 00    	mov    0xb8(%eax),%eax
  30679c:	3b 45 08             	cmp    0x8(%ebp),%eax
  30679f:	75 d0                	jne    306771 <unready+0x5e>
  3067a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3067a4:	8b 80 b8 00 00 00    	mov    0xb8(%eax),%eax
  3067aa:	8b 90 b8 00 00 00    	mov    0xb8(%eax),%edx
  3067b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3067b3:	89 90 b8 00 00 00    	mov    %edx,0xb8(%eax)
  3067b9:	8b 45 08             	mov    0x8(%ebp),%eax
  3067bc:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  3067c2:	8b 04 85 1c 36 31 00 	mov    0x31361c(,%eax,4),%eax
  3067c9:	3b 45 08             	cmp    0x8(%ebp),%eax
  3067cc:	75 13                	jne    3067e1 <unready+0xce>
  3067ce:	8b 45 08             	mov    0x8(%ebp),%eax
  3067d1:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
  3067d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  3067da:	89 14 85 1c 36 31 00 	mov    %edx,0x31361c(,%eax,4)
  3067e1:	cd 81                	int    $0x81
  3067e3:	c9                   	leave  
  3067e4:	c3                   	ret    

003067e5 <_admit>:
  3067e5:	55                   	push   %ebp
  3067e6:	89 e5                	mov    %esp,%ebp
  3067e8:	83 ec 08             	sub    $0x8,%esp
  3067eb:	8b 45 08             	mov    0x8(%ebp),%eax
  3067ee:	c7 40 48 02 00 00 00 	movl   $0x2,0x48(%eax)
  3067f5:	8b 55 0c             	mov    0xc(%ebp),%edx
  3067f8:	8b 45 08             	mov    0x8(%ebp),%eax
  3067fb:	89 50 5c             	mov    %edx,0x5c(%eax)
  3067fe:	8b 45 08             	mov    0x8(%ebp),%eax
  306801:	8b 55 10             	mov    0x10(%ebp),%edx
  306804:	89 50 30             	mov    %edx,0x30(%eax)
  306807:	8b 45 08             	mov    0x8(%ebp),%eax
  30680a:	8b 55 14             	mov    0x14(%ebp),%edx
  30680d:	89 50 34             	mov    %edx,0x34(%eax)
  306810:	8b 45 08             	mov    0x8(%ebp),%eax
  306813:	8b 55 18             	mov    0x18(%ebp),%edx
  306816:	89 50 38             	mov    %edx,0x38(%eax)
  306819:	83 ec 0c             	sub    $0xc,%esp
  30681c:	ff 75 08             	pushl  0x8(%ebp)
  30681f:	e8 6f fe ff ff       	call   306693 <ready>
  306824:	83 c4 10             	add    $0x10,%esp
  306827:	c9                   	leave  
  306828:	c3                   	ret    

00306829 <_sleep>:
  306829:	55                   	push   %ebp
  30682a:	89 e5                	mov    %esp,%ebp
  30682c:	83 ec 08             	sub    $0x8,%esp
  30682f:	8b 45 08             	mov    0x8(%ebp),%eax
  306832:	c7 40 48 01 00 00 00 	movl   $0x1,0x48(%eax)
  306839:	83 ec 0c             	sub    $0xc,%esp
  30683c:	ff 75 08             	pushl  0x8(%ebp)
  30683f:	e8 cf fe ff ff       	call   306713 <unready>
  306844:	83 c4 10             	add    $0x10,%esp
  306847:	c9                   	leave  
  306848:	c3                   	ret    

00306849 <_wait>:
  306849:	55                   	push   %ebp
  30684a:	89 e5                	mov    %esp,%ebp
  30684c:	83 ec 08             	sub    $0x8,%esp
  30684f:	8b 45 08             	mov    0x8(%ebp),%eax
  306852:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
  306859:	8b 45 08             	mov    0x8(%ebp),%eax
  30685c:	8b 55 0c             	mov    0xc(%ebp),%edx
  30685f:	89 50 40             	mov    %edx,0x40(%eax)
  306862:	83 ec 0c             	sub    $0xc,%esp
  306865:	ff 75 08             	pushl  0x8(%ebp)
  306868:	e8 a6 fe ff ff       	call   306713 <unready>
  30686d:	83 c4 10             	add    $0x10,%esp
  306870:	c9                   	leave  
  306871:	c3                   	ret    

00306872 <_wakeup>:
  306872:	55                   	push   %ebp
  306873:	89 e5                	mov    %esp,%ebp
  306875:	83 ec 08             	sub    $0x8,%esp
  306878:	8b 45 08             	mov    0x8(%ebp),%eax
  30687b:	c7 40 48 03 00 00 00 	movl   $0x3,0x48(%eax)
  306882:	8b 45 08             	mov    0x8(%ebp),%eax
  306885:	c7 40 40 00 00 00 00 	movl   $0x0,0x40(%eax)
  30688c:	83 ec 0c             	sub    $0xc,%esp
  30688f:	ff 75 08             	pushl  0x8(%ebp)
  306892:	e8 fc fd ff ff       	call   306693 <ready>
  306897:	83 c4 10             	add    $0x10,%esp
  30689a:	c9                   	leave  
  30689b:	c3                   	ret    

0030689c <dohook>:
  30689c:	55                   	push   %ebp
  30689d:	89 e5                	mov    %esp,%ebp
  30689f:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  3068a3:	77 19                	ja     3068be <dohook+0x22>
  3068a5:	a1 04 36 31 00       	mov    0x313604,%eax
  3068aa:	8b 55 08             	mov    0x8(%ebp),%edx
  3068ad:	8d 4a 14             	lea    0x14(%edx),%ecx
  3068b0:	8b 55 0c             	mov    0xc(%ebp),%edx
  3068b3:	89 54 88 10          	mov    %edx,0x10(%eax,%ecx,4)
  3068b7:	b8 00 00 00 00       	mov    $0x0,%eax
  3068bc:	eb 05                	jmp    3068c3 <dohook+0x27>
  3068be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  3068c3:	5d                   	pop    %ebp
  3068c4:	c3                   	ret    

003068c5 <dofn>:
  3068c5:	55                   	push   %ebp
  3068c6:	89 e5                	mov    %esp,%ebp
  3068c8:	83 ec 18             	sub    $0x18,%esp
  3068cb:	8b 45 08             	mov    0x8(%ebp),%eax
  3068ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3068d1:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  3068d5:	7f 18                	jg     3068ef <dofn+0x2a>
  3068d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3068db:	78 12                	js     3068ef <dofn+0x2a>
  3068dd:	a1 04 36 31 00       	mov    0x313604,%eax
  3068e2:	8b 55 08             	mov    0x8(%ebp),%edx
  3068e5:	83 c2 08             	add    $0x8,%edx
  3068e8:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  3068ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3068ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3068f2:	8b 04 85 80 52 31 00 	mov    0x315280(,%eax,4),%eax
  3068f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3068fc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  306900:	75 0a                	jne    30690c <dofn+0x47>
  306902:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  306907:	e9 a2 00 00 00       	jmp    3069ae <dofn+0xe9>
  30690c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30690f:	8b 40 48             	mov    0x48(%eax),%eax
  306912:	83 f8 01             	cmp    $0x1,%eax
  306915:	74 55                	je     30696c <dofn+0xa7>
  306917:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30691a:	8b 40 4c             	mov    0x4c(%eax),%eax
  30691d:	85 c0                	test   %eax,%eax
  30691f:	75 0e                	jne    30692f <dofn+0x6a>
  306921:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306927:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30692a:	89 50 4c             	mov    %edx,0x4c(%eax)
  30692d:	eb 0f                	jmp    30693e <dofn+0x79>
  30692f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306932:	8b 40 54             	mov    0x54(%eax),%eax
  306935:	8b 15 04 36 31 00    	mov    0x313604,%edx
  30693b:	89 50 50             	mov    %edx,0x50(%eax)
  30693e:	a1 04 36 31 00       	mov    0x313604,%eax
  306943:	c7 40 50 00 00 00 00 	movl   $0x0,0x50(%eax)
  30694a:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306950:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306953:	89 50 54             	mov    %edx,0x54(%eax)
  306956:	a1 04 36 31 00       	mov    0x313604,%eax
  30695b:	83 ec 08             	sub    $0x8,%esp
  30695e:	ff 75 f0             	pushl  -0x10(%ebp)
  306961:	50                   	push   %eax
  306962:	e8 e2 fe ff ff       	call   306849 <_wait>
  306967:	83 c4 10             	add    $0x10,%esp
  30696a:	eb 0c                	jmp    306978 <dofn+0xb3>
  30696c:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306972:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306975:	89 50 3c             	mov    %edx,0x3c(%eax)
  306978:	83 ec 0c             	sub    $0xc,%esp
  30697b:	ff 75 18             	pushl  0x18(%ebp)
  30697e:	ff 75 14             	pushl  0x14(%ebp)
  306981:	ff 75 10             	pushl  0x10(%ebp)
  306984:	ff 75 0c             	pushl  0xc(%ebp)
  306987:	ff 75 f0             	pushl  -0x10(%ebp)
  30698a:	e8 56 fe ff ff       	call   3067e5 <_admit>
  30698f:	83 c4 20             	add    $0x20,%esp
  306992:	a1 04 36 31 00       	mov    0x313604,%eax
  306997:	83 ec 08             	sub    $0x8,%esp
  30699a:	ff 75 f0             	pushl  -0x10(%ebp)
  30699d:	50                   	push   %eax
  30699e:	e8 a6 fe ff ff       	call   306849 <_wait>
  3069a3:	83 c4 10             	add    $0x10,%esp
  3069a6:	a1 04 36 31 00       	mov    0x313604,%eax
  3069ab:	8b 40 44             	mov    0x44(%eax),%eax
  3069ae:	c9                   	leave  
  3069af:	c3                   	ret    

003069b0 <doint>:
  3069b0:	55                   	push   %ebp
  3069b1:	89 e5                	mov    %esp,%ebp
  3069b3:	83 ec 18             	sub    $0x18,%esp
  3069b6:	8b 45 08             	mov    0x8(%ebp),%eax
  3069b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3069bc:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  3069c0:	7f 18                	jg     3069da <doint+0x2a>
  3069c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3069c6:	78 12                	js     3069da <doint+0x2a>
  3069c8:	a1 04 36 31 00       	mov    0x313604,%eax
  3069cd:	8b 55 08             	mov    0x8(%ebp),%edx
  3069d0:	83 c2 08             	add    $0x8,%edx
  3069d3:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  3069d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3069da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3069dd:	8b 04 85 80 52 31 00 	mov    0x315280(,%eax,4),%eax
  3069e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3069e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  3069eb:	75 10                	jne    3069fd <doint+0x4d>
  3069ed:	83 ec 0c             	sub    $0xc,%esp
  3069f0:	68 c5 db 30 00       	push   $0x30dbc5
  3069f5:	e8 3e ec ff ff       	call   305638 <panic>
  3069fa:	83 c4 10             	add    $0x10,%esp
  3069fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306a00:	8b 40 48             	mov    0x48(%eax),%eax
  306a03:	83 f8 01             	cmp    $0x1,%eax
  306a06:	0f 84 80 00 00 00    	je     306a8c <doint+0xdc>
  306a0c:	83 ec 0c             	sub    $0xc,%esp
  306a0f:	6a 18                	push   $0x18
  306a11:	e8 3d 12 00 00       	call   307c53 <kalloc>
  306a16:	83 c4 10             	add    $0x10,%esp
  306a19:	89 45 ec             	mov    %eax,-0x14(%ebp)
  306a1c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  306a20:	75 10                	jne    306a32 <doint+0x82>
  306a22:	83 ec 0c             	sub    $0xc,%esp
  306a25:	68 dd db 30 00       	push   $0x30dbdd
  306a2a:	e8 09 ec ff ff       	call   305638 <panic>
  306a2f:	83 c4 10             	add    $0x10,%esp
  306a32:	8b 55 0c             	mov    0xc(%ebp),%edx
  306a35:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a38:	89 50 04             	mov    %edx,0x4(%eax)
  306a3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a3e:	8b 55 10             	mov    0x10(%ebp),%edx
  306a41:	89 50 08             	mov    %edx,0x8(%eax)
  306a44:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a47:	8b 55 14             	mov    0x14(%ebp),%edx
  306a4a:	89 50 0c             	mov    %edx,0xc(%eax)
  306a4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a50:	8b 55 18             	mov    0x18(%ebp),%edx
  306a53:	89 50 10             	mov    %edx,0x10(%eax)
  306a56:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306a5c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a5f:	89 10                	mov    %edx,(%eax)
  306a61:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a64:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  306a6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306a6e:	8b 40 58             	mov    0x58(%eax),%eax
  306a71:	85 c0                	test   %eax,%eax
  306a73:	74 0c                	je     306a81 <doint+0xd1>
  306a75:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306a78:	8b 50 58             	mov    0x58(%eax),%edx
  306a7b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  306a7e:	89 50 14             	mov    %edx,0x14(%eax)
  306a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306a84:	8b 55 ec             	mov    -0x14(%ebp),%edx
  306a87:	89 50 58             	mov    %edx,0x58(%eax)
  306a8a:	eb 1a                	jmp    306aa6 <doint+0xf6>
  306a8c:	83 ec 0c             	sub    $0xc,%esp
  306a8f:	ff 75 18             	pushl  0x18(%ebp)
  306a92:	ff 75 14             	pushl  0x14(%ebp)
  306a95:	ff 75 10             	pushl  0x10(%ebp)
  306a98:	ff 75 0c             	pushl  0xc(%ebp)
  306a9b:	ff 75 f0             	pushl  -0x10(%ebp)
  306a9e:	e8 42 fd ff ff       	call   3067e5 <_admit>
  306aa3:	83 c4 20             	add    $0x20,%esp
  306aa6:	b8 00 00 00 00       	mov    $0x0,%eax
  306aab:	c9                   	leave  
  306aac:	c3                   	ret    

00306aad <doret>:
  306aad:	55                   	push   %ebp
  306aae:	89 e5                	mov    %esp,%ebp
  306ab0:	83 ec 08             	sub    $0x8,%esp
  306ab3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  306ab7:	74 26                	je     306adf <doret+0x32>
  306ab9:	8b 45 08             	mov    0x8(%ebp),%eax
  306abc:	8b 50 40             	mov    0x40(%eax),%edx
  306abf:	a1 04 36 31 00       	mov    0x313604,%eax
  306ac4:	39 c2                	cmp    %eax,%edx
  306ac6:	75 17                	jne    306adf <doret+0x32>
  306ac8:	8b 55 0c             	mov    0xc(%ebp),%edx
  306acb:	8b 45 08             	mov    0x8(%ebp),%eax
  306ace:	89 50 44             	mov    %edx,0x44(%eax)
  306ad1:	83 ec 0c             	sub    $0xc,%esp
  306ad4:	ff 75 08             	pushl  0x8(%ebp)
  306ad7:	e8 96 fd ff ff       	call   306872 <_wakeup>
  306adc:	83 c4 10             	add    $0x10,%esp
  306adf:	b8 00 00 00 00       	mov    $0x0,%eax
  306ae4:	c9                   	leave  
  306ae5:	c3                   	ret    

00306ae6 <doget>:
  306ae6:	55                   	push   %ebp
  306ae7:	89 e5                	mov    %esp,%ebp
  306ae9:	83 ec 18             	sub    $0x18,%esp
  306aec:	a1 04 36 31 00       	mov    0x313604,%eax
  306af1:	8b 40 58             	mov    0x58(%eax),%eax
  306af4:	85 c0                	test   %eax,%eax
  306af6:	0f 84 93 00 00 00    	je     306b8f <doget+0xa9>
  306afc:	a1 04 36 31 00       	mov    0x313604,%eax
  306b01:	8b 40 58             	mov    0x58(%eax),%eax
  306b04:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306b07:	a1 04 36 31 00       	mov    0x313604,%eax
  306b0c:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306b12:	8b 52 58             	mov    0x58(%edx),%edx
  306b15:	8b 12                	mov    (%edx),%edx
  306b17:	89 50 3c             	mov    %edx,0x3c(%eax)
  306b1a:	a1 04 36 31 00       	mov    0x313604,%eax
  306b1f:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306b25:	8b 52 58             	mov    0x58(%edx),%edx
  306b28:	8b 52 04             	mov    0x4(%edx),%edx
  306b2b:	89 50 5c             	mov    %edx,0x5c(%eax)
  306b2e:	a1 04 36 31 00       	mov    0x313604,%eax
  306b33:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306b39:	8b 52 58             	mov    0x58(%edx),%edx
  306b3c:	8b 52 08             	mov    0x8(%edx),%edx
  306b3f:	89 50 30             	mov    %edx,0x30(%eax)
  306b42:	a1 04 36 31 00       	mov    0x313604,%eax
  306b47:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306b4d:	8b 52 58             	mov    0x58(%edx),%edx
  306b50:	8b 52 0c             	mov    0xc(%edx),%edx
  306b53:	89 50 34             	mov    %edx,0x34(%eax)
  306b56:	a1 04 36 31 00       	mov    0x313604,%eax
  306b5b:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306b61:	8b 52 58             	mov    0x58(%edx),%edx
  306b64:	8b 52 10             	mov    0x10(%edx),%edx
  306b67:	89 50 38             	mov    %edx,0x38(%eax)
  306b6a:	a1 04 36 31 00       	mov    0x313604,%eax
  306b6f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  306b72:	8b 52 14             	mov    0x14(%edx),%edx
  306b75:	89 50 58             	mov    %edx,0x58(%eax)
  306b78:	83 ec 08             	sub    $0x8,%esp
  306b7b:	6a 00                	push   $0x0
  306b7d:	ff 75 f4             	pushl  -0xc(%ebp)
  306b80:	e8 3a 12 00 00       	call   307dbf <kfree_s>
  306b85:	83 c4 10             	add    $0x10,%esp
  306b88:	a1 04 36 31 00       	mov    0x313604,%eax
  306b8d:	eb 73                	jmp    306c02 <doget+0x11c>
  306b8f:	a1 04 36 31 00       	mov    0x313604,%eax
  306b94:	8b 40 4c             	mov    0x4c(%eax),%eax
  306b97:	85 c0                	test   %eax,%eax
  306b99:	74 51                	je     306bec <doget+0x106>
  306b9b:	a1 04 36 31 00       	mov    0x313604,%eax
  306ba0:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306ba6:	8b 52 4c             	mov    0x4c(%edx),%edx
  306ba9:	89 50 3c             	mov    %edx,0x3c(%eax)
  306bac:	a1 04 36 31 00       	mov    0x313604,%eax
  306bb1:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306bb7:	8b 52 4c             	mov    0x4c(%edx),%edx
  306bba:	8b 52 50             	mov    0x50(%edx),%edx
  306bbd:	89 50 4c             	mov    %edx,0x4c(%eax)
  306bc0:	a1 04 36 31 00       	mov    0x313604,%eax
  306bc5:	8b 40 3c             	mov    0x3c(%eax),%eax
  306bc8:	83 ec 0c             	sub    $0xc,%esp
  306bcb:	50                   	push   %eax
  306bcc:	e8 a1 fc ff ff       	call   306872 <_wakeup>
  306bd1:	83 c4 10             	add    $0x10,%esp
  306bd4:	a1 04 36 31 00       	mov    0x313604,%eax
  306bd9:	83 ec 0c             	sub    $0xc,%esp
  306bdc:	50                   	push   %eax
  306bdd:	e8 47 fc ff ff       	call   306829 <_sleep>
  306be2:	83 c4 10             	add    $0x10,%esp
  306be5:	a1 04 36 31 00       	mov    0x313604,%eax
  306bea:	eb 16                	jmp    306c02 <doget+0x11c>
  306bec:	a1 04 36 31 00       	mov    0x313604,%eax
  306bf1:	83 ec 0c             	sub    $0xc,%esp
  306bf4:	50                   	push   %eax
  306bf5:	e8 2f fc ff ff       	call   306829 <_sleep>
  306bfa:	83 c4 10             	add    $0x10,%esp
  306bfd:	a1 04 36 31 00       	mov    0x313604,%eax
  306c02:	c9                   	leave  
  306c03:	c3                   	ret    

00306c04 <gam>:
  306c04:	55                   	push   %ebp
  306c05:	89 e5                	mov    %esp,%ebp
  306c07:	8b 45 08             	mov    0x8(%ebp),%eax
  306c0a:	c7 40 24 06 00 00 00 	movl   $0x6,0x24(%eax)
  306c11:	8b 45 08             	mov    0x8(%ebp),%eax
  306c14:	c7 40 28 06 00 00 00 	movl   $0x6,0x28(%eax)
  306c1b:	8b 45 08             	mov    0x8(%ebp),%eax
  306c1e:	c7 40 2c 06 00 00 00 	movl   $0x6,0x2c(%eax)
  306c25:	5d                   	pop    %ebp
  306c26:	c3                   	ret    

00306c27 <make_task>:
  306c27:	55                   	push   %ebp
  306c28:	89 e5                	mov    %esp,%ebp
  306c2a:	57                   	push   %edi
  306c2b:	53                   	push   %ebx
  306c2c:	83 ec 50             	sub    $0x50,%esp
  306c2f:	e8 35 06 00 00       	call   307269 <get_kfree_page>
  306c34:	89 45 f4             	mov    %eax,-0xc(%ebp)
  306c37:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c3a:	8b 55 08             	mov    0x8(%ebp),%edx
  306c3d:	89 10                	mov    %edx,(%eax)
  306c3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c42:	8b 55 18             	mov    0x18(%ebp),%edx
  306c45:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
  306c4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c4e:	c7 80 a4 00 00 00 14 	movl   $0x14,0xa4(%eax)
  306c55:	00 00 00 
  306c58:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c5b:	c7 80 a8 00 00 00 14 	movl   $0x14,0xa8(%eax)
  306c62:	00 00 00 
  306c65:	0f 20 d8             	mov    %cr3,%eax
  306c68:	89 45 f0             	mov    %eax,-0x10(%ebp)
  306c6b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  306c6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c71:	89 90 b4 00 00 00    	mov    %edx,0xb4(%eax)
  306c77:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c7a:	8d 90 bc 0f 00 00    	lea    0xfbc(%eax),%edx
  306c80:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c83:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
  306c89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306c8c:	83 c0 14             	add    $0x14,%eax
  306c8f:	83 ec 08             	sub    $0x8,%esp
  306c92:	ff 75 0c             	pushl  0xc(%ebp)
  306c95:	50                   	push   %eax
  306c96:	e8 5d f8 ff ff       	call   3064f8 <strcpy>
  306c9b:	83 c4 10             	add    $0x10,%esp
  306c9e:	8d 5d ac             	lea    -0x54(%ebp),%ebx
  306ca1:	b8 00 00 00 00       	mov    $0x0,%eax
  306ca6:	ba 11 00 00 00       	mov    $0x11,%edx
  306cab:	89 df                	mov    %ebx,%edi
  306cad:	89 d1                	mov    %edx,%ecx
  306caf:	f3 ab                	rep stos %eax,%es:(%edi)
  306cb1:	8b 45 10             	mov    0x10(%ebp),%eax
  306cb4:	89 45 ac             	mov    %eax,-0x54(%ebp)
  306cb7:	8b 45 10             	mov    0x10(%ebp),%eax
  306cba:	89 45 b0             	mov    %eax,-0x50(%ebp)
  306cbd:	8b 45 10             	mov    0x10(%ebp),%eax
  306cc0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  306cc3:	8b 45 10             	mov    0x10(%ebp),%eax
  306cc6:	89 45 b8             	mov    %eax,-0x48(%ebp)
  306cc9:	8b 45 1c             	mov    0x1c(%ebp),%eax
  306ccc:	89 45 dc             	mov    %eax,-0x24(%ebp)
  306ccf:	8b 45 14             	mov    0x14(%ebp),%eax
  306cd2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  306cd5:	c7 45 e4 00 02 00 00 	movl   $0x200,-0x1c(%ebp)
  306cdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306cdf:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
  306ce5:	83 ec 04             	sub    $0x4,%esp
  306ce8:	6a 44                	push   $0x44
  306cea:	8d 55 ac             	lea    -0x54(%ebp),%edx
  306ced:	52                   	push   %edx
  306cee:	50                   	push   %eax
  306cef:	e8 21 f8 ff ff       	call   306515 <memcpy>
  306cf4:	83 c4 10             	add    $0x10,%esp
  306cf7:	8b 45 08             	mov    0x8(%ebp),%eax
  306cfa:	8b 55 f4             	mov    -0xc(%ebp),%edx
  306cfd:	89 14 85 80 52 31 00 	mov    %edx,0x315280(,%eax,4)
  306d04:	83 ec 0c             	sub    $0xc,%esp
  306d07:	ff 75 f4             	pushl  -0xc(%ebp)
  306d0a:	e8 f5 fe ff ff       	call   306c04 <gam>
  306d0f:	83 c4 10             	add    $0x10,%esp
  306d12:	83 ec 0c             	sub    $0xc,%esp
  306d15:	ff 75 f4             	pushl  -0xc(%ebp)
  306d18:	e8 76 f9 ff ff       	call   306693 <ready>
  306d1d:	83 c4 10             	add    $0x10,%esp
  306d20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306d23:	8d 65 f8             	lea    -0x8(%ebp),%esp
  306d26:	5b                   	pop    %ebx
  306d27:	5f                   	pop    %edi
  306d28:	5d                   	pop    %ebp
  306d29:	c3                   	ret    

00306d2a <god_init>:
  306d2a:	55                   	push   %ebp
  306d2b:	89 e5                	mov    %esp,%ebp
  306d2d:	83 ec 18             	sub    $0x18,%esp
  306d30:	c7 45 f0 38 00 00 00 	movl   $0x38,-0x10(%ebp)
  306d37:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  306d3e:	eb 26                	jmp    306d66 <god_init+0x3c>
  306d40:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306d43:	c7 04 85 1c 36 31 00 	movl   $0x0,0x31361c(,%eax,4)
  306d4a:	00 00 00 00 
  306d4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306d51:	8b 14 85 1c 36 31 00 	mov    0x31361c(,%eax,4),%edx
  306d58:	8b 45 f4             	mov    -0xc(%ebp),%eax
  306d5b:	89 14 85 10 36 31 00 	mov    %edx,0x313610(,%eax,4)
  306d62:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  306d66:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  306d6a:	7e d4                	jle    306d40 <god_init+0x16>
  306d6c:	83 ec 08             	sub    $0x8,%esp
  306d6f:	6a 00                	push   $0x0
  306d71:	6a 02                	push   $0x2
  306d73:	6a 08                	push   $0x8
  306d75:	6a 10                	push   $0x10
  306d77:	68 f9 db 30 00       	push   $0x30dbf9
  306d7c:	6a 00                	push   $0x0
  306d7e:	e8 a4 fe ff ff       	call   306c27 <make_task>
  306d83:	83 c4 20             	add    $0x20,%esp
  306d86:	a3 04 36 31 00       	mov    %eax,0x313604
  306d8b:	a1 04 36 31 00       	mov    0x313604,%eax
  306d90:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306d96:	89 90 b8 00 00 00    	mov    %edx,0xb8(%eax)
  306d9c:	83 ec 08             	sub    $0x8,%esp
  306d9f:	68 7e 8e 30 00       	push   $0x308e7e
  306da4:	6a 00                	push   $0x0
  306da6:	6a 08                	push   $0x8
  306da8:	6a 10                	push   $0x10
  306daa:	68 fd db 30 00       	push   $0x30dbfd
  306daf:	6a 03                	push   $0x3
  306db1:	e8 71 fe ff ff       	call   306c27 <make_task>
  306db6:	83 c4 20             	add    $0x20,%esp
  306db9:	c7 05 28 36 31 00 00 	movl   $0x200800,0x313628
  306dc0:	08 20 00 
  306dc3:	a1 28 36 31 00       	mov    0x313628,%eax
  306dc8:	c7 40 08 10 00 00 00 	movl   $0x10,0x8(%eax)
  306dcf:	a1 28 36 31 00       	mov    0x313628,%eax
  306dd4:	8b 15 04 36 31 00    	mov    0x313604,%edx
  306dda:	81 c2 00 10 00 00    	add    $0x1000,%edx
  306de0:	89 50 04             	mov    %edx,0x4(%eax)
  306de3:	a1 28 36 31 00       	mov    0x313628,%eax
  306de8:	c7 40 60 00 00 00 00 	movl   $0x0,0x60(%eax)
  306def:	a1 28 36 31 00       	mov    0x313628,%eax
  306df4:	c7 40 64 00 00 ff ff 	movl   $0xffff0000,0x64(%eax)
  306dfb:	a1 28 36 31 00       	mov    0x313628,%eax
  306e00:	c7 40 24 00 02 00 00 	movl   $0x200,0x24(%eax)
  306e07:	0f 00 5d f0          	ltr    -0x10(%ebp)
  306e0b:	cd 81                	int    $0x81
  306e0d:	c9                   	leave  
  306e0e:	c3                   	ret    
  306e0f:	90                   	nop

00306e10 <_run>:
  306e10:	55                   	push   %ebp
  306e11:	89 e5                	mov    %esp,%ebp
  306e13:	57                   	push   %edi
  306e14:	56                   	push   %esi
  306e15:	53                   	push   %ebx
  306e16:	83 ec 10             	sub    $0x10,%esp
  306e19:	8b 55 10             	mov    0x10(%ebp),%edx
  306e1c:	8b 75 18             	mov    0x18(%ebp),%esi
  306e1f:	8b 7d 14             	mov    0x14(%ebp),%edi
  306e22:	b8 00 00 00 00       	mov    $0x0,%eax
  306e27:	8b 5d 08             	mov    0x8(%ebp),%ebx
  306e2a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  306e2d:	cd 80                	int    $0x80
  306e2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  306e32:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306e35:	83 c4 10             	add    $0x10,%esp
  306e38:	5b                   	pop    %ebx
  306e39:	5e                   	pop    %esi
  306e3a:	5f                   	pop    %edi
  306e3b:	5d                   	pop    %ebp
  306e3c:	c3                   	ret    

00306e3d <strlen>:
  306e3d:	55                   	push   %ebp
  306e3e:	89 e5                	mov    %esp,%ebp
  306e40:	57                   	push   %edi
  306e41:	8b 55 08             	mov    0x8(%ebp),%edx
  306e44:	b8 00 00 00 00       	mov    $0x0,%eax
  306e49:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  306e4e:	89 d7                	mov    %edx,%edi
  306e50:	fc                   	cld    
  306e51:	f2 ae                	repnz scas %es:(%edi),%al
  306e53:	f7 d1                	not    %ecx
  306e55:	49                   	dec    %ecx
  306e56:	89 c8                	mov    %ecx,%eax
  306e58:	5f                   	pop    %edi
  306e59:	5d                   	pop    %ebp
  306e5a:	c3                   	ret    

00306e5b <memcpy>:
  306e5b:	55                   	push   %ebp
  306e5c:	89 e5                	mov    %esp,%ebp
  306e5e:	57                   	push   %edi
  306e5f:	56                   	push   %esi
  306e60:	53                   	push   %ebx
  306e61:	8b 45 10             	mov    0x10(%ebp),%eax
  306e64:	8b 55 0c             	mov    0xc(%ebp),%edx
  306e67:	8b 5d 08             	mov    0x8(%ebp),%ebx
  306e6a:	89 c1                	mov    %eax,%ecx
  306e6c:	89 d6                	mov    %edx,%esi
  306e6e:	89 df                	mov    %ebx,%edi
  306e70:	fc                   	cld    
  306e71:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  306e73:	8b 45 08             	mov    0x8(%ebp),%eax
  306e76:	5b                   	pop    %ebx
  306e77:	5e                   	pop    %esi
  306e78:	5f                   	pop    %edi
  306e79:	5d                   	pop    %ebp
  306e7a:	c3                   	ret    

00306e7b <system_shell>:
  306e7b:	55                   	push   %ebp
  306e7c:	89 e5                	mov    %esp,%ebp
  306e7e:	83 ec 18             	sub    $0x18,%esp
  306e81:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  306e88:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  306e8f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  306e96:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  306e9d:	ff 75 f4             	pushl  -0xc(%ebp)
  306ea0:	ff 75 f0             	pushl  -0x10(%ebp)
  306ea3:	ff 75 ec             	pushl  -0x14(%ebp)
  306ea6:	6a 01                	push   $0x1
  306ea8:	6a 04                	push   $0x4
  306eaa:	e8 61 ff ff ff       	call   306e10 <_run>
  306eaf:	83 c4 14             	add    $0x14,%esp
  306eb2:	83 ec 04             	sub    $0x4,%esp
  306eb5:	6a 00                	push   $0x0
  306eb7:	6a 00                	push   $0x0
  306eb9:	68 3c dc 30 00       	push   $0x30dc3c
  306ebe:	e8 b9 5e 00 00       	call   30cd7c <exec>
  306ec3:	83 c4 10             	add    $0x10,%esp
  306ec6:	c9                   	leave  
  306ec7:	c3                   	ret    

00306ec8 <system_dup2>:
  306ec8:	55                   	push   %ebp
  306ec9:	89 e5                	mov    %esp,%ebp
  306ecb:	57                   	push   %edi
  306ecc:	56                   	push   %esi
  306ecd:	53                   	push   %ebx
  306ece:	83 ec 10             	sub    $0x10,%esp
  306ed1:	8b 45 08             	mov    0x8(%ebp),%eax
  306ed4:	8b 40 3c             	mov    0x3c(%eax),%eax
  306ed7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  306eda:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306edd:	8b 40 30             	mov    0x30(%eax),%eax
  306ee0:	83 f8 02             	cmp    $0x2,%eax
  306ee3:	77 3c                	ja     306f21 <system_dup2+0x59>
  306ee5:	8b 45 08             	mov    0x8(%ebp),%eax
  306ee8:	8b 48 30             	mov    0x30(%eax),%ecx
  306eeb:	8b 45 08             	mov    0x8(%ebp),%eax
  306eee:	8b 40 34             	mov    0x34(%eax),%eax
  306ef1:	89 c2                	mov    %eax,%edx
  306ef3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306ef6:	83 c1 08             	add    $0x8,%ecx
  306ef9:	89 54 88 04          	mov    %edx,0x4(%eax,%ecx,4)
  306efd:	8b 45 08             	mov    0x8(%ebp),%eax
  306f00:	8b 58 3c             	mov    0x3c(%eax),%ebx
  306f03:	b8 02 00 00 00       	mov    $0x2,%eax
  306f08:	b9 00 00 00 00       	mov    $0x0,%ecx
  306f0d:	ba 00 00 00 00       	mov    $0x0,%edx
  306f12:	be 00 00 00 00       	mov    $0x0,%esi
  306f17:	bf 00 00 00 00       	mov    $0x0,%edi
  306f1c:	cd 80                	int    $0x80
  306f1e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  306f21:	8b 45 08             	mov    0x8(%ebp),%eax
  306f24:	8b 58 3c             	mov    0x3c(%eax),%ebx
  306f27:	b8 02 00 00 00       	mov    $0x2,%eax
  306f2c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  306f31:	ba 00 00 00 00       	mov    $0x0,%edx
  306f36:	be 00 00 00 00       	mov    $0x0,%esi
  306f3b:	bf 00 00 00 00       	mov    $0x0,%edi
  306f40:	cd 80                	int    $0x80
  306f42:	89 45 e8             	mov    %eax,-0x18(%ebp)
  306f45:	83 c4 10             	add    $0x10,%esp
  306f48:	5b                   	pop    %ebx
  306f49:	5e                   	pop    %esi
  306f4a:	5f                   	pop    %edi
  306f4b:	5d                   	pop    %ebp
  306f4c:	c3                   	ret    

00306f4d <system_init>:
  306f4d:	55                   	push   %ebp
  306f4e:	89 e5                	mov    %esp,%ebp
  306f50:	57                   	push   %edi
  306f51:	56                   	push   %esi
  306f52:	53                   	push   %ebx
  306f53:	83 ec 10             	sub    $0x10,%esp
  306f56:	b8 03 00 00 00       	mov    $0x3,%eax
  306f5b:	bb 09 00 00 00       	mov    $0x9,%ebx
  306f60:	b9 c8 6e 30 00       	mov    $0x306ec8,%ecx
  306f65:	ba 00 00 00 00       	mov    $0x0,%edx
  306f6a:	be 00 00 00 00       	mov    $0x0,%esi
  306f6f:	bf 00 00 00 00       	mov    $0x0,%edi
  306f74:	cd 80                	int    $0x80
  306f76:	89 45 f0             	mov    %eax,-0x10(%ebp)
  306f79:	83 c4 10             	add    $0x10,%esp
  306f7c:	5b                   	pop    %ebx
  306f7d:	5e                   	pop    %esi
  306f7e:	5f                   	pop    %edi
  306f7f:	5d                   	pop    %ebp
  306f80:	c3                   	ret    

00306f81 <system_pri>:
  306f81:	55                   	push   %ebp
  306f82:	89 e5                	mov    %esp,%ebp
  306f84:	57                   	push   %edi
  306f85:	56                   	push   %esi
  306f86:	53                   	push   %ebx
  306f87:	83 ec 10             	sub    $0x10,%esp
  306f8a:	8b 45 08             	mov    0x8(%ebp),%eax
  306f8d:	8b 40 3c             	mov    0x3c(%eax),%eax
  306f90:	89 45 f0             	mov    %eax,-0x10(%ebp)
  306f93:	8b 45 08             	mov    0x8(%ebp),%eax
  306f96:	8b 40 30             	mov    0x30(%eax),%eax
  306f99:	89 c2                	mov    %eax,%edx
  306f9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  306f9e:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
  306fa4:	b8 02 00 00 00       	mov    $0x2,%eax
  306fa9:	8b 5d f0             	mov    -0x10(%ebp),%ebx
  306fac:	b9 00 00 00 00       	mov    $0x0,%ecx
  306fb1:	ba 00 00 00 00       	mov    $0x0,%edx
  306fb6:	be 00 00 00 00       	mov    $0x0,%esi
  306fbb:	bf 00 00 00 00       	mov    $0x0,%edi
  306fc0:	cd 80                	int    $0x80
  306fc2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  306fc5:	83 c4 10             	add    $0x10,%esp
  306fc8:	5b                   	pop    %ebx
  306fc9:	5e                   	pop    %esi
  306fca:	5f                   	pop    %edi
  306fcb:	5d                   	pop    %ebp
  306fcc:	c3                   	ret    

00306fcd <system_main>:
  306fcd:	55                   	push   %ebp
  306fce:	89 e5                	mov    %esp,%ebp
  306fd0:	57                   	push   %edi
  306fd1:	56                   	push   %esi
  306fd2:	53                   	push   %ebx
  306fd3:	83 ec 1c             	sub    $0x1c,%esp
  306fd6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  306fdd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  306fe4:	e8 64 ff ff ff       	call   306f4d <system_init>
  306fe9:	e8 b3 5b 00 00       	call   30cba1 <fork>
  306fee:	89 45 e0             	mov    %eax,-0x20(%ebp)
  306ff1:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
  306ff5:	75 12                	jne    307009 <system_main+0x3c>
  306ff7:	83 ec 0c             	sub    $0xc,%esp
  306ffa:	68 46 dc 30 00       	push   $0x30dc46
  306fff:	e8 50 e6 ff ff       	call   305654 <printk>
  307004:	83 c4 10             	add    $0x10,%esp
  307007:	eb 5a                	jmp    307063 <system_main+0x96>
  307009:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  30700d:	75 48                	jne    307057 <system_main+0x8a>
  30700f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  307012:	8b 04 c5 80 30 31 00 	mov    0x313080(,%eax,8),%eax
  307019:	83 ec 0c             	sub    $0xc,%esp
  30701c:	50                   	push   %eax
  30701d:	e8 1b fe ff ff       	call   306e3d <strlen>
  307022:	83 c4 10             	add    $0x10,%esp
  307025:	8d 48 01             	lea    0x1(%eax),%ecx
  307028:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30702b:	8b 04 c5 80 30 31 00 	mov    0x313080(,%eax,8),%eax
  307032:	8b 15 04 36 31 00    	mov    0x313604,%edx
  307038:	83 c2 14             	add    $0x14,%edx
  30703b:	83 ec 04             	sub    $0x4,%esp
  30703e:	51                   	push   %ecx
  30703f:	50                   	push   %eax
  307040:	52                   	push   %edx
  307041:	e8 15 fe ff ff       	call   306e5b <memcpy>
  307046:	83 c4 10             	add    $0x10,%esp
  307049:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30704c:	8b 04 c5 84 30 31 00 	mov    0x313084(,%eax,8),%eax
  307053:	ff d0                	call   *%eax
  307055:	eb 0c                	jmp    307063 <system_main+0x96>
  307057:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  30705b:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
  30705f:	77 02                	ja     307063 <system_main+0x96>
  307061:	eb 86                	jmp    306fe9 <system_main+0x1c>
  307063:	b8 03 00 00 00       	mov    $0x3,%eax
  307068:	bb 01 00 00 00       	mov    $0x1,%ebx
  30706d:	b9 81 6f 30 00       	mov    $0x306f81,%ecx
  307072:	ba 00 00 00 00       	mov    $0x0,%edx
  307077:	be 00 00 00 00       	mov    $0x0,%esi
  30707c:	bf 00 00 00 00       	mov    $0x0,%edi
  307081:	cd 80                	int    $0x80
  307083:	89 45 dc             	mov    %eax,-0x24(%ebp)
  307086:	e8 49 5b 00 00       	call   30cbd4 <dorun>
  30708b:	b8 00 00 00 00       	mov    $0x0,%eax
  307090:	8d 65 f4             	lea    -0xc(%ebp),%esp
  307093:	5b                   	pop    %ebx
  307094:	5e                   	pop    %esi
  307095:	5f                   	pop    %edi
  307096:	5d                   	pop    %ebp
  307097:	c3                   	ret    

00307098 <_run>:
  307098:	55                   	push   %ebp
  307099:	89 e5                	mov    %esp,%ebp
  30709b:	57                   	push   %edi
  30709c:	56                   	push   %esi
  30709d:	53                   	push   %ebx
  30709e:	83 ec 10             	sub    $0x10,%esp
  3070a1:	8b 55 10             	mov    0x10(%ebp),%edx
  3070a4:	8b 75 18             	mov    0x18(%ebp),%esi
  3070a7:	8b 7d 14             	mov    0x14(%ebp),%edi
  3070aa:	b8 00 00 00 00       	mov    $0x0,%eax
  3070af:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3070b2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  3070b5:	cd 80                	int    $0x80
  3070b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3070ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3070bd:	83 c4 10             	add    $0x10,%esp
  3070c0:	5b                   	pop    %ebx
  3070c1:	5e                   	pop    %esi
  3070c2:	5f                   	pop    %edi
  3070c3:	5d                   	pop    %ebp
  3070c4:	c3                   	ret    

003070c5 <memcpy>:
  3070c5:	55                   	push   %ebp
  3070c6:	89 e5                	mov    %esp,%ebp
  3070c8:	57                   	push   %edi
  3070c9:	56                   	push   %esi
  3070ca:	53                   	push   %ebx
  3070cb:	8b 45 10             	mov    0x10(%ebp),%eax
  3070ce:	8b 55 0c             	mov    0xc(%ebp),%edx
  3070d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3070d4:	89 c1                	mov    %eax,%ecx
  3070d6:	89 d6                	mov    %edx,%esi
  3070d8:	89 df                	mov    %ebx,%edi
  3070da:	fc                   	cld    
  3070db:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  3070dd:	8b 45 08             	mov    0x8(%ebp),%eax
  3070e0:	5b                   	pop    %ebx
  3070e1:	5e                   	pop    %esi
  3070e2:	5f                   	pop    %edi
  3070e3:	5d                   	pop    %ebp
  3070e4:	c3                   	ret    

003070e5 <getFreeObject>:
  3070e5:	55                   	push   %ebp
  3070e6:	89 e5                	mov    %esp,%ebp
  3070e8:	83 ec 10             	sub    $0x10,%esp
  3070eb:	c7 45 fc 03 00 00 00 	movl   $0x3,-0x4(%ebp)
  3070f2:	eb 17                	jmp    30710b <getFreeObject+0x26>
  3070f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3070f7:	8b 04 85 80 52 31 00 	mov    0x315280(,%eax,4),%eax
  3070fe:	85 c0                	test   %eax,%eax
  307100:	75 05                	jne    307107 <getFreeObject+0x22>
  307102:	8b 45 fc             	mov    -0x4(%ebp),%eax
  307105:	eb 12                	jmp    307119 <getFreeObject+0x34>
  307107:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  30710b:	81 7d fc ff 02 00 00 	cmpl   $0x2ff,-0x4(%ebp)
  307112:	7e e0                	jle    3070f4 <getFreeObject+0xf>
  307114:	b8 00 00 00 00       	mov    $0x0,%eax
  307119:	c9                   	leave  
  30711a:	c3                   	ret    

0030711b <cloneObject>:
  30711b:	55                   	push   %ebp
  30711c:	89 e5                	mov    %esp,%ebp
  30711e:	83 ec 18             	sub    $0x18,%esp
  307121:	e8 bf ff ff ff       	call   3070e5 <getFreeObject>
  307126:	89 45 f4             	mov    %eax,-0xc(%ebp)
  307129:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  30712d:	74 3e                	je     30716d <cloneObject+0x52>
  30712f:	e8 35 01 00 00       	call   307269 <get_kfree_page>
  307134:	89 45 f0             	mov    %eax,-0x10(%ebp)
  307137:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  30713b:	74 30                	je     30716d <cloneObject+0x52>
  30713d:	83 ec 04             	sub    $0x4,%esp
  307140:	68 00 10 00 00       	push   $0x1000
  307145:	ff 75 08             	pushl  0x8(%ebp)
  307148:	ff 75 f0             	pushl  -0x10(%ebp)
  30714b:	e8 75 ff ff ff       	call   3070c5 <memcpy>
  307150:	83 c4 10             	add    $0x10,%esp
  307153:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307156:	8b 55 f0             	mov    -0x10(%ebp),%edx
  307159:	89 14 85 80 52 31 00 	mov    %edx,0x315280(,%eax,4)
  307160:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307163:	8b 55 f4             	mov    -0xc(%ebp),%edx
  307166:	89 10                	mov    %edx,(%eax)
  307168:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30716b:	eb 05                	jmp    307172 <cloneObject+0x57>
  30716d:	b8 00 00 00 00       	mov    $0x0,%eax
  307172:	c9                   	leave  
  307173:	c3                   	ret    

00307174 <byName>:
  307174:	55                   	push   %ebp
  307175:	89 e5                	mov    %esp,%ebp
  307177:	83 ec 10             	sub    $0x10,%esp
  30717a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  307181:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  307188:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30718f:	8b 45 08             	mov    0x8(%ebp),%eax
  307192:	89 45 fc             	mov    %eax,-0x4(%ebp)
  307195:	ff 75 fc             	pushl  -0x4(%ebp)
  307198:	ff 75 f8             	pushl  -0x8(%ebp)
  30719b:	ff 75 f4             	pushl  -0xc(%ebp)
  30719e:	6a 02                	push   $0x2
  3071a0:	6a 08                	push   $0x8
  3071a2:	e8 f1 fe ff ff       	call   307098 <_run>
  3071a7:	83 c4 14             	add    $0x14,%esp
  3071aa:	c9                   	leave  
  3071ab:	c3                   	ret    

003071ac <byId>:
  3071ac:	55                   	push   %ebp
  3071ad:	89 e5                	mov    %esp,%ebp
  3071af:	b8 00 00 00 00       	mov    $0x0,%eax
  3071b4:	5d                   	pop    %ebp
  3071b5:	c3                   	ret    
  3071b6:	66 90                	xchg   %ax,%ax

003071b8 <memcpy>:
  3071b8:	55                   	push   %ebp
  3071b9:	89 e5                	mov    %esp,%ebp
  3071bb:	57                   	push   %edi
  3071bc:	56                   	push   %esi
  3071bd:	53                   	push   %ebx
  3071be:	8b 45 10             	mov    0x10(%ebp),%eax
  3071c1:	8b 55 0c             	mov    0xc(%ebp),%edx
  3071c4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3071c7:	89 c1                	mov    %eax,%ecx
  3071c9:	89 d6                	mov    %edx,%esi
  3071cb:	89 df                	mov    %ebx,%edi
  3071cd:	fc                   	cld    
  3071ce:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  3071d0:	8b 45 08             	mov    0x8(%ebp),%eax
  3071d3:	5b                   	pop    %ebx
  3071d4:	5e                   	pop    %esi
  3071d5:	5f                   	pop    %edi
  3071d6:	5d                   	pop    %ebp
  3071d7:	c3                   	ret    

003071d8 <memset>:
  3071d8:	55                   	push   %ebp
  3071d9:	89 e5                	mov    %esp,%ebp
  3071db:	57                   	push   %edi
  3071dc:	83 ec 04             	sub    $0x4,%esp
  3071df:	8b 45 0c             	mov    0xc(%ebp),%eax
  3071e2:	88 45 f8             	mov    %al,-0x8(%ebp)
  3071e5:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  3071e9:	8b 55 08             	mov    0x8(%ebp),%edx
  3071ec:	8b 4d 10             	mov    0x10(%ebp),%ecx
  3071ef:	89 d7                	mov    %edx,%edi
  3071f1:	fc                   	cld    
  3071f2:	f3 aa                	rep stos %al,%es:(%edi)
  3071f4:	8b 45 08             	mov    0x8(%ebp),%eax
  3071f7:	83 c4 04             	add    $0x4,%esp
  3071fa:	5f                   	pop    %edi
  3071fb:	5d                   	pop    %ebp
  3071fc:	c3                   	ret    

003071fd <get_free_page>:
  3071fd:	55                   	push   %ebp
  3071fe:	89 e5                	mov    %esp,%ebp
  307200:	57                   	push   %edi
  307201:	53                   	push   %ebx
  307202:	83 ec 10             	sub    $0x10,%esp
  307205:	c7 45 f4 00 08 00 00 	movl   $0x800,-0xc(%ebp)
  30720c:	eb 49                	jmp    307257 <get_free_page+0x5a>
  30720e:	8b 15 c0 30 31 00    	mov    0x3130c0,%edx
  307214:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307217:	01 d0                	add    %edx,%eax
  307219:	0f b6 00             	movzbl (%eax),%eax
  30721c:	84 c0                	test   %al,%al
  30721e:	75 33                	jne    307253 <get_free_page+0x56>
  307220:	8b 15 c0 30 31 00    	mov    0x3130c0,%edx
  307226:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307229:	01 d0                	add    %edx,%eax
  30722b:	0f b6 10             	movzbl (%eax),%edx
  30722e:	83 c2 01             	add    $0x1,%edx
  307231:	88 10                	mov    %dl,(%eax)
  307233:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307236:	c1 e0 0c             	shl    $0xc,%eax
  307239:	89 c3                	mov    %eax,%ebx
  30723b:	b8 00 00 00 00       	mov    $0x0,%eax
  307240:	ba 00 04 00 00       	mov    $0x400,%edx
  307245:	89 d1                	mov    %edx,%ecx
  307247:	89 df                	mov    %ebx,%edi
  307249:	f3 ab                	rep stos %eax,%es:(%edi)
  30724b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30724e:	c1 e0 0c             	shl    $0xc,%eax
  307251:	eb 0f                	jmp    307262 <get_free_page+0x65>
  307253:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  307257:	81 7d f4 ff ff 03 00 	cmpl   $0x3ffff,-0xc(%ebp)
  30725e:	7e ae                	jle    30720e <get_free_page+0x11>
  307260:	eb a3                	jmp    307205 <get_free_page+0x8>
  307262:	83 c4 10             	add    $0x10,%esp
  307265:	5b                   	pop    %ebx
  307266:	5f                   	pop    %edi
  307267:	5d                   	pop    %ebp
  307268:	c3                   	ret    

00307269 <get_kfree_page>:
  307269:	55                   	push   %ebp
  30726a:	89 e5                	mov    %esp,%ebp
  30726c:	57                   	push   %edi
  30726d:	53                   	push   %ebx
  30726e:	83 ec 10             	sub    $0x10,%esp
  307271:	c7 45 f4 00 04 00 00 	movl   $0x400,-0xc(%ebp)
  307278:	eb 49                	jmp    3072c3 <get_kfree_page+0x5a>
  30727a:	8b 15 c0 30 31 00    	mov    0x3130c0,%edx
  307280:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307283:	01 d0                	add    %edx,%eax
  307285:	0f b6 00             	movzbl (%eax),%eax
  307288:	84 c0                	test   %al,%al
  30728a:	75 33                	jne    3072bf <get_kfree_page+0x56>
  30728c:	8b 15 c0 30 31 00    	mov    0x3130c0,%edx
  307292:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307295:	01 d0                	add    %edx,%eax
  307297:	0f b6 10             	movzbl (%eax),%edx
  30729a:	83 c2 01             	add    $0x1,%edx
  30729d:	88 10                	mov    %dl,(%eax)
  30729f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3072a2:	c1 e0 0c             	shl    $0xc,%eax
  3072a5:	89 c3                	mov    %eax,%ebx
  3072a7:	b8 00 00 00 00       	mov    $0x0,%eax
  3072ac:	ba 00 04 00 00       	mov    $0x400,%edx
  3072b1:	89 d1                	mov    %edx,%ecx
  3072b3:	89 df                	mov    %ebx,%edi
  3072b5:	f3 ab                	rep stos %eax,%es:(%edi)
  3072b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3072ba:	c1 e0 0c             	shl    $0xc,%eax
  3072bd:	eb 12                	jmp    3072d1 <get_kfree_page+0x68>
  3072bf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3072c3:	81 7d f4 ff 07 00 00 	cmpl   $0x7ff,-0xc(%ebp)
  3072ca:	7e ae                	jle    30727a <get_kfree_page+0x11>
  3072cc:	b8 00 00 00 00       	mov    $0x0,%eax
  3072d1:	83 c4 10             	add    $0x10,%esp
  3072d4:	5b                   	pop    %ebx
  3072d5:	5f                   	pop    %edi
  3072d6:	5d                   	pop    %ebp
  3072d7:	c3                   	ret    

003072d8 <share_page>:
  3072d8:	55                   	push   %ebp
  3072d9:	89 e5                	mov    %esp,%ebp
  3072db:	83 ec 08             	sub    $0x8,%esp
  3072de:	81 7d 08 ff ff 3f 00 	cmpl   $0x3fffff,0x8(%ebp)
  3072e5:	77 1a                	ja     307301 <share_page+0x29>
  3072e7:	83 ec 08             	sub    $0x8,%esp
  3072ea:	ff 75 08             	pushl  0x8(%ebp)
  3072ed:	68 54 dc 30 00       	push   $0x30dc54
  3072f2:	e8 5d e3 ff ff       	call   305654 <printk>
  3072f7:	83 c4 10             	add    $0x10,%esp
  3072fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  3072ff:	eb 1a                	jmp    30731b <share_page+0x43>
  307301:	a1 c0 30 31 00       	mov    0x3130c0,%eax
  307306:	8b 55 08             	mov    0x8(%ebp),%edx
  307309:	c1 ea 0c             	shr    $0xc,%edx
  30730c:	01 d0                	add    %edx,%eax
  30730e:	0f b6 10             	movzbl (%eax),%edx
  307311:	83 c2 01             	add    $0x1,%edx
  307314:	88 10                	mov    %dl,(%eax)
  307316:	b8 00 00 00 00       	mov    $0x0,%eax
  30731b:	c9                   	leave  
  30731c:	c3                   	ret    

0030731d <page_share_nr>:
  30731d:	55                   	push   %ebp
  30731e:	89 e5                	mov    %esp,%ebp
  307320:	a1 c0 30 31 00       	mov    0x3130c0,%eax
  307325:	8b 55 08             	mov    0x8(%ebp),%edx
  307328:	c1 ea 0c             	shr    $0xc,%edx
  30732b:	01 d0                	add    %edx,%eax
  30732d:	0f b6 00             	movzbl (%eax),%eax
  307330:	0f b6 c0             	movzbl %al,%eax
  307333:	5d                   	pop    %ebp
  307334:	c3                   	ret    

00307335 <free_page>:
  307335:	55                   	push   %ebp
  307336:	89 e5                	mov    %esp,%ebp
  307338:	83 ec 08             	sub    $0x8,%esp
  30733b:	81 7d 08 ff ff 3f 00 	cmpl   $0x3fffff,0x8(%ebp)
  307342:	77 1a                	ja     30735e <free_page+0x29>
  307344:	83 ec 08             	sub    $0x8,%esp
  307347:	ff 75 08             	pushl  0x8(%ebp)
  30734a:	68 9c dc 30 00       	push   $0x30dc9c
  30734f:	e8 00 e3 ff ff       	call   305654 <printk>
  307354:	83 c4 10             	add    $0x10,%esp
  307357:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  30735c:	eb 48                	jmp    3073a6 <free_page+0x71>
  30735e:	a1 c0 30 31 00       	mov    0x3130c0,%eax
  307363:	8b 55 08             	mov    0x8(%ebp),%edx
  307366:	c1 ea 0c             	shr    $0xc,%edx
  307369:	01 d0                	add    %edx,%eax
  30736b:	0f b6 00             	movzbl (%eax),%eax
  30736e:	84 c0                	test   %al,%al
  307370:	75 1a                	jne    30738c <free_page+0x57>
  307372:	83 ec 08             	sub    $0x8,%esp
  307375:	ff 75 08             	pushl  0x8(%ebp)
  307378:	68 cc dc 30 00       	push   $0x30dccc
  30737d:	e8 d2 e2 ff ff       	call   305654 <printk>
  307382:	83 c4 10             	add    $0x10,%esp
  307385:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  30738a:	eb 1a                	jmp    3073a6 <free_page+0x71>
  30738c:	a1 c0 30 31 00       	mov    0x3130c0,%eax
  307391:	8b 55 08             	mov    0x8(%ebp),%edx
  307394:	c1 ea 0c             	shr    $0xc,%edx
  307397:	01 d0                	add    %edx,%eax
  307399:	0f b6 10             	movzbl (%eax),%edx
  30739c:	83 ea 01             	sub    $0x1,%edx
  30739f:	88 10                	mov    %dl,(%eax)
  3073a1:	b8 00 00 00 00       	mov    $0x0,%eax
  3073a6:	c9                   	leave  
  3073a7:	c3                   	ret    

003073a8 <open_pagination>:
  3073a8:	55                   	push   %ebp
  3073a9:	89 e5                	mov    %esp,%ebp
  3073ab:	83 ec 20             	sub    $0x20,%esp
  3073ae:	c7 45 e4 00 30 20 00 	movl   $0x203000,-0x1c(%ebp)
  3073b5:	c7 45 fc 00 40 20 00 	movl   $0x204000,-0x4(%ebp)
  3073bc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  3073c3:	68 00 10 00 00       	push   $0x1000
  3073c8:	6a 00                	push   $0x0
  3073ca:	ff 75 e4             	pushl  -0x1c(%ebp)
  3073cd:	e8 06 fe ff ff       	call   3071d8 <memset>
  3073d2:	83 c4 0c             	add    $0xc,%esp
  3073d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3073d8:	83 c8 07             	or     $0x7,%eax
  3073db:	89 c2                	mov    %eax,%edx
  3073dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3073e0:	89 10                	mov    %edx,(%eax)
  3073e2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3073e9:	eb 1e                	jmp    307409 <open_pagination+0x61>
  3073eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3073ee:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3073f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3073f8:	01 c2                	add    %eax,%edx
  3073fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3073fd:	c1 e0 0c             	shl    $0xc,%eax
  307400:	83 c8 07             	or     $0x7,%eax
  307403:	89 02                	mov    %eax,(%edx)
  307405:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  307409:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  307410:	7e d9                	jle    3073eb <open_pagination+0x43>
  307412:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  307419:	eb 5d                	jmp    307478 <open_pagination+0xd0>
  30741b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30741e:	05 00 10 00 00       	add    $0x1000,%eax
  307423:	89 45 fc             	mov    %eax,-0x4(%ebp)
  307426:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307429:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  307430:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  307433:	01 d0                	add    %edx,%eax
  307435:	8b 55 fc             	mov    -0x4(%ebp),%edx
  307438:	83 ca 07             	or     $0x7,%edx
  30743b:	89 10                	mov    %edx,(%eax)
  30743d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  307444:	eb 25                	jmp    30746b <open_pagination+0xc3>
  307446:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307449:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  307450:	8b 45 fc             	mov    -0x4(%ebp),%eax
  307453:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  307456:	8b 45 f8             	mov    -0x8(%ebp),%eax
  307459:	8d 50 01             	lea    0x1(%eax),%edx
  30745c:	89 55 f8             	mov    %edx,-0x8(%ebp)
  30745f:	c1 e0 0c             	shl    $0xc,%eax
  307462:	83 c8 07             	or     $0x7,%eax
  307465:	89 01                	mov    %eax,(%ecx)
  307467:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  30746b:	81 7d ec ff 03 00 00 	cmpl   $0x3ff,-0x14(%ebp)
  307472:	7e d2                	jle    307446 <open_pagination+0x9e>
  307474:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  307478:	81 7d f0 ff 00 00 00 	cmpl   $0xff,-0x10(%ebp)
  30747f:	7e 9a                	jle    30741b <open_pagination+0x73>
  307481:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  307484:	05 fc 0f 00 00       	add    $0xffc,%eax
  307489:	8b 00                	mov    (%eax),%eax
  30748b:	25 00 f3 ff ff       	and    $0xfffff300,%eax
  307490:	89 45 fc             	mov    %eax,-0x4(%ebp)
  307493:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  30749a:	eb 20                	jmp    3074bc <open_pagination+0x114>
  30749c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  30749f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3074a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3074a9:	01 c2                	add    %eax,%edx
  3074ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3074ae:	c1 e0 0c             	shl    $0xc,%eax
  3074b1:	0d 07 00 c0 ff       	or     $0xffc00007,%eax
  3074b6:	89 02                	mov    %eax,(%edx)
  3074b8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  3074bc:	81 7d e8 ff 03 00 00 	cmpl   $0x3ff,-0x18(%ebp)
  3074c3:	7e d7                	jle    30749c <open_pagination+0xf4>
  3074c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3074c8:	0f 22 d8             	mov    %eax,%cr3
  3074cb:	0f 20 c0             	mov    %cr0,%eax
  3074ce:	0d 00 00 01 80       	or     $0x80010000,%eax
  3074d3:	0f 22 c0             	mov    %eax,%cr0
  3074d6:	c9                   	leave  
  3074d7:	c3                   	ret    

003074d8 <mm_init>:
  3074d8:	55                   	push   %ebp
  3074d9:	89 e5                	mov    %esp,%ebp
  3074db:	83 ec 38             	sub    $0x38,%esp
  3074de:	a1 00 30 31 00       	mov    0x313000,%eax
  3074e3:	8b 40 30             	mov    0x30(%eax),%eax
  3074e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3074e9:	a1 00 30 31 00       	mov    0x313000,%eax
  3074ee:	8b 50 30             	mov    0x30(%eax),%edx
  3074f1:	a1 00 30 31 00       	mov    0x313000,%eax
  3074f6:	8b 40 2c             	mov    0x2c(%eax),%eax
  3074f9:	01 d0                	add    %edx,%eax
  3074fb:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3074fe:	a1 00 30 31 00       	mov    0x313000,%eax
  307503:	8b 40 18             	mov    0x18(%eax),%eax
  307506:	89 45 dc             	mov    %eax,-0x24(%ebp)
  307509:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30750c:	8b 00                	mov    (%eax),%eax
  30750e:	89 45 d8             	mov    %eax,-0x28(%ebp)
  307511:	8b 45 dc             	mov    -0x24(%ebp),%eax
  307514:	8b 50 04             	mov    0x4(%eax),%edx
  307517:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30751a:	8b 00                	mov    (%eax),%eax
  30751c:	29 c2                	sub    %eax,%edx
  30751e:	89 d0                	mov    %edx,%eax
  307520:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  307523:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  307526:	50                   	push   %eax
  307527:	ff 75 d8             	pushl  -0x28(%ebp)
  30752a:	68 00 50 31 00       	push   $0x315000
  30752f:	e8 84 fc ff ff       	call   3071b8 <memcpy>
  307534:	83 c4 0c             	add    $0xc,%esp
  307537:	c6 45 f3 64          	movb   $0x64,-0xd(%ebp)
  30753b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  307542:	eb 12                	jmp    307556 <mm_init+0x7e>
  307544:	8b 15 c0 30 31 00    	mov    0x3130c0,%edx
  30754a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30754d:	01 d0                	add    %edx,%eax
  30754f:	c6 00 64             	movb   $0x64,(%eax)
  307552:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  307556:	8b 15 c0 30 31 00    	mov    0x3130c0,%edx
  30755c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30755f:	01 d0                	add    %edx,%eax
  307561:	3d ff ff 1f 00       	cmp    $0x1fffff,%eax
  307566:	76 dc                	jbe    307544 <mm_init+0x6c>
  307568:	eb 65                	jmp    3075cf <mm_init+0xf7>
  30756a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30756d:	8b 40 14             	mov    0x14(%eax),%eax
  307570:	83 f8 01             	cmp    $0x1,%eax
  307573:	75 19                	jne    30758e <mm_init+0xb6>
  307575:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  307579:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30757c:	8b 50 04             	mov    0x4(%eax),%edx
  30757f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307582:	8b 40 0c             	mov    0xc(%eax),%eax
  307585:	01 d0                	add    %edx,%eax
  307587:	a3 34 36 31 00       	mov    %eax,0x313634
  30758c:	eb 04                	jmp    307592 <mm_init+0xba>
  30758e:	c6 45 f3 64          	movb   $0x64,-0xd(%ebp)
  307592:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307595:	8b 40 04             	mov    0x4(%eax),%eax
  307598:	c1 e8 0c             	shr    $0xc,%eax
  30759b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30759e:	eb 15                	jmp    3075b5 <mm_init+0xdd>
  3075a0:	8b 15 c0 30 31 00    	mov    0x3130c0,%edx
  3075a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3075a9:	01 c2                	add    %eax,%edx
  3075ab:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  3075af:	88 02                	mov    %al,(%edx)
  3075b1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  3075b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3075b8:	8b 50 04             	mov    0x4(%eax),%edx
  3075bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3075be:	8b 40 0c             	mov    0xc(%eax),%eax
  3075c1:	01 d0                	add    %edx,%eax
  3075c3:	c1 e8 0c             	shr    $0xc,%eax
  3075c6:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  3075c9:	77 d5                	ja     3075a0 <mm_init+0xc8>
  3075cb:	83 45 f4 18          	addl   $0x18,-0xc(%ebp)
  3075cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3075d2:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  3075d5:	72 93                	jb     30756a <mm_init+0x92>
  3075d7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  3075de:	eb 12                	jmp    3075f2 <mm_init+0x11a>
  3075e0:	8b 15 c0 30 31 00    	mov    0x3130c0,%edx
  3075e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3075e9:	01 d0                	add    %edx,%eax
  3075eb:	c6 00 64             	movb   $0x64,(%eax)
  3075ee:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  3075f2:	81 7d e4 ff 03 00 00 	cmpl   $0x3ff,-0x1c(%ebp)
  3075f9:	7e e5                	jle    3075e0 <mm_init+0x108>
  3075fb:	a1 34 36 31 00       	mov    0x313634,%eax
  307600:	3d 00 00 00 40       	cmp    $0x40000000,%eax
  307605:	76 0c                	jbe    307613 <mm_init+0x13b>
  307607:	c7 05 38 36 31 00 00 	movl   $0x40000000,0x313638
  30760e:	00 00 40 
  307611:	eb 0a                	jmp    30761d <mm_init+0x145>
  307613:	a1 34 36 31 00       	mov    0x313634,%eax
  307618:	a3 38 36 31 00       	mov    %eax,0x313638
  30761d:	e8 9a 04 00 00       	call   307abc <buffer_init>
  307622:	e8 81 fd ff ff       	call   3073a8 <open_pagination>
  307627:	c9                   	leave  
  307628:	c3                   	ret    
  307629:	66 90                	xchg   %ax,%ax
  30762b:	90                   	nop

0030762c <clock_handler>:
  30762c:	55                   	push   %ebp
  30762d:	89 e5                	mov    %esp,%ebp
  30762f:	83 ec 08             	sub    $0x8,%esp
  307632:	a1 04 36 31 00       	mov    0x313604,%eax
  307637:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
  30763d:	85 c0                	test   %eax,%eax
  30763f:	74 14                	je     307655 <clock_handler+0x29>
  307641:	a1 04 36 31 00       	mov    0x313604,%eax
  307646:	8b 90 a8 00 00 00    	mov    0xa8(%eax),%edx
  30764c:	83 ea 01             	sub    $0x1,%edx
  30764f:	89 90 a8 00 00 00    	mov    %edx,0xa8(%eax)
  307655:	8b 0d 40 36 31 00    	mov    0x313640,%ecx
  30765b:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
  307660:	89 c8                	mov    %ecx,%eax
  307662:	f7 e2                	mul    %edx
  307664:	89 d0                	mov    %edx,%eax
  307666:	c1 e8 06             	shr    $0x6,%eax
  307669:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
  30766f:	29 c1                	sub    %eax,%ecx
  307671:	89 c8                	mov    %ecx,%eax
  307673:	85 c0                	test   %eax,%eax
  307675:	75 16                	jne    30768d <clock_handler+0x61>
  307677:	83 ec 0c             	sub    $0xc,%esp
  30767a:	6a 00                	push   $0x0
  30767c:	6a 00                	push   $0x0
  30767e:	6a 00                	push   $0x0
  307680:	6a 01                	push   $0x1
  307682:	ff 75 08             	pushl  0x8(%ebp)
  307685:	e8 26 f3 ff ff       	call   3069b0 <doint>
  30768a:	83 c4 20             	add    $0x20,%esp
  30768d:	b8 00 00 00 00       	mov    $0x0,%eax
  307692:	c9                   	leave  
  307693:	c3                   	ret    

00307694 <mktime>:
  307694:	55                   	push   %ebp
  307695:	89 e5                	mov    %esp,%ebp
  307697:	83 ec 10             	sub    $0x10,%esp
  30769a:	8b 45 08             	mov    0x8(%ebp),%eax
  30769d:	8b 40 14             	mov    0x14(%eax),%eax
  3076a0:	69 d0 80 33 e1 01    	imul   $0x1e13380,%eax,%edx
  3076a6:	8b 45 08             	mov    0x8(%ebp),%eax
  3076a9:	8b 40 14             	mov    0x14(%eax),%eax
  3076ac:	83 c0 03             	add    $0x3,%eax
  3076af:	69 c0 80 51 01 00    	imul   $0x15180,%eax,%eax
  3076b5:	8d 48 03             	lea    0x3(%eax),%ecx
  3076b8:	85 c0                	test   %eax,%eax
  3076ba:	0f 48 c1             	cmovs  %ecx,%eax
  3076bd:	c1 f8 02             	sar    $0x2,%eax
  3076c0:	01 d0                	add    %edx,%eax
  3076c2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  3076c5:	8b 45 08             	mov    0x8(%ebp),%eax
  3076c8:	8b 40 10             	mov    0x10(%eax),%eax
  3076cb:	8b 04 85 00 dd 30 00 	mov    0x30dd00(,%eax,4),%eax
  3076d2:	69 c0 80 51 01 00    	imul   $0x15180,%eax,%eax
  3076d8:	01 45 fc             	add    %eax,-0x4(%ebp)
  3076db:	8b 45 08             	mov    0x8(%ebp),%eax
  3076de:	8b 40 10             	mov    0x10(%eax),%eax
  3076e1:	83 f8 01             	cmp    $0x1,%eax
  3076e4:	7e 14                	jle    3076fa <mktime+0x66>
  3076e6:	8b 45 08             	mov    0x8(%ebp),%eax
  3076e9:	8b 40 14             	mov    0x14(%eax),%eax
  3076ec:	83 e0 03             	and    $0x3,%eax
  3076ef:	85 c0                	test   %eax,%eax
  3076f1:	75 07                	jne    3076fa <mktime+0x66>
  3076f3:	81 45 fc 80 51 01 00 	addl   $0x15180,-0x4(%ebp)
  3076fa:	8b 45 08             	mov    0x8(%ebp),%eax
  3076fd:	8b 40 0c             	mov    0xc(%eax),%eax
  307700:	83 e8 01             	sub    $0x1,%eax
  307703:	69 c0 80 51 01 00    	imul   $0x15180,%eax,%eax
  307709:	01 45 fc             	add    %eax,-0x4(%ebp)
  30770c:	8b 45 08             	mov    0x8(%ebp),%eax
  30770f:	8b 40 08             	mov    0x8(%eax),%eax
  307712:	69 c0 10 0e 00 00    	imul   $0xe10,%eax,%eax
  307718:	01 45 fc             	add    %eax,-0x4(%ebp)
  30771b:	8b 45 08             	mov    0x8(%ebp),%eax
  30771e:	8b 40 04             	mov    0x4(%eax),%eax
  307721:	c1 e0 02             	shl    $0x2,%eax
  307724:	89 c2                	mov    %eax,%edx
  307726:	c1 e2 04             	shl    $0x4,%edx
  307729:	29 c2                	sub    %eax,%edx
  30772b:	89 d0                	mov    %edx,%eax
  30772d:	01 45 fc             	add    %eax,-0x4(%ebp)
  307730:	8b 45 08             	mov    0x8(%ebp),%eax
  307733:	8b 00                	mov    (%eax),%eax
  307735:	01 45 fc             	add    %eax,-0x4(%ebp)
  307738:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30773b:	c9                   	leave  
  30773c:	c3                   	ret    

0030773d <cmos_time>:
  30773d:	55                   	push   %ebp
  30773e:	89 e5                	mov    %esp,%ebp
  307740:	83 ec 10             	sub    $0x10,%esp
  307743:	b8 80 00 00 00       	mov    $0x80,%eax
  307748:	ba 70 00 00 00       	mov    $0x70,%edx
  30774d:	ee                   	out    %al,(%dx)
  30774e:	eb 00                	jmp    307750 <cmos_time+0x13>
  307750:	eb 00                	jmp    307752 <cmos_time+0x15>
  307752:	b8 71 00 00 00       	mov    $0x71,%eax
  307757:	89 c2                	mov    %eax,%edx
  307759:	ec                   	in     (%dx),%al
  30775a:	eb 00                	jmp    30775c <cmos_time+0x1f>
  30775c:	eb 00                	jmp    30775e <cmos_time+0x21>
  30775e:	88 45 ff             	mov    %al,-0x1(%ebp)
  307761:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  307765:	0f b6 c0             	movzbl %al,%eax
  307768:	a3 60 36 31 00       	mov    %eax,0x313660
  30776d:	b8 82 00 00 00       	mov    $0x82,%eax
  307772:	ba 70 00 00 00       	mov    $0x70,%edx
  307777:	ee                   	out    %al,(%dx)
  307778:	eb 00                	jmp    30777a <cmos_time+0x3d>
  30777a:	eb 00                	jmp    30777c <cmos_time+0x3f>
  30777c:	b8 71 00 00 00       	mov    $0x71,%eax
  307781:	89 c2                	mov    %eax,%edx
  307783:	ec                   	in     (%dx),%al
  307784:	eb 00                	jmp    307786 <cmos_time+0x49>
  307786:	eb 00                	jmp    307788 <cmos_time+0x4b>
  307788:	88 45 fe             	mov    %al,-0x2(%ebp)
  30778b:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  30778f:	0f b6 c0             	movzbl %al,%eax
  307792:	a3 64 36 31 00       	mov    %eax,0x313664
  307797:	b8 84 00 00 00       	mov    $0x84,%eax
  30779c:	ba 70 00 00 00       	mov    $0x70,%edx
  3077a1:	ee                   	out    %al,(%dx)
  3077a2:	eb 00                	jmp    3077a4 <cmos_time+0x67>
  3077a4:	eb 00                	jmp    3077a6 <cmos_time+0x69>
  3077a6:	b8 71 00 00 00       	mov    $0x71,%eax
  3077ab:	89 c2                	mov    %eax,%edx
  3077ad:	ec                   	in     (%dx),%al
  3077ae:	eb 00                	jmp    3077b0 <cmos_time+0x73>
  3077b0:	eb 00                	jmp    3077b2 <cmos_time+0x75>
  3077b2:	88 45 fd             	mov    %al,-0x3(%ebp)
  3077b5:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  3077b9:	0f b6 c0             	movzbl %al,%eax
  3077bc:	a3 68 36 31 00       	mov    %eax,0x313668
  3077c1:	b8 87 00 00 00       	mov    $0x87,%eax
  3077c6:	ba 70 00 00 00       	mov    $0x70,%edx
  3077cb:	ee                   	out    %al,(%dx)
  3077cc:	eb 00                	jmp    3077ce <cmos_time+0x91>
  3077ce:	eb 00                	jmp    3077d0 <cmos_time+0x93>
  3077d0:	b8 71 00 00 00       	mov    $0x71,%eax
  3077d5:	89 c2                	mov    %eax,%edx
  3077d7:	ec                   	in     (%dx),%al
  3077d8:	eb 00                	jmp    3077da <cmos_time+0x9d>
  3077da:	eb 00                	jmp    3077dc <cmos_time+0x9f>
  3077dc:	88 45 fc             	mov    %al,-0x4(%ebp)
  3077df:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  3077e3:	0f b6 c0             	movzbl %al,%eax
  3077e6:	a3 6c 36 31 00       	mov    %eax,0x31366c
  3077eb:	b8 88 00 00 00       	mov    $0x88,%eax
  3077f0:	ba 70 00 00 00       	mov    $0x70,%edx
  3077f5:	ee                   	out    %al,(%dx)
  3077f6:	eb 00                	jmp    3077f8 <cmos_time+0xbb>
  3077f8:	eb 00                	jmp    3077fa <cmos_time+0xbd>
  3077fa:	b8 71 00 00 00       	mov    $0x71,%eax
  3077ff:	89 c2                	mov    %eax,%edx
  307801:	ec                   	in     (%dx),%al
  307802:	eb 00                	jmp    307804 <cmos_time+0xc7>
  307804:	eb 00                	jmp    307806 <cmos_time+0xc9>
  307806:	88 45 fb             	mov    %al,-0x5(%ebp)
  307809:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  30780d:	0f b6 c0             	movzbl %al,%eax
  307810:	a3 70 36 31 00       	mov    %eax,0x313670
  307815:	b8 89 00 00 00       	mov    $0x89,%eax
  30781a:	ba 70 00 00 00       	mov    $0x70,%edx
  30781f:	ee                   	out    %al,(%dx)
  307820:	eb 00                	jmp    307822 <cmos_time+0xe5>
  307822:	eb 00                	jmp    307824 <cmos_time+0xe7>
  307824:	b8 71 00 00 00       	mov    $0x71,%eax
  307829:	89 c2                	mov    %eax,%edx
  30782b:	ec                   	in     (%dx),%al
  30782c:	eb 00                	jmp    30782e <cmos_time+0xf1>
  30782e:	eb 00                	jmp    307830 <cmos_time+0xf3>
  307830:	88 45 fa             	mov    %al,-0x6(%ebp)
  307833:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  307837:	0f b6 c0             	movzbl %al,%eax
  30783a:	a3 74 36 31 00       	mov    %eax,0x313674
  30783f:	8b 0d 60 36 31 00    	mov    0x313660,%ecx
  307845:	b8 80 00 00 00       	mov    $0x80,%eax
  30784a:	ba 70 00 00 00       	mov    $0x70,%edx
  30784f:	ee                   	out    %al,(%dx)
  307850:	eb 00                	jmp    307852 <cmos_time+0x115>
  307852:	eb 00                	jmp    307854 <cmos_time+0x117>
  307854:	b8 71 00 00 00       	mov    $0x71,%eax
  307859:	89 c2                	mov    %eax,%edx
  30785b:	ec                   	in     (%dx),%al
  30785c:	eb 00                	jmp    30785e <cmos_time+0x121>
  30785e:	eb 00                	jmp    307860 <cmos_time+0x123>
  307860:	88 45 f9             	mov    %al,-0x7(%ebp)
  307863:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  307867:	0f b6 c0             	movzbl %al,%eax
  30786a:	39 c1                	cmp    %eax,%ecx
  30786c:	0f 85 d1 fe ff ff    	jne    307743 <cmos_time+0x6>
  307872:	a1 60 36 31 00       	mov    0x313660,%eax
  307877:	83 e0 0f             	and    $0xf,%eax
  30787a:	89 c1                	mov    %eax,%ecx
  30787c:	a1 60 36 31 00       	mov    0x313660,%eax
  307881:	c1 f8 04             	sar    $0x4,%eax
  307884:	89 c2                	mov    %eax,%edx
  307886:	89 d0                	mov    %edx,%eax
  307888:	c1 e0 02             	shl    $0x2,%eax
  30788b:	01 d0                	add    %edx,%eax
  30788d:	01 c0                	add    %eax,%eax
  30788f:	01 c8                	add    %ecx,%eax
  307891:	a3 60 36 31 00       	mov    %eax,0x313660
  307896:	a1 64 36 31 00       	mov    0x313664,%eax
  30789b:	83 e0 0f             	and    $0xf,%eax
  30789e:	89 c1                	mov    %eax,%ecx
  3078a0:	a1 64 36 31 00       	mov    0x313664,%eax
  3078a5:	c1 f8 04             	sar    $0x4,%eax
  3078a8:	89 c2                	mov    %eax,%edx
  3078aa:	89 d0                	mov    %edx,%eax
  3078ac:	c1 e0 02             	shl    $0x2,%eax
  3078af:	01 d0                	add    %edx,%eax
  3078b1:	01 c0                	add    %eax,%eax
  3078b3:	01 c8                	add    %ecx,%eax
  3078b5:	a3 64 36 31 00       	mov    %eax,0x313664
  3078ba:	a1 68 36 31 00       	mov    0x313668,%eax
  3078bf:	83 e0 0f             	and    $0xf,%eax
  3078c2:	89 c1                	mov    %eax,%ecx
  3078c4:	a1 68 36 31 00       	mov    0x313668,%eax
  3078c9:	c1 f8 04             	sar    $0x4,%eax
  3078cc:	89 c2                	mov    %eax,%edx
  3078ce:	89 d0                	mov    %edx,%eax
  3078d0:	c1 e0 02             	shl    $0x2,%eax
  3078d3:	01 d0                	add    %edx,%eax
  3078d5:	01 c0                	add    %eax,%eax
  3078d7:	01 c8                	add    %ecx,%eax
  3078d9:	a3 68 36 31 00       	mov    %eax,0x313668
  3078de:	a1 6c 36 31 00       	mov    0x31366c,%eax
  3078e3:	83 e0 0f             	and    $0xf,%eax
  3078e6:	89 c1                	mov    %eax,%ecx
  3078e8:	a1 6c 36 31 00       	mov    0x31366c,%eax
  3078ed:	c1 f8 04             	sar    $0x4,%eax
  3078f0:	89 c2                	mov    %eax,%edx
  3078f2:	89 d0                	mov    %edx,%eax
  3078f4:	c1 e0 02             	shl    $0x2,%eax
  3078f7:	01 d0                	add    %edx,%eax
  3078f9:	01 c0                	add    %eax,%eax
  3078fb:	01 c8                	add    %ecx,%eax
  3078fd:	a3 6c 36 31 00       	mov    %eax,0x31366c
  307902:	a1 70 36 31 00       	mov    0x313670,%eax
  307907:	83 e0 0f             	and    $0xf,%eax
  30790a:	89 c1                	mov    %eax,%ecx
  30790c:	a1 70 36 31 00       	mov    0x313670,%eax
  307911:	c1 f8 04             	sar    $0x4,%eax
  307914:	89 c2                	mov    %eax,%edx
  307916:	89 d0                	mov    %edx,%eax
  307918:	c1 e0 02             	shl    $0x2,%eax
  30791b:	01 d0                	add    %edx,%eax
  30791d:	01 c0                	add    %eax,%eax
  30791f:	01 c8                	add    %ecx,%eax
  307921:	a3 70 36 31 00       	mov    %eax,0x313670
  307926:	a1 74 36 31 00       	mov    0x313674,%eax
  30792b:	83 e0 0f             	and    $0xf,%eax
  30792e:	89 c1                	mov    %eax,%ecx
  307930:	a1 74 36 31 00       	mov    0x313674,%eax
  307935:	c1 f8 04             	sar    $0x4,%eax
  307938:	89 c2                	mov    %eax,%edx
  30793a:	89 d0                	mov    %edx,%eax
  30793c:	c1 e0 02             	shl    $0x2,%eax
  30793f:	01 d0                	add    %edx,%eax
  307941:	01 c0                	add    %eax,%eax
  307943:	01 c8                	add    %ecx,%eax
  307945:	a3 74 36 31 00       	mov    %eax,0x313674
  30794a:	a1 70 36 31 00       	mov    0x313670,%eax
  30794f:	83 e8 01             	sub    $0x1,%eax
  307952:	a3 70 36 31 00       	mov    %eax,0x313670
  307957:	68 60 36 31 00       	push   $0x313660
  30795c:	e8 33 fd ff ff       	call   307694 <mktime>
  307961:	83 c4 04             	add    $0x4,%esp
  307964:	a3 48 36 31 00       	mov    %eax,0x313648
  307969:	c9                   	leave  
  30796a:	c3                   	ret    

0030796b <get_time>:
  30796b:	55                   	push   %ebp
  30796c:	89 e5                	mov    %esp,%ebp
  30796e:	57                   	push   %edi
  30796f:	56                   	push   %esi
  307970:	53                   	push   %ebx
  307971:	83 ec 10             	sub    $0x10,%esp
  307974:	8b 45 08             	mov    0x8(%ebp),%eax
  307977:	8b 58 3c             	mov    0x3c(%eax),%ebx
  30797a:	8b 0d 48 36 31 00    	mov    0x313648,%ecx
  307980:	b8 02 00 00 00       	mov    $0x2,%eax
  307985:	ba 00 00 00 00       	mov    $0x0,%edx
  30798a:	be 00 00 00 00       	mov    $0x0,%esi
  30798f:	bf 00 00 00 00       	mov    $0x0,%edi
  307994:	cd 80                	int    $0x80
  307996:	89 45 f0             	mov    %eax,-0x10(%ebp)
  307999:	83 c4 10             	add    $0x10,%esp
  30799c:	5b                   	pop    %ebx
  30799d:	5e                   	pop    %esi
  30799e:	5f                   	pop    %edi
  30799f:	5d                   	pop    %ebp
  3079a0:	c3                   	ret    

003079a1 <_clk>:
  3079a1:	55                   	push   %ebp
  3079a2:	89 e5                	mov    %esp,%ebp
  3079a4:	a1 48 36 31 00       	mov    0x313648,%eax
  3079a9:	83 c0 01             	add    $0x1,%eax
  3079ac:	a3 48 36 31 00       	mov    %eax,0x313648
  3079b1:	5d                   	pop    %ebp
  3079b2:	c3                   	ret    

003079b3 <clock_init>:
  3079b3:	55                   	push   %ebp
  3079b4:	89 e5                	mov    %esp,%ebp
  3079b6:	57                   	push   %edi
  3079b7:	56                   	push   %esi
  3079b8:	53                   	push   %ebx
  3079b9:	83 ec 1c             	sub    $0x1c,%esp
  3079bc:	b8 03 00 00 00       	mov    $0x3,%eax
  3079c1:	bb 00 00 00 00       	mov    $0x0,%ebx
  3079c6:	b9 6b 79 30 00       	mov    $0x30796b,%ecx
  3079cb:	ba 00 00 00 00       	mov    $0x0,%edx
  3079d0:	be 00 00 00 00       	mov    $0x0,%esi
  3079d5:	bf 00 00 00 00       	mov    $0x0,%edi
  3079da:	cd 80                	int    $0x80
  3079dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3079df:	b8 03 00 00 00       	mov    $0x3,%eax
  3079e4:	bb 01 00 00 00       	mov    $0x1,%ebx
  3079e9:	b9 a1 79 30 00       	mov    $0x3079a1,%ecx
  3079ee:	ba 00 00 00 00       	mov    $0x0,%edx
  3079f3:	be 00 00 00 00       	mov    $0x0,%esi
  3079f8:	bf 00 00 00 00       	mov    $0x0,%edi
  3079fd:	cd 80                	int    $0x80
  3079ff:	89 45 e0             	mov    %eax,-0x20(%ebp)
  307a02:	e8 36 fd ff ff       	call   30773d <cmos_time>
  307a07:	b8 36 00 00 00       	mov    $0x36,%eax
  307a0c:	ba 43 00 00 00       	mov    $0x43,%edx
  307a11:	ee                   	out    %al,(%dx)
  307a12:	eb 00                	jmp    307a14 <clock_init+0x61>
  307a14:	eb 00                	jmp    307a16 <clock_init+0x63>
  307a16:	b8 9c 00 00 00       	mov    $0x9c,%eax
  307a1b:	ba 40 00 00 00       	mov    $0x40,%edx
  307a20:	ee                   	out    %al,(%dx)
  307a21:	eb 00                	jmp    307a23 <clock_init+0x70>
  307a23:	eb 00                	jmp    307a25 <clock_init+0x72>
  307a25:	b8 2e 00 00 00       	mov    $0x2e,%eax
  307a2a:	ba 40 00 00 00       	mov    $0x40,%edx
  307a2f:	ee                   	out    %al,(%dx)
  307a30:	eb 00                	jmp    307a32 <clock_init+0x7f>
  307a32:	eb 00                	jmp    307a34 <clock_init+0x81>
  307a34:	83 ec 08             	sub    $0x8,%esp
  307a37:	68 2c 76 30 00       	push   $0x30762c
  307a3c:	6a 00                	push   $0x0
  307a3e:	e8 94 e2 ff ff       	call   305cd7 <put_irq_handler>
  307a43:	83 c4 10             	add    $0x10,%esp
  307a46:	8d 65 f4             	lea    -0xc(%ebp),%esp
  307a49:	5b                   	pop    %ebx
  307a4a:	5e                   	pop    %esi
  307a4b:	5f                   	pop    %edi
  307a4c:	5d                   	pop    %ebp
  307a4d:	c3                   	ret    

00307a4e <clock_main>:
  307a4e:	55                   	push   %ebp
  307a4f:	89 e5                	mov    %esp,%ebp
  307a51:	83 ec 08             	sub    $0x8,%esp
  307a54:	e8 5a ff ff ff       	call   3079b3 <clock_init>
  307a59:	e8 76 51 00 00       	call   30cbd4 <dorun>
  307a5e:	b8 00 00 00 00       	mov    $0x0,%eax
  307a63:	c9                   	leave  
  307a64:	c3                   	ret    
  307a65:	66 90                	xchg   %ax,%ax
  307a67:	90                   	nop

00307a68 <main>:
  307a68:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  307a6c:	83 e4 f0             	and    $0xfffffff0,%esp
  307a6f:	ff 71 fc             	pushl  -0x4(%ecx)
  307a72:	55                   	push   %ebp
  307a73:	89 e5                	mov    %esp,%ebp
  307a75:	51                   	push   %ecx
  307a76:	83 ec 04             	sub    $0x4,%esp
  307a79:	fa                   	cli    
  307a7a:	e8 f1 44 00 00       	call   30bf70 <cons_init>
  307a7f:	e8 54 fa ff ff       	call   3074d8 <mm_init>
  307a84:	e8 de e2 ff ff       	call   305d67 <trap_init>
  307a89:	e8 9c f2 ff ff       	call   306d2a <god_init>
  307a8e:	b8 00 00 00 00       	mov    $0x0,%eax
  307a93:	83 c4 04             	add    $0x4,%esp
  307a96:	59                   	pop    %ecx
  307a97:	5d                   	pop    %ebp
  307a98:	8d 61 fc             	lea    -0x4(%ecx),%esp
  307a9b:	c3                   	ret    

00307a9c <memcpy>:
  307a9c:	55                   	push   %ebp
  307a9d:	89 e5                	mov    %esp,%ebp
  307a9f:	57                   	push   %edi
  307aa0:	56                   	push   %esi
  307aa1:	53                   	push   %ebx
  307aa2:	8b 45 10             	mov    0x10(%ebp),%eax
  307aa5:	8b 55 0c             	mov    0xc(%ebp),%edx
  307aa8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  307aab:	89 c1                	mov    %eax,%ecx
  307aad:	89 d6                	mov    %edx,%esi
  307aaf:	89 df                	mov    %ebx,%edi
  307ab1:	fc                   	cld    
  307ab2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  307ab4:	8b 45 08             	mov    0x8(%ebp),%eax
  307ab7:	5b                   	pop    %ebx
  307ab8:	5e                   	pop    %esi
  307ab9:	5f                   	pop    %edi
  307aba:	5d                   	pop    %ebp
  307abb:	c3                   	ret    

00307abc <buffer_init>:
  307abc:	55                   	push   %ebp
  307abd:	89 e5                	mov    %esp,%ebp
  307abf:	83 ec 10             	sub    $0x10,%esp
  307ac2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  307ac9:	c7 45 f8 00 00 01 00 	movl   $0x10000,-0x8(%ebp)
  307ad0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  307ad7:	eb 23                	jmp    307afc <buffer_init+0x40>
  307ad9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  307adc:	c1 e0 0c             	shl    $0xc,%eax
  307adf:	89 c2                	mov    %eax,%edx
  307ae1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  307ae4:	01 d0                	add    %edx,%eax
  307ae6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  307ae9:	83 c2 01             	add    $0x1,%edx
  307aec:	89 d1                	mov    %edx,%ecx
  307aee:	c1 e1 0c             	shl    $0xc,%ecx
  307af1:	8b 55 f8             	mov    -0x8(%ebp),%edx
  307af4:	01 ca                	add    %ecx,%edx
  307af6:	89 10                	mov    %edx,(%eax)
  307af8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  307afc:	81 7d fc 8e 00 00 00 	cmpl   $0x8e,-0x4(%ebp)
  307b03:	7e d4                	jle    307ad9 <buffer_init+0x1d>
  307b05:	8b 45 fc             	mov    -0x4(%ebp),%eax
  307b08:	c1 e0 0c             	shl    $0xc,%eax
  307b0b:	89 c2                	mov    %eax,%edx
  307b0d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  307b10:	01 d0                	add    %edx,%eax
  307b12:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  307b18:	8b 45 f8             	mov    -0x8(%ebp),%eax
  307b1b:	a3 88 36 31 00       	mov    %eax,0x313688
  307b20:	c9                   	leave  
  307b21:	c3                   	ret    

00307b22 <get_buffer>:
  307b22:	55                   	push   %ebp
  307b23:	89 e5                	mov    %esp,%ebp
  307b25:	83 ec 10             	sub    $0x10,%esp
  307b28:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  307b2f:	a1 88 36 31 00       	mov    0x313688,%eax
  307b34:	85 c0                	test   %eax,%eax
  307b36:	74 14                	je     307b4c <get_buffer+0x2a>
  307b38:	a1 88 36 31 00       	mov    0x313688,%eax
  307b3d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  307b40:	a1 88 36 31 00       	mov    0x313688,%eax
  307b45:	8b 00                	mov    (%eax),%eax
  307b47:	a3 88 36 31 00       	mov    %eax,0x313688
  307b4c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  307b4f:	c9                   	leave  
  307b50:	c3                   	ret    

00307b51 <free_buffer>:
  307b51:	55                   	push   %ebp
  307b52:	89 e5                	mov    %esp,%ebp
  307b54:	83 ec 08             	sub    $0x8,%esp
  307b57:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  307b5b:	75 10                	jne    307b6d <free_buffer+0x1c>
  307b5d:	83 ec 0c             	sub    $0xc,%esp
  307b60:	68 30 dd 30 00       	push   $0x30dd30
  307b65:	e8 ce da ff ff       	call   305638 <panic>
  307b6a:	83 c4 10             	add    $0x10,%esp
  307b6d:	8b 45 08             	mov    0x8(%ebp),%eax
  307b70:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  307b75:	89 45 08             	mov    %eax,0x8(%ebp)
  307b78:	8b 15 88 36 31 00    	mov    0x313688,%edx
  307b7e:	8b 45 08             	mov    0x8(%ebp),%eax
  307b81:	89 10                	mov    %edx,(%eax)
  307b83:	8b 45 08             	mov    0x8(%ebp),%eax
  307b86:	a3 88 36 31 00       	mov    %eax,0x313688
  307b8b:	c9                   	leave  
  307b8c:	c3                   	ret    

00307b8d <dobuffer>:
  307b8d:	55                   	push   %ebp
  307b8e:	89 e5                	mov    %esp,%ebp
  307b90:	83 ec 18             	sub    $0x18,%esp
  307b93:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  307b9a:	81 65 10 ff 0f 00 00 	andl   $0xfff,0x10(%ebp)
  307ba1:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  307ba5:	75 2e                	jne    307bd5 <dobuffer+0x48>
  307ba7:	e8 76 ff ff ff       	call   307b22 <get_buffer>
  307bac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  307baf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  307bb3:	74 34                	je     307be9 <dobuffer+0x5c>
  307bb5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  307bb9:	74 2e                	je     307be9 <dobuffer+0x5c>
  307bbb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  307bbf:	74 28                	je     307be9 <dobuffer+0x5c>
  307bc1:	8b 45 10             	mov    0x10(%ebp),%eax
  307bc4:	50                   	push   %eax
  307bc5:	ff 75 0c             	pushl  0xc(%ebp)
  307bc8:	ff 75 f4             	pushl  -0xc(%ebp)
  307bcb:	e8 cc fe ff ff       	call   307a9c <memcpy>
  307bd0:	83 c4 0c             	add    $0xc,%esp
  307bd3:	eb 14                	jmp    307be9 <dobuffer+0x5c>
  307bd5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  307bd9:	75 0e                	jne    307be9 <dobuffer+0x5c>
  307bdb:	83 ec 0c             	sub    $0xc,%esp
  307bde:	ff 75 0c             	pushl  0xc(%ebp)
  307be1:	e8 6b ff ff ff       	call   307b51 <free_buffer>
  307be6:	83 c4 10             	add    $0x10,%esp
  307be9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307bec:	c9                   	leave  
  307bed:	c3                   	ret    
  307bee:	66 90                	xchg   %ax,%ax

00307bf0 <bucket_init>:
  307bf0:	55                   	push   %ebp
  307bf1:	89 e5                	mov    %esp,%ebp
  307bf3:	83 ec 18             	sub    $0x18,%esp
  307bf6:	e8 6e f6 ff ff       	call   307269 <get_kfree_page>
  307bfb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  307bfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307c01:	89 45 ec             	mov    %eax,-0x14(%ebp)
  307c04:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  307c08:	75 10                	jne    307c1a <bucket_init+0x2a>
  307c0a:	83 ec 0c             	sub    $0xc,%esp
  307c0d:	68 44 dd 30 00       	push   $0x30dd44
  307c12:	e8 21 da ff ff       	call   305638 <panic>
  307c17:	83 c4 10             	add    $0x10,%esp
  307c1a:	c7 45 f0 00 01 00 00 	movl   $0x100,-0x10(%ebp)
  307c21:	eb 14                	jmp    307c37 <bucket_init+0x47>
  307c23:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307c26:	8d 50 10             	lea    0x10(%eax),%edx
  307c29:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307c2c:	89 50 04             	mov    %edx,0x4(%eax)
  307c2f:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
  307c33:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
  307c37:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
  307c3b:	7f e6                	jg     307c23 <bucket_init+0x33>
  307c3d:	8b 15 8c 36 31 00    	mov    0x31368c,%edx
  307c43:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307c46:	89 50 04             	mov    %edx,0x4(%eax)
  307c49:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307c4c:	a3 8c 36 31 00       	mov    %eax,0x31368c
  307c51:	c9                   	leave  
  307c52:	c3                   	ret    

00307c53 <kalloc>:
  307c53:	55                   	push   %ebp
  307c54:	89 e5                	mov    %esp,%ebp
  307c56:	83 ec 28             	sub    $0x28,%esp
  307c59:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  307c60:	c7 45 f0 00 31 31 00 	movl   $0x313100,-0x10(%ebp)
  307c67:	eb 10                	jmp    307c79 <kalloc+0x26>
  307c69:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307c6c:	8b 00                	mov    (%eax),%eax
  307c6e:	3b 45 08             	cmp    0x8(%ebp),%eax
  307c71:	76 02                	jbe    307c75 <kalloc+0x22>
  307c73:	eb 0d                	jmp    307c82 <kalloc+0x2f>
  307c75:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
  307c79:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307c7c:	8b 00                	mov    (%eax),%eax
  307c7e:	85 c0                	test   %eax,%eax
  307c80:	75 e7                	jne    307c69 <kalloc+0x16>
  307c82:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307c85:	8b 00                	mov    (%eax),%eax
  307c87:	85 c0                	test   %eax,%eax
  307c89:	75 10                	jne    307c9b <kalloc+0x48>
  307c8b:	83 ec 0c             	sub    $0xc,%esp
  307c8e:	68 68 dd 30 00       	push   $0x30dd68
  307c93:	e8 a0 d9 ff ff       	call   305638 <panic>
  307c98:	83 c4 10             	add    $0x10,%esp
  307c9b:	fa                   	cli    
  307c9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307c9f:	8b 40 04             	mov    0x4(%eax),%eax
  307ca2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  307ca5:	eb 15                	jmp    307cbc <kalloc+0x69>
  307ca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307caa:	8b 40 08             	mov    0x8(%eax),%eax
  307cad:	85 c0                	test   %eax,%eax
  307caf:	74 02                	je     307cb3 <kalloc+0x60>
  307cb1:	eb 0f                	jmp    307cc2 <kalloc+0x6f>
  307cb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307cb6:	8b 40 04             	mov    0x4(%eax),%eax
  307cb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  307cbc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  307cc0:	75 e5                	jne    307ca7 <kalloc+0x54>
  307cc2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  307cc6:	0f 85 c8 00 00 00    	jne    307d94 <kalloc+0x141>
  307ccc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  307cd3:	a1 8c 36 31 00       	mov    0x31368c,%eax
  307cd8:	85 c0                	test   %eax,%eax
  307cda:	75 05                	jne    307ce1 <kalloc+0x8e>
  307cdc:	e8 0f ff ff ff       	call   307bf0 <bucket_init>
  307ce1:	a1 8c 36 31 00       	mov    0x31368c,%eax
  307ce6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  307ce9:	a1 8c 36 31 00       	mov    0x31368c,%eax
  307cee:	8b 40 04             	mov    0x4(%eax),%eax
  307cf1:	a3 8c 36 31 00       	mov    %eax,0x31368c
  307cf6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307cf9:	66 c7 40 0c 00 00    	movw   $0x0,0xc(%eax)
  307cff:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307d02:	8b 00                	mov    (%eax),%eax
  307d04:	89 c2                	mov    %eax,%edx
  307d06:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307d09:	66 89 50 0e          	mov    %dx,0xe(%eax)
  307d0d:	e8 57 f5 ff ff       	call   307269 <get_kfree_page>
  307d12:	89 45 ec             	mov    %eax,-0x14(%ebp)
  307d15:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307d18:	8b 55 ec             	mov    -0x14(%ebp),%edx
  307d1b:	89 50 08             	mov    %edx,0x8(%eax)
  307d1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307d21:	8b 50 08             	mov    0x8(%eax),%edx
  307d24:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307d27:	89 10                	mov    %edx,(%eax)
  307d29:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  307d2d:	75 10                	jne    307d3f <kalloc+0xec>
  307d2f:	83 ec 0c             	sub    $0xc,%esp
  307d32:	68 84 dd 30 00       	push   $0x30dd84
  307d37:	e8 fc d8 ff ff       	call   305638 <panic>
  307d3c:	83 c4 10             	add    $0x10,%esp
  307d3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307d42:	8b 08                	mov    (%eax),%ecx
  307d44:	b8 00 10 00 00       	mov    $0x1000,%eax
  307d49:	ba 00 00 00 00       	mov    $0x0,%edx
  307d4e:	f7 f1                	div    %ecx
  307d50:	89 45 e8             	mov    %eax,-0x18(%ebp)
  307d53:	eb 1b                	jmp    307d70 <kalloc+0x11d>
  307d55:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307d58:	8b 10                	mov    (%eax),%edx
  307d5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307d5d:	01 c2                	add    %eax,%edx
  307d5f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307d62:	89 10                	mov    %edx,(%eax)
  307d64:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307d67:	8b 00                	mov    (%eax),%eax
  307d69:	01 45 ec             	add    %eax,-0x14(%ebp)
  307d6c:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  307d70:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
  307d74:	7f df                	jg     307d55 <kalloc+0x102>
  307d76:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307d79:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  307d7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307d82:	8b 50 04             	mov    0x4(%eax),%edx
  307d85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307d88:	89 50 04             	mov    %edx,0x4(%eax)
  307d8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307d8e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  307d91:	89 50 04             	mov    %edx,0x4(%eax)
  307d94:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307d97:	8b 40 08             	mov    0x8(%eax),%eax
  307d9a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  307d9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  307da0:	8b 10                	mov    (%eax),%edx
  307da2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307da5:	89 50 08             	mov    %edx,0x8(%eax)
  307da8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307dab:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
  307daf:	8d 50 01             	lea    0x1(%eax),%edx
  307db2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307db5:	66 89 50 0c          	mov    %dx,0xc(%eax)
  307db9:	fb                   	sti    
  307dba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  307dbd:	c9                   	leave  
  307dbe:	c3                   	ret    

00307dbf <kfree_s>:
  307dbf:	55                   	push   %ebp
  307dc0:	89 e5                	mov    %esp,%ebp
  307dc2:	83 ec 18             	sub    $0x18,%esp
  307dc5:	8b 45 08             	mov    0x8(%ebp),%eax
  307dc8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  307dcd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  307dd0:	c7 45 f4 00 31 31 00 	movl   $0x313100,-0xc(%ebp)
  307dd7:	eb 43                	jmp    307e1c <kfree_s+0x5d>
  307dd9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  307de0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307de3:	8b 00                	mov    (%eax),%eax
  307de5:	3b 45 0c             	cmp    0xc(%ebp),%eax
  307de8:	73 02                	jae    307dec <kfree_s+0x2d>
  307dea:	eb 2c                	jmp    307e18 <kfree_s+0x59>
  307dec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307def:	8b 40 04             	mov    0x4(%eax),%eax
  307df2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  307df5:	eb 1b                	jmp    307e12 <kfree_s+0x53>
  307df7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307dfa:	8b 00                	mov    (%eax),%eax
  307dfc:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  307dff:	75 02                	jne    307e03 <kfree_s+0x44>
  307e01:	eb 45                	jmp    307e48 <kfree_s+0x89>
  307e03:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e06:	89 45 ec             	mov    %eax,-0x14(%ebp)
  307e09:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e0c:	8b 40 04             	mov    0x4(%eax),%eax
  307e0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  307e12:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  307e16:	75 df                	jne    307df7 <kfree_s+0x38>
  307e18:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
  307e1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307e1f:	8b 00                	mov    (%eax),%eax
  307e21:	85 c0                	test   %eax,%eax
  307e23:	75 b4                	jne    307dd9 <kfree_s+0x1a>
  307e25:	83 ec 08             	sub    $0x8,%esp
  307e28:	ff 75 08             	pushl  0x8(%ebp)
  307e2b:	68 a6 dd 30 00       	push   $0x30dda6
  307e30:	e8 1f d8 ff ff       	call   305654 <printk>
  307e35:	83 c4 10             	add    $0x10,%esp
  307e38:	83 ec 0c             	sub    $0xc,%esp
  307e3b:	68 b0 dd 30 00       	push   $0x30ddb0
  307e40:	e8 f3 d7 ff ff       	call   305638 <panic>
  307e45:	83 c4 10             	add    $0x10,%esp
  307e48:	fa                   	cli    
  307e49:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e4c:	8b 50 08             	mov    0x8(%eax),%edx
  307e4f:	8b 45 08             	mov    0x8(%ebp),%eax
  307e52:	89 10                	mov    %edx,(%eax)
  307e54:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e57:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
  307e5b:	8d 50 ff             	lea    -0x1(%eax),%edx
  307e5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e61:	66 89 50 0c          	mov    %dx,0xc(%eax)
  307e65:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307e68:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
  307e6c:	66 85 c0             	test   %ax,%ax
  307e6f:	0f 85 a9 00 00 00    	jne    307f1e <kfree_s+0x15f>
  307e75:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  307e79:	74 0b                	je     307e86 <kfree_s+0xc7>
  307e7b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307e7e:	8b 40 04             	mov    0x4(%eax),%eax
  307e81:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  307e84:	75 11                	jne    307e97 <kfree_s+0xd8>
  307e86:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  307e8a:	75 32                	jne    307ebe <kfree_s+0xff>
  307e8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307e8f:	8b 40 04             	mov    0x4(%eax),%eax
  307e92:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  307e95:	74 27                	je     307ebe <kfree_s+0xff>
  307e97:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307e9a:	8b 40 04             	mov    0x4(%eax),%eax
  307e9d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  307ea0:	eb 16                	jmp    307eb8 <kfree_s+0xf9>
  307ea2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307ea5:	8b 40 04             	mov    0x4(%eax),%eax
  307ea8:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  307eab:	75 02                	jne    307eaf <kfree_s+0xf0>
  307ead:	eb 0f                	jmp    307ebe <kfree_s+0xff>
  307eaf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307eb2:	8b 40 04             	mov    0x4(%eax),%eax
  307eb5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  307eb8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  307ebc:	75 e4                	jne    307ea2 <kfree_s+0xe3>
  307ebe:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  307ec2:	74 0e                	je     307ed2 <kfree_s+0x113>
  307ec4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307ec7:	8b 50 04             	mov    0x4(%eax),%edx
  307eca:	8b 45 ec             	mov    -0x14(%ebp),%eax
  307ecd:	89 50 04             	mov    %edx,0x4(%eax)
  307ed0:	eb 27                	jmp    307ef9 <kfree_s+0x13a>
  307ed2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307ed5:	8b 40 04             	mov    0x4(%eax),%eax
  307ed8:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  307edb:	74 10                	je     307eed <kfree_s+0x12e>
  307edd:	83 ec 0c             	sub    $0xc,%esp
  307ee0:	68 d6 dd 30 00       	push   $0x30ddd6
  307ee5:	e8 4e d7 ff ff       	call   305638 <panic>
  307eea:	83 c4 10             	add    $0x10,%esp
  307eed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307ef0:	8b 50 04             	mov    0x4(%eax),%edx
  307ef3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307ef6:	89 50 04             	mov    %edx,0x4(%eax)
  307ef9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307efc:	8b 00                	mov    (%eax),%eax
  307efe:	83 ec 0c             	sub    $0xc,%esp
  307f01:	50                   	push   %eax
  307f02:	e8 2e f4 ff ff       	call   307335 <free_page>
  307f07:	83 c4 10             	add    $0x10,%esp
  307f0a:	8b 15 8c 36 31 00    	mov    0x31368c,%edx
  307f10:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307f13:	89 50 04             	mov    %edx,0x4(%eax)
  307f16:	8b 45 f0             	mov    -0x10(%ebp),%eax
  307f19:	a3 8c 36 31 00       	mov    %eax,0x31368c
  307f1e:	fb                   	sti    
  307f1f:	c9                   	leave  
  307f20:	c3                   	ret    
  307f21:	66 90                	xchg   %ax,%ax
  307f23:	90                   	nop

00307f24 <strcpy>:
  307f24:	55                   	push   %ebp
  307f25:	89 e5                	mov    %esp,%ebp
  307f27:	57                   	push   %edi
  307f28:	56                   	push   %esi
  307f29:	8b 55 0c             	mov    0xc(%ebp),%edx
  307f2c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  307f2f:	89 d6                	mov    %edx,%esi
  307f31:	89 cf                	mov    %ecx,%edi
  307f33:	fc                   	cld    
  307f34:	ac                   	lods   %ds:(%esi),%al
  307f35:	aa                   	stos   %al,%es:(%edi)
  307f36:	84 c0                	test   %al,%al
  307f38:	75 fa                	jne    307f34 <strcpy+0x10>
  307f3a:	8b 45 08             	mov    0x8(%ebp),%eax
  307f3d:	5e                   	pop    %esi
  307f3e:	5f                   	pop    %edi
  307f3f:	5d                   	pop    %ebp
  307f40:	c3                   	ret    

00307f41 <memcpy>:
  307f41:	55                   	push   %ebp
  307f42:	89 e5                	mov    %esp,%ebp
  307f44:	57                   	push   %edi
  307f45:	56                   	push   %esi
  307f46:	53                   	push   %ebx
  307f47:	8b 45 10             	mov    0x10(%ebp),%eax
  307f4a:	8b 55 0c             	mov    0xc(%ebp),%edx
  307f4d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  307f50:	89 c1                	mov    %eax,%ecx
  307f52:	89 d6                	mov    %edx,%esi
  307f54:	89 df                	mov    %ebx,%edi
  307f56:	fc                   	cld    
  307f57:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  307f59:	8b 45 08             	mov    0x8(%ebp),%eax
  307f5c:	5b                   	pop    %ebx
  307f5d:	5e                   	pop    %esi
  307f5e:	5f                   	pop    %edi
  307f5f:	5d                   	pop    %ebp
  307f60:	c3                   	ret    

00307f61 <share_items>:
  307f61:	55                   	push   %ebp
  307f62:	89 e5                	mov    %esp,%ebp
  307f64:	83 ec 18             	sub    $0x18,%esp
  307f67:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  307f6e:	eb 3a                	jmp    307faa <share_items+0x49>
  307f70:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307f73:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  307f7a:	8b 45 08             	mov    0x8(%ebp),%eax
  307f7d:	01 d0                	add    %edx,%eax
  307f7f:	0f b6 00             	movzbl (%eax),%eax
  307f82:	83 e0 01             	and    $0x1,%eax
  307f85:	84 c0                	test   %al,%al
  307f87:	74 1d                	je     307fa6 <share_items+0x45>
  307f89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307f8c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  307f93:	8b 45 08             	mov    0x8(%ebp),%eax
  307f96:	01 d0                	add    %edx,%eax
  307f98:	8b 00                	mov    (%eax),%eax
  307f9a:	83 ec 0c             	sub    $0xc,%esp
  307f9d:	50                   	push   %eax
  307f9e:	e8 35 f3 ff ff       	call   3072d8 <share_page>
  307fa3:	83 c4 10             	add    $0x10,%esp
  307fa6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  307faa:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  307fb1:	7e bd                	jle    307f70 <share_items+0xf>
  307fb3:	c9                   	leave  
  307fb4:	c3                   	ret    

00307fb5 <copy_dir>:
  307fb5:	55                   	push   %ebp
  307fb6:	89 e5                	mov    %esp,%ebp
  307fb8:	57                   	push   %edi
  307fb9:	56                   	push   %esi
  307fba:	83 ec 10             	sub    $0x10,%esp
  307fbd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  307fc4:	e8 34 f2 ff ff       	call   3071fd <get_free_page>
  307fc9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  307fcc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  307fd0:	75 10                	jne    307fe2 <copy_dir+0x2d>
  307fd2:	83 ec 0c             	sub    $0xc,%esp
  307fd5:	68 f0 dd 30 00       	push   $0x30ddf0
  307fda:	e8 59 d6 ff ff       	call   305638 <panic>
  307fdf:	83 c4 10             	add    $0x10,%esp
  307fe2:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
  307fe9:	eb 73                	jmp    30805e <copy_dir+0xa9>
  307feb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  307fee:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  307ff5:	8b 45 08             	mov    0x8(%ebp),%eax
  307ff8:	01 d0                	add    %edx,%eax
  307ffa:	0f b6 10             	movzbl (%eax),%edx
  307ffd:	83 e2 fd             	and    $0xfffffffd,%edx
  308000:	88 10                	mov    %dl,(%eax)
  308002:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308005:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30800c:	8b 45 08             	mov    0x8(%ebp),%eax
  30800f:	01 d0                	add    %edx,%eax
  308011:	0f b6 00             	movzbl (%eax),%eax
  308014:	83 e0 01             	and    $0x1,%eax
  308017:	84 c0                	test   %al,%al
  308019:	74 3f                	je     30805a <copy_dir+0xa5>
  30801b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30801e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308025:	8b 45 08             	mov    0x8(%ebp),%eax
  308028:	01 d0                	add    %edx,%eax
  30802a:	8b 00                	mov    (%eax),%eax
  30802c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  308031:	83 ec 0c             	sub    $0xc,%esp
  308034:	50                   	push   %eax
  308035:	e8 27 ff ff ff       	call   307f61 <share_items>
  30803a:	83 c4 10             	add    $0x10,%esp
  30803d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308040:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308047:	8b 45 08             	mov    0x8(%ebp),%eax
  30804a:	01 d0                	add    %edx,%eax
  30804c:	8b 00                	mov    (%eax),%eax
  30804e:	83 ec 0c             	sub    $0xc,%esp
  308051:	50                   	push   %eax
  308052:	e8 81 f2 ff ff       	call   3072d8 <share_page>
  308057:	83 c4 10             	add    $0x10,%esp
  30805a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  30805e:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  308065:	7e 84                	jle    307feb <copy_dir+0x36>
  308067:	8b 45 08             	mov    0x8(%ebp),%eax
  30806a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  30806d:	b9 00 04 00 00       	mov    $0x400,%ecx
  308072:	89 c6                	mov    %eax,%esi
  308074:	89 d7                	mov    %edx,%edi
  308076:	fc                   	cld    
  308077:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  308079:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30807c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  30807f:	5e                   	pop    %esi
  308080:	5f                   	pop    %edi
  308081:	5d                   	pop    %ebp
  308082:	c3                   	ret    

00308083 <put_item>:
  308083:	55                   	push   %ebp
  308084:	89 e5                	mov    %esp,%ebp
  308086:	8b 45 10             	mov    0x10(%ebp),%eax
  308089:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308090:	8b 45 08             	mov    0x8(%ebp),%eax
  308093:	01 d0                	add    %edx,%eax
  308095:	8b 55 0c             	mov    0xc(%ebp),%edx
  308098:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  30809e:	83 ca 07             	or     $0x7,%edx
  3080a1:	89 10                	mov    %edx,(%eax)
  3080a3:	5d                   	pop    %ebp
  3080a4:	c3                   	ret    

003080a5 <clone_space>:
  3080a5:	55                   	push   %ebp
  3080a6:	89 e5                	mov    %esp,%ebp
  3080a8:	57                   	push   %edi
  3080a9:	56                   	push   %esi
  3080aa:	83 ec 10             	sub    $0x10,%esp
  3080ad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3080b4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  3080bb:	8b 45 08             	mov    0x8(%ebp),%eax
  3080be:	83 c0 04             	add    $0x4,%eax
  3080c1:	8b 00                	mov    (%eax),%eax
  3080c3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  3080c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3080cb:	83 ec 0c             	sub    $0xc,%esp
  3080ce:	ff 75 08             	pushl  0x8(%ebp)
  3080d1:	e8 df fe ff ff       	call   307fb5 <copy_dir>
  3080d6:	83 c4 10             	add    $0x10,%esp
  3080d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3080dc:	e8 1c f1 ff ff       	call   3071fd <get_free_page>
  3080e1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3080e4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  3080e8:	75 17                	jne    308101 <clone_space+0x5c>
  3080ea:	83 ec 04             	sub    $0x4,%esp
  3080ed:	6a 51                	push   $0x51
  3080ef:	68 0e de 30 00       	push   $0x30de0e
  3080f4:	68 18 de 30 00       	push   $0x30de18
  3080f9:	e8 56 d5 ff ff       	call   305654 <printk>
  3080fe:	83 c4 10             	add    $0x10,%esp
  308101:	8b 45 e8             	mov    -0x18(%ebp),%eax
  308104:	89 45 f0             	mov    %eax,-0x10(%ebp)
  308107:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30810a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  30810d:	b9 00 04 00 00       	mov    $0x400,%ecx
  308112:	89 c6                	mov    %eax,%esi
  308114:	89 d7                	mov    %edx,%edi
  308116:	fc                   	cld    
  308117:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  308119:	6a 07                	push   $0x7
  30811b:	68 ff 03 00 00       	push   $0x3ff
  308120:	ff 75 0c             	pushl  0xc(%ebp)
  308123:	ff 75 f0             	pushl  -0x10(%ebp)
  308126:	e8 58 ff ff ff       	call   308083 <put_item>
  30812b:	83 c4 10             	add    $0x10,%esp
  30812e:	6a 07                	push   $0x7
  308130:	6a 01                	push   $0x1
  308132:	ff 75 f0             	pushl  -0x10(%ebp)
  308135:	ff 75 f4             	pushl  -0xc(%ebp)
  308138:	e8 46 ff ff ff       	call   308083 <put_item>
  30813d:	83 c4 10             	add    $0x10,%esp
  308140:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308143:	8d 65 f8             	lea    -0x8(%ebp),%esp
  308146:	5e                   	pop    %esi
  308147:	5f                   	pop    %edi
  308148:	5d                   	pop    %ebp
  308149:	c3                   	ret    

0030814a <clone>:
  30814a:	55                   	push   %ebp
  30814b:	89 e5                	mov    %esp,%ebp
  30814d:	57                   	push   %edi
  30814e:	56                   	push   %esi
  30814f:	53                   	push   %ebx
  308150:	83 ec 2c             	sub    $0x2c,%esp
  308153:	8b 45 08             	mov    0x8(%ebp),%eax
  308156:	8b 40 3c             	mov    0x3c(%eax),%eax
  308159:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30815c:	83 ec 0c             	sub    $0xc,%esp
  30815f:	ff 75 e4             	pushl  -0x1c(%ebp)
  308162:	e8 b4 ef ff ff       	call   30711b <cloneObject>
  308167:	83 c4 10             	add    $0x10,%esp
  30816a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30816d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  308171:	75 29                	jne    30819c <clone+0x52>
  308173:	8b 45 08             	mov    0x8(%ebp),%eax
  308176:	8b 58 3c             	mov    0x3c(%eax),%ebx
  308179:	b8 02 00 00 00       	mov    $0x2,%eax
  30817e:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  308183:	ba 00 00 00 00       	mov    $0x0,%edx
  308188:	be 00 00 00 00       	mov    $0x0,%esi
  30818d:	bf 00 00 00 00       	mov    $0x0,%edi
  308192:	cd 80                	int    $0x80
  308194:	89 45 dc             	mov    %eax,-0x24(%ebp)
  308197:	e9 8c 00 00 00       	jmp    308228 <clone+0xde>
  30819c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30819f:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  3081a5:	83 ec 08             	sub    $0x8,%esp
  3081a8:	ff 75 e0             	pushl  -0x20(%ebp)
  3081ab:	50                   	push   %eax
  3081ac:	e8 f4 fe ff ff       	call   3080a5 <clone_space>
  3081b1:	83 c4 10             	add    $0x10,%esp
  3081b4:	89 c2                	mov    %eax,%edx
  3081b6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3081b9:	89 90 b4 00 00 00    	mov    %edx,0xb4(%eax)
  3081bf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3081c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  3081c5:	89 90 c0 00 00 00    	mov    %edx,0xc0(%eax)
  3081cb:	8b 45 08             	mov    0x8(%ebp),%eax
  3081ce:	8b 40 3c             	mov    0x3c(%eax),%eax
  3081d1:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
  3081d7:	83 ec 0c             	sub    $0xc,%esp
  3081da:	50                   	push   %eax
  3081db:	e8 3d 11 00 00       	call   30931d <copyvm>
  3081e0:	83 c4 10             	add    $0x10,%esp
  3081e3:	b8 02 00 00 00       	mov    $0x2,%eax
  3081e8:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  3081eb:	b9 00 00 00 00       	mov    $0x0,%ecx
  3081f0:	ba 00 00 00 00       	mov    $0x0,%edx
  3081f5:	be 00 00 00 00       	mov    $0x0,%esi
  3081fa:	bf 00 00 00 00       	mov    $0x0,%edi
  3081ff:	cd 80                	int    $0x80
  308201:	89 45 d8             	mov    %eax,-0x28(%ebp)
  308204:	8b 45 08             	mov    0x8(%ebp),%eax
  308207:	8b 58 3c             	mov    0x3c(%eax),%ebx
  30820a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30820d:	8b 08                	mov    (%eax),%ecx
  30820f:	b8 02 00 00 00       	mov    $0x2,%eax
  308214:	ba 00 00 00 00       	mov    $0x0,%edx
  308219:	be 00 00 00 00       	mov    $0x0,%esi
  30821e:	bf 00 00 00 00       	mov    $0x0,%edi
  308223:	cd 80                	int    $0x80
  308225:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  308228:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30822b:	5b                   	pop    %ebx
  30822c:	5e                   	pop    %esi
  30822d:	5f                   	pop    %edi
  30822e:	5d                   	pop    %ebp
  30822f:	c3                   	ret    

00308230 <delete_table>:
  308230:	55                   	push   %ebp
  308231:	89 e5                	mov    %esp,%ebp
  308233:	83 ec 18             	sub    $0x18,%esp
  308236:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30823d:	e9 8d 00 00 00       	jmp    3082cf <delete_table+0x9f>
  308242:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308245:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30824c:	8b 45 08             	mov    0x8(%ebp),%eax
  30824f:	01 d0                	add    %edx,%eax
  308251:	0f b6 00             	movzbl (%eax),%eax
  308254:	83 e0 01             	and    $0x1,%eax
  308257:	84 c0                	test   %al,%al
  308259:	74 70                	je     3082cb <delete_table+0x9b>
  30825b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30825e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308265:	8b 45 08             	mov    0x8(%ebp),%eax
  308268:	01 d0                	add    %edx,%eax
  30826a:	8b 00                	mov    (%eax),%eax
  30826c:	83 ec 0c             	sub    $0xc,%esp
  30826f:	50                   	push   %eax
  308270:	e8 c0 f0 ff ff       	call   307335 <free_page>
  308275:	83 c4 10             	add    $0x10,%esp
  308278:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30827b:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  30827f:	75 4a                	jne    3082cb <delete_table+0x9b>
  308281:	83 ec 04             	sub    $0x4,%esp
  308284:	6a 6d                	push   $0x6d
  308286:	68 0e de 30 00       	push   $0x30de0e
  30828b:	68 3c de 30 00       	push   $0x30de3c
  308290:	e8 bf d3 ff ff       	call   305654 <printk>
  308295:	83 c4 10             	add    $0x10,%esp
  308298:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30829b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3082a2:	8b 45 08             	mov    0x8(%ebp),%eax
  3082a5:	01 d0                	add    %edx,%eax
  3082a7:	8b 00                	mov    (%eax),%eax
  3082a9:	83 ec 0c             	sub    $0xc,%esp
  3082ac:	6a 6d                	push   $0x6d
  3082ae:	68 0e de 30 00       	push   $0x30de0e
  3082b3:	50                   	push   %eax
  3082b4:	ff 75 f4             	pushl  -0xc(%ebp)
  3082b7:	68 6c de 30 00       	push   $0x30de6c
  3082bc:	e8 93 d3 ff ff       	call   305654 <printk>
  3082c1:	83 c4 20             	add    $0x20,%esp
  3082c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  3082c9:	eb 16                	jmp    3082e1 <delete_table+0xb1>
  3082cb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3082cf:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  3082d6:	0f 8e 66 ff ff ff    	jle    308242 <delete_table+0x12>
  3082dc:	b8 00 00 00 00       	mov    $0x0,%eax
  3082e1:	c9                   	leave  
  3082e2:	c3                   	ret    

003082e3 <_delete>:
  3082e3:	55                   	push   %ebp
  3082e4:	89 e5                	mov    %esp,%ebp
  3082e6:	83 ec 18             	sub    $0x18,%esp
  3082e9:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
  3082f0:	e9 bd 00 00 00       	jmp    3083b2 <_delete+0xcf>
  3082f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3082f8:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3082ff:	8b 45 08             	mov    0x8(%ebp),%eax
  308302:	01 d0                	add    %edx,%eax
  308304:	0f b6 00             	movzbl (%eax),%eax
  308307:	83 e0 01             	and    $0x1,%eax
  30830a:	84 c0                	test   %al,%al
  30830c:	0f 84 9c 00 00 00    	je     3083ae <_delete+0xcb>
  308312:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308315:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30831c:	8b 45 08             	mov    0x8(%ebp),%eax
  30831f:	01 d0                	add    %edx,%eax
  308321:	8b 00                	mov    (%eax),%eax
  308323:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  308328:	83 ec 0c             	sub    $0xc,%esp
  30832b:	50                   	push   %eax
  30832c:	e8 ff fe ff ff       	call   308230 <delete_table>
  308331:	83 c4 10             	add    $0x10,%esp
  308334:	83 f8 ff             	cmp    $0xffffffff,%eax
  308337:	74 22                	je     30835b <_delete+0x78>
  308339:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30833c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308343:	8b 45 08             	mov    0x8(%ebp),%eax
  308346:	01 d0                	add    %edx,%eax
  308348:	8b 00                	mov    (%eax),%eax
  30834a:	83 ec 0c             	sub    $0xc,%esp
  30834d:	50                   	push   %eax
  30834e:	e8 e2 ef ff ff       	call   307335 <free_page>
  308353:	83 c4 10             	add    $0x10,%esp
  308356:	83 f8 ff             	cmp    $0xffffffff,%eax
  308359:	75 3c                	jne    308397 <_delete+0xb4>
  30835b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30835e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308365:	8b 45 08             	mov    0x8(%ebp),%eax
  308368:	01 d0                	add    %edx,%eax
  30836a:	8b 00                	mov    (%eax),%eax
  30836c:	83 ec 0c             	sub    $0xc,%esp
  30836f:	6a 7a                	push   $0x7a
  308371:	68 0e de 30 00       	push   $0x30de0e
  308376:	50                   	push   %eax
  308377:	ff 75 f4             	pushl  -0xc(%ebp)
  30837a:	68 94 de 30 00       	push   $0x30de94
  30837f:	e8 d0 d2 ff ff       	call   305654 <printk>
  308384:	83 c4 20             	add    $0x20,%esp
  308387:	83 ec 0c             	sub    $0xc,%esp
  30838a:	68 ba de 30 00       	push   $0x30deba
  30838f:	e8 a4 d2 ff ff       	call   305638 <panic>
  308394:	83 c4 10             	add    $0x10,%esp
  308397:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30839a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3083a1:	8b 45 08             	mov    0x8(%ebp),%eax
  3083a4:	01 d0                	add    %edx,%eax
  3083a6:	0f b6 10             	movzbl (%eax),%edx
  3083a9:	83 e2 fe             	and    $0xfffffffe,%edx
  3083ac:	88 10                	mov    %dl,(%eax)
  3083ae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3083b2:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  3083b9:	0f 8e 36 ff ff ff    	jle    3082f5 <_delete+0x12>
  3083bf:	c9                   	leave  
  3083c0:	c3                   	ret    

003083c1 <delete>:
  3083c1:	55                   	push   %ebp
  3083c2:	89 e5                	mov    %esp,%ebp
  3083c4:	57                   	push   %edi
  3083c5:	56                   	push   %esi
  3083c6:	53                   	push   %ebx
  3083c7:	83 ec 1c             	sub    $0x1c,%esp
  3083ca:	8b 45 08             	mov    0x8(%ebp),%eax
  3083cd:	8b 40 3c             	mov    0x3c(%eax),%eax
  3083d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3083d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3083d6:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  3083dc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3083df:	83 ec 0c             	sub    $0xc,%esp
  3083e2:	ff 75 e0             	pushl  -0x20(%ebp)
  3083e5:	e8 f9 fe ff ff       	call   3082e3 <_delete>
  3083ea:	83 c4 10             	add    $0x10,%esp
  3083ed:	8b 45 08             	mov    0x8(%ebp),%eax
  3083f0:	8b 40 3c             	mov    0x3c(%eax),%eax
  3083f3:	83 ec 0c             	sub    $0xc,%esp
  3083f6:	50                   	push   %eax
  3083f7:	e8 cf 05 00 00       	call   3089cb <trace>
  3083fc:	83 c4 10             	add    $0x10,%esp
  3083ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
  308402:	83 ec 0c             	sub    $0xc,%esp
  308405:	50                   	push   %eax
  308406:	e8 2a ef ff ff       	call   307335 <free_page>
  30840b:	83 c4 10             	add    $0x10,%esp
  30840e:	89 45 dc             	mov    %eax,-0x24(%ebp)
  308411:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%ebp)
  308415:	75 2a                	jne    308441 <delete+0x80>
  308417:	83 ec 04             	sub    $0x4,%esp
  30841a:	68 89 00 00 00       	push   $0x89
  30841f:	68 0e de 30 00       	push   $0x30de0e
  308424:	68 cc de 30 00       	push   $0x30decc
  308429:	e8 26 d2 ff ff       	call   305654 <printk>
  30842e:	83 c4 10             	add    $0x10,%esp
  308431:	83 ec 0c             	sub    $0xc,%esp
  308434:	68 ba de 30 00       	push   $0x30deba
  308439:	e8 fa d1 ff ff       	call   305638 <panic>
  30843e:	83 c4 10             	add    $0x10,%esp
  308441:	8b 45 08             	mov    0x8(%ebp),%eax
  308444:	8b 40 3c             	mov    0x3c(%eax),%eax
  308447:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
  30844d:	83 ec 0c             	sub    $0xc,%esp
  308450:	50                   	push   %eax
  308451:	e8 3b 0e 00 00       	call   309291 <delvm>
  308456:	83 c4 10             	add    $0x10,%esp
  308459:	8b 45 08             	mov    0x8(%ebp),%eax
  30845c:	8b 40 3c             	mov    0x3c(%eax),%eax
  30845f:	c7 80 a0 00 00 00 00 	movl   $0x0,0xa0(%eax)
  308466:	00 00 00 
  308469:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30846c:	8b 98 c0 00 00 00    	mov    0xc0(%eax),%ebx
  308472:	8b 45 08             	mov    0x8(%ebp),%eax
  308475:	8b 40 3c             	mov    0x3c(%eax),%eax
  308478:	8b 08                	mov    (%eax),%ecx
  30847a:	b8 02 00 00 00       	mov    $0x2,%eax
  30847f:	ba 00 00 00 00       	mov    $0x0,%edx
  308484:	be 00 00 00 00       	mov    $0x0,%esi
  308489:	bf 00 00 00 00       	mov    $0x0,%edi
  30848e:	cd 80                	int    $0x80
  308490:	89 45 d8             	mov    %eax,-0x28(%ebp)
  308493:	8d 65 f4             	lea    -0xc(%ebp),%esp
  308496:	5b                   	pop    %ebx
  308497:	5e                   	pop    %esi
  308498:	5f                   	pop    %edi
  308499:	5d                   	pop    %ebp
  30849a:	c3                   	ret    

0030849b <put_page>:
  30849b:	55                   	push   %ebp
  30849c:	89 e5                	mov    %esp,%ebp
  30849e:	83 ec 18             	sub    $0x18,%esp
  3084a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3084a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  3084ab:	c1 e8 16             	shr    $0x16,%eax
  3084ae:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3084b5:	8b 45 08             	mov    0x8(%ebp),%eax
  3084b8:	01 d0                	add    %edx,%eax
  3084ba:	0f b6 00             	movzbl (%eax),%eax
  3084bd:	83 e0 01             	and    $0x1,%eax
  3084c0:	84 c0                	test   %al,%al
  3084c2:	75 2c                	jne    3084f0 <put_page+0x55>
  3084c4:	e8 34 ed ff ff       	call   3071fd <get_free_page>
  3084c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3084cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3084d0:	75 07                	jne    3084d9 <put_page+0x3e>
  3084d2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  3084d7:	eb 61                	jmp    30853a <put_page+0x9f>
  3084d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  3084dc:	c1 e8 16             	shr    $0x16,%eax
  3084df:	6a 07                	push   $0x7
  3084e1:	50                   	push   %eax
  3084e2:	ff 75 f4             	pushl  -0xc(%ebp)
  3084e5:	ff 75 08             	pushl  0x8(%ebp)
  3084e8:	e8 96 fb ff ff       	call   308083 <put_item>
  3084ed:	83 c4 10             	add    $0x10,%esp
  3084f0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  3084f4:	75 07                	jne    3084fd <put_page+0x62>
  3084f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  3084fb:	eb 3d                	jmp    30853a <put_page+0x9f>
  3084fd:	8b 45 0c             	mov    0xc(%ebp),%eax
  308500:	c1 e8 16             	shr    $0x16,%eax
  308503:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30850a:	8b 45 08             	mov    0x8(%ebp),%eax
  30850d:	01 d0                	add    %edx,%eax
  30850f:	8b 00                	mov    (%eax),%eax
  308511:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  308516:	89 45 f4             	mov    %eax,-0xc(%ebp)
  308519:	8b 45 0c             	mov    0xc(%ebp),%eax
  30851c:	c1 e8 0c             	shr    $0xc,%eax
  30851f:	25 ff 03 00 00       	and    $0x3ff,%eax
  308524:	6a 07                	push   $0x7
  308526:	50                   	push   %eax
  308527:	ff 75 10             	pushl  0x10(%ebp)
  30852a:	ff 75 f4             	pushl  -0xc(%ebp)
  30852d:	e8 51 fb ff ff       	call   308083 <put_item>
  308532:	83 c4 10             	add    $0x10,%esp
  308535:	b8 00 00 00 00       	mov    $0x0,%eax
  30853a:	c9                   	leave  
  30853b:	c3                   	ret    

0030853c <np_page>:
  30853c:	55                   	push   %ebp
  30853d:	89 e5                	mov    %esp,%ebp
  30853f:	57                   	push   %edi
  308540:	56                   	push   %esi
  308541:	53                   	push   %ebx
  308542:	83 ec 1c             	sub    $0x1c,%esp
  308545:	8b 45 08             	mov    0x8(%ebp),%eax
  308548:	8b 40 38             	mov    0x38(%eax),%eax
  30854b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30854e:	8b 45 08             	mov    0x8(%ebp),%eax
  308551:	8b 40 3c             	mov    0x3c(%eax),%eax
  308554:	89 45 e0             	mov    %eax,-0x20(%ebp)
  308557:	8b 45 08             	mov    0x8(%ebp),%eax
  30855a:	8b 40 3c             	mov    0x3c(%eax),%eax
  30855d:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
  308563:	83 ec 08             	sub    $0x8,%esp
  308566:	ff 75 e4             	pushl  -0x1c(%ebp)
  308569:	50                   	push   %eax
  30856a:	e8 1a 0e 00 00       	call   309389 <dovm>
  30856f:	83 c4 10             	add    $0x10,%esp
  308572:	89 45 dc             	mov    %eax,-0x24(%ebp)
  308575:	8b 45 08             	mov    0x8(%ebp),%eax
  308578:	8b 58 3c             	mov    0x3c(%eax),%ebx
  30857b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30857e:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  308584:	83 ec 04             	sub    $0x4,%esp
  308587:	ff 75 dc             	pushl  -0x24(%ebp)
  30858a:	ff 75 e4             	pushl  -0x1c(%ebp)
  30858d:	50                   	push   %eax
  30858e:	e8 08 ff ff ff       	call   30849b <put_page>
  308593:	83 c4 10             	add    $0x10,%esp
  308596:	89 c1                	mov    %eax,%ecx
  308598:	b8 02 00 00 00       	mov    $0x2,%eax
  30859d:	ba 00 00 00 00       	mov    $0x0,%edx
  3085a2:	be 00 00 00 00       	mov    $0x0,%esi
  3085a7:	bf 00 00 00 00       	mov    $0x0,%edi
  3085ac:	cd 80                	int    $0x80
  3085ae:	89 45 d8             	mov    %eax,-0x28(%ebp)
  3085b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3085b4:	5b                   	pop    %ebx
  3085b5:	5e                   	pop    %esi
  3085b6:	5f                   	pop    %edi
  3085b7:	5d                   	pop    %ebp
  3085b8:	c3                   	ret    

003085b9 <_un_table>:
  3085b9:	55                   	push   %ebp
  3085ba:	89 e5                	mov    %esp,%ebp
  3085bc:	57                   	push   %edi
  3085bd:	56                   	push   %esi
  3085be:	83 ec 10             	sub    $0x10,%esp
  3085c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  3085c4:	c1 e8 16             	shr    $0x16,%eax
  3085c7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3085ce:	8b 45 08             	mov    0x8(%ebp),%eax
  3085d1:	01 d0                	add    %edx,%eax
  3085d3:	8b 00                	mov    (%eax),%eax
  3085d5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  3085da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3085dd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  3085e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  3085e7:	c1 e8 16             	shr    $0x16,%eax
  3085ea:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3085f1:	8b 45 08             	mov    0x8(%ebp),%eax
  3085f4:	01 d0                	add    %edx,%eax
  3085f6:	0f b6 00             	movzbl (%eax),%eax
  3085f9:	83 e0 01             	and    $0x1,%eax
  3085fc:	84 c0                	test   %al,%al
  3085fe:	75 24                	jne    308624 <_un_table+0x6b>
  308600:	68 ad 00 00 00       	push   $0xad
  308605:	68 0e de 30 00       	push   $0x30de0e
  30860a:	ff 75 0c             	pushl  0xc(%ebp)
  30860d:	68 fc de 30 00       	push   $0x30defc
  308612:	e8 3d d0 ff ff       	call   305654 <printk>
  308617:	83 c4 10             	add    $0x10,%esp
  30861a:	b8 00 00 00 00       	mov    $0x0,%eax
  30861f:	e9 10 01 00 00       	jmp    308734 <_un_table+0x17b>
  308624:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  30862b:	eb 34                	jmp    308661 <_un_table+0xa8>
  30862d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308630:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308637:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30863a:	01 d0                	add    %edx,%eax
  30863c:	0f b6 00             	movzbl (%eax),%eax
  30863f:	83 e0 01             	and    $0x1,%eax
  308642:	84 c0                	test   %al,%al
  308644:	74 17                	je     30865d <_un_table+0xa4>
  308646:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308649:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308650:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308653:	01 d0                	add    %edx,%eax
  308655:	0f b6 10             	movzbl (%eax),%edx
  308658:	83 e2 fd             	and    $0xfffffffd,%edx
  30865b:	88 10                	mov    %dl,(%eax)
  30865d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  308661:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
  308668:	7e c3                	jle    30862d <_un_table+0x74>
  30866a:	8b 45 0c             	mov    0xc(%ebp),%eax
  30866d:	c1 e8 16             	shr    $0x16,%eax
  308670:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308677:	8b 45 08             	mov    0x8(%ebp),%eax
  30867a:	01 d0                	add    %edx,%eax
  30867c:	8b 00                	mov    (%eax),%eax
  30867e:	83 ec 0c             	sub    $0xc,%esp
  308681:	50                   	push   %eax
  308682:	e8 96 ec ff ff       	call   30731d <page_share_nr>
  308687:	83 c4 10             	add    $0x10,%esp
  30868a:	83 f8 01             	cmp    $0x1,%eax
  30868d:	0f 8e 9e 00 00 00    	jle    308731 <_un_table+0x178>
  308693:	8b 45 0c             	mov    0xc(%ebp),%eax
  308696:	c1 e8 16             	shr    $0x16,%eax
  308699:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3086a0:	8b 45 08             	mov    0x8(%ebp),%eax
  3086a3:	01 d0                	add    %edx,%eax
  3086a5:	8b 00                	mov    (%eax),%eax
  3086a7:	83 ec 0c             	sub    $0xc,%esp
  3086aa:	50                   	push   %eax
  3086ab:	e8 85 ec ff ff       	call   307335 <free_page>
  3086b0:	83 c4 10             	add    $0x10,%esp
  3086b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3086b6:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%ebp)
  3086ba:	75 48                	jne    308704 <_un_table+0x14b>
  3086bc:	83 ec 04             	sub    $0x4,%esp
  3086bf:	68 bb 00 00 00       	push   $0xbb
  3086c4:	68 0e de 30 00       	push   $0x30de0e
  3086c9:	68 34 df 30 00       	push   $0x30df34
  3086ce:	e8 81 cf ff ff       	call   305654 <printk>
  3086d3:	83 c4 10             	add    $0x10,%esp
  3086d6:	68 bb 00 00 00       	push   $0xbb
  3086db:	68 0e de 30 00       	push   $0x30de0e
  3086e0:	ff 75 0c             	pushl  0xc(%ebp)
  3086e3:	68 78 df 30 00       	push   $0x30df78
  3086e8:	e8 67 cf ff ff       	call   305654 <printk>
  3086ed:	83 c4 10             	add    $0x10,%esp
  3086f0:	a1 04 36 31 00       	mov    0x313604,%eax
  3086f5:	8b 40 3c             	mov    0x3c(%eax),%eax
  3086f8:	83 ec 0c             	sub    $0xc,%esp
  3086fb:	50                   	push   %eax
  3086fc:	e8 ca 02 00 00       	call   3089cb <trace>
  308701:	83 c4 10             	add    $0x10,%esp
  308704:	e8 f4 ea ff ff       	call   3071fd <get_free_page>
  308709:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30870c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  308710:	75 07                	jne    308719 <_un_table+0x160>
  308712:	b8 00 00 00 00       	mov    $0x0,%eax
  308717:	eb 1b                	jmp    308734 <_un_table+0x17b>
  308719:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30871c:	8b 55 ec             	mov    -0x14(%ebp),%edx
  30871f:	b9 00 04 00 00       	mov    $0x400,%ecx
  308724:	89 c6                	mov    %eax,%esi
  308726:	89 d7                	mov    %edx,%edi
  308728:	fc                   	cld    
  308729:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  30872b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30872e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  308731:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308734:	8d 65 f8             	lea    -0x8(%ebp),%esp
  308737:	5e                   	pop    %esi
  308738:	5f                   	pop    %edi
  308739:	5d                   	pop    %ebp
  30873a:	c3                   	ret    

0030873b <_un_page>:
  30873b:	55                   	push   %ebp
  30873c:	89 e5                	mov    %esp,%ebp
  30873e:	57                   	push   %edi
  30873f:	56                   	push   %esi
  308740:	83 ec 10             	sub    $0x10,%esp
  308743:	8b 45 0c             	mov    0xc(%ebp),%eax
  308746:	c1 e8 0c             	shr    $0xc,%eax
  308749:	25 ff 03 00 00       	and    $0x3ff,%eax
  30874e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308755:	8b 45 08             	mov    0x8(%ebp),%eax
  308758:	01 d0                	add    %edx,%eax
  30875a:	8b 00                	mov    (%eax),%eax
  30875c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  308761:	89 45 f4             	mov    %eax,-0xc(%ebp)
  308764:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  30876b:	8b 45 0c             	mov    0xc(%ebp),%eax
  30876e:	c1 e8 0c             	shr    $0xc,%eax
  308771:	25 ff 03 00 00       	and    $0x3ff,%eax
  308776:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30877d:	8b 45 08             	mov    0x8(%ebp),%eax
  308780:	01 d0                	add    %edx,%eax
  308782:	0f b6 00             	movzbl (%eax),%eax
  308785:	83 e0 01             	and    $0x1,%eax
  308788:	84 c0                	test   %al,%al
  30878a:	75 24                	jne    3087b0 <_un_page+0x75>
  30878c:	68 ca 00 00 00       	push   $0xca
  308791:	68 0e de 30 00       	push   $0x30de0e
  308796:	ff 75 0c             	pushl  0xc(%ebp)
  308799:	68 bc df 30 00       	push   $0x30dfbc
  30879e:	e8 b1 ce ff ff       	call   305654 <printk>
  3087a3:	83 c4 10             	add    $0x10,%esp
  3087a6:	b8 00 00 00 00       	mov    $0x0,%eax
  3087ab:	e9 c0 00 00 00       	jmp    308870 <_un_page+0x135>
  3087b0:	8b 45 0c             	mov    0xc(%ebp),%eax
  3087b3:	c1 e8 0c             	shr    $0xc,%eax
  3087b6:	25 ff 03 00 00       	and    $0x3ff,%eax
  3087bb:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3087c2:	8b 45 08             	mov    0x8(%ebp),%eax
  3087c5:	01 d0                	add    %edx,%eax
  3087c7:	8b 00                	mov    (%eax),%eax
  3087c9:	83 ec 0c             	sub    $0xc,%esp
  3087cc:	50                   	push   %eax
  3087cd:	e8 4b eb ff ff       	call   30731d <page_share_nr>
  3087d2:	83 c4 10             	add    $0x10,%esp
  3087d5:	83 f8 01             	cmp    $0x1,%eax
  3087d8:	0f 8e 8f 00 00 00    	jle    30886d <_un_page+0x132>
  3087de:	8b 45 0c             	mov    0xc(%ebp),%eax
  3087e1:	c1 e8 0c             	shr    $0xc,%eax
  3087e4:	25 ff 03 00 00       	and    $0x3ff,%eax
  3087e9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3087f0:	8b 45 08             	mov    0x8(%ebp),%eax
  3087f3:	01 d0                	add    %edx,%eax
  3087f5:	8b 00                	mov    (%eax),%eax
  3087f7:	83 ec 0c             	sub    $0xc,%esp
  3087fa:	50                   	push   %eax
  3087fb:	e8 35 eb ff ff       	call   307335 <free_page>
  308800:	83 c4 10             	add    $0x10,%esp
  308803:	89 45 ec             	mov    %eax,-0x14(%ebp)
  308806:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  30880a:	75 34                	jne    308840 <_un_page+0x105>
  30880c:	83 ec 04             	sub    $0x4,%esp
  30880f:	68 d1 00 00 00       	push   $0xd1
  308814:	68 0e de 30 00       	push   $0x30de0e
  308819:	68 e8 df 30 00       	push   $0x30dfe8
  30881e:	e8 31 ce ff ff       	call   305654 <printk>
  308823:	83 c4 10             	add    $0x10,%esp
  308826:	68 d1 00 00 00       	push   $0xd1
  30882b:	68 0e de 30 00       	push   $0x30de0e
  308830:	ff 75 0c             	pushl  0xc(%ebp)
  308833:	68 78 df 30 00       	push   $0x30df78
  308838:	e8 17 ce ff ff       	call   305654 <printk>
  30883d:	83 c4 10             	add    $0x10,%esp
  308840:	e8 b8 e9 ff ff       	call   3071fd <get_free_page>
  308845:	89 45 f0             	mov    %eax,-0x10(%ebp)
  308848:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  30884c:	75 07                	jne    308855 <_un_page+0x11a>
  30884e:	b8 00 00 00 00       	mov    $0x0,%eax
  308853:	eb 1b                	jmp    308870 <_un_page+0x135>
  308855:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308858:	8b 55 f0             	mov    -0x10(%ebp),%edx
  30885b:	b9 00 04 00 00       	mov    $0x400,%ecx
  308860:	89 c6                	mov    %eax,%esi
  308862:	89 d7                	mov    %edx,%edi
  308864:	fc                   	cld    
  308865:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  308867:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30886a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30886d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308870:	8d 65 f8             	lea    -0x8(%ebp),%esp
  308873:	5e                   	pop    %esi
  308874:	5f                   	pop    %edi
  308875:	5d                   	pop    %ebp
  308876:	c3                   	ret    

00308877 <nw_page>:
  308877:	55                   	push   %ebp
  308878:	89 e5                	mov    %esp,%ebp
  30887a:	57                   	push   %edi
  30887b:	56                   	push   %esi
  30887c:	53                   	push   %ebx
  30887d:	83 ec 2c             	sub    $0x2c,%esp
  308880:	8b 45 08             	mov    0x8(%ebp),%eax
  308883:	8b 40 38             	mov    0x38(%eax),%eax
  308886:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  308889:	8b 45 08             	mov    0x8(%ebp),%eax
  30888c:	8b 40 3c             	mov    0x3c(%eax),%eax
  30888f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  308892:	8b 45 e0             	mov    -0x20(%ebp),%eax
  308895:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  30889b:	83 ec 08             	sub    $0x8,%esp
  30889e:	ff 75 e4             	pushl  -0x1c(%ebp)
  3088a1:	50                   	push   %eax
  3088a2:	e8 12 fd ff ff       	call   3085b9 <_un_table>
  3088a7:	83 c4 10             	add    $0x10,%esp
  3088aa:	89 45 dc             	mov    %eax,-0x24(%ebp)
  3088ad:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  3088b1:	75 24                	jne    3088d7 <nw_page+0x60>
  3088b3:	8b 45 08             	mov    0x8(%ebp),%eax
  3088b6:	8b 58 3c             	mov    0x3c(%eax),%ebx
  3088b9:	b8 02 00 00 00       	mov    $0x2,%eax
  3088be:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  3088c3:	ba 00 00 00 00       	mov    $0x0,%edx
  3088c8:	be 00 00 00 00       	mov    $0x0,%esi
  3088cd:	bf 00 00 00 00       	mov    $0x0,%edi
  3088d2:	cd 80                	int    $0x80
  3088d4:	89 45 d8             	mov    %eax,-0x28(%ebp)
  3088d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3088da:	c1 e8 16             	shr    $0x16,%eax
  3088dd:	89 c2                	mov    %eax,%edx
  3088df:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3088e2:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  3088e8:	6a 07                	push   $0x7
  3088ea:	52                   	push   %edx
  3088eb:	ff 75 dc             	pushl  -0x24(%ebp)
  3088ee:	50                   	push   %eax
  3088ef:	e8 8f f7 ff ff       	call   308083 <put_item>
  3088f4:	83 c4 10             	add    $0x10,%esp
  3088f7:	83 ec 08             	sub    $0x8,%esp
  3088fa:	ff 75 e4             	pushl  -0x1c(%ebp)
  3088fd:	ff 75 dc             	pushl  -0x24(%ebp)
  308900:	e8 36 fe ff ff       	call   30873b <_un_page>
  308905:	83 c4 10             	add    $0x10,%esp
  308908:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  30890b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  30890f:	75 24                	jne    308935 <nw_page+0xbe>
  308911:	8b 45 08             	mov    0x8(%ebp),%eax
  308914:	8b 58 3c             	mov    0x3c(%eax),%ebx
  308917:	b8 02 00 00 00       	mov    $0x2,%eax
  30891c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  308921:	ba 00 00 00 00       	mov    $0x0,%edx
  308926:	be 00 00 00 00       	mov    $0x0,%esi
  30892b:	bf 00 00 00 00       	mov    $0x0,%edi
  308930:	cd 80                	int    $0x80
  308932:	89 45 d0             	mov    %eax,-0x30(%ebp)
  308935:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  308938:	c1 e8 0c             	shr    $0xc,%eax
  30893b:	25 ff 03 00 00       	and    $0x3ff,%eax
  308940:	6a 07                	push   $0x7
  308942:	50                   	push   %eax
  308943:	ff 75 d4             	pushl  -0x2c(%ebp)
  308946:	ff 75 dc             	pushl  -0x24(%ebp)
  308949:	e8 35 f7 ff ff       	call   308083 <put_item>
  30894e:	83 c4 10             	add    $0x10,%esp
  308951:	8b 45 08             	mov    0x8(%ebp),%eax
  308954:	8b 58 3c             	mov    0x3c(%eax),%ebx
  308957:	b8 02 00 00 00       	mov    $0x2,%eax
  30895c:	b9 00 00 00 00       	mov    $0x0,%ecx
  308961:	ba 00 00 00 00       	mov    $0x0,%edx
  308966:	be 00 00 00 00       	mov    $0x0,%esi
  30896b:	bf 00 00 00 00       	mov    $0x0,%edi
  308970:	cd 80                	int    $0x80
  308972:	89 45 cc             	mov    %eax,-0x34(%ebp)
  308975:	8d 65 f4             	lea    -0xc(%ebp),%esp
  308978:	5b                   	pop    %ebx
  308979:	5e                   	pop    %esi
  30897a:	5f                   	pop    %edi
  30897b:	5d                   	pop    %ebp
  30897c:	c3                   	ret    

0030897d <__va>:
  30897d:	55                   	push   %ebp
  30897e:	89 e5                	mov    %esp,%ebp
  308980:	83 ec 10             	sub    $0x10,%esp
  308983:	8b 45 0c             	mov    0xc(%ebp),%eax
  308986:	c1 e8 16             	shr    $0x16,%eax
  308989:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308990:	8b 45 08             	mov    0x8(%ebp),%eax
  308993:	01 d0                	add    %edx,%eax
  308995:	8b 00                	mov    (%eax),%eax
  308997:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  30899c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30899f:	8b 45 0c             	mov    0xc(%ebp),%eax
  3089a2:	c1 e8 0c             	shr    $0xc,%eax
  3089a5:	25 ff 03 00 00       	and    $0x3ff,%eax
  3089aa:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3089b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3089b4:	01 d0                	add    %edx,%eax
  3089b6:	8b 00                	mov    (%eax),%eax
  3089b8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  3089bd:	89 c2                	mov    %eax,%edx
  3089bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  3089c2:	25 ff 0f 00 00       	and    $0xfff,%eax
  3089c7:	01 d0                	add    %edx,%eax
  3089c9:	c9                   	leave  
  3089ca:	c3                   	ret    

003089cb <trace>:
  3089cb:	55                   	push   %ebp
  3089cc:	89 e5                	mov    %esp,%ebp
  3089ce:	83 ec 18             	sub    $0x18,%esp
  3089d1:	8b 45 08             	mov    0x8(%ebp),%eax
  3089d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3089d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3089da:	8b 90 b0 00 00 00    	mov    0xb0(%eax),%edx
  3089e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3089e3:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  3089e9:	52                   	push   %edx
  3089ea:	50                   	push   %eax
  3089eb:	e8 8d ff ff ff       	call   30897d <__va>
  3089f0:	83 c4 08             	add    $0x8,%esp
  3089f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3089f6:	8b 45 08             	mov    0x8(%ebp),%eax
  3089f9:	83 c0 14             	add    $0x14,%eax
  3089fc:	83 ec 08             	sub    $0x8,%esp
  3089ff:	50                   	push   %eax
  308a00:	68 30 e0 30 00       	push   $0x30e030
  308a05:	e8 4a cc ff ff       	call   305654 <printk>
  308a0a:	83 c4 10             	add    $0x10,%esp
  308a0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308a10:	8b 00                	mov    (%eax),%eax
  308a12:	83 ec 04             	sub    $0x4,%esp
  308a15:	ff 75 f0             	pushl  -0x10(%ebp)
  308a18:	50                   	push   %eax
  308a19:	68 5c e0 30 00       	push   $0x30e05c
  308a1e:	e8 31 cc ff ff       	call   305654 <printk>
  308a23:	83 c4 10             	add    $0x10,%esp
  308a26:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308a29:	8b 50 14             	mov    0x14(%eax),%edx
  308a2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308a2f:	8b 40 0c             	mov    0xc(%eax),%eax
  308a32:	83 ec 04             	sub    $0x4,%esp
  308a35:	52                   	push   %edx
  308a36:	50                   	push   %eax
  308a37:	68 72 e0 30 00       	push   $0x30e072
  308a3c:	e8 13 cc ff ff       	call   305654 <printk>
  308a41:	83 c4 10             	add    $0x10,%esp
  308a44:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308a47:	8b 50 10             	mov    0x10(%eax),%edx
  308a4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308a4d:	8b 40 08             	mov    0x8(%eax),%eax
  308a50:	83 ec 04             	sub    $0x4,%esp
  308a53:	52                   	push   %edx
  308a54:	50                   	push   %eax
  308a55:	68 88 e0 30 00       	push   $0x30e088
  308a5a:	e8 f5 cb ff ff       	call   305654 <printk>
  308a5f:	83 c4 10             	add    $0x10,%esp
  308a62:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308a65:	8b 50 30             	mov    0x30(%eax),%edx
  308a68:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308a6b:	8b 40 34             	mov    0x34(%eax),%eax
  308a6e:	83 ec 04             	sub    $0x4,%esp
  308a71:	52                   	push   %edx
  308a72:	50                   	push   %eax
  308a73:	68 9e e0 30 00       	push   $0x30e09e
  308a78:	e8 d7 cb ff ff       	call   305654 <printk>
  308a7d:	83 c4 10             	add    $0x10,%esp
  308a80:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308a83:	8b 50 3c             	mov    0x3c(%eax),%edx
  308a86:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308a89:	8b 40 40             	mov    0x40(%eax),%eax
  308a8c:	83 ec 04             	sub    $0x4,%esp
  308a8f:	52                   	push   %edx
  308a90:	50                   	push   %eax
  308a91:	68 b4 e0 30 00       	push   $0x30e0b4
  308a96:	e8 b9 cb ff ff       	call   305654 <printk>
  308a9b:	83 c4 10             	add    $0x10,%esp
  308a9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308aa1:	8b 50 38             	mov    0x38(%eax),%edx
  308aa4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308aa7:	8b 40 04             	mov    0x4(%eax),%eax
  308aaa:	83 ec 04             	sub    $0x4,%esp
  308aad:	52                   	push   %edx
  308aae:	50                   	push   %eax
  308aaf:	68 ca e0 30 00       	push   $0x30e0ca
  308ab4:	e8 9b cb ff ff       	call   305654 <printk>
  308ab9:	83 c4 10             	add    $0x10,%esp
  308abc:	c9                   	leave  
  308abd:	c3                   	ret    

00308abe <mm_execvp>:
  308abe:	55                   	push   %ebp
  308abf:	89 e5                	mov    %esp,%ebp
  308ac1:	57                   	push   %edi
  308ac2:	56                   	push   %esi
  308ac3:	53                   	push   %ebx
  308ac4:	83 ec 1c             	sub    $0x1c,%esp
  308ac7:	8b 45 08             	mov    0x8(%ebp),%eax
  308aca:	8b 40 3c             	mov    0x3c(%eax),%eax
  308acd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  308ad0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  308ad3:	c7 80 b0 00 00 00 bc 	movl   $0x7fffbc,0xb0(%eax)
  308ada:	ff 7f 00 
  308add:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  308ae0:	8b 90 b0 00 00 00    	mov    0xb0(%eax),%edx
  308ae6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  308ae9:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  308aef:	52                   	push   %edx
  308af0:	50                   	push   %eax
  308af1:	e8 87 fe ff ff       	call   30897d <__va>
  308af6:	83 c4 08             	add    $0x8,%esp
  308af9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  308afc:	8b 45 08             	mov    0x8(%ebp),%eax
  308aff:	8b 40 3c             	mov    0x3c(%eax),%eax
  308b02:	8b 80 a0 00 00 00    	mov    0xa0(%eax),%eax
  308b08:	83 ec 0c             	sub    $0xc,%esp
  308b0b:	50                   	push   %eax
  308b0c:	e8 80 07 00 00       	call   309291 <delvm>
  308b11:	83 c4 10             	add    $0x10,%esp
  308b14:	8b 45 08             	mov    0x8(%ebp),%eax
  308b17:	8b 40 3c             	mov    0x3c(%eax),%eax
  308b1a:	c7 80 a0 00 00 00 00 	movl   $0x0,0xa0(%eax)
  308b21:	00 00 00 
  308b24:	83 ec 08             	sub    $0x8,%esp
  308b27:	ff 75 e0             	pushl  -0x20(%ebp)
  308b2a:	ff 75 08             	pushl  0x8(%ebp)
  308b2d:	e8 05 04 00 00       	call   308f37 <mkvm>
  308b32:	83 c4 10             	add    $0x10,%esp
  308b35:	89 45 dc             	mov    %eax,-0x24(%ebp)
  308b38:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%ebp)
  308b3c:	75 1a                	jne    308b58 <mm_execvp+0x9a>
  308b3e:	83 ec 04             	sub    $0x4,%esp
  308b41:	68 00 01 00 00       	push   $0x100
  308b46:	68 0e de 30 00       	push   $0x30de0e
  308b4b:	68 e0 e0 30 00       	push   $0x30e0e0
  308b50:	e8 ff ca ff ff       	call   305654 <printk>
  308b55:	83 c4 10             	add    $0x10,%esp
  308b58:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  308b5b:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  308b61:	83 ec 0c             	sub    $0xc,%esp
  308b64:	50                   	push   %eax
  308b65:	e8 79 f7 ff ff       	call   3082e3 <_delete>
  308b6a:	83 c4 10             	add    $0x10,%esp
  308b6d:	8b 45 08             	mov    0x8(%ebp),%eax
  308b70:	8b 58 3c             	mov    0x3c(%eax),%ebx
  308b73:	b8 02 00 00 00       	mov    $0x2,%eax
  308b78:	b9 00 00 00 00       	mov    $0x0,%ecx
  308b7d:	ba 00 00 00 00       	mov    $0x0,%edx
  308b82:	be 00 00 00 00       	mov    $0x0,%esi
  308b87:	bf 00 00 00 00       	mov    $0x0,%edi
  308b8c:	cd 80                	int    $0x80
  308b8e:	89 45 d8             	mov    %eax,-0x28(%ebp)
  308b91:	8d 65 f4             	lea    -0xc(%ebp),%esp
  308b94:	5b                   	pop    %ebx
  308b95:	5e                   	pop    %esi
  308b96:	5f                   	pop    %edi
  308b97:	5d                   	pop    %ebp
  308b98:	c3                   	ret    

00308b99 <_wait>:
  308b99:	55                   	push   %ebp
  308b9a:	89 e5                	mov    %esp,%ebp
  308b9c:	5d                   	pop    %ebp
  308b9d:	c3                   	ret    

00308b9e <__clone_space__>:
  308b9e:	55                   	push   %ebp
  308b9f:	89 e5                	mov    %esp,%ebp
  308ba1:	57                   	push   %edi
  308ba2:	56                   	push   %esi
  308ba3:	83 ec 10             	sub    $0x10,%esp
  308ba6:	e8 52 e6 ff ff       	call   3071fd <get_free_page>
  308bab:	89 45 f0             	mov    %eax,-0x10(%ebp)
  308bae:	e8 4a e6 ff ff       	call   3071fd <get_free_page>
  308bb3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  308bb6:	8b 45 08             	mov    0x8(%ebp),%eax
  308bb9:	83 c0 04             	add    $0x4,%eax
  308bbc:	8b 00                	mov    (%eax),%eax
  308bbe:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  308bc3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  308bc6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  308bca:	74 06                	je     308bd2 <__clone_space__+0x34>
  308bcc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  308bd0:	75 10                	jne    308be2 <__clone_space__+0x44>
  308bd2:	83 ec 0c             	sub    $0xc,%esp
  308bd5:	68 02 e1 30 00       	push   $0x30e102
  308bda:	e8 59 ca ff ff       	call   305638 <panic>
  308bdf:	83 c4 10             	add    $0x10,%esp
  308be2:	8b 45 08             	mov    0x8(%ebp),%eax
  308be5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  308be8:	b9 00 04 00 00       	mov    $0x400,%ecx
  308bed:	89 c6                	mov    %eax,%esi
  308bef:	89 d7                	mov    %edx,%edi
  308bf1:	fc                   	cld    
  308bf2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  308bf4:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
  308bfb:	eb 1b                	jmp    308c18 <__clone_space__+0x7a>
  308bfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308c00:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  308c07:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308c0a:	01 d0                	add    %edx,%eax
  308c0c:	0f b6 10             	movzbl (%eax),%edx
  308c0f:	83 e2 fe             	and    $0xfffffffe,%edx
  308c12:	88 10                	mov    %dl,(%eax)
  308c14:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  308c18:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  308c1f:	7e dc                	jle    308bfd <__clone_space__+0x5f>
  308c21:	8b 45 e8             	mov    -0x18(%ebp),%eax
  308c24:	8b 55 ec             	mov    -0x14(%ebp),%edx
  308c27:	b9 00 04 00 00       	mov    $0x400,%ecx
  308c2c:	89 c6                	mov    %eax,%esi
  308c2e:	89 d7                	mov    %edx,%edi
  308c30:	fc                   	cld    
  308c31:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  308c33:	6a 07                	push   $0x7
  308c35:	68 ff 03 00 00       	push   $0x3ff
  308c3a:	ff 75 0c             	pushl  0xc(%ebp)
  308c3d:	ff 75 ec             	pushl  -0x14(%ebp)
  308c40:	e8 3e f4 ff ff       	call   308083 <put_item>
  308c45:	83 c4 10             	add    $0x10,%esp
  308c48:	6a 07                	push   $0x7
  308c4a:	6a 01                	push   $0x1
  308c4c:	ff 75 ec             	pushl  -0x14(%ebp)
  308c4f:	ff 75 f0             	pushl  -0x10(%ebp)
  308c52:	e8 2c f4 ff ff       	call   308083 <put_item>
  308c57:	83 c4 10             	add    $0x10,%esp
  308c5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  308c5d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  308c60:	5e                   	pop    %esi
  308c61:	5f                   	pop    %edi
  308c62:	5d                   	pop    %ebp
  308c63:	c3                   	ret    

00308c64 <make_task>:
  308c64:	55                   	push   %ebp
  308c65:	89 e5                	mov    %esp,%ebp
  308c67:	57                   	push   %edi
  308c68:	53                   	push   %ebx
  308c69:	83 ec 50             	sub    $0x50,%esp
  308c6c:	a1 04 36 31 00       	mov    0x313604,%eax
  308c71:	83 ec 0c             	sub    $0xc,%esp
  308c74:	50                   	push   %eax
  308c75:	e8 a1 e4 ff ff       	call   30711b <cloneObject>
  308c7a:	83 c4 10             	add    $0x10,%esp
  308c7d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  308c80:	a1 04 36 31 00       	mov    0x313604,%eax
  308c85:	8b 80 b4 00 00 00    	mov    0xb4(%eax),%eax
  308c8b:	83 ec 08             	sub    $0x8,%esp
  308c8e:	ff 75 f4             	pushl  -0xc(%ebp)
  308c91:	50                   	push   %eax
  308c92:	e8 07 ff ff ff       	call   308b9e <__clone_space__>
  308c97:	83 c4 10             	add    $0x10,%esp
  308c9a:	89 c2                	mov    %eax,%edx
  308c9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308c9f:	89 90 b4 00 00 00    	mov    %edx,0xb4(%eax)
  308ca5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308ca8:	c7 80 b0 00 00 00 bc 	movl   $0x7fffbc,0xb0(%eax)
  308caf:	ff 7f 00 
  308cb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308cb5:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
  308cbc:	00 00 00 
  308cbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308cc2:	c7 80 a4 00 00 00 14 	movl   $0x14,0xa4(%eax)
  308cc9:	00 00 00 
  308ccc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308ccf:	c7 80 a8 00 00 00 14 	movl   $0x14,0xa8(%eax)
  308cd6:	00 00 00 
  308cd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308cdc:	83 c0 14             	add    $0x14,%eax
  308cdf:	83 ec 08             	sub    $0x8,%esp
  308ce2:	ff 75 08             	pushl  0x8(%ebp)
  308ce5:	50                   	push   %eax
  308ce6:	e8 39 f2 ff ff       	call   307f24 <strcpy>
  308ceb:	83 c4 10             	add    $0x10,%esp
  308cee:	8d 5d b0             	lea    -0x50(%ebp),%ebx
  308cf1:	b8 00 00 00 00       	mov    $0x0,%eax
  308cf6:	ba 11 00 00 00       	mov    $0x11,%edx
  308cfb:	89 df                	mov    %ebx,%edi
  308cfd:	89 d1                	mov    %edx,%ecx
  308cff:	f3 ab                	rep stos %eax,%es:(%edi)
  308d01:	c7 45 b0 10 00 00 00 	movl   $0x10,-0x50(%ebp)
  308d08:	c7 45 b4 10 00 00 00 	movl   $0x10,-0x4c(%ebp)
  308d0f:	c7 45 b8 10 00 00 00 	movl   $0x10,-0x48(%ebp)
  308d16:	c7 45 bc 10 00 00 00 	movl   $0x10,-0x44(%ebp)
  308d1d:	8b 45 0c             	mov    0xc(%ebp),%eax
  308d20:	89 45 e0             	mov    %eax,-0x20(%ebp)
  308d23:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%ebp)
  308d2a:	c7 45 e8 00 02 00 00 	movl   $0x200,-0x18(%ebp)
  308d31:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308d34:	8d 90 bc 0f 00 00    	lea    0xfbc(%eax),%edx
  308d3a:	83 ec 04             	sub    $0x4,%esp
  308d3d:	6a 44                	push   $0x44
  308d3f:	8d 45 b0             	lea    -0x50(%ebp),%eax
  308d42:	50                   	push   %eax
  308d43:	52                   	push   %edx
  308d44:	e8 f8 f1 ff ff       	call   307f41 <memcpy>
  308d49:	83 c4 10             	add    $0x10,%esp
  308d4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  308d4f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  308d52:	5b                   	pop    %ebx
  308d53:	5f                   	pop    %edi
  308d54:	5d                   	pop    %ebp
  308d55:	c3                   	ret    

00308d56 <_mm_init>:
  308d56:	55                   	push   %ebp
  308d57:	89 e5                	mov    %esp,%ebp
  308d59:	57                   	push   %edi
  308d5a:	56                   	push   %esi
  308d5b:	53                   	push   %ebx
  308d5c:	83 ec 2c             	sub    $0x2c,%esp
  308d5f:	b8 03 00 00 00       	mov    $0x3,%eax
  308d64:	bb 04 00 00 00       	mov    $0x4,%ebx
  308d69:	b9 4a 81 30 00       	mov    $0x30814a,%ecx
  308d6e:	ba 00 00 00 00       	mov    $0x0,%edx
  308d73:	be 00 00 00 00       	mov    $0x0,%esi
  308d78:	bf 00 00 00 00       	mov    $0x0,%edi
  308d7d:	cd 80                	int    $0x80
  308d7f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  308d82:	b8 03 00 00 00       	mov    $0x3,%eax
  308d87:	bb 03 00 00 00       	mov    $0x3,%ebx
  308d8c:	b9 c1 83 30 00       	mov    $0x3083c1,%ecx
  308d91:	ba 00 00 00 00       	mov    $0x0,%edx
  308d96:	be 00 00 00 00       	mov    $0x0,%esi
  308d9b:	bf 00 00 00 00       	mov    $0x0,%edi
  308da0:	cd 80                	int    $0x80
  308da2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  308da5:	b8 03 00 00 00       	mov    $0x3,%eax
  308daa:	bb 07 00 00 00       	mov    $0x7,%ebx
  308daf:	b9 3c 85 30 00       	mov    $0x30853c,%ecx
  308db4:	ba 00 00 00 00       	mov    $0x0,%edx
  308db9:	be 00 00 00 00       	mov    $0x0,%esi
  308dbe:	bf 00 00 00 00       	mov    $0x0,%edi
  308dc3:	cd 80                	int    $0x80
  308dc5:	89 45 dc             	mov    %eax,-0x24(%ebp)
  308dc8:	b8 03 00 00 00       	mov    $0x3,%eax
  308dcd:	bb 08 00 00 00       	mov    $0x8,%ebx
  308dd2:	b9 77 88 30 00       	mov    $0x308877,%ecx
  308dd7:	ba 00 00 00 00       	mov    $0x0,%edx
  308ddc:	be 00 00 00 00       	mov    $0x0,%esi
  308de1:	bf 00 00 00 00       	mov    $0x0,%edi
  308de6:	cd 80                	int    $0x80
  308de8:	89 45 d8             	mov    %eax,-0x28(%ebp)
  308deb:	b8 03 00 00 00       	mov    $0x3,%eax
  308df0:	bb 0b 00 00 00       	mov    $0xb,%ebx
  308df5:	b9 be 8a 30 00       	mov    $0x308abe,%ecx
  308dfa:	ba 00 00 00 00       	mov    $0x0,%edx
  308dff:	be 00 00 00 00       	mov    $0x0,%esi
  308e04:	bf 00 00 00 00       	mov    $0x0,%edi
  308e09:	cd 80                	int    $0x80
  308e0b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  308e0e:	b8 03 00 00 00       	mov    $0x3,%eax
  308e13:	bb 0f 00 00 00       	mov    $0xf,%ebx
  308e18:	b9 99 8b 30 00       	mov    $0x308b99,%ecx
  308e1d:	ba 00 00 00 00       	mov    $0x0,%edx
  308e22:	be 00 00 00 00       	mov    $0x0,%esi
  308e27:	bf 00 00 00 00       	mov    $0x0,%edi
  308e2c:	cd 80                	int    $0x80
  308e2e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  308e31:	83 ec 08             	sub    $0x8,%esp
  308e34:	68 cd 6f 30 00       	push   $0x306fcd
  308e39:	68 1b e1 30 00       	push   $0x30e11b
  308e3e:	e8 21 fe ff ff       	call   308c64 <make_task>
  308e43:	83 c4 10             	add    $0x10,%esp
  308e46:	89 45 cc             	mov    %eax,-0x34(%ebp)
  308e49:	8b 15 04 36 31 00    	mov    0x313604,%edx
  308e4f:	8b 45 cc             	mov    -0x34(%ebp),%eax
  308e52:	89 50 40             	mov    %edx,0x40(%eax)
  308e55:	b8 02 00 00 00       	mov    $0x2,%eax
  308e5a:	8b 5d cc             	mov    -0x34(%ebp),%ebx
  308e5d:	b9 00 00 00 00       	mov    $0x0,%ecx
  308e62:	ba 00 00 00 00       	mov    $0x0,%edx
  308e67:	be 00 00 00 00       	mov    $0x0,%esi
  308e6c:	bf 00 00 00 00       	mov    $0x0,%edi
  308e71:	cd 80                	int    $0x80
  308e73:	89 45 c8             	mov    %eax,-0x38(%ebp)
  308e76:	8d 65 f4             	lea    -0xc(%ebp),%esp
  308e79:	5b                   	pop    %ebx
  308e7a:	5e                   	pop    %esi
  308e7b:	5f                   	pop    %edi
  308e7c:	5d                   	pop    %ebp
  308e7d:	c3                   	ret    

00308e7e <mm_main>:
  308e7e:	55                   	push   %ebp
  308e7f:	89 e5                	mov    %esp,%ebp
  308e81:	83 ec 08             	sub    $0x8,%esp
  308e84:	e8 cd fe ff ff       	call   308d56 <_mm_init>
  308e89:	e8 46 3d 00 00       	call   30cbd4 <dorun>
  308e8e:	b8 00 00 00 00       	mov    $0x0,%eax
  308e93:	c9                   	leave  
  308e94:	c3                   	ret    
  308e95:	66 90                	xchg   %ax,%ax
  308e97:	90                   	nop

00308e98 <INIT_LIST_HEAD>:
  308e98:	55                   	push   %ebp
  308e99:	89 e5                	mov    %esp,%ebp
  308e9b:	8b 45 08             	mov    0x8(%ebp),%eax
  308e9e:	8b 55 08             	mov    0x8(%ebp),%edx
  308ea1:	89 10                	mov    %edx,(%eax)
  308ea3:	8b 45 08             	mov    0x8(%ebp),%eax
  308ea6:	8b 55 08             	mov    0x8(%ebp),%edx
  308ea9:	89 50 04             	mov    %edx,0x4(%eax)
  308eac:	5d                   	pop    %ebp
  308ead:	c3                   	ret    

00308eae <__list_add>:
  308eae:	55                   	push   %ebp
  308eaf:	89 e5                	mov    %esp,%ebp
  308eb1:	8b 45 10             	mov    0x10(%ebp),%eax
  308eb4:	8b 55 08             	mov    0x8(%ebp),%edx
  308eb7:	89 50 04             	mov    %edx,0x4(%eax)
  308eba:	8b 45 08             	mov    0x8(%ebp),%eax
  308ebd:	8b 55 10             	mov    0x10(%ebp),%edx
  308ec0:	89 10                	mov    %edx,(%eax)
  308ec2:	8b 45 08             	mov    0x8(%ebp),%eax
  308ec5:	8b 55 0c             	mov    0xc(%ebp),%edx
  308ec8:	89 50 04             	mov    %edx,0x4(%eax)
  308ecb:	8b 45 0c             	mov    0xc(%ebp),%eax
  308ece:	8b 55 08             	mov    0x8(%ebp),%edx
  308ed1:	89 10                	mov    %edx,(%eax)
  308ed3:	5d                   	pop    %ebp
  308ed4:	c3                   	ret    

00308ed5 <list_add>:
  308ed5:	55                   	push   %ebp
  308ed6:	89 e5                	mov    %esp,%ebp
  308ed8:	8b 45 0c             	mov    0xc(%ebp),%eax
  308edb:	8b 00                	mov    (%eax),%eax
  308edd:	50                   	push   %eax
  308ede:	ff 75 0c             	pushl  0xc(%ebp)
  308ee1:	ff 75 08             	pushl  0x8(%ebp)
  308ee4:	e8 c5 ff ff ff       	call   308eae <__list_add>
  308ee9:	83 c4 0c             	add    $0xc,%esp
  308eec:	c9                   	leave  
  308eed:	c3                   	ret    

00308eee <strcpy>:
  308eee:	55                   	push   %ebp
  308eef:	89 e5                	mov    %esp,%ebp
  308ef1:	57                   	push   %edi
  308ef2:	56                   	push   %esi
  308ef3:	8b 55 0c             	mov    0xc(%ebp),%edx
  308ef6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  308ef9:	89 d6                	mov    %edx,%esi
  308efb:	89 cf                	mov    %ecx,%edi
  308efd:	fc                   	cld    
  308efe:	ac                   	lods   %ds:(%esi),%al
  308eff:	aa                   	stos   %al,%es:(%edi)
  308f00:	84 c0                	test   %al,%al
  308f02:	75 fa                	jne    308efe <strcpy+0x10>
  308f04:	8b 45 08             	mov    0x8(%ebp),%eax
  308f07:	5e                   	pop    %esi
  308f08:	5f                   	pop    %edi
  308f09:	5d                   	pop    %ebp
  308f0a:	c3                   	ret    

00308f0b <strcat>:
  308f0b:	55                   	push   %ebp
  308f0c:	89 e5                	mov    %esp,%ebp
  308f0e:	57                   	push   %edi
  308f0f:	56                   	push   %esi
  308f10:	53                   	push   %ebx
  308f11:	8b 55 0c             	mov    0xc(%ebp),%edx
  308f14:	8b 5d 08             	mov    0x8(%ebp),%ebx
  308f17:	b8 00 00 00 00       	mov    $0x0,%eax
  308f1c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  308f21:	89 d6                	mov    %edx,%esi
  308f23:	89 df                	mov    %ebx,%edi
  308f25:	fc                   	cld    
  308f26:	f2 ae                	repnz scas %es:(%edi),%al
  308f28:	4f                   	dec    %edi
  308f29:	ac                   	lods   %ds:(%esi),%al
  308f2a:	aa                   	stos   %al,%es:(%edi)
  308f2b:	84 c0                	test   %al,%al
  308f2d:	75 fa                	jne    308f29 <strcat+0x1e>
  308f2f:	8b 45 08             	mov    0x8(%ebp),%eax
  308f32:	5b                   	pop    %ebx
  308f33:	5e                   	pop    %esi
  308f34:	5f                   	pop    %edi
  308f35:	5d                   	pop    %ebp
  308f36:	c3                   	ret    

00308f37 <mkvm>:
  308f37:	55                   	push   %ebp
  308f38:	89 e5                	mov    %esp,%ebp
  308f3a:	83 ec 78             	sub    $0x78,%esp
  308f3d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  308f44:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  308f4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  308f52:	8b 45 08             	mov    0x8(%ebp),%eax
  308f55:	8b 40 38             	mov    0x38(%eax),%eax
  308f58:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  308f5b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  308f62:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  308f65:	8b 00                	mov    (%eax),%eax
  308f67:	8b 55 08             	mov    0x8(%ebp),%edx
  308f6a:	8b 52 3c             	mov    0x3c(%edx),%edx
  308f6d:	83 c2 14             	add    $0x14,%edx
  308f70:	50                   	push   %eax
  308f71:	52                   	push   %edx
  308f72:	e8 77 ff ff ff       	call   308eee <strcpy>
  308f77:	83 c4 08             	add    $0x8,%esp
  308f7a:	8b 45 08             	mov    0x8(%ebp),%eax
  308f7d:	8b 40 3c             	mov    0x3c(%eax),%eax
  308f80:	83 c0 14             	add    $0x14,%eax
  308f83:	68 24 e1 30 00       	push   $0x30e124
  308f88:	50                   	push   %eax
  308f89:	e8 7d ff ff ff       	call   308f0b <strcat>
  308f8e:	83 c4 08             	add    $0x8,%esp
  308f91:	8b 45 08             	mov    0x8(%ebp),%eax
  308f94:	8b 40 30             	mov    0x30(%eax),%eax
  308f97:	83 ec 04             	sub    $0x4,%esp
  308f9a:	6a 34                	push   $0x34
  308f9c:	8d 55 94             	lea    -0x6c(%ebp),%edx
  308f9f:	52                   	push   %edx
  308fa0:	50                   	push   %eax
  308fa1:	e8 43 41 00 00       	call   30d0e9 <read>
  308fa6:	83 c4 10             	add    $0x10,%esp
  308fa9:	89 45 dc             	mov    %eax,-0x24(%ebp)
  308fac:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%ebp)
  308fb0:	75 1c                	jne    308fce <mkvm+0x97>
  308fb2:	83 ec 04             	sub    $0x4,%esp
  308fb5:	6a 1a                	push   $0x1a
  308fb7:	68 29 e1 30 00       	push   $0x30e129
  308fbc:	68 30 e1 30 00       	push   $0x30e130
  308fc1:	e8 8e c6 ff ff       	call   305654 <printk>
  308fc6:	83 c4 10             	add    $0x10,%esp
  308fc9:	e9 91 02 00 00       	jmp    30925f <mkvm+0x328>
  308fce:	8b 45 dc             	mov    -0x24(%ebp),%eax
  308fd1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  308fd4:	8b 45 0c             	mov    0xc(%ebp),%eax
  308fd7:	c7 40 38 00 02 00 00 	movl   $0x200,0x38(%eax)
  308fde:	8b 45 ac             	mov    -0x54(%ebp),%eax
  308fe1:	89 c2                	mov    %eax,%edx
  308fe3:	8b 45 0c             	mov    0xc(%ebp),%eax
  308fe6:	89 50 30             	mov    %edx,0x30(%eax)
  308fe9:	8b 45 0c             	mov    0xc(%ebp),%eax
  308fec:	c7 40 34 08 00 00 00 	movl   $0x8,0x34(%eax)
  308ff3:	8b 45 0c             	mov    0xc(%ebp),%eax
  308ff6:	c7 40 08 10 00 00 00 	movl   $0x10,0x8(%eax)
  308ffd:	8b 45 0c             	mov    0xc(%ebp),%eax
  309000:	c7 40 0c 10 00 00 00 	movl   $0x10,0xc(%eax)
  309007:	8b 45 0c             	mov    0xc(%ebp),%eax
  30900a:	c7 40 40 10 00 00 00 	movl   $0x10,0x40(%eax)
  309011:	8b 45 0c             	mov    0xc(%ebp),%eax
  309014:	c7 00 10 00 00 00    	movl   $0x10,(%eax)
  30901a:	8b 45 0c             	mov    0xc(%ebp),%eax
  30901d:	8d 50 44             	lea    0x44(%eax),%edx
  309020:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  309023:	89 02                	mov    %eax,(%edx)
  309025:	0f b7 45 be          	movzwl -0x42(%ebp),%eax
  309029:	0f b7 d0             	movzwl %ax,%edx
  30902c:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
  309030:	0f b7 c0             	movzwl %ax,%eax
  309033:	0f af c2             	imul   %edx,%eax
  309036:	89 45 e8             	mov    %eax,-0x18(%ebp)
  309039:	83 ec 0c             	sub    $0xc,%esp
  30903c:	ff 75 e8             	pushl  -0x18(%ebp)
  30903f:	e8 0f ec ff ff       	call   307c53 <kalloc>
  309044:	83 c4 10             	add    $0x10,%esp
  309047:	89 45 d8             	mov    %eax,-0x28(%ebp)
  30904a:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  30904e:	75 1c                	jne    30906c <mkvm+0x135>
  309050:	83 ec 04             	sub    $0x4,%esp
  309053:	6a 25                	push   $0x25
  309055:	68 29 e1 30 00       	push   $0x30e129
  30905a:	68 6c e1 30 00       	push   $0x30e16c
  30905f:	e8 f0 c5 ff ff       	call   305654 <printk>
  309064:	83 c4 10             	add    $0x10,%esp
  309067:	e9 f3 01 00 00       	jmp    30925f <mkvm+0x328>
  30906c:	8b 45 d8             	mov    -0x28(%ebp),%eax
  30906f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  309072:	8b 55 b0             	mov    -0x50(%ebp),%edx
  309075:	8b 45 08             	mov    0x8(%ebp),%eax
  309078:	8b 40 30             	mov    0x30(%eax),%eax
  30907b:	83 ec 04             	sub    $0x4,%esp
  30907e:	6a 00                	push   $0x0
  309080:	52                   	push   %edx
  309081:	50                   	push   %eax
  309082:	e8 22 3c 00 00       	call   30cca9 <lseek>
  309087:	83 c4 10             	add    $0x10,%esp
  30908a:	8b 55 e8             	mov    -0x18(%ebp),%edx
  30908d:	8b 45 08             	mov    0x8(%ebp),%eax
  309090:	8b 40 30             	mov    0x30(%eax),%eax
  309093:	83 ec 04             	sub    $0x4,%esp
  309096:	52                   	push   %edx
  309097:	ff 75 ec             	pushl  -0x14(%ebp)
  30909a:	50                   	push   %eax
  30909b:	e8 49 40 00 00       	call   30d0e9 <read>
  3090a0:	83 c4 10             	add    $0x10,%esp
  3090a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  3090a6:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%ebp)
  3090aa:	75 1c                	jne    3090c8 <mkvm+0x191>
  3090ac:	83 ec 04             	sub    $0x4,%esp
  3090af:	6a 27                	push   $0x27
  3090b1:	68 29 e1 30 00       	push   $0x30e129
  3090b6:	68 90 e1 30 00       	push   $0x30e190
  3090bb:	e8 94 c5 ff ff       	call   305654 <printk>
  3090c0:	83 c4 10             	add    $0x10,%esp
  3090c3:	e9 97 01 00 00       	jmp    30925f <mkvm+0x328>
  3090c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  3090cb:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3090ce:	83 ec 0c             	sub    $0xc,%esp
  3090d1:	6a 10                	push   $0x10
  3090d3:	e8 7b eb ff ff       	call   307c53 <kalloc>
  3090d8:	83 c4 10             	add    $0x10,%esp
  3090db:	89 45 d0             	mov    %eax,-0x30(%ebp)
  3090de:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  3090e2:	75 1c                	jne    309100 <mkvm+0x1c9>
  3090e4:	83 ec 04             	sub    $0x4,%esp
  3090e7:	6a 29                	push   $0x29
  3090e9:	68 29 e1 30 00       	push   $0x30e129
  3090ee:	68 c4 e1 30 00       	push   $0x30e1c4
  3090f3:	e8 5c c5 ff ff       	call   305654 <printk>
  3090f8:	83 c4 10             	add    $0x10,%esp
  3090fb:	e9 5f 01 00 00       	jmp    30925f <mkvm+0x328>
  309100:	8b 45 d0             	mov    -0x30(%ebp),%eax
  309103:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309106:	8b 45 08             	mov    0x8(%ebp),%eax
  309109:	8b 50 30             	mov    0x30(%eax),%edx
  30910c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30910f:	89 50 04             	mov    %edx,0x4(%eax)
  309112:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309115:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  30911b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30911e:	83 c0 08             	add    $0x8,%eax
  309121:	83 ec 0c             	sub    $0xc,%esp
  309124:	50                   	push   %eax
  309125:	e8 6e fd ff ff       	call   308e98 <INIT_LIST_HEAD>
  30912a:	83 c4 10             	add    $0x10,%esp
  30912d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  309134:	e9 dc 00 00 00       	jmp    309215 <mkvm+0x2de>
  309139:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30913c:	c1 e0 05             	shl    $0x5,%eax
  30913f:	89 c2                	mov    %eax,%edx
  309141:	8b 45 ec             	mov    -0x14(%ebp),%eax
  309144:	01 d0                	add    %edx,%eax
  309146:	8b 00                	mov    (%eax),%eax
  309148:	83 f8 01             	cmp    $0x1,%eax
  30914b:	0f 85 c0 00 00 00    	jne    309211 <mkvm+0x2da>
  309151:	83 ec 0c             	sub    $0xc,%esp
  309154:	6a 1c                	push   $0x1c
  309156:	e8 f8 ea ff ff       	call   307c53 <kalloc>
  30915b:	83 c4 10             	add    $0x10,%esp
  30915e:	89 45 cc             	mov    %eax,-0x34(%ebp)
  309161:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
  309165:	75 1c                	jne    309183 <mkvm+0x24c>
  309167:	83 ec 04             	sub    $0x4,%esp
  30916a:	6a 2f                	push   $0x2f
  30916c:	68 29 e1 30 00       	push   $0x30e129
  309171:	68 f0 e1 30 00       	push   $0x30e1f0
  309176:	e8 d9 c4 ff ff       	call   305654 <printk>
  30917b:	83 c4 10             	add    $0x10,%esp
  30917e:	e9 dc 00 00 00       	jmp    30925f <mkvm+0x328>
  309183:	8b 45 cc             	mov    -0x34(%ebp),%eax
  309186:	89 45 c8             	mov    %eax,-0x38(%ebp)
  309189:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30918c:	c1 e0 05             	shl    $0x5,%eax
  30918f:	89 c2                	mov    %eax,%edx
  309191:	8b 45 ec             	mov    -0x14(%ebp),%eax
  309194:	01 d0                	add    %edx,%eax
  309196:	8b 50 18             	mov    0x18(%eax),%edx
  309199:	8b 45 c8             	mov    -0x38(%ebp),%eax
  30919c:	89 10                	mov    %edx,(%eax)
  30919e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3091a1:	c1 e0 05             	shl    $0x5,%eax
  3091a4:	89 c2                	mov    %eax,%edx
  3091a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3091a9:	01 d0                	add    %edx,%eax
  3091ab:	8b 40 08             	mov    0x8(%eax),%eax
  3091ae:	89 c2                	mov    %eax,%edx
  3091b0:	8b 45 c8             	mov    -0x38(%ebp),%eax
  3091b3:	89 50 04             	mov    %edx,0x4(%eax)
  3091b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3091b9:	c1 e0 05             	shl    $0x5,%eax
  3091bc:	89 c2                	mov    %eax,%edx
  3091be:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3091c1:	01 d0                	add    %edx,%eax
  3091c3:	8b 50 04             	mov    0x4(%eax),%edx
  3091c6:	8b 45 c8             	mov    -0x38(%ebp),%eax
  3091c9:	89 50 10             	mov    %edx,0x10(%eax)
  3091cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3091cf:	c1 e0 05             	shl    $0x5,%eax
  3091d2:	89 c2                	mov    %eax,%edx
  3091d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3091d7:	01 d0                	add    %edx,%eax
  3091d9:	8b 50 14             	mov    0x14(%eax),%edx
  3091dc:	8b 45 c8             	mov    -0x38(%ebp),%eax
  3091df:	89 50 08             	mov    %edx,0x8(%eax)
  3091e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3091e5:	c1 e0 05             	shl    $0x5,%eax
  3091e8:	89 c2                	mov    %eax,%edx
  3091ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3091ed:	01 d0                	add    %edx,%eax
  3091ef:	8b 50 10             	mov    0x10(%eax),%edx
  3091f2:	8b 45 c8             	mov    -0x38(%ebp),%eax
  3091f5:	89 50 0c             	mov    %edx,0xc(%eax)
  3091f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3091fb:	8d 50 08             	lea    0x8(%eax),%edx
  3091fe:	8b 45 c8             	mov    -0x38(%ebp),%eax
  309201:	83 c0 14             	add    $0x14,%eax
  309204:	83 ec 08             	sub    $0x8,%esp
  309207:	52                   	push   %edx
  309208:	50                   	push   %eax
  309209:	e8 c7 fc ff ff       	call   308ed5 <list_add>
  30920e:	83 c4 10             	add    $0x10,%esp
  309211:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  309215:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
  309219:	0f b7 c0             	movzwl %ax,%eax
  30921c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  30921f:	0f 8f 14 ff ff ff    	jg     309139 <mkvm+0x202>
  309225:	8b 45 08             	mov    0x8(%ebp),%eax
  309228:	8b 40 3c             	mov    0x3c(%eax),%eax
  30922b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  30922e:	89 90 a0 00 00 00    	mov    %edx,0xa0(%eax)
  309234:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309237:	8b 40 08             	mov    0x8(%eax),%eax
  30923a:	8b 55 08             	mov    0x8(%ebp),%edx
  30923d:	8b 52 3c             	mov    0x3c(%edx),%edx
  309240:	81 c2 a0 00 00 00    	add    $0xa0,%edx
  309246:	50                   	push   %eax
  309247:	ff 75 f4             	pushl  -0xc(%ebp)
  30924a:	52                   	push   %edx
  30924b:	68 18 e2 30 00       	push   $0x30e218
  309250:	e8 ff c3 ff ff       	call   305654 <printk>
  309255:	83 c4 10             	add    $0x10,%esp
  309258:	b8 00 00 00 00       	mov    $0x0,%eax
  30925d:	eb 30                	jmp    30928f <mkvm+0x358>
  30925f:	83 ec 0c             	sub    $0xc,%esp
  309262:	ff 75 f4             	pushl  -0xc(%ebp)
  309265:	e8 27 00 00 00       	call   309291 <delvm>
  30926a:	83 c4 10             	add    $0x10,%esp
  30926d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  309271:	74 10                	je     309283 <mkvm+0x34c>
  309273:	83 ec 08             	sub    $0x8,%esp
  309276:	6a 00                	push   $0x0
  309278:	ff 75 f4             	pushl  -0xc(%ebp)
  30927b:	e8 3f eb ff ff       	call   307dbf <kfree_s>
  309280:	83 c4 10             	add    $0x10,%esp
  309283:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30928a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  30928f:	c9                   	leave  
  309290:	c3                   	ret    

00309291 <delvm>:
  309291:	55                   	push   %ebp
  309292:	89 e5                	mov    %esp,%ebp
  309294:	83 ec 18             	sub    $0x18,%esp
  309297:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  30929b:	74 7e                	je     30931b <delvm+0x8a>
  30929d:	8b 45 08             	mov    0x8(%ebp),%eax
  3092a0:	8b 00                	mov    (%eax),%eax
  3092a2:	8d 50 ff             	lea    -0x1(%eax),%edx
  3092a5:	8b 45 08             	mov    0x8(%ebp),%eax
  3092a8:	89 10                	mov    %edx,(%eax)
  3092aa:	8b 45 08             	mov    0x8(%ebp),%eax
  3092ad:	8b 00                	mov    (%eax),%eax
  3092af:	85 c0                	test   %eax,%eax
  3092b1:	75 68                	jne    30931b <delvm+0x8a>
  3092b3:	83 ec 04             	sub    $0x4,%esp
  3092b6:	6a 45                	push   $0x45
  3092b8:	68 29 e1 30 00       	push   $0x30e129
  3092bd:	68 34 e2 30 00       	push   $0x30e234
  3092c2:	e8 8d c3 ff ff       	call   305654 <printk>
  3092c7:	83 c4 10             	add    $0x10,%esp
  3092ca:	8b 45 08             	mov    0x8(%ebp),%eax
  3092cd:	83 c0 08             	add    $0x8,%eax
  3092d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3092d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3092d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3092d9:	eb 28                	jmp    309303 <delvm+0x72>
  3092db:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3092de:	8b 00                	mov    (%eax),%eax
  3092e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3092e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3092e6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3092e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3092ec:	83 e8 14             	sub    $0x14,%eax
  3092ef:	83 ec 08             	sub    $0x8,%esp
  3092f2:	6a 00                	push   $0x0
  3092f4:	50                   	push   %eax
  3092f5:	e8 c5 ea ff ff       	call   307dbf <kfree_s>
  3092fa:	83 c4 10             	add    $0x10,%esp
  3092fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  309300:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309303:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309306:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  309309:	75 d0                	jne    3092db <delvm+0x4a>
  30930b:	83 ec 08             	sub    $0x8,%esp
  30930e:	6a 00                	push   $0x0
  309310:	ff 75 08             	pushl  0x8(%ebp)
  309313:	e8 a7 ea ff ff       	call   307dbf <kfree_s>
  309318:	83 c4 10             	add    $0x10,%esp
  30931b:	c9                   	leave  
  30931c:	c3                   	ret    

0030931d <copyvm>:
  30931d:	55                   	push   %ebp
  30931e:	89 e5                	mov    %esp,%ebp
  309320:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  309324:	74 0d                	je     309333 <copyvm+0x16>
  309326:	8b 45 08             	mov    0x8(%ebp),%eax
  309329:	8b 00                	mov    (%eax),%eax
  30932b:	8d 50 ff             	lea    -0x1(%eax),%edx
  30932e:	8b 45 08             	mov    0x8(%ebp),%eax
  309331:	89 10                	mov    %edx,(%eax)
  309333:	5d                   	pop    %ebp
  309334:	c3                   	ret    

00309335 <clr>:
  309335:	55                   	push   %ebp
  309336:	89 e5                	mov    %esp,%ebp
  309338:	83 ec 10             	sub    $0x10,%esp
  30933b:	8b 55 0c             	mov    0xc(%ebp),%edx
  30933e:	8b 45 08             	mov    0x8(%ebp),%eax
  309341:	8b 40 04             	mov    0x4(%eax),%eax
  309344:	29 c2                	sub    %eax,%edx
  309346:	89 d0                	mov    %edx,%eax
  309348:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  30934d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  309350:	8b 45 08             	mov    0x8(%ebp),%eax
  309353:	8b 40 0c             	mov    0xc(%eax),%eax
  309356:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  309359:	73 07                	jae    309362 <clr+0x2d>
  30935b:	b8 00 00 00 00       	mov    $0x0,%eax
  309360:	eb 25                	jmp    309387 <clr+0x52>
  309362:	8b 45 fc             	mov    -0x4(%ebp),%eax
  309365:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  30936b:	8b 45 08             	mov    0x8(%ebp),%eax
  30936e:	8b 40 0c             	mov    0xc(%eax),%eax
  309371:	39 c2                	cmp    %eax,%edx
  309373:	76 0d                	jbe    309382 <clr+0x4d>
  309375:	8b 45 08             	mov    0x8(%ebp),%eax
  309378:	8b 40 0c             	mov    0xc(%eax),%eax
  30937b:	25 ff 0f 00 00       	and    $0xfff,%eax
  309380:	eb 05                	jmp    309387 <clr+0x52>
  309382:	b8 00 10 00 00       	mov    $0x1000,%eax
  309387:	c9                   	leave  
  309388:	c3                   	ret    

00309389 <dovm>:
  309389:	55                   	push   %ebp
  30938a:	89 e5                	mov    %esp,%ebp
  30938c:	83 ec 28             	sub    $0x28,%esp
  30938f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  309393:	0f 84 3c 01 00 00    	je     3094d5 <dovm+0x14c>
  309399:	e8 5f de ff ff       	call   3071fd <get_free_page>
  30939e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3093a1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  3093a5:	75 1c                	jne    3093c3 <dovm+0x3a>
  3093a7:	83 ec 04             	sub    $0x4,%esp
  3093aa:	6a 62                	push   $0x62
  3093ac:	68 29 e1 30 00       	push   $0x30e129
  3093b1:	68 84 e2 30 00       	push   $0x30e284
  3093b6:	e8 99 c2 ff ff       	call   305654 <printk>
  3093bb:	83 c4 10             	add    $0x10,%esp
  3093be:	e9 12 01 00 00       	jmp    3094d5 <dovm+0x14c>
  3093c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3093c6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3093c9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  3093d0:	8b 45 08             	mov    0x8(%ebp),%eax
  3093d3:	83 c0 08             	add    $0x8,%eax
  3093d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3093d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3093dc:	8b 00                	mov    (%eax),%eax
  3093de:	83 ec 04             	sub    $0x4,%esp
  3093e1:	50                   	push   %eax
  3093e2:	ff 75 e4             	pushl  -0x1c(%ebp)
  3093e5:	68 a7 e2 30 00       	push   $0x30e2a7
  3093ea:	e8 65 c2 ff ff       	call   305654 <printk>
  3093ef:	83 c4 10             	add    $0x10,%esp
  3093f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3093f5:	8b 00                	mov    (%eax),%eax
  3093f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3093fa:	e9 c5 00 00 00       	jmp    3094c4 <dovm+0x13b>
  3093ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309402:	89 45 e0             	mov    %eax,-0x20(%ebp)
  309405:	8b 45 e0             	mov    -0x20(%ebp),%eax
  309408:	83 e8 14             	sub    $0x14,%eax
  30940b:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30940e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  309411:	8b 40 04             	mov    0x4(%eax),%eax
  309414:	3b 45 0c             	cmp    0xc(%ebp),%eax
  309417:	0f 87 9f 00 00 00    	ja     3094bc <dovm+0x133>
  30941d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  309420:	8b 50 04             	mov    0x4(%eax),%edx
  309423:	8b 45 dc             	mov    -0x24(%ebp),%eax
  309426:	8b 40 08             	mov    0x8(%eax),%eax
  309429:	01 d0                	add    %edx,%eax
  30942b:	3b 45 0c             	cmp    0xc(%ebp),%eax
  30942e:	0f 86 88 00 00 00    	jbe    3094bc <dovm+0x133>
  309434:	83 ec 08             	sub    $0x8,%esp
  309437:	ff 75 0c             	pushl  0xc(%ebp)
  30943a:	ff 75 dc             	pushl  -0x24(%ebp)
  30943d:	e8 f3 fe ff ff       	call   309335 <clr>
  309442:	83 c4 10             	add    $0x10,%esp
  309445:	89 45 e8             	mov    %eax,-0x18(%ebp)
  309448:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  30944c:	74 6c                	je     3094ba <dovm+0x131>
  30944e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  309451:	8b 50 10             	mov    0x10(%eax),%edx
  309454:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  309457:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30945a:	8b 40 04             	mov    0x4(%eax),%eax
  30945d:	29 c1                	sub    %eax,%ecx
  30945f:	89 c8                	mov    %ecx,%eax
  309461:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  309466:	01 c2                	add    %eax,%edx
  309468:	8b 45 08             	mov    0x8(%ebp),%eax
  30946b:	8b 40 04             	mov    0x4(%eax),%eax
  30946e:	83 ec 04             	sub    $0x4,%esp
  309471:	6a 00                	push   $0x0
  309473:	52                   	push   %edx
  309474:	50                   	push   %eax
  309475:	e8 2f 38 00 00       	call   30cca9 <lseek>
  30947a:	83 c4 10             	add    $0x10,%esp
  30947d:	8b 55 e8             	mov    -0x18(%ebp),%edx
  309480:	8b 45 08             	mov    0x8(%ebp),%eax
  309483:	8b 40 04             	mov    0x4(%eax),%eax
  309486:	83 ec 04             	sub    $0x4,%esp
  309489:	52                   	push   %edx
  30948a:	ff 75 ec             	pushl  -0x14(%ebp)
  30948d:	50                   	push   %eax
  30948e:	e8 56 3c 00 00       	call   30d0e9 <read>
  309493:	83 c4 10             	add    $0x10,%esp
  309496:	89 45 d8             	mov    %eax,-0x28(%ebp)
  309499:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
  30949d:	75 19                	jne    3094b8 <dovm+0x12f>
  30949f:	83 ec 04             	sub    $0x4,%esp
  3094a2:	6a 6c                	push   $0x6c
  3094a4:	68 29 e1 30 00       	push   $0x30e129
  3094a9:	68 bc e2 30 00       	push   $0x30e2bc
  3094ae:	e8 a1 c1 ff ff       	call   305654 <printk>
  3094b3:	83 c4 10             	add    $0x10,%esp
  3094b6:	eb 1d                	jmp    3094d5 <dovm+0x14c>
  3094b8:	eb 16                	jmp    3094d0 <dovm+0x147>
  3094ba:	eb 14                	jmp    3094d0 <dovm+0x147>
  3094bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3094bf:	8b 00                	mov    (%eax),%eax
  3094c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3094c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3094c7:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  3094ca:	0f 85 2f ff ff ff    	jne    3093ff <dovm+0x76>
  3094d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3094d3:	eb 05                	jmp    3094da <dovm+0x151>
  3094d5:	b8 00 00 00 00       	mov    $0x0,%eax
  3094da:	c9                   	leave  
  3094db:	c3                   	ret    

003094dc <_run>:
  3094dc:	55                   	push   %ebp
  3094dd:	89 e5                	mov    %esp,%ebp
  3094df:	57                   	push   %edi
  3094e0:	56                   	push   %esi
  3094e1:	53                   	push   %ebx
  3094e2:	83 ec 10             	sub    $0x10,%esp
  3094e5:	8b 55 10             	mov    0x10(%ebp),%edx
  3094e8:	8b 75 18             	mov    0x18(%ebp),%esi
  3094eb:	8b 7d 14             	mov    0x14(%ebp),%edi
  3094ee:	b8 00 00 00 00       	mov    $0x0,%eax
  3094f3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3094f6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  3094f9:	cd 80                	int    $0x80
  3094fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3094fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309501:	83 c4 10             	add    $0x10,%esp
  309504:	5b                   	pop    %ebx
  309505:	5e                   	pop    %esi
  309506:	5f                   	pop    %edi
  309507:	5d                   	pop    %ebp
  309508:	c3                   	ret    

00309509 <strlen>:
  309509:	55                   	push   %ebp
  30950a:	89 e5                	mov    %esp,%ebp
  30950c:	57                   	push   %edi
  30950d:	8b 55 08             	mov    0x8(%ebp),%edx
  309510:	b8 00 00 00 00       	mov    $0x0,%eax
  309515:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30951a:	89 d7                	mov    %edx,%edi
  30951c:	fc                   	cld    
  30951d:	f2 ae                	repnz scas %es:(%edi),%al
  30951f:	f7 d1                	not    %ecx
  309521:	49                   	dec    %ecx
  309522:	89 c8                	mov    %ecx,%eax
  309524:	5f                   	pop    %edi
  309525:	5d                   	pop    %ebp
  309526:	c3                   	ret    

00309527 <memcpy>:
  309527:	55                   	push   %ebp
  309528:	89 e5                	mov    %esp,%ebp
  30952a:	57                   	push   %edi
  30952b:	56                   	push   %esi
  30952c:	53                   	push   %ebx
  30952d:	8b 45 10             	mov    0x10(%ebp),%eax
  309530:	8b 55 0c             	mov    0xc(%ebp),%edx
  309533:	8b 5d 08             	mov    0x8(%ebp),%ebx
  309536:	89 c1                	mov    %eax,%ecx
  309538:	89 d6                	mov    %edx,%esi
  30953a:	89 df                	mov    %ebx,%edi
  30953c:	fc                   	cld    
  30953d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  30953f:	8b 45 08             	mov    0x8(%ebp),%eax
  309542:	5b                   	pop    %ebx
  309543:	5e                   	pop    %esi
  309544:	5f                   	pop    %edi
  309545:	5d                   	pop    %ebp
  309546:	c3                   	ret    

00309547 <do_read>:
  309547:	55                   	push   %ebp
  309548:	89 e5                	mov    %esp,%ebp
  30954a:	83 ec 28             	sub    $0x28,%esp
  30954d:	8b 45 10             	mov    0x10(%ebp),%eax
  309550:	c1 e8 0a             	shr    $0xa,%eax
  309553:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309556:	8b 45 10             	mov    0x10(%ebp),%eax
  309559:	25 ff 03 00 00       	and    $0x3ff,%eax
  30955e:	89 c2                	mov    %eax,%edx
  309560:	b8 00 04 00 00       	mov    $0x400,%eax
  309565:	29 d0                	sub    %edx,%eax
  309567:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30956a:	8b 45 08             	mov    0x8(%ebp),%eax
  30956d:	8b 40 08             	mov    0x8(%eax),%eax
  309570:	2b 45 10             	sub    0x10(%ebp),%eax
  309573:	89 c2                	mov    %eax,%edx
  309575:	8b 45 14             	mov    0x14(%ebp),%eax
  309578:	39 c2                	cmp    %eax,%edx
  30957a:	0f 46 c2             	cmovbe %edx,%eax
  30957d:	89 45 14             	mov    %eax,0x14(%ebp)
  309580:	8b 45 14             	mov    0x14(%ebp),%eax
  309583:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  309586:	0f 46 45 f0          	cmovbe -0x10(%ebp),%eax
  30958a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30958d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  309591:	74 5c                	je     3095ef <do_read+0xa8>
  309593:	68 00 3b 31 00       	push   $0x313b00
  309598:	ff 75 f4             	pushl  -0xc(%ebp)
  30959b:	6a 00                	push   $0x0
  30959d:	ff 75 08             	pushl  0x8(%ebp)
  3095a0:	e8 29 09 00 00       	call   309ece <zone_rw>
  3095a5:	83 c4 10             	add    $0x10,%esp
  3095a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3095ab:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%ebp)
  3095af:	75 1c                	jne    3095cd <do_read+0x86>
  3095b1:	83 ec 04             	sub    $0x4,%esp
  3095b4:	6a 1c                	push   $0x1c
  3095b6:	68 f0 e2 30 00       	push   $0x30e2f0
  3095bb:	68 f8 e2 30 00       	push   $0x30e2f8
  3095c0:	e8 8f c0 ff ff       	call   305654 <printk>
  3095c5:	83 c4 10             	add    $0x10,%esp
  3095c8:	e9 13 01 00 00       	jmp    3096e0 <do_read+0x199>
  3095cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3095d0:	8b 55 10             	mov    0x10(%ebp),%edx
  3095d3:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  3095d9:	81 c2 00 3b 31 00    	add    $0x313b00,%edx
  3095df:	83 ec 04             	sub    $0x4,%esp
  3095e2:	50                   	push   %eax
  3095e3:	52                   	push   %edx
  3095e4:	ff 75 0c             	pushl  0xc(%ebp)
  3095e7:	e8 3b ff ff ff       	call   309527 <memcpy>
  3095ec:	83 c4 10             	add    $0x10,%esp
  3095ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3095f2:	29 45 14             	sub    %eax,0x14(%ebp)
  3095f5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3095f9:	8b 45 14             	mov    0x14(%ebp),%eax
  3095fc:	c1 e8 0a             	shr    $0xa,%eax
  3095ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  309602:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  309609:	eb 6d                	jmp    309678 <do_read+0x131>
  30960b:	68 00 3b 31 00       	push   $0x313b00
  309610:	ff 75 f4             	pushl  -0xc(%ebp)
  309613:	6a 00                	push   $0x0
  309615:	ff 75 08             	pushl  0x8(%ebp)
  309618:	e8 b1 08 00 00       	call   309ece <zone_rw>
  30961d:	83 c4 10             	add    $0x10,%esp
  309620:	89 45 e0             	mov    %eax,-0x20(%ebp)
  309623:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
  309627:	75 1c                	jne    309645 <do_read+0xfe>
  309629:	83 ec 04             	sub    $0x4,%esp
  30962c:	6a 24                	push   $0x24
  30962e:	68 f0 e2 30 00       	push   $0x30e2f0
  309633:	68 f8 e2 30 00       	push   $0x30e2f8
  309638:	e8 17 c0 ff ff       	call   305654 <printk>
  30963d:	83 c4 10             	add    $0x10,%esp
  309640:	e9 9b 00 00 00       	jmp    3096e0 <do_read+0x199>
  309645:	8b 45 14             	mov    0x14(%ebp),%eax
  309648:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30964b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  30964e:	01 ca                	add    %ecx,%edx
  309650:	83 ec 04             	sub    $0x4,%esp
  309653:	50                   	push   %eax
  309654:	68 00 3b 31 00       	push   $0x313b00
  309659:	52                   	push   %edx
  30965a:	e8 c8 fe ff ff       	call   309527 <memcpy>
  30965f:	83 c4 10             	add    $0x10,%esp
  309662:	81 6d 14 00 04 00 00 	subl   $0x400,0x14(%ebp)
  309669:	81 45 f0 00 04 00 00 	addl   $0x400,-0x10(%ebp)
  309670:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  309674:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  309678:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30967b:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  30967e:	72 8b                	jb     30960b <do_read+0xc4>
  309680:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  309684:	74 5a                	je     3096e0 <do_read+0x199>
  309686:	68 00 3b 31 00       	push   $0x313b00
  30968b:	ff 75 f4             	pushl  -0xc(%ebp)
  30968e:	6a 00                	push   $0x0
  309690:	ff 75 08             	pushl  0x8(%ebp)
  309693:	e8 36 08 00 00       	call   309ece <zone_rw>
  309698:	83 c4 10             	add    $0x10,%esp
  30969b:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30969e:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%ebp)
  3096a2:	75 19                	jne    3096bd <do_read+0x176>
  3096a4:	83 ec 04             	sub    $0x4,%esp
  3096a7:	6a 2c                	push   $0x2c
  3096a9:	68 f0 e2 30 00       	push   $0x30e2f0
  3096ae:	68 f8 e2 30 00       	push   $0x30e2f8
  3096b3:	e8 9c bf ff ff       	call   305654 <printk>
  3096b8:	83 c4 10             	add    $0x10,%esp
  3096bb:	eb 23                	jmp    3096e0 <do_read+0x199>
  3096bd:	8b 45 14             	mov    0x14(%ebp),%eax
  3096c0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  3096c3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  3096c6:	01 ca                	add    %ecx,%edx
  3096c8:	83 ec 04             	sub    $0x4,%esp
  3096cb:	50                   	push   %eax
  3096cc:	68 00 3b 31 00       	push   $0x313b00
  3096d1:	52                   	push   %edx
  3096d2:	e8 50 fe ff ff       	call   309527 <memcpy>
  3096d7:	83 c4 10             	add    $0x10,%esp
  3096da:	8b 45 14             	mov    0x14(%ebp),%eax
  3096dd:	01 45 f0             	add    %eax,-0x10(%ebp)
  3096e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3096e3:	c9                   	leave  
  3096e4:	c3                   	ret    

003096e5 <fs_read>:
  3096e5:	55                   	push   %ebp
  3096e6:	89 e5                	mov    %esp,%ebp
  3096e8:	57                   	push   %edi
  3096e9:	56                   	push   %esi
  3096ea:	53                   	push   %ebx
  3096eb:	83 ec 1c             	sub    $0x1c,%esp
  3096ee:	8b 45 08             	mov    0x8(%ebp),%eax
  3096f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3096f4:	8b 45 08             	mov    0x8(%ebp),%eax
  3096f7:	8b 48 34             	mov    0x34(%eax),%ecx
  3096fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3096fd:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
  309703:	8b 45 08             	mov    0x8(%ebp),%eax
  309706:	8b 40 38             	mov    0x38(%eax),%eax
  309709:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
  30970c:	81 c3 c4 00 00 00    	add    $0xc4,%ebx
  309712:	51                   	push   %ecx
  309713:	52                   	push   %edx
  309714:	50                   	push   %eax
  309715:	53                   	push   %ebx
  309716:	e8 2c fe ff ff       	call   309547 <do_read>
  30971b:	83 c4 10             	add    $0x10,%esp
  30971e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  309721:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  309724:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
  30972a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30972d:	01 c2                	add    %eax,%edx
  30972f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  309732:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
  309738:	8b 45 08             	mov    0x8(%ebp),%eax
  30973b:	8b 58 3c             	mov    0x3c(%eax),%ebx
  30973e:	b8 02 00 00 00       	mov    $0x2,%eax
  309743:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  309746:	ba 00 00 00 00       	mov    $0x0,%edx
  30974b:	be 00 00 00 00       	mov    $0x0,%esi
  309750:	bf 00 00 00 00       	mov    $0x0,%edi
  309755:	cd 80                	int    $0x80
  309757:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30975a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30975d:	5b                   	pop    %ebx
  30975e:	5e                   	pop    %esi
  30975f:	5f                   	pop    %edi
  309760:	5d                   	pop    %ebp
  309761:	c3                   	ret    

00309762 <fs_write>:
  309762:	55                   	push   %ebp
  309763:	89 e5                	mov    %esp,%ebp
  309765:	57                   	push   %edi
  309766:	56                   	push   %esi
  309767:	53                   	push   %ebx
  309768:	83 ec 4c             	sub    $0x4c,%esp
  30976b:	8b 45 08             	mov    0x8(%ebp),%eax
  30976e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  309771:	8b 45 08             	mov    0x8(%ebp),%eax
  309774:	8b 40 38             	mov    0x38(%eax),%eax
  309777:	89 45 d0             	mov    %eax,-0x30(%ebp)
  30977a:	8b 45 08             	mov    0x8(%ebp),%eax
  30977d:	8b 40 34             	mov    0x34(%eax),%eax
  309780:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  309783:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  309786:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
  30978c:	c1 e8 0a             	shr    $0xa,%eax
  30978f:	89 45 dc             	mov    %eax,-0x24(%ebp)
  309792:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  309795:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
  30979b:	89 45 cc             	mov    %eax,-0x34(%ebp)
  30979e:	8b 55 cc             	mov    -0x34(%ebp),%edx
  3097a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3097a4:	01 c2                	add    %eax,%edx
  3097a6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  3097a9:	8b 80 cc 00 00 00    	mov    0xcc(%eax),%eax
  3097af:	39 c2                	cmp    %eax,%edx
  3097b1:	76 0f                	jbe    3097c2 <fs_write+0x60>
  3097b3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  3097b6:	8b 80 cc 00 00 00    	mov    0xcc(%eax),%eax
  3097bc:	2b 45 cc             	sub    -0x34(%ebp),%eax
  3097bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3097c2:	8b 45 cc             	mov    -0x34(%ebp),%eax
  3097c5:	25 ff 03 00 00       	and    $0x3ff,%eax
  3097ca:	89 c2                	mov    %eax,%edx
  3097cc:	b8 00 04 00 00       	mov    $0x400,%eax
  3097d1:	29 d0                	sub    %edx,%eax
  3097d3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3097d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3097d9:	39 45 e0             	cmp    %eax,-0x20(%ebp)
  3097dc:	0f 46 45 e0          	cmovbe -0x20(%ebp),%eax
  3097e0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3097e3:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  3097e7:	0f 84 a2 00 00 00    	je     30988f <fs_write+0x12d>
  3097ed:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  3097f0:	05 c4 00 00 00       	add    $0xc4,%eax
  3097f5:	68 00 37 31 00       	push   $0x313700
  3097fa:	ff 75 dc             	pushl  -0x24(%ebp)
  3097fd:	6a 00                	push   $0x0
  3097ff:	50                   	push   %eax
  309800:	e8 c9 06 00 00       	call   309ece <zone_rw>
  309805:	83 c4 10             	add    $0x10,%esp
  309808:	89 45 c8             	mov    %eax,-0x38(%ebp)
  30980b:	83 7d c8 ff          	cmpl   $0xffffffff,-0x38(%ebp)
  30980f:	75 1c                	jne    30982d <fs_write+0xcb>
  309811:	83 ec 04             	sub    $0x4,%esp
  309814:	6a 50                	push   $0x50
  309816:	68 f0 e2 30 00       	push   $0x30e2f0
  30981b:	68 2c e3 30 00       	push   $0x30e32c
  309820:	e8 2f be ff ff       	call   305654 <printk>
  309825:	83 c4 10             	add    $0x10,%esp
  309828:	e9 62 01 00 00       	jmp    30998f <fs_write+0x22d>
  30982d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  309830:	8b 55 cc             	mov    -0x34(%ebp),%edx
  309833:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  309839:	81 c2 00 37 31 00    	add    $0x313700,%edx
  30983f:	83 ec 04             	sub    $0x4,%esp
  309842:	50                   	push   %eax
  309843:	ff 75 d0             	pushl  -0x30(%ebp)
  309846:	52                   	push   %edx
  309847:	e8 db fc ff ff       	call   309527 <memcpy>
  30984c:	83 c4 10             	add    $0x10,%esp
  30984f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  309852:	05 c4 00 00 00       	add    $0xc4,%eax
  309857:	68 00 37 31 00       	push   $0x313700
  30985c:	ff 75 dc             	pushl  -0x24(%ebp)
  30985f:	6a 01                	push   $0x1
  309861:	50                   	push   %eax
  309862:	e8 67 06 00 00       	call   309ece <zone_rw>
  309867:	83 c4 10             	add    $0x10,%esp
  30986a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  30986d:	83 7d c4 ff          	cmpl   $0xffffffff,-0x3c(%ebp)
  309871:	75 1c                	jne    30988f <fs_write+0x12d>
  309873:	83 ec 04             	sub    $0x4,%esp
  309876:	6a 52                	push   $0x52
  309878:	68 f0 e2 30 00       	push   $0x30e2f0
  30987d:	68 68 e3 30 00       	push   $0x30e368
  309882:	e8 cd bd ff ff       	call   305654 <printk>
  309887:	83 c4 10             	add    $0x10,%esp
  30988a:	e9 00 01 00 00       	jmp    30998f <fs_write+0x22d>
  30988f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  309892:	29 45 e4             	sub    %eax,-0x1c(%ebp)
  309895:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
  309899:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30989c:	c1 e8 0a             	shr    $0xa,%eax
  30989f:	89 45 c0             	mov    %eax,-0x40(%ebp)
  3098a2:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  3098a9:	eb 74                	jmp    30991f <fs_write+0x1bd>
  3098ab:	8b 55 d0             	mov    -0x30(%ebp),%edx
  3098ae:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3098b1:	01 d0                	add    %edx,%eax
  3098b3:	83 ec 04             	sub    $0x4,%esp
  3098b6:	68 00 04 00 00       	push   $0x400
  3098bb:	50                   	push   %eax
  3098bc:	68 00 37 31 00       	push   $0x313700
  3098c1:	e8 61 fc ff ff       	call   309527 <memcpy>
  3098c6:	83 c4 10             	add    $0x10,%esp
  3098c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  3098cc:	05 c4 00 00 00       	add    $0xc4,%eax
  3098d1:	68 00 37 31 00       	push   $0x313700
  3098d6:	ff 75 dc             	pushl  -0x24(%ebp)
  3098d9:	6a 01                	push   $0x1
  3098db:	50                   	push   %eax
  3098dc:	e8 ed 05 00 00       	call   309ece <zone_rw>
  3098e1:	83 c4 10             	add    $0x10,%esp
  3098e4:	89 45 bc             	mov    %eax,-0x44(%ebp)
  3098e7:	83 7d bc ff          	cmpl   $0xffffffff,-0x44(%ebp)
  3098eb:	75 1c                	jne    309909 <fs_write+0x1a7>
  3098ed:	83 ec 04             	sub    $0x4,%esp
  3098f0:	6a 5a                	push   $0x5a
  3098f2:	68 f0 e2 30 00       	push   $0x30e2f0
  3098f7:	68 68 e3 30 00       	push   $0x30e368
  3098fc:	e8 53 bd ff ff       	call   305654 <printk>
  309901:	83 c4 10             	add    $0x10,%esp
  309904:	e9 86 00 00 00       	jmp    30998f <fs_write+0x22d>
  309909:	81 6d e4 00 04 00 00 	subl   $0x400,-0x1c(%ebp)
  309910:	81 45 e0 00 04 00 00 	addl   $0x400,-0x20(%ebp)
  309917:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
  30991b:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
  30991f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  309922:	3b 45 c0             	cmp    -0x40(%ebp),%eax
  309925:	72 84                	jb     3098ab <fs_write+0x149>
  309927:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  30992b:	74 62                	je     30998f <fs_write+0x22d>
  30992d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  309930:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  309933:	8b 55 e0             	mov    -0x20(%ebp),%edx
  309936:	01 ca                	add    %ecx,%edx
  309938:	83 ec 04             	sub    $0x4,%esp
  30993b:	50                   	push   %eax
  30993c:	52                   	push   %edx
  30993d:	68 00 37 31 00       	push   $0x313700
  309942:	e8 e0 fb ff ff       	call   309527 <memcpy>
  309947:	83 c4 10             	add    $0x10,%esp
  30994a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  30994d:	05 c4 00 00 00       	add    $0xc4,%eax
  309952:	68 00 37 31 00       	push   $0x313700
  309957:	ff 75 dc             	pushl  -0x24(%ebp)
  30995a:	6a 01                	push   $0x1
  30995c:	50                   	push   %eax
  30995d:	e8 6c 05 00 00       	call   309ece <zone_rw>
  309962:	83 c4 10             	add    $0x10,%esp
  309965:	89 45 b8             	mov    %eax,-0x48(%ebp)
  309968:	83 7d b8 ff          	cmpl   $0xffffffff,-0x48(%ebp)
  30996c:	75 19                	jne    309987 <fs_write+0x225>
  30996e:	83 ec 04             	sub    $0x4,%esp
  309971:	6a 62                	push   $0x62
  309973:	68 f0 e2 30 00       	push   $0x30e2f0
  309978:	68 68 e3 30 00       	push   $0x30e368
  30997d:	e8 d2 bc ff ff       	call   305654 <printk>
  309982:	83 c4 10             	add    $0x10,%esp
  309985:	eb 08                	jmp    30998f <fs_write+0x22d>
  309987:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30998a:	01 c0                	add    %eax,%eax
  30998c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30998f:	8b 45 08             	mov    0x8(%ebp),%eax
  309992:	8b 50 30             	mov    0x30(%eax),%edx
  309995:	8b 45 e0             	mov    -0x20(%ebp),%eax
  309998:	01 c2                	add    %eax,%edx
  30999a:	8b 45 08             	mov    0x8(%ebp),%eax
  30999d:	89 50 30             	mov    %edx,0x30(%eax)
  3099a0:	8b 45 08             	mov    0x8(%ebp),%eax
  3099a3:	8b 58 3c             	mov    0x3c(%eax),%ebx
  3099a6:	b8 02 00 00 00       	mov    $0x2,%eax
  3099ab:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  3099ae:	ba 00 00 00 00       	mov    $0x0,%edx
  3099b3:	be 00 00 00 00       	mov    $0x0,%esi
  3099b8:	bf 00 00 00 00       	mov    $0x0,%edi
  3099bd:	cd 80                	int    $0x80
  3099bf:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  3099c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3099c5:	5b                   	pop    %ebx
  3099c6:	5e                   	pop    %esi
  3099c7:	5f                   	pop    %edi
  3099c8:	5d                   	pop    %ebp
  3099c9:	c3                   	ret    

003099ca <fs_close>:
  3099ca:	55                   	push   %ebp
  3099cb:	89 e5                	mov    %esp,%ebp
  3099cd:	57                   	push   %edi
  3099ce:	56                   	push   %esi
  3099cf:	53                   	push   %ebx
  3099d0:	83 ec 10             	sub    $0x10,%esp
  3099d3:	8b 45 08             	mov    0x8(%ebp),%eax
  3099d6:	8b 58 3c             	mov    0x3c(%eax),%ebx
  3099d9:	b8 02 00 00 00       	mov    $0x2,%eax
  3099de:	b9 00 00 00 00       	mov    $0x0,%ecx
  3099e3:	ba 00 00 00 00       	mov    $0x0,%edx
  3099e8:	be 00 00 00 00       	mov    $0x0,%esi
  3099ed:	bf 00 00 00 00       	mov    $0x0,%edi
  3099f2:	cd 80                	int    $0x80
  3099f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3099f7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  3099fe:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  309a05:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  309a0c:	ff 75 ec             	pushl  -0x14(%ebp)
  309a0f:	ff 75 e8             	pushl  -0x18(%ebp)
  309a12:	ff 75 e4             	pushl  -0x1c(%ebp)
  309a15:	6a 03                	push   $0x3
  309a17:	6a 03                	push   $0x3
  309a19:	e8 be fa ff ff       	call   3094dc <_run>
  309a1e:	83 c4 14             	add    $0x14,%esp
  309a21:	8d 65 f4             	lea    -0xc(%ebp),%esp
  309a24:	5b                   	pop    %ebx
  309a25:	5e                   	pop    %esi
  309a26:	5f                   	pop    %edi
  309a27:	5d                   	pop    %ebp
  309a28:	c3                   	ret    

00309a29 <fs_seek>:
  309a29:	55                   	push   %ebp
  309a2a:	89 e5                	mov    %esp,%ebp
  309a2c:	57                   	push   %edi
  309a2d:	56                   	push   %esi
  309a2e:	53                   	push   %ebx
  309a2f:	83 ec 10             	sub    $0x10,%esp
  309a32:	a1 04 36 31 00       	mov    0x313604,%eax
  309a37:	89 45 f0             	mov    %eax,-0x10(%ebp)
  309a3a:	8b 45 08             	mov    0x8(%ebp),%eax
  309a3d:	8b 40 34             	mov    0x34(%eax),%eax
  309a40:	83 f8 01             	cmp    $0x1,%eax
  309a43:	74 1a                	je     309a5f <fs_seek+0x36>
  309a45:	83 f8 02             	cmp    $0x2,%eax
  309a48:	74 31                	je     309a7b <fs_seek+0x52>
  309a4a:	85 c0                	test   %eax,%eax
  309a4c:	75 48                	jne    309a96 <fs_seek+0x6d>
  309a4e:	8b 45 08             	mov    0x8(%ebp),%eax
  309a51:	8b 50 30             	mov    0x30(%eax),%edx
  309a54:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309a57:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
  309a5d:	eb 37                	jmp    309a96 <fs_seek+0x6d>
  309a5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309a62:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
  309a68:	8b 45 08             	mov    0x8(%ebp),%eax
  309a6b:	8b 40 30             	mov    0x30(%eax),%eax
  309a6e:	01 c2                	add    %eax,%edx
  309a70:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309a73:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
  309a79:	eb 1b                	jmp    309a96 <fs_seek+0x6d>
  309a7b:	8b 45 08             	mov    0x8(%ebp),%eax
  309a7e:	8b 50 30             	mov    0x30(%eax),%edx
  309a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309a84:	8b 80 cc 00 00 00    	mov    0xcc(%eax),%eax
  309a8a:	01 c2                	add    %eax,%edx
  309a8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309a8f:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
  309a95:	90                   	nop
  309a96:	8b 45 08             	mov    0x8(%ebp),%eax
  309a99:	8b 58 3c             	mov    0x3c(%eax),%ebx
  309a9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309a9f:	8b 88 20 01 00 00    	mov    0x120(%eax),%ecx
  309aa5:	b8 02 00 00 00       	mov    $0x2,%eax
  309aaa:	ba 00 00 00 00       	mov    $0x0,%edx
  309aaf:	be 00 00 00 00       	mov    $0x0,%esi
  309ab4:	bf 00 00 00 00       	mov    $0x0,%edi
  309ab9:	cd 80                	int    $0x80
  309abb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  309abe:	83 c4 10             	add    $0x10,%esp
  309ac1:	5b                   	pop    %ebx
  309ac2:	5e                   	pop    %esi
  309ac3:	5f                   	pop    %edi
  309ac4:	5d                   	pop    %ebp
  309ac5:	c3                   	ret    

00309ac6 <fs_open>:
  309ac6:	55                   	push   %ebp
  309ac7:	89 e5                	mov    %esp,%ebp
  309ac9:	57                   	push   %edi
  309aca:	56                   	push   %esi
  309acb:	53                   	push   %ebx
  309acc:	83 ec 3c             	sub    $0x3c,%esp
  309acf:	8b 45 08             	mov    0x8(%ebp),%eax
  309ad2:	8b 40 38             	mov    0x38(%eax),%eax
  309ad5:	83 ec 0c             	sub    $0xc,%esp
  309ad8:	50                   	push   %eax
  309ad9:	e8 3c 06 00 00       	call   30a11a <eat_path>
  309ade:	83 c4 10             	add    $0x10,%esp
  309ae1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  309ae4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  309ae8:	0f 84 40 01 00 00    	je     309c2e <fs_open+0x168>
  309aee:	e8 ae 30 00 00       	call   30cba1 <fork>
  309af3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  309af6:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  309afa:	0f 85 02 01 00 00    	jne    309c02 <fs_open+0x13c>
  309b00:	a1 04 36 31 00       	mov    0x313604,%eax
  309b05:	89 45 dc             	mov    %eax,-0x24(%ebp)
  309b08:	8b 45 08             	mov    0x8(%ebp),%eax
  309b0b:	8b 50 3c             	mov    0x3c(%eax),%edx
  309b0e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  309b11:	89 90 c0 00 00 00    	mov    %edx,0xc0(%eax)
  309b17:	8b 45 08             	mov    0x8(%ebp),%eax
  309b1a:	8b 40 38             	mov    0x38(%eax),%eax
  309b1d:	83 ec 0c             	sub    $0xc,%esp
  309b20:	50                   	push   %eax
  309b21:	e8 e3 f9 ff ff       	call   309509 <strlen>
  309b26:	83 c4 10             	add    $0x10,%esp
  309b29:	8d 48 01             	lea    0x1(%eax),%ecx
  309b2c:	8b 45 08             	mov    0x8(%ebp),%eax
  309b2f:	8b 40 38             	mov    0x38(%eax),%eax
  309b32:	8b 15 04 36 31 00    	mov    0x313604,%edx
  309b38:	83 c2 14             	add    $0x14,%edx
  309b3b:	83 ec 04             	sub    $0x4,%esp
  309b3e:	51                   	push   %ecx
  309b3f:	50                   	push   %eax
  309b40:	52                   	push   %edx
  309b41:	e8 e1 f9 ff ff       	call   309527 <memcpy>
  309b46:	83 c4 10             	add    $0x10,%esp
  309b49:	8b 45 dc             	mov    -0x24(%ebp),%eax
  309b4c:	05 c4 00 00 00       	add    $0xc4,%eax
  309b51:	83 ec 04             	sub    $0x4,%esp
  309b54:	6a 5c                	push   $0x5c
  309b56:	ff 75 e4             	pushl  -0x1c(%ebp)
  309b59:	50                   	push   %eax
  309b5a:	e8 c8 f9 ff ff       	call   309527 <memcpy>
  309b5f:	83 c4 10             	add    $0x10,%esp
  309b62:	8b 45 dc             	mov    -0x24(%ebp),%eax
  309b65:	c7 80 20 01 00 00 00 	movl   $0x0,0x120(%eax)
  309b6c:	00 00 00 
  309b6f:	b8 03 00 00 00       	mov    $0x3,%eax
  309b74:	bb 00 00 00 00       	mov    $0x0,%ebx
  309b79:	b9 e5 96 30 00       	mov    $0x3096e5,%ecx
  309b7e:	ba 00 00 00 00       	mov    $0x0,%edx
  309b83:	be 00 00 00 00       	mov    $0x0,%esi
  309b88:	bf 00 00 00 00       	mov    $0x0,%edi
  309b8d:	cd 80                	int    $0x80
  309b8f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  309b92:	b8 03 00 00 00       	mov    $0x3,%eax
  309b97:	bb 01 00 00 00       	mov    $0x1,%ebx
  309b9c:	b9 62 97 30 00       	mov    $0x309762,%ecx
  309ba1:	ba 00 00 00 00       	mov    $0x0,%edx
  309ba6:	be 00 00 00 00       	mov    $0x0,%esi
  309bab:	bf 00 00 00 00       	mov    $0x0,%edi
  309bb0:	cd 80                	int    $0x80
  309bb2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  309bb5:	b8 03 00 00 00       	mov    $0x3,%eax
  309bba:	bb 03 00 00 00       	mov    $0x3,%ebx
  309bbf:	b9 ca 99 30 00       	mov    $0x3099ca,%ecx
  309bc4:	ba 00 00 00 00       	mov    $0x0,%edx
  309bc9:	be 00 00 00 00       	mov    $0x0,%esi
  309bce:	bf 00 00 00 00       	mov    $0x0,%edi
  309bd3:	cd 80                	int    $0x80
  309bd5:	89 45 d0             	mov    %eax,-0x30(%ebp)
  309bd8:	b8 03 00 00 00       	mov    $0x3,%eax
  309bdd:	bb 0c 00 00 00       	mov    $0xc,%ebx
  309be2:	b9 29 9a 30 00       	mov    $0x309a29,%ecx
  309be7:	ba 00 00 00 00       	mov    $0x0,%edx
  309bec:	be 00 00 00 00       	mov    $0x0,%esi
  309bf1:	bf 00 00 00 00       	mov    $0x0,%edi
  309bf6:	cd 80                	int    $0x80
  309bf8:	89 45 cc             	mov    %eax,-0x34(%ebp)
  309bfb:	e8 d4 2f 00 00       	call   30cbd4 <dorun>
  309c00:	eb 2a                	jmp    309c2c <fs_open+0x166>
  309c02:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  309c06:	7e 24                	jle    309c2c <fs_open+0x166>
  309c08:	8b 45 08             	mov    0x8(%ebp),%eax
  309c0b:	8b 58 3c             	mov    0x3c(%eax),%ebx
  309c0e:	b8 02 00 00 00       	mov    $0x2,%eax
  309c13:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  309c16:	ba 00 00 00 00       	mov    $0x0,%edx
  309c1b:	be 00 00 00 00       	mov    $0x0,%esi
  309c20:	bf 00 00 00 00       	mov    $0x0,%edi
  309c25:	cd 80                	int    $0x80
  309c27:	89 45 c8             	mov    %eax,-0x38(%ebp)
  309c2a:	eb 26                	jmp    309c52 <fs_open+0x18c>
  309c2c:	eb 24                	jmp    309c52 <fs_open+0x18c>
  309c2e:	8b 45 08             	mov    0x8(%ebp),%eax
  309c31:	8b 58 3c             	mov    0x3c(%eax),%ebx
  309c34:	b8 02 00 00 00       	mov    $0x2,%eax
  309c39:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  309c3e:	ba 00 00 00 00       	mov    $0x0,%edx
  309c43:	be 00 00 00 00       	mov    $0x0,%esi
  309c48:	bf 00 00 00 00       	mov    $0x0,%edi
  309c4d:	cd 80                	int    $0x80
  309c4f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  309c52:	8d 65 f4             	lea    -0xc(%ebp),%esp
  309c55:	5b                   	pop    %ebx
  309c56:	5e                   	pop    %esi
  309c57:	5f                   	pop    %edi
  309c58:	5d                   	pop    %ebp
  309c59:	c3                   	ret    

00309c5a <fs_init>:
  309c5a:	55                   	push   %ebp
  309c5b:	89 e5                	mov    %esp,%ebp
  309c5d:	57                   	push   %edi
  309c5e:	56                   	push   %esi
  309c5f:	53                   	push   %ebx
  309c60:	83 ec 1c             	sub    $0x1c,%esp
  309c63:	b8 03 00 00 00       	mov    $0x3,%eax
  309c68:	bb 02 00 00 00       	mov    $0x2,%ebx
  309c6d:	b9 c6 9a 30 00       	mov    $0x309ac6,%ecx
  309c72:	ba 00 00 00 00       	mov    $0x0,%edx
  309c77:	be 00 00 00 00       	mov    $0x0,%esi
  309c7c:	bf 00 00 00 00       	mov    $0x0,%edi
  309c81:	cd 80                	int    $0x80
  309c83:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  309c86:	83 ec 0c             	sub    $0xc,%esp
  309c89:	6a 07                	push   $0x7
  309c8b:	e8 1c 05 00 00       	call   30a1ac <read_super>
  309c90:	83 c4 10             	add    $0x10,%esp
  309c93:	a3 80 5e 31 00       	mov    %eax,0x315e80
  309c98:	a1 80 5e 31 00       	mov    0x315e80,%eax
  309c9d:	85 c0                	test   %eax,%eax
  309c9f:	75 12                	jne    309cb3 <fs_init+0x59>
  309ca1:	83 ec 0c             	sub    $0xc,%esp
  309ca4:	68 a3 e3 30 00       	push   $0x30e3a3
  309ca9:	e8 8a b9 ff ff       	call   305638 <panic>
  309cae:	83 c4 10             	add    $0x10,%esp
  309cb1:	eb 27                	jmp    309cda <fs_init+0x80>
  309cb3:	83 ec 08             	sub    $0x8,%esp
  309cb6:	68 c0 5e 31 00       	push   $0x315ec0
  309cbb:	6a 01                	push   $0x1
  309cbd:	e8 52 05 00 00       	call   30a214 <get_inode>
  309cc2:	83 c4 10             	add    $0x10,%esp
  309cc5:	83 f8 ff             	cmp    $0xffffffff,%eax
  309cc8:	75 10                	jne    309cda <fs_init+0x80>
  309cca:	83 ec 0c             	sub    $0xc,%esp
  309ccd:	68 c0 e3 30 00       	push   $0x30e3c0
  309cd2:	e8 61 b9 ff ff       	call   305638 <panic>
  309cd7:	83 c4 10             	add    $0x10,%esp
  309cda:	8d 65 f4             	lea    -0xc(%ebp),%esp
  309cdd:	5b                   	pop    %ebx
  309cde:	5e                   	pop    %esi
  309cdf:	5f                   	pop    %edi
  309ce0:	5d                   	pop    %ebp
  309ce1:	c3                   	ret    

00309ce2 <fs_main>:
  309ce2:	55                   	push   %ebp
  309ce3:	89 e5                	mov    %esp,%ebp
  309ce5:	83 ec 08             	sub    $0x8,%esp
  309ce8:	e8 6d ff ff ff       	call   309c5a <fs_init>
  309ced:	e8 e2 2e 00 00       	call   30cbd4 <dorun>
  309cf2:	b8 00 00 00 00       	mov    $0x0,%eax
  309cf7:	c9                   	leave  
  309cf8:	c3                   	ret    
  309cf9:	66 90                	xchg   %ax,%ax
  309cfb:	90                   	nop

00309cfc <_run>:
  309cfc:	55                   	push   %ebp
  309cfd:	89 e5                	mov    %esp,%ebp
  309cff:	57                   	push   %edi
  309d00:	56                   	push   %esi
  309d01:	53                   	push   %ebx
  309d02:	83 ec 10             	sub    $0x10,%esp
  309d05:	8b 55 10             	mov    0x10(%ebp),%edx
  309d08:	8b 75 18             	mov    0x18(%ebp),%esi
  309d0b:	8b 7d 14             	mov    0x14(%ebp),%edi
  309d0e:	b8 00 00 00 00       	mov    $0x0,%eax
  309d13:	8b 5d 08             	mov    0x8(%ebp),%ebx
  309d16:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  309d19:	cd 80                	int    $0x80
  309d1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  309d1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  309d21:	83 c4 10             	add    $0x10,%esp
  309d24:	5b                   	pop    %ebx
  309d25:	5e                   	pop    %esi
  309d26:	5f                   	pop    %edi
  309d27:	5d                   	pop    %ebp
  309d28:	c3                   	ret    

00309d29 <block_rw>:
  309d29:	55                   	push   %ebp
  309d2a:	89 e5                	mov    %esp,%ebp
  309d2c:	83 ec 14             	sub    $0x14,%esp
  309d2f:	8b 45 08             	mov    0x8(%ebp),%eax
  309d32:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  309d36:	8b 45 14             	mov    0x14(%ebp),%eax
  309d39:	01 c0                	add    %eax,%eax
  309d3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309d3e:	8b 45 18             	mov    0x18(%ebp),%eax
  309d41:	01 c0                	add    %eax,%eax
  309d43:	89 45 f8             	mov    %eax,-0x8(%ebp)
  309d46:	8b 45 10             	mov    0x10(%ebp),%eax
  309d49:	89 45 fc             	mov    %eax,-0x4(%ebp)
  309d4c:	0f bf 45 ec          	movswl -0x14(%ebp),%eax
  309d50:	ff 75 fc             	pushl  -0x4(%ebp)
  309d53:	ff 75 f8             	pushl  -0x8(%ebp)
  309d56:	ff 75 f4             	pushl  -0xc(%ebp)
  309d59:	ff 75 0c             	pushl  0xc(%ebp)
  309d5c:	50                   	push   %eax
  309d5d:	e8 9a ff ff ff       	call   309cfc <_run>
  309d62:	83 c4 14             	add    $0x14,%esp
  309d65:	c9                   	leave  
  309d66:	c3                   	ret    

00309d67 <get_indir>:
  309d67:	55                   	push   %ebp
  309d68:	89 e5                	mov    %esp,%ebp
  309d6a:	8b 45 08             	mov    0x8(%ebp),%eax
  309d6d:	0f b7 40 40          	movzwl 0x40(%eax),%eax
  309d71:	98                   	cwtl   
  309d72:	6a 01                	push   $0x1
  309d74:	ff 75 0c             	pushl  0xc(%ebp)
  309d77:	68 40 3f 31 00       	push   $0x313f40
  309d7c:	6a 00                	push   $0x0
  309d7e:	50                   	push   %eax
  309d7f:	e8 a5 ff ff ff       	call   309d29 <block_rw>
  309d84:	83 c4 14             	add    $0x14,%esp
  309d87:	85 c0                	test   %eax,%eax
  309d89:	74 07                	je     309d92 <get_indir+0x2b>
  309d8b:	b8 00 00 00 00       	mov    $0x0,%eax
  309d90:	eb 0d                	jmp    309d9f <get_indir+0x38>
  309d92:	8b 45 10             	mov    0x10(%ebp),%eax
  309d95:	c1 e0 02             	shl    $0x2,%eax
  309d98:	05 40 3f 31 00       	add    $0x313f40,%eax
  309d9d:	8b 00                	mov    (%eax),%eax
  309d9f:	c9                   	leave  
  309da0:	c3                   	ret    

00309da1 <_get_zone>:
  309da1:	55                   	push   %ebp
  309da2:	89 e5                	mov    %esp,%ebp
  309da4:	83 ec 18             	sub    $0x18,%esp
  309da7:	8b 45 08             	mov    0x8(%ebp),%eax
  309daa:	8b 40 08             	mov    0x8(%eax),%eax
  309dad:	05 ff 03 00 00       	add    $0x3ff,%eax
  309db2:	c1 e8 0a             	shr    $0xa,%eax
  309db5:	3b 45 0c             	cmp    0xc(%ebp),%eax
  309db8:	73 0a                	jae    309dc4 <_get_zone+0x23>
  309dba:	b8 00 00 00 00       	mov    $0x0,%eax
  309dbf:	e9 08 01 00 00       	jmp    309ecc <_get_zone+0x12b>
  309dc4:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
  309dc8:	77 12                	ja     309ddc <_get_zone+0x3b>
  309dca:	8b 45 08             	mov    0x8(%ebp),%eax
  309dcd:	8b 55 0c             	mov    0xc(%ebp),%edx
  309dd0:	83 c2 04             	add    $0x4,%edx
  309dd3:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
  309dd7:	e9 f0 00 00 00       	jmp    309ecc <_get_zone+0x12b>
  309ddc:	83 6d 0c 07          	subl   $0x7,0xc(%ebp)
  309de0:	81 7d 0c ff 00 00 00 	cmpl   $0xff,0xc(%ebp)
  309de7:	77 1b                	ja     309e04 <_get_zone+0x63>
  309de9:	8b 55 0c             	mov    0xc(%ebp),%edx
  309dec:	8b 45 08             	mov    0x8(%ebp),%eax
  309def:	8b 40 34             	mov    0x34(%eax),%eax
  309df2:	52                   	push   %edx
  309df3:	50                   	push   %eax
  309df4:	ff 75 08             	pushl  0x8(%ebp)
  309df7:	e8 6b ff ff ff       	call   309d67 <get_indir>
  309dfc:	83 c4 0c             	add    $0xc,%esp
  309dff:	e9 c8 00 00 00       	jmp    309ecc <_get_zone+0x12b>
  309e04:	81 6d 0c 00 01 00 00 	subl   $0x100,0xc(%ebp)
  309e0b:	81 7d 0c ff ff 00 00 	cmpl   $0xffff,0xc(%ebp)
  309e12:	77 3b                	ja     309e4f <_get_zone+0xae>
  309e14:	8b 45 0c             	mov    0xc(%ebp),%eax
  309e17:	c1 e8 08             	shr    $0x8,%eax
  309e1a:	89 c2                	mov    %eax,%edx
  309e1c:	8b 45 08             	mov    0x8(%ebp),%eax
  309e1f:	8b 40 38             	mov    0x38(%eax),%eax
  309e22:	52                   	push   %edx
  309e23:	50                   	push   %eax
  309e24:	ff 75 08             	pushl  0x8(%ebp)
  309e27:	e8 3b ff ff ff       	call   309d67 <get_indir>
  309e2c:	83 c4 0c             	add    $0xc,%esp
  309e2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309e32:	8b 45 0c             	mov    0xc(%ebp),%eax
  309e35:	0f b6 c0             	movzbl %al,%eax
  309e38:	50                   	push   %eax
  309e39:	ff 75 f4             	pushl  -0xc(%ebp)
  309e3c:	ff 75 08             	pushl  0x8(%ebp)
  309e3f:	e8 23 ff ff ff       	call   309d67 <get_indir>
  309e44:	83 c4 0c             	add    $0xc,%esp
  309e47:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309e4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309e4d:	eb 7d                	jmp    309ecc <_get_zone+0x12b>
  309e4f:	81 6d 0c 00 00 01 00 	subl   $0x10000,0xc(%ebp)
  309e56:	81 7d 0c ff ff ff 00 	cmpl   $0xffffff,0xc(%ebp)
  309e5d:	77 56                	ja     309eb5 <_get_zone+0x114>
  309e5f:	8b 45 0c             	mov    0xc(%ebp),%eax
  309e62:	c1 e8 10             	shr    $0x10,%eax
  309e65:	89 c2                	mov    %eax,%edx
  309e67:	8b 45 08             	mov    0x8(%ebp),%eax
  309e6a:	8b 40 3c             	mov    0x3c(%eax),%eax
  309e6d:	52                   	push   %edx
  309e6e:	50                   	push   %eax
  309e6f:	ff 75 08             	pushl  0x8(%ebp)
  309e72:	e8 f0 fe ff ff       	call   309d67 <get_indir>
  309e77:	83 c4 0c             	add    $0xc,%esp
  309e7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309e7d:	8b 45 0c             	mov    0xc(%ebp),%eax
  309e80:	c1 e8 08             	shr    $0x8,%eax
  309e83:	0f b6 c0             	movzbl %al,%eax
  309e86:	50                   	push   %eax
  309e87:	ff 75 0c             	pushl  0xc(%ebp)
  309e8a:	ff 75 08             	pushl  0x8(%ebp)
  309e8d:	e8 d5 fe ff ff       	call   309d67 <get_indir>
  309e92:	83 c4 0c             	add    $0xc,%esp
  309e95:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309e98:	8b 45 0c             	mov    0xc(%ebp),%eax
  309e9b:	0f b6 c0             	movzbl %al,%eax
  309e9e:	50                   	push   %eax
  309e9f:	ff 75 0c             	pushl  0xc(%ebp)
  309ea2:	ff 75 08             	pushl  0x8(%ebp)
  309ea5:	e8 bd fe ff ff       	call   309d67 <get_indir>
  309eaa:	83 c4 0c             	add    $0xc,%esp
  309ead:	89 45 f4             	mov    %eax,-0xc(%ebp)
  309eb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  309eb3:	eb 17                	jmp    309ecc <_get_zone+0x12b>
  309eb5:	83 ec 08             	sub    $0x8,%esp
  309eb8:	6a 31                	push   $0x31
  309eba:	68 e0 e3 30 00       	push   $0x30e3e0
  309ebf:	e8 90 b7 ff ff       	call   305654 <printk>
  309ec4:	83 c4 10             	add    $0x10,%esp
  309ec7:	b8 00 00 00 00       	mov    $0x0,%eax
  309ecc:	c9                   	leave  
  309ecd:	c3                   	ret    

00309ece <zone_rw>:
  309ece:	55                   	push   %ebp
  309ecf:	89 e5                	mov    %esp,%ebp
  309ed1:	83 ec 18             	sub    $0x18,%esp
  309ed4:	8b 45 08             	mov    0x8(%ebp),%eax
  309ed7:	0f b7 40 40          	movzwl 0x40(%eax),%eax
  309edb:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  309edf:	83 ec 08             	sub    $0x8,%esp
  309ee2:	ff 75 10             	pushl  0x10(%ebp)
  309ee5:	ff 75 08             	pushl  0x8(%ebp)
  309ee8:	e8 b4 fe ff ff       	call   309da1 <_get_zone>
  309eed:	83 c4 10             	add    $0x10,%esp
  309ef0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  309ef3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  309ef7:	75 1a                	jne    309f13 <zone_rw+0x45>
  309ef9:	83 ec 08             	sub    $0x8,%esp
  309efc:	ff 75 10             	pushl  0x10(%ebp)
  309eff:	68 fc e3 30 00       	push   $0x30e3fc
  309f04:	e8 4b b7 ff ff       	call   305654 <printk>
  309f09:	83 c4 10             	add    $0x10,%esp
  309f0c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  309f11:	eb 1b                	jmp    309f2e <zone_rw+0x60>
  309f13:	0f bf 45 f6          	movswl -0xa(%ebp),%eax
  309f17:	83 ec 0c             	sub    $0xc,%esp
  309f1a:	6a 01                	push   $0x1
  309f1c:	ff 75 f0             	pushl  -0x10(%ebp)
  309f1f:	ff 75 14             	pushl  0x14(%ebp)
  309f22:	ff 75 0c             	pushl  0xc(%ebp)
  309f25:	50                   	push   %eax
  309f26:	e8 fe fd ff ff       	call   309d29 <block_rw>
  309f2b:	83 c4 20             	add    $0x20,%esp
  309f2e:	c9                   	leave  
  309f2f:	c3                   	ret    

00309f30 <strncmp>:
  309f30:	55                   	push   %ebp
  309f31:	89 e5                	mov    %esp,%ebp
  309f33:	57                   	push   %edi
  309f34:	56                   	push   %esi
  309f35:	8b 45 08             	mov    0x8(%ebp),%eax
  309f38:	8b 55 0c             	mov    0xc(%ebp),%edx
  309f3b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  309f3e:	89 c7                	mov    %eax,%edi
  309f40:	89 d6                	mov    %edx,%esi
  309f42:	fc                   	cld    
  309f43:	49                   	dec    %ecx
  309f44:	78 08                	js     309f4e <strncmp+0x1e>
  309f46:	ac                   	lods   %ds:(%esi),%al
  309f47:	ae                   	scas   %es:(%edi),%al
  309f48:	75 08                	jne    309f52 <strncmp+0x22>
  309f4a:	84 c0                	test   %al,%al
  309f4c:	75 f5                	jne    309f43 <strncmp+0x13>
  309f4e:	31 c0                	xor    %eax,%eax
  309f50:	eb 09                	jmp    309f5b <strncmp+0x2b>
  309f52:	b8 01 00 00 00       	mov    $0x1,%eax
  309f57:	7c 02                	jl     309f5b <strncmp+0x2b>
  309f59:	f7 d8                	neg    %eax
  309f5b:	5e                   	pop    %esi
  309f5c:	5f                   	pop    %edi
  309f5d:	5d                   	pop    %ebp
  309f5e:	c3                   	ret    

00309f5f <memcpy>:
  309f5f:	55                   	push   %ebp
  309f60:	89 e5                	mov    %esp,%ebp
  309f62:	57                   	push   %edi
  309f63:	56                   	push   %esi
  309f64:	53                   	push   %ebx
  309f65:	8b 45 10             	mov    0x10(%ebp),%eax
  309f68:	8b 55 0c             	mov    0xc(%ebp),%edx
  309f6b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  309f6e:	89 c1                	mov    %eax,%ecx
  309f70:	89 d6                	mov    %edx,%esi
  309f72:	89 df                	mov    %ebx,%edi
  309f74:	fc                   	cld    
  309f75:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  309f77:	8b 45 08             	mov    0x8(%ebp),%eax
  309f7a:	5b                   	pop    %ebx
  309f7b:	5e                   	pop    %esi
  309f7c:	5f                   	pop    %edi
  309f7d:	5d                   	pop    %ebp
  309f7e:	c3                   	ret    

00309f7f <memset>:
  309f7f:	55                   	push   %ebp
  309f80:	89 e5                	mov    %esp,%ebp
  309f82:	57                   	push   %edi
  309f83:	83 ec 04             	sub    $0x4,%esp
  309f86:	8b 45 0c             	mov    0xc(%ebp),%eax
  309f89:	88 45 f8             	mov    %al,-0x8(%ebp)
  309f8c:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  309f90:	8b 55 08             	mov    0x8(%ebp),%edx
  309f93:	8b 4d 10             	mov    0x10(%ebp),%ecx
  309f96:	89 d7                	mov    %edx,%edi
  309f98:	fc                   	cld    
  309f99:	f3 aa                	rep stos %al,%es:(%edi)
  309f9b:	8b 45 08             	mov    0x8(%ebp),%eax
  309f9e:	83 c4 04             	add    $0x4,%esp
  309fa1:	5f                   	pop    %edi
  309fa2:	5d                   	pop    %ebp
  309fa3:	c3                   	ret    

00309fa4 <_get_name>:
  309fa4:	55                   	push   %ebp
  309fa5:	89 e5                	mov    %esp,%ebp
  309fa7:	83 ec 10             	sub    $0x10,%esp
  309faa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  309fae:	75 07                	jne    309fb7 <_get_name+0x13>
  309fb0:	b8 00 00 00 00       	mov    $0x0,%eax
  309fb5:	eb 4a                	jmp    30a001 <_get_name+0x5d>
  309fb7:	8b 45 08             	mov    0x8(%ebp),%eax
  309fba:	0f b6 00             	movzbl (%eax),%eax
  309fbd:	3c 2f                	cmp    $0x2f,%al
  309fbf:	75 04                	jne    309fc5 <_get_name+0x21>
  309fc1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  309fc5:	8b 45 08             	mov    0x8(%ebp),%eax
  309fc8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  309fcb:	eb 04                	jmp    309fd1 <_get_name+0x2d>
  309fcd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  309fd1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  309fd4:	0f b6 00             	movzbl (%eax),%eax
  309fd7:	84 c0                	test   %al,%al
  309fd9:	74 0a                	je     309fe5 <_get_name+0x41>
  309fdb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  309fde:	0f b6 00             	movzbl (%eax),%eax
  309fe1:	3c 2f                	cmp    $0x2f,%al
  309fe3:	75 e8                	jne    309fcd <_get_name+0x29>
  309fe5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  309fe8:	8b 45 08             	mov    0x8(%ebp),%eax
  309feb:	29 c2                	sub    %eax,%edx
  309fed:	89 d0                	mov    %edx,%eax
  309fef:	50                   	push   %eax
  309ff0:	ff 75 08             	pushl  0x8(%ebp)
  309ff3:	ff 75 0c             	pushl  0xc(%ebp)
  309ff6:	e8 64 ff ff ff       	call   309f5f <memcpy>
  309ffb:	83 c4 0c             	add    $0xc,%esp
  309ffe:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30a001:	c9                   	leave  
  30a002:	c3                   	ret    

0030a003 <search_dir>:
  30a003:	55                   	push   %ebp
  30a004:	89 e5                	mov    %esp,%ebp
  30a006:	83 ec 28             	sub    $0x28,%esp
  30a009:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  30a00d:	75 0a                	jne    30a019 <search_dir+0x16>
  30a00f:	b8 00 00 00 00       	mov    $0x0,%eax
  30a014:	e9 ff 00 00 00       	jmp    30a118 <search_dir+0x115>
  30a019:	c7 45 ec 80 43 31 00 	movl   $0x314380,-0x14(%ebp)
  30a020:	83 ec 0c             	sub    $0xc,%esp
  30a023:	6a 5c                	push   $0x5c
  30a025:	e8 29 dc ff ff       	call   307c53 <kalloc>
  30a02a:	83 c4 10             	add    $0x10,%esp
  30a02d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30a030:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  30a034:	75 05                	jne    30a03b <search_dir+0x38>
  30a036:	e9 c2 00 00 00       	jmp    30a0fd <search_dir+0xfa>
  30a03b:	8b 45 08             	mov    0x8(%ebp),%eax
  30a03e:	8b 40 08             	mov    0x8(%eax),%eax
  30a041:	05 ff 03 00 00       	add    $0x3ff,%eax
  30a046:	c1 e8 0a             	shr    $0xa,%eax
  30a049:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30a04c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30a053:	e9 99 00 00 00       	jmp    30a0f1 <search_dir+0xee>
  30a058:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a05b:	68 80 43 31 00       	push   $0x314380
  30a060:	50                   	push   %eax
  30a061:	6a 00                	push   $0x0
  30a063:	ff 75 08             	pushl  0x8(%ebp)
  30a066:	e8 63 fe ff ff       	call   309ece <zone_rw>
  30a06b:	83 c4 10             	add    $0x10,%esp
  30a06e:	83 f8 ff             	cmp    $0xffffffff,%eax
  30a071:	75 12                	jne    30a085 <search_dir+0x82>
  30a073:	83 ec 0c             	sub    $0xc,%esp
  30a076:	68 24 e4 30 00       	push   $0x30e424
  30a07b:	e8 d4 b5 ff ff       	call   305654 <printk>
  30a080:	83 c4 10             	add    $0x10,%esp
  30a083:	eb 78                	jmp    30a0fd <search_dir+0xfa>
  30a085:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  30a08c:	eb 57                	jmp    30a0e5 <search_dir+0xe2>
  30a08e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30a091:	c1 e0 05             	shl    $0x5,%eax
  30a094:	89 c2                	mov    %eax,%edx
  30a096:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30a099:	01 d0                	add    %edx,%eax
  30a09b:	83 c0 02             	add    $0x2,%eax
  30a09e:	83 ec 04             	sub    $0x4,%esp
  30a0a1:	6a 1e                	push   $0x1e
  30a0a3:	50                   	push   %eax
  30a0a4:	ff 75 0c             	pushl  0xc(%ebp)
  30a0a7:	e8 84 fe ff ff       	call   309f30 <strncmp>
  30a0ac:	83 c4 10             	add    $0x10,%esp
  30a0af:	85 c0                	test   %eax,%eax
  30a0b1:	75 2e                	jne    30a0e1 <search_dir+0xde>
  30a0b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30a0b6:	c1 e0 05             	shl    $0x5,%eax
  30a0b9:	89 c2                	mov    %eax,%edx
  30a0bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30a0be:	01 d0                	add    %edx,%eax
  30a0c0:	0f b7 00             	movzwl (%eax),%eax
  30a0c3:	0f b7 c0             	movzwl %ax,%eax
  30a0c6:	83 ec 08             	sub    $0x8,%esp
  30a0c9:	ff 75 e8             	pushl  -0x18(%ebp)
  30a0cc:	50                   	push   %eax
  30a0cd:	e8 42 01 00 00       	call   30a214 <get_inode>
  30a0d2:	83 c4 10             	add    $0x10,%esp
  30a0d5:	83 f8 ff             	cmp    $0xffffffff,%eax
  30a0d8:	75 02                	jne    30a0dc <search_dir+0xd9>
  30a0da:	eb 21                	jmp    30a0fd <search_dir+0xfa>
  30a0dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  30a0df:	eb 37                	jmp    30a118 <search_dir+0x115>
  30a0e1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  30a0e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30a0e8:	83 f8 1f             	cmp    $0x1f,%eax
  30a0eb:	76 a1                	jbe    30a08e <search_dir+0x8b>
  30a0ed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  30a0f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a0f4:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  30a0f7:	0f 82 5b ff ff ff    	jb     30a058 <search_dir+0x55>
  30a0fd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  30a101:	74 10                	je     30a113 <search_dir+0x110>
  30a103:	83 ec 08             	sub    $0x8,%esp
  30a106:	6a 00                	push   $0x0
  30a108:	ff 75 e8             	pushl  -0x18(%ebp)
  30a10b:	e8 af dc ff ff       	call   307dbf <kfree_s>
  30a110:	83 c4 10             	add    $0x10,%esp
  30a113:	b8 00 00 00 00       	mov    $0x0,%eax
  30a118:	c9                   	leave  
  30a119:	c3                   	ret    

0030a11a <eat_path>:
  30a11a:	55                   	push   %ebp
  30a11b:	89 e5                	mov    %esp,%ebp
  30a11d:	83 ec 38             	sub    $0x38,%esp
  30a120:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  30a124:	74 0a                	je     30a130 <eat_path+0x16>
  30a126:	8b 45 08             	mov    0x8(%ebp),%eax
  30a129:	0f b6 00             	movzbl (%eax),%eax
  30a12c:	84 c0                	test   %al,%al
  30a12e:	75 07                	jne    30a137 <eat_path+0x1d>
  30a130:	b8 00 00 00 00       	mov    $0x0,%eax
  30a135:	eb 70                	jmp    30a1a7 <eat_path+0x8d>
  30a137:	8b 45 08             	mov    0x8(%ebp),%eax
  30a13a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30a13d:	c7 45 f0 c0 5e 31 00 	movl   $0x315ec0,-0x10(%ebp)
  30a144:	eb 37                	jmp    30a17d <eat_path+0x63>
  30a146:	6a 1e                	push   $0x1e
  30a148:	6a 00                	push   $0x0
  30a14a:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  30a14d:	50                   	push   %eax
  30a14e:	e8 2c fe ff ff       	call   309f7f <memset>
  30a153:	83 c4 0c             	add    $0xc,%esp
  30a156:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  30a159:	50                   	push   %eax
  30a15a:	ff 75 f4             	pushl  -0xc(%ebp)
  30a15d:	e8 42 fe ff ff       	call   309fa4 <_get_name>
  30a162:	83 c4 08             	add    $0x8,%esp
  30a165:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30a168:	83 ec 08             	sub    $0x8,%esp
  30a16b:	8d 45 d2             	lea    -0x2e(%ebp),%eax
  30a16e:	50                   	push   %eax
  30a16f:	ff 75 f0             	pushl  -0x10(%ebp)
  30a172:	e8 8c fe ff ff       	call   30a003 <search_dir>
  30a177:	83 c4 10             	add    $0x10,%esp
  30a17a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30a17d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a180:	0f b6 00             	movzbl (%eax),%eax
  30a183:	84 c0                	test   %al,%al
  30a185:	74 1d                	je     30a1a4 <eat_path+0x8a>
  30a187:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  30a18b:	74 17                	je     30a1a4 <eat_path+0x8a>
  30a18d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a190:	0f b6 00             	movzbl (%eax),%eax
  30a193:	3c 2f                	cmp    $0x2f,%al
  30a195:	75 af                	jne    30a146 <eat_path+0x2c>
  30a197:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a19a:	83 c0 01             	add    $0x1,%eax
  30a19d:	0f b6 00             	movzbl (%eax),%eax
  30a1a0:	84 c0                	test   %al,%al
  30a1a2:	75 a2                	jne    30a146 <eat_path+0x2c>
  30a1a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30a1a7:	c9                   	leave  
  30a1a8:	c3                   	ret    
  30a1a9:	66 90                	xchg   %ax,%ax
  30a1ab:	90                   	nop

0030a1ac <read_super>:
  30a1ac:	55                   	push   %ebp
  30a1ad:	89 e5                	mov    %esp,%ebp
  30a1af:	83 ec 18             	sub    $0x18,%esp
  30a1b2:	8b 45 08             	mov    0x8(%ebp),%eax
  30a1b5:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  30a1b9:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
  30a1bd:	83 ec 0c             	sub    $0xc,%esp
  30a1c0:	6a 01                	push   $0x1
  30a1c2:	6a 01                	push   $0x1
  30a1c4:	68 c0 47 31 00       	push   $0x3147c0
  30a1c9:	6a 00                	push   $0x0
  30a1cb:	50                   	push   %eax
  30a1cc:	e8 58 fb ff ff       	call   309d29 <block_rw>
  30a1d1:	83 c4 20             	add    $0x20,%esp
  30a1d4:	85 c0                	test   %eax,%eax
  30a1d6:	74 07                	je     30a1df <read_super+0x33>
  30a1d8:	b8 00 00 00 00       	mov    $0x0,%eax
  30a1dd:	eb 12                	jmp    30a1f1 <read_super+0x45>
  30a1df:	b8 c0 47 31 00       	mov    $0x3147c0,%eax
  30a1e4:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  30a1e8:	66 89 50 24          	mov    %dx,0x24(%eax)
  30a1ec:	b8 c0 47 31 00       	mov    $0x3147c0,%eax
  30a1f1:	c9                   	leave  
  30a1f2:	c3                   	ret    
  30a1f3:	90                   	nop

0030a1f4 <memcpy>:
  30a1f4:	55                   	push   %ebp
  30a1f5:	89 e5                	mov    %esp,%ebp
  30a1f7:	57                   	push   %edi
  30a1f8:	56                   	push   %esi
  30a1f9:	53                   	push   %ebx
  30a1fa:	8b 45 10             	mov    0x10(%ebp),%eax
  30a1fd:	8b 55 0c             	mov    0xc(%ebp),%edx
  30a200:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30a203:	89 c1                	mov    %eax,%ecx
  30a205:	89 d6                	mov    %edx,%esi
  30a207:	89 df                	mov    %ebx,%edi
  30a209:	fc                   	cld    
  30a20a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  30a20c:	8b 45 08             	mov    0x8(%ebp),%eax
  30a20f:	5b                   	pop    %ebx
  30a210:	5e                   	pop    %esi
  30a211:	5f                   	pop    %edi
  30a212:	5d                   	pop    %ebp
  30a213:	c3                   	ret    

0030a214 <get_inode>:
  30a214:	55                   	push   %ebp
  30a215:	89 e5                	mov    %esp,%ebp
  30a217:	83 ec 18             	sub    $0x18,%esp
  30a21a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  30a21e:	75 0a                	jne    30a22a <get_inode+0x16>
  30a220:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  30a225:	e9 ac 00 00 00       	jmp    30a2d6 <get_inode+0xc2>
  30a22a:	8b 45 08             	mov    0x8(%ebp),%eax
  30a22d:	83 e8 01             	sub    $0x1,%eax
  30a230:	c1 e8 04             	shr    $0x4,%eax
  30a233:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30a236:	8b 45 08             	mov    0x8(%ebp),%eax
  30a239:	83 e8 01             	sub    $0x1,%eax
  30a23c:	83 e0 0f             	and    $0xf,%eax
  30a23f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30a242:	a1 80 5e 31 00       	mov    0x315e80,%eax
  30a247:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  30a24b:	98                   	cwtl   
  30a24c:	8d 50 02             	lea    0x2(%eax),%edx
  30a24f:	a1 80 5e 31 00       	mov    0x315e80,%eax
  30a254:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  30a258:	98                   	cwtl   
  30a259:	01 c2                	add    %eax,%edx
  30a25b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a25e:	01 d0                	add    %edx,%eax
  30a260:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30a263:	a1 80 5e 31 00       	mov    0x315e80,%eax
  30a268:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  30a26c:	98                   	cwtl   
  30a26d:	83 ec 0c             	sub    $0xc,%esp
  30a270:	6a 01                	push   $0x1
  30a272:	ff 75 ec             	pushl  -0x14(%ebp)
  30a275:	68 00 4c 31 00       	push   $0x314c00
  30a27a:	6a 00                	push   $0x0
  30a27c:	50                   	push   %eax
  30a27d:	e8 a7 fa ff ff       	call   309d29 <block_rw>
  30a282:	83 c4 20             	add    $0x20,%esp
  30a285:	85 c0                	test   %eax,%eax
  30a287:	74 10                	je     30a299 <get_inode+0x85>
  30a289:	83 ec 0c             	sub    $0xc,%esp
  30a28c:	68 44 e4 30 00       	push   $0x30e444
  30a291:	e8 a2 b3 ff ff       	call   305638 <panic>
  30a296:	83 c4 10             	add    $0x10,%esp
  30a299:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30a29c:	c1 e0 06             	shl    $0x6,%eax
  30a29f:	05 00 4c 31 00       	add    $0x314c00,%eax
  30a2a4:	83 ec 04             	sub    $0x4,%esp
  30a2a7:	6a 40                	push   $0x40
  30a2a9:	50                   	push   %eax
  30a2aa:	ff 75 0c             	pushl  0xc(%ebp)
  30a2ad:	e8 42 ff ff ff       	call   30a1f4 <memcpy>
  30a2b2:	83 c4 10             	add    $0x10,%esp
  30a2b5:	8b 15 80 5e 31 00    	mov    0x315e80,%edx
  30a2bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a2be:	89 50 50             	mov    %edx,0x50(%eax)
  30a2c1:	a1 80 5e 31 00       	mov    0x315e80,%eax
  30a2c6:	0f b7 50 24          	movzwl 0x24(%eax),%edx
  30a2ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a2cd:	66 89 50 40          	mov    %dx,0x40(%eax)
  30a2d1:	b8 00 00 00 00       	mov    $0x0,%eax
  30a2d6:	c9                   	leave  
  30a2d7:	c3                   	ret    

0030a2d8 <NICtoPC>:
  30a2d8:	55                   	push   %ebp
  30a2d9:	89 e5                	mov    %esp,%ebp
  30a2db:	57                   	push   %edi
  30a2dc:	53                   	push   %ebx
  30a2dd:	83 ec 14             	sub    $0x14,%esp
  30a2e0:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a2e3:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
  30a2e7:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  30a2eb:	8b 45 10             	mov    0x10(%ebp),%eax
  30a2ee:	25 fe 00 00 00       	and    $0xfe,%eax
  30a2f3:	ba 0a 03 00 00       	mov    $0x30a,%edx
  30a2f8:	ee                   	out    %al,(%dx)
  30a2f9:	8b 45 10             	mov    0x10(%ebp),%eax
  30a2fc:	c1 f8 08             	sar    $0x8,%eax
  30a2ff:	0f b6 c0             	movzbl %al,%eax
  30a302:	ba 0b 03 00 00       	mov    $0x30b,%edx
  30a307:	ee                   	out    %al,(%dx)
  30a308:	d1 7d 10             	sarl   0x10(%ebp)
  30a30b:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  30a30f:	0f b6 c0             	movzbl %al,%eax
  30a312:	ba 08 03 00 00       	mov    $0x308,%edx
  30a317:	ee                   	out    %al,(%dx)
  30a318:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  30a31c:	66 c1 e8 08          	shr    $0x8,%ax
  30a320:	0f b7 c0             	movzwl %ax,%eax
  30a323:	0f b6 c0             	movzbl %al,%eax
  30a326:	ba 09 03 00 00       	mov    $0x309,%edx
  30a32b:	ee                   	out    %al,(%dx)
  30a32c:	b8 0a 00 00 00       	mov    $0xa,%eax
  30a331:	ba 00 03 00 00       	mov    $0x300,%edx
  30a336:	ee                   	out    %al,(%dx)
  30a337:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30a33a:	8b 4d 10             	mov    0x10(%ebp),%ecx
  30a33d:	ba 10 03 00 00       	mov    $0x310,%edx
  30a342:	89 df                	mov    %ebx,%edi
  30a344:	66 ed                	in     (%dx),%ax
  30a346:	66 ab                	stos   %ax,%es:(%edi)
  30a348:	e2 fa                	loop   30a344 <NICtoPC+0x6c>
  30a34a:	90                   	nop
  30a34b:	b8 07 03 00 00       	mov    $0x307,%eax
  30a350:	89 c2                	mov    %eax,%edx
  30a352:	ec                   	in     (%dx),%al
  30a353:	88 45 f7             	mov    %al,-0x9(%ebp)
  30a356:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30a35a:	83 e0 40             	and    $0x40,%eax
  30a35d:	84 c0                	test   %al,%al
  30a35f:	74 ea                	je     30a34b <NICtoPC+0x73>
  30a361:	b8 40 00 00 00       	mov    $0x40,%eax
  30a366:	ba 07 03 00 00       	mov    $0x307,%edx
  30a36b:	ee                   	out    %al,(%dx)
  30a36c:	83 c4 14             	add    $0x14,%esp
  30a36f:	5b                   	pop    %ebx
  30a370:	5f                   	pop    %edi
  30a371:	5d                   	pop    %ebp
  30a372:	c3                   	ret    

0030a373 <PCtoNIC>:
  30a373:	55                   	push   %ebp
  30a374:	89 e5                	mov    %esp,%ebp
  30a376:	56                   	push   %esi
  30a377:	53                   	push   %ebx
  30a378:	83 ec 14             	sub    $0x14,%esp
  30a37b:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a37e:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
  30a382:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  30a386:	8b 45 10             	mov    0x10(%ebp),%eax
  30a389:	25 fe 00 00 00       	and    $0xfe,%eax
  30a38e:	ba 0a 03 00 00       	mov    $0x30a,%edx
  30a393:	ee                   	out    %al,(%dx)
  30a394:	8b 45 10             	mov    0x10(%ebp),%eax
  30a397:	c1 f8 08             	sar    $0x8,%eax
  30a39a:	0f b6 c0             	movzbl %al,%eax
  30a39d:	ba 0b 03 00 00       	mov    $0x30b,%edx
  30a3a2:	ee                   	out    %al,(%dx)
  30a3a3:	d1 7d 10             	sarl   0x10(%ebp)
  30a3a6:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  30a3aa:	0f b6 c0             	movzbl %al,%eax
  30a3ad:	ba 08 03 00 00       	mov    $0x308,%edx
  30a3b2:	ee                   	out    %al,(%dx)
  30a3b3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  30a3b7:	66 c1 e8 08          	shr    $0x8,%ax
  30a3bb:	0f b7 c0             	movzwl %ax,%eax
  30a3be:	0f b6 c0             	movzbl %al,%eax
  30a3c1:	ba 09 03 00 00       	mov    $0x309,%edx
  30a3c6:	ee                   	out    %al,(%dx)
  30a3c7:	b8 12 00 00 00       	mov    $0x12,%eax
  30a3cc:	ba 00 03 00 00       	mov    $0x300,%edx
  30a3d1:	ee                   	out    %al,(%dx)
  30a3d2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30a3d5:	8b 4d 10             	mov    0x10(%ebp),%ecx
  30a3d8:	ba 10 03 00 00       	mov    $0x310,%edx
  30a3dd:	89 de                	mov    %ebx,%esi
  30a3df:	66 ad                	lods   %ds:(%esi),%ax
  30a3e1:	66 ef                	out    %ax,(%dx)
  30a3e3:	e2 fa                	loop   30a3df <PCtoNIC+0x6c>
  30a3e5:	90                   	nop
  30a3e6:	b8 07 03 00 00       	mov    $0x307,%eax
  30a3eb:	89 c2                	mov    %eax,%edx
  30a3ed:	ec                   	in     (%dx),%al
  30a3ee:	88 45 f7             	mov    %al,-0x9(%ebp)
  30a3f1:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30a3f5:	83 e0 40             	and    $0x40,%eax
  30a3f8:	84 c0                	test   %al,%al
  30a3fa:	74 ea                	je     30a3e6 <PCtoNIC+0x73>
  30a3fc:	b8 40 00 00 00       	mov    $0x40,%eax
  30a401:	ba 07 03 00 00       	mov    $0x307,%edx
  30a406:	ee                   	out    %al,(%dx)
  30a407:	83 c4 14             	add    $0x14,%esp
  30a40a:	5b                   	pop    %ebx
  30a40b:	5e                   	pop    %esi
  30a40c:	5d                   	pop    %ebp
  30a40d:	c3                   	ret    

0030a40e <ne2kInit>:
  30a40e:	55                   	push   %ebp
  30a40f:	89 e5                	mov    %esp,%ebp
  30a411:	b8 21 00 00 00       	mov    $0x21,%eax
  30a416:	ba 00 03 00 00       	mov    $0x300,%edx
  30a41b:	ee                   	out    %al,(%dx)
  30a41c:	b8 9b 00 00 00       	mov    $0x9b,%eax
  30a421:	ba 0e 03 00 00       	mov    $0x30e,%edx
  30a426:	ee                   	out    %al,(%dx)
  30a427:	b8 00 00 00 00       	mov    $0x0,%eax
  30a42c:	ba 0a 03 00 00       	mov    $0x30a,%edx
  30a431:	ee                   	out    %al,(%dx)
  30a432:	b8 00 00 00 00       	mov    $0x0,%eax
  30a437:	ba 0b 03 00 00       	mov    $0x30b,%edx
  30a43c:	ee                   	out    %al,(%dx)
  30a43d:	b8 03 00 00 00       	mov    $0x3,%eax
  30a442:	ba 0c 03 00 00       	mov    $0x30c,%edx
  30a447:	ee                   	out    %al,(%dx)
  30a448:	b8 40 00 00 00       	mov    $0x40,%eax
  30a44d:	ba 04 03 00 00       	mov    $0x304,%edx
  30a452:	ee                   	out    %al,(%dx)
  30a453:	b8 e0 00 00 00       	mov    $0xe0,%eax
  30a458:	ba 0d 03 00 00       	mov    $0x30d,%edx
  30a45d:	ee                   	out    %al,(%dx)
  30a45e:	b8 46 00 00 00       	mov    $0x46,%eax
  30a463:	ba 01 03 00 00       	mov    $0x301,%edx
  30a468:	ee                   	out    %al,(%dx)
  30a469:	b8 7f 00 00 00       	mov    $0x7f,%eax
  30a46e:	ba 02 03 00 00       	mov    $0x302,%edx
  30a473:	ee                   	out    %al,(%dx)
  30a474:	b8 46 00 00 00       	mov    $0x46,%eax
  30a479:	ba 03 03 00 00       	mov    $0x303,%edx
  30a47e:	ee                   	out    %al,(%dx)
  30a47f:	b8 61 00 00 00       	mov    $0x61,%eax
  30a484:	ba 00 03 00 00       	mov    $0x300,%edx
  30a489:	ee                   	out    %al,(%dx)
  30a48a:	b8 47 00 00 00       	mov    $0x47,%eax
  30a48f:	ba 07 03 00 00       	mov    $0x307,%edx
  30a494:	ee                   	out    %al,(%dx)
  30a495:	b8 22 00 00 00       	mov    $0x22,%eax
  30a49a:	ba 00 03 00 00       	mov    $0x300,%edx
  30a49f:	ee                   	out    %al,(%dx)
  30a4a0:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a4a5:	ba 07 03 00 00       	mov    $0x307,%edx
  30a4aa:	ee                   	out    %al,(%dx)
  30a4ab:	0f b6 05 50 31 31 00 	movzbl 0x313150,%eax
  30a4b2:	ba 0f 03 00 00       	mov    $0x30f,%edx
  30a4b7:	ee                   	out    %al,(%dx)
  30a4b8:	b8 22 00 00 00       	mov    $0x22,%eax
  30a4bd:	ba 00 03 00 00       	mov    $0x300,%edx
  30a4c2:	ee                   	out    %al,(%dx)
  30a4c3:	6a 0c                	push   $0xc
  30a4c5:	6a 00                	push   $0x0
  30a4c7:	ff 75 08             	pushl  0x8(%ebp)
  30a4ca:	e8 09 fe ff ff       	call   30a2d8 <NICtoPC>
  30a4cf:	83 c4 0c             	add    $0xc,%esp
  30a4d2:	8b 45 08             	mov    0x8(%ebp),%eax
  30a4d5:	8d 50 01             	lea    0x1(%eax),%edx
  30a4d8:	8b 45 08             	mov    0x8(%ebp),%eax
  30a4db:	0f b6 40 02          	movzbl 0x2(%eax),%eax
  30a4df:	88 02                	mov    %al,(%edx)
  30a4e1:	8b 45 08             	mov    0x8(%ebp),%eax
  30a4e4:	8d 50 02             	lea    0x2(%eax),%edx
  30a4e7:	8b 45 08             	mov    0x8(%ebp),%eax
  30a4ea:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  30a4ee:	88 02                	mov    %al,(%edx)
  30a4f0:	8b 45 08             	mov    0x8(%ebp),%eax
  30a4f3:	8d 50 03             	lea    0x3(%eax),%edx
  30a4f6:	8b 45 08             	mov    0x8(%ebp),%eax
  30a4f9:	0f b6 40 06          	movzbl 0x6(%eax),%eax
  30a4fd:	88 02                	mov    %al,(%edx)
  30a4ff:	8b 45 08             	mov    0x8(%ebp),%eax
  30a502:	8d 50 04             	lea    0x4(%eax),%edx
  30a505:	8b 45 08             	mov    0x8(%ebp),%eax
  30a508:	0f b6 40 08          	movzbl 0x8(%eax),%eax
  30a50c:	88 02                	mov    %al,(%edx)
  30a50e:	8b 45 08             	mov    0x8(%ebp),%eax
  30a511:	8d 50 05             	lea    0x5(%eax),%edx
  30a514:	8b 45 08             	mov    0x8(%ebp),%eax
  30a517:	0f b6 40 0a          	movzbl 0xa(%eax),%eax
  30a51b:	88 02                	mov    %al,(%edx)
  30a51d:	b8 61 00 00 00       	mov    $0x61,%eax
  30a522:	ba 00 03 00 00       	mov    $0x300,%edx
  30a527:	ee                   	out    %al,(%dx)
  30a528:	8b 45 08             	mov    0x8(%ebp),%eax
  30a52b:	8b 00                	mov    (%eax),%eax
  30a52d:	0f b6 c0             	movzbl %al,%eax
  30a530:	ba 01 03 00 00       	mov    $0x301,%edx
  30a535:	ee                   	out    %al,(%dx)
  30a536:	8b 45 08             	mov    0x8(%ebp),%eax
  30a539:	8b 00                	mov    (%eax),%eax
  30a53b:	c1 e8 08             	shr    $0x8,%eax
  30a53e:	0f b6 c0             	movzbl %al,%eax
  30a541:	ba 02 03 00 00       	mov    $0x302,%edx
  30a546:	ee                   	out    %al,(%dx)
  30a547:	8b 45 08             	mov    0x8(%ebp),%eax
  30a54a:	8b 00                	mov    (%eax),%eax
  30a54c:	c1 e8 10             	shr    $0x10,%eax
  30a54f:	0f b6 c0             	movzbl %al,%eax
  30a552:	ba 03 03 00 00       	mov    $0x303,%edx
  30a557:	ee                   	out    %al,(%dx)
  30a558:	8b 45 08             	mov    0x8(%ebp),%eax
  30a55b:	8b 00                	mov    (%eax),%eax
  30a55d:	c1 e8 18             	shr    $0x18,%eax
  30a560:	ba 04 03 00 00       	mov    $0x304,%edx
  30a565:	ee                   	out    %al,(%dx)
  30a566:	8b 45 08             	mov    0x8(%ebp),%eax
  30a569:	83 c0 04             	add    $0x4,%eax
  30a56c:	8b 00                	mov    (%eax),%eax
  30a56e:	0f b6 c0             	movzbl %al,%eax
  30a571:	ba 05 03 00 00       	mov    $0x305,%edx
  30a576:	ee                   	out    %al,(%dx)
  30a577:	8b 45 08             	mov    0x8(%ebp),%eax
  30a57a:	83 c0 04             	add    $0x4,%eax
  30a57d:	8b 00                	mov    (%eax),%eax
  30a57f:	c1 e8 08             	shr    $0x8,%eax
  30a582:	0f b6 c0             	movzbl %al,%eax
  30a585:	ba 06 03 00 00       	mov    $0x306,%edx
  30a58a:	ee                   	out    %al,(%dx)
  30a58b:	b8 22 00 00 00       	mov    $0x22,%eax
  30a590:	ba 00 03 00 00       	mov    $0x300,%edx
  30a595:	ee                   	out    %al,(%dx)
  30a596:	b8 61 00 00 00       	mov    $0x61,%eax
  30a59b:	ba 00 03 00 00       	mov    $0x300,%edx
  30a5a0:	ee                   	out    %al,(%dx)
  30a5a1:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a5a6:	ba 08 03 00 00       	mov    $0x308,%edx
  30a5ab:	ee                   	out    %al,(%dx)
  30a5ac:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a5b1:	ba 09 03 00 00       	mov    $0x309,%edx
  30a5b6:	ee                   	out    %al,(%dx)
  30a5b7:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a5bc:	ba 0a 03 00 00       	mov    $0x30a,%edx
  30a5c1:	ee                   	out    %al,(%dx)
  30a5c2:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a5c7:	ba 0b 03 00 00       	mov    $0x30b,%edx
  30a5cc:	ee                   	out    %al,(%dx)
  30a5cd:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a5d2:	ba 0c 03 00 00       	mov    $0x30c,%edx
  30a5d7:	ee                   	out    %al,(%dx)
  30a5d8:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a5dd:	ba 0d 03 00 00       	mov    $0x30d,%edx
  30a5e2:	ee                   	out    %al,(%dx)
  30a5e3:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a5e8:	ba 0e 03 00 00       	mov    $0x30e,%edx
  30a5ed:	ee                   	out    %al,(%dx)
  30a5ee:	b8 ff 00 00 00       	mov    $0xff,%eax
  30a5f3:	ba 0f 03 00 00       	mov    $0x30f,%edx
  30a5f8:	ee                   	out    %al,(%dx)
  30a5f9:	b8 22 00 00 00       	mov    $0x22,%eax
  30a5fe:	ba 00 03 00 00       	mov    $0x300,%edx
  30a603:	ee                   	out    %al,(%dx)
  30a604:	c9                   	leave  
  30a605:	c3                   	ret    

0030a606 <neSend>:
  30a606:	55                   	push   %ebp
  30a607:	89 e5                	mov    %esp,%ebp
  30a609:	83 ec 18             	sub    $0x18,%esp
  30a60c:	fa                   	cli    
  30a60d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  30a611:	74 6d                	je     30a680 <neSend+0x7a>
  30a613:	b8 00 03 00 00       	mov    $0x300,%eax
  30a618:	89 c2                	mov    %eax,%edx
  30a61a:	ec                   	in     (%dx),%al
  30a61b:	88 45 f7             	mov    %al,-0x9(%ebp)
  30a61e:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30a622:	3c 26                	cmp    $0x26,%al
  30a624:	75 12                	jne    30a638 <neSend+0x32>
  30a626:	83 ec 0c             	sub    $0xc,%esp
  30a629:	68 56 e4 30 00       	push   $0x30e456
  30a62e:	e8 21 b0 ff ff       	call   305654 <printk>
  30a633:	83 c4 10             	add    $0x10,%esp
  30a636:	eb 49                	jmp    30a681 <neSend+0x7b>
  30a638:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a63b:	83 ec 04             	sub    $0x4,%esp
  30a63e:	50                   	push   %eax
  30a63f:	68 00 40 00 00       	push   $0x4000
  30a644:	ff 75 08             	pushl  0x8(%ebp)
  30a647:	e8 27 fd ff ff       	call   30a373 <PCtoNIC>
  30a64c:	83 c4 10             	add    $0x10,%esp
  30a64f:	b8 40 00 00 00       	mov    $0x40,%eax
  30a654:	ba 04 03 00 00       	mov    $0x304,%edx
  30a659:	ee                   	out    %al,(%dx)
  30a65a:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a65d:	0f b6 c0             	movzbl %al,%eax
  30a660:	ba 05 03 00 00       	mov    $0x305,%edx
  30a665:	ee                   	out    %al,(%dx)
  30a666:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a669:	c1 e8 08             	shr    $0x8,%eax
  30a66c:	0f b6 c0             	movzbl %al,%eax
  30a66f:	ba 06 03 00 00       	mov    $0x306,%edx
  30a674:	ee                   	out    %al,(%dx)
  30a675:	b8 26 00 00 00       	mov    $0x26,%eax
  30a67a:	ba 00 03 00 00       	mov    $0x300,%edx
  30a67f:	ee                   	out    %al,(%dx)
  30a680:	fb                   	sti    
  30a681:	c9                   	leave  
  30a682:	c3                   	ret    

0030a683 <neRecv>:
  30a683:	55                   	push   %ebp
  30a684:	89 e5                	mov    %esp,%ebp
  30a686:	83 ec 10             	sub    $0x10,%esp
  30a689:	b8 03 03 00 00       	mov    $0x303,%eax
  30a68e:	89 c2                	mov    %eax,%edx
  30a690:	ec                   	in     (%dx),%al
  30a691:	88 45 fe             	mov    %al,-0x2(%ebp)
  30a694:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  30a698:	83 c0 01             	add    $0x1,%eax
  30a69b:	88 45 ff             	mov    %al,-0x1(%ebp)
  30a69e:	b8 62 00 00 00       	mov    $0x62,%eax
  30a6a3:	ba 00 03 00 00       	mov    $0x300,%edx
  30a6a8:	ee                   	out    %al,(%dx)
  30a6a9:	b8 07 03 00 00       	mov    $0x307,%eax
  30a6ae:	89 c2                	mov    %eax,%edx
  30a6b0:	ec                   	in     (%dx),%al
  30a6b1:	88 45 fd             	mov    %al,-0x3(%ebp)
  30a6b4:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  30a6b8:	88 45 fc             	mov    %al,-0x4(%ebp)
  30a6bb:	b8 22 00 00 00       	mov    $0x22,%eax
  30a6c0:	ba 00 03 00 00       	mov    $0x300,%edx
  30a6c5:	ee                   	out    %al,(%dx)
  30a6c6:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  30a6ca:	88 45 fb             	mov    %al,-0x5(%ebp)
  30a6cd:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  30a6d1:	84 c0                	test   %al,%al
  30a6d3:	79 04                	jns    30a6d9 <neRecv+0x56>
  30a6d5:	c6 45 ff 46          	movb   $0x46,-0x1(%ebp)
  30a6d9:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  30a6dd:	3a 45 fb             	cmp    -0x5(%ebp),%al
  30a6e0:	0f 84 a4 00 00 00    	je     30a78a <neRecv+0x107>
  30a6e6:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  30a6ea:	c1 e0 08             	shl    $0x8,%eax
  30a6ed:	0f b7 c0             	movzwl %ax,%eax
  30a6f0:	6a 04                	push   $0x4
  30a6f2:	50                   	push   %eax
  30a6f3:	8d 45 f7             	lea    -0x9(%ebp),%eax
  30a6f6:	50                   	push   %eax
  30a6f7:	e8 dc fb ff ff       	call   30a2d8 <NICtoPC>
  30a6fc:	83 c4 0c             	add    $0xc,%esp
  30a6ff:	0f b7 45 f9          	movzwl -0x7(%ebp),%eax
  30a703:	83 e8 04             	sub    $0x4,%eax
  30a706:	66 89 45 f9          	mov    %ax,-0x7(%ebp)
  30a70a:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  30a70e:	84 c0                	test   %al,%al
  30a710:	78 12                	js     30a724 <neRecv+0xa1>
  30a712:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  30a716:	3c 45                	cmp    $0x45,%al
  30a718:	76 0a                	jbe    30a724 <neRecv+0xa1>
  30a71a:	0f b7 45 f9          	movzwl -0x7(%ebp),%eax
  30a71e:	66 3d 00 06          	cmp    $0x600,%ax
  30a722:	76 33                	jbe    30a757 <neRecv+0xd4>
  30a724:	b8 61 00 00 00       	mov    $0x61,%eax
  30a729:	ba 00 03 00 00       	mov    $0x300,%edx
  30a72e:	ee                   	out    %al,(%dx)
  30a72f:	b8 46 00 00 00       	mov    $0x46,%eax
  30a734:	ba 07 03 00 00       	mov    $0x307,%edx
  30a739:	ee                   	out    %al,(%dx)
  30a73a:	b8 22 00 00 00       	mov    $0x22,%eax
  30a73f:	ba 00 03 00 00       	mov    $0x300,%edx
  30a744:	ee                   	out    %al,(%dx)
  30a745:	b8 7f 00 00 00       	mov    $0x7f,%eax
  30a74a:	ba 03 03 00 00       	mov    $0x303,%edx
  30a74f:	ee                   	out    %al,(%dx)
  30a750:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  30a755:	eb 36                	jmp    30a78d <neRecv+0x10a>
  30a757:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  30a75b:	74 2d                	je     30a78a <neRecv+0x107>
  30a75d:	8b 55 0c             	mov    0xc(%ebp),%edx
  30a760:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  30a764:	c1 e0 08             	shl    $0x8,%eax
  30a767:	83 c8 04             	or     $0x4,%eax
  30a76a:	0f b7 c0             	movzwl %ax,%eax
  30a76d:	52                   	push   %edx
  30a76e:	50                   	push   %eax
  30a76f:	ff 75 08             	pushl  0x8(%ebp)
  30a772:	e8 61 fb ff ff       	call   30a2d8 <NICtoPC>
  30a777:	83 c4 0c             	add    $0xc,%esp
  30a77a:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  30a77e:	0f b6 c0             	movzbl %al,%eax
  30a781:	83 e8 01             	sub    $0x1,%eax
  30a784:	ba 03 03 00 00       	mov    $0x303,%edx
  30a789:	ee                   	out    %al,(%dx)
  30a78a:	8b 45 0c             	mov    0xc(%ebp),%eax
  30a78d:	c9                   	leave  
  30a78e:	c3                   	ret    

0030a78f <ne2k_handler>:
  30a78f:	55                   	push   %ebp
  30a790:	89 e5                	mov    %esp,%ebp
  30a792:	83 ec 18             	sub    $0x18,%esp
  30a795:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30a79c:	b8 07 03 00 00       	mov    $0x307,%eax
  30a7a1:	89 c2                	mov    %eax,%edx
  30a7a3:	ec                   	in     (%dx),%al
  30a7a4:	88 45 f3             	mov    %al,-0xd(%ebp)
  30a7a7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  30a7ab:	0f b6 c0             	movzbl %al,%eax
  30a7ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30a7b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a7b4:	83 ec 0c             	sub    $0xc,%esp
  30a7b7:	6a 00                	push   $0x0
  30a7b9:	6a 00                	push   $0x0
  30a7bb:	50                   	push   %eax
  30a7bc:	6a 06                	push   $0x6
  30a7be:	ff 75 08             	pushl  0x8(%ebp)
  30a7c1:	e8 ea c1 ff ff       	call   3069b0 <doint>
  30a7c6:	83 c4 20             	add    $0x20,%esp
  30a7c9:	fa                   	cli    
  30a7ca:	0f b6 05 50 31 31 00 	movzbl 0x313150,%eax
  30a7d1:	ba 0f 03 00 00       	mov    $0x30f,%edx
  30a7d6:	ee                   	out    %al,(%dx)
  30a7d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30a7da:	ba 07 03 00 00       	mov    $0x307,%edx
  30a7df:	ee                   	out    %al,(%dx)
  30a7e0:	fb                   	sti    
  30a7e1:	b8 00 00 00 00       	mov    $0x0,%eax
  30a7e6:	c9                   	leave  
  30a7e7:	c3                   	ret    

0030a7e8 <ne2k_push>:
  30a7e8:	55                   	push   %ebp
  30a7e9:	89 e5                	mov    %esp,%ebp
  30a7eb:	a1 04 50 31 00       	mov    0x315004,%eax
  30a7f0:	85 c0                	test   %eax,%eax
  30a7f2:	75 12                	jne    30a806 <ne2k_push+0x1e>
  30a7f4:	8b 45 08             	mov    0x8(%ebp),%eax
  30a7f7:	a3 04 50 31 00       	mov    %eax,0x315004
  30a7fc:	a1 04 50 31 00       	mov    0x315004,%eax
  30a801:	a3 08 50 31 00       	mov    %eax,0x315008
  30a806:	a1 08 50 31 00       	mov    0x315008,%eax
  30a80b:	8b 55 08             	mov    0x8(%ebp),%edx
  30a80e:	89 50 0c             	mov    %edx,0xc(%eax)
  30a811:	8b 45 08             	mov    0x8(%ebp),%eax
  30a814:	a3 08 50 31 00       	mov    %eax,0x315008
  30a819:	a1 08 50 31 00       	mov    0x315008,%eax
  30a81e:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  30a825:	5d                   	pop    %ebp
  30a826:	c3                   	ret    

0030a827 <ne2k_pop>:
  30a827:	55                   	push   %ebp
  30a828:	89 e5                	mov    %esp,%ebp
  30a82a:	83 ec 18             	sub    $0x18,%esp
  30a82d:	a1 04 50 31 00       	mov    0x315004,%eax
  30a832:	85 c0                	test   %eax,%eax
  30a834:	74 25                	je     30a85b <ne2k_pop+0x34>
  30a836:	a1 04 50 31 00       	mov    0x315004,%eax
  30a83b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30a83e:	a1 04 50 31 00       	mov    0x315004,%eax
  30a843:	8b 40 0c             	mov    0xc(%eax),%eax
  30a846:	a3 04 50 31 00       	mov    %eax,0x315004
  30a84b:	83 ec 08             	sub    $0x8,%esp
  30a84e:	6a 00                	push   $0x0
  30a850:	ff 75 f4             	pushl  -0xc(%ebp)
  30a853:	e8 67 d5 ff ff       	call   307dbf <kfree_s>
  30a858:	83 c4 10             	add    $0x10,%esp
  30a85b:	c9                   	leave  
  30a85c:	c3                   	ret    

0030a85d <_rw>:
  30a85d:	55                   	push   %ebp
  30a85e:	89 e5                	mov    %esp,%ebp
  30a860:	57                   	push   %edi
  30a861:	56                   	push   %esi
  30a862:	53                   	push   %ebx
  30a863:	83 ec 1c             	sub    $0x1c,%esp
  30a866:	8b 45 08             	mov    0x8(%ebp),%eax
  30a869:	8b 40 5c             	mov    0x5c(%eax),%eax
  30a86c:	83 f8 01             	cmp    $0x1,%eax
  30a86f:	75 42                	jne    30a8b3 <_rw+0x56>
  30a871:	8b 45 08             	mov    0x8(%ebp),%eax
  30a874:	8b 50 34             	mov    0x34(%eax),%edx
  30a877:	8b 45 08             	mov    0x8(%ebp),%eax
  30a87a:	8b 40 38             	mov    0x38(%eax),%eax
  30a87d:	83 ec 08             	sub    $0x8,%esp
  30a880:	52                   	push   %edx
  30a881:	50                   	push   %eax
  30a882:	e8 7f fd ff ff       	call   30a606 <neSend>
  30a887:	83 c4 10             	add    $0x10,%esp
  30a88a:	8b 45 08             	mov    0x8(%ebp),%eax
  30a88d:	8b 58 3c             	mov    0x3c(%eax),%ebx
  30a890:	b8 02 00 00 00       	mov    $0x2,%eax
  30a895:	b9 00 00 00 00       	mov    $0x0,%ecx
  30a89a:	ba 00 00 00 00       	mov    $0x0,%edx
  30a89f:	be 00 00 00 00       	mov    $0x0,%esi
  30a8a4:	bf 00 00 00 00       	mov    $0x0,%edi
  30a8a9:	cd 80                	int    $0x80
  30a8ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30a8ae:	e9 82 00 00 00       	jmp    30a935 <_rw+0xd8>
  30a8b3:	83 ec 0c             	sub    $0xc,%esp
  30a8b6:	6a 10                	push   $0x10
  30a8b8:	e8 96 d3 ff ff       	call   307c53 <kalloc>
  30a8bd:	83 c4 10             	add    $0x10,%esp
  30a8c0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30a8c3:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  30a8c7:	74 48                	je     30a911 <_rw+0xb4>
  30a8c9:	8b 45 08             	mov    0x8(%ebp),%eax
  30a8cc:	8b 50 3c             	mov    0x3c(%eax),%edx
  30a8cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30a8d2:	89 10                	mov    %edx,(%eax)
  30a8d4:	8b 45 08             	mov    0x8(%ebp),%eax
  30a8d7:	8b 50 3c             	mov    0x3c(%eax),%edx
  30a8da:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30a8dd:	89 10                	mov    %edx,(%eax)
  30a8df:	8b 45 08             	mov    0x8(%ebp),%eax
  30a8e2:	8b 50 38             	mov    0x38(%eax),%edx
  30a8e5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30a8e8:	89 50 08             	mov    %edx,0x8(%eax)
  30a8eb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30a8ee:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  30a8f5:	8b 45 08             	mov    0x8(%ebp),%eax
  30a8f8:	8b 50 34             	mov    0x34(%eax),%edx
  30a8fb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30a8fe:	89 50 04             	mov    %edx,0x4(%eax)
  30a901:	83 ec 0c             	sub    $0xc,%esp
  30a904:	ff 75 e0             	pushl  -0x20(%ebp)
  30a907:	e8 dc fe ff ff       	call   30a7e8 <ne2k_push>
  30a90c:	83 c4 10             	add    $0x10,%esp
  30a90f:	eb 24                	jmp    30a935 <_rw+0xd8>
  30a911:	8b 45 08             	mov    0x8(%ebp),%eax
  30a914:	8b 58 3c             	mov    0x3c(%eax),%ebx
  30a917:	b8 02 00 00 00       	mov    $0x2,%eax
  30a91c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30a921:	ba 00 00 00 00       	mov    $0x0,%edx
  30a926:	be 00 00 00 00       	mov    $0x0,%esi
  30a92b:	bf 00 00 00 00       	mov    $0x0,%edi
  30a930:	cd 80                	int    $0x80
  30a932:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30a935:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30a938:	5b                   	pop    %ebx
  30a939:	5e                   	pop    %esi
  30a93a:	5f                   	pop    %edi
  30a93b:	5d                   	pop    %ebp
  30a93c:	c3                   	ret    

0030a93d <_io>:
  30a93d:	55                   	push   %ebp
  30a93e:	89 e5                	mov    %esp,%ebp
  30a940:	57                   	push   %edi
  30a941:	56                   	push   %esi
  30a942:	53                   	push   %ebx
  30a943:	83 ec 1c             	sub    $0x1c,%esp
  30a946:	8b 45 08             	mov    0x8(%ebp),%eax
  30a949:	8b 40 30             	mov    0x30(%eax),%eax
  30a94c:	83 e0 01             	and    $0x1,%eax
  30a94f:	85 c0                	test   %eax,%eax
  30a951:	74 4e                	je     30a9a1 <_io+0x64>
  30a953:	a1 04 50 31 00       	mov    0x315004,%eax
  30a958:	85 c0                	test   %eax,%eax
  30a95a:	74 45                	je     30a9a1 <_io+0x64>
  30a95c:	a1 04 50 31 00       	mov    0x315004,%eax
  30a961:	8b 50 04             	mov    0x4(%eax),%edx
  30a964:	a1 04 50 31 00       	mov    0x315004,%eax
  30a969:	8b 40 08             	mov    0x8(%eax),%eax
  30a96c:	52                   	push   %edx
  30a96d:	50                   	push   %eax
  30a96e:	e8 10 fd ff ff       	call   30a683 <neRecv>
  30a973:	83 c4 08             	add    $0x8,%esp
  30a976:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30a979:	a1 04 50 31 00       	mov    0x315004,%eax
  30a97e:	8b 18                	mov    (%eax),%ebx
  30a980:	b8 02 00 00 00       	mov    $0x2,%eax
  30a985:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  30a988:	ba 00 00 00 00       	mov    $0x0,%edx
  30a98d:	be 00 00 00 00       	mov    $0x0,%esi
  30a992:	bf 00 00 00 00       	mov    $0x0,%edi
  30a997:	cd 80                	int    $0x80
  30a999:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30a99c:	e8 86 fe ff ff       	call   30a827 <ne2k_pop>
  30a9a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30a9a4:	5b                   	pop    %ebx
  30a9a5:	5e                   	pop    %esi
  30a9a6:	5f                   	pop    %edi
  30a9a7:	5d                   	pop    %ebp
  30a9a8:	c3                   	ret    

0030a9a9 <ne2k_init>:
  30a9a9:	55                   	push   %ebp
  30a9aa:	89 e5                	mov    %esp,%ebp
  30a9ac:	57                   	push   %edi
  30a9ad:	56                   	push   %esi
  30a9ae:	53                   	push   %ebx
  30a9af:	83 ec 1c             	sub    $0x1c,%esp
  30a9b2:	b8 03 00 00 00       	mov    $0x3,%eax
  30a9b7:	bb 01 00 00 00       	mov    $0x1,%ebx
  30a9bc:	b9 5d a8 30 00       	mov    $0x30a85d,%ecx
  30a9c1:	ba 00 00 00 00       	mov    $0x0,%edx
  30a9c6:	be 00 00 00 00       	mov    $0x0,%esi
  30a9cb:	bf 00 00 00 00       	mov    $0x0,%edi
  30a9d0:	cd 80                	int    $0x80
  30a9d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30a9d5:	b8 03 00 00 00       	mov    $0x3,%eax
  30a9da:	bb 00 00 00 00       	mov    $0x0,%ebx
  30a9df:	b9 5d a8 30 00       	mov    $0x30a85d,%ecx
  30a9e4:	ba 00 00 00 00       	mov    $0x0,%edx
  30a9e9:	be 00 00 00 00       	mov    $0x0,%esi
  30a9ee:	bf 00 00 00 00       	mov    $0x0,%edi
  30a9f3:	cd 80                	int    $0x80
  30a9f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30a9f8:	b8 03 00 00 00       	mov    $0x3,%eax
  30a9fd:	bb 06 00 00 00       	mov    $0x6,%ebx
  30aa02:	b9 3d a9 30 00       	mov    $0x30a93d,%ecx
  30aa07:	ba 00 00 00 00       	mov    $0x0,%edx
  30aa0c:	be 00 00 00 00       	mov    $0x0,%esi
  30aa11:	bf 00 00 00 00       	mov    $0x0,%edi
  30aa16:	cd 80                	int    $0x80
  30aa18:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30aa1b:	83 ec 08             	sub    $0x8,%esp
  30aa1e:	68 8f a7 30 00       	push   $0x30a78f
  30aa23:	6a 03                	push   $0x3
  30aa25:	e8 ad b2 ff ff       	call   305cd7 <put_irq_handler>
  30aa2a:	83 c4 10             	add    $0x10,%esp
  30aa2d:	83 ec 0c             	sub    $0xc,%esp
  30aa30:	68 0c 50 31 00       	push   $0x31500c
  30aa35:	e8 d4 f9 ff ff       	call   30a40e <ne2kInit>
  30aa3a:	83 c4 10             	add    $0x10,%esp
  30aa3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30aa40:	5b                   	pop    %ebx
  30aa41:	5e                   	pop    %esi
  30aa42:	5f                   	pop    %edi
  30aa43:	5d                   	pop    %ebp
  30aa44:	c3                   	ret    

0030aa45 <ne2k_main>:
  30aa45:	55                   	push   %ebp
  30aa46:	89 e5                	mov    %esp,%ebp
  30aa48:	83 ec 08             	sub    $0x8,%esp
  30aa4b:	e8 59 ff ff ff       	call   30a9a9 <ne2k_init>
  30aa50:	e8 7f 21 00 00       	call   30cbd4 <dorun>
  30aa55:	b8 00 00 00 00       	mov    $0x0,%eax
  30aa5a:	c9                   	leave  
  30aa5b:	c3                   	ret    

0030aa5c <_add>:
  30aa5c:	55                   	push   %ebp
  30aa5d:	89 e5                	mov    %esp,%ebp
  30aa5f:	83 ec 10             	sub    $0x10,%esp
  30aa62:	a1 1c 50 31 00       	mov    0x31501c,%eax
  30aa67:	85 c0                	test   %eax,%eax
  30aa69:	75 26                	jne    30aa91 <_add+0x35>
  30aa6b:	8b 45 08             	mov    0x8(%ebp),%eax
  30aa6e:	a3 1c 50 31 00       	mov    %eax,0x31501c
  30aa73:	a1 1c 50 31 00       	mov    0x31501c,%eax
  30aa78:	8b 15 1c 50 31 00    	mov    0x31501c,%edx
  30aa7e:	89 50 14             	mov    %edx,0x14(%eax)
  30aa81:	a1 1c 50 31 00       	mov    0x31501c,%eax
  30aa86:	8b 15 1c 50 31 00    	mov    0x31501c,%edx
  30aa8c:	89 50 18             	mov    %edx,0x18(%eax)
  30aa8f:	eb 6c                	jmp    30aafd <_add+0xa1>
  30aa91:	a1 1c 50 31 00       	mov    0x31501c,%eax
  30aa96:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30aa99:	8b 45 08             	mov    0x8(%ebp),%eax
  30aa9c:	8b 50 08             	mov    0x8(%eax),%edx
  30aa9f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30aaa2:	8b 40 08             	mov    0x8(%eax),%eax
  30aaa5:	39 c2                	cmp    %eax,%edx
  30aaa7:	73 02                	jae    30aaab <_add+0x4f>
  30aaa9:	eb 13                	jmp    30aabe <_add+0x62>
  30aaab:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30aaae:	8b 40 14             	mov    0x14(%eax),%eax
  30aab1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30aab4:	a1 1c 50 31 00       	mov    0x31501c,%eax
  30aab9:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  30aabc:	75 db                	jne    30aa99 <_add+0x3d>
  30aabe:	8b 45 08             	mov    0x8(%ebp),%eax
  30aac1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  30aac4:	89 50 14             	mov    %edx,0x14(%eax)
  30aac7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30aaca:	8b 50 18             	mov    0x18(%eax),%edx
  30aacd:	8b 45 08             	mov    0x8(%ebp),%eax
  30aad0:	89 50 18             	mov    %edx,0x18(%eax)
  30aad3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30aad6:	8b 55 08             	mov    0x8(%ebp),%edx
  30aad9:	89 50 18             	mov    %edx,0x18(%eax)
  30aadc:	a1 1c 50 31 00       	mov    0x31501c,%eax
  30aae1:	8b 50 08             	mov    0x8(%eax),%edx
  30aae4:	8b 45 08             	mov    0x8(%ebp),%eax
  30aae7:	8b 40 08             	mov    0x8(%eax),%eax
  30aaea:	39 c2                	cmp    %eax,%edx
  30aaec:	76 05                	jbe    30aaf3 <_add+0x97>
  30aaee:	8b 45 08             	mov    0x8(%ebp),%eax
  30aaf1:	eb 05                	jmp    30aaf8 <_add+0x9c>
  30aaf3:	a1 1c 50 31 00       	mov    0x31501c,%eax
  30aaf8:	a3 1c 50 31 00       	mov    %eax,0x31501c
  30aafd:	c9                   	leave  
  30aafe:	c3                   	ret    

0030aaff <_sub>:
  30aaff:	55                   	push   %ebp
  30ab00:	89 e5                	mov    %esp,%ebp
  30ab02:	83 ec 18             	sub    $0x18,%esp
  30ab05:	a1 20 50 31 00       	mov    0x315020,%eax
  30ab0a:	85 c0                	test   %eax,%eax
  30ab0c:	74 61                	je     30ab6f <_sub+0x70>
  30ab0e:	a1 20 50 31 00       	mov    0x315020,%eax
  30ab13:	8b 40 14             	mov    0x14(%eax),%eax
  30ab16:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30ab19:	a1 20 50 31 00       	mov    0x315020,%eax
  30ab1e:	8b 40 18             	mov    0x18(%eax),%eax
  30ab21:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30ab24:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30ab27:	8b 55 f0             	mov    -0x10(%ebp),%edx
  30ab2a:	89 50 18             	mov    %edx,0x18(%eax)
  30ab2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30ab30:	8b 55 f4             	mov    -0xc(%ebp),%edx
  30ab33:	89 50 14             	mov    %edx,0x14(%eax)
  30ab36:	a1 20 50 31 00       	mov    0x315020,%eax
  30ab3b:	83 ec 08             	sub    $0x8,%esp
  30ab3e:	6a 00                	push   $0x0
  30ab40:	50                   	push   %eax
  30ab41:	e8 79 d2 ff ff       	call   307dbf <kfree_s>
  30ab46:	83 c4 10             	add    $0x10,%esp
  30ab49:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30ab4c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  30ab4f:	74 0a                	je     30ab5b <_sub+0x5c>
  30ab51:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30ab54:	a3 20 50 31 00       	mov    %eax,0x315020
  30ab59:	eb 14                	jmp    30ab6f <_sub+0x70>
  30ab5b:	c7 05 20 50 31 00 00 	movl   $0x0,0x315020
  30ab62:	00 00 00 
  30ab65:	a1 20 50 31 00       	mov    0x315020,%eax
  30ab6a:	a3 1c 50 31 00       	mov    %eax,0x31501c
  30ab6f:	c9                   	leave  
  30ab70:	c3                   	ret    

0030ab71 <at_isbusy>:
  30ab71:	55                   	push   %ebp
  30ab72:	89 e5                	mov    %esp,%ebp
  30ab74:	83 ec 18             	sub    $0x18,%esp
  30ab77:	c7 45 f4 50 c3 00 00 	movl   $0xc350,-0xc(%ebp)
  30ab7e:	eb 2b                	jmp    30abab <at_isbusy+0x3a>
  30ab80:	b8 f7 01 00 00       	mov    $0x1f7,%eax
  30ab85:	89 c2                	mov    %eax,%edx
  30ab87:	ec                   	in     (%dx),%al
  30ab88:	eb 00                	jmp    30ab8a <at_isbusy+0x19>
  30ab8a:	eb 00                	jmp    30ab8c <at_isbusy+0x1b>
  30ab8c:	88 45 f3             	mov    %al,-0xd(%ebp)
  30ab8f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  30ab93:	88 45 f2             	mov    %al,-0xe(%ebp)
  30ab96:	80 65 f2 d0          	andb   $0xd0,-0xe(%ebp)
  30ab9a:	80 7d f2 50          	cmpb   $0x50,-0xe(%ebp)
  30ab9e:	75 07                	jne    30aba7 <at_isbusy+0x36>
  30aba0:	b8 00 00 00 00       	mov    $0x0,%eax
  30aba5:	eb 1f                	jmp    30abc6 <at_isbusy+0x55>
  30aba7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  30abab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  30abaf:	75 cf                	jne    30ab80 <at_isbusy+0xf>
  30abb1:	83 ec 0c             	sub    $0xc,%esp
  30abb4:	68 5c e4 30 00       	push   $0x30e45c
  30abb9:	e8 96 aa ff ff       	call   305654 <printk>
  30abbe:	83 c4 10             	add    $0x10,%esp
  30abc1:	b8 01 00 00 00       	mov    $0x1,%eax
  30abc6:	c9                   	leave  
  30abc7:	c3                   	ret    

0030abc8 <at_cmd>:
  30abc8:	55                   	push   %ebp
  30abc9:	89 e5                	mov    %esp,%ebp
  30abcb:	83 ec 28             	sub    $0x28,%esp
  30abce:	8b 4d 08             	mov    0x8(%ebp),%ecx
  30abd1:	8b 55 0c             	mov    0xc(%ebp),%edx
  30abd4:	8b 45 10             	mov    0x10(%ebp),%eax
  30abd7:	88 4d ec             	mov    %cl,-0x14(%ebp)
  30abda:	88 55 e8             	mov    %dl,-0x18(%ebp)
  30abdd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  30abe0:	8b 45 14             	mov    0x14(%ebp),%eax
  30abe3:	89 45 d8             	mov    %eax,-0x28(%ebp)
  30abe6:	8b 45 18             	mov    0x18(%ebp),%eax
  30abe9:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30abec:	c6 45 ff e0          	movb   $0xe0,-0x1(%ebp)
  30abf0:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  30abf4:	74 04                	je     30abfa <at_cmd+0x32>
  30abf6:	80 4d ff 10          	orb    $0x10,-0x1(%ebp)
  30abfa:	8b 45 d8             	mov    -0x28(%ebp),%eax
  30abfd:	8b 55 dc             	mov    -0x24(%ebp),%edx
  30ac00:	0f ac d0 18          	shrd   $0x18,%edx,%eax
  30ac04:	c1 ea 18             	shr    $0x18,%edx
  30ac07:	83 e0 0f             	and    $0xf,%eax
  30ac0a:	08 45 ff             	or     %al,-0x1(%ebp)
  30ac0d:	8b 45 d8             	mov    -0x28(%ebp),%eax
  30ac10:	88 45 fe             	mov    %al,-0x2(%ebp)
  30ac13:	8b 45 d8             	mov    -0x28(%ebp),%eax
  30ac16:	8b 55 dc             	mov    -0x24(%ebp),%edx
  30ac19:	0f ac d0 08          	shrd   $0x8,%edx,%eax
  30ac1d:	c1 ea 08             	shr    $0x8,%edx
  30ac20:	88 45 fd             	mov    %al,-0x3(%ebp)
  30ac23:	8b 45 d8             	mov    -0x28(%ebp),%eax
  30ac26:	8b 55 dc             	mov    -0x24(%ebp),%edx
  30ac29:	0f ac d0 10          	shrd   $0x10,%edx,%eax
  30ac2d:	c1 ea 10             	shr    $0x10,%edx
  30ac30:	88 45 fc             	mov    %al,-0x4(%ebp)
  30ac33:	b8 00 00 00 00       	mov    $0x0,%eax
  30ac38:	ba f6 03 00 00       	mov    $0x3f6,%edx
  30ac3d:	ee                   	out    %al,(%dx)
  30ac3e:	eb 00                	jmp    30ac40 <at_cmd+0x78>
  30ac40:	eb 00                	jmp    30ac42 <at_cmd+0x7a>
  30ac42:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  30ac46:	ba f1 01 00 00       	mov    $0x1f1,%edx
  30ac4b:	ee                   	out    %al,(%dx)
  30ac4c:	eb 00                	jmp    30ac4e <at_cmd+0x86>
  30ac4e:	eb 00                	jmp    30ac50 <at_cmd+0x88>
  30ac50:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  30ac54:	ba f2 01 00 00       	mov    $0x1f2,%edx
  30ac59:	ee                   	out    %al,(%dx)
  30ac5a:	eb 00                	jmp    30ac5c <at_cmd+0x94>
  30ac5c:	eb 00                	jmp    30ac5e <at_cmd+0x96>
  30ac5e:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  30ac62:	ba f3 01 00 00       	mov    $0x1f3,%edx
  30ac67:	ee                   	out    %al,(%dx)
  30ac68:	eb 00                	jmp    30ac6a <at_cmd+0xa2>
  30ac6a:	eb 00                	jmp    30ac6c <at_cmd+0xa4>
  30ac6c:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  30ac70:	ba f4 01 00 00       	mov    $0x1f4,%edx
  30ac75:	ee                   	out    %al,(%dx)
  30ac76:	eb 00                	jmp    30ac78 <at_cmd+0xb0>
  30ac78:	eb 00                	jmp    30ac7a <at_cmd+0xb2>
  30ac7a:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  30ac7e:	ba f5 01 00 00       	mov    $0x1f5,%edx
  30ac83:	ee                   	out    %al,(%dx)
  30ac84:	eb 00                	jmp    30ac86 <at_cmd+0xbe>
  30ac86:	eb 00                	jmp    30ac88 <at_cmd+0xc0>
  30ac88:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  30ac8c:	ba f6 01 00 00       	mov    $0x1f6,%edx
  30ac91:	ee                   	out    %al,(%dx)
  30ac92:	eb 00                	jmp    30ac94 <at_cmd+0xcc>
  30ac94:	eb 00                	jmp    30ac96 <at_cmd+0xce>
  30ac96:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  30ac9a:	ba f7 01 00 00       	mov    $0x1f7,%edx
  30ac9f:	ee                   	out    %al,(%dx)
  30aca0:	eb 00                	jmp    30aca2 <at_cmd+0xda>
  30aca2:	eb 00                	jmp    30aca4 <at_cmd+0xdc>
  30aca4:	c9                   	leave  
  30aca5:	c3                   	ret    

0030aca6 <_doio>:
  30aca6:	55                   	push   %ebp
  30aca7:	89 e5                	mov    %esp,%ebp
  30aca9:	57                   	push   %edi
  30acaa:	56                   	push   %esi
  30acab:	53                   	push   %ebx
  30acac:	83 ec 2c             	sub    $0x2c,%esp
  30acaf:	a1 20 50 31 00       	mov    0x315020,%eax
  30acb4:	8b 40 04             	mov    0x4(%eax),%eax
  30acb7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30acba:	a1 20 50 31 00       	mov    0x315020,%eax
  30acbf:	8b 40 0c             	mov    0xc(%eax),%eax
  30acc2:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30acc5:	a1 20 50 31 00       	mov    0x315020,%eax
  30acca:	8b 40 08             	mov    0x8(%eax),%eax
  30accd:	89 45 d8             	mov    %eax,-0x28(%ebp)
  30acd0:	8b 45 d8             	mov    -0x28(%ebp),%eax
  30acd3:	ba 00 00 00 00       	mov    $0x0,%edx
  30acd8:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  30acdb:	0f b6 d9             	movzbl %cl,%ebx
  30acde:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  30ace1:	0f b6 c9             	movzbl %cl,%ecx
  30ace4:	6a 00                	push   $0x0
  30ace6:	52                   	push   %edx
  30ace7:	50                   	push   %eax
  30ace8:	53                   	push   %ebx
  30ace9:	6a 00                	push   $0x0
  30aceb:	51                   	push   %ecx
  30acec:	e8 d7 fe ff ff       	call   30abc8 <at_cmd>
  30acf1:	83 c4 18             	add    $0x18,%esp
  30acf4:	e8 78 fe ff ff       	call   30ab71 <at_isbusy>
  30acf9:	85 c0                	test   %eax,%eax
  30acfb:	74 2a                	je     30ad27 <_doio+0x81>
  30acfd:	a1 20 50 31 00       	mov    0x315020,%eax
  30ad02:	8b 18                	mov    (%eax),%ebx
  30ad04:	b8 02 00 00 00       	mov    $0x2,%eax
  30ad09:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30ad0e:	ba 00 00 00 00       	mov    $0x0,%edx
  30ad13:	be 00 00 00 00       	mov    $0x0,%esi
  30ad18:	bf 00 00 00 00       	mov    $0x0,%edi
  30ad1d:	cd 80                	int    $0x80
  30ad1f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  30ad22:	e8 d8 fd ff ff       	call   30aaff <_sub>
  30ad27:	83 7d e0 30          	cmpl   $0x30,-0x20(%ebp)
  30ad2b:	75 6c                	jne    30ad99 <_doio+0xf3>
  30ad2d:	a1 20 50 31 00       	mov    0x315020,%eax
  30ad32:	8b 40 10             	mov    0x10(%eax),%eax
  30ad35:	89 45 d0             	mov    %eax,-0x30(%ebp)
  30ad38:	c7 45 e4 50 c3 00 00 	movl   $0xc350,-0x1c(%ebp)
  30ad3f:	eb 04                	jmp    30ad45 <_doio+0x9f>
  30ad41:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  30ad45:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  30ad49:	74 1d                	je     30ad68 <_doio+0xc2>
  30ad4b:	b8 f7 01 00 00       	mov    $0x1f7,%eax
  30ad50:	89 c2                	mov    %eax,%edx
  30ad52:	ec                   	in     (%dx),%al
  30ad53:	eb 00                	jmp    30ad55 <_doio+0xaf>
  30ad55:	eb 00                	jmp    30ad57 <_doio+0xb1>
  30ad57:	88 45 cf             	mov    %al,-0x31(%ebp)
  30ad5a:	0f b6 45 cf          	movzbl -0x31(%ebp),%eax
  30ad5e:	0f b6 c0             	movzbl %al,%eax
  30ad61:	83 e0 08             	and    $0x8,%eax
  30ad64:	85 c0                	test   %eax,%eax
  30ad66:	74 d9                	je     30ad41 <_doio+0x9b>
  30ad68:	b8 f0 01 00 00       	mov    $0x1f0,%eax
  30ad6d:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  30ad70:	b9 00 01 00 00       	mov    $0x100,%ecx
  30ad75:	89 c2                	mov    %eax,%edx
  30ad77:	89 de                	mov    %ebx,%esi
  30ad79:	fc                   	cld    
  30ad7a:	f3 66 6f             	rep outsw %ds:(%esi),(%dx)
  30ad7d:	a1 20 50 31 00       	mov    0x315020,%eax
  30ad82:	8b 50 08             	mov    0x8(%eax),%edx
  30ad85:	83 c2 01             	add    $0x1,%edx
  30ad88:	89 50 08             	mov    %edx,0x8(%eax)
  30ad8b:	a1 20 50 31 00       	mov    0x315020,%eax
  30ad90:	8b 50 0c             	mov    0xc(%eax),%edx
  30ad93:	83 ea 01             	sub    $0x1,%edx
  30ad96:	89 50 0c             	mov    %edx,0xc(%eax)
  30ad99:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30ad9c:	5b                   	pop    %ebx
  30ad9d:	5e                   	pop    %esi
  30ad9e:	5f                   	pop    %edi
  30ad9f:	5d                   	pop    %ebp
  30ada0:	c3                   	ret    

0030ada1 <_rw>:
  30ada1:	55                   	push   %ebp
  30ada2:	89 e5                	mov    %esp,%ebp
  30ada4:	57                   	push   %edi
  30ada5:	56                   	push   %esi
  30ada6:	53                   	push   %ebx
  30ada7:	83 ec 1c             	sub    $0x1c,%esp
  30adaa:	83 ec 0c             	sub    $0xc,%esp
  30adad:	6a 1c                	push   $0x1c
  30adaf:	e8 9f ce ff ff       	call   307c53 <kalloc>
  30adb4:	83 c4 10             	add    $0x10,%esp
  30adb7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30adba:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  30adbe:	74 71                	je     30ae31 <_rw+0x90>
  30adc0:	8b 45 08             	mov    0x8(%ebp),%eax
  30adc3:	8b 50 3c             	mov    0x3c(%eax),%edx
  30adc6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30adc9:	89 10                	mov    %edx,(%eax)
  30adcb:	8b 45 08             	mov    0x8(%ebp),%eax
  30adce:	8b 40 5c             	mov    0x5c(%eax),%eax
  30add1:	85 c0                	test   %eax,%eax
  30add3:	75 07                	jne    30addc <_rw+0x3b>
  30add5:	b8 20 00 00 00       	mov    $0x20,%eax
  30adda:	eb 05                	jmp    30ade1 <_rw+0x40>
  30addc:	b8 30 00 00 00       	mov    $0x30,%eax
  30ade1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  30ade4:	89 42 04             	mov    %eax,0x4(%edx)
  30ade7:	8b 45 08             	mov    0x8(%ebp),%eax
  30adea:	8b 50 30             	mov    0x30(%eax),%edx
  30aded:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30adf0:	89 50 08             	mov    %edx,0x8(%eax)
  30adf3:	8b 45 08             	mov    0x8(%ebp),%eax
  30adf6:	8b 50 34             	mov    0x34(%eax),%edx
  30adf9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30adfc:	89 50 0c             	mov    %edx,0xc(%eax)
  30adff:	8b 45 08             	mov    0x8(%ebp),%eax
  30ae02:	8b 50 38             	mov    0x38(%eax),%edx
  30ae05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30ae08:	89 50 10             	mov    %edx,0x10(%eax)
  30ae0b:	83 ec 0c             	sub    $0xc,%esp
  30ae0e:	ff 75 e4             	pushl  -0x1c(%ebp)
  30ae11:	e8 46 fc ff ff       	call   30aa5c <_add>
  30ae16:	83 c4 10             	add    $0x10,%esp
  30ae19:	a1 20 50 31 00       	mov    0x315020,%eax
  30ae1e:	85 c0                	test   %eax,%eax
  30ae20:	75 30                	jne    30ae52 <_rw+0xb1>
  30ae22:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30ae25:	a3 20 50 31 00       	mov    %eax,0x315020
  30ae2a:	e8 77 fe ff ff       	call   30aca6 <_doio>
  30ae2f:	eb 21                	jmp    30ae52 <_rw+0xb1>
  30ae31:	b8 02 00 00 00       	mov    $0x2,%eax
  30ae36:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30ae39:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30ae3e:	ba 00 00 00 00       	mov    $0x0,%edx
  30ae43:	be 00 00 00 00       	mov    $0x0,%esi
  30ae48:	bf 00 00 00 00       	mov    $0x0,%edi
  30ae4d:	cd 80                	int    $0x80
  30ae4f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30ae52:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30ae55:	5b                   	pop    %ebx
  30ae56:	5e                   	pop    %esi
  30ae57:	5f                   	pop    %edi
  30ae58:	5d                   	pop    %ebp
  30ae59:	c3                   	ret    

0030ae5a <at_handler>:
  30ae5a:	55                   	push   %ebp
  30ae5b:	89 e5                	mov    %esp,%ebp
  30ae5d:	83 ec 18             	sub    $0x18,%esp
  30ae60:	b8 f7 01 00 00       	mov    $0x1f7,%eax
  30ae65:	89 c2                	mov    %eax,%edx
  30ae67:	ec                   	in     (%dx),%al
  30ae68:	88 45 f7             	mov    %al,-0x9(%ebp)
  30ae6b:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30ae6f:	0f b6 c0             	movzbl %al,%eax
  30ae72:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30ae75:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30ae78:	83 ec 0c             	sub    $0xc,%esp
  30ae7b:	6a 00                	push   $0x0
  30ae7d:	6a 00                	push   $0x0
  30ae7f:	50                   	push   %eax
  30ae80:	6a 06                	push   $0x6
  30ae82:	ff 75 08             	pushl  0x8(%ebp)
  30ae85:	e8 26 bb ff ff       	call   3069b0 <doint>
  30ae8a:	83 c4 20             	add    $0x20,%esp
  30ae8d:	b8 00 00 00 00       	mov    $0x0,%eax
  30ae92:	c9                   	leave  
  30ae93:	c3                   	ret    

0030ae94 <_io>:
  30ae94:	55                   	push   %ebp
  30ae95:	89 e5                	mov    %esp,%ebp
  30ae97:	57                   	push   %edi
  30ae98:	56                   	push   %esi
  30ae99:	53                   	push   %ebx
  30ae9a:	83 ec 2c             	sub    $0x2c,%esp
  30ae9d:	a1 20 50 31 00       	mov    0x315020,%eax
  30aea2:	85 c0                	test   %eax,%eax
  30aea4:	0f 84 41 01 00 00    	je     30afeb <_io+0x157>
  30aeaa:	8b 45 08             	mov    0x8(%ebp),%eax
  30aead:	8b 40 30             	mov    0x30(%eax),%eax
  30aeb0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30aeb3:	a1 20 50 31 00       	mov    0x315020,%eax
  30aeb8:	8b 40 10             	mov    0x10(%eax),%eax
  30aebb:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30aebe:	e8 ae fc ff ff       	call   30ab71 <at_isbusy>
  30aec3:	85 c0                	test   %eax,%eax
  30aec5:	74 25                	je     30aeec <_io+0x58>
  30aec7:	a1 20 50 31 00       	mov    0x315020,%eax
  30aecc:	8b 18                	mov    (%eax),%ebx
  30aece:	b8 02 00 00 00       	mov    $0x2,%eax
  30aed3:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30aed8:	ba 00 00 00 00       	mov    $0x0,%edx
  30aedd:	be 00 00 00 00       	mov    $0x0,%esi
  30aee2:	bf 00 00 00 00       	mov    $0x0,%edi
  30aee7:	cd 80                	int    $0x80
  30aee9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  30aeec:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30aeef:	83 e0 40             	and    $0x40,%eax
  30aef2:	85 c0                	test   %eax,%eax
  30aef4:	0f 84 ad 00 00 00    	je     30afa7 <_io+0x113>
  30aefa:	a1 20 50 31 00       	mov    0x315020,%eax
  30aeff:	8b 40 04             	mov    0x4(%eax),%eax
  30af02:	83 f8 20             	cmp    $0x20,%eax
  30af05:	75 17                	jne    30af1e <_io+0x8a>
  30af07:	b8 f0 01 00 00       	mov    $0x1f0,%eax
  30af0c:	8b 5d dc             	mov    -0x24(%ebp),%ebx
  30af0f:	b9 00 01 00 00       	mov    $0x100,%ecx
  30af14:	89 c2                	mov    %eax,%edx
  30af16:	89 df                	mov    %ebx,%edi
  30af18:	fc                   	cld    
  30af19:	f3 66 6d             	rep insw (%dx),%es:(%edi)
  30af1c:	eb 64                	jmp    30af82 <_io+0xee>
  30af1e:	a1 20 50 31 00       	mov    0x315020,%eax
  30af23:	8b 40 04             	mov    0x4(%eax),%eax
  30af26:	83 f8 30             	cmp    $0x30,%eax
  30af29:	75 47                	jne    30af72 <_io+0xde>
  30af2b:	c7 45 e4 50 c3 00 00 	movl   $0xc350,-0x1c(%ebp)
  30af32:	eb 04                	jmp    30af38 <_io+0xa4>
  30af34:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  30af38:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  30af3c:	74 1d                	je     30af5b <_io+0xc7>
  30af3e:	b8 f7 01 00 00       	mov    $0x1f7,%eax
  30af43:	89 c2                	mov    %eax,%edx
  30af45:	ec                   	in     (%dx),%al
  30af46:	eb 00                	jmp    30af48 <_io+0xb4>
  30af48:	eb 00                	jmp    30af4a <_io+0xb6>
  30af4a:	88 45 d7             	mov    %al,-0x29(%ebp)
  30af4d:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
  30af51:	0f b6 c0             	movzbl %al,%eax
  30af54:	83 e0 08             	and    $0x8,%eax
  30af57:	85 c0                	test   %eax,%eax
  30af59:	74 d9                	je     30af34 <_io+0xa0>
  30af5b:	b8 f0 01 00 00       	mov    $0x1f0,%eax
  30af60:	8b 5d dc             	mov    -0x24(%ebp),%ebx
  30af63:	b9 00 01 00 00       	mov    $0x100,%ecx
  30af68:	89 c2                	mov    %eax,%edx
  30af6a:	89 de                	mov    %ebx,%esi
  30af6c:	fc                   	cld    
  30af6d:	f3 66 6f             	rep outsw %ds:(%esi),(%dx)
  30af70:	eb 10                	jmp    30af82 <_io+0xee>
  30af72:	83 ec 0c             	sub    $0xc,%esp
  30af75:	68 82 e4 30 00       	push   $0x30e482
  30af7a:	e8 b9 a6 ff ff       	call   305638 <panic>
  30af7f:	83 c4 10             	add    $0x10,%esp
  30af82:	a1 20 50 31 00       	mov    0x315020,%eax
  30af87:	8b 15 20 50 31 00    	mov    0x315020,%edx
  30af8d:	8b 52 10             	mov    0x10(%edx),%edx
  30af90:	81 c2 00 02 00 00    	add    $0x200,%edx
  30af96:	89 50 10             	mov    %edx,0x10(%eax)
  30af99:	a1 20 50 31 00       	mov    0x315020,%eax
  30af9e:	8b 50 0c             	mov    0xc(%eax),%edx
  30afa1:	83 ea 01             	sub    $0x1,%edx
  30afa4:	89 50 0c             	mov    %edx,0xc(%eax)
  30afa7:	a1 20 50 31 00       	mov    0x315020,%eax
  30afac:	8b 40 0c             	mov    0xc(%eax),%eax
  30afaf:	85 c0                	test   %eax,%eax
  30afb1:	75 38                	jne    30afeb <_io+0x157>
  30afb3:	a1 20 50 31 00       	mov    0x315020,%eax
  30afb8:	8b 18                	mov    (%eax),%ebx
  30afba:	b8 02 00 00 00       	mov    $0x2,%eax
  30afbf:	b9 00 00 00 00       	mov    $0x0,%ecx
  30afc4:	ba 00 00 00 00       	mov    $0x0,%edx
  30afc9:	be 00 00 00 00       	mov    $0x0,%esi
  30afce:	bf 00 00 00 00       	mov    $0x0,%edi
  30afd3:	cd 80                	int    $0x80
  30afd5:	89 45 d0             	mov    %eax,-0x30(%ebp)
  30afd8:	e8 22 fb ff ff       	call   30aaff <_sub>
  30afdd:	a1 20 50 31 00       	mov    0x315020,%eax
  30afe2:	85 c0                	test   %eax,%eax
  30afe4:	74 05                	je     30afeb <_io+0x157>
  30afe6:	e8 bb fc ff ff       	call   30aca6 <_doio>
  30afeb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30afee:	5b                   	pop    %ebx
  30afef:	5e                   	pop    %esi
  30aff0:	5f                   	pop    %edi
  30aff1:	5d                   	pop    %ebp
  30aff2:	c3                   	ret    

0030aff3 <at_init>:
  30aff3:	55                   	push   %ebp
  30aff4:	89 e5                	mov    %esp,%ebp
  30aff6:	57                   	push   %edi
  30aff7:	56                   	push   %esi
  30aff8:	53                   	push   %ebx
  30aff9:	83 ec 1c             	sub    $0x1c,%esp
  30affc:	b8 03 00 00 00       	mov    $0x3,%eax
  30b001:	bb 01 00 00 00       	mov    $0x1,%ebx
  30b006:	b9 a1 ad 30 00       	mov    $0x30ada1,%ecx
  30b00b:	ba 00 00 00 00       	mov    $0x0,%edx
  30b010:	be 00 00 00 00       	mov    $0x0,%esi
  30b015:	bf 00 00 00 00       	mov    $0x0,%edi
  30b01a:	cd 80                	int    $0x80
  30b01c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30b01f:	b8 03 00 00 00       	mov    $0x3,%eax
  30b024:	bb 00 00 00 00       	mov    $0x0,%ebx
  30b029:	b9 a1 ad 30 00       	mov    $0x30ada1,%ecx
  30b02e:	ba 00 00 00 00       	mov    $0x0,%edx
  30b033:	be 00 00 00 00       	mov    $0x0,%esi
  30b038:	bf 00 00 00 00       	mov    $0x0,%edi
  30b03d:	cd 80                	int    $0x80
  30b03f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30b042:	b8 03 00 00 00       	mov    $0x3,%eax
  30b047:	bb 06 00 00 00       	mov    $0x6,%ebx
  30b04c:	b9 94 ae 30 00       	mov    $0x30ae94,%ecx
  30b051:	ba 00 00 00 00       	mov    $0x0,%edx
  30b056:	be 00 00 00 00       	mov    $0x0,%esi
  30b05b:	bf 00 00 00 00       	mov    $0x0,%edi
  30b060:	cd 80                	int    $0x80
  30b062:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30b065:	83 ec 08             	sub    $0x8,%esp
  30b068:	68 5a ae 30 00       	push   $0x30ae5a
  30b06d:	6a 0e                	push   $0xe
  30b06f:	e8 63 ac ff ff       	call   305cd7 <put_irq_handler>
  30b074:	83 c4 10             	add    $0x10,%esp
  30b077:	b8 0c 00 00 00       	mov    $0xc,%eax
  30b07c:	ba f6 03 00 00       	mov    $0x3f6,%edx
  30b081:	ee                   	out    %al,(%dx)
  30b082:	eb 00                	jmp    30b084 <at_init+0x91>
  30b084:	eb 00                	jmp    30b086 <at_init+0x93>
  30b086:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30b089:	5b                   	pop    %ebx
  30b08a:	5e                   	pop    %esi
  30b08b:	5f                   	pop    %edi
  30b08c:	5d                   	pop    %ebp
  30b08d:	c3                   	ret    

0030b08e <at_main>:
  30b08e:	55                   	push   %ebp
  30b08f:	89 e5                	mov    %esp,%ebp
  30b091:	83 ec 08             	sub    $0x8,%esp
  30b094:	e8 5a ff ff ff       	call   30aff3 <at_init>
  30b099:	e8 36 1b 00 00       	call   30cbd4 <dorun>
  30b09e:	b8 00 00 00 00       	mov    $0x0,%eax
  30b0a3:	c9                   	leave  
  30b0a4:	c3                   	ret    
  30b0a5:	66 90                	xchg   %ax,%ax
  30b0a7:	90                   	nop

0030b0a8 <memcpy>:
  30b0a8:	55                   	push   %ebp
  30b0a9:	89 e5                	mov    %esp,%ebp
  30b0ab:	57                   	push   %edi
  30b0ac:	56                   	push   %esi
  30b0ad:	53                   	push   %ebx
  30b0ae:	8b 45 10             	mov    0x10(%ebp),%eax
  30b0b1:	8b 55 0c             	mov    0xc(%ebp),%edx
  30b0b4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30b0b7:	89 c1                	mov    %eax,%ecx
  30b0b9:	89 d6                	mov    %edx,%esi
  30b0bb:	89 df                	mov    %ebx,%edi
  30b0bd:	fc                   	cld    
  30b0be:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  30b0c0:	8b 45 08             	mov    0x8(%ebp),%eax
  30b0c3:	5b                   	pop    %ebx
  30b0c4:	5e                   	pop    %esi
  30b0c5:	5f                   	pop    %edi
  30b0c6:	5d                   	pop    %ebp
  30b0c7:	c3                   	ret    

0030b0c8 <ramdisk_read>:
  30b0c8:	55                   	push   %ebp
  30b0c9:	89 e5                	mov    %esp,%ebp
  30b0cb:	57                   	push   %edi
  30b0cc:	56                   	push   %esi
  30b0cd:	53                   	push   %ebx
  30b0ce:	83 ec 10             	sub    $0x10,%esp
  30b0d1:	8b 45 08             	mov    0x8(%ebp),%eax
  30b0d4:	8b 40 30             	mov    0x30(%eax),%eax
  30b0d7:	c1 e0 09             	shl    $0x9,%eax
  30b0da:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30b0dd:	8b 45 08             	mov    0x8(%ebp),%eax
  30b0e0:	8b 40 34             	mov    0x34(%eax),%eax
  30b0e3:	c1 e0 09             	shl    $0x9,%eax
  30b0e6:	89 c2                	mov    %eax,%edx
  30b0e8:	a1 2c 50 31 00       	mov    0x31502c,%eax
  30b0ed:	2b 45 f0             	sub    -0x10(%ebp),%eax
  30b0f0:	39 c2                	cmp    %eax,%edx
  30b0f2:	0f 46 c2             	cmovbe %edx,%eax
  30b0f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30b0f8:	8b 55 ec             	mov    -0x14(%ebp),%edx
  30b0fb:	8b 0d 28 50 31 00    	mov    0x315028,%ecx
  30b101:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30b104:	01 c1                	add    %eax,%ecx
  30b106:	8b 45 08             	mov    0x8(%ebp),%eax
  30b109:	8b 40 38             	mov    0x38(%eax),%eax
  30b10c:	52                   	push   %edx
  30b10d:	51                   	push   %ecx
  30b10e:	50                   	push   %eax
  30b10f:	e8 94 ff ff ff       	call   30b0a8 <memcpy>
  30b114:	83 c4 0c             	add    $0xc,%esp
  30b117:	8b 45 08             	mov    0x8(%ebp),%eax
  30b11a:	8b 58 3c             	mov    0x3c(%eax),%ebx
  30b11d:	b8 02 00 00 00       	mov    $0x2,%eax
  30b122:	b9 00 00 00 00       	mov    $0x0,%ecx
  30b127:	ba 00 00 00 00       	mov    $0x0,%edx
  30b12c:	be 00 00 00 00       	mov    $0x0,%esi
  30b131:	bf 00 00 00 00       	mov    $0x0,%edi
  30b136:	cd 80                	int    $0x80
  30b138:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30b13b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30b13e:	5b                   	pop    %ebx
  30b13f:	5e                   	pop    %esi
  30b140:	5f                   	pop    %edi
  30b141:	5d                   	pop    %ebp
  30b142:	c3                   	ret    

0030b143 <ramdisk_write>:
  30b143:	55                   	push   %ebp
  30b144:	89 e5                	mov    %esp,%ebp
  30b146:	57                   	push   %edi
  30b147:	56                   	push   %esi
  30b148:	53                   	push   %ebx
  30b149:	83 ec 10             	sub    $0x10,%esp
  30b14c:	8b 45 08             	mov    0x8(%ebp),%eax
  30b14f:	8b 40 30             	mov    0x30(%eax),%eax
  30b152:	c1 e0 09             	shl    $0x9,%eax
  30b155:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30b158:	8b 45 08             	mov    0x8(%ebp),%eax
  30b15b:	8b 40 34             	mov    0x34(%eax),%eax
  30b15e:	c1 e0 09             	shl    $0x9,%eax
  30b161:	89 c2                	mov    %eax,%edx
  30b163:	a1 2c 50 31 00       	mov    0x31502c,%eax
  30b168:	2b 45 f0             	sub    -0x10(%ebp),%eax
  30b16b:	39 c2                	cmp    %eax,%edx
  30b16d:	0f 46 c2             	cmovbe %edx,%eax
  30b170:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30b173:	8b 55 ec             	mov    -0x14(%ebp),%edx
  30b176:	8b 45 08             	mov    0x8(%ebp),%eax
  30b179:	8b 40 38             	mov    0x38(%eax),%eax
  30b17c:	8b 1d 28 50 31 00    	mov    0x315028,%ebx
  30b182:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  30b185:	01 d9                	add    %ebx,%ecx
  30b187:	52                   	push   %edx
  30b188:	50                   	push   %eax
  30b189:	51                   	push   %ecx
  30b18a:	e8 19 ff ff ff       	call   30b0a8 <memcpy>
  30b18f:	83 c4 0c             	add    $0xc,%esp
  30b192:	8b 45 08             	mov    0x8(%ebp),%eax
  30b195:	8b 58 3c             	mov    0x3c(%eax),%ebx
  30b198:	b8 02 00 00 00       	mov    $0x2,%eax
  30b19d:	b9 00 00 00 00       	mov    $0x0,%ecx
  30b1a2:	ba 00 00 00 00       	mov    $0x0,%edx
  30b1a7:	be 00 00 00 00       	mov    $0x0,%esi
  30b1ac:	bf 00 00 00 00       	mov    $0x0,%edi
  30b1b1:	cd 80                	int    $0x80
  30b1b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30b1b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30b1b9:	5b                   	pop    %ebx
  30b1ba:	5e                   	pop    %esi
  30b1bb:	5f                   	pop    %edi
  30b1bc:	5d                   	pop    %ebp
  30b1bd:	c3                   	ret    

0030b1be <ramdisk_init>:
  30b1be:	55                   	push   %ebp
  30b1bf:	89 e5                	mov    %esp,%ebp
  30b1c1:	57                   	push   %edi
  30b1c2:	56                   	push   %esi
  30b1c3:	53                   	push   %ebx
  30b1c4:	83 ec 10             	sub    $0x10,%esp
  30b1c7:	c7 05 28 50 31 00 00 	movl   $0x315000,0x315028
  30b1ce:	50 31 00 
  30b1d1:	c7 05 2c 50 31 00 00 	movl   $0x28000,0x31502c
  30b1d8:	80 02 00 
  30b1db:	b8 03 00 00 00       	mov    $0x3,%eax
  30b1e0:	bb 01 00 00 00       	mov    $0x1,%ebx
  30b1e5:	b9 43 b1 30 00       	mov    $0x30b143,%ecx
  30b1ea:	ba 00 00 00 00       	mov    $0x0,%edx
  30b1ef:	be 00 00 00 00       	mov    $0x0,%esi
  30b1f4:	bf 00 00 00 00       	mov    $0x0,%edi
  30b1f9:	cd 80                	int    $0x80
  30b1fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30b1fe:	b8 03 00 00 00       	mov    $0x3,%eax
  30b203:	bb 00 00 00 00       	mov    $0x0,%ebx
  30b208:	b9 c8 b0 30 00       	mov    $0x30b0c8,%ecx
  30b20d:	ba 00 00 00 00       	mov    $0x0,%edx
  30b212:	be 00 00 00 00       	mov    $0x0,%esi
  30b217:	bf 00 00 00 00       	mov    $0x0,%edi
  30b21c:	cd 80                	int    $0x80
  30b21e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30b221:	83 c4 10             	add    $0x10,%esp
  30b224:	5b                   	pop    %ebx
  30b225:	5e                   	pop    %esi
  30b226:	5f                   	pop    %edi
  30b227:	5d                   	pop    %ebp
  30b228:	c3                   	ret    

0030b229 <ramdisk_main>:
  30b229:	55                   	push   %ebp
  30b22a:	89 e5                	mov    %esp,%ebp
  30b22c:	83 ec 08             	sub    $0x8,%esp
  30b22f:	e8 8a ff ff ff       	call   30b1be <ramdisk_init>
  30b234:	e8 9b 19 00 00       	call   30cbd4 <dorun>
  30b239:	b8 00 00 00 00       	mov    $0x0,%eax
  30b23e:	c9                   	leave  
  30b23f:	c3                   	ret    

0030b240 <set_top>:
  30b240:	55                   	push   %ebp
  30b241:	89 e5                	mov    %esp,%ebp
  30b243:	a1 44 50 31 00       	mov    0x315044,%eax
  30b248:	39 45 08             	cmp    %eax,0x8(%ebp)
  30b24b:	74 05                	je     30b252 <set_top+0x12>
  30b24d:	e9 81 00 00 00       	jmp    30b2d3 <set_top+0x93>
  30b252:	b8 0c 00 00 00       	mov    $0xc,%eax
  30b257:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30b25c:	ee                   	out    %al,(%dx)
  30b25d:	eb 00                	jmp    30b25f <set_top+0x1f>
  30b25f:	eb 00                	jmp    30b261 <set_top+0x21>
  30b261:	8b 45 08             	mov    0x8(%ebp),%eax
  30b264:	c1 e0 02             	shl    $0x2,%eax
  30b267:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b26e:	29 c2                	sub    %eax,%edx
  30b270:	89 d0                	mov    %edx,%eax
  30b272:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b277:	8b 50 0c             	mov    0xc(%eax),%edx
  30b27a:	a1 34 50 31 00       	mov    0x315034,%eax
  30b27f:	29 c2                	sub    %eax,%edx
  30b281:	89 d0                	mov    %edx,%eax
  30b283:	c1 e8 09             	shr    $0x9,%eax
  30b286:	0f b6 c0             	movzbl %al,%eax
  30b289:	ba d5 03 00 00       	mov    $0x3d5,%edx
  30b28e:	ee                   	out    %al,(%dx)
  30b28f:	eb 00                	jmp    30b291 <set_top+0x51>
  30b291:	eb 00                	jmp    30b293 <set_top+0x53>
  30b293:	b8 0d 00 00 00       	mov    $0xd,%eax
  30b298:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30b29d:	ee                   	out    %al,(%dx)
  30b29e:	eb 00                	jmp    30b2a0 <set_top+0x60>
  30b2a0:	eb 00                	jmp    30b2a2 <set_top+0x62>
  30b2a2:	8b 45 08             	mov    0x8(%ebp),%eax
  30b2a5:	c1 e0 02             	shl    $0x2,%eax
  30b2a8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b2af:	29 c2                	sub    %eax,%edx
  30b2b1:	89 d0                	mov    %edx,%eax
  30b2b3:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b2b8:	8b 50 0c             	mov    0xc(%eax),%edx
  30b2bb:	a1 34 50 31 00       	mov    0x315034,%eax
  30b2c0:	29 c2                	sub    %eax,%edx
  30b2c2:	89 d0                	mov    %edx,%eax
  30b2c4:	d1 e8                	shr    %eax
  30b2c6:	0f b6 c0             	movzbl %al,%eax
  30b2c9:	ba d5 03 00 00       	mov    $0x3d5,%edx
  30b2ce:	ee                   	out    %al,(%dx)
  30b2cf:	eb 00                	jmp    30b2d1 <set_top+0x91>
  30b2d1:	eb 00                	jmp    30b2d3 <set_top+0x93>
  30b2d3:	5d                   	pop    %ebp
  30b2d4:	c3                   	ret    

0030b2d5 <set_cur>:
  30b2d5:	55                   	push   %ebp
  30b2d6:	89 e5                	mov    %esp,%ebp
  30b2d8:	a1 44 50 31 00       	mov    0x315044,%eax
  30b2dd:	39 45 08             	cmp    %eax,0x8(%ebp)
  30b2e0:	74 05                	je     30b2e7 <set_cur+0x12>
  30b2e2:	e9 81 00 00 00       	jmp    30b368 <set_cur+0x93>
  30b2e7:	b8 0e 00 00 00       	mov    $0xe,%eax
  30b2ec:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30b2f1:	ee                   	out    %al,(%dx)
  30b2f2:	eb 00                	jmp    30b2f4 <set_cur+0x1f>
  30b2f4:	eb 00                	jmp    30b2f6 <set_cur+0x21>
  30b2f6:	8b 45 08             	mov    0x8(%ebp),%eax
  30b2f9:	c1 e0 02             	shl    $0x2,%eax
  30b2fc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b303:	29 c2                	sub    %eax,%edx
  30b305:	89 d0                	mov    %edx,%eax
  30b307:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b30c:	8b 50 04             	mov    0x4(%eax),%edx
  30b30f:	a1 34 50 31 00       	mov    0x315034,%eax
  30b314:	29 c2                	sub    %eax,%edx
  30b316:	89 d0                	mov    %edx,%eax
  30b318:	c1 e8 09             	shr    $0x9,%eax
  30b31b:	0f b6 c0             	movzbl %al,%eax
  30b31e:	ba d5 03 00 00       	mov    $0x3d5,%edx
  30b323:	ee                   	out    %al,(%dx)
  30b324:	eb 00                	jmp    30b326 <set_cur+0x51>
  30b326:	eb 00                	jmp    30b328 <set_cur+0x53>
  30b328:	b8 0f 00 00 00       	mov    $0xf,%eax
  30b32d:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30b332:	ee                   	out    %al,(%dx)
  30b333:	eb 00                	jmp    30b335 <set_cur+0x60>
  30b335:	eb 00                	jmp    30b337 <set_cur+0x62>
  30b337:	8b 45 08             	mov    0x8(%ebp),%eax
  30b33a:	c1 e0 02             	shl    $0x2,%eax
  30b33d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b344:	29 c2                	sub    %eax,%edx
  30b346:	89 d0                	mov    %edx,%eax
  30b348:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b34d:	8b 50 04             	mov    0x4(%eax),%edx
  30b350:	a1 34 50 31 00       	mov    0x315034,%eax
  30b355:	29 c2                	sub    %eax,%edx
  30b357:	89 d0                	mov    %edx,%eax
  30b359:	d1 e8                	shr    %eax
  30b35b:	0f b6 c0             	movzbl %al,%eax
  30b35e:	ba d5 03 00 00       	mov    $0x3d5,%edx
  30b363:	ee                   	out    %al,(%dx)
  30b364:	eb 00                	jmp    30b366 <set_cur+0x91>
  30b366:	eb 00                	jmp    30b368 <set_cur+0x93>
  30b368:	5d                   	pop    %ebp
  30b369:	c3                   	ret    

0030b36a <scrup>:
  30b36a:	55                   	push   %ebp
  30b36b:	89 e5                	mov    %esp,%ebp
  30b36d:	8b 45 08             	mov    0x8(%ebp),%eax
  30b370:	c1 e0 02             	shl    $0x2,%eax
  30b373:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b37a:	29 c2                	sub    %eax,%edx
  30b37c:	89 d0                	mov    %edx,%eax
  30b37e:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b383:	8b 10                	mov    (%eax),%edx
  30b385:	8b 45 08             	mov    0x8(%ebp),%eax
  30b388:	c1 e0 02             	shl    $0x2,%eax
  30b38b:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b392:	29 c1                	sub    %eax,%ecx
  30b394:	89 c8                	mov    %ecx,%eax
  30b396:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b39b:	8b 40 04             	mov    0x4(%eax),%eax
  30b39e:	39 c2                	cmp    %eax,%edx
  30b3a0:	76 02                	jbe    30b3a4 <scrup+0x3a>
  30b3a2:	eb 7b                	jmp    30b41f <scrup+0xb5>
  30b3a4:	8b 45 08             	mov    0x8(%ebp),%eax
  30b3a7:	c1 e0 02             	shl    $0x2,%eax
  30b3aa:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b3b1:	29 c2                	sub    %eax,%edx
  30b3b3:	89 d0                	mov    %edx,%eax
  30b3b5:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b3ba:	8b 50 0c             	mov    0xc(%eax),%edx
  30b3bd:	a1 40 50 31 00       	mov    0x315040,%eax
  30b3c2:	01 c2                	add    %eax,%edx
  30b3c4:	8b 45 08             	mov    0x8(%ebp),%eax
  30b3c7:	c1 e0 02             	shl    $0x2,%eax
  30b3ca:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b3d1:	29 c1                	sub    %eax,%ecx
  30b3d3:	89 c8                	mov    %ecx,%eax
  30b3d5:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b3da:	89 50 0c             	mov    %edx,0xc(%eax)
  30b3dd:	8b 45 08             	mov    0x8(%ebp),%eax
  30b3e0:	c1 e0 02             	shl    $0x2,%eax
  30b3e3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b3ea:	29 c2                	sub    %eax,%edx
  30b3ec:	89 d0                	mov    %edx,%eax
  30b3ee:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b3f3:	8b 10                	mov    (%eax),%edx
  30b3f5:	a1 40 50 31 00       	mov    0x315040,%eax
  30b3fa:	01 c2                	add    %eax,%edx
  30b3fc:	8b 45 08             	mov    0x8(%ebp),%eax
  30b3ff:	c1 e0 02             	shl    $0x2,%eax
  30b402:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b409:	29 c1                	sub    %eax,%ecx
  30b40b:	89 c8                	mov    %ecx,%eax
  30b40d:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b412:	89 10                	mov    %edx,(%eax)
  30b414:	ff 75 08             	pushl  0x8(%ebp)
  30b417:	e8 24 fe ff ff       	call   30b240 <set_top>
  30b41c:	83 c4 04             	add    $0x4,%esp
  30b41f:	c9                   	leave  
  30b420:	c3                   	ret    

0030b421 <scrtop>:
  30b421:	55                   	push   %ebp
  30b422:	89 e5                	mov    %esp,%ebp
  30b424:	57                   	push   %edi
  30b425:	56                   	push   %esi
  30b426:	53                   	push   %ebx
  30b427:	8b 45 08             	mov    0x8(%ebp),%eax
  30b42a:	c1 e0 02             	shl    $0x2,%eax
  30b42d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b434:	29 c2                	sub    %eax,%edx
  30b436:	89 d0                	mov    %edx,%eax
  30b438:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b43d:	8b 10                	mov    (%eax),%edx
  30b43f:	8b 45 08             	mov    0x8(%ebp),%eax
  30b442:	c1 e0 02             	shl    $0x2,%eax
  30b445:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b44c:	29 c1                	sub    %eax,%ecx
  30b44e:	89 c8                	mov    %ecx,%eax
  30b450:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b455:	8b 40 08             	mov    0x8(%eax),%eax
  30b458:	39 c2                	cmp    %eax,%edx
  30b45a:	0f 86 76 01 00 00    	jbe    30b5d6 <scrtop+0x1b5>
  30b460:	a1 3c 50 31 00       	mov    0x31503c,%eax
  30b465:	8d 50 ff             	lea    -0x1(%eax),%edx
  30b468:	a1 40 50 31 00       	mov    0x315040,%eax
  30b46d:	0f af c2             	imul   %edx,%eax
  30b470:	c1 e8 02             	shr    $0x2,%eax
  30b473:	89 c1                	mov    %eax,%ecx
  30b475:	8b 45 08             	mov    0x8(%ebp),%eax
  30b478:	c1 e0 02             	shl    $0x2,%eax
  30b47b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b482:	29 c2                	sub    %eax,%edx
  30b484:	89 d0                	mov    %edx,%eax
  30b486:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b48b:	8b 50 04             	mov    0x4(%eax),%edx
  30b48e:	8b 45 08             	mov    0x8(%ebp),%eax
  30b491:	c1 e0 02             	shl    $0x2,%eax
  30b494:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  30b49b:	29 c3                	sub    %eax,%ebx
  30b49d:	89 d8                	mov    %ebx,%eax
  30b49f:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b4a4:	8b 58 0c             	mov    0xc(%eax),%ebx
  30b4a7:	8b 45 08             	mov    0x8(%ebp),%eax
  30b4aa:	c1 e0 02             	shl    $0x2,%eax
  30b4ad:	8d 34 c5 00 00 00 00 	lea    0x0(,%eax,8),%esi
  30b4b4:	29 c6                	sub    %eax,%esi
  30b4b6:	89 f0                	mov    %esi,%eax
  30b4b8:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b4bd:	0f b7 40 02          	movzwl 0x2(%eax),%eax
  30b4c1:	89 d7                	mov    %edx,%edi
  30b4c3:	89 de                	mov    %ebx,%esi
  30b4c5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  30b4c7:	8b 0d 38 50 31 00    	mov    0x315038,%ecx
  30b4cd:	66 f3 ab             	rep stos %ax,%es:(%edi)
  30b4d0:	8b 45 08             	mov    0x8(%ebp),%eax
  30b4d3:	c1 e0 02             	shl    $0x2,%eax
  30b4d6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b4dd:	29 c2                	sub    %eax,%edx
  30b4df:	89 d0                	mov    %edx,%eax
  30b4e1:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b4e6:	8b 10                	mov    (%eax),%edx
  30b4e8:	8b 45 08             	mov    0x8(%ebp),%eax
  30b4eb:	c1 e0 02             	shl    $0x2,%eax
  30b4ee:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b4f5:	29 c1                	sub    %eax,%ecx
  30b4f7:	89 c8                	mov    %ecx,%eax
  30b4f9:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b4fe:	8b 48 04             	mov    0x4(%eax),%ecx
  30b501:	8b 45 08             	mov    0x8(%ebp),%eax
  30b504:	c1 e0 02             	shl    $0x2,%eax
  30b507:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  30b50e:	29 c3                	sub    %eax,%ebx
  30b510:	89 d8                	mov    %ebx,%eax
  30b512:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b517:	8b 40 0c             	mov    0xc(%eax),%eax
  30b51a:	29 c1                	sub    %eax,%ecx
  30b51c:	89 c8                	mov    %ecx,%eax
  30b51e:	01 c2                	add    %eax,%edx
  30b520:	8b 45 08             	mov    0x8(%ebp),%eax
  30b523:	c1 e0 02             	shl    $0x2,%eax
  30b526:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b52d:	29 c1                	sub    %eax,%ecx
  30b52f:	89 c8                	mov    %ecx,%eax
  30b531:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b536:	89 10                	mov    %edx,(%eax)
  30b538:	8b 45 08             	mov    0x8(%ebp),%eax
  30b53b:	c1 e0 02             	shl    $0x2,%eax
  30b53e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b545:	29 c2                	sub    %eax,%edx
  30b547:	89 d0                	mov    %edx,%eax
  30b549:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b54e:	8b 50 04             	mov    0x4(%eax),%edx
  30b551:	8b 45 08             	mov    0x8(%ebp),%eax
  30b554:	c1 e0 02             	shl    $0x2,%eax
  30b557:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b55e:	29 c1                	sub    %eax,%ecx
  30b560:	89 c8                	mov    %ecx,%eax
  30b562:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b567:	8b 48 04             	mov    0x4(%eax),%ecx
  30b56a:	8b 45 08             	mov    0x8(%ebp),%eax
  30b56d:	c1 e0 02             	shl    $0x2,%eax
  30b570:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  30b577:	29 c3                	sub    %eax,%ebx
  30b579:	89 d8                	mov    %ebx,%eax
  30b57b:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b580:	8b 40 0c             	mov    0xc(%eax),%eax
  30b583:	29 c1                	sub    %eax,%ecx
  30b585:	89 c8                	mov    %ecx,%eax
  30b587:	01 c2                	add    %eax,%edx
  30b589:	8b 45 08             	mov    0x8(%ebp),%eax
  30b58c:	c1 e0 02             	shl    $0x2,%eax
  30b58f:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b596:	29 c1                	sub    %eax,%ecx
  30b598:	89 c8                	mov    %ecx,%eax
  30b59a:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b59f:	89 50 04             	mov    %edx,0x4(%eax)
  30b5a2:	8b 45 08             	mov    0x8(%ebp),%eax
  30b5a5:	c1 e0 02             	shl    $0x2,%eax
  30b5a8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b5af:	29 c2                	sub    %eax,%edx
  30b5b1:	89 d0                	mov    %edx,%eax
  30b5b3:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b5b8:	8b 50 04             	mov    0x4(%eax),%edx
  30b5bb:	8b 45 08             	mov    0x8(%ebp),%eax
  30b5be:	c1 e0 02             	shl    $0x2,%eax
  30b5c1:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b5c8:	29 c1                	sub    %eax,%ecx
  30b5ca:	89 c8                	mov    %ecx,%eax
  30b5cc:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b5d1:	89 50 0c             	mov    %edx,0xc(%eax)
  30b5d4:	eb 3d                	jmp    30b613 <scrtop+0x1f2>
  30b5d6:	8b 45 08             	mov    0x8(%ebp),%eax
  30b5d9:	c1 e0 02             	shl    $0x2,%eax
  30b5dc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b5e3:	29 c2                	sub    %eax,%edx
  30b5e5:	89 d0                	mov    %edx,%eax
  30b5e7:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b5ec:	8b 10                	mov    (%eax),%edx
  30b5ee:	8b 0d 38 50 31 00    	mov    0x315038,%ecx
  30b5f4:	8b 45 08             	mov    0x8(%ebp),%eax
  30b5f7:	c1 e0 02             	shl    $0x2,%eax
  30b5fa:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  30b601:	29 c3                	sub    %eax,%ebx
  30b603:	89 d8                	mov    %ebx,%eax
  30b605:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b60a:	0f b7 40 02          	movzwl 0x2(%eax),%eax
  30b60e:	89 d7                	mov    %edx,%edi
  30b610:	66 f3 ab             	rep stos %ax,%es:(%edi)
  30b613:	ff 75 08             	pushl  0x8(%ebp)
  30b616:	e8 25 fc ff ff       	call   30b240 <set_top>
  30b61b:	83 c4 04             	add    $0x4,%esp
  30b61e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30b621:	5b                   	pop    %ebx
  30b622:	5e                   	pop    %esi
  30b623:	5f                   	pop    %edi
  30b624:	5d                   	pop    %ebp
  30b625:	c3                   	ret    

0030b626 <scrdown>:
  30b626:	55                   	push   %ebp
  30b627:	89 e5                	mov    %esp,%ebp
  30b629:	8b 45 08             	mov    0x8(%ebp),%eax
  30b62c:	c1 e0 02             	shl    $0x2,%eax
  30b62f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b636:	29 c2                	sub    %eax,%edx
  30b638:	89 d0                	mov    %edx,%eax
  30b63a:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b63f:	8b 50 0c             	mov    0xc(%eax),%edx
  30b642:	a1 40 50 31 00       	mov    0x315040,%eax
  30b647:	89 d1                	mov    %edx,%ecx
  30b649:	29 c1                	sub    %eax,%ecx
  30b64b:	8b 45 08             	mov    0x8(%ebp),%eax
  30b64e:	c1 e0 02             	shl    $0x2,%eax
  30b651:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b658:	29 c2                	sub    %eax,%edx
  30b65a:	89 d0                	mov    %edx,%eax
  30b65c:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b661:	8b 40 04             	mov    0x4(%eax),%eax
  30b664:	39 c1                	cmp    %eax,%ecx
  30b666:	77 02                	ja     30b66a <scrdown+0x44>
  30b668:	eb 7b                	jmp    30b6e5 <scrdown+0xbf>
  30b66a:	8b 45 08             	mov    0x8(%ebp),%eax
  30b66d:	c1 e0 02             	shl    $0x2,%eax
  30b670:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b677:	29 c2                	sub    %eax,%edx
  30b679:	89 d0                	mov    %edx,%eax
  30b67b:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b680:	8b 50 0c             	mov    0xc(%eax),%edx
  30b683:	a1 40 50 31 00       	mov    0x315040,%eax
  30b688:	29 c2                	sub    %eax,%edx
  30b68a:	8b 45 08             	mov    0x8(%ebp),%eax
  30b68d:	c1 e0 02             	shl    $0x2,%eax
  30b690:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b697:	29 c1                	sub    %eax,%ecx
  30b699:	89 c8                	mov    %ecx,%eax
  30b69b:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b6a0:	89 50 0c             	mov    %edx,0xc(%eax)
  30b6a3:	8b 45 08             	mov    0x8(%ebp),%eax
  30b6a6:	c1 e0 02             	shl    $0x2,%eax
  30b6a9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b6b0:	29 c2                	sub    %eax,%edx
  30b6b2:	89 d0                	mov    %edx,%eax
  30b6b4:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b6b9:	8b 10                	mov    (%eax),%edx
  30b6bb:	a1 40 50 31 00       	mov    0x315040,%eax
  30b6c0:	29 c2                	sub    %eax,%edx
  30b6c2:	8b 45 08             	mov    0x8(%ebp),%eax
  30b6c5:	c1 e0 02             	shl    $0x2,%eax
  30b6c8:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b6cf:	29 c1                	sub    %eax,%ecx
  30b6d1:	89 c8                	mov    %ecx,%eax
  30b6d3:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b6d8:	89 10                	mov    %edx,(%eax)
  30b6da:	ff 75 08             	pushl  0x8(%ebp)
  30b6dd:	e8 5e fb ff ff       	call   30b240 <set_top>
  30b6e2:	83 c4 04             	add    $0x4,%esp
  30b6e5:	c9                   	leave  
  30b6e6:	c3                   	ret    

0030b6e7 <lf>:
  30b6e7:	55                   	push   %ebp
  30b6e8:	89 e5                	mov    %esp,%ebp
  30b6ea:	8b 45 08             	mov    0x8(%ebp),%eax
  30b6ed:	c1 e0 02             	shl    $0x2,%eax
  30b6f0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b6f7:	29 c2                	sub    %eax,%edx
  30b6f9:	89 d0                	mov    %edx,%eax
  30b6fb:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b700:	8b 50 04             	mov    0x4(%eax),%edx
  30b703:	a1 40 50 31 00       	mov    0x315040,%eax
  30b708:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  30b70b:	8b 45 08             	mov    0x8(%ebp),%eax
  30b70e:	c1 e0 02             	shl    $0x2,%eax
  30b711:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b718:	29 c2                	sub    %eax,%edx
  30b71a:	89 d0                	mov    %edx,%eax
  30b71c:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b721:	8b 00                	mov    (%eax),%eax
  30b723:	39 c1                	cmp    %eax,%ecx
  30b725:	76 0b                	jbe    30b732 <lf+0x4b>
  30b727:	ff 75 08             	pushl  0x8(%ebp)
  30b72a:	e8 f2 fc ff ff       	call   30b421 <scrtop>
  30b72f:	83 c4 04             	add    $0x4,%esp
  30b732:	8b 45 08             	mov    0x8(%ebp),%eax
  30b735:	c1 e0 02             	shl    $0x2,%eax
  30b738:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b73f:	29 c2                	sub    %eax,%edx
  30b741:	89 d0                	mov    %edx,%eax
  30b743:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b748:	8b 50 04             	mov    0x4(%eax),%edx
  30b74b:	a1 40 50 31 00       	mov    0x315040,%eax
  30b750:	01 c2                	add    %eax,%edx
  30b752:	8b 45 08             	mov    0x8(%ebp),%eax
  30b755:	c1 e0 02             	shl    $0x2,%eax
  30b758:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b75f:	29 c1                	sub    %eax,%ecx
  30b761:	89 c8                	mov    %ecx,%eax
  30b763:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b768:	89 50 04             	mov    %edx,0x4(%eax)
  30b76b:	ff 75 08             	pushl  0x8(%ebp)
  30b76e:	e8 62 fb ff ff       	call   30b2d5 <set_cur>
  30b773:	83 c4 04             	add    $0x4,%esp
  30b776:	c9                   	leave  
  30b777:	c3                   	ret    

0030b778 <cr>:
  30b778:	55                   	push   %ebp
  30b779:	89 e5                	mov    %esp,%ebp
  30b77b:	53                   	push   %ebx
  30b77c:	8b 45 08             	mov    0x8(%ebp),%eax
  30b77f:	c1 e0 02             	shl    $0x2,%eax
  30b782:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b789:	29 c2                	sub    %eax,%edx
  30b78b:	89 d0                	mov    %edx,%eax
  30b78d:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b792:	8b 48 04             	mov    0x4(%eax),%ecx
  30b795:	8b 45 08             	mov    0x8(%ebp),%eax
  30b798:	c1 e0 02             	shl    $0x2,%eax
  30b79b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b7a2:	29 c2                	sub    %eax,%edx
  30b7a4:	89 d0                	mov    %edx,%eax
  30b7a6:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b7ab:	8b 50 04             	mov    0x4(%eax),%edx
  30b7ae:	8b 45 08             	mov    0x8(%ebp),%eax
  30b7b1:	c1 e0 02             	shl    $0x2,%eax
  30b7b4:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  30b7bb:	29 c3                	sub    %eax,%ebx
  30b7bd:	89 d8                	mov    %ebx,%eax
  30b7bf:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b7c4:	8b 40 04             	mov    0x4(%eax),%eax
  30b7c7:	29 c2                	sub    %eax,%edx
  30b7c9:	89 d0                	mov    %edx,%eax
  30b7cb:	8b 1d 40 50 31 00    	mov    0x315040,%ebx
  30b7d1:	ba 00 00 00 00       	mov    $0x0,%edx
  30b7d6:	f7 f3                	div    %ebx
  30b7d8:	89 d0                	mov    %edx,%eax
  30b7da:	29 c1                	sub    %eax,%ecx
  30b7dc:	89 ca                	mov    %ecx,%edx
  30b7de:	8b 45 08             	mov    0x8(%ebp),%eax
  30b7e1:	c1 e0 02             	shl    $0x2,%eax
  30b7e4:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b7eb:	29 c1                	sub    %eax,%ecx
  30b7ed:	89 c8                	mov    %ecx,%eax
  30b7ef:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b7f4:	89 50 04             	mov    %edx,0x4(%eax)
  30b7f7:	ff 75 08             	pushl  0x8(%ebp)
  30b7fa:	e8 d6 fa ff ff       	call   30b2d5 <set_cur>
  30b7ff:	83 c4 04             	add    $0x4,%esp
  30b802:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  30b805:	c9                   	leave  
  30b806:	c3                   	ret    

0030b807 <del>:
  30b807:	55                   	push   %ebp
  30b808:	89 e5                	mov    %esp,%ebp
  30b80a:	8b 45 08             	mov    0x8(%ebp),%eax
  30b80d:	c1 e0 02             	shl    $0x2,%eax
  30b810:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b817:	29 c2                	sub    %eax,%edx
  30b819:	89 d0                	mov    %edx,%eax
  30b81b:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b820:	8b 50 04             	mov    0x4(%eax),%edx
  30b823:	8b 45 08             	mov    0x8(%ebp),%eax
  30b826:	c1 e0 02             	shl    $0x2,%eax
  30b829:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b830:	29 c1                	sub    %eax,%ecx
  30b832:	89 c8                	mov    %ecx,%eax
  30b834:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b839:	8b 40 04             	mov    0x4(%eax),%eax
  30b83c:	29 c2                	sub    %eax,%edx
  30b83e:	89 d0                	mov    %edx,%eax
  30b840:	8b 0d 40 50 31 00    	mov    0x315040,%ecx
  30b846:	ba 00 00 00 00       	mov    $0x0,%edx
  30b84b:	f7 f1                	div    %ecx
  30b84d:	89 d0                	mov    %edx,%eax
  30b84f:	85 c0                	test   %eax,%eax
  30b851:	74 6d                	je     30b8c0 <del+0xb9>
  30b853:	8b 45 08             	mov    0x8(%ebp),%eax
  30b856:	c1 e0 02             	shl    $0x2,%eax
  30b859:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b860:	29 c2                	sub    %eax,%edx
  30b862:	89 d0                	mov    %edx,%eax
  30b864:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b869:	8b 40 04             	mov    0x4(%eax),%eax
  30b86c:	8d 50 fe             	lea    -0x2(%eax),%edx
  30b86f:	8b 45 08             	mov    0x8(%ebp),%eax
  30b872:	c1 e0 02             	shl    $0x2,%eax
  30b875:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b87c:	29 c1                	sub    %eax,%ecx
  30b87e:	89 c8                	mov    %ecx,%eax
  30b880:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b885:	89 50 04             	mov    %edx,0x4(%eax)
  30b888:	8b 45 08             	mov    0x8(%ebp),%eax
  30b88b:	c1 e0 02             	shl    $0x2,%eax
  30b88e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b895:	29 c2                	sub    %eax,%edx
  30b897:	89 d0                	mov    %edx,%eax
  30b899:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b89e:	8b 40 04             	mov    0x4(%eax),%eax
  30b8a1:	89 c2                	mov    %eax,%edx
  30b8a3:	8b 45 08             	mov    0x8(%ebp),%eax
  30b8a6:	c1 e0 02             	shl    $0x2,%eax
  30b8a9:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b8b0:	29 c1                	sub    %eax,%ecx
  30b8b2:	89 c8                	mov    %ecx,%eax
  30b8b4:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b8b9:	0f b7 40 02          	movzwl 0x2(%eax),%eax
  30b8bd:	66 89 02             	mov    %ax,(%edx)
  30b8c0:	ff 75 08             	pushl  0x8(%ebp)
  30b8c3:	e8 0d fa ff ff       	call   30b2d5 <set_cur>
  30b8c8:	83 c4 04             	add    $0x4,%esp
  30b8cb:	c9                   	leave  
  30b8cc:	c3                   	ret    

0030b8cd <insert>:
  30b8cd:	55                   	push   %ebp
  30b8ce:	89 e5                	mov    %esp,%ebp
  30b8d0:	53                   	push   %ebx
  30b8d1:	83 ec 04             	sub    $0x4,%esp
  30b8d4:	8b 45 0c             	mov    0xc(%ebp),%eax
  30b8d7:	88 45 f8             	mov    %al,-0x8(%ebp)
  30b8da:	8b 45 08             	mov    0x8(%ebp),%eax
  30b8dd:	c1 e0 02             	shl    $0x2,%eax
  30b8e0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b8e7:	29 c2                	sub    %eax,%edx
  30b8e9:	89 d0                	mov    %edx,%eax
  30b8eb:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b8f0:	8b 40 04             	mov    0x4(%eax),%eax
  30b8f3:	89 c2                	mov    %eax,%edx
  30b8f5:	0f b6 4d f8          	movzbl -0x8(%ebp),%ecx
  30b8f9:	8b 45 08             	mov    0x8(%ebp),%eax
  30b8fc:	c1 e0 02             	shl    $0x2,%eax
  30b8ff:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  30b906:	29 c3                	sub    %eax,%ebx
  30b908:	89 d8                	mov    %ebx,%eax
  30b90a:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30b90f:	0f b6 00             	movzbl (%eax),%eax
  30b912:	0f b6 c0             	movzbl %al,%eax
  30b915:	c1 e0 08             	shl    $0x8,%eax
  30b918:	09 c8                	or     %ecx,%eax
  30b91a:	66 89 02             	mov    %ax,(%edx)
  30b91d:	8b 45 08             	mov    0x8(%ebp),%eax
  30b920:	c1 e0 02             	shl    $0x2,%eax
  30b923:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b92a:	29 c2                	sub    %eax,%edx
  30b92c:	89 d0                	mov    %edx,%eax
  30b92e:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b933:	8b 40 04             	mov    0x4(%eax),%eax
  30b936:	8d 48 02             	lea    0x2(%eax),%ecx
  30b939:	8b 45 08             	mov    0x8(%ebp),%eax
  30b93c:	c1 e0 02             	shl    $0x2,%eax
  30b93f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b946:	29 c2                	sub    %eax,%edx
  30b948:	89 d0                	mov    %edx,%eax
  30b94a:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b94f:	8b 00                	mov    (%eax),%eax
  30b951:	39 c1                	cmp    %eax,%ecx
  30b953:	76 0b                	jbe    30b960 <insert+0x93>
  30b955:	ff 75 08             	pushl  0x8(%ebp)
  30b958:	e8 0d fa ff ff       	call   30b36a <scrup>
  30b95d:	83 c4 04             	add    $0x4,%esp
  30b960:	8b 45 08             	mov    0x8(%ebp),%eax
  30b963:	c1 e0 02             	shl    $0x2,%eax
  30b966:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b96d:	29 c2                	sub    %eax,%edx
  30b96f:	89 d0                	mov    %edx,%eax
  30b971:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b976:	8b 40 04             	mov    0x4(%eax),%eax
  30b979:	8d 50 02             	lea    0x2(%eax),%edx
  30b97c:	8b 45 08             	mov    0x8(%ebp),%eax
  30b97f:	c1 e0 02             	shl    $0x2,%eax
  30b982:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30b989:	29 c1                	sub    %eax,%ecx
  30b98b:	89 c8                	mov    %ecx,%eax
  30b98d:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b992:	89 50 04             	mov    %edx,0x4(%eax)
  30b995:	ff 75 08             	pushl  0x8(%ebp)
  30b998:	e8 38 f9 ff ff       	call   30b2d5 <set_cur>
  30b99d:	83 c4 04             	add    $0x4,%esp
  30b9a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  30b9a3:	c9                   	leave  
  30b9a4:	c3                   	ret    

0030b9a5 <cons_print>:
  30b9a5:	55                   	push   %ebp
  30b9a6:	89 e5                	mov    %esp,%ebp
  30b9a8:	83 ec 10             	sub    $0x10,%esp
  30b9ab:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30b9b2:	e9 ab 05 00 00       	jmp    30bf62 <cons_print+0x5bd>
  30b9b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  30b9ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  30b9bd:	01 d0                	add    %edx,%eax
  30b9bf:	0f b6 00             	movzbl (%eax),%eax
  30b9c2:	88 45 fb             	mov    %al,-0x5(%ebp)
  30b9c5:	8b 45 08             	mov    0x8(%ebp),%eax
  30b9c8:	c1 e0 02             	shl    $0x2,%eax
  30b9cb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30b9d2:	29 c2                	sub    %eax,%edx
  30b9d4:	89 d0                	mov    %edx,%eax
  30b9d6:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30b9db:	8b 40 08             	mov    0x8(%eax),%eax
  30b9de:	83 f8 01             	cmp    $0x1,%eax
  30b9e1:	0f 85 11 05 00 00    	jne    30bef8 <cons_print+0x553>
  30b9e7:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  30b9eb:	83 e8 42             	sub    $0x42,%eax
  30b9ee:	83 f8 37             	cmp    $0x37,%eax
  30b9f1:	0f 87 e2 04 00 00    	ja     30bed9 <cons_print+0x534>
  30b9f7:	8b 04 85 a0 e4 30 00 	mov    0x30e4a0(,%eax,4),%eax
  30b9fe:	ff e0                	jmp    *%eax
  30ba00:	8b 45 08             	mov    0x8(%ebp),%eax
  30ba03:	c1 e0 02             	shl    $0x2,%eax
  30ba06:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30ba0d:	29 c2                	sub    %eax,%edx
  30ba0f:	89 d0                	mov    %edx,%eax
  30ba11:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30ba16:	0f b6 00             	movzbl (%eax),%eax
  30ba19:	83 e0 f0             	and    $0xfffffff0,%eax
  30ba1c:	89 c2                	mov    %eax,%edx
  30ba1e:	8b 45 08             	mov    0x8(%ebp),%eax
  30ba21:	c1 e0 02             	shl    $0x2,%eax
  30ba24:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30ba2b:	29 c1                	sub    %eax,%ecx
  30ba2d:	89 c8                	mov    %ecx,%eax
  30ba2f:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30ba34:	88 10                	mov    %dl,(%eax)
  30ba36:	e9 9e 04 00 00       	jmp    30bed9 <cons_print+0x534>
  30ba3b:	8b 45 08             	mov    0x8(%ebp),%eax
  30ba3e:	c1 e0 02             	shl    $0x2,%eax
  30ba41:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30ba48:	29 c2                	sub    %eax,%edx
  30ba4a:	89 d0                	mov    %edx,%eax
  30ba4c:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30ba51:	0f b6 00             	movzbl (%eax),%eax
  30ba54:	83 e0 0f             	and    $0xf,%eax
  30ba57:	89 c2                	mov    %eax,%edx
  30ba59:	8b 45 08             	mov    0x8(%ebp),%eax
  30ba5c:	c1 e0 02             	shl    $0x2,%eax
  30ba5f:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30ba66:	29 c1                	sub    %eax,%ecx
  30ba68:	89 c8                	mov    %ecx,%eax
  30ba6a:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30ba6f:	88 10                	mov    %dl,(%eax)
  30ba71:	e9 63 04 00 00       	jmp    30bed9 <cons_print+0x534>
  30ba76:	8b 45 08             	mov    0x8(%ebp),%eax
  30ba79:	c1 e0 02             	shl    $0x2,%eax
  30ba7c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30ba83:	29 c2                	sub    %eax,%edx
  30ba85:	89 d0                	mov    %edx,%eax
  30ba87:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30ba8c:	0f b6 00             	movzbl (%eax),%eax
  30ba8f:	83 e0 f0             	and    $0xfffffff0,%eax
  30ba92:	83 c8 01             	or     $0x1,%eax
  30ba95:	89 c2                	mov    %eax,%edx
  30ba97:	8b 45 08             	mov    0x8(%ebp),%eax
  30ba9a:	c1 e0 02             	shl    $0x2,%eax
  30ba9d:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30baa4:	29 c1                	sub    %eax,%ecx
  30baa6:	89 c8                	mov    %ecx,%eax
  30baa8:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30baad:	88 10                	mov    %dl,(%eax)
  30baaf:	e9 25 04 00 00       	jmp    30bed9 <cons_print+0x534>
  30bab4:	8b 45 08             	mov    0x8(%ebp),%eax
  30bab7:	c1 e0 02             	shl    $0x2,%eax
  30baba:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bac1:	29 c2                	sub    %eax,%edx
  30bac3:	89 d0                	mov    %edx,%eax
  30bac5:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30baca:	0f b6 00             	movzbl (%eax),%eax
  30bacd:	83 e0 0f             	and    $0xf,%eax
  30bad0:	83 c8 10             	or     $0x10,%eax
  30bad3:	89 c2                	mov    %eax,%edx
  30bad5:	8b 45 08             	mov    0x8(%ebp),%eax
  30bad8:	c1 e0 02             	shl    $0x2,%eax
  30badb:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bae2:	29 c1                	sub    %eax,%ecx
  30bae4:	89 c8                	mov    %ecx,%eax
  30bae6:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30baeb:	88 10                	mov    %dl,(%eax)
  30baed:	e9 e7 03 00 00       	jmp    30bed9 <cons_print+0x534>
  30baf2:	8b 45 08             	mov    0x8(%ebp),%eax
  30baf5:	c1 e0 02             	shl    $0x2,%eax
  30baf8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30baff:	29 c2                	sub    %eax,%edx
  30bb01:	89 d0                	mov    %edx,%eax
  30bb03:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bb08:	0f b6 00             	movzbl (%eax),%eax
  30bb0b:	83 e0 f0             	and    $0xfffffff0,%eax
  30bb0e:	83 c8 02             	or     $0x2,%eax
  30bb11:	89 c2                	mov    %eax,%edx
  30bb13:	8b 45 08             	mov    0x8(%ebp),%eax
  30bb16:	c1 e0 02             	shl    $0x2,%eax
  30bb19:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bb20:	29 c1                	sub    %eax,%ecx
  30bb22:	89 c8                	mov    %ecx,%eax
  30bb24:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bb29:	88 10                	mov    %dl,(%eax)
  30bb2b:	e9 a9 03 00 00       	jmp    30bed9 <cons_print+0x534>
  30bb30:	8b 45 08             	mov    0x8(%ebp),%eax
  30bb33:	c1 e0 02             	shl    $0x2,%eax
  30bb36:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bb3d:	29 c2                	sub    %eax,%edx
  30bb3f:	89 d0                	mov    %edx,%eax
  30bb41:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bb46:	0f b6 00             	movzbl (%eax),%eax
  30bb49:	83 e0 0f             	and    $0xf,%eax
  30bb4c:	83 c8 20             	or     $0x20,%eax
  30bb4f:	89 c2                	mov    %eax,%edx
  30bb51:	8b 45 08             	mov    0x8(%ebp),%eax
  30bb54:	c1 e0 02             	shl    $0x2,%eax
  30bb57:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bb5e:	29 c1                	sub    %eax,%ecx
  30bb60:	89 c8                	mov    %ecx,%eax
  30bb62:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bb67:	88 10                	mov    %dl,(%eax)
  30bb69:	e9 6b 03 00 00       	jmp    30bed9 <cons_print+0x534>
  30bb6e:	8b 45 08             	mov    0x8(%ebp),%eax
  30bb71:	c1 e0 02             	shl    $0x2,%eax
  30bb74:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bb7b:	29 c2                	sub    %eax,%edx
  30bb7d:	89 d0                	mov    %edx,%eax
  30bb7f:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bb84:	0f b6 00             	movzbl (%eax),%eax
  30bb87:	83 e0 f0             	and    $0xfffffff0,%eax
  30bb8a:	83 c8 03             	or     $0x3,%eax
  30bb8d:	89 c2                	mov    %eax,%edx
  30bb8f:	8b 45 08             	mov    0x8(%ebp),%eax
  30bb92:	c1 e0 02             	shl    $0x2,%eax
  30bb95:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bb9c:	29 c1                	sub    %eax,%ecx
  30bb9e:	89 c8                	mov    %ecx,%eax
  30bba0:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bba5:	88 10                	mov    %dl,(%eax)
  30bba7:	e9 2d 03 00 00       	jmp    30bed9 <cons_print+0x534>
  30bbac:	8b 45 08             	mov    0x8(%ebp),%eax
  30bbaf:	c1 e0 02             	shl    $0x2,%eax
  30bbb2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bbb9:	29 c2                	sub    %eax,%edx
  30bbbb:	89 d0                	mov    %edx,%eax
  30bbbd:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bbc2:	0f b6 00             	movzbl (%eax),%eax
  30bbc5:	83 e0 0f             	and    $0xf,%eax
  30bbc8:	83 c8 30             	or     $0x30,%eax
  30bbcb:	89 c2                	mov    %eax,%edx
  30bbcd:	8b 45 08             	mov    0x8(%ebp),%eax
  30bbd0:	c1 e0 02             	shl    $0x2,%eax
  30bbd3:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bbda:	29 c1                	sub    %eax,%ecx
  30bbdc:	89 c8                	mov    %ecx,%eax
  30bbde:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bbe3:	88 10                	mov    %dl,(%eax)
  30bbe5:	e9 ef 02 00 00       	jmp    30bed9 <cons_print+0x534>
  30bbea:	8b 45 08             	mov    0x8(%ebp),%eax
  30bbed:	c1 e0 02             	shl    $0x2,%eax
  30bbf0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bbf7:	29 c2                	sub    %eax,%edx
  30bbf9:	89 d0                	mov    %edx,%eax
  30bbfb:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bc00:	0f b6 00             	movzbl (%eax),%eax
  30bc03:	83 e0 f0             	and    $0xfffffff0,%eax
  30bc06:	83 c8 04             	or     $0x4,%eax
  30bc09:	89 c2                	mov    %eax,%edx
  30bc0b:	8b 45 08             	mov    0x8(%ebp),%eax
  30bc0e:	c1 e0 02             	shl    $0x2,%eax
  30bc11:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bc18:	29 c1                	sub    %eax,%ecx
  30bc1a:	89 c8                	mov    %ecx,%eax
  30bc1c:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bc21:	88 10                	mov    %dl,(%eax)
  30bc23:	e9 b1 02 00 00       	jmp    30bed9 <cons_print+0x534>
  30bc28:	8b 45 08             	mov    0x8(%ebp),%eax
  30bc2b:	c1 e0 02             	shl    $0x2,%eax
  30bc2e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bc35:	29 c2                	sub    %eax,%edx
  30bc37:	89 d0                	mov    %edx,%eax
  30bc39:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bc3e:	0f b6 00             	movzbl (%eax),%eax
  30bc41:	83 e0 0f             	and    $0xf,%eax
  30bc44:	83 c8 40             	or     $0x40,%eax
  30bc47:	89 c2                	mov    %eax,%edx
  30bc49:	8b 45 08             	mov    0x8(%ebp),%eax
  30bc4c:	c1 e0 02             	shl    $0x2,%eax
  30bc4f:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bc56:	29 c1                	sub    %eax,%ecx
  30bc58:	89 c8                	mov    %ecx,%eax
  30bc5a:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bc5f:	88 10                	mov    %dl,(%eax)
  30bc61:	e9 73 02 00 00       	jmp    30bed9 <cons_print+0x534>
  30bc66:	8b 45 08             	mov    0x8(%ebp),%eax
  30bc69:	c1 e0 02             	shl    $0x2,%eax
  30bc6c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bc73:	29 c2                	sub    %eax,%edx
  30bc75:	89 d0                	mov    %edx,%eax
  30bc77:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bc7c:	0f b6 00             	movzbl (%eax),%eax
  30bc7f:	83 e0 f0             	and    $0xfffffff0,%eax
  30bc82:	83 c8 05             	or     $0x5,%eax
  30bc85:	89 c2                	mov    %eax,%edx
  30bc87:	8b 45 08             	mov    0x8(%ebp),%eax
  30bc8a:	c1 e0 02             	shl    $0x2,%eax
  30bc8d:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bc94:	29 c1                	sub    %eax,%ecx
  30bc96:	89 c8                	mov    %ecx,%eax
  30bc98:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bc9d:	88 10                	mov    %dl,(%eax)
  30bc9f:	e9 35 02 00 00       	jmp    30bed9 <cons_print+0x534>
  30bca4:	8b 45 08             	mov    0x8(%ebp),%eax
  30bca7:	c1 e0 02             	shl    $0x2,%eax
  30bcaa:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bcb1:	29 c2                	sub    %eax,%edx
  30bcb3:	89 d0                	mov    %edx,%eax
  30bcb5:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bcba:	0f b6 00             	movzbl (%eax),%eax
  30bcbd:	83 e0 0f             	and    $0xf,%eax
  30bcc0:	83 c8 50             	or     $0x50,%eax
  30bcc3:	89 c2                	mov    %eax,%edx
  30bcc5:	8b 45 08             	mov    0x8(%ebp),%eax
  30bcc8:	c1 e0 02             	shl    $0x2,%eax
  30bccb:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bcd2:	29 c1                	sub    %eax,%ecx
  30bcd4:	89 c8                	mov    %ecx,%eax
  30bcd6:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bcdb:	88 10                	mov    %dl,(%eax)
  30bcdd:	e9 f7 01 00 00       	jmp    30bed9 <cons_print+0x534>
  30bce2:	8b 45 08             	mov    0x8(%ebp),%eax
  30bce5:	c1 e0 02             	shl    $0x2,%eax
  30bce8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bcef:	29 c2                	sub    %eax,%edx
  30bcf1:	89 d0                	mov    %edx,%eax
  30bcf3:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bcf8:	0f b6 00             	movzbl (%eax),%eax
  30bcfb:	83 e0 f0             	and    $0xfffffff0,%eax
  30bcfe:	83 c8 06             	or     $0x6,%eax
  30bd01:	89 c2                	mov    %eax,%edx
  30bd03:	8b 45 08             	mov    0x8(%ebp),%eax
  30bd06:	c1 e0 02             	shl    $0x2,%eax
  30bd09:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bd10:	29 c1                	sub    %eax,%ecx
  30bd12:	89 c8                	mov    %ecx,%eax
  30bd14:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bd19:	88 10                	mov    %dl,(%eax)
  30bd1b:	e9 b9 01 00 00       	jmp    30bed9 <cons_print+0x534>
  30bd20:	8b 45 08             	mov    0x8(%ebp),%eax
  30bd23:	c1 e0 02             	shl    $0x2,%eax
  30bd26:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bd2d:	29 c2                	sub    %eax,%edx
  30bd2f:	89 d0                	mov    %edx,%eax
  30bd31:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bd36:	0f b6 00             	movzbl (%eax),%eax
  30bd39:	83 e0 0f             	and    $0xf,%eax
  30bd3c:	83 c8 60             	or     $0x60,%eax
  30bd3f:	89 c2                	mov    %eax,%edx
  30bd41:	8b 45 08             	mov    0x8(%ebp),%eax
  30bd44:	c1 e0 02             	shl    $0x2,%eax
  30bd47:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bd4e:	29 c1                	sub    %eax,%ecx
  30bd50:	89 c8                	mov    %ecx,%eax
  30bd52:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bd57:	88 10                	mov    %dl,(%eax)
  30bd59:	e9 7b 01 00 00       	jmp    30bed9 <cons_print+0x534>
  30bd5e:	8b 45 08             	mov    0x8(%ebp),%eax
  30bd61:	c1 e0 02             	shl    $0x2,%eax
  30bd64:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bd6b:	29 c2                	sub    %eax,%edx
  30bd6d:	89 d0                	mov    %edx,%eax
  30bd6f:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bd74:	0f b6 00             	movzbl (%eax),%eax
  30bd77:	83 e0 f0             	and    $0xfffffff0,%eax
  30bd7a:	83 c8 07             	or     $0x7,%eax
  30bd7d:	89 c2                	mov    %eax,%edx
  30bd7f:	8b 45 08             	mov    0x8(%ebp),%eax
  30bd82:	c1 e0 02             	shl    $0x2,%eax
  30bd85:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bd8c:	29 c1                	sub    %eax,%ecx
  30bd8e:	89 c8                	mov    %ecx,%eax
  30bd90:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bd95:	88 10                	mov    %dl,(%eax)
  30bd97:	e9 3d 01 00 00       	jmp    30bed9 <cons_print+0x534>
  30bd9c:	8b 45 08             	mov    0x8(%ebp),%eax
  30bd9f:	c1 e0 02             	shl    $0x2,%eax
  30bda2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bda9:	29 c2                	sub    %eax,%edx
  30bdab:	89 d0                	mov    %edx,%eax
  30bdad:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bdb2:	0f b6 00             	movzbl (%eax),%eax
  30bdb5:	83 e0 0f             	and    $0xf,%eax
  30bdb8:	83 c8 70             	or     $0x70,%eax
  30bdbb:	89 c2                	mov    %eax,%edx
  30bdbd:	8b 45 08             	mov    0x8(%ebp),%eax
  30bdc0:	c1 e0 02             	shl    $0x2,%eax
  30bdc3:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30bdca:	29 c1                	sub    %eax,%ecx
  30bdcc:	89 c8                	mov    %ecx,%eax
  30bdce:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bdd3:	88 10                	mov    %dl,(%eax)
  30bdd5:	e9 ff 00 00 00       	jmp    30bed9 <cons_print+0x534>
  30bdda:	8b 45 08             	mov    0x8(%ebp),%eax
  30bddd:	c1 e0 02             	shl    $0x2,%eax
  30bde0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bde7:	29 c2                	sub    %eax,%edx
  30bde9:	89 d0                	mov    %edx,%eax
  30bdeb:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bdf0:	0f b6 00             	movzbl (%eax),%eax
  30bdf3:	83 c8 08             	or     $0x8,%eax
  30bdf6:	89 c2                	mov    %eax,%edx
  30bdf8:	8b 45 08             	mov    0x8(%ebp),%eax
  30bdfb:	c1 e0 02             	shl    $0x2,%eax
  30bdfe:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30be05:	29 c1                	sub    %eax,%ecx
  30be07:	89 c8                	mov    %ecx,%eax
  30be09:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30be0e:	88 10                	mov    %dl,(%eax)
  30be10:	e9 c4 00 00 00       	jmp    30bed9 <cons_print+0x534>
  30be15:	8b 45 08             	mov    0x8(%ebp),%eax
  30be18:	c1 e0 02             	shl    $0x2,%eax
  30be1b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30be22:	29 c2                	sub    %eax,%edx
  30be24:	89 d0                	mov    %edx,%eax
  30be26:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30be2b:	0f b6 00             	movzbl (%eax),%eax
  30be2e:	83 e0 f7             	and    $0xfffffff7,%eax
  30be31:	89 c2                	mov    %eax,%edx
  30be33:	8b 45 08             	mov    0x8(%ebp),%eax
  30be36:	c1 e0 02             	shl    $0x2,%eax
  30be39:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30be40:	29 c1                	sub    %eax,%ecx
  30be42:	89 c8                	mov    %ecx,%eax
  30be44:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30be49:	88 10                	mov    %dl,(%eax)
  30be4b:	e9 89 00 00 00       	jmp    30bed9 <cons_print+0x534>
  30be50:	8b 45 08             	mov    0x8(%ebp),%eax
  30be53:	c1 e0 02             	shl    $0x2,%eax
  30be56:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30be5d:	29 c2                	sub    %eax,%edx
  30be5f:	89 d0                	mov    %edx,%eax
  30be61:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30be66:	0f b6 00             	movzbl (%eax),%eax
  30be69:	83 c8 80             	or     $0xffffff80,%eax
  30be6c:	89 c2                	mov    %eax,%edx
  30be6e:	8b 45 08             	mov    0x8(%ebp),%eax
  30be71:	c1 e0 02             	shl    $0x2,%eax
  30be74:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30be7b:	29 c1                	sub    %eax,%ecx
  30be7d:	89 c8                	mov    %ecx,%eax
  30be7f:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30be84:	88 10                	mov    %dl,(%eax)
  30be86:	eb 51                	jmp    30bed9 <cons_print+0x534>
  30be88:	8b 45 08             	mov    0x8(%ebp),%eax
  30be8b:	c1 e0 02             	shl    $0x2,%eax
  30be8e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30be95:	29 c2                	sub    %eax,%edx
  30be97:	89 d0                	mov    %edx,%eax
  30be99:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30be9e:	0f b6 00             	movzbl (%eax),%eax
  30bea1:	83 e0 7f             	and    $0x7f,%eax
  30bea4:	89 c2                	mov    %eax,%edx
  30bea6:	8b 45 08             	mov    0x8(%ebp),%eax
  30bea9:	c1 e0 02             	shl    $0x2,%eax
  30beac:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30beb3:	29 c1                	sub    %eax,%ecx
  30beb5:	89 c8                	mov    %ecx,%eax
  30beb7:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bebc:	88 10                	mov    %dl,(%eax)
  30bebe:	eb 19                	jmp    30bed9 <cons_print+0x534>
  30bec0:	ff 75 08             	pushl  0x8(%ebp)
  30bec3:	e8 5e f7 ff ff       	call   30b626 <scrdown>
  30bec8:	83 c4 04             	add    $0x4,%esp
  30becb:	eb 0c                	jmp    30bed9 <cons_print+0x534>
  30becd:	ff 75 08             	pushl  0x8(%ebp)
  30bed0:	e8 95 f4 ff ff       	call   30b36a <scrup>
  30bed5:	83 c4 04             	add    $0x4,%esp
  30bed8:	90                   	nop
  30bed9:	8b 45 08             	mov    0x8(%ebp),%eax
  30bedc:	c1 e0 02             	shl    $0x2,%eax
  30bedf:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bee6:	29 c2                	sub    %eax,%edx
  30bee8:	89 d0                	mov    %edx,%eax
  30beea:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30beef:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  30bef6:	eb 66                	jmp    30bf5e <cons_print+0x5b9>
  30bef8:	80 7d fb 1b          	cmpb   $0x1b,-0x5(%ebp)
  30befc:	75 1f                	jne    30bf1d <cons_print+0x578>
  30befe:	8b 45 08             	mov    0x8(%ebp),%eax
  30bf01:	c1 e0 02             	shl    $0x2,%eax
  30bf04:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bf0b:	29 c2                	sub    %eax,%edx
  30bf0d:	89 d0                	mov    %edx,%eax
  30bf0f:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30bf14:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
  30bf1b:	eb 41                	jmp    30bf5e <cons_print+0x5b9>
  30bf1d:	80 7d fb 08          	cmpb   $0x8,-0x5(%ebp)
  30bf21:	75 0d                	jne    30bf30 <cons_print+0x58b>
  30bf23:	ff 75 08             	pushl  0x8(%ebp)
  30bf26:	e8 dc f8 ff ff       	call   30b807 <del>
  30bf2b:	83 c4 04             	add    $0x4,%esp
  30bf2e:	eb 2e                	jmp    30bf5e <cons_print+0x5b9>
  30bf30:	80 7d fb 0a          	cmpb   $0xa,-0x5(%ebp)
  30bf34:	75 18                	jne    30bf4e <cons_print+0x5a9>
  30bf36:	ff 75 08             	pushl  0x8(%ebp)
  30bf39:	e8 a9 f7 ff ff       	call   30b6e7 <lf>
  30bf3e:	83 c4 04             	add    $0x4,%esp
  30bf41:	ff 75 08             	pushl  0x8(%ebp)
  30bf44:	e8 2f f8 ff ff       	call   30b778 <cr>
  30bf49:	83 c4 04             	add    $0x4,%esp
  30bf4c:	eb 10                	jmp    30bf5e <cons_print+0x5b9>
  30bf4e:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  30bf52:	50                   	push   %eax
  30bf53:	ff 75 08             	pushl  0x8(%ebp)
  30bf56:	e8 72 f9 ff ff       	call   30b8cd <insert>
  30bf5b:	83 c4 08             	add    $0x8,%esp
  30bf5e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  30bf62:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30bf65:	3b 45 10             	cmp    0x10(%ebp),%eax
  30bf68:	0f 82 49 fa ff ff    	jb     30b9b7 <cons_print+0x12>
  30bf6e:	c9                   	leave  
  30bf6f:	c3                   	ret    

0030bf70 <cons_init>:
  30bf70:	55                   	push   %ebp
  30bf71:	89 e5                	mov    %esp,%ebp
  30bf73:	83 ec 10             	sub    $0x10,%esp
  30bf76:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30bf7d:	c7 05 44 50 31 00 00 	movl   $0x0,0x315044
  30bf84:	00 00 00 
  30bf87:	c7 05 34 50 31 00 00 	movl   $0xb8000,0x315034
  30bf8e:	80 0b 00 
  30bf91:	c7 05 3c 50 31 00 19 	movl   $0x19,0x31503c
  30bf98:	00 00 00 
  30bf9b:	c7 05 38 50 31 00 50 	movl   $0x50,0x315038
  30bfa2:	00 00 00 
  30bfa5:	a1 38 50 31 00       	mov    0x315038,%eax
  30bfaa:	01 c0                	add    %eax,%eax
  30bfac:	a3 40 50 31 00       	mov    %eax,0x315040
  30bfb1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30bfb4:	c1 e0 02             	shl    $0x2,%eax
  30bfb7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bfbe:	29 c2                	sub    %eax,%edx
  30bfc0:	89 d0                	mov    %edx,%eax
  30bfc2:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bfc7:	c6 00 0f             	movb   $0xf,(%eax)
  30bfca:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30bfcd:	c1 e0 02             	shl    $0x2,%eax
  30bfd0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bfd7:	29 c2                	sub    %eax,%edx
  30bfd9:	89 d0                	mov    %edx,%eax
  30bfdb:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30bfe0:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  30bfe7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30bfea:	c1 e0 02             	shl    $0x2,%eax
  30bfed:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30bff4:	29 c2                	sub    %eax,%edx
  30bff6:	89 d0                	mov    %edx,%eax
  30bff8:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30bffd:	66 c7 40 02 20 0f    	movw   $0xf20,0x2(%eax)
  30c003:	8b 15 34 50 31 00    	mov    0x315034,%edx
  30c009:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30c00c:	c1 e0 02             	shl    $0x2,%eax
  30c00f:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30c016:	29 c1                	sub    %eax,%ecx
  30c018:	89 c8                	mov    %ecx,%eax
  30c01a:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30c01f:	89 50 04             	mov    %edx,0x4(%eax)
  30c022:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30c025:	c1 e0 02             	shl    $0x2,%eax
  30c028:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30c02f:	29 c2                	sub    %eax,%edx
  30c031:	89 d0                	mov    %edx,%eax
  30c033:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30c038:	8b 40 04             	mov    0x4(%eax),%eax
  30c03b:	8d 90 e0 2e 00 00    	lea    0x2ee0(%eax),%edx
  30c041:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30c044:	c1 e0 02             	shl    $0x2,%eax
  30c047:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30c04e:	29 c1                	sub    %eax,%ecx
  30c050:	89 c8                	mov    %ecx,%eax
  30c052:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30c057:	89 50 08             	mov    %edx,0x8(%eax)
  30c05a:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
  30c05e:	b8 0c 00 00 00       	mov    $0xc,%eax
  30c063:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30c068:	ee                   	out    %al,(%dx)
  30c069:	eb 00                	jmp    30c06b <cons_init+0xfb>
  30c06b:	eb 00                	jmp    30c06d <cons_init+0xfd>
  30c06d:	b8 d5 03 00 00       	mov    $0x3d5,%eax
  30c072:	89 c2                	mov    %eax,%edx
  30c074:	ec                   	in     (%dx),%al
  30c075:	eb 00                	jmp    30c077 <cons_init+0x107>
  30c077:	eb 00                	jmp    30c079 <cons_init+0x109>
  30c079:	88 45 fa             	mov    %al,-0x6(%ebp)
  30c07c:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  30c080:	88 45 fb             	mov    %al,-0x5(%ebp)
  30c083:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  30c087:	0f b6 c0             	movzbl %al,%eax
  30c08a:	c1 e0 09             	shl    $0x9,%eax
  30c08d:	89 c1                	mov    %eax,%ecx
  30c08f:	c6 45 f9 00          	movb   $0x0,-0x7(%ebp)
  30c093:	b8 0d 00 00 00       	mov    $0xd,%eax
  30c098:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30c09d:	ee                   	out    %al,(%dx)
  30c09e:	eb 00                	jmp    30c0a0 <cons_init+0x130>
  30c0a0:	eb 00                	jmp    30c0a2 <cons_init+0x132>
  30c0a2:	b8 d5 03 00 00       	mov    $0x3d5,%eax
  30c0a7:	89 c2                	mov    %eax,%edx
  30c0a9:	ec                   	in     (%dx),%al
  30c0aa:	eb 00                	jmp    30c0ac <cons_init+0x13c>
  30c0ac:	eb 00                	jmp    30c0ae <cons_init+0x13e>
  30c0ae:	88 45 f8             	mov    %al,-0x8(%ebp)
  30c0b1:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  30c0b5:	88 45 f9             	mov    %al,-0x7(%ebp)
  30c0b8:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  30c0bc:	0f b6 c0             	movzbl %al,%eax
  30c0bf:	01 c0                	add    %eax,%eax
  30c0c1:	09 c8                	or     %ecx,%eax
  30c0c3:	89 c2                	mov    %eax,%edx
  30c0c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30c0c8:	c1 e0 02             	shl    $0x2,%eax
  30c0cb:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30c0d2:	29 c1                	sub    %eax,%ecx
  30c0d4:	89 c8                	mov    %ecx,%eax
  30c0d6:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30c0db:	8b 40 04             	mov    0x4(%eax),%eax
  30c0de:	01 c2                	add    %eax,%edx
  30c0e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30c0e3:	c1 e0 02             	shl    $0x2,%eax
  30c0e6:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30c0ed:	29 c1                	sub    %eax,%ecx
  30c0ef:	89 c8                	mov    %ecx,%eax
  30c0f1:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30c0f6:	89 50 0c             	mov    %edx,0xc(%eax)
  30c0f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30c0fc:	c1 e0 02             	shl    $0x2,%eax
  30c0ff:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  30c106:	29 c2                	sub    %eax,%edx
  30c108:	89 d0                	mov    %edx,%eax
  30c10a:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30c10f:	8b 40 0c             	mov    0xc(%eax),%eax
  30c112:	8d 90 a0 0f 00 00    	lea    0xfa0(%eax),%edx
  30c118:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30c11b:	c1 e0 02             	shl    $0x2,%eax
  30c11e:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30c125:	29 c1                	sub    %eax,%ecx
  30c127:	89 c8                	mov    %ecx,%eax
  30c129:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30c12e:	89 10                	mov    %edx,(%eax)
  30c130:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  30c134:	b8 0e 00 00 00       	mov    $0xe,%eax
  30c139:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30c13e:	ee                   	out    %al,(%dx)
  30c13f:	eb 00                	jmp    30c141 <cons_init+0x1d1>
  30c141:	eb 00                	jmp    30c143 <cons_init+0x1d3>
  30c143:	b8 d5 03 00 00       	mov    $0x3d5,%eax
  30c148:	89 c2                	mov    %eax,%edx
  30c14a:	ec                   	in     (%dx),%al
  30c14b:	eb 00                	jmp    30c14d <cons_init+0x1dd>
  30c14d:	eb 00                	jmp    30c14f <cons_init+0x1df>
  30c14f:	88 45 f6             	mov    %al,-0xa(%ebp)
  30c152:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  30c156:	88 45 f7             	mov    %al,-0x9(%ebp)
  30c159:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30c15d:	0f b6 c0             	movzbl %al,%eax
  30c160:	c1 e0 09             	shl    $0x9,%eax
  30c163:	89 c1                	mov    %eax,%ecx
  30c165:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
  30c169:	b8 0f 00 00 00       	mov    $0xf,%eax
  30c16e:	ba d4 03 00 00       	mov    $0x3d4,%edx
  30c173:	ee                   	out    %al,(%dx)
  30c174:	eb 00                	jmp    30c176 <cons_init+0x206>
  30c176:	eb 00                	jmp    30c178 <cons_init+0x208>
  30c178:	b8 d5 03 00 00       	mov    $0x3d5,%eax
  30c17d:	89 c2                	mov    %eax,%edx
  30c17f:	ec                   	in     (%dx),%al
  30c180:	eb 00                	jmp    30c182 <cons_init+0x212>
  30c182:	eb 00                	jmp    30c184 <cons_init+0x214>
  30c184:	88 45 f4             	mov    %al,-0xc(%ebp)
  30c187:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
  30c18b:	88 45 f5             	mov    %al,-0xb(%ebp)
  30c18e:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  30c192:	0f b6 c0             	movzbl %al,%eax
  30c195:	01 c0                	add    %eax,%eax
  30c197:	09 c8                	or     %ecx,%eax
  30c199:	89 c2                	mov    %eax,%edx
  30c19b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30c19e:	c1 e0 02             	shl    $0x2,%eax
  30c1a1:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30c1a8:	29 c1                	sub    %eax,%ecx
  30c1aa:	89 c8                	mov    %ecx,%eax
  30c1ac:	05 1c 5f 31 00       	add    $0x315f1c,%eax
  30c1b1:	8b 40 04             	mov    0x4(%eax),%eax
  30c1b4:	01 c2                	add    %eax,%edx
  30c1b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30c1b9:	c1 e0 02             	shl    $0x2,%eax
  30c1bc:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  30c1c3:	29 c1                	sub    %eax,%ecx
  30c1c5:	89 c8                	mov    %ecx,%eax
  30c1c7:	05 2c 5f 31 00       	add    $0x315f2c,%eax
  30c1cc:	89 50 04             	mov    %edx,0x4(%eax)
  30c1cf:	c9                   	leave  
  30c1d0:	c3                   	ret    

0030c1d1 <cons_write>:
  30c1d1:	55                   	push   %ebp
  30c1d2:	89 e5                	mov    %esp,%ebp
  30c1d4:	57                   	push   %edi
  30c1d5:	56                   	push   %esi
  30c1d6:	53                   	push   %ebx
  30c1d7:	83 ec 10             	sub    $0x10,%esp
  30c1da:	8b 45 08             	mov    0x8(%ebp),%eax
  30c1dd:	8b 50 34             	mov    0x34(%eax),%edx
  30c1e0:	8b 45 08             	mov    0x8(%ebp),%eax
  30c1e3:	8b 40 38             	mov    0x38(%eax),%eax
  30c1e6:	52                   	push   %edx
  30c1e7:	50                   	push   %eax
  30c1e8:	6a 00                	push   $0x0
  30c1ea:	e8 b6 f7 ff ff       	call   30b9a5 <cons_print>
  30c1ef:	83 c4 0c             	add    $0xc,%esp
  30c1f2:	8b 45 08             	mov    0x8(%ebp),%eax
  30c1f5:	8b 58 3c             	mov    0x3c(%eax),%ebx
  30c1f8:	b8 02 00 00 00       	mov    $0x2,%eax
  30c1fd:	b9 00 00 00 00       	mov    $0x0,%ecx
  30c202:	ba 00 00 00 00       	mov    $0x0,%edx
  30c207:	be 00 00 00 00       	mov    $0x0,%esi
  30c20c:	bf 00 00 00 00       	mov    $0x0,%edi
  30c211:	cd 80                	int    $0x80
  30c213:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30c216:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30c219:	5b                   	pop    %ebx
  30c21a:	5e                   	pop    %esi
  30c21b:	5f                   	pop    %edi
  30c21c:	5d                   	pop    %ebp
  30c21d:	c3                   	ret    

0030c21e <cons_read>:
  30c21e:	55                   	push   %ebp
  30c21f:	89 e5                	mov    %esp,%ebp
  30c221:	83 ec 08             	sub    $0x8,%esp
  30c224:	8b 45 08             	mov    0x8(%ebp),%eax
  30c227:	8b 48 34             	mov    0x34(%eax),%ecx
  30c22a:	8b 45 08             	mov    0x8(%ebp),%eax
  30c22d:	8b 50 38             	mov    0x38(%eax),%edx
  30c230:	8b 45 08             	mov    0x8(%ebp),%eax
  30c233:	8b 40 3c             	mov    0x3c(%eax),%eax
  30c236:	83 ec 04             	sub    $0x4,%esp
  30c239:	51                   	push   %ecx
  30c23a:	52                   	push   %edx
  30c23b:	50                   	push   %eax
  30c23c:	e8 4f 07 00 00       	call   30c990 <copy_buffer>
  30c241:	83 c4 10             	add    $0x10,%esp
  30c244:	c9                   	leave  
  30c245:	c3                   	ret    

0030c246 <cons_main>:
  30c246:	55                   	push   %ebp
  30c247:	89 e5                	mov    %esp,%ebp
  30c249:	57                   	push   %edi
  30c24a:	56                   	push   %esi
  30c24b:	53                   	push   %ebx
  30c24c:	83 ec 1c             	sub    $0x1c,%esp
  30c24f:	e8 1c fd ff ff       	call   30bf70 <cons_init>
  30c254:	e8 6e 08 00 00       	call   30cac7 <keyboard_init>
  30c259:	b8 03 00 00 00       	mov    $0x3,%eax
  30c25e:	bb 00 00 00 00       	mov    $0x0,%ebx
  30c263:	b9 1e c2 30 00       	mov    $0x30c21e,%ecx
  30c268:	ba 00 00 00 00       	mov    $0x0,%edx
  30c26d:	be 00 00 00 00       	mov    $0x0,%esi
  30c272:	bf 00 00 00 00       	mov    $0x0,%edi
  30c277:	cd 80                	int    $0x80
  30c279:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30c27c:	b8 03 00 00 00       	mov    $0x3,%eax
  30c281:	bb 01 00 00 00       	mov    $0x1,%ebx
  30c286:	b9 d1 c1 30 00       	mov    $0x30c1d1,%ecx
  30c28b:	ba 00 00 00 00       	mov    $0x0,%edx
  30c290:	be 00 00 00 00       	mov    $0x0,%esi
  30c295:	bf 00 00 00 00       	mov    $0x0,%edi
  30c29a:	cd 80                	int    $0x80
  30c29c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30c29f:	e8 30 09 00 00       	call   30cbd4 <dorun>
  30c2a4:	b8 00 00 00 00       	mov    $0x0,%eax
  30c2a9:	83 c4 1c             	add    $0x1c,%esp
  30c2ac:	5b                   	pop    %ebx
  30c2ad:	5e                   	pop    %esi
  30c2ae:	5f                   	pop    %edi
  30c2af:	5d                   	pop    %ebp
  30c2b0:	c3                   	ret    
  30c2b1:	66 90                	xchg   %ax,%ax
  30c2b3:	90                   	nop

0030c2b4 <sl_init>:
  30c2b4:	55                   	push   %ebp
  30c2b5:	89 e5                	mov    %esp,%ebp
  30c2b7:	83 ec 10             	sub    $0x10,%esp
  30c2ba:	8b 45 08             	mov    0x8(%ebp),%eax
  30c2bd:	8d 50 03             	lea    0x3(%eax),%edx
  30c2c0:	b8 80 00 00 00       	mov    $0x80,%eax
  30c2c5:	ee                   	out    %al,(%dx)
  30c2c6:	eb 00                	jmp    30c2c8 <sl_init+0x14>
  30c2c8:	eb 00                	jmp    30c2ca <sl_init+0x16>
  30c2ca:	b8 30 00 00 00       	mov    $0x30,%eax
  30c2cf:	8b 55 08             	mov    0x8(%ebp),%edx
  30c2d2:	ee                   	out    %al,(%dx)
  30c2d3:	eb 00                	jmp    30c2d5 <sl_init+0x21>
  30c2d5:	eb 00                	jmp    30c2d7 <sl_init+0x23>
  30c2d7:	8b 45 08             	mov    0x8(%ebp),%eax
  30c2da:	8d 50 01             	lea    0x1(%eax),%edx
  30c2dd:	b8 00 00 00 00       	mov    $0x0,%eax
  30c2e2:	ee                   	out    %al,(%dx)
  30c2e3:	eb 00                	jmp    30c2e5 <sl_init+0x31>
  30c2e5:	eb 00                	jmp    30c2e7 <sl_init+0x33>
  30c2e7:	8b 45 08             	mov    0x8(%ebp),%eax
  30c2ea:	8d 50 03             	lea    0x3(%eax),%edx
  30c2ed:	b8 03 00 00 00       	mov    $0x3,%eax
  30c2f2:	ee                   	out    %al,(%dx)
  30c2f3:	eb 00                	jmp    30c2f5 <sl_init+0x41>
  30c2f5:	eb 00                	jmp    30c2f7 <sl_init+0x43>
  30c2f7:	8b 45 08             	mov    0x8(%ebp),%eax
  30c2fa:	8d 50 04             	lea    0x4(%eax),%edx
  30c2fd:	b8 0b 00 00 00       	mov    $0xb,%eax
  30c302:	ee                   	out    %al,(%dx)
  30c303:	eb 00                	jmp    30c305 <sl_init+0x51>
  30c305:	eb 00                	jmp    30c307 <sl_init+0x53>
  30c307:	8b 45 08             	mov    0x8(%ebp),%eax
  30c30a:	8d 50 01             	lea    0x1(%eax),%edx
  30c30d:	b8 0d 00 00 00       	mov    $0xd,%eax
  30c312:	ee                   	out    %al,(%dx)
  30c313:	eb 00                	jmp    30c315 <sl_init+0x61>
  30c315:	eb 00                	jmp    30c317 <sl_init+0x63>
  30c317:	8b 45 08             	mov    0x8(%ebp),%eax
  30c31a:	89 c2                	mov    %eax,%edx
  30c31c:	ec                   	in     (%dx),%al
  30c31d:	88 45 ff             	mov    %al,-0x1(%ebp)
  30c320:	c9                   	leave  
  30c321:	c3                   	ret    

0030c322 <rs_handler>:
  30c322:	55                   	push   %ebp
  30c323:	89 e5                	mov    %esp,%ebp
  30c325:	83 ec 08             	sub    $0x8,%esp
  30c328:	83 ec 0c             	sub    $0xc,%esp
  30c32b:	6a 00                	push   $0x0
  30c32d:	6a 00                	push   $0x0
  30c32f:	6a 00                	push   $0x0
  30c331:	6a 06                	push   $0x6
  30c333:	ff 75 08             	pushl  0x8(%ebp)
  30c336:	e8 75 a6 ff ff       	call   3069b0 <doint>
  30c33b:	83 c4 20             	add    $0x20,%esp
  30c33e:	b8 00 00 00 00       	mov    $0x0,%eax
  30c343:	c9                   	leave  
  30c344:	c3                   	ret    

0030c345 <rs_push>:
  30c345:	55                   	push   %ebp
  30c346:	89 e5                	mov    %esp,%ebp
  30c348:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c34d:	85 c0                	test   %eax,%eax
  30c34f:	75 12                	jne    30c363 <rs_push+0x1e>
  30c351:	8b 45 08             	mov    0x8(%ebp),%eax
  30c354:	a3 4c 50 31 00       	mov    %eax,0x31504c
  30c359:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c35e:	a3 50 50 31 00       	mov    %eax,0x315050
  30c363:	a1 50 50 31 00       	mov    0x315050,%eax
  30c368:	8b 55 08             	mov    0x8(%ebp),%edx
  30c36b:	89 50 10             	mov    %edx,0x10(%eax)
  30c36e:	8b 45 08             	mov    0x8(%ebp),%eax
  30c371:	a3 50 50 31 00       	mov    %eax,0x315050
  30c376:	a1 50 50 31 00       	mov    0x315050,%eax
  30c37b:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  30c382:	5d                   	pop    %ebp
  30c383:	c3                   	ret    

0030c384 <rs_pop>:
  30c384:	55                   	push   %ebp
  30c385:	89 e5                	mov    %esp,%ebp
  30c387:	83 ec 18             	sub    $0x18,%esp
  30c38a:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c38f:	85 c0                	test   %eax,%eax
  30c391:	74 25                	je     30c3b8 <rs_pop+0x34>
  30c393:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c398:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30c39b:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c3a0:	8b 40 10             	mov    0x10(%eax),%eax
  30c3a3:	a3 4c 50 31 00       	mov    %eax,0x31504c
  30c3a8:	83 ec 08             	sub    $0x8,%esp
  30c3ab:	6a 00                	push   $0x0
  30c3ad:	ff 75 f4             	pushl  -0xc(%ebp)
  30c3b0:	e8 0a ba ff ff       	call   307dbf <kfree_s>
  30c3b5:	83 c4 10             	add    $0x10,%esp
  30c3b8:	c9                   	leave  
  30c3b9:	c3                   	ret    

0030c3ba <rs_write>:
  30c3ba:	55                   	push   %ebp
  30c3bb:	89 e5                	mov    %esp,%ebp
  30c3bd:	83 ec 18             	sub    $0x18,%esp
  30c3c0:	83 ec 0c             	sub    $0xc,%esp
  30c3c3:	6a 14                	push   $0x14
  30c3c5:	e8 89 b8 ff ff       	call   307c53 <kalloc>
  30c3ca:	83 c4 10             	add    $0x10,%esp
  30c3cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30c3d0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  30c3d4:	74 45                	je     30c41b <rs_write+0x61>
  30c3d6:	8b 45 08             	mov    0x8(%ebp),%eax
  30c3d9:	8b 50 3c             	mov    0x3c(%eax),%edx
  30c3dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30c3df:	89 10                	mov    %edx,(%eax)
  30c3e1:	8b 45 08             	mov    0x8(%ebp),%eax
  30c3e4:	8b 50 38             	mov    0x38(%eax),%edx
  30c3e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30c3ea:	89 50 0c             	mov    %edx,0xc(%eax)
  30c3ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30c3f0:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  30c3f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30c3fa:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  30c401:	8b 45 08             	mov    0x8(%ebp),%eax
  30c404:	8b 50 34             	mov    0x34(%eax),%edx
  30c407:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30c40a:	89 50 04             	mov    %edx,0x4(%eax)
  30c40d:	83 ec 0c             	sub    $0xc,%esp
  30c410:	ff 75 f4             	pushl  -0xc(%ebp)
  30c413:	e8 2d ff ff ff       	call   30c345 <rs_push>
  30c418:	83 c4 10             	add    $0x10,%esp
  30c41b:	b8 f9 03 00 00       	mov    $0x3f9,%eax
  30c420:	89 c2                	mov    %eax,%edx
  30c422:	ec                   	in     (%dx),%al
  30c423:	eb 00                	jmp    30c425 <rs_write+0x6b>
  30c425:	eb 00                	jmp    30c427 <rs_write+0x6d>
  30c427:	88 45 f3             	mov    %al,-0xd(%ebp)
  30c42a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  30c42e:	83 c8 02             	or     $0x2,%eax
  30c431:	0f b6 c0             	movzbl %al,%eax
  30c434:	ba f9 03 00 00       	mov    $0x3f9,%edx
  30c439:	ee                   	out    %al,(%dx)
  30c43a:	c9                   	leave  
  30c43b:	c3                   	ret    

0030c43c <_io>:
  30c43c:	55                   	push   %ebp
  30c43d:	89 e5                	mov    %esp,%ebp
  30c43f:	57                   	push   %edi
  30c440:	56                   	push   %esi
  30c441:	53                   	push   %ebx
  30c442:	83 ec 2c             	sub    $0x2c,%esp
  30c445:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c44a:	85 c0                	test   %eax,%eax
  30c44c:	0f 84 3c 01 00 00    	je     30c58e <_io+0x152>
  30c452:	b8 fa 03 00 00       	mov    $0x3fa,%eax
  30c457:	89 c2                	mov    %eax,%edx
  30c459:	ec                   	in     (%dx),%al
  30c45a:	eb 00                	jmp    30c45c <_io+0x20>
  30c45c:	eb 00                	jmp    30c45e <_io+0x22>
  30c45e:	88 45 e7             	mov    %al,-0x19(%ebp)
  30c461:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  30c465:	0f b6 c0             	movzbl %al,%eax
  30c468:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30c46b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30c46e:	83 e0 01             	and    $0x1,%eax
  30c471:	85 c0                	test   %eax,%eax
  30c473:	0f 85 15 01 00 00    	jne    30c58e <_io+0x152>
  30c479:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30c47c:	83 f8 02             	cmp    $0x2,%eax
  30c47f:	74 71                	je     30c4f2 <_io+0xb6>
  30c481:	83 f8 02             	cmp    $0x2,%eax
  30c484:	7f 09                	jg     30c48f <_io+0x53>
  30c486:	85 c0                	test   %eax,%eax
  30c488:	74 14                	je     30c49e <_io+0x62>
  30c48a:	e9 ff 00 00 00       	jmp    30c58e <_io+0x152>
  30c48f:	83 f8 04             	cmp    $0x4,%eax
  30c492:	74 32                	je     30c4c6 <_io+0x8a>
  30c494:	83 f8 06             	cmp    $0x6,%eax
  30c497:	74 19                	je     30c4b2 <_io+0x76>
  30c499:	e9 f0 00 00 00       	jmp    30c58e <_io+0x152>
  30c49e:	b8 fe 03 00 00       	mov    $0x3fe,%eax
  30c4a3:	89 c2                	mov    %eax,%edx
  30c4a5:	ec                   	in     (%dx),%al
  30c4a6:	eb 00                	jmp    30c4a8 <_io+0x6c>
  30c4a8:	eb 00                	jmp    30c4aa <_io+0x6e>
  30c4aa:	88 45 df             	mov    %al,-0x21(%ebp)
  30c4ad:	e9 dc 00 00 00       	jmp    30c58e <_io+0x152>
  30c4b2:	b8 fd 03 00 00       	mov    $0x3fd,%eax
  30c4b7:	89 c2                	mov    %eax,%edx
  30c4b9:	ec                   	in     (%dx),%al
  30c4ba:	eb 00                	jmp    30c4bc <_io+0x80>
  30c4bc:	eb 00                	jmp    30c4be <_io+0x82>
  30c4be:	88 45 de             	mov    %al,-0x22(%ebp)
  30c4c1:	e9 c8 00 00 00       	jmp    30c58e <_io+0x152>
  30c4c6:	b8 f8 03 00 00       	mov    $0x3f8,%eax
  30c4cb:	89 c2                	mov    %eax,%edx
  30c4cd:	ec                   	in     (%dx),%al
  30c4ce:	eb 00                	jmp    30c4d0 <_io+0x94>
  30c4d0:	eb 00                	jmp    30c4d2 <_io+0x96>
  30c4d2:	88 45 dd             	mov    %al,-0x23(%ebp)
  30c4d5:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  30c4d9:	0f b6 c0             	movzbl %al,%eax
  30c4dc:	83 ec 08             	sub    $0x8,%esp
  30c4df:	50                   	push   %eax
  30c4e0:	68 80 e5 30 00       	push   $0x30e580
  30c4e5:	e8 6a 91 ff ff       	call   305654 <printk>
  30c4ea:	83 c4 10             	add    $0x10,%esp
  30c4ed:	e9 9c 00 00 00       	jmp    30c58e <_io+0x152>
  30c4f2:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c4f7:	85 c0                	test   %eax,%eax
  30c4f9:	74 6f                	je     30c56a <_io+0x12e>
  30c4fb:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c500:	8b 50 08             	mov    0x8(%eax),%edx
  30c503:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c508:	8b 40 04             	mov    0x4(%eax),%eax
  30c50b:	39 c2                	cmp    %eax,%edx
  30c50d:	73 2f                	jae    30c53e <_io+0x102>
  30c50f:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c514:	8b 50 0c             	mov    0xc(%eax),%edx
  30c517:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c51c:	8b 40 08             	mov    0x8(%eax),%eax
  30c51f:	01 d0                	add    %edx,%eax
  30c521:	0f b6 00             	movzbl (%eax),%eax
  30c524:	ba f8 03 00 00       	mov    $0x3f8,%edx
  30c529:	ee                   	out    %al,(%dx)
  30c52a:	eb 00                	jmp    30c52c <_io+0xf0>
  30c52c:	eb 00                	jmp    30c52e <_io+0xf2>
  30c52e:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c533:	8b 50 08             	mov    0x8(%eax),%edx
  30c536:	83 c2 01             	add    $0x1,%edx
  30c539:	89 50 08             	mov    %edx,0x8(%eax)
  30c53c:	eb 4f                	jmp    30c58d <_io+0x151>
  30c53e:	a1 4c 50 31 00       	mov    0x31504c,%eax
  30c543:	8b 18                	mov    (%eax),%ebx
  30c545:	b8 02 00 00 00       	mov    $0x2,%eax
  30c54a:	b9 00 00 00 00       	mov    $0x0,%ecx
  30c54f:	ba 00 00 00 00       	mov    $0x0,%edx
  30c554:	be 00 00 00 00       	mov    $0x0,%esi
  30c559:	bf 00 00 00 00       	mov    $0x0,%edi
  30c55e:	cd 80                	int    $0x80
  30c560:	89 45 d8             	mov    %eax,-0x28(%ebp)
  30c563:	e8 1c fe ff ff       	call   30c384 <rs_pop>
  30c568:	eb 88                	jmp    30c4f2 <_io+0xb6>
  30c56a:	b8 f9 03 00 00       	mov    $0x3f9,%eax
  30c56f:	89 c2                	mov    %eax,%edx
  30c571:	ec                   	in     (%dx),%al
  30c572:	eb 00                	jmp    30c574 <_io+0x138>
  30c574:	eb 00                	jmp    30c576 <_io+0x13a>
  30c576:	88 45 d7             	mov    %al,-0x29(%ebp)
  30c579:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
  30c57d:	0f b6 c0             	movzbl %al,%eax
  30c580:	83 e0 0d             	and    $0xd,%eax
  30c583:	ba f9 03 00 00       	mov    $0x3f9,%edx
  30c588:	ee                   	out    %al,(%dx)
  30c589:	eb 00                	jmp    30c58b <_io+0x14f>
  30c58b:	eb 00                	jmp    30c58d <_io+0x151>
  30c58d:	90                   	nop
  30c58e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30c591:	5b                   	pop    %ebx
  30c592:	5e                   	pop    %esi
  30c593:	5f                   	pop    %edi
  30c594:	5d                   	pop    %ebp
  30c595:	c3                   	ret    

0030c596 <rs_init>:
  30c596:	55                   	push   %ebp
  30c597:	89 e5                	mov    %esp,%ebp
  30c599:	57                   	push   %edi
  30c59a:	56                   	push   %esi
  30c59b:	53                   	push   %ebx
  30c59c:	83 ec 1c             	sub    $0x1c,%esp
  30c59f:	68 f8 03 00 00       	push   $0x3f8
  30c5a4:	e8 0b fd ff ff       	call   30c2b4 <sl_init>
  30c5a9:	83 c4 04             	add    $0x4,%esp
  30c5ac:	b8 03 00 00 00       	mov    $0x3,%eax
  30c5b1:	bb 01 00 00 00       	mov    $0x1,%ebx
  30c5b6:	b9 ba c3 30 00       	mov    $0x30c3ba,%ecx
  30c5bb:	ba 00 00 00 00       	mov    $0x0,%edx
  30c5c0:	be 00 00 00 00       	mov    $0x0,%esi
  30c5c5:	bf 00 00 00 00       	mov    $0x0,%edi
  30c5ca:	cd 80                	int    $0x80
  30c5cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30c5cf:	b8 03 00 00 00       	mov    $0x3,%eax
  30c5d4:	bb 06 00 00 00       	mov    $0x6,%ebx
  30c5d9:	b9 3c c4 30 00       	mov    $0x30c43c,%ecx
  30c5de:	ba 00 00 00 00       	mov    $0x0,%edx
  30c5e3:	be 00 00 00 00       	mov    $0x0,%esi
  30c5e8:	bf 00 00 00 00       	mov    $0x0,%edi
  30c5ed:	cd 80                	int    $0x80
  30c5ef:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30c5f2:	83 ec 08             	sub    $0x8,%esp
  30c5f5:	68 22 c3 30 00       	push   $0x30c322
  30c5fa:	6a 04                	push   $0x4
  30c5fc:	e8 d6 96 ff ff       	call   305cd7 <put_irq_handler>
  30c601:	83 c4 10             	add    $0x10,%esp
  30c604:	83 ec 0c             	sub    $0xc,%esp
  30c607:	6a 04                	push   $0x4
  30c609:	e8 0c 96 ff ff       	call   305c1a <enable_irq>
  30c60e:	83 c4 10             	add    $0x10,%esp
  30c611:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30c614:	5b                   	pop    %ebx
  30c615:	5e                   	pop    %esi
  30c616:	5f                   	pop    %edi
  30c617:	5d                   	pop    %ebp
  30c618:	c3                   	ret    

0030c619 <rs_main>:
  30c619:	55                   	push   %ebp
  30c61a:	89 e5                	mov    %esp,%ebp
  30c61c:	83 ec 08             	sub    $0x8,%esp
  30c61f:	e8 72 ff ff ff       	call   30c596 <rs_init>
  30c624:	e8 ab 05 00 00       	call   30cbd4 <dorun>
  30c629:	b8 00 00 00 00       	mov    $0x0,%eax
  30c62e:	c9                   	leave  
  30c62f:	c3                   	ret    

0030c630 <memcpy>:
  30c630:	55                   	push   %ebp
  30c631:	89 e5                	mov    %esp,%ebp
  30c633:	57                   	push   %edi
  30c634:	56                   	push   %esi
  30c635:	53                   	push   %ebx
  30c636:	8b 45 10             	mov    0x10(%ebp),%eax
  30c639:	8b 55 0c             	mov    0xc(%ebp),%edx
  30c63c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30c63f:	89 c1                	mov    %eax,%ecx
  30c641:	89 d6                	mov    %edx,%esi
  30c643:	89 df                	mov    %ebx,%edi
  30c645:	fc                   	cld    
  30c646:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  30c648:	8b 45 08             	mov    0x8(%ebp),%eax
  30c64b:	5b                   	pop    %ebx
  30c64c:	5e                   	pop    %esi
  30c64d:	5f                   	pop    %edi
  30c64e:	5d                   	pop    %ebp
  30c64f:	c3                   	ret    

0030c650 <push>:
  30c650:	55                   	push   %ebp
  30c651:	89 e5                	mov    %esp,%ebp
  30c653:	83 ec 04             	sub    $0x4,%esp
  30c656:	8b 45 08             	mov    0x8(%ebp),%eax
  30c659:	88 45 fc             	mov    %al,-0x4(%ebp)
  30c65c:	8b 15 40 5f 31 00    	mov    0x315f40,%edx
  30c662:	a1 44 5f 31 00       	mov    0x315f44,%eax
  30c667:	39 c2                	cmp    %eax,%edx
  30c669:	75 09                	jne    30c674 <push+0x24>
  30c66b:	a1 48 5f 31 00       	mov    0x315f48,%eax
  30c670:	85 c0                	test   %eax,%eax
  30c672:	75 51                	jne    30c6c5 <push+0x75>
  30c674:	a1 40 5f 31 00       	mov    0x315f40,%eax
  30c679:	8d 48 01             	lea    0x1(%eax),%ecx
  30c67c:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  30c681:	89 c8                	mov    %ecx,%eax
  30c683:	f7 ea                	imul   %edx
  30c685:	c1 fa 04             	sar    $0x4,%edx
  30c688:	89 c8                	mov    %ecx,%eax
  30c68a:	c1 f8 1f             	sar    $0x1f,%eax
  30c68d:	29 c2                	sub    %eax,%edx
  30c68f:	89 d0                	mov    %edx,%eax
  30c691:	6b c0 32             	imul   $0x32,%eax,%eax
  30c694:	29 c1                	sub    %eax,%ecx
  30c696:	89 c8                	mov    %ecx,%eax
  30c698:	a3 40 5f 31 00       	mov    %eax,0x315f40
  30c69d:	a1 40 5f 31 00       	mov    0x315f40,%eax
  30c6a2:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
  30c6a6:	88 90 4c 5f 31 00    	mov    %dl,0x315f4c(%eax)
  30c6ac:	8b 15 40 5f 31 00    	mov    0x315f40,%edx
  30c6b2:	a1 44 5f 31 00       	mov    0x315f44,%eax
  30c6b7:	39 c2                	cmp    %eax,%edx
  30c6b9:	75 0a                	jne    30c6c5 <push+0x75>
  30c6bb:	c7 05 48 5f 31 00 01 	movl   $0x1,0x315f48
  30c6c2:	00 00 00 
  30c6c5:	c9                   	leave  
  30c6c6:	c3                   	ret    

0030c6c7 <pop>:
  30c6c7:	55                   	push   %ebp
  30c6c8:	89 e5                	mov    %esp,%ebp
  30c6ca:	83 ec 10             	sub    $0x10,%esp
  30c6cd:	c6 45 ff ff          	movb   $0xff,-0x1(%ebp)
  30c6d1:	8b 15 44 5f 31 00    	mov    0x315f44,%edx
  30c6d7:	a1 40 5f 31 00       	mov    0x315f40,%eax
  30c6dc:	39 c2                	cmp    %eax,%edx
  30c6de:	75 09                	jne    30c6e9 <pop+0x22>
  30c6e0:	a1 48 5f 31 00       	mov    0x315f48,%eax
  30c6e5:	85 c0                	test   %eax,%eax
  30c6e7:	74 51                	je     30c73a <pop+0x73>
  30c6e9:	a1 44 5f 31 00       	mov    0x315f44,%eax
  30c6ee:	0f b6 80 4c 5f 31 00 	movzbl 0x315f4c(%eax),%eax
  30c6f5:	88 45 ff             	mov    %al,-0x1(%ebp)
  30c6f8:	a1 44 5f 31 00       	mov    0x315f44,%eax
  30c6fd:	8d 48 01             	lea    0x1(%eax),%ecx
  30c700:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  30c705:	89 c8                	mov    %ecx,%eax
  30c707:	f7 ea                	imul   %edx
  30c709:	c1 fa 04             	sar    $0x4,%edx
  30c70c:	89 c8                	mov    %ecx,%eax
  30c70e:	c1 f8 1f             	sar    $0x1f,%eax
  30c711:	29 c2                	sub    %eax,%edx
  30c713:	89 d0                	mov    %edx,%eax
  30c715:	6b c0 32             	imul   $0x32,%eax,%eax
  30c718:	29 c1                	sub    %eax,%ecx
  30c71a:	89 c8                	mov    %ecx,%eax
  30c71c:	a3 44 5f 31 00       	mov    %eax,0x315f44
  30c721:	8b 15 44 5f 31 00    	mov    0x315f44,%edx
  30c727:	a1 40 5f 31 00       	mov    0x315f40,%eax
  30c72c:	39 c2                	cmp    %eax,%edx
  30c72e:	75 0a                	jne    30c73a <pop+0x73>
  30c730:	c7 05 48 5f 31 00 00 	movl   $0x0,0x315f48
  30c737:	00 00 00 
  30c73a:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  30c73e:	c9                   	leave  
  30c73f:	c3                   	ret    

0030c740 <keyboard_handler>:
  30c740:	55                   	push   %ebp
  30c741:	89 e5                	mov    %esp,%ebp
  30c743:	83 ec 18             	sub    $0x18,%esp
  30c746:	b8 60 00 00 00       	mov    $0x60,%eax
  30c74b:	89 c2                	mov    %eax,%edx
  30c74d:	ec                   	in     (%dx),%al
  30c74e:	88 45 f7             	mov    %al,-0x9(%ebp)
  30c751:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  30c755:	88 45 f6             	mov    %al,-0xa(%ebp)
  30c758:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  30c75c:	50                   	push   %eax
  30c75d:	e8 ee fe ff ff       	call   30c650 <push>
  30c762:	83 c4 04             	add    $0x4,%esp
  30c765:	83 ec 0c             	sub    $0xc,%esp
  30c768:	6a 00                	push   $0x0
  30c76a:	6a 00                	push   $0x0
  30c76c:	6a 00                	push   $0x0
  30c76e:	6a 06                	push   $0x6
  30c770:	ff 75 08             	pushl  0x8(%ebp)
  30c773:	e8 38 a2 ff ff       	call   3069b0 <doint>
  30c778:	83 c4 20             	add    $0x20,%esp
  30c77b:	b8 00 00 00 00       	mov    $0x0,%eax
  30c780:	c9                   	leave  
  30c781:	c3                   	ret    

0030c782 <_ispress>:
  30c782:	55                   	push   %ebp
  30c783:	89 e5                	mov    %esp,%ebp
  30c785:	57                   	push   %edi
  30c786:	56                   	push   %esi
  30c787:	53                   	push   %ebx
  30c788:	83 ec 10             	sub    $0x10,%esp
  30c78b:	8b 45 08             	mov    0x8(%ebp),%eax
  30c78e:	8b 58 3c             	mov    0x3c(%eax),%ebx
  30c791:	8b 0d c0 51 31 00    	mov    0x3151c0,%ecx
  30c797:	b8 02 00 00 00       	mov    $0x2,%eax
  30c79c:	ba 00 00 00 00       	mov    $0x0,%edx
  30c7a1:	be 00 00 00 00       	mov    $0x0,%esi
  30c7a6:	bf 00 00 00 00       	mov    $0x0,%edi
  30c7ab:	cd 80                	int    $0x80
  30c7ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30c7b0:	83 c4 10             	add    $0x10,%esp
  30c7b3:	5b                   	pop    %ebx
  30c7b4:	5e                   	pop    %esi
  30c7b5:	5f                   	pop    %edi
  30c7b6:	5d                   	pop    %ebp
  30c7b7:	c3                   	ret    

0030c7b8 <_input>:
  30c7b8:	55                   	push   %ebp
  30c7b9:	89 e5                	mov    %esp,%ebp
  30c7bb:	83 ec 18             	sub    $0x18,%esp
  30c7be:	e8 04 ff ff ff       	call   30c6c7 <pop>
  30c7c3:	0f b6 c0             	movzbl %al,%eax
  30c7c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30c7c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30c7cc:	83 f8 2a             	cmp    $0x2a,%eax
  30c7cf:	0f 84 87 00 00 00    	je     30c85c <_input+0xa4>
  30c7d5:	83 f8 2a             	cmp    $0x2a,%eax
  30c7d8:	77 39                	ja     30c813 <_input+0x5b>
  30c7da:	83 f8 1b             	cmp    $0x1b,%eax
  30c7dd:	77 1d                	ja     30c7fc <_input+0x44>
  30c7df:	83 f8 0f             	cmp    $0xf,%eax
  30c7e2:	0f 83 c4 00 00 00    	jae    30c8ac <_input+0xf4>
  30c7e8:	83 f8 01             	cmp    $0x1,%eax
  30c7eb:	0f 82 9d 01 00 00    	jb     30c98e <_input+0x1d6>
  30c7f1:	83 f8 0d             	cmp    $0xd,%eax
  30c7f4:	0f 86 b2 00 00 00    	jbe    30c8ac <_input+0xf4>
  30c7fa:	eb 7e                	jmp    30c87a <_input+0xc2>
  30c7fc:	83 f8 1c             	cmp    $0x1c,%eax
  30c7ff:	0f 84 04 01 00 00    	je     30c909 <_input+0x151>
  30c805:	83 f8 1e             	cmp    $0x1e,%eax
  30c808:	0f 82 80 01 00 00    	jb     30c98e <_input+0x1d6>
  30c80e:	e9 99 00 00 00       	jmp    30c8ac <_input+0xf4>
  30c813:	83 f8 39             	cmp    $0x39,%eax
  30c816:	0f 84 90 00 00 00    	je     30c8ac <_input+0xf4>
  30c81c:	83 f8 39             	cmp    $0x39,%eax
  30c81f:	77 13                	ja     30c834 <_input+0x7c>
  30c821:	83 f8 35             	cmp    $0x35,%eax
  30c824:	0f 86 82 00 00 00    	jbe    30c8ac <_input+0xf4>
  30c82a:	83 f8 36             	cmp    $0x36,%eax
  30c82d:	74 2d                	je     30c85c <_input+0xa4>
  30c82f:	e9 5a 01 00 00       	jmp    30c98e <_input+0x1d6>
  30c834:	3d aa 00 00 00       	cmp    $0xaa,%eax
  30c839:	74 30                	je     30c86b <_input+0xb3>
  30c83b:	3d aa 00 00 00       	cmp    $0xaa,%eax
  30c840:	77 0e                	ja     30c850 <_input+0x98>
  30c842:	83 e8 47             	sub    $0x47,%eax
  30c845:	83 f8 0c             	cmp    $0xc,%eax
  30c848:	0f 87 40 01 00 00    	ja     30c98e <_input+0x1d6>
  30c84e:	eb 5c                	jmp    30c8ac <_input+0xf4>
  30c850:	3d b6 00 00 00       	cmp    $0xb6,%eax
  30c855:	74 14                	je     30c86b <_input+0xb3>
  30c857:	e9 32 01 00 00       	jmp    30c98e <_input+0x1d6>
  30c85c:	c7 05 54 31 31 00 c0 	movl   $0x30e9c0,0x313154
  30c863:	e9 30 00 
  30c866:	e9 23 01 00 00       	jmp    30c98e <_input+0x1d6>
  30c86b:	c7 05 54 31 31 00 c0 	movl   $0x30e5c0,0x313154
  30c872:	e5 30 00 
  30c875:	e9 14 01 00 00       	jmp    30c98e <_input+0x1d6>
  30c87a:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c87f:	85 c0                	test   %eax,%eax
  30c881:	74 24                	je     30c8a7 <_input+0xef>
  30c883:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c888:	83 e8 01             	sub    $0x1,%eax
  30c88b:	a3 c0 51 31 00       	mov    %eax,0x3151c0
  30c890:	83 ec 08             	sub    $0x8,%esp
  30c893:	6a 08                	push   $0x8
  30c895:	68 c0 ed 30 00       	push   $0x30edc0
  30c89a:	e8 b5 8d ff ff       	call   305654 <printk>
  30c89f:	83 c4 10             	add    $0x10,%esp
  30c8a2:	e9 e7 00 00 00       	jmp    30c98e <_input+0x1d6>
  30c8a7:	e9 e2 00 00 00       	jmp    30c98e <_input+0x1d6>
  30c8ac:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c8b1:	3d fe 00 00 00       	cmp    $0xfe,%eax
  30c8b6:	77 4c                	ja     30c904 <_input+0x14c>
  30c8b8:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c8bd:	8d 50 01             	lea    0x1(%eax),%edx
  30c8c0:	89 15 c0 51 31 00    	mov    %edx,0x3151c0
  30c8c6:	8b 15 54 31 31 00    	mov    0x313154,%edx
  30c8cc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  30c8cf:	c1 e1 02             	shl    $0x2,%ecx
  30c8d2:	01 ca                	add    %ecx,%edx
  30c8d4:	8b 12                	mov    (%edx),%edx
  30c8d6:	88 90 c0 50 31 00    	mov    %dl,0x3150c0(%eax)
  30c8dc:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c8e1:	83 e8 01             	sub    $0x1,%eax
  30c8e4:	0f b6 80 c0 50 31 00 	movzbl 0x3150c0(%eax),%eax
  30c8eb:	0f be c0             	movsbl %al,%eax
  30c8ee:	83 ec 08             	sub    $0x8,%esp
  30c8f1:	50                   	push   %eax
  30c8f2:	68 c0 ed 30 00       	push   $0x30edc0
  30c8f7:	e8 58 8d ff ff       	call   305654 <printk>
  30c8fc:	83 c4 10             	add    $0x10,%esp
  30c8ff:	e9 8a 00 00 00       	jmp    30c98e <_input+0x1d6>
  30c904:	e9 85 00 00 00       	jmp    30c98e <_input+0x1d6>
  30c909:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c90e:	3d fe 00 00 00       	cmp    $0xfe,%eax
  30c913:	77 47                	ja     30c95c <_input+0x1a4>
  30c915:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c91a:	8d 50 01             	lea    0x1(%eax),%edx
  30c91d:	89 15 c0 51 31 00    	mov    %edx,0x3151c0
  30c923:	8b 15 54 31 31 00    	mov    0x313154,%edx
  30c929:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  30c92c:	c1 e1 02             	shl    $0x2,%ecx
  30c92f:	01 ca                	add    %ecx,%edx
  30c931:	8b 12                	mov    (%edx),%edx
  30c933:	88 90 c0 50 31 00    	mov    %dl,0x3150c0(%eax)
  30c939:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c93e:	83 e8 01             	sub    $0x1,%eax
  30c941:	0f b6 80 c0 50 31 00 	movzbl 0x3150c0(%eax),%eax
  30c948:	0f be c0             	movsbl %al,%eax
  30c94b:	83 ec 08             	sub    $0x8,%esp
  30c94e:	50                   	push   %eax
  30c94f:	68 c0 ed 30 00       	push   $0x30edc0
  30c954:	e8 fb 8c ff ff       	call   305654 <printk>
  30c959:	83 c4 10             	add    $0x10,%esp
  30c95c:	a1 c4 51 31 00       	mov    0x3151c4,%eax
  30c961:	85 c0                	test   %eax,%eax
  30c963:	74 28                	je     30c98d <_input+0x1d5>
  30c965:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c96a:	85 c0                	test   %eax,%eax
  30c96c:	74 1f                	je     30c98d <_input+0x1d5>
  30c96e:	8b 0d c8 51 31 00    	mov    0x3151c8,%ecx
  30c974:	8b 15 cc 51 31 00    	mov    0x3151cc,%edx
  30c97a:	a1 c4 51 31 00       	mov    0x3151c4,%eax
  30c97f:	83 ec 04             	sub    $0x4,%esp
  30c982:	51                   	push   %ecx
  30c983:	52                   	push   %edx
  30c984:	50                   	push   %eax
  30c985:	e8 06 00 00 00       	call   30c990 <copy_buffer>
  30c98a:	83 c4 10             	add    $0x10,%esp
  30c98d:	90                   	nop
  30c98e:	c9                   	leave  
  30c98f:	c3                   	ret    

0030c990 <copy_buffer>:
  30c990:	55                   	push   %ebp
  30c991:	89 e5                	mov    %esp,%ebp
  30c993:	57                   	push   %edi
  30c994:	56                   	push   %esi
  30c995:	53                   	push   %ebx
  30c996:	83 ec 10             	sub    $0x10,%esp
  30c999:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  30c9a0:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c9a5:	85 c0                	test   %eax,%eax
  30c9a7:	75 1d                	jne    30c9c6 <copy_buffer+0x36>
  30c9a9:	8b 45 08             	mov    0x8(%ebp),%eax
  30c9ac:	a3 c4 51 31 00       	mov    %eax,0x3151c4
  30c9b1:	8b 45 10             	mov    0x10(%ebp),%eax
  30c9b4:	a3 c8 51 31 00       	mov    %eax,0x3151c8
  30c9b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  30c9bc:	a3 cc 51 31 00       	mov    %eax,0x3151cc
  30c9c1:	e9 b5 00 00 00       	jmp    30ca7b <copy_buffer+0xeb>
  30c9c6:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c9cb:	39 45 10             	cmp    %eax,0x10(%ebp)
  30c9ce:	72 2a                	jb     30c9fa <copy_buffer+0x6a>
  30c9d0:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c9d5:	50                   	push   %eax
  30c9d6:	68 c0 50 31 00       	push   $0x3150c0
  30c9db:	ff 75 0c             	pushl  0xc(%ebp)
  30c9de:	e8 4d fc ff ff       	call   30c630 <memcpy>
  30c9e3:	83 c4 0c             	add    $0xc,%esp
  30c9e6:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30c9eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30c9ee:	c7 05 c0 51 31 00 00 	movl   $0x0,0x3151c0
  30c9f5:	00 00 00 
  30c9f8:	eb 44                	jmp    30ca3e <copy_buffer+0xae>
  30c9fa:	8b 45 10             	mov    0x10(%ebp),%eax
  30c9fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30ca00:	8b 45 10             	mov    0x10(%ebp),%eax
  30ca03:	50                   	push   %eax
  30ca04:	68 c0 50 31 00       	push   $0x3150c0
  30ca09:	ff 75 0c             	pushl  0xc(%ebp)
  30ca0c:	e8 1f fc ff ff       	call   30c630 <memcpy>
  30ca11:	83 c4 0c             	add    $0xc,%esp
  30ca14:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30ca19:	2b 45 10             	sub    0x10(%ebp),%eax
  30ca1c:	a3 c0 51 31 00       	mov    %eax,0x3151c0
  30ca21:	a1 c0 51 31 00       	mov    0x3151c0,%eax
  30ca26:	8b 55 10             	mov    0x10(%ebp),%edx
  30ca29:	81 c2 c0 50 31 00    	add    $0x3150c0,%edx
  30ca2f:	50                   	push   %eax
  30ca30:	52                   	push   %edx
  30ca31:	68 c0 50 31 00       	push   $0x3150c0
  30ca36:	e8 f5 fb ff ff       	call   30c630 <memcpy>
  30ca3b:	83 c4 0c             	add    $0xc,%esp
  30ca3e:	b8 02 00 00 00       	mov    $0x2,%eax
  30ca43:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30ca46:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  30ca49:	ba 00 00 00 00       	mov    $0x0,%edx
  30ca4e:	be 00 00 00 00       	mov    $0x0,%esi
  30ca53:	bf 00 00 00 00       	mov    $0x0,%edi
  30ca58:	cd 80                	int    $0x80
  30ca5a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30ca5d:	c7 05 c4 51 31 00 00 	movl   $0x0,0x3151c4
  30ca64:	00 00 00 
  30ca67:	c7 05 c8 51 31 00 00 	movl   $0x0,0x3151c8
  30ca6e:	00 00 00 
  30ca71:	c7 05 cc 51 31 00 00 	movl   $0x0,0x3151cc
  30ca78:	00 00 00 
  30ca7b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30ca7e:	5b                   	pop    %ebx
  30ca7f:	5e                   	pop    %esi
  30ca80:	5f                   	pop    %edi
  30ca81:	5d                   	pop    %ebp
  30ca82:	c3                   	ret    

0030ca83 <_reset>:
  30ca83:	55                   	push   %ebp
  30ca84:	89 e5                	mov    %esp,%ebp
  30ca86:	57                   	push   %edi
  30ca87:	56                   	push   %esi
  30ca88:	53                   	push   %ebx
  30ca89:	83 ec 10             	sub    $0x10,%esp
  30ca8c:	b8 fe 00 00 00       	mov    $0xfe,%eax
  30ca91:	ba 64 00 00 00       	mov    $0x64,%edx
  30ca96:	ee                   	out    %al,(%dx)
  30ca97:	eb 00                	jmp    30ca99 <_reset+0x16>
  30ca99:	eb 00                	jmp    30ca9b <_reset+0x18>
  30ca9b:	8b 45 08             	mov    0x8(%ebp),%eax
  30ca9e:	8b 58 3c             	mov    0x3c(%eax),%ebx
  30caa1:	b8 02 00 00 00       	mov    $0x2,%eax
  30caa6:	b9 00 00 00 00       	mov    $0x0,%ecx
  30caab:	ba 00 00 00 00       	mov    $0x0,%edx
  30cab0:	be 00 00 00 00       	mov    $0x0,%esi
  30cab5:	bf 00 00 00 00       	mov    $0x0,%edi
  30caba:	cd 80                	int    $0x80
  30cabc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30cabf:	83 c4 10             	add    $0x10,%esp
  30cac2:	5b                   	pop    %ebx
  30cac3:	5e                   	pop    %esi
  30cac4:	5f                   	pop    %edi
  30cac5:	5d                   	pop    %ebp
  30cac6:	c3                   	ret    

0030cac7 <keyboard_init>:
  30cac7:	55                   	push   %ebp
  30cac8:	89 e5                	mov    %esp,%ebp
  30caca:	57                   	push   %edi
  30cacb:	56                   	push   %esi
  30cacc:	53                   	push   %ebx
  30cacd:	83 ec 1c             	sub    $0x1c,%esp
  30cad0:	c7 05 44 5f 31 00 00 	movl   $0x0,0x315f44
  30cad7:	00 00 00 
  30cada:	a1 44 5f 31 00       	mov    0x315f44,%eax
  30cadf:	a3 40 5f 31 00       	mov    %eax,0x315f40
  30cae4:	c7 05 48 5f 31 00 00 	movl   $0x0,0x315f48
  30caeb:	00 00 00 
  30caee:	b8 03 00 00 00       	mov    $0x3,%eax
  30caf3:	bb 06 00 00 00       	mov    $0x6,%ebx
  30caf8:	b9 b8 c7 30 00       	mov    $0x30c7b8,%ecx
  30cafd:	ba 00 00 00 00       	mov    $0x0,%edx
  30cb02:	be 00 00 00 00       	mov    $0x0,%esi
  30cb07:	bf 00 00 00 00       	mov    $0x0,%edi
  30cb0c:	cd 80                	int    $0x80
  30cb0e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30cb11:	b8 03 00 00 00       	mov    $0x3,%eax
  30cb16:	bb 03 00 00 00       	mov    $0x3,%ebx
  30cb1b:	b9 83 ca 30 00       	mov    $0x30ca83,%ecx
  30cb20:	ba 00 00 00 00       	mov    $0x0,%edx
  30cb25:	be 00 00 00 00       	mov    $0x0,%esi
  30cb2a:	bf 00 00 00 00       	mov    $0x0,%edi
  30cb2f:	cd 80                	int    $0x80
  30cb31:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30cb34:	b8 03 00 00 00       	mov    $0x3,%eax
  30cb39:	bb 0a 00 00 00       	mov    $0xa,%ebx
  30cb3e:	b9 82 c7 30 00       	mov    $0x30c782,%ecx
  30cb43:	ba 00 00 00 00       	mov    $0x0,%edx
  30cb48:	be 00 00 00 00       	mov    $0x0,%esi
  30cb4d:	bf 00 00 00 00       	mov    $0x0,%edi
  30cb52:	cd 80                	int    $0x80
  30cb54:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30cb57:	83 ec 08             	sub    $0x8,%esp
  30cb5a:	68 40 c7 30 00       	push   $0x30c740
  30cb5f:	6a 01                	push   $0x1
  30cb61:	e8 71 91 ff ff       	call   305cd7 <put_irq_handler>
  30cb66:	83 c4 10             	add    $0x10,%esp
  30cb69:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30cb6c:	5b                   	pop    %ebx
  30cb6d:	5e                   	pop    %esi
  30cb6e:	5f                   	pop    %edi
  30cb6f:	5d                   	pop    %ebp
  30cb70:	c3                   	ret    
  30cb71:	66 90                	xchg   %ax,%ax
  30cb73:	90                   	nop

0030cb74 <_run>:
  30cb74:	55                   	push   %ebp
  30cb75:	89 e5                	mov    %esp,%ebp
  30cb77:	57                   	push   %edi
  30cb78:	56                   	push   %esi
  30cb79:	53                   	push   %ebx
  30cb7a:	83 ec 10             	sub    $0x10,%esp
  30cb7d:	8b 55 10             	mov    0x10(%ebp),%edx
  30cb80:	8b 75 18             	mov    0x18(%ebp),%esi
  30cb83:	8b 7d 14             	mov    0x14(%ebp),%edi
  30cb86:	b8 00 00 00 00       	mov    $0x0,%eax
  30cb8b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30cb8e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30cb91:	cd 80                	int    $0x80
  30cb93:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30cb96:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30cb99:	83 c4 10             	add    $0x10,%esp
  30cb9c:	5b                   	pop    %ebx
  30cb9d:	5e                   	pop    %esi
  30cb9e:	5f                   	pop    %edi
  30cb9f:	5d                   	pop    %ebp
  30cba0:	c3                   	ret    

0030cba1 <fork>:
  30cba1:	55                   	push   %ebp
  30cba2:	89 e5                	mov    %esp,%ebp
  30cba4:	83 ec 10             	sub    $0x10,%esp
  30cba7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30cbae:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  30cbb5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30cbbc:	ff 75 fc             	pushl  -0x4(%ebp)
  30cbbf:	ff 75 f8             	pushl  -0x8(%ebp)
  30cbc2:	ff 75 f4             	pushl  -0xc(%ebp)
  30cbc5:	6a 04                	push   $0x4
  30cbc7:	6a 03                	push   $0x3
  30cbc9:	e8 a6 ff ff ff       	call   30cb74 <_run>
  30cbce:	83 c4 14             	add    $0x14,%esp
  30cbd1:	c9                   	leave  
  30cbd2:	c3                   	ret    
  30cbd3:	90                   	nop

0030cbd4 <dorun>:
  30cbd4:	55                   	push   %ebp
  30cbd5:	89 e5                	mov    %esp,%ebp
  30cbd7:	57                   	push   %edi
  30cbd8:	56                   	push   %esi
  30cbd9:	53                   	push   %ebx
  30cbda:	83 ec 1c             	sub    $0x1c,%esp
  30cbdd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  30cbe4:	b8 01 00 00 00       	mov    $0x1,%eax
  30cbe9:	bb 00 00 00 00       	mov    $0x0,%ebx
  30cbee:	b9 00 00 00 00       	mov    $0x0,%ecx
  30cbf3:	ba 00 00 00 00       	mov    $0x0,%edx
  30cbf8:	be 00 00 00 00       	mov    $0x0,%esi
  30cbfd:	bf 00 00 00 00       	mov    $0x0,%edi
  30cc02:	cd 80                	int    $0x80
  30cc04:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30cc07:	8b 45 e0             	mov    -0x20(%ebp),%eax
  30cc0a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30cc0d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30cc10:	8b 40 5c             	mov    0x5c(%eax),%eax
  30cc13:	85 c0                	test   %eax,%eax
  30cc15:	78 3c                	js     30cc53 <dorun+0x7f>
  30cc17:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30cc1a:	8b 40 5c             	mov    0x5c(%eax),%eax
  30cc1d:	83 f8 0f             	cmp    $0xf,%eax
  30cc20:	7f 31                	jg     30cc53 <dorun+0x7f>
  30cc22:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30cc25:	8b 50 5c             	mov    0x5c(%eax),%edx
  30cc28:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30cc2b:	83 c2 14             	add    $0x14,%edx
  30cc2e:	8b 44 90 10          	mov    0x10(%eax,%edx,4),%eax
  30cc32:	85 c0                	test   %eax,%eax
  30cc34:	74 1d                	je     30cc53 <dorun+0x7f>
  30cc36:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30cc39:	8b 50 5c             	mov    0x5c(%eax),%edx
  30cc3c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30cc3f:	83 c2 14             	add    $0x14,%edx
  30cc42:	8b 44 90 10          	mov    0x10(%eax,%edx,4),%eax
  30cc46:	83 ec 0c             	sub    $0xc,%esp
  30cc49:	ff 75 e4             	pushl  -0x1c(%ebp)
  30cc4c:	ff d0                	call   *%eax
  30cc4e:	83 c4 10             	add    $0x10,%esp
  30cc51:	eb 24                	jmp    30cc77 <dorun+0xa3>
  30cc53:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30cc56:	8b 58 3c             	mov    0x3c(%eax),%ebx
  30cc59:	b8 02 00 00 00       	mov    $0x2,%eax
  30cc5e:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30cc63:	ba 00 00 00 00       	mov    $0x0,%edx
  30cc68:	be 00 00 00 00       	mov    $0x0,%esi
  30cc6d:	bf 00 00 00 00       	mov    $0x0,%edi
  30cc72:	cd 80                	int    $0x80
  30cc74:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30cc77:	e9 68 ff ff ff       	jmp    30cbe4 <dorun+0x10>

0030cc7c <_run>:
  30cc7c:	55                   	push   %ebp
  30cc7d:	89 e5                	mov    %esp,%ebp
  30cc7f:	57                   	push   %edi
  30cc80:	56                   	push   %esi
  30cc81:	53                   	push   %ebx
  30cc82:	83 ec 10             	sub    $0x10,%esp
  30cc85:	8b 55 10             	mov    0x10(%ebp),%edx
  30cc88:	8b 75 18             	mov    0x18(%ebp),%esi
  30cc8b:	8b 7d 14             	mov    0x14(%ebp),%edi
  30cc8e:	b8 00 00 00 00       	mov    $0x0,%eax
  30cc93:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30cc96:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30cc99:	cd 80                	int    $0x80
  30cc9b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30cc9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30cca1:	83 c4 10             	add    $0x10,%esp
  30cca4:	5b                   	pop    %ebx
  30cca5:	5e                   	pop    %esi
  30cca6:	5f                   	pop    %edi
  30cca7:	5d                   	pop    %ebp
  30cca8:	c3                   	ret    

0030cca9 <lseek>:
  30cca9:	55                   	push   %ebp
  30ccaa:	89 e5                	mov    %esp,%ebp
  30ccac:	83 ec 10             	sub    $0x10,%esp
  30ccaf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30ccb6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  30ccbd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30ccc4:	8b 45 0c             	mov    0xc(%ebp),%eax
  30ccc7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30ccca:	8b 45 10             	mov    0x10(%ebp),%eax
  30cccd:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30ccd0:	ff 75 fc             	pushl  -0x4(%ebp)
  30ccd3:	ff 75 f8             	pushl  -0x8(%ebp)
  30ccd6:	ff 75 f4             	pushl  -0xc(%ebp)
  30ccd9:	6a 0c                	push   $0xc
  30ccdb:	ff 75 08             	pushl  0x8(%ebp)
  30ccde:	e8 99 ff ff ff       	call   30cc7c <_run>
  30cce3:	83 c4 14             	add    $0x14,%esp
  30cce6:	c9                   	leave  
  30cce7:	c3                   	ret    

0030cce8 <_run>:
  30cce8:	55                   	push   %ebp
  30cce9:	89 e5                	mov    %esp,%ebp
  30cceb:	57                   	push   %edi
  30ccec:	56                   	push   %esi
  30cced:	53                   	push   %ebx
  30ccee:	83 ec 10             	sub    $0x10,%esp
  30ccf1:	8b 55 10             	mov    0x10(%ebp),%edx
  30ccf4:	8b 75 18             	mov    0x18(%ebp),%esi
  30ccf7:	8b 7d 14             	mov    0x14(%ebp),%edi
  30ccfa:	b8 00 00 00 00       	mov    $0x0,%eax
  30ccff:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30cd02:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30cd05:	cd 80                	int    $0x80
  30cd07:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30cd0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30cd0d:	83 c4 10             	add    $0x10,%esp
  30cd10:	5b                   	pop    %ebx
  30cd11:	5e                   	pop    %esi
  30cd12:	5f                   	pop    %edi
  30cd13:	5d                   	pop    %ebp
  30cd14:	c3                   	ret    

0030cd15 <strcpy>:
  30cd15:	55                   	push   %ebp
  30cd16:	89 e5                	mov    %esp,%ebp
  30cd18:	57                   	push   %edi
  30cd19:	56                   	push   %esi
  30cd1a:	8b 55 0c             	mov    0xc(%ebp),%edx
  30cd1d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  30cd20:	89 d6                	mov    %edx,%esi
  30cd22:	89 cf                	mov    %ecx,%edi
  30cd24:	fc                   	cld    
  30cd25:	ac                   	lods   %ds:(%esi),%al
  30cd26:	aa                   	stos   %al,%es:(%edi)
  30cd27:	84 c0                	test   %al,%al
  30cd29:	75 fa                	jne    30cd25 <strcpy+0x10>
  30cd2b:	8b 45 08             	mov    0x8(%ebp),%eax
  30cd2e:	5e                   	pop    %esi
  30cd2f:	5f                   	pop    %edi
  30cd30:	5d                   	pop    %ebp
  30cd31:	c3                   	ret    

0030cd32 <strcat>:
  30cd32:	55                   	push   %ebp
  30cd33:	89 e5                	mov    %esp,%ebp
  30cd35:	57                   	push   %edi
  30cd36:	56                   	push   %esi
  30cd37:	53                   	push   %ebx
  30cd38:	8b 55 0c             	mov    0xc(%ebp),%edx
  30cd3b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30cd3e:	b8 00 00 00 00       	mov    $0x0,%eax
  30cd43:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30cd48:	89 d6                	mov    %edx,%esi
  30cd4a:	89 df                	mov    %ebx,%edi
  30cd4c:	fc                   	cld    
  30cd4d:	f2 ae                	repnz scas %es:(%edi),%al
  30cd4f:	4f                   	dec    %edi
  30cd50:	ac                   	lods   %ds:(%esi),%al
  30cd51:	aa                   	stos   %al,%es:(%edi)
  30cd52:	84 c0                	test   %al,%al
  30cd54:	75 fa                	jne    30cd50 <strcat+0x1e>
  30cd56:	8b 45 08             	mov    0x8(%ebp),%eax
  30cd59:	5b                   	pop    %ebx
  30cd5a:	5e                   	pop    %esi
  30cd5b:	5f                   	pop    %edi
  30cd5c:	5d                   	pop    %ebp
  30cd5d:	c3                   	ret    

0030cd5e <strlen>:
  30cd5e:	55                   	push   %ebp
  30cd5f:	89 e5                	mov    %esp,%ebp
  30cd61:	57                   	push   %edi
  30cd62:	8b 55 08             	mov    0x8(%ebp),%edx
  30cd65:	b8 00 00 00 00       	mov    $0x0,%eax
  30cd6a:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30cd6f:	89 d7                	mov    %edx,%edi
  30cd71:	fc                   	cld    
  30cd72:	f2 ae                	repnz scas %es:(%edi),%al
  30cd74:	f7 d1                	not    %ecx
  30cd76:	49                   	dec    %ecx
  30cd77:	89 c8                	mov    %ecx,%eax
  30cd79:	5f                   	pop    %edi
  30cd7a:	5d                   	pop    %ebp
  30cd7b:	c3                   	ret    

0030cd7c <exec>:
  30cd7c:	55                   	push   %ebp
  30cd7d:	89 e5                	mov    %esp,%ebp
  30cd7f:	57                   	push   %edi
  30cd80:	56                   	push   %esi
  30cd81:	53                   	push   %ebx
  30cd82:	81 ec bc 00 00 00    	sub    $0xbc,%esp
  30cd88:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  30cd8f:	c7 85 3b ff ff ff 2f 	movl   $0x6e69622f,-0xc5(%ebp)
  30cd96:	62 69 6e 
  30cd99:	c7 85 3f ff ff ff 2f 	movl   $0x2f,-0xc1(%ebp)
  30cda0:	00 00 00 
  30cda3:	8d 85 43 ff ff ff    	lea    -0xbd(%ebp),%eax
  30cda9:	ba 75 00 00 00       	mov    $0x75,%edx
  30cdae:	be 00 00 00 00       	mov    $0x0,%esi
  30cdb3:	89 30                	mov    %esi,(%eax)
  30cdb5:	89 74 10 fc          	mov    %esi,-0x4(%eax,%edx,1)
  30cdb9:	8d 58 04             	lea    0x4(%eax),%ebx
  30cdbc:	83 e3 fc             	and    $0xfffffffc,%ebx
  30cdbf:	29 d8                	sub    %ebx,%eax
  30cdc1:	01 c2                	add    %eax,%edx
  30cdc3:	83 e2 fc             	and    $0xfffffffc,%edx
  30cdc6:	c1 ea 02             	shr    $0x2,%edx
  30cdc9:	89 df                	mov    %ebx,%edi
  30cdcb:	89 d1                	mov    %edx,%ecx
  30cdcd:	89 f0                	mov    %esi,%eax
  30cdcf:	f3 ab                	rep stos %eax,%es:(%edi)
  30cdd1:	8b 45 08             	mov    0x8(%ebp),%eax
  30cdd4:	0f b6 00             	movzbl (%eax),%eax
  30cdd7:	3c 2e                	cmp    $0x2e,%al
  30cdd9:	74 0a                	je     30cde5 <exec+0x69>
  30cddb:	8b 45 08             	mov    0x8(%ebp),%eax
  30cdde:	0f b6 00             	movzbl (%eax),%eax
  30cde1:	3c 2f                	cmp    $0x2f,%al
  30cde3:	75 14                	jne    30cdf9 <exec+0x7d>
  30cde5:	ff 75 08             	pushl  0x8(%ebp)
  30cde8:	8d 85 3b ff ff ff    	lea    -0xc5(%ebp),%eax
  30cdee:	50                   	push   %eax
  30cdef:	e8 21 ff ff ff       	call   30cd15 <strcpy>
  30cdf4:	83 c4 08             	add    $0x8,%esp
  30cdf7:	eb 12                	jmp    30ce0b <exec+0x8f>
  30cdf9:	ff 75 08             	pushl  0x8(%ebp)
  30cdfc:	8d 85 3b ff ff ff    	lea    -0xc5(%ebp),%eax
  30ce02:	50                   	push   %eax
  30ce03:	e8 2a ff ff ff       	call   30cd32 <strcat>
  30ce08:	83 c4 08             	add    $0x8,%esp
  30ce0b:	83 ec 08             	sub    $0x8,%esp
  30ce0e:	6a 00                	push   $0x0
  30ce10:	8d 85 3b ff ff ff    	lea    -0xc5(%ebp),%eax
  30ce16:	50                   	push   %eax
  30ce17:	e8 a7 01 00 00       	call   30cfc3 <open>
  30ce1c:	83 c4 10             	add    $0x10,%esp
  30ce1f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  30ce22:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
  30ce26:	75 05                	jne    30ce2d <exec+0xb1>
  30ce28:	e9 eb 00 00 00       	jmp    30cf18 <exec+0x19c>
  30ce2d:	8b 45 d8             	mov    -0x28(%ebp),%eax
  30ce30:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  30ce33:	b8 1f 00 00 00       	mov    $0x1f,%eax
  30ce38:	83 7d 0c 1f          	cmpl   $0x1f,0xc(%ebp)
  30ce3c:	0f 4e 45 0c          	cmovle 0xc(%ebp),%eax
  30ce40:	89 45 d0             	mov    %eax,-0x30(%ebp)
  30ce43:	b8 04 00 00 00       	mov    $0x4,%eax
  30ce48:	bb 01 00 00 00       	mov    $0x1,%ebx
  30ce4d:	b9 00 00 00 00       	mov    $0x0,%ecx
  30ce52:	ba 00 00 00 00       	mov    $0x0,%edx
  30ce57:	be 00 00 00 00       	mov    $0x0,%esi
  30ce5c:	bf 00 00 00 00       	mov    $0x0,%edi
  30ce61:	cd 80                	int    $0x80
  30ce63:	89 45 cc             	mov    %eax,-0x34(%ebp)
  30ce66:	8b 45 cc             	mov    -0x34(%ebp),%eax
  30ce69:	89 45 c8             	mov    %eax,-0x38(%ebp)
  30ce6c:	8b 45 c8             	mov    -0x38(%ebp),%eax
  30ce6f:	83 e8 80             	sub    $0xffffff80,%eax
  30ce72:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30ce75:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  30ce7c:	eb 44                	jmp    30cec2 <exec+0x146>
  30ce7e:	8b 45 c8             	mov    -0x38(%ebp),%eax
  30ce81:	8b 55 dc             	mov    -0x24(%ebp),%edx
  30ce84:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  30ce87:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  30ce8a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30ce8d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30ce94:	8b 45 10             	mov    0x10(%ebp),%eax
  30ce97:	01 d0                	add    %edx,%eax
  30ce99:	8b 00                	mov    (%eax),%eax
  30ce9b:	83 ec 08             	sub    $0x8,%esp
  30ce9e:	50                   	push   %eax
  30ce9f:	ff 75 e0             	pushl  -0x20(%ebp)
  30cea2:	e8 6e fe ff ff       	call   30cd15 <strcpy>
  30cea7:	83 c4 10             	add    $0x10,%esp
  30ceaa:	83 ec 0c             	sub    $0xc,%esp
  30cead:	ff 75 e0             	pushl  -0x20(%ebp)
  30ceb0:	e8 a9 fe ff ff       	call   30cd5e <strlen>
  30ceb5:	83 c4 10             	add    $0x10,%esp
  30ceb8:	83 c0 01             	add    $0x1,%eax
  30cebb:	01 45 e0             	add    %eax,-0x20(%ebp)
  30cebe:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
  30cec2:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30cec5:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  30cec8:	72 b4                	jb     30ce7e <exec+0x102>
  30ceca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  30cecd:	89 45 b8             	mov    %eax,-0x48(%ebp)
  30ced0:	8b 45 0c             	mov    0xc(%ebp),%eax
  30ced3:	89 45 bc             	mov    %eax,-0x44(%ebp)
  30ced6:	8b 45 c8             	mov    -0x38(%ebp),%eax
  30ced9:	89 45 c0             	mov    %eax,-0x40(%ebp)
  30cedc:	83 ec 0c             	sub    $0xc,%esp
  30cedf:	ff 75 c0             	pushl  -0x40(%ebp)
  30cee2:	ff 75 bc             	pushl  -0x44(%ebp)
  30cee5:	ff 75 b8             	pushl  -0x48(%ebp)
  30cee8:	6a 0b                	push   $0xb
  30ceea:	6a 03                	push   $0x3
  30ceec:	e8 f7 fd ff ff       	call   30cce8 <_run>
  30cef1:	83 c4 20             	add    $0x20,%esp
  30cef4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30cef7:	b8 04 00 00 00       	mov    $0x4,%eax
  30cefc:	bb 00 00 00 00       	mov    $0x0,%ebx
  30cf01:	8b 4d c8             	mov    -0x38(%ebp),%ecx
  30cf04:	ba 00 00 00 00       	mov    $0x0,%edx
  30cf09:	be 00 00 00 00       	mov    $0x0,%esi
  30cf0e:	bf 00 00 00 00       	mov    $0x0,%edi
  30cf13:	cd 80                	int    $0x80
  30cf15:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  30cf18:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30cf1b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30cf1e:	5b                   	pop    %ebx
  30cf1f:	5e                   	pop    %esi
  30cf20:	5f                   	pop    %edi
  30cf21:	5d                   	pop    %ebp
  30cf22:	c3                   	ret    

0030cf23 <execvp>:
  30cf23:	55                   	push   %ebp
  30cf24:	89 e5                	mov    %esp,%ebp
  30cf26:	83 ec 18             	sub    $0x18,%esp
  30cf29:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  30cf30:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  30cf37:	eb 32                	jmp    30cf6b <execvp+0x48>
  30cf39:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30cf3c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  30cf43:	8b 45 0c             	mov    0xc(%ebp),%eax
  30cf46:	01 d0                	add    %edx,%eax
  30cf48:	8b 00                	mov    (%eax),%eax
  30cf4a:	85 c0                	test   %eax,%eax
  30cf4c:	75 19                	jne    30cf67 <execvp+0x44>
  30cf4e:	83 ec 04             	sub    $0x4,%esp
  30cf51:	ff 75 0c             	pushl  0xc(%ebp)
  30cf54:	ff 75 f0             	pushl  -0x10(%ebp)
  30cf57:	ff 75 08             	pushl  0x8(%ebp)
  30cf5a:	e8 1d fe ff ff       	call   30cd7c <exec>
  30cf5f:	83 c4 10             	add    $0x10,%esp
  30cf62:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30cf65:	eb 0a                	jmp    30cf71 <execvp+0x4e>
  30cf67:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  30cf6b:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  30cf6f:	7e c8                	jle    30cf39 <execvp+0x16>
  30cf71:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30cf74:	c9                   	leave  
  30cf75:	c3                   	ret    
  30cf76:	66 90                	xchg   %ax,%ax

0030cf78 <_run>:
  30cf78:	55                   	push   %ebp
  30cf79:	89 e5                	mov    %esp,%ebp
  30cf7b:	57                   	push   %edi
  30cf7c:	56                   	push   %esi
  30cf7d:	53                   	push   %ebx
  30cf7e:	83 ec 10             	sub    $0x10,%esp
  30cf81:	8b 55 10             	mov    0x10(%ebp),%edx
  30cf84:	8b 75 18             	mov    0x18(%ebp),%esi
  30cf87:	8b 7d 14             	mov    0x14(%ebp),%edi
  30cf8a:	b8 00 00 00 00       	mov    $0x0,%eax
  30cf8f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30cf92:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30cf95:	cd 80                	int    $0x80
  30cf97:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30cf9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30cf9d:	83 c4 10             	add    $0x10,%esp
  30cfa0:	5b                   	pop    %ebx
  30cfa1:	5e                   	pop    %esi
  30cfa2:	5f                   	pop    %edi
  30cfa3:	5d                   	pop    %ebp
  30cfa4:	c3                   	ret    

0030cfa5 <strlen>:
  30cfa5:	55                   	push   %ebp
  30cfa6:	89 e5                	mov    %esp,%ebp
  30cfa8:	57                   	push   %edi
  30cfa9:	8b 55 08             	mov    0x8(%ebp),%edx
  30cfac:	b8 00 00 00 00       	mov    $0x0,%eax
  30cfb1:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30cfb6:	89 d7                	mov    %edx,%edi
  30cfb8:	fc                   	cld    
  30cfb9:	f2 ae                	repnz scas %es:(%edi),%al
  30cfbb:	f7 d1                	not    %ecx
  30cfbd:	49                   	dec    %ecx
  30cfbe:	89 c8                	mov    %ecx,%eax
  30cfc0:	5f                   	pop    %edi
  30cfc1:	5d                   	pop    %ebp
  30cfc2:	c3                   	ret    

0030cfc3 <open>:
  30cfc3:	55                   	push   %ebp
  30cfc4:	89 e5                	mov    %esp,%ebp
  30cfc6:	57                   	push   %edi
  30cfc7:	56                   	push   %esi
  30cfc8:	53                   	push   %ebx
  30cfc9:	83 ec 20             	sub    $0x20,%esp
  30cfcc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  30cfd3:	ff 75 08             	pushl  0x8(%ebp)
  30cfd6:	e8 ca ff ff ff       	call   30cfa5 <strlen>
  30cfdb:	83 c4 04             	add    $0x4,%esp
  30cfde:	8d 50 01             	lea    0x1(%eax),%edx
  30cfe1:	b8 04 00 00 00       	mov    $0x4,%eax
  30cfe6:	bb 01 00 00 00       	mov    $0x1,%ebx
  30cfeb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  30cfee:	be 00 00 00 00       	mov    $0x0,%esi
  30cff3:	bf 00 00 00 00       	mov    $0x0,%edi
  30cff8:	cd 80                	int    $0x80
  30cffa:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30cffd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30d000:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30d003:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  30d00a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  30d011:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  30d018:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d01b:	89 45 d8             	mov    %eax,-0x28(%ebp)
  30d01e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  30d021:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30d024:	ff 75 e0             	pushl  -0x20(%ebp)
  30d027:	ff 75 dc             	pushl  -0x24(%ebp)
  30d02a:	ff 75 d8             	pushl  -0x28(%ebp)
  30d02d:	6a 02                	push   $0x2
  30d02f:	6a 08                	push   $0x8
  30d031:	e8 42 ff ff ff       	call   30cf78 <_run>
  30d036:	83 c4 14             	add    $0x14,%esp
  30d039:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30d03c:	b8 04 00 00 00       	mov    $0x4,%eax
  30d041:	bb 00 00 00 00       	mov    $0x0,%ebx
  30d046:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  30d049:	ba 00 00 00 00       	mov    $0x0,%edx
  30d04e:	be 00 00 00 00       	mov    $0x0,%esi
  30d053:	bf 00 00 00 00       	mov    $0x0,%edi
  30d058:	cd 80                	int    $0x80
  30d05a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30d05d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30d060:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30d063:	5b                   	pop    %ebx
  30d064:	5e                   	pop    %esi
  30d065:	5f                   	pop    %edi
  30d066:	5d                   	pop    %ebp
  30d067:	c3                   	ret    

0030d068 <close>:
  30d068:	55                   	push   %ebp
  30d069:	89 e5                	mov    %esp,%ebp
  30d06b:	83 ec 10             	sub    $0x10,%esp
  30d06e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30d075:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  30d07c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30d083:	ff 75 fc             	pushl  -0x4(%ebp)
  30d086:	ff 75 f8             	pushl  -0x8(%ebp)
  30d089:	ff 75 f4             	pushl  -0xc(%ebp)
  30d08c:	6a 03                	push   $0x3
  30d08e:	ff 75 08             	pushl  0x8(%ebp)
  30d091:	e8 e2 fe ff ff       	call   30cf78 <_run>
  30d096:	83 c4 14             	add    $0x14,%esp
  30d099:	c9                   	leave  
  30d09a:	c3                   	ret    
  30d09b:	90                   	nop

0030d09c <_run>:
  30d09c:	55                   	push   %ebp
  30d09d:	89 e5                	mov    %esp,%ebp
  30d09f:	57                   	push   %edi
  30d0a0:	56                   	push   %esi
  30d0a1:	53                   	push   %ebx
  30d0a2:	83 ec 10             	sub    $0x10,%esp
  30d0a5:	8b 55 10             	mov    0x10(%ebp),%edx
  30d0a8:	8b 75 18             	mov    0x18(%ebp),%esi
  30d0ab:	8b 7d 14             	mov    0x14(%ebp),%edi
  30d0ae:	b8 00 00 00 00       	mov    $0x0,%eax
  30d0b3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30d0b6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  30d0b9:	cd 80                	int    $0x80
  30d0bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30d0be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30d0c1:	83 c4 10             	add    $0x10,%esp
  30d0c4:	5b                   	pop    %ebx
  30d0c5:	5e                   	pop    %esi
  30d0c6:	5f                   	pop    %edi
  30d0c7:	5d                   	pop    %ebp
  30d0c8:	c3                   	ret    

0030d0c9 <memcpy>:
  30d0c9:	55                   	push   %ebp
  30d0ca:	89 e5                	mov    %esp,%ebp
  30d0cc:	57                   	push   %edi
  30d0cd:	56                   	push   %esi
  30d0ce:	53                   	push   %ebx
  30d0cf:	8b 45 10             	mov    0x10(%ebp),%eax
  30d0d2:	8b 55 0c             	mov    0xc(%ebp),%edx
  30d0d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30d0d8:	89 c1                	mov    %eax,%ecx
  30d0da:	89 d6                	mov    %edx,%esi
  30d0dc:	89 df                	mov    %ebx,%edi
  30d0de:	fc                   	cld    
  30d0df:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  30d0e1:	8b 45 08             	mov    0x8(%ebp),%eax
  30d0e4:	5b                   	pop    %ebx
  30d0e5:	5e                   	pop    %esi
  30d0e6:	5f                   	pop    %edi
  30d0e7:	5d                   	pop    %ebp
  30d0e8:	c3                   	ret    

0030d0e9 <read>:
  30d0e9:	55                   	push   %ebp
  30d0ea:	89 e5                	mov    %esp,%ebp
  30d0ec:	57                   	push   %edi
  30d0ed:	56                   	push   %esi
  30d0ee:	53                   	push   %ebx
  30d0ef:	83 ec 20             	sub    $0x20,%esp
  30d0f2:	b8 04 00 00 00       	mov    $0x4,%eax
  30d0f7:	bb 01 00 00 00       	mov    $0x1,%ebx
  30d0fc:	b9 00 00 00 00       	mov    $0x0,%ecx
  30d101:	8b 55 10             	mov    0x10(%ebp),%edx
  30d104:	be 00 00 00 00       	mov    $0x0,%esi
  30d109:	bf 00 00 00 00       	mov    $0x0,%edi
  30d10e:	cd 80                	int    $0x80
  30d110:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30d113:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30d116:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30d119:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  30d120:	8b 45 10             	mov    0x10(%ebp),%eax
  30d123:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30d126:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30d129:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30d12c:	ff 75 e0             	pushl  -0x20(%ebp)
  30d12f:	ff 75 dc             	pushl  -0x24(%ebp)
  30d132:	ff 75 d8             	pushl  -0x28(%ebp)
  30d135:	6a 00                	push   $0x0
  30d137:	ff 75 08             	pushl  0x8(%ebp)
  30d13a:	e8 5d ff ff ff       	call   30d09c <_run>
  30d13f:	83 c4 14             	add    $0x14,%esp
  30d142:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30d145:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%ebp)
  30d149:	74 11                	je     30d15c <read+0x73>
  30d14b:	ff 75 e8             	pushl  -0x18(%ebp)
  30d14e:	ff 75 ec             	pushl  -0x14(%ebp)
  30d151:	ff 75 0c             	pushl  0xc(%ebp)
  30d154:	e8 70 ff ff ff       	call   30d0c9 <memcpy>
  30d159:	83 c4 0c             	add    $0xc,%esp
  30d15c:	b8 04 00 00 00       	mov    $0x4,%eax
  30d161:	bb 00 00 00 00       	mov    $0x0,%ebx
  30d166:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  30d169:	ba 00 00 00 00       	mov    $0x0,%edx
  30d16e:	be 00 00 00 00       	mov    $0x0,%esi
  30d173:	bf 00 00 00 00       	mov    $0x0,%edi
  30d178:	cd 80                	int    $0x80
  30d17a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30d17d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  30d180:	8d 65 f4             	lea    -0xc(%ebp),%esp
  30d183:	5b                   	pop    %ebx
  30d184:	5e                   	pop    %esi
  30d185:	5f                   	pop    %edi
  30d186:	5d                   	pop    %ebp
  30d187:	c3                   	ret    

0030d188 <strlen>:
  30d188:	55                   	push   %ebp
  30d189:	89 e5                	mov    %esp,%ebp
  30d18b:	57                   	push   %edi
  30d18c:	8b 55 08             	mov    0x8(%ebp),%edx
  30d18f:	b8 00 00 00 00       	mov    $0x0,%eax
  30d194:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  30d199:	89 d7                	mov    %edx,%edi
  30d19b:	fc                   	cld    
  30d19c:	f2 ae                	repnz scas %es:(%edi),%al
  30d19e:	f7 d1                	not    %ecx
  30d1a0:	49                   	dec    %ecx
  30d1a1:	89 c8                	mov    %ecx,%eax
  30d1a3:	5f                   	pop    %edi
  30d1a4:	5d                   	pop    %ebp
  30d1a5:	c3                   	ret    

0030d1a6 <memcpy>:
  30d1a6:	55                   	push   %ebp
  30d1a7:	89 e5                	mov    %esp,%ebp
  30d1a9:	57                   	push   %edi
  30d1aa:	56                   	push   %esi
  30d1ab:	53                   	push   %ebx
  30d1ac:	8b 45 10             	mov    0x10(%ebp),%eax
  30d1af:	8b 55 0c             	mov    0xc(%ebp),%edx
  30d1b2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  30d1b5:	89 c1                	mov    %eax,%ecx
  30d1b7:	89 d6                	mov    %edx,%esi
  30d1b9:	89 df                	mov    %ebx,%edi
  30d1bb:	fc                   	cld    
  30d1bc:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  30d1be:	8b 45 08             	mov    0x8(%ebp),%eax
  30d1c1:	5b                   	pop    %ebx
  30d1c2:	5e                   	pop    %esi
  30d1c3:	5f                   	pop    %edi
  30d1c4:	5d                   	pop    %ebp
  30d1c5:	c3                   	ret    

0030d1c6 <_atoi>:
  30d1c6:	55                   	push   %ebp
  30d1c7:	89 e5                	mov    %esp,%ebp
  30d1c9:	53                   	push   %ebx
  30d1ca:	83 ec 10             	sub    $0x10,%esp
  30d1cd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  30d1d4:	eb 29                	jmp    30d1ff <_atoi+0x39>
  30d1d6:	8b 55 f8             	mov    -0x8(%ebp),%edx
  30d1d9:	89 d0                	mov    %edx,%eax
  30d1db:	c1 e0 02             	shl    $0x2,%eax
  30d1de:	01 d0                	add    %edx,%eax
  30d1e0:	01 c0                	add    %eax,%eax
  30d1e2:	89 c3                	mov    %eax,%ebx
  30d1e4:	8b 45 08             	mov    0x8(%ebp),%eax
  30d1e7:	8b 00                	mov    (%eax),%eax
  30d1e9:	8d 48 01             	lea    0x1(%eax),%ecx
  30d1ec:	8b 55 08             	mov    0x8(%ebp),%edx
  30d1ef:	89 0a                	mov    %ecx,(%edx)
  30d1f1:	0f b6 00             	movzbl (%eax),%eax
  30d1f4:	0f be c0             	movsbl %al,%eax
  30d1f7:	01 d8                	add    %ebx,%eax
  30d1f9:	83 e8 30             	sub    $0x30,%eax
  30d1fc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30d1ff:	8b 45 08             	mov    0x8(%ebp),%eax
  30d202:	8b 00                	mov    (%eax),%eax
  30d204:	0f b6 00             	movzbl (%eax),%eax
  30d207:	3c 2f                	cmp    $0x2f,%al
  30d209:	7e 0c                	jle    30d217 <_atoi+0x51>
  30d20b:	8b 45 08             	mov    0x8(%ebp),%eax
  30d20e:	8b 00                	mov    (%eax),%eax
  30d210:	0f b6 00             	movzbl (%eax),%eax
  30d213:	3c 39                	cmp    $0x39,%al
  30d215:	7e bf                	jle    30d1d6 <_atoi+0x10>
  30d217:	8b 45 f8             	mov    -0x8(%ebp),%eax
  30d21a:	83 c4 10             	add    $0x10,%esp
  30d21d:	5b                   	pop    %ebx
  30d21e:	5d                   	pop    %ebp
  30d21f:	c3                   	ret    

0030d220 <_octal>:
  30d220:	55                   	push   %ebp
  30d221:	89 e5                	mov    %esp,%ebp
  30d223:	83 ec 10             	sub    $0x10,%esp
  30d226:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30d22d:	8b 45 08             	mov    0x8(%ebp),%eax
  30d230:	8d 50 04             	lea    0x4(%eax),%edx
  30d233:	89 55 08             	mov    %edx,0x8(%ebp)
  30d236:	8b 55 0c             	mov    0xc(%ebp),%edx
  30d239:	83 e2 07             	and    $0x7,%edx
  30d23c:	89 10                	mov    %edx,(%eax)
  30d23e:	c1 6d 0c 03          	shrl   $0x3,0xc(%ebp)
  30d242:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  30d246:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  30d24a:	75 e1                	jne    30d22d <_octal+0xd>
  30d24c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30d24f:	c9                   	leave  
  30d250:	c3                   	ret    

0030d251 <_decimal>:
  30d251:	55                   	push   %ebp
  30d252:	89 e5                	mov    %esp,%ebp
  30d254:	53                   	push   %ebx
  30d255:	83 ec 10             	sub    $0x10,%esp
  30d258:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  30d25f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  30d262:	8d 41 04             	lea    0x4(%ecx),%eax
  30d265:	89 45 08             	mov    %eax,0x8(%ebp)
  30d268:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  30d26b:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  30d270:	89 d8                	mov    %ebx,%eax
  30d272:	f7 e2                	mul    %edx
  30d274:	c1 ea 03             	shr    $0x3,%edx
  30d277:	89 d0                	mov    %edx,%eax
  30d279:	c1 e0 02             	shl    $0x2,%eax
  30d27c:	01 d0                	add    %edx,%eax
  30d27e:	01 c0                	add    %eax,%eax
  30d280:	29 c3                	sub    %eax,%ebx
  30d282:	89 da                	mov    %ebx,%edx
  30d284:	89 d0                	mov    %edx,%eax
  30d286:	89 01                	mov    %eax,(%ecx)
  30d288:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d28b:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  30d290:	f7 e2                	mul    %edx
  30d292:	89 d0                	mov    %edx,%eax
  30d294:	c1 e8 03             	shr    $0x3,%eax
  30d297:	89 45 0c             	mov    %eax,0xc(%ebp)
  30d29a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  30d29e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  30d2a2:	75 bb                	jne    30d25f <_decimal+0xe>
  30d2a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  30d2a7:	83 c4 10             	add    $0x10,%esp
  30d2aa:	5b                   	pop    %ebx
  30d2ab:	5d                   	pop    %ebp
  30d2ac:	c3                   	ret    

0030d2ad <_hex>:
  30d2ad:	55                   	push   %ebp
  30d2ae:	89 e5                	mov    %esp,%ebp
  30d2b0:	83 ec 10             	sub    $0x10,%esp
  30d2b3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30d2ba:	8b 45 08             	mov    0x8(%ebp),%eax
  30d2bd:	8d 50 04             	lea    0x4(%eax),%edx
  30d2c0:	89 55 08             	mov    %edx,0x8(%ebp)
  30d2c3:	8b 55 0c             	mov    0xc(%ebp),%edx
  30d2c6:	83 e2 0f             	and    $0xf,%edx
  30d2c9:	89 10                	mov    %edx,(%eax)
  30d2cb:	c1 6d 0c 04          	shrl   $0x4,0xc(%ebp)
  30d2cf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  30d2d3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  30d2d7:	75 e1                	jne    30d2ba <_hex+0xd>
  30d2d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30d2dc:	c9                   	leave  
  30d2dd:	c3                   	ret    

0030d2de <_toNumber>:
  30d2de:	55                   	push   %ebp
  30d2df:	89 e5                	mov    %esp,%ebp
  30d2e1:	81 ec 18 01 00 00    	sub    $0x118,%esp
  30d2e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d2ea:	89 85 e8 fe ff ff    	mov    %eax,-0x118(%ebp)
  30d2f0:	8b 45 10             	mov    0x10(%ebp),%eax
  30d2f3:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
  30d2f9:	c6 45 ff 2b          	movb   $0x2b,-0x1(%ebp)
  30d2fd:	c7 45 f8 c4 ed 30 00 	movl   $0x30edc4,-0x8(%ebp)
  30d304:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30d30b:	8b 45 20             	mov    0x20(%ebp),%eax
  30d30e:	83 e0 10             	and    $0x10,%eax
  30d311:	85 c0                	test   %eax,%eax
  30d313:	74 07                	je     30d31c <_toNumber+0x3e>
  30d315:	c7 45 f8 dc ed 30 00 	movl   $0x30eddc,-0x8(%ebp)
  30d31c:	8b 45 20             	mov    0x20(%ebp),%eax
  30d31f:	83 e0 01             	and    $0x1,%eax
  30d322:	85 c0                	test   %eax,%eax
  30d324:	74 04                	je     30d32a <_toNumber+0x4c>
  30d326:	83 65 20 f7          	andl   $0xfffffff7,0x20(%ebp)
  30d32a:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
  30d32e:	74 0d                	je     30d33d <_toNumber+0x5f>
  30d330:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
  30d337:	83 65 20 fd          	andl   $0xfffffffd,0x20(%ebp)
  30d33b:	eb 04                	jmp    30d341 <_toNumber+0x63>
  30d33d:	83 65 20 fb          	andl   $0xfffffffb,0x20(%ebp)
  30d341:	8b 45 20             	mov    0x20(%ebp),%eax
  30d344:	83 e0 04             	and    $0x4,%eax
  30d347:	85 c0                	test   %eax,%eax
  30d349:	74 16                	je     30d361 <_toNumber+0x83>
  30d34b:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
  30d34f:	75 06                	jne    30d357 <_toNumber+0x79>
  30d351:	83 6d 1c 02          	subl   $0x2,0x1c(%ebp)
  30d355:	eb 0a                	jmp    30d361 <_toNumber+0x83>
  30d357:	83 7d 18 08          	cmpl   $0x8,0x18(%ebp)
  30d35b:	75 04                	jne    30d361 <_toNumber+0x83>
  30d35d:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  30d361:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
  30d365:	75 2b                	jne    30d392 <_toNumber+0xb4>
  30d367:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  30d36d:	8b 95 ec fe ff ff    	mov    -0x114(%ebp),%edx
  30d373:	85 d2                	test   %edx,%edx
  30d375:	79 1b                	jns    30d392 <_toNumber+0xb4>
  30d377:	83 4d 20 02          	orl    $0x2,0x20(%ebp)
  30d37b:	f7 9d e8 fe ff ff    	negl   -0x118(%ebp)
  30d381:	83 95 ec fe ff ff 00 	adcl   $0x0,-0x114(%ebp)
  30d388:	f7 9d ec fe ff ff    	negl   -0x114(%ebp)
  30d38e:	c6 45 ff 2d          	movb   $0x2d,-0x1(%ebp)
  30d392:	8b 45 24             	mov    0x24(%ebp),%eax
  30d395:	99                   	cltd   
  30d396:	21 85 e8 fe ff ff    	and    %eax,-0x118(%ebp)
  30d39c:	21 95 ec fe ff ff    	and    %edx,-0x114(%ebp)
  30d3a2:	8b 45 20             	mov    0x20(%ebp),%eax
  30d3a5:	83 e0 02             	and    $0x2,%eax
  30d3a8:	85 c0                	test   %eax,%eax
  30d3aa:	74 04                	je     30d3b0 <_toNumber+0xd2>
  30d3ac:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  30d3b0:	8b 45 18             	mov    0x18(%ebp),%eax
  30d3b3:	83 f8 0a             	cmp    $0xa,%eax
  30d3b6:	74 25                	je     30d3dd <_toNumber+0xff>
  30d3b8:	83 f8 10             	cmp    $0x10,%eax
  30d3bb:	74 3b                	je     30d3f8 <_toNumber+0x11a>
  30d3bd:	83 f8 08             	cmp    $0x8,%eax
  30d3c0:	75 50                	jne    30d412 <_toNumber+0x134>
  30d3c2:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  30d3c8:	50                   	push   %eax
  30d3c9:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  30d3cf:	50                   	push   %eax
  30d3d0:	e8 4b fe ff ff       	call   30d220 <_octal>
  30d3d5:	83 c4 08             	add    $0x8,%esp
  30d3d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30d3db:	eb 35                	jmp    30d412 <_toNumber+0x134>
  30d3dd:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  30d3e3:	50                   	push   %eax
  30d3e4:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  30d3ea:	50                   	push   %eax
  30d3eb:	e8 61 fe ff ff       	call   30d251 <_decimal>
  30d3f0:	83 c4 08             	add    $0x8,%esp
  30d3f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30d3f6:	eb 1a                	jmp    30d412 <_toNumber+0x134>
  30d3f8:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  30d3fe:	50                   	push   %eax
  30d3ff:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  30d405:	50                   	push   %eax
  30d406:	e8 a2 fe ff ff       	call   30d2ad <_hex>
  30d40b:	83 c4 08             	add    $0x8,%esp
  30d40e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  30d411:	90                   	nop
  30d412:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30d415:	29 45 1c             	sub    %eax,0x1c(%ebp)
  30d418:	8b 45 20             	mov    0x20(%ebp),%eax
  30d41b:	83 e0 09             	and    $0x9,%eax
  30d41e:	85 c0                	test   %eax,%eax
  30d420:	75 1b                	jne    30d43d <_toNumber+0x15f>
  30d422:	eb 0c                	jmp    30d430 <_toNumber+0x152>
  30d424:	8b 45 08             	mov    0x8(%ebp),%eax
  30d427:	8d 50 01             	lea    0x1(%eax),%edx
  30d42a:	89 55 08             	mov    %edx,0x8(%ebp)
  30d42d:	c6 00 20             	movb   $0x20,(%eax)
  30d430:	8b 45 1c             	mov    0x1c(%ebp),%eax
  30d433:	8d 50 ff             	lea    -0x1(%eax),%edx
  30d436:	89 55 1c             	mov    %edx,0x1c(%ebp)
  30d439:	85 c0                	test   %eax,%eax
  30d43b:	7f e7                	jg     30d424 <_toNumber+0x146>
  30d43d:	8b 45 20             	mov    0x20(%ebp),%eax
  30d440:	83 e0 02             	and    $0x2,%eax
  30d443:	85 c0                	test   %eax,%eax
  30d445:	74 0f                	je     30d456 <_toNumber+0x178>
  30d447:	8b 45 08             	mov    0x8(%ebp),%eax
  30d44a:	8d 50 01             	lea    0x1(%eax),%edx
  30d44d:	89 55 08             	mov    %edx,0x8(%ebp)
  30d450:	0f b6 55 ff          	movzbl -0x1(%ebp),%edx
  30d454:	88 10                	mov    %dl,(%eax)
  30d456:	8b 45 20             	mov    0x20(%ebp),%eax
  30d459:	83 e0 04             	and    $0x4,%eax
  30d45c:	85 c0                	test   %eax,%eax
  30d45e:	74 24                	je     30d484 <_toNumber+0x1a6>
  30d460:	8b 45 08             	mov    0x8(%ebp),%eax
  30d463:	8d 50 01             	lea    0x1(%eax),%edx
  30d466:	89 55 08             	mov    %edx,0x8(%ebp)
  30d469:	c6 00 30             	movb   $0x30,(%eax)
  30d46c:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
  30d470:	75 12                	jne    30d484 <_toNumber+0x1a6>
  30d472:	8b 45 08             	mov    0x8(%ebp),%eax
  30d475:	8d 50 01             	lea    0x1(%eax),%edx
  30d478:	89 55 08             	mov    %edx,0x8(%ebp)
  30d47b:	8b 55 f8             	mov    -0x8(%ebp),%edx
  30d47e:	0f b6 52 10          	movzbl 0x10(%edx),%edx
  30d482:	88 10                	mov    %dl,(%eax)
  30d484:	8b 45 20             	mov    0x20(%ebp),%eax
  30d487:	83 e0 08             	and    $0x8,%eax
  30d48a:	85 c0                	test   %eax,%eax
  30d48c:	74 1b                	je     30d4a9 <_toNumber+0x1cb>
  30d48e:	eb 0c                	jmp    30d49c <_toNumber+0x1be>
  30d490:	8b 45 08             	mov    0x8(%ebp),%eax
  30d493:	8d 50 01             	lea    0x1(%eax),%edx
  30d496:	89 55 08             	mov    %edx,0x8(%ebp)
  30d499:	c6 00 30             	movb   $0x30,(%eax)
  30d49c:	8b 45 1c             	mov    0x1c(%ebp),%eax
  30d49f:	8d 50 ff             	lea    -0x1(%eax),%edx
  30d4a2:	89 55 1c             	mov    %edx,0x1c(%ebp)
  30d4a5:	85 c0                	test   %eax,%eax
  30d4a7:	7f e7                	jg     30d490 <_toNumber+0x1b2>
  30d4a9:	eb 1f                	jmp    30d4ca <_toNumber+0x1ec>
  30d4ab:	8b 45 08             	mov    0x8(%ebp),%eax
  30d4ae:	8d 50 01             	lea    0x1(%eax),%edx
  30d4b1:	89 55 08             	mov    %edx,0x8(%ebp)
  30d4b4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  30d4b7:	8b 94 95 f4 fe ff ff 	mov    -0x10c(%ebp,%edx,4),%edx
  30d4be:	89 d1                	mov    %edx,%ecx
  30d4c0:	8b 55 f8             	mov    -0x8(%ebp),%edx
  30d4c3:	01 ca                	add    %ecx,%edx
  30d4c5:	0f b6 12             	movzbl (%edx),%edx
  30d4c8:	88 10                	mov    %dl,(%eax)
  30d4ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30d4cd:	8d 50 ff             	lea    -0x1(%eax),%edx
  30d4d0:	89 55 f4             	mov    %edx,-0xc(%ebp)
  30d4d3:	85 c0                	test   %eax,%eax
  30d4d5:	7f d4                	jg     30d4ab <_toNumber+0x1cd>
  30d4d7:	8b 45 20             	mov    0x20(%ebp),%eax
  30d4da:	83 e0 01             	and    $0x1,%eax
  30d4dd:	85 c0                	test   %eax,%eax
  30d4df:	74 1b                	je     30d4fc <_toNumber+0x21e>
  30d4e1:	eb 0c                	jmp    30d4ef <_toNumber+0x211>
  30d4e3:	8b 45 08             	mov    0x8(%ebp),%eax
  30d4e6:	8d 50 01             	lea    0x1(%eax),%edx
  30d4e9:	89 55 08             	mov    %edx,0x8(%ebp)
  30d4ec:	c6 00 20             	movb   $0x20,(%eax)
  30d4ef:	8b 45 1c             	mov    0x1c(%ebp),%eax
  30d4f2:	8d 50 ff             	lea    -0x1(%eax),%edx
  30d4f5:	89 55 1c             	mov    %edx,0x1c(%ebp)
  30d4f8:	85 c0                	test   %eax,%eax
  30d4fa:	7f e7                	jg     30d4e3 <_toNumber+0x205>
  30d4fc:	8b 45 08             	mov    0x8(%ebp),%eax
  30d4ff:	c9                   	leave  
  30d500:	c3                   	ret    

0030d501 <_toString>:
  30d501:	55                   	push   %ebp
  30d502:	89 e5                	mov    %esp,%ebp
  30d504:	83 ec 10             	sub    $0x10,%esp
  30d507:	ff 75 0c             	pushl  0xc(%ebp)
  30d50a:	e8 79 fc ff ff       	call   30d188 <strlen>
  30d50f:	83 c4 04             	add    $0x4,%esp
  30d512:	89 45 f0             	mov    %eax,-0x10(%ebp)
  30d515:	8b 45 08             	mov    0x8(%ebp),%eax
  30d518:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30d51b:	8b 45 08             	mov    0x8(%ebp),%eax
  30d51e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30d521:	8b 45 14             	mov    0x14(%ebp),%eax
  30d524:	83 e0 01             	and    $0x1,%eax
  30d527:	85 c0                	test   %eax,%eax
  30d529:	74 0d                	je     30d538 <_toString+0x37>
  30d52b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  30d52e:	8b 45 08             	mov    0x8(%ebp),%eax
  30d531:	01 d0                	add    %edx,%eax
  30d533:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30d536:	eb 0b                	jmp    30d543 <_toString+0x42>
  30d538:	8b 55 f0             	mov    -0x10(%ebp),%edx
  30d53b:	8b 45 08             	mov    0x8(%ebp),%eax
  30d53e:	01 d0                	add    %edx,%eax
  30d540:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30d543:	ff 75 f0             	pushl  -0x10(%ebp)
  30d546:	ff 75 0c             	pushl  0xc(%ebp)
  30d549:	ff 75 fc             	pushl  -0x4(%ebp)
  30d54c:	e8 55 fc ff ff       	call   30d1a6 <memcpy>
  30d551:	83 c4 0c             	add    $0xc,%esp
  30d554:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30d55b:	eb 10                	jmp    30d56d <_toString+0x6c>
  30d55d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  30d560:	8d 50 01             	lea    0x1(%eax),%edx
  30d563:	89 55 f8             	mov    %edx,-0x8(%ebp)
  30d566:	c6 00 20             	movb   $0x20,(%eax)
  30d569:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  30d56d:	8b 45 10             	mov    0x10(%ebp),%eax
  30d570:	2b 45 f0             	sub    -0x10(%ebp),%eax
  30d573:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  30d576:	7f e5                	jg     30d55d <_toString+0x5c>
  30d578:	8b 45 f0             	mov    -0x10(%ebp),%eax
  30d57b:	39 45 10             	cmp    %eax,0x10(%ebp)
  30d57e:	0f 4d 45 10          	cmovge 0x10(%ebp),%eax
  30d582:	89 c2                	mov    %eax,%edx
  30d584:	8b 45 08             	mov    0x8(%ebp),%eax
  30d587:	01 d0                	add    %edx,%eax
  30d589:	c9                   	leave  
  30d58a:	c3                   	ret    

0030d58b <vsprintf>:
  30d58b:	55                   	push   %ebp
  30d58c:	89 e5                	mov    %esp,%ebp
  30d58e:	83 ec 30             	sub    $0x30,%esp
  30d591:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30d598:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  30d59f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  30d5a6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  30d5ad:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  30d5b4:	c7 45 e4 6c 00 00 00 	movl   $0x6c,-0x1c(%ebp)
  30d5bb:	8b 45 08             	mov    0x8(%ebp),%eax
  30d5be:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30d5c1:	e9 69 02 00 00       	jmp    30d82f <vsprintf+0x2a4>
  30d5c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d5c9:	0f b6 00             	movzbl (%eax),%eax
  30d5cc:	3c 25                	cmp    $0x25,%al
  30d5ce:	0f 85 41 02 00 00    	jne    30d815 <vsprintf+0x28a>
  30d5d4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  30d5db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  30d5e2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  30d5e9:	c7 45 e4 6c 00 00 00 	movl   $0x6c,-0x1c(%ebp)
  30d5f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d5f3:	83 c0 01             	add    $0x1,%eax
  30d5f6:	89 45 0c             	mov    %eax,0xc(%ebp)
  30d5f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d5fc:	0f b6 00             	movzbl (%eax),%eax
  30d5ff:	0f be c0             	movsbl %al,%eax
  30d602:	83 e8 20             	sub    $0x20,%eax
  30d605:	83 f8 10             	cmp    $0x10,%eax
  30d608:	77 27                	ja     30d631 <vsprintf+0xa6>
  30d60a:	8b 04 85 fc ed 30 00 	mov    0x30edfc(,%eax,4),%eax
  30d611:	ff e0                	jmp    *%eax
  30d613:	83 4d fc 01          	orl    $0x1,-0x4(%ebp)
  30d617:	eb d7                	jmp    30d5f0 <vsprintf+0x65>
  30d619:	83 4d fc 02          	orl    $0x2,-0x4(%ebp)
  30d61d:	eb d1                	jmp    30d5f0 <vsprintf+0x65>
  30d61f:	83 4d fc 02          	orl    $0x2,-0x4(%ebp)
  30d623:	eb cb                	jmp    30d5f0 <vsprintf+0x65>
  30d625:	83 4d fc 08          	orl    $0x8,-0x4(%ebp)
  30d629:	eb c5                	jmp    30d5f0 <vsprintf+0x65>
  30d62b:	83 4d fc 04          	orl    $0x4,-0x4(%ebp)
  30d62f:	eb bf                	jmp    30d5f0 <vsprintf+0x65>
  30d631:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d634:	0f b6 00             	movzbl (%eax),%eax
  30d637:	3c 2f                	cmp    $0x2f,%al
  30d639:	7e 1b                	jle    30d656 <vsprintf+0xcb>
  30d63b:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d63e:	0f b6 00             	movzbl (%eax),%eax
  30d641:	3c 39                	cmp    $0x39,%al
  30d643:	7f 11                	jg     30d656 <vsprintf+0xcb>
  30d645:	8d 45 0c             	lea    0xc(%ebp),%eax
  30d648:	50                   	push   %eax
  30d649:	e8 78 fb ff ff       	call   30d1c6 <_atoi>
  30d64e:	83 c4 04             	add    $0x4,%esp
  30d651:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30d654:	eb 21                	jmp    30d677 <vsprintf+0xec>
  30d656:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d659:	0f b6 00             	movzbl (%eax),%eax
  30d65c:	3c 2a                	cmp    $0x2a,%al
  30d65e:	75 17                	jne    30d677 <vsprintf+0xec>
  30d660:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d663:	83 c0 01             	add    $0x1,%eax
  30d666:	89 45 0c             	mov    %eax,0xc(%ebp)
  30d669:	8b 45 10             	mov    0x10(%ebp),%eax
  30d66c:	8d 50 04             	lea    0x4(%eax),%edx
  30d66f:	89 55 10             	mov    %edx,0x10(%ebp)
  30d672:	8b 00                	mov    (%eax),%eax
  30d674:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30d677:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d67a:	0f b6 00             	movzbl (%eax),%eax
  30d67d:	3c 68                	cmp    $0x68,%al
  30d67f:	74 1e                	je     30d69f <vsprintf+0x114>
  30d681:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d684:	0f b6 00             	movzbl (%eax),%eax
  30d687:	3c 6c                	cmp    $0x6c,%al
  30d689:	74 14                	je     30d69f <vsprintf+0x114>
  30d68b:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d68e:	0f b6 00             	movzbl (%eax),%eax
  30d691:	3c 4c                	cmp    $0x4c,%al
  30d693:	74 0a                	je     30d69f <vsprintf+0x114>
  30d695:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d698:	0f b6 00             	movzbl (%eax),%eax
  30d69b:	3c 48                	cmp    $0x48,%al
  30d69d:	75 15                	jne    30d6b4 <vsprintf+0x129>
  30d69f:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d6a2:	0f b6 00             	movzbl (%eax),%eax
  30d6a5:	0f be c0             	movsbl %al,%eax
  30d6a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  30d6ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d6ae:	83 c0 01             	add    $0x1,%eax
  30d6b1:	89 45 0c             	mov    %eax,0xc(%ebp)
  30d6b4:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d6b7:	0f b6 00             	movzbl (%eax),%eax
  30d6ba:	0f be c0             	movsbl %al,%eax
  30d6bd:	83 e8 58             	sub    $0x58,%eax
  30d6c0:	83 f8 20             	cmp    $0x20,%eax
  30d6c3:	77 57                	ja     30d71c <vsprintf+0x191>
  30d6c5:	8b 04 85 40 ee 30 00 	mov    0x30ee40(,%eax,4),%eax
  30d6cc:	ff e0                	jmp    *%eax
  30d6ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30d6d1:	8d 50 01             	lea    0x1(%eax),%edx
  30d6d4:	89 55 ec             	mov    %edx,-0x14(%ebp)
  30d6d7:	8b 55 10             	mov    0x10(%ebp),%edx
  30d6da:	8d 4a 04             	lea    0x4(%edx),%ecx
  30d6dd:	89 4d 10             	mov    %ecx,0x10(%ebp)
  30d6e0:	8b 12                	mov    (%edx),%edx
  30d6e2:	88 10                	mov    %dl,(%eax)
  30d6e4:	e9 3d 01 00 00       	jmp    30d826 <vsprintf+0x29b>
  30d6e9:	c7 45 e4 73 00 00 00 	movl   $0x73,-0x1c(%ebp)
  30d6f0:	eb 50                	jmp    30d742 <vsprintf+0x1b7>
  30d6f2:	83 4d fc 04          	orl    $0x4,-0x4(%ebp)
  30d6f6:	83 4d fc 10          	orl    $0x10,-0x4(%ebp)
  30d6fa:	c7 45 f0 10 00 00 00 	movl   $0x10,-0x10(%ebp)
  30d701:	eb 3f                	jmp    30d742 <vsprintf+0x1b7>
  30d703:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  30d70a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  30d711:	eb 2e                	jmp    30d741 <vsprintf+0x1b6>
  30d713:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
  30d71a:	eb 26                	jmp    30d742 <vsprintf+0x1b7>
  30d71c:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d71f:	0f b6 00             	movzbl (%eax),%eax
  30d722:	84 c0                	test   %al,%al
  30d724:	74 16                	je     30d73c <vsprintf+0x1b1>
  30d726:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30d729:	8d 50 01             	lea    0x1(%eax),%edx
  30d72c:	89 55 ec             	mov    %edx,-0x14(%ebp)
  30d72f:	8b 55 0c             	mov    0xc(%ebp),%edx
  30d732:	0f b6 12             	movzbl (%edx),%edx
  30d735:	88 10                	mov    %dl,(%eax)
  30d737:	e9 ea 00 00 00       	jmp    30d826 <vsprintf+0x29b>
  30d73c:	e9 e5 00 00 00       	jmp    30d826 <vsprintf+0x29b>
  30d741:	90                   	nop
  30d742:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  30d749:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  30d74c:	83 e8 48             	sub    $0x48,%eax
  30d74f:	83 f8 2b             	cmp    $0x2b,%eax
  30d752:	0f 87 ce 00 00 00    	ja     30d826 <vsprintf+0x29b>
  30d758:	8b 04 85 c4 ee 30 00 	mov    0x30eec4(,%eax,4),%eax
  30d75f:	ff e0                	jmp    *%eax
  30d761:	c7 45 e0 ff 00 00 00 	movl   $0xff,-0x20(%ebp)
  30d768:	81 65 e0 ff ff 00 00 	andl   $0xffff,-0x20(%ebp)
  30d76f:	8b 45 10             	mov    0x10(%ebp),%eax
  30d772:	8d 50 04             	lea    0x4(%eax),%edx
  30d775:	89 55 10             	mov    %edx,0x10(%ebp)
  30d778:	8b 00                	mov    (%eax),%eax
  30d77a:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30d77d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30d780:	ba 00 00 00 00       	mov    $0x0,%edx
  30d785:	ff 75 e0             	pushl  -0x20(%ebp)
  30d788:	ff 75 fc             	pushl  -0x4(%ebp)
  30d78b:	ff 75 f8             	pushl  -0x8(%ebp)
  30d78e:	ff 75 f0             	pushl  -0x10(%ebp)
  30d791:	ff 75 f4             	pushl  -0xc(%ebp)
  30d794:	52                   	push   %edx
  30d795:	50                   	push   %eax
  30d796:	ff 75 ec             	pushl  -0x14(%ebp)
  30d799:	e8 40 fb ff ff       	call   30d2de <_toNumber>
  30d79e:	83 c4 20             	add    $0x20,%esp
  30d7a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30d7a4:	eb 6d                	jmp    30d813 <vsprintf+0x288>
  30d7a6:	8b 45 10             	mov    0x10(%ebp),%eax
  30d7a9:	8d 50 08             	lea    0x8(%eax),%edx
  30d7ac:	89 55 10             	mov    %edx,0x10(%ebp)
  30d7af:	8b 50 04             	mov    0x4(%eax),%edx
  30d7b2:	8b 00                	mov    (%eax),%eax
  30d7b4:	89 45 dc             	mov    %eax,-0x24(%ebp)
  30d7b7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  30d7ba:	ba 00 00 00 00       	mov    $0x0,%edx
  30d7bf:	ff 75 e0             	pushl  -0x20(%ebp)
  30d7c2:	ff 75 fc             	pushl  -0x4(%ebp)
  30d7c5:	ff 75 f8             	pushl  -0x8(%ebp)
  30d7c8:	ff 75 f0             	pushl  -0x10(%ebp)
  30d7cb:	ff 75 f4             	pushl  -0xc(%ebp)
  30d7ce:	52                   	push   %edx
  30d7cf:	50                   	push   %eax
  30d7d0:	ff 75 ec             	pushl  -0x14(%ebp)
  30d7d3:	e8 06 fb ff ff       	call   30d2de <_toNumber>
  30d7d8:	83 c4 20             	add    $0x20,%esp
  30d7db:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30d7de:	eb 33                	jmp    30d813 <vsprintf+0x288>
  30d7e0:	8b 45 10             	mov    0x10(%ebp),%eax
  30d7e3:	8d 50 04             	lea    0x4(%eax),%edx
  30d7e6:	89 55 10             	mov    %edx,0x10(%ebp)
  30d7e9:	8b 00                	mov    (%eax),%eax
  30d7eb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  30d7ee:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  30d7f2:	75 07                	jne    30d7fb <vsprintf+0x270>
  30d7f4:	c7 45 e8 f4 ed 30 00 	movl   $0x30edf4,-0x18(%ebp)
  30d7fb:	ff 75 fc             	pushl  -0x4(%ebp)
  30d7fe:	ff 75 f8             	pushl  -0x8(%ebp)
  30d801:	ff 75 e8             	pushl  -0x18(%ebp)
  30d804:	ff 75 ec             	pushl  -0x14(%ebp)
  30d807:	e8 f5 fc ff ff       	call   30d501 <_toString>
  30d80c:	83 c4 10             	add    $0x10,%esp
  30d80f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  30d812:	90                   	nop
  30d813:	eb 11                	jmp    30d826 <vsprintf+0x29b>
  30d815:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30d818:	8d 50 01             	lea    0x1(%eax),%edx
  30d81b:	89 55 ec             	mov    %edx,-0x14(%ebp)
  30d81e:	8b 55 0c             	mov    0xc(%ebp),%edx
  30d821:	0f b6 12             	movzbl (%edx),%edx
  30d824:	88 10                	mov    %dl,(%eax)
  30d826:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d829:	83 c0 01             	add    $0x1,%eax
  30d82c:	89 45 0c             	mov    %eax,0xc(%ebp)
  30d82f:	8b 45 0c             	mov    0xc(%ebp),%eax
  30d832:	0f b6 00             	movzbl (%eax),%eax
  30d835:	84 c0                	test   %al,%al
  30d837:	0f 85 89 fd ff ff    	jne    30d5c6 <vsprintf+0x3b>
  30d83d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  30d840:	c6 00 00             	movb   $0x0,(%eax)
  30d843:	8b 55 ec             	mov    -0x14(%ebp),%edx
  30d846:	8b 45 08             	mov    0x8(%ebp),%eax
  30d849:	29 c2                	sub    %eax,%edx
  30d84b:	89 d0                	mov    %edx,%eax
  30d84d:	c9                   	leave  
  30d84e:	c3                   	ret    

0030d84f <sprintf>:
  30d84f:	55                   	push   %ebp
  30d850:	89 e5                	mov    %esp,%ebp
  30d852:	83 ec 10             	sub    $0x10,%esp
  30d855:	8d 45 10             	lea    0x10(%ebp),%eax
  30d858:	89 45 f8             	mov    %eax,-0x8(%ebp)
  30d85b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  30d85e:	83 ec 04             	sub    $0x4,%esp
  30d861:	50                   	push   %eax
  30d862:	ff 75 0c             	pushl  0xc(%ebp)
  30d865:	ff 75 08             	pushl  0x8(%ebp)
  30d868:	e8 1e fd ff ff       	call   30d58b <vsprintf>
  30d86d:	83 c4 10             	add    $0x10,%esp
  30d870:	89 45 fc             	mov    %eax,-0x4(%ebp)
  30d873:	8b 45 fc             	mov    -0x4(%ebp),%eax
  30d876:	c9                   	leave  
  30d877:	c3                   	ret    

Disassembly of section .rodata:

0030d880 <idt-0x30>:
  30d880:	1b 72 5b             	sbb    0x5b(%edx),%esi
  30d883:	50                   	push   %eax
  30d884:	41                   	inc    %ecx
  30d885:	4e                   	dec    %esi
  30d886:	49                   	dec    %ecx
  30d887:	43                   	inc    %ebx
  30d888:	5d                   	pop    %ebp
  30d889:	20 3a                	and    %bh,(%edx)
  30d88b:	20 1b                	and    %bl,(%ebx)
  30d88d:	77 20                	ja     30d8af <sprintf+0x60>
  30d88f:	25 73 0a 00 20       	and    $0x20000a73,%eax
  30d894:	20 00                	and    %al,(%eax)
  30d896:	25 63 00 0a 00       	and    $0xa0063,%eax
  30d89b:	25 30 34 58 20       	and    $0x20583430,%eax
  30d8a0:	3a 20                	cmp    (%eax),%ah
  30d8a2:	00 20                	add    %ah,(%eax)
  30d8a4:	20 20                	and    %ah,(%eax)
  30d8a6:	00 25 30 32 48 58    	add    %ah,0x58483230
  30d8ac:	20 00                	and    %al,(%eax)
	...

0030d8b0 <idt>:
  30d8b0:	00 00                	add    %al,(%eax)
  30d8b2:	20 00                	and    %al,(%eax)
  30d8b4:	43                   	inc    %ebx
  30d8b5:	53                   	push   %ebx
  30d8b6:	20 20                	and    %ah,(%eax)
  30d8b8:	3d 20 25 30 31       	cmp    $0x31302520,%eax
  30d8bd:	30 70 20             	xor    %dh,0x20(%eax)
  30d8c0:	45                   	inc    %ebp
  30d8c1:	49                   	dec    %ecx
  30d8c2:	50                   	push   %eax
  30d8c3:	20 3d 20 25 30 31    	and    %bh,0x31302520
  30d8c9:	30 70 20             	xor    %dh,0x20(%eax)
  30d8cc:	20 20                	and    %ah,(%eax)
  30d8ce:	20 00                	and    %al,(%eax)
  30d8d0:	53                   	push   %ebx
  30d8d1:	53                   	push   %ebx
  30d8d2:	20 20                	and    %ah,(%eax)
  30d8d4:	3d 20 25 30 31       	cmp    $0x31302520,%eax
  30d8d9:	30 70 20             	xor    %dh,0x20(%eax)
  30d8dc:	45                   	inc    %ebp
  30d8dd:	53                   	push   %ebx
  30d8de:	50                   	push   %eax
  30d8df:	20 3d 20 25 30 31    	and    %bh,0x31302520
  30d8e5:	30 70 0a             	xor    %dh,0xa(%eax)
  30d8e8:	00 44 53 20          	add    %al,0x20(%ebx,%edx,2)
  30d8ec:	20 3d 20 25 30 31    	and    %bh,0x31302520
  30d8f2:	30 70 20             	xor    %dh,0x20(%eax)
  30d8f5:	45                   	inc    %ebp
  30d8f6:	44                   	inc    %esp
  30d8f7:	49                   	dec    %ecx
  30d8f8:	20 3d 20 25 30 31    	and    %bh,0x31302520
  30d8fe:	30 70 20             	xor    %dh,0x20(%eax)
  30d901:	20 20                	and    %ah,(%eax)
  30d903:	20 00                	and    %al,(%eax)
  30d905:	45                   	inc    %ebp
  30d906:	53                   	push   %ebx
  30d907:	20 20                	and    %ah,(%eax)
  30d909:	3d 20 25 30 31       	cmp    $0x31302520,%eax
  30d90e:	30 70 20             	xor    %dh,0x20(%eax)
  30d911:	45                   	inc    %ebp
  30d912:	53                   	push   %ebx
  30d913:	49                   	dec    %ecx
  30d914:	20 3d 20 25 30 31    	and    %bh,0x31302520
  30d91a:	30 70 0a             	xor    %dh,0xa(%eax)
  30d91d:	00 45 41             	add    %al,0x41(%ebp)
  30d920:	58                   	pop    %eax
  30d921:	20 3d 20 25 30 31    	and    %bh,0x31302520
  30d927:	30 70 20             	xor    %dh,0x20(%eax)
  30d92a:	45                   	inc    %ebp
  30d92b:	43                   	inc    %ebx
  30d92c:	58                   	pop    %eax
  30d92d:	20 3d 20 25 30 31    	and    %bh,0x31302520
  30d933:	30 70 20             	xor    %dh,0x20(%eax)
  30d936:	20 20                	and    %ah,(%eax)
  30d938:	20 00                	and    %al,(%eax)
  30d93a:	45                   	inc    %ebp
  30d93b:	42                   	inc    %edx
  30d93c:	58                   	pop    %eax
  30d93d:	20 3d 20 25 30 31    	and    %bh,0x31302520
  30d943:	30 70 20             	xor    %dh,0x20(%eax)
  30d946:	45                   	inc    %ebp
  30d947:	44                   	inc    %esp
  30d948:	58                   	pop    %eax
  30d949:	20 3d 20 25 30 31    	and    %bh,0x31302520
  30d94f:	30 70 0a             	xor    %dh,0xa(%eax)
  30d952:	00 00                	add    %al,(%eax)
  30d954:	1b 72 54             	sbb    0x54(%edx),%esi
  30d957:	72 61                	jb     30d9ba <idt+0x10a>
  30d959:	70 3a                	jo     30d995 <idt+0xe5>
  30d95b:	20 25 73 20 25 78    	and    %ah,0x78252073
  30d961:	2e 0a 4f 62          	or     %cs:0x62(%edi),%cl
  30d965:	6a 65                	push   $0x65
  30d967:	63 74 3c 25          	arpl   %si,0x25(%esp,%edi,1)
  30d96b:	70 3e                	jo     30d9ab <idt+0xfb>
  30d96d:	3a 25 6c 64 2c 25    	cmp    0x252c646c,%ah
  30d973:	73 1b                	jae    30d990 <idt+0xe0>
  30d975:	77 0a                	ja     30d981 <idt+0xd1>
  30d977:	00 64 69 76          	add    %ah,0x76(%ecx,%ebp,2)
  30d97b:	65 64 65 20 65 72    	gs fs and %ah,%fs:%gs:0x72(%ebp)
  30d981:	72 6f                	jb     30d9f2 <idt+0x142>
  30d983:	72 00                	jb     30d985 <idt+0xd5>
  30d985:	64 65 62 75 67       	fs bound %esi,%fs:%gs:0x67(%ebp)
  30d98a:	20 74 72 61          	and    %dh,0x61(%edx,%esi,2)
  30d98e:	70 73                	jo     30da03 <idt+0x153>
  30d990:	00 00                	add    %al,(%eax)
  30d992:	00 00                	add    %al,(%eax)
  30d994:	54                   	push   %esp
  30d995:	68 69 73 20 64       	push   $0x64207369
  30d99a:	65 62 75 67          	bound  %esi,%gs:0x67(%ebp)
  30d99e:	21 2c 42             	and    %ebp,(%edx,%eax,2)
  30d9a1:	75 74                	jne    30da17 <idt+0x167>
  30d9a3:	20 74 68 65          	and    %dh,0x65(%eax,%ebp,2)
  30d9a7:	20 63 6f             	and    %ah,0x6f(%ebx)
  30d9aa:	64 65 20 6e 6f       	fs and %ch,%fs:%gs:0x6f(%esi)
  30d9af:	20 72 65             	and    %dh,0x65(%edx)
  30d9b2:	61                   	popa   
  30d9b3:	64                   	fs
  30d9b4:	79 21                	jns    30d9d7 <idt+0x127>
  30d9b6:	5b                   	pop    %ebx
  30d9b7:	54                   	push   %esp
  30d9b8:	52                   	push   %edx
  30d9b9:	41                   	inc    %ecx
  30d9ba:	50                   	push   %eax
  30d9bb:	5d                   	pop    %ebp
  30d9bc:	0a 00                	or     (%eax),%al
  30d9be:	6e                   	outsb  %ds:(%esi),(%dx)
  30d9bf:	6d                   	insl   (%dx),%es:(%edi)
  30d9c0:	69 20 65 72 72 6f    	imul   $0x6f727265,(%eax),%esp
  30d9c6:	72 21                	jb     30d9e9 <idt+0x139>
  30d9c8:	00 62 72             	add    %ah,0x72(%edx)
  30d9cb:	65                   	gs
  30d9cc:	61                   	popa   
  30d9cd:	6b 70 6f 69          	imul   $0x69,0x6f(%eax),%esi
  30d9d1:	6e                   	outsb  %ds:(%esi),(%dx)
  30d9d2:	74 20                	je     30d9f4 <idt+0x144>
  30d9d4:	74 72                	je     30da48 <idt+0x198>
  30d9d6:	61                   	popa   
  30d9d7:	70 73                	jo     30da4c <idt+0x19c>
  30d9d9:	2e 00 63 6f          	add    %ah,%cs:0x6f(%ebx)
  30d9dd:	64 65 20 6e 6f       	fs and %ch,%fs:%gs:0x6f(%esi)
  30d9e2:	20 72 65             	and    %dh,0x65(%edx)
  30d9e5:	61                   	popa   
  30d9e6:	64                   	fs
  30d9e7:	79 21                	jns    30da0a <idt+0x15a>
  30d9e9:	5b                   	pop    %ebx
  30d9ea:	54                   	push   %esp
  30d9eb:	52                   	push   %edx
  30d9ec:	41                   	inc    %ecx
  30d9ed:	50                   	push   %eax
  30d9ee:	5d                   	pop    %ebp
  30d9ef:	0a 00                	or     (%eax),%al
  30d9f1:	6f                   	outsl  %ds:(%esi),(%dx)
  30d9f2:	76 65                	jbe    30da59 <idt+0x1a9>
  30d9f4:	72 66                	jb     30da5c <idt+0x1ac>
  30d9f6:	6c                   	insb   (%dx),%es:(%edi)
  30d9f7:	6f                   	outsl  %ds:(%esi),(%dx)
  30d9f8:	77 00                	ja     30d9fa <idt+0x14a>
  30d9fa:	62 6f 75             	bound  %ebp,0x75(%edi)
  30d9fd:	6e                   	outsb  %ds:(%esi),(%dx)
  30d9fe:	64                   	fs
  30d9ff:	73 00                	jae    30da01 <idt+0x151>
  30da01:	69 6e 76 61 6c 69 64 	imul   $0x64696c61,0x76(%esi),%ebp
  30da08:	20 6f 70             	and    %ch,0x70(%edi)
  30da0b:	65                   	gs
  30da0c:	72 61                	jb     30da6f <idt+0x1bf>
  30da0e:	6e                   	outsb  %ds:(%esi),(%dx)
  30da0f:	64 00 63 6f          	add    %ah,%fs:0x6f(%ebx)
  30da13:	70 72                	jo     30da87 <idt+0x1d7>
  30da15:	20 6e 6f             	and    %ch,0x6f(%esi)
  30da18:	74 20                	je     30da3a <idt+0x18a>
  30da1a:	61                   	popa   
  30da1b:	76 61                	jbe    30da7e <idt+0x1ce>
  30da1d:	69 6c 61 62 6c 65 2e 	imul   $0x2e656c,0x62(%ecx,%eiz,2),%ebp
  30da24:	00 
  30da25:	64 6f                	outsl  %fs:(%esi),(%dx)
  30da27:	75 62                	jne    30da8b <idt+0x1db>
  30da29:	6c                   	insb   (%dx),%es:(%edi)
  30da2a:	65 20 66 61          	and    %ah,%gs:0x61(%esi)
  30da2e:	75 6c                	jne    30da9c <idt+0x1ec>
  30da30:	74 00                	je     30da32 <idt+0x182>
  30da32:	63 6f 70             	arpl   %bp,0x70(%edi)
  30da35:	72 20                	jb     30da57 <idt+0x1a7>
  30da37:	73 65                	jae    30da9e <idt+0x1ee>
  30da39:	67 6d                	insl   (%dx),%es:(%di)
  30da3b:	65 6e                	outsb  %gs:(%esi),(%dx)
  30da3d:	74 20                	je     30da5f <idt+0x1af>
  30da3f:	6f                   	outsl  %ds:(%esi),(%dx)
  30da40:	76 65                	jbe    30daa7 <idt+0x1f7>
  30da42:	72 72                	jb     30dab6 <idt+0x206>
  30da44:	75 6e                	jne    30dab4 <idt+0x204>
  30da46:	00 69 6e             	add    %ch,0x6e(%ecx)
  30da49:	76 61                	jbe    30daac <idt+0x1fc>
  30da4b:	6c                   	insb   (%dx),%es:(%edi)
  30da4c:	20 74 73 73          	and    %dh,0x73(%ebx,%esi,2)
  30da50:	00 73 65             	add    %dh,0x65(%ebx)
  30da53:	67 6d                	insl   (%dx),%es:(%di)
  30da55:	65 6e                	outsb  %gs:(%esi),(%dx)
  30da57:	74 20                	je     30da79 <idt+0x1c9>
  30da59:	6e                   	outsb  %ds:(%esi),(%dx)
  30da5a:	6f                   	outsl  %ds:(%esi),(%dx)
  30da5b:	74 20                	je     30da7d <idt+0x1cd>
  30da5d:	70 72                	jo     30dad1 <idt+0x221>
  30da5f:	65                   	gs
  30da60:	73 65                	jae    30dac7 <idt+0x217>
  30da62:	6e                   	outsb  %ds:(%esi),(%dx)
  30da63:	74 00                	je     30da65 <idt+0x1b5>
  30da65:	73 74                	jae    30dadb <idt+0x22b>
  30da67:	61                   	popa   
  30da68:	63 6b 20             	arpl   %bp,0x20(%ebx)
  30da6b:	73 65                	jae    30dad2 <idt+0x222>
  30da6d:	67 6d                	insl   (%dx),%es:(%di)
  30da6f:	65 6e                	outsb  %gs:(%esi),(%dx)
  30da71:	74 00                	je     30da73 <idt+0x1c3>
  30da73:	67 65 6e             	outsb  %gs:(%si),(%dx)
  30da76:	65                   	gs
  30da77:	72 61                	jb     30dada <idt+0x22a>
  30da79:	6c                   	insb   (%dx),%es:(%edi)
  30da7a:	20 70 72             	and    %dh,0x72(%eax)
  30da7d:	6f                   	outsl  %ds:(%esi),(%dx)
  30da7e:	74 65                	je     30dae5 <idt+0x235>
  30da80:	63 74 69 6f          	arpl   %si,0x6f(%ecx,%ebp,2)
  30da84:	6e                   	outsb  %ds:(%esi),(%dx)
  30da85:	00 63 6f             	add    %ah,0x6f(%ebx)
  30da88:	70 72                	jo     30dafc <idt+0x24c>
  30da8a:	20 65 72             	and    %ah,0x72(%ebp)
  30da8d:	72 6f                	jb     30dafe <idt+0x24e>
  30da8f:	72 00                	jb     30da91 <idt+0x1e1>
  30da91:	77 68                	ja     30dafb <idt+0x24b>
  30da93:	61                   	popa   
  30da94:	74 20                	je     30dab6 <idt+0x206>
  30da96:	74 68                	je     30db00 <idt+0x250>
  30da98:	65 20 66 75          	and    %ah,%gs:0x75(%esi)
  30da9c:	63 6b 21             	arpl   %bp,0x21(%ebx)
  30da9f:	00 69 6e             	add    %ch,0x6e(%ecx)
  30daa2:	76 61                	jbe    30db05 <idt+0x255>
  30daa4:	6c                   	insb   (%dx),%es:(%edi)
  30daa5:	69 64 20 69 72 71 20 	imul   $0x64207172,0x69(%eax,%eiz,1),%esp
  30daac:	64 
  30daad:	69 73 61 62 6c 65 5f 	imul   $0x5f656c62,0x61(%ebx),%esi
  30dab4:	69 72 71 00 69 6e 76 	imul   $0x766e6900,0x71(%edx),%esi
  30dabb:	61                   	popa   
  30dabc:	6c                   	insb   (%dx),%es:(%edi)
  30dabd:	69 64 20 63 61 6c 6c 	imul   $0x206c6c61,0x63(%eax,%eiz,1),%esp
  30dac4:	20 
  30dac5:	74 6f                	je     30db36 <idt+0x286>
  30dac7:	20 73 70             	and    %dh,0x70(%ebx)
  30daca:	75 72                	jne    30db3e <idt+0x28e>
  30dacc:	69 6f 75 73 5f 69 72 	imul   $0x72695f73,0x75(%edi),%ebp
  30dad3:	71 00                	jno    30dad5 <idt+0x225>
  30dad5:	73 70                	jae    30db47 <idt+0x297>
  30dad7:	75 72                	jne    30db4b <idt+0x29b>
  30dad9:	69 6f 75 73 20 69 72 	imul   $0x72692073,0x75(%edi),%ebp
  30dae0:	71 20                	jno    30db02 <idt+0x252>
  30dae2:	25 64 20 0a 00       	and    $0xa2064,%eax
  30dae7:	00 69 6e             	add    %ch,0x6e(%ecx)
  30daea:	76 61                	jbe    30db4d <idt+0x29d>
  30daec:	6c                   	insb   (%dx),%es:(%edi)
  30daed:	69 64 20 63 61 6c 6c 	imul   $0x206c6c61,0x63(%eax,%eiz,1),%esp
  30daf4:	20 
  30daf5:	74 6f                	je     30db66 <idt+0x2b6>
  30daf7:	20 70 75             	and    %dh,0x75(%eax)
  30dafa:	74 5f                	je     30db5b <idt+0x2ab>
  30dafc:	69 72 71 5f 68 61 6e 	imul   $0x6e61685f,0x71(%edx),%esi
  30db03:	64                   	fs
  30db04:	6c                   	insb   (%dx),%es:(%edi)
  30db05:	65                   	gs
  30db06:	72 00                	jb     30db08 <idt+0x258>
  30db08:	61                   	popa   
  30db09:	74 74                	je     30db7f <idt+0x2cf>
  30db0b:	65                   	gs
  30db0c:	6d                   	insl   (%dx),%es:(%edi)
  30db0d:	70 74                	jo     30db83 <idt+0x2d3>
  30db0f:	20 74 6f 20          	and    %dh,0x20(%edi,%ebp,2)
  30db13:	72 65                	jb     30db7a <idt+0x2ca>
  30db15:	67 69 73 74 65 72 20 	imul   $0x73207265,0x74(%bp,%di),%esi
  30db1c:	73 
  30db1d:	65 63 6f 6e          	arpl   %bp,%gs:0x6e(%edi)
  30db21:	64 20 69 72          	and    %ch,%fs:0x72(%ecx)
  30db25:	71 20                	jno    30db47 <idt+0x297>
  30db27:	68 61 6e 64 6c       	push   $0x6c646e61
  30db2c:	65                   	gs
  30db2d:	72 20                	jb     30db4f <idt+0x29f>
  30db2f:	66 6f                	outsw  %ds:(%esi),(%dx)
  30db31:	72 20                	jb     30db53 <idt+0x2a3>
  30db33:	69 72 71 00 00 1b 62 	imul   $0x621b0000,0x71(%edx),%esi
  30db3a:	25 73 20 1b 72       	and    $0x721b2073,%eax
  30db3f:	2d 3e 20 1b 62       	sub    $0x621b203e,%eax
  30db44:	25 73 3c 25 78       	and    $0x78253c73,%eax
  30db49:	3e 1b 77 0a          	sbb    %ds:0xa(%edi),%esi
  30db4d:	00 45 49             	add    %al,0x49(%ebp)
  30db50:	50                   	push   %eax
  30db51:	20 25 70 20 2d 3e    	and    %ah,0x3e2d2070
  30db57:	20 45 49             	and    %al,0x49(%ebp)
  30db5a:	50                   	push   %eax
  30db5b:	20 25 70 0a 00 1b    	and    %ah,0x1b000a70
  30db61:	72 52                	jb     30dbb5 <idt+0x305>
  30db63:	65                   	gs
  30db64:	61                   	popa   
  30db65:	64                   	fs
  30db66:	79 20                	jns    30db88 <idt+0x2d8>
  30db68:	1b 62 5b             	sbb    0x5b(%edx),%esp
  30db6b:	72 54                	jb     30dbc1 <idt+0x311>
  30db6d:	61                   	popa   
  30db6e:	73 6b                	jae    30dbdb <idt+0x32b>
  30db70:	20 69 73             	and    %ch,0x73(%ecx)
  30db73:	20 3c 6e             	and    %bh,(%esi,%ebp,2)
  30db76:	75 6c                	jne    30dbe4 <idt+0x334>
  30db78:	6c                   	insb   (%dx),%es:(%edi)
  30db79:	3e 1b 62 5d          	sbb    %ds:0x5d(%edx),%esp
  30db7d:	00 00                	add    %al,(%eax)
  30db7f:	00 1b                	add    %bl,(%ebx)
  30db81:	72 55                	jb     30dbd8 <idt+0x328>
  30db83:	6e                   	outsb  %ds:(%esi),(%dx)
  30db84:	72 65                	jb     30dbeb <idt+0x33b>
  30db86:	61                   	popa   
  30db87:	64                   	fs
  30db88:	79 20                	jns    30dbaa <idt+0x2fa>
  30db8a:	20 20                	and    %ah,(%eax)
  30db8c:	1b 62 5b             	sbb    0x5b(%edx),%esp
  30db8f:	1b 72 54             	sbb    0x54(%edx),%esi
  30db92:	61                   	popa   
  30db93:	73 6b                	jae    30dc00 <idt+0x350>
  30db95:	20 69 73             	and    %ch,0x73(%ecx)
  30db98:	20 3c 6e             	and    %bh,(%esi,%ebp,2)
  30db9b:	75 6c                	jne    30dc09 <idt+0x359>
  30db9d:	6c                   	insb   (%dx),%es:(%edi)
  30db9e:	3e 1b 62 5d          	sbb    %ds:0x5d(%edx),%esp
  30dba2:	00 00                	add    %al,(%eax)
  30dba4:	1b 72 55             	sbb    0x55(%edx),%esi
  30dba7:	6e                   	outsb  %ds:(%esi),(%dx)
  30dba8:	72 65                	jb     30dc0f <idt+0x35f>
  30dbaa:	61                   	popa   
  30dbab:	64                   	fs
  30dbac:	79 20                	jns    30dbce <idt+0x31e>
  30dbae:	20 20                	and    %ah,(%eax)
  30dbb0:	20 1b                	and    %bl,(%ebx)
  30dbb2:	62 5b 1b             	bound  %ebx,0x1b(%ebx)
  30dbb5:	72 54                	jb     30dc0b <idt+0x35b>
  30dbb7:	61                   	popa   
  30dbb8:	73 6b                	jae    30dc25 <idt+0x375>
  30dbba:	20 69 73             	and    %ch,0x73(%ecx)
  30dbbd:	20 42 61             	and    %al,0x61(%edx)
  30dbc0:	64 1b 62 5d          	sbb    %fs:0x5d(%edx),%esp
  30dbc4:	00 1b                	add    %bl,(%ebx)
  30dbc6:	72 20                	jb     30dbe8 <idt+0x338>
  30dbc8:	64 6f                	outsl  %fs:(%esi),(%dx)
  30dbca:	69 6e 74 20 20 20 1b 	imul   $0x1b202020,0x74(%esi),%ebp
  30dbd1:	62 5b 0d             	bound  %ebx,0xd(%ebx)
  30dbd4:	6e                   	outsb  %ds:(%esi),(%dx)
  30dbd5:	75 6c                	jne    30dc43 <idt+0x393>
  30dbd7:	6c                   	insb   (%dx),%es:(%edi)
  30dbd8:	1b 62 5d             	sbb    0x5d(%edx),%esp
  30dbdb:	0a 00                	or     (%eax),%al
  30dbdd:	1b 72 20             	sbb    0x20(%edx),%esi
  30dbe0:	64 6f                	outsl  %fs:(%esi),(%dx)
  30dbe2:	69 6e 74 20 1b 62 5b 	imul   $0x5b621b20,0x74(%esi),%ebp
  30dbe9:	6d                   	insl   (%dx),%es:(%edi)
  30dbea:	65                   	gs
  30dbeb:	6d                   	insl   (%dx),%es:(%edi)
  30dbec:	6f                   	outsl  %ds:(%esi),(%dx)
  30dbed:	72 79                	jb     30dc68 <idt+0x3b8>
  30dbef:	20 66 75             	and    %ah,0x75(%esi)
  30dbf2:	6c                   	insb   (%dx),%es:(%edi)
  30dbf3:	6c                   	insb   (%dx),%es:(%edi)
  30dbf4:	1b 62 5d             	sbb    0x5d(%edx),%esp
  30dbf7:	0a 00                	or     (%eax),%al
  30dbf9:	47                   	inc    %edi
  30dbfa:	6f                   	outsl  %ds:(%esi),(%dx)
  30dbfb:	64 00 4d 4d          	add    %cl,%fs:0x4d(%ebp)
  30dbff:	00 43 6c             	add    %al,0x6c(%ebx)
  30dc02:	6f                   	outsl  %ds:(%esi),(%dx)
  30dc03:	63 6b 00             	arpl   %bp,0x0(%ebx)
  30dc06:	43                   	inc    %ebx
  30dc07:	6f                   	outsl  %ds:(%esi),(%dx)
  30dc08:	6e                   	outsb  %ds:(%esi),(%dx)
  30dc09:	73 6c                	jae    30dc77 <idt+0x3c7>
  30dc0b:	6f                   	outsl  %ds:(%esi),(%dx)
  30dc0c:	00 41 54             	add    %al,0x54(%ecx)
  30dc0f:	20 48 61             	and    %cl,0x61(%eax)
  30dc12:	72 64                	jb     30dc78 <idt+0x3c8>
  30dc14:	00 46 69             	add    %al,0x69(%esi)
  30dc17:	6c                   	insb   (%dx),%es:(%edi)
  30dc18:	65 20 53 79          	and    %dl,%gs:0x79(%ebx)
  30dc1c:	73 74                	jae    30dc92 <idt+0x3e2>
  30dc1e:	65                   	gs
  30dc1f:	6d                   	insl   (%dx),%es:(%edi)
  30dc20:	00 53 65             	add    %dl,0x65(%ebx)
  30dc23:	72 69                	jb     30dc8e <idt+0x3de>
  30dc25:	61                   	popa   
  30dc26:	6c                   	insb   (%dx),%es:(%edi)
  30dc27:	00 52 61             	add    %dl,0x61(%edx)
  30dc2a:	6d                   	insl   (%dx),%es:(%edi)
  30dc2b:	20 44 69 73          	and    %al,0x73(%ecx,%ebp,2)
  30dc2f:	6b 00 4e             	imul   $0x4e,(%eax),%eax
  30dc32:	45                   	inc    %ebp
  30dc33:	32 4b 00             	xor    0x0(%ebx),%cl
  30dc36:	53                   	push   %ebx
  30dc37:	68 65 6c 6c 00       	push   $0x6c6c65
  30dc3c:	2f                   	das    
  30dc3d:	62 69 6e             	bound  %ebp,0x6e(%ecx)
  30dc40:	2f                   	das    
  30dc41:	76 36                	jbe    30dc79 <idt+0x3c9>
  30dc43:	73 68                	jae    30dcad <idt+0x3fd>
  30dc45:	00 46 6f             	add    %al,0x6f(%esi)
  30dc48:	72 6b                	jb     30dcb5 <idt+0x405>
  30dc4a:	20 46 61             	and    %al,0x61(%esi)
  30dc4d:	69 6c 74 0a 00 00 00 	imul   $0x1b000000,0xa(%esp,%esi,2),%ebp
  30dc54:	1b 
  30dc55:	72 5b                	jb     30dcb2 <idt+0x402>
  30dc57:	4b                   	dec    %ebx
  30dc58:	4d                   	dec    %ebp
  30dc59:	45                   	inc    %ebp
  30dc5a:	4d                   	dec    %ebp
  30dc5b:	20 5d 20             	and    %bl,0x20(%ebp)
  30dc5e:	3a 20                	cmp    (%eax),%ah
  30dc60:	1b 77 41             	sbb    0x41(%edi),%esi
  30dc63:	64                   	fs
  30dc64:	64                   	fs
  30dc65:	72 65                	jb     30dccc <idt+0x41c>
  30dc67:	73 73                	jae    30dcdc <idt+0x42c>
  30dc69:	20 25 30 38 78 2c    	and    %ah,0x2c783830
  30dc6f:	20 64 6f 65          	and    %ah,0x65(%edi,%ebp,2)
  30dc73:	73 20                	jae    30dc95 <idt+0x3e5>
  30dc75:	6e                   	outsb  %ds:(%esi),(%dx)
  30dc76:	6f                   	outsl  %ds:(%esi),(%dx)
  30dc77:	74 20                	je     30dc99 <idt+0x3e9>
  30dc79:	72 65                	jb     30dce0 <idt+0x430>
  30dc7b:	71 75                	jno    30dcf2 <idt+0x442>
  30dc7d:	69 72 65 20 61 20 73 	imul   $0x73206120,0x65(%edx),%esi
  30dc84:	68 61 72 65 64       	push   $0x64657261
  30dc89:	20 6b 65             	and    %ch,0x65(%ebx)
  30dc8c:	72 6e                	jb     30dcfc <idt+0x44c>
  30dc8e:	65                   	gs
  30dc8f:	6c                   	insb   (%dx),%es:(%edi)
  30dc90:	20 6d 65             	and    %ch,0x65(%ebp)
  30dc93:	6d                   	insl   (%dx),%es:(%edi)
  30dc94:	6f                   	outsl  %ds:(%esi),(%dx)
  30dc95:	72 79                	jb     30dd10 <month.1858+0x10>
  30dc97:	2e 0a 00             	or     %cs:(%eax),%al
  30dc9a:	00 00                	add    %al,(%eax)
  30dc9c:	1b 72 5b             	sbb    0x5b(%edx),%esi
  30dc9f:	4b                   	dec    %ebx
  30dca0:	4d                   	dec    %ebp
  30dca1:	45                   	inc    %ebp
  30dca2:	4d                   	dec    %ebp
  30dca3:	20 5d 20             	and    %bl,0x20(%ebp)
  30dca6:	3a 20                	cmp    (%eax),%ah
  30dca8:	1b 77 61             	sbb    0x61(%edi),%esi
  30dcab:	64                   	fs
  30dcac:	64                   	fs
  30dcad:	72 65                	jb     30dd14 <month.1858+0x14>
  30dcaf:	73 73                	jae    30dd24 <month.1858+0x24>
  30dcb1:	20 25 30 38 78 20    	and    %ah,0x20783830
  30dcb7:	69 73 20 6b 65 72 6e 	imul   $0x6e72656b,0x20(%ebx),%esi
  30dcbe:	65                   	gs
  30dcbf:	6c                   	insb   (%dx),%es:(%edi)
  30dcc0:	20 6d 65             	and    %ch,0x65(%ebp)
  30dcc3:	6d                   	insl   (%dx),%es:(%edi)
  30dcc4:	6f                   	outsl  %ds:(%esi),(%dx)
  30dcc5:	72 79                	jb     30dd40 <month.1858+0x40>
  30dcc7:	0a 00                	or     (%eax),%al
  30dcc9:	00 00                	add    %al,(%eax)
  30dccb:	00 1b                	add    %bl,(%ebx)
  30dccd:	72 5b                	jb     30dd2a <month.1858+0x2a>
  30dccf:	4b                   	dec    %ebx
  30dcd0:	4d                   	dec    %ebp
  30dcd1:	45                   	inc    %ebp
  30dcd2:	4d                   	dec    %ebp
  30dcd3:	20 5d 20             	and    %bl,0x20(%ebp)
  30dcd6:	3a 20                	cmp    (%eax),%ah
  30dcd8:	1b 77 61             	sbb    0x61(%edi),%esi
  30dcdb:	64                   	fs
  30dcdc:	64                   	fs
  30dcdd:	72 65                	jb     30dd44 <month.1858+0x44>
  30dcdf:	73 73                	jae    30dd54 <month.1858+0x54>
  30dce1:	20 25 30 38 78 20    	and    %ah,0x20783830
  30dce7:	69 73 20 66 72 65 65 	imul   $0x65657266,0x20(%ebx),%esi
  30dcee:	20 6d 65             	and    %ch,0x65(%ebp)
  30dcf1:	6d                   	insl   (%dx),%es:(%edi)
  30dcf2:	6f                   	outsl  %ds:(%esi),(%dx)
  30dcf3:	72 79                	jb     30dd6e <month.1858+0x6e>
  30dcf5:	0a 00                	or     (%eax),%al
	...

0030dd00 <month.1858>:
  30dd00:	00 00                	add    %al,(%eax)
  30dd02:	00 00                	add    %al,(%eax)
  30dd04:	1f                   	pop    %ds
  30dd05:	00 00                	add    %al,(%eax)
  30dd07:	00 3b                	add    %bh,(%ebx)
  30dd09:	00 00                	add    %al,(%eax)
  30dd0b:	00 5a 00             	add    %bl,0x0(%edx)
  30dd0e:	00 00                	add    %al,(%eax)
  30dd10:	78 00                	js     30dd12 <month.1858+0x12>
  30dd12:	00 00                	add    %al,(%eax)
  30dd14:	97                   	xchg   %eax,%edi
  30dd15:	00 00                	add    %al,(%eax)
  30dd17:	00 b5 00 00 00 d4    	add    %dh,-0x2c000000(%ebp)
  30dd1d:	00 00                	add    %al,(%eax)
  30dd1f:	00 f3                	add    %dh,%bl
  30dd21:	00 00                	add    %al,(%eax)
  30dd23:	00 11                	add    %dl,(%ecx)
  30dd25:	01 00                	add    %eax,(%eax)
  30dd27:	00 30                	add    %dh,(%eax)
  30dd29:	01 00                	add    %eax,(%eax)
  30dd2b:	00 4e 01             	add    %cl,0x1(%esi)
  30dd2e:	00 00                	add    %al,(%eax)
  30dd30:	66                   	data16
  30dd31:	72 65                	jb     30dd98 <month.1858+0x98>
  30dd33:	65 20 62 75          	and    %ah,%gs:0x75(%edx)
  30dd37:	66                   	data16
  30dd38:	66                   	data16
  30dd39:	65                   	gs
  30dd3a:	72 20                	jb     30dd5c <month.1858+0x5c>
  30dd3c:	65                   	gs
  30dd3d:	72 72                	jb     30ddb1 <month.1858+0xb1>
  30dd3f:	6f                   	outsl  %ds:(%esi),(%dx)
  30dd40:	72 0a                	jb     30dd4c <month.1858+0x4c>
  30dd42:	00 00                	add    %al,(%eax)
  30dd44:	4f                   	dec    %edi
  30dd45:	75 74                	jne    30ddbb <month.1858+0xbb>
  30dd47:	20 6f 66             	and    %ch,0x66(%edi)
  30dd4a:	20 6d 65             	and    %ch,0x65(%ebp)
  30dd4d:	6d                   	insl   (%dx),%es:(%edi)
  30dd4e:	6f                   	outsl  %ds:(%esi),(%dx)
  30dd4f:	72 79                	jb     30ddca <month.1858+0xca>
  30dd51:	20 69 6e             	and    %ch,0x6e(%ecx)
  30dd54:	20 69 6e             	and    %ch,0x6e(%ecx)
  30dd57:	69 74 20 62 75 63 6b 	imul   $0x656b6375,0x62(%eax,%eiz,1),%esi
  30dd5e:	65 
  30dd5f:	74 5f                	je     30ddc0 <month.1858+0xc0>
  30dd61:	69 6e 69 74 21 0a 00 	imul   $0xa2174,0x69(%esi),%ebp
  30dd68:	44                   	inc    %esp
  30dd69:	6f                   	outsl  %ds:(%esi),(%dx)
  30dd6a:	6e                   	outsb  %ds:(%esi),(%dx)
  30dd6b:	27                   	daa    
  30dd6c:	74 20                	je     30dd8e <month.1858+0x8e>
  30dd6e:	61                   	popa   
  30dd6f:	6c                   	insb   (%dx),%es:(%edi)
  30dd70:	6c                   	insb   (%dx),%es:(%edi)
  30dd71:	6f                   	outsl  %ds:(%esi),(%dx)
  30dd72:	63 20                	arpl   %sp,(%eax)
  30dd74:	74 68                	je     30ddde <month.1858+0xde>
  30dd76:	65 20 6d 65          	and    %ch,%gs:0x65(%ebp)
  30dd7a:	6d                   	insl   (%dx),%es:(%edi)
  30dd7b:	6f                   	outsl  %ds:(%esi),(%dx)
  30dd7c:	72 79                	jb     30ddf7 <month.1858+0xf7>
  30dd7e:	21 0a                	and    %ecx,(%edx)
  30dd80:	00 00                	add    %al,(%eax)
  30dd82:	00 00                	add    %al,(%eax)
  30dd84:	4f                   	dec    %edi
  30dd85:	75 74                	jne    30ddfb <month.1858+0xfb>
  30dd87:	20 6f 66             	and    %ch,0x66(%edi)
  30dd8a:	20 6d 65             	and    %ch,0x65(%ebp)
  30dd8d:	6d                   	insl   (%dx),%es:(%edi)
  30dd8e:	6f                   	outsl  %ds:(%esi),(%dx)
  30dd8f:	72 79                	jb     30de0a <month.1858+0x10a>
  30dd91:	20 69 6e             	and    %ch,0x6e(%ecx)
  30dd94:	20 6b 65             	and    %ch,0x65(%ebx)
  30dd97:	72 6e                	jb     30de07 <month.1858+0x107>
  30dd99:	65                   	gs
  30dd9a:	6c                   	insb   (%dx),%es:(%edi)
  30dd9b:	20 6d 61             	and    %ch,0x61(%ebp)
  30dd9e:	6c                   	insb   (%dx),%es:(%edi)
  30dd9f:	6c                   	insb   (%dx),%es:(%edi)
  30dda0:	6f                   	outsl  %ds:(%esi),(%dx)
  30dda1:	63 28                	arpl   %bp,(%eax)
  30dda3:	29 0a                	sub    %ecx,(%edx)
  30dda5:	00 3c 25 70 3e 20 3a 	add    %bh,0x3a203e70(,%eiz,1)
  30ddac:	20 00                	and    %al,(%eax)
  30ddae:	00 00                	add    %al,(%eax)
  30ddb0:	42                   	inc    %edx
  30ddb1:	61                   	popa   
  30ddb2:	64 20 61 64          	and    %ah,%fs:0x64(%ecx)
  30ddb6:	64                   	fs
  30ddb7:	72 65                	jb     30de1e <month.1858+0x11e>
  30ddb9:	73 73                	jae    30de2e <month.1858+0x12e>
  30ddbb:	20 70 61             	and    %dh,0x61(%eax)
  30ddbe:	73 73                	jae    30de33 <month.1858+0x133>
  30ddc0:	65 64 20 74 6f 20    	gs and %dh,%fs:%gs:0x20(%edi,%ebp,2)
  30ddc6:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
  30ddca:	65                   	gs
  30ddcb:	6c                   	insb   (%dx),%es:(%edi)
  30ddcc:	20 66 72             	and    %ah,0x72(%esi)
  30ddcf:	65                   	gs
  30ddd0:	65                   	gs
  30ddd1:	5f                   	pop    %edi
  30ddd2:	73 28                	jae    30ddfc <month.1858+0xfc>
  30ddd4:	29 00                	sub    %eax,(%eax)
  30ddd6:	6d                   	insl   (%dx),%es:(%edi)
  30ddd7:	61                   	popa   
  30ddd8:	6c                   	insb   (%dx),%es:(%edi)
  30ddd9:	6c                   	insb   (%dx),%es:(%edi)
  30ddda:	6f                   	outsl  %ds:(%esi),(%dx)
  30dddb:	63 20                	arpl   %sp,(%eax)
  30dddd:	62 75 63             	bound  %esi,0x63(%ebp)
  30dde0:	6b 65 74 20          	imul   $0x20,0x74(%ebp),%esp
  30dde4:	63 6f 72             	arpl   %bp,0x72(%edi)
  30dde7:	72 75                	jb     30de5e <month.1858+0x15e>
  30dde9:	70 74                	jo     30de5f <month.1858+0x15f>
  30ddeb:	65 64 0a 00          	gs or  %fs:%gs:(%eax),%al
  30ddef:	00 63 6f             	add    %ah,0x6f(%ebx)
  30ddf2:	70 79                	jo     30de6d <month.1858+0x16d>
  30ddf4:	5f                   	pop    %edi
  30ddf5:	69 74 65 6d 20 66 61 	imul   $0x69616620,0x6d(%ebp,%eiz,2),%esi
  30ddfc:	69 
  30ddfd:	6c                   	insb   (%dx),%es:(%edi)
  30ddfe:	74 20                	je     30de20 <month.1858+0x120>
  30de00:	3a 20                	cmp    (%eax),%ah
  30de02:	6d                   	insl   (%dx),%es:(%edi)
  30de03:	65                   	gs
  30de04:	6d                   	insl   (%dx),%es:(%edi)
  30de05:	6f                   	outsl  %ds:(%esi),(%dx)
  30de06:	72 79                	jb     30de81 <month.1858+0x181>
  30de08:	20 6f 75             	and    %ch,0x75(%edi)
  30de0b:	74 21                	je     30de2e <month.1858+0x12e>
  30de0d:	00 6d 61             	add    %ch,0x61(%ebp)
  30de10:	69 6e 2e 63 00 00 00 	imul   $0x63,0x2e(%esi),%ebp
  30de17:	00 45 78             	add    %al,0x78(%ebp)
  30de1a:	63 65 70             	arpl   %sp,0x70(%ebp)
  30de1d:	74 69                	je     30de88 <month.1858+0x188>
  30de1f:	6f                   	outsl  %ds:(%esi),(%dx)
  30de20:	6e                   	outsb  %ds:(%esi),(%dx)
  30de21:	20 3a                	and    %bh,(%edx)
  30de23:	20 67 65             	and    %ah,0x65(%edi)
  30de26:	74 5f                	je     30de87 <month.1858+0x187>
  30de28:	66                   	data16
  30de29:	72 65                	jb     30de90 <month.1858+0x190>
  30de2b:	65                   	gs
  30de2c:	5f                   	pop    %edi
  30de2d:	70 61                	jo     30de90 <month.1858+0x190>
  30de2f:	67 65 28 29          	sub    %ch,%gs:(%bx,%di)
  30de33:	20 25 73 20 25 64    	and    %ah,0x64252073
  30de39:	0a 00                	or     (%eax),%al
  30de3b:	00 45 78             	add    %al,0x78(%ebp)
  30de3e:	63 65 70             	arpl   %sp,0x70(%ebp)
  30de41:	74 69                	je     30deac <month.1858+0x1ac>
  30de43:	6f                   	outsl  %ds:(%esi),(%dx)
  30de44:	6e                   	outsb  %ds:(%esi),(%dx)
  30de45:	20 3a                	and    %bh,(%edx)
  30de47:	20 66 72             	and    %ah,0x72(%esi)
  30de4a:	65                   	gs
  30de4b:	65                   	gs
  30de4c:	5f                   	pop    %edi
  30de4d:	70 61                	jo     30deb0 <month.1858+0x1b0>
  30de4f:	67 65 28 74 61       	sub    %dh,%gs:0x61(%si)
  30de54:	62 6c 65 5b          	bound  %ebp,0x5b(%ebp,%eiz,2)
  30de58:	69 5d 2e 70 6f 69 6e 	imul   $0x6e696f70,0x2e(%ebp),%ebx
  30de5f:	74 65                	je     30dec6 <month.1858+0x1c6>
  30de61:	72 29                	jb     30de8c <month.1858+0x18c>
  30de63:	20 25 73 20 25 64    	and    %ah,0x64252073
  30de69:	0a 00                	or     (%eax),%al
  30de6b:	00 1b                	add    %bl,(%ebx)
  30de6d:	72 5b                	jb     30deca <month.1858+0x1ca>
  30de6f:	4d                   	dec    %ebp
  30de70:	4d                   	dec    %ebp
  30de71:	20 20                	and    %ah,(%eax)
  30de73:	20 5d 20             	and    %bl,0x20(%ebp)
  30de76:	3a 20                	cmp    (%eax),%ah
  30de78:	1b 77 74             	sbb    0x74(%edi),%esi
  30de7b:	61                   	popa   
  30de7c:	62 6c 65 5b          	bound  %ebp,0x5b(%ebp,%eiz,2)
  30de80:	25 64 5d 20 3d       	and    $0x3d205d64,%eax
  30de85:	20 25 30 38 78 20    	and    %ah,0x20783830
  30de8b:	25 73 3a 25 64       	and    $0x64253a73,%eax
  30de90:	0a 00                	or     (%eax),%al
  30de92:	00 00                	add    %al,(%eax)
  30de94:	1b 72 5b             	sbb    0x5b(%edx),%esi
  30de97:	4d                   	dec    %ebp
  30de98:	4d                   	dec    %ebp
  30de99:	20 20                	and    %ah,(%eax)
  30de9b:	20 5d 20             	and    %bl,0x20(%ebp)
  30de9e:	3a 20                	cmp    (%eax),%ah
  30dea0:	1b 77 20             	sbb    0x20(%edi),%esi
  30dea3:	20 64 69 72          	and    %ah,0x72(%ecx,%ebp,2)
  30dea7:	5b                   	pop    %ebx
  30dea8:	25 64 5d 20 3d       	and    $0x3d205d64,%eax
  30dead:	20 25 30 38 78 20    	and    %ah,0x20783830
  30deb3:	25 73 3a 25 64       	and    $0x64253a73,%eax
  30deb8:	0a 00                	or     (%eax),%al
  30deba:	66                   	data16
  30debb:	72 65                	jb     30df22 <month.1858+0x222>
  30debd:	65 20 70 61          	and    %dh,%gs:0x61(%eax)
  30dec1:	67 65 20 66 61       	and    %ah,%gs:0x61(%bp)
  30dec6:	69 6c 00 00 00 00 45 	imul   $0x78450000,0x0(%eax,%eax,1),%ebp
  30decd:	78 
  30dece:	63 65 70             	arpl   %sp,0x70(%ebp)
  30ded1:	74 69                	je     30df3c <month.1858+0x23c>
  30ded3:	6f                   	outsl  %ds:(%esi),(%dx)
  30ded4:	6e                   	outsb  %ds:(%esi),(%dx)
  30ded5:	20 3a                	and    %bh,(%edx)
  30ded7:	20 66 72             	and    %ah,0x72(%esi)
  30deda:	65                   	gs
  30dedb:	65                   	gs
  30dedc:	5f                   	pop    %edi
  30dedd:	70 61                	jo     30df40 <month.1858+0x240>
  30dedf:	67 65 28 28          	sub    %ch,%gs:(%bx,%si)
  30dee3:	50                   	push   %eax
  30dee4:	6f                   	outsl  %ds:(%esi),(%dx)
  30dee5:	69 6e 74 65 72 29 28 	imul   $0x28297265,0x74(%esi),%ebp
  30deec:	6e                   	outsb  %ds:(%esi),(%dx)
  30deed:	73 70                	jae    30df5f <month.1858+0x25f>
  30deef:	29 29                	sub    %ebp,(%ecx)
  30def1:	20 25 73 20 25 64    	and    %ah,0x64252073
  30def7:	0a 00                	or     (%eax),%al
  30def9:	00 00                	add    %al,(%eax)
  30defb:	00 1b                	add    %bl,(%ebx)
  30defd:	72 5b                	jb     30df5a <month.1858+0x25a>
  30deff:	4d                   	dec    %ebp
  30df00:	4d                   	dec    %ebp
  30df01:	20 20                	and    %ah,(%eax)
  30df03:	20 5d 20             	and    %bl,0x20(%ebp)
  30df06:	3a 20                	cmp    (%eax),%ah
  30df08:	1b 77 56             	sbb    0x56(%edi),%esi
  30df0b:	69 72 74 75 61 6c 20 	imul   $0x206c6175,0x74(%edx),%esi
  30df12:	61                   	popa   
  30df13:	64                   	fs
  30df14:	64                   	fs
  30df15:	72 65                	jb     30df7c <month.1858+0x27c>
  30df17:	73 73                	jae    30df8c <month.1858+0x28c>
  30df19:	20 25 30 38 78 20    	and    %ah,0x20783830
  30df1f:	6e                   	outsb  %ds:(%esi),(%dx)
  30df20:	6f                   	outsl  %ds:(%esi),(%dx)
  30df21:	74 20                	je     30df43 <month.1858+0x243>
  30df23:	70 72                	jo     30df97 <month.1858+0x297>
  30df25:	65                   	gs
  30df26:	73 65                	jae    30df8d <month.1858+0x28d>
  30df28:	6e                   	outsb  %ds:(%esi),(%dx)
  30df29:	74 2e                	je     30df59 <month.1858+0x259>
  30df2b:	20 25 73 3a 25 64    	and    %ah,0x64253a73
  30df31:	0a 00                	or     (%eax),%al
  30df33:	00 45 78             	add    %al,0x78(%ebp)
  30df36:	63 65 70             	arpl   %sp,0x70(%ebp)
  30df39:	74 69                	je     30dfa4 <month.1858+0x2a4>
  30df3b:	6f                   	outsl  %ds:(%esi),(%dx)
  30df3c:	6e                   	outsb  %ds:(%esi),(%dx)
  30df3d:	20 3a                	and    %bh,(%edx)
  30df3f:	20 66 72             	and    %ah,0x72(%esi)
  30df42:	65                   	gs
  30df43:	65                   	gs
  30df44:	5f                   	pop    %edi
  30df45:	70 61                	jo     30dfa8 <month.1858+0x2a8>
  30df47:	67 65 28 64 69       	sub    %ah,%gs:0x69(%si)
  30df4c:	72 5b                	jb     30dfa9 <month.1858+0x2a9>
  30df4e:	44                   	inc    %esp
  30df4f:	49                   	dec    %ecx
  30df50:	52                   	push   %edx
  30df51:	5f                   	pop    %edi
  30df52:	49                   	dec    %ecx
  30df53:	4e                   	dec    %esi
  30df54:	44                   	inc    %esp
  30df55:	45                   	inc    %ebp
  30df56:	58                   	pop    %eax
  30df57:	28 28                	sub    %ch,(%eax)
  30df59:	50                   	push   %eax
  30df5a:	6f                   	outsl  %ds:(%esi),(%dx)
  30df5b:	69 6e 74 65 72 29 76 	imul   $0x76297265,0x74(%esi),%ebp
  30df62:	61                   	popa   
  30df63:	29 5d 2e             	sub    %ebx,0x2e(%ebp)
  30df66:	70 6f                	jo     30dfd7 <month.1858+0x2d7>
  30df68:	69 6e 74 65 72 29 20 	imul   $0x20297265,0x74(%esi),%ebp
  30df6f:	25 73 20 25 64       	and    $0x64252073,%eax
  30df74:	0a 00                	or     (%eax),%al
  30df76:	00 00                	add    %al,(%eax)
  30df78:	1b 72 5b             	sbb    0x5b(%edx),%esi
  30df7b:	4d                   	dec    %ebp
  30df7c:	4d                   	dec    %ebp
  30df7d:	20 20                	and    %ah,(%eax)
  30df7f:	20 5d 20             	and    %bl,0x20(%ebp)
  30df82:	3a 20                	cmp    (%eax),%ah
  30df84:	1b 77 4e             	sbb    0x4e(%edi),%esi
  30df87:	6f                   	outsl  %ds:(%esi),(%dx)
  30df88:	74 20                	je     30dfaa <month.1858+0x2aa>
  30df8a:	72 65                	jb     30dff1 <month.1858+0x2f1>
  30df8c:	6c                   	insb   (%dx),%es:(%edi)
  30df8d:	65                   	gs
  30df8e:	61                   	popa   
  30df8f:	73 65                	jae    30dff6 <month.1858+0x2f6>
  30df91:	20 74 68 65          	and    %dh,0x65(%eax,%ebp,2)
  30df95:	20 76 69             	and    %dh,0x69(%esi)
  30df98:	72 74                	jb     30e00e <month.1858+0x30e>
  30df9a:	75 61                	jne    30dffd <month.1858+0x2fd>
  30df9c:	6c                   	insb   (%dx),%es:(%edi)
  30df9d:	20 6d 65             	and    %ch,0x65(%ebp)
  30dfa0:	6d                   	insl   (%dx),%es:(%edi)
  30dfa1:	6f                   	outsl  %ds:(%esi),(%dx)
  30dfa2:	72 79                	jb     30e01d <month.1858+0x31d>
  30dfa4:	20 61 64             	and    %ah,0x64(%ecx)
  30dfa7:	64                   	fs
  30dfa8:	72 65                	jb     30e00f <month.1858+0x30f>
  30dfaa:	73 73                	jae    30e01f <month.1858+0x31f>
  30dfac:	20 25 30 38 78 20    	and    %ah,0x20783830
  30dfb2:	25 73 3a 25 64       	and    $0x64253a73,%eax
  30dfb7:	0a 00                	or     (%eax),%al
  30dfb9:	00 00                	add    %al,(%eax)
  30dfbb:	00 1b                	add    %bl,(%ebx)
  30dfbd:	72 5b                	jb     30e01a <month.1858+0x31a>
  30dfbf:	4d                   	dec    %ebp
  30dfc0:	4d                   	dec    %ebp
  30dfc1:	20 20                	and    %ah,(%eax)
  30dfc3:	20 5d 20             	and    %bl,0x20(%ebp)
  30dfc6:	3a 20                	cmp    (%eax),%ah
  30dfc8:	1b 77 56             	sbb    0x56(%edi),%esi
  30dfcb:	69 72 74 75 61 6c 20 	imul   $0x206c6175,0x74(%edx),%esi
  30dfd2:	61                   	popa   
  30dfd3:	64                   	fs
  30dfd4:	64                   	fs
  30dfd5:	72 65                	jb     30e03c <month.1858+0x33c>
  30dfd7:	73 73                	jae    30e04c <month.1858+0x34c>
  30dfd9:	20 25 30 38 78 20    	and    %ah,0x20783830
  30dfdf:	25 73 3a 25 64       	and    $0x64253a73,%eax
  30dfe4:	0a 00                	or     (%eax),%al
  30dfe6:	00 00                	add    %al,(%eax)
  30dfe8:	45                   	inc    %ebp
  30dfe9:	78 63                	js     30e04e <month.1858+0x34e>
  30dfeb:	65                   	gs
  30dfec:	70 74                	jo     30e062 <month.1858+0x362>
  30dfee:	69 6f 6e 20 3a 20 66 	imul   $0x66203a20,0x6e(%edi),%ebp
  30dff5:	72 65                	jb     30e05c <month.1858+0x35c>
  30dff7:	65                   	gs
  30dff8:	5f                   	pop    %edi
  30dff9:	70 61                	jo     30e05c <month.1858+0x35c>
  30dffb:	67 65 28 74 61       	sub    %dh,%gs:0x61(%si)
  30e000:	62 6c 65 5b          	bound  %ebp,0x5b(%ebp,%eiz,2)
  30e004:	54                   	push   %esp
  30e005:	41                   	inc    %ecx
  30e006:	42                   	inc    %edx
  30e007:	4c                   	dec    %esp
  30e008:	45                   	inc    %ebp
  30e009:	5f                   	pop    %edi
  30e00a:	49                   	dec    %ecx
  30e00b:	4e                   	dec    %esi
  30e00c:	44                   	inc    %esp
  30e00d:	45                   	inc    %ebp
  30e00e:	58                   	pop    %eax
  30e00f:	28 28                	sub    %ch,(%eax)
  30e011:	50                   	push   %eax
  30e012:	6f                   	outsl  %ds:(%esi),(%dx)
  30e013:	69 6e 74 65 72 29 76 	imul   $0x76297265,0x74(%esi),%ebp
  30e01a:	61                   	popa   
  30e01b:	29 5d 2e             	sub    %ebx,0x2e(%ebp)
  30e01e:	70 6f                	jo     30e08f <month.1858+0x38f>
  30e020:	69 6e 74 65 72 29 20 	imul   $0x20297265,0x74(%esi),%ebp
  30e027:	25 73 20 25 64       	and    $0x64252073,%eax
  30e02c:	0a 00                	or     (%eax),%al
  30e02e:	00 00                	add    %al,(%eax)
  30e030:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
  30e035:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
  30e03a:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
  30e03f:	2d 2d 4f 62 6a       	sub    $0x6a624f2d,%eax
  30e044:	65 63 74 20 3a       	arpl   %si,%gs:0x3a(%eax,%eiz,1)
  30e049:	20 25 73 2d 2d 2d    	and    %ah,0x2d2d2d73
  30e04f:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
  30e054:	2d 2d 2d 2d 2d       	sub    $0x2d2d2d2d,%eax
  30e059:	2d 0a 00 67 73       	sub    $0x7367000a,%eax
  30e05e:	20 3a                	and    %bh,(%edx)
  30e060:	20 25 30 38 78 20    	and    %ah,0x20783830
  30e066:	72 65                	jb     30e0cd <month.1858+0x3cd>
  30e068:	67 20 3a             	and    %bh,(%bp,%si)
  30e06b:	20 25 30 38 78 0a    	and    %ah,0xa783830
  30e071:	00 65 73             	add    %ah,0x73(%ebp)
  30e074:	20 3a                	and    %bh,(%edx)
  30e076:	20 25 30 38 78 20    	and    %ah,0x20783830
  30e07c:	65                   	gs
  30e07d:	73 69                	jae    30e0e8 <month.1858+0x3e8>
  30e07f:	20 3a                	and    %bh,(%edx)
  30e081:	20 25 30 38 78 0a    	and    %ah,0xa783830
  30e087:	00 64 73 20          	add    %ah,0x20(%ebx,%esi,2)
  30e08b:	3a 20                	cmp    (%eax),%ah
  30e08d:	25 30 38 78 20       	and    $0x20783830,%eax
  30e092:	65 64 69 20 3a 20 25 	gs imul $0x3025203a,%fs:%gs:(%eax),%esp
  30e099:	30 
  30e09a:	38 78 0a             	cmp    %bh,0xa(%eax)
  30e09d:	00 63 73             	add    %ah,0x73(%ebx)
  30e0a0:	20 3a                	and    %bh,(%edx)
  30e0a2:	20 25 30 38 78 20    	and    %ah,0x20783830
  30e0a8:	65 69 70 20 3a 20 25 	imul   $0x3025203a,%gs:0x20(%eax),%esi
  30e0af:	30 
  30e0b0:	38 78 0a             	cmp    %bh,0xa(%eax)
  30e0b3:	00 73 73             	add    %dh,0x73(%ebx)
  30e0b6:	20 3a                	and    %bh,(%edx)
  30e0b8:	20 25 30 38 78 20    	and    %ah,0x20783830
  30e0be:	65                   	gs
  30e0bf:	73 70                	jae    30e131 <month.1858+0x431>
  30e0c1:	20 3a                	and    %bh,(%edx)
  30e0c3:	20 25 30 38 78 0a    	and    %ah,0xa783830
  30e0c9:	00 66 73             	add    %ah,0x73(%esi)
  30e0cc:	20 3a                	and    %bh,(%edx)
  30e0ce:	20 25 30 38 78 20    	and    %ah,0x20783830
  30e0d4:	66                   	data16
  30e0d5:	6c                   	insb   (%dx),%es:(%edi)
  30e0d6:	67 20 3a             	and    %bh,(%bp,%si)
  30e0d9:	20 25 30 38 78 0a    	and    %ah,0xa783830
  30e0df:	00 45 78             	add    %al,0x78(%ebp)
  30e0e2:	63 65 70             	arpl   %sp,0x70(%ebp)
  30e0e5:	74 69                	je     30e150 <month.1858+0x450>
  30e0e7:	6f                   	outsl  %ds:(%esi),(%dx)
  30e0e8:	6e                   	outsb  %ds:(%esi),(%dx)
  30e0e9:	20 3a                	and    %bh,(%edx)
  30e0eb:	20 6d 6b             	and    %ch,0x6b(%ebp)
  30e0ee:	76 6d                	jbe    30e15d <month.1858+0x45d>
  30e0f0:	28 74 68 69          	sub    %dh,0x69(%eax,%ebp,2)
  30e0f4:	7a 2c                	jp     30e122 <month.1858+0x422>
  30e0f6:	72 65                	jb     30e15d <month.1858+0x45d>
  30e0f8:	67 29 20             	sub    %esp,(%bx,%si)
  30e0fb:	25 73 20 25 64       	and    $0x64252073,%eax
  30e100:	0a 00                	or     (%eax),%al
  30e102:	6d                   	insl   (%dx),%es:(%edi)
  30e103:	65                   	gs
  30e104:	6d                   	insl   (%dx),%es:(%edi)
  30e105:	65 6f                	outsl  %gs:(%esi),(%dx)
  30e107:	72 79                	jb     30e182 <month.1858+0x482>
  30e109:	20 76 65             	and    %dh,0x65(%esi)
  30e10c:	72 79                	jb     30e187 <month.1858+0x487>
  30e10e:	20 66 75             	and    %ah,0x75(%esi)
  30e111:	6c                   	insb   (%dx),%es:(%edi)
  30e112:	6c                   	insb   (%dx),%es:(%edi)
  30e113:	21 2d 5f 2d 7c 7c    	and    %ebp,0x7c7c2d5f
  30e119:	7c 00                	jl     30e11b <month.1858+0x41b>
  30e11b:	53                   	push   %ebx
  30e11c:	79 73                	jns    30e191 <month.1858+0x491>
  30e11e:	74 65                	je     30e185 <month.1858+0x485>
  30e120:	6d                   	insl   (%dx),%es:(%edi)
  30e121:	00 00                	add    %al,(%eax)
  30e123:	00 3c 6d 6d 3e 00 76 	add    %bh,0x76003e6d(,%ebp,2)
  30e12a:	6d                   	insl   (%dx),%es:(%edi)
  30e12b:	2e 63 00             	arpl   %ax,%cs:(%eax)
  30e12e:	00 00                	add    %al,(%eax)
  30e130:	45                   	inc    %ebp
  30e131:	78 63                	js     30e196 <month.1858+0x496>
  30e133:	65                   	gs
  30e134:	70 74                	jo     30e1aa <month.1858+0x4aa>
  30e136:	69 6f 6e 20 3a 20 72 	imul   $0x72203a20,0x6e(%edi),%ebp
  30e13d:	65                   	gs
  30e13e:	61                   	popa   
  30e13f:	64 28 74 68 69       	sub    %dh,%fs:0x69(%eax,%ebp,2)
  30e144:	7a 2d                	jp     30e173 <month.1858+0x473>
  30e146:	3e 6f                	outsl  %ds:(%esi),(%dx)
  30e148:	62 6a 65             	bound  %ebp,0x65(%edx)
  30e14b:	63 74 2c 26          	arpl   %si,0x26(%esp,%ebp,1)
  30e14f:	65                   	gs
  30e150:	68 64 72 2c 73       	push   $0x732c7264
  30e155:	69 7a 65 6f 66 28 65 	imul   $0x6528666f,0x65(%edx),%edi
  30e15c:	68 64 72 29 29       	push   $0x29297264
  30e161:	20 25 73 20 25 64    	and    %ah,0x64252073
  30e167:	0a 00                	or     (%eax),%al
  30e169:	00 00                	add    %al,(%eax)
  30e16b:	00 45 78             	add    %al,0x78(%ebp)
  30e16e:	63 65 70             	arpl   %sp,0x70(%ebp)
  30e171:	74 69                	je     30e1dc <month.1858+0x4dc>
  30e173:	6f                   	outsl  %ds:(%esi),(%dx)
  30e174:	6e                   	outsb  %ds:(%esi),(%dx)
  30e175:	20 3a                	and    %bh,(%edx)
  30e177:	20 6b 61             	and    %ch,0x61(%ebx)
  30e17a:	6c                   	insb   (%dx),%es:(%edi)
  30e17b:	6c                   	insb   (%dx),%es:(%edi)
  30e17c:	6f                   	outsl  %ds:(%esi),(%dx)
  30e17d:	63 28                	arpl   %bp,(%eax)
  30e17f:	70 73                	jo     30e1f4 <month.1858+0x4f4>
  30e181:	69 7a 65 29 20 25 73 	imul   $0x73252029,0x65(%edx),%edi
  30e188:	20 25 64 0a 00 00    	and    %ah,0xa64
  30e18e:	00 00                	add    %al,(%eax)
  30e190:	45                   	inc    %ebp
  30e191:	78 63                	js     30e1f6 <month.1858+0x4f6>
  30e193:	65                   	gs
  30e194:	70 74                	jo     30e20a <month.1858+0x50a>
  30e196:	69 6f 6e 20 3a 20 72 	imul   $0x72203a20,0x6e(%edi),%ebp
  30e19d:	65                   	gs
  30e19e:	61                   	popa   
  30e19f:	64 28 74 68 69       	sub    %dh,%fs:0x69(%eax,%ebp,2)
  30e1a4:	7a 2d                	jp     30e1d3 <month.1858+0x4d3>
  30e1a6:	3e 6f                	outsl  %ds:(%esi),(%dx)
  30e1a8:	62 6a 65             	bound  %ebp,0x65(%edx)
  30e1ab:	63 74 2c 70          	arpl   %si,0x70(%esp,%ebp,1)
  30e1af:	68 64 72 2c 70       	push   $0x702c7264
  30e1b4:	73 69                	jae    30e21f <month.1858+0x51f>
  30e1b6:	7a 65                	jp     30e21d <month.1858+0x51d>
  30e1b8:	29 20                	sub    %esp,(%eax)
  30e1ba:	25 73 20 25 64       	and    $0x64252073,%eax
  30e1bf:	0a 00                	or     (%eax),%al
  30e1c1:	00 00                	add    %al,(%eax)
  30e1c3:	00 45 78             	add    %al,0x78(%ebp)
  30e1c6:	63 65 70             	arpl   %sp,0x70(%ebp)
  30e1c9:	74 69                	je     30e234 <month.1858+0x534>
  30e1cb:	6f                   	outsl  %ds:(%esi),(%dx)
  30e1cc:	6e                   	outsb  %ds:(%esi),(%dx)
  30e1cd:	20 3a                	and    %bh,(%edx)
  30e1cf:	20 6b 61             	and    %ch,0x61(%ebx)
  30e1d2:	6c                   	insb   (%dx),%es:(%edi)
  30e1d3:	6c                   	insb   (%dx),%es:(%edi)
  30e1d4:	6f                   	outsl  %ds:(%esi),(%dx)
  30e1d5:	63 28                	arpl   %bp,(%eax)
  30e1d7:	73 69                	jae    30e242 <month.1858+0x542>
  30e1d9:	7a 65                	jp     30e240 <month.1858+0x540>
  30e1db:	6f                   	outsl  %ds:(%esi),(%dx)
  30e1dc:	66                   	data16
  30e1dd:	28 56 4d             	sub    %dl,0x4d(%esi)
  30e1e0:	48                   	dec    %eax
  30e1e1:	65                   	gs
  30e1e2:	61                   	popa   
  30e1e3:	64 29 29             	sub    %ebp,%fs:(%ecx)
  30e1e6:	20 25 73 20 25 64    	and    %ah,0x64252073
  30e1ec:	0a 00                	or     (%eax),%al
  30e1ee:	00 00                	add    %al,(%eax)
  30e1f0:	45                   	inc    %ebp
  30e1f1:	78 63                	js     30e256 <month.1858+0x556>
  30e1f3:	65                   	gs
  30e1f4:	70 74                	jo     30e26a <month.1858+0x56a>
  30e1f6:	69 6f 6e 20 3a 20 6b 	imul   $0x6b203a20,0x6e(%edi),%ebp
  30e1fd:	61                   	popa   
  30e1fe:	6c                   	insb   (%dx),%es:(%edi)
  30e1ff:	6c                   	insb   (%dx),%es:(%edi)
  30e200:	6f                   	outsl  %ds:(%esi),(%dx)
  30e201:	63 28                	arpl   %bp,(%eax)
  30e203:	73 69                	jae    30e26e <month.1858+0x56e>
  30e205:	7a 65                	jp     30e26c <month.1858+0x56c>
  30e207:	6f                   	outsl  %ds:(%esi),(%dx)
  30e208:	66                   	data16
  30e209:	28 2a                	sub    %ch,(%edx)
  30e20b:	6e                   	outsb  %ds:(%esi),(%dx)
  30e20c:	65                   	gs
  30e20d:	77 29                	ja     30e238 <month.1858+0x538>
  30e20f:	29 20                	sub    %esp,(%eax)
  30e211:	25 73 20 25 64       	and    $0x64252073,%eax
  30e216:	0a 00                	or     (%eax),%al
  30e218:	5b                   	pop    %ebx
  30e219:	25 70 5d 3c 68       	and    $0x683c5d70,%eax
  30e21e:	65                   	gs
  30e21f:	61                   	popa   
  30e220:	64 20 25 70 3e 2c 3c 	and    %ah,%fs:0x3c2c3e70
  30e227:	6e                   	outsb  %ds:(%esi),(%dx)
  30e228:	65                   	gs
  30e229:	78 74                	js     30e29f <month.1858+0x59f>
  30e22b:	20 25 70 3e 0a 00    	and    %ah,0xa3e70
  30e231:	00 00                	add    %al,(%eax)
  30e233:	00 1b                	add    %bl,(%ebx)
  30e235:	72 54                	jb     30e28b <month.1858+0x58b>
  30e237:	4f                   	dec    %edi
  30e238:	44                   	inc    %esp
  30e239:	4f                   	dec    %edi
  30e23a:	20 3a                	and    %bh,(%edx)
  30e23c:	20 4d 4d             	and    %cl,0x4d(%ebp)
  30e23f:	20 63 61             	and    %ah,0x61(%ebx)
  30e242:	6e                   	outsb  %ds:(%esi),(%dx)
  30e243:	27                   	daa    
  30e244:	74 20                	je     30e266 <month.1858+0x566>
  30e246:	63 6c 6f 73          	arpl   %bp,0x73(%edi,%ebp,2)
  30e24a:	65 20 6f 62          	and    %ch,%gs:0x62(%edi)
  30e24e:	6a 65                	push   $0x65
  30e250:	63 74 2c 63          	arpl   %si,0x63(%esp,%ebp,1)
  30e254:	61                   	popa   
  30e255:	6c                   	insb   (%dx),%es:(%edi)
  30e256:	6c                   	insb   (%dx),%es:(%edi)
  30e257:	20 6c 69 6e          	and    %ch,0x6e(%ecx,%ebp,2)
  30e25b:	6b 20 7b             	imul   $0x7b,(%eax),%esp
  30e25e:	6d                   	insl   (%dx),%es:(%edi)
  30e25f:	6d                   	insl   (%dx),%es:(%edi)
  30e260:	20 2d 3e 20 6f 62    	and    %ch,0x626f203e
  30e266:	6a 65                	push   $0x65
  30e268:	63 74 20 2d          	arpl   %si,0x2d(%eax,%eiz,1)
  30e26c:	3e 20 6d 6d          	and    %ch,%ds:0x6d(%ebp)
  30e270:	7d 20                	jge    30e292 <month.1858+0x592>
  30e272:	69 73 20 64 69 65 2e 	imul   $0x2e656964,0x20(%ebx),%esi
  30e279:	20 20                	and    %ah,(%eax)
  30e27b:	25 73 3a 25 64       	and    $0x64253a73,%eax
  30e280:	1b 77 0a             	sbb    0xa(%edi),%esi
  30e283:	00 45 78             	add    %al,0x78(%ebp)
  30e286:	63 65 70             	arpl   %sp,0x70(%ebp)
  30e289:	74 69                	je     30e2f4 <month.1858+0x5f4>
  30e28b:	6f                   	outsl  %ds:(%esi),(%dx)
  30e28c:	6e                   	outsb  %ds:(%esi),(%dx)
  30e28d:	20 3a                	and    %bh,(%edx)
  30e28f:	20 67 65             	and    %ah,0x65(%edi)
  30e292:	74 5f                	je     30e2f3 <month.1858+0x5f3>
  30e294:	66                   	data16
  30e295:	72 65                	jb     30e2fc <month.1858+0x5fc>
  30e297:	65                   	gs
  30e298:	5f                   	pop    %edi
  30e299:	70 61                	jo     30e2fc <month.1858+0x5fc>
  30e29b:	67 65 28 29          	sub    %ch,%gs:(%bx,%di)
  30e29f:	20 25 73 20 25 64    	and    %ah,0x64252073
  30e2a5:	0a 00                	or     (%eax),%al
  30e2a7:	3e                   	ds
  30e2a8:	68 65 61 64 20       	push   $0x20646165
  30e2ad:	25 70 20 3e 6e       	and    $0x6e3e2070,%eax
  30e2b2:	65                   	gs
  30e2b3:	78 74                	js     30e329 <month.1858+0x629>
  30e2b5:	20 25 70 0a 00 00    	and    %ah,0xa70
  30e2bb:	00 45 78             	add    %al,0x78(%ebp)
  30e2be:	63 65 70             	arpl   %sp,0x70(%ebp)
  30e2c1:	74 69                	je     30e32c <month.1858+0x62c>
  30e2c3:	6f                   	outsl  %ds:(%esi),(%dx)
  30e2c4:	6e                   	outsb  %ds:(%esi),(%dx)
  30e2c5:	20 3a                	and    %bh,(%edx)
  30e2c7:	20 72 65             	and    %dh,0x65(%edx)
  30e2ca:	61                   	popa   
  30e2cb:	64 28 76 6d          	sub    %dh,%fs:0x6d(%esi)
  30e2cf:	68 65 61 64 2d       	push   $0x2d646165
  30e2d4:	3e 6f                	outsl  %ds:(%esi),(%dx)
  30e2d6:	62 6a 65             	bound  %ebp,0x65(%edx)
  30e2d9:	63 74 2c 70          	arpl   %si,0x70(%esp,%ebp,1)
  30e2dd:	61                   	popa   
  30e2de:	67                   	addr16
  30e2df:	65                   	gs
  30e2e0:	2c 6c                	sub    $0x6c,%al
  30e2e2:	65 6e                	outsb  %gs:(%esi),(%dx)
  30e2e4:	29 20                	sub    %esp,(%eax)
  30e2e6:	25 73 20 25 64       	and    $0x64252073,%eax
  30e2eb:	0a 00                	or     (%eax),%al
  30e2ed:	00 00                	add    %al,(%eax)
  30e2ef:	00 66 73             	add    %ah,0x73(%esi)
  30e2f2:	2e 63 00             	arpl   %ax,%cs:(%eax)
  30e2f5:	00 00                	add    %al,(%eax)
  30e2f7:	00 45 78             	add    %al,0x78(%ebp)
  30e2fa:	63 65 70             	arpl   %sp,0x70(%ebp)
  30e2fd:	74 69                	je     30e368 <month.1858+0x668>
  30e2ff:	6f                   	outsl  %ds:(%esi),(%dx)
  30e300:	6e                   	outsb  %ds:(%esi),(%dx)
  30e301:	20 3a                	and    %bh,(%edx)
  30e303:	20 7a 6f             	and    %bh,0x6f(%edx)
  30e306:	6e                   	outsb  %ds:(%esi),(%dx)
  30e307:	65                   	gs
  30e308:	5f                   	pop    %edi
  30e309:	72 77                	jb     30e382 <month.1858+0x682>
  30e30b:	28 69 6e             	sub    %ch,0x6e(%ecx)
  30e30e:	6f                   	outsl  %ds:(%esi),(%dx)
  30e30f:	64                   	fs
  30e310:	65                   	gs
  30e311:	2c 52                	sub    $0x52,%al
  30e313:	45                   	inc    %ebp
  30e314:	41                   	inc    %ecx
  30e315:	44                   	inc    %esp
  30e316:	2c 7a                	sub    $0x7a,%al
  30e318:	6f                   	outsl  %ds:(%esi),(%dx)
  30e319:	6e                   	outsb  %ds:(%esi),(%dx)
  30e31a:	65                   	gs
  30e31b:	2c 62                	sub    $0x62,%al
  30e31d:	6c                   	insb   (%dx),%es:(%edi)
  30e31e:	6f                   	outsl  %ds:(%esi),(%dx)
  30e31f:	63 6b 29             	arpl   %bp,0x29(%ebx)
  30e322:	20 25 73 20 25 64    	and    %ah,0x64252073
  30e328:	0a 00                	or     (%eax),%al
  30e32a:	00 00                	add    %al,(%eax)
  30e32c:	45                   	inc    %ebp
  30e32d:	78 63                	js     30e392 <month.1858+0x692>
  30e32f:	65                   	gs
  30e330:	70 74                	jo     30e3a6 <month.1858+0x6a6>
  30e332:	69 6f 6e 20 3a 20 7a 	imul   $0x7a203a20,0x6e(%edi),%ebp
  30e339:	6f                   	outsl  %ds:(%esi),(%dx)
  30e33a:	6e                   	outsb  %ds:(%esi),(%dx)
  30e33b:	65                   	gs
  30e33c:	5f                   	pop    %edi
  30e33d:	72 77                	jb     30e3b6 <month.1858+0x6b6>
  30e33f:	28 26                	sub    %ah,(%esi)
  30e341:	28 66 69             	sub    %ah,0x69(%esi)
  30e344:	6c                   	insb   (%dx),%es:(%edi)
  30e345:	65                   	gs
  30e346:	2d 3e 69 6e 6f       	sub    $0x6f6e693e,%eax
  30e34b:	64 65 29 2c 52       	fs sub %ebp,%fs:%gs:(%edx,%edx,2)
  30e350:	45                   	inc    %ebp
  30e351:	41                   	inc    %ecx
  30e352:	44                   	inc    %esp
  30e353:	2c 7a                	sub    $0x7a,%al
  30e355:	6f                   	outsl  %ds:(%esi),(%dx)
  30e356:	6e                   	outsb  %ds:(%esi),(%dx)
  30e357:	65                   	gs
  30e358:	2c 62                	sub    $0x62,%al
  30e35a:	75 66                	jne    30e3c2 <month.1858+0x6c2>
  30e35c:	66 29 20             	sub    %sp,(%eax)
  30e35f:	25 73 20 25 64       	and    $0x64252073,%eax
  30e364:	0a 00                	or     (%eax),%al
  30e366:	00 00                	add    %al,(%eax)
  30e368:	45                   	inc    %ebp
  30e369:	78 63                	js     30e3ce <month.1858+0x6ce>
  30e36b:	65                   	gs
  30e36c:	70 74                	jo     30e3e2 <month.1858+0x6e2>
  30e36e:	69 6f 6e 20 3a 20 7a 	imul   $0x7a203a20,0x6e(%edi),%ebp
  30e375:	6f                   	outsl  %ds:(%esi),(%dx)
  30e376:	6e                   	outsb  %ds:(%esi),(%dx)
  30e377:	65                   	gs
  30e378:	5f                   	pop    %edi
  30e379:	72 77                	jb     30e3f2 <month.1858+0x6f2>
  30e37b:	28 26                	sub    %ah,(%esi)
  30e37d:	28 66 69             	sub    %ah,0x69(%esi)
  30e380:	6c                   	insb   (%dx),%es:(%edi)
  30e381:	65                   	gs
  30e382:	2d 3e 69 6e 6f       	sub    $0x6f6e693e,%eax
  30e387:	64 65 29 2c 57       	fs sub %ebp,%fs:%gs:(%edi,%edx,2)
  30e38c:	52                   	push   %edx
  30e38d:	49                   	dec    %ecx
  30e38e:	54                   	push   %esp
  30e38f:	45                   	inc    %ebp
  30e390:	2c 7a                	sub    $0x7a,%al
  30e392:	6f                   	outsl  %ds:(%esi),(%dx)
  30e393:	6e                   	outsb  %ds:(%esi),(%dx)
  30e394:	65                   	gs
  30e395:	2c 62                	sub    $0x62,%al
  30e397:	75 66                	jne    30e3ff <month.1858+0x6ff>
  30e399:	66 29 20             	sub    %sp,(%eax)
  30e39c:	25 73 20 25 64       	and    $0x64252073,%eax
  30e3a1:	0a 00                	or     (%eax),%al
  30e3a3:	1b 72 44             	sbb    0x44(%edx),%esi
  30e3a6:	6f                   	outsl  %ds:(%esi),(%dx)
  30e3a7:	6e                   	outsb  %ds:(%esi),(%dx)
  30e3a8:	27                   	daa    
  30e3a9:	74 20                	je     30e3cb <month.1858+0x6cb>
  30e3ab:	72 65                	jb     30e412 <month.1858+0x712>
  30e3ad:	61                   	popa   
  30e3ae:	64 20 73 75          	and    %dh,%fs:0x75(%ebx)
  30e3b2:	70 65                	jo     30e419 <month.1858+0x719>
  30e3b4:	72 20                	jb     30e3d6 <month.1858+0x6d6>
  30e3b6:	62 6c 6f 63          	bound  %ebp,0x63(%edi,%ebp,2)
  30e3ba:	6b 21 1b             	imul   $0x1b,(%ecx),%esp
  30e3bd:	77 0a                	ja     30e3c9 <month.1858+0x6c9>
  30e3bf:	00 1b                	add    %bl,(%ebx)
  30e3c1:	72 44                	jb     30e407 <month.1858+0x707>
  30e3c3:	6f                   	outsl  %ds:(%esi),(%dx)
  30e3c4:	6e                   	outsb  %ds:(%esi),(%dx)
  30e3c5:	27                   	daa    
  30e3c6:	74 20                	je     30e3e8 <month.1858+0x6e8>
  30e3c8:	72 65                	jb     30e42f <month.1858+0x72f>
  30e3ca:	61                   	popa   
  30e3cb:	64 20 69 6e          	and    %ch,%fs:0x6e(%ecx)
  30e3cf:	6f                   	outsl  %ds:(%esi),(%dx)
  30e3d0:	64 65 20 62 6c       	fs and %ah,%fs:%gs:0x6c(%edx)
  30e3d5:	6f                   	outsl  %ds:(%esi),(%dx)
  30e3d6:	63 6b 21             	arpl   %bp,0x21(%ebx)
  30e3d9:	1b 77 0a             	sbb    0xa(%edi),%esi
  30e3dc:	00 00                	add    %al,(%eax)
  30e3de:	00 00                	add    %al,(%eax)
  30e3e0:	1b 72 67             	sbb    0x67(%edx),%esi
  30e3e3:	65                   	gs
  30e3e4:	74 5f                	je     30e445 <month.1858+0x745>
  30e3e6:	7a 6f                	jp     30e457 <month.1858+0x757>
  30e3e8:	6e                   	outsb  %ds:(%esi),(%dx)
  30e3e9:	65 20 66 61          	and    %ah,%gs:0x61(%esi)
  30e3ed:	69 6c 75 72 65 2c 25 	imul   $0x64252c65,0x72(%ebp,%esi,2),%ebp
  30e3f4:	64 
  30e3f5:	1b 77 0a             	sbb    0xa(%edi),%esi
  30e3f8:	00 00                	add    %al,(%eax)
  30e3fa:	00 00                	add    %al,(%eax)
  30e3fc:	1b 72 7a             	sbb    0x7a(%edx),%esi
  30e3ff:	6f                   	outsl  %ds:(%esi),(%dx)
  30e400:	6e                   	outsb  %ds:(%esi),(%dx)
  30e401:	65                   	gs
  30e402:	5f                   	pop    %edi
  30e403:	72 77                	jb     30e47c <month.1858+0x77c>
  30e405:	20 3a                	and    %bh,(%edx)
  30e407:	20 6f 66             	and    %ch,0x66(%edi)
  30e40a:	66                   	data16
  30e40b:	73 65                	jae    30e472 <month.1858+0x772>
  30e40d:	74 20                	je     30e42f <month.1858+0x72f>
  30e40f:	69 73 20 62 61 64 2c 	imul   $0x2c646162,0x20(%ebx),%esi
  30e416:	61                   	popa   
  30e417:	74 20                	je     30e439 <month.1858+0x739>
  30e419:	7a 6f                	jp     30e48a <month.1858+0x78a>
  30e41b:	6e                   	outsb  %ds:(%esi),(%dx)
  30e41c:	65 20 25 78 1b 77 0a 	and    %ah,%gs:0xa771b78
  30e423:	00 1b                	add    %bl,(%ebx)
  30e425:	72 73                	jb     30e49a <month.1858+0x79a>
  30e427:	65                   	gs
  30e428:	61                   	popa   
  30e429:	72 63                	jb     30e48e <month.1858+0x78e>
  30e42b:	68 5f 64 69 72       	push   $0x7269645f
  30e430:	20 3a                	and    %bh,(%edx)
  30e432:	20 7a 6f             	and    %bh,0x6f(%edx)
  30e435:	6e                   	outsb  %ds:(%esi),(%dx)
  30e436:	65                   	gs
  30e437:	5f                   	pop    %edi
  30e438:	72 77                	jb     30e4b1 <month.1858+0x7b1>
  30e43a:	20 66 61             	and    %ah,0x61(%esi)
  30e43d:	69 6c 0a 1b 77 0a 00 	imul   $0x52000a77,0x1b(%edx,%ecx,1),%ebp
  30e444:	52 
  30e445:	65                   	gs
  30e446:	61                   	popa   
  30e447:	64 20 69 6e          	and    %ch,%fs:0x6e(%ecx)
  30e44b:	6f                   	outsl  %ds:(%esi),(%dx)
  30e44c:	64 65 20 45 72       	fs and %al,%fs:%gs:0x72(%ebp)
  30e451:	72 6f                	jb     30e4c2 <month.1858+0x7c2>
  30e453:	72 21                	jb     30e476 <month.1858+0x776>
  30e455:	00 2d 2d 2d 0a 00    	add    %ch,0xa2d2d
  30e45b:	00 1b                	add    %bl,(%ebx)
  30e45d:	72 41                	jb     30e4a0 <month.1858+0x7a0>
  30e45f:	54                   	push   %esp
  30e460:	20 44 69 73          	and    %al,0x73(%ecx,%ebp,2)
  30e464:	6b 48 61 72          	imul   $0x72,0x61(%eax),%ecx
  30e468:	64 20 63 6f          	and    %ah,%fs:0x6f(%ebx)
  30e46c:	6e                   	outsb  %ds:(%esi),(%dx)
  30e46d:	74 72                	je     30e4e1 <month.1858+0x7e1>
  30e46f:	6f                   	outsl  %ds:(%esi),(%dx)
  30e470:	6c                   	insb   (%dx),%es:(%edi)
  30e471:	6c                   	insb   (%dx),%es:(%edi)
  30e472:	65                   	gs
  30e473:	72 20                	jb     30e495 <month.1858+0x795>
  30e475:	74 69                	je     30e4e0 <month.1858+0x7e0>
  30e477:	6d                   	insl   (%dx),%es:(%edi)
  30e478:	65 20 6f 75          	and    %ch,%gs:0x75(%edi)
  30e47c:	74 20                	je     30e49e <month.1858+0x79e>
  30e47e:	0a 1b                	or     (%ebx),%bl
  30e480:	77 00                	ja     30e482 <month.1858+0x782>
  30e482:	1b 72 48             	sbb    0x48(%edx),%esi
  30e485:	61                   	popa   
  30e486:	72 64                	jb     30e4ec <month.1858+0x7ec>
  30e488:	77 61                	ja     30e4eb <month.1858+0x7eb>
  30e48a:	72 65                	jb     30e4f1 <month.1858+0x7f1>
  30e48c:	20 49 4f             	and    %cl,0x4f(%ecx)
  30e48f:	20 1b                	and    %bl,(%ebx)
  30e491:	62 5b 1b             	bound  %ebx,0x1b(%ebx)
  30e494:	72 46                	jb     30e4dc <month.1858+0x7dc>
  30e496:	61                   	popa   
  30e497:	69 6c 1b 62 5d 0a 00 	imul   $0xa5d,0x62(%ebx,%ebx,1),%ebp
  30e49e:	00 
  30e49f:	00 b4 ba 30 00 d9 be 	add    %dh,-0x4126ffd0(%edx,%edi,4)
  30e4a6:	30 00                	xor    %al,(%eax)
  30e4a8:	c0 be 30 00 d9 be 30 	sarb   $0x30,-0x4126ffd0(%esi)
  30e4af:	00 88 be 30 00 30    	add    %cl,0x300030be(%eax)
  30e4b5:	bb 30 00 20 bd       	mov    $0xbd200030,%ebx
  30e4ba:	30 00                	xor    %al,(%eax)
  30e4bc:	d9 be 30 00 d9 be    	fnstcw -0x4126ffd0(%esi)
  30e4c2:	30 00                	xor    %al,(%eax)
  30e4c4:	d9 be 30 00 15 be    	fnstcw -0x41eaffd0(%esi)
  30e4ca:	30 00                	xor    %al,(%eax)
  30e4cc:	d9 be 30 00 d9 be    	fnstcw -0x4126ffd0(%esi)
  30e4d2:	30 00                	xor    %al,(%eax)
  30e4d4:	3b ba 30 00 d9 be    	cmp    -0x4126ffd0(%edx),%edi
  30e4da:	30 00                	xor    %al,(%eax)
  30e4dc:	d9 be 30 00 28 bc    	fnstcw -0x43d7ffd0(%esi)
  30e4e2:	30 00                	xor    %al,(%eax)
  30e4e4:	d9 be 30 00 d9 be    	fnstcw -0x4126ffd0(%esi)
  30e4ea:	30 00                	xor    %al,(%eax)
  30e4ec:	cd be                	int    $0xbe
  30e4ee:	30 00                	xor    %al,(%eax)
  30e4f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  30e4f1:	bc 30 00 9c bd       	mov    $0xbd9c0030,%esp
  30e4f6:	30 00                	xor    %al,(%eax)
  30e4f8:	d9 be 30 00 ac bb    	fnstcw -0x4453ffd0(%esi)
  30e4fe:	30 00                	xor    %al,(%eax)
  30e500:	d9 be 30 00 d9 be    	fnstcw -0x4126ffd0(%esi)
  30e506:	30 00                	xor    %al,(%eax)
  30e508:	d9 be 30 00 d9 be    	fnstcw -0x4126ffd0(%esi)
  30e50e:	30 00                	xor    %al,(%eax)
  30e510:	d9 be 30 00 d9 be    	fnstcw -0x4126ffd0(%esi)
  30e516:	30 00                	xor    %al,(%eax)
  30e518:	d9 be 30 00 d9 be    	fnstcw -0x4126ffd0(%esi)
  30e51e:	30 00                	xor    %al,(%eax)
  30e520:	76 ba                	jbe    30e4dc <month.1858+0x7dc>
  30e522:	30 00                	xor    %al,(%eax)
  30e524:	d9 be 30 00 d9 be    	fnstcw -0x4126ffd0(%esi)
  30e52a:	30 00                	xor    %al,(%eax)
  30e52c:	d9 be 30 00 50 be    	fnstcw -0x41afffd0(%esi)
  30e532:	30 00                	xor    %al,(%eax)
  30e534:	f2 ba 30 00 e2 bc    	repnz mov $0xbce20030,%edx
  30e53a:	30 00                	xor    %al,(%eax)
  30e53c:	d9 be 30 00 d9 be    	fnstcw -0x4126ffd0(%esi)
  30e542:	30 00                	xor    %al,(%eax)
  30e544:	d9 be 30 00 da bd    	fnstcw -0x4225ffd0(%esi)
  30e54a:	30 00                	xor    %al,(%eax)
  30e54c:	d9 be 30 00 d9 be    	fnstcw -0x4126ffd0(%esi)
  30e552:	30 00                	xor    %al,(%eax)
  30e554:	00 ba 30 00 d9 be    	add    %bh,-0x4126ffd0(%edx)
  30e55a:	30 00                	xor    %al,(%eax)
  30e55c:	d9 be 30 00 ea bb    	fnstcw -0x4415ffd0(%esi)
  30e562:	30 00                	xor    %al,(%eax)
  30e564:	d9 be 30 00 d9 be    	fnstcw -0x4126ffd0(%esi)
  30e56a:	30 00                	xor    %al,(%eax)
  30e56c:	d9 be 30 00 66 bc    	fnstcw -0x4399ffd0(%esi)
  30e572:	30 00                	xor    %al,(%eax)
  30e574:	5e                   	pop    %esi
  30e575:	bd 30 00 d9 be       	mov    $0xbed90030,%ebp
  30e57a:	30 00                	xor    %al,(%eax)
  30e57c:	6e                   	outsb  %ds:(%esi),(%dx)
  30e57d:	bb 30 00 25 63       	mov    $0x63250030,%ebx
	...

0030e5c0 <keymap>:
  30e5c0:	00 00                	add    %al,(%eax)
  30e5c2:	00 00                	add    %al,(%eax)
  30e5c4:	1b 00                	sbb    (%eax),%eax
  30e5c6:	00 00                	add    %al,(%eax)
  30e5c8:	31 00                	xor    %eax,(%eax)
  30e5ca:	00 00                	add    %al,(%eax)
  30e5cc:	32 00                	xor    (%eax),%al
  30e5ce:	00 00                	add    %al,(%eax)
  30e5d0:	33 00                	xor    (%eax),%eax
  30e5d2:	00 00                	add    %al,(%eax)
  30e5d4:	34 00                	xor    $0x0,%al
  30e5d6:	00 00                	add    %al,(%eax)
  30e5d8:	35 00 00 00 36       	xor    $0x36000000,%eax
  30e5dd:	00 00                	add    %al,(%eax)
  30e5df:	00 37                	add    %dh,(%edi)
  30e5e1:	00 00                	add    %al,(%eax)
  30e5e3:	00 38                	add    %bh,(%eax)
  30e5e5:	00 00                	add    %al,(%eax)
  30e5e7:	00 39                	add    %bh,(%ecx)
  30e5e9:	00 00                	add    %al,(%eax)
  30e5eb:	00 30                	add    %dh,(%eax)
  30e5ed:	00 00                	add    %al,(%eax)
  30e5ef:	00 2d 00 00 00 3d    	add    %ch,0x3d000000
  30e5f5:	00 00                	add    %al,(%eax)
  30e5f7:	00 08                	add    %cl,(%eax)
  30e5f9:	00 00                	add    %al,(%eax)
  30e5fb:	00 09                	add    %cl,(%ecx)
  30e5fd:	00 00                	add    %al,(%eax)
  30e5ff:	00 71 00             	add    %dh,0x0(%ecx)
  30e602:	00 00                	add    %al,(%eax)
  30e604:	77 00                	ja     30e606 <keymap+0x46>
  30e606:	00 00                	add    %al,(%eax)
  30e608:	65 00 00             	add    %al,%gs:(%eax)
  30e60b:	00 72 00             	add    %dh,0x0(%edx)
  30e60e:	00 00                	add    %al,(%eax)
  30e610:	74 00                	je     30e612 <keymap+0x52>
  30e612:	00 00                	add    %al,(%eax)
  30e614:	79 00                	jns    30e616 <keymap+0x56>
  30e616:	00 00                	add    %al,(%eax)
  30e618:	75 00                	jne    30e61a <keymap+0x5a>
  30e61a:	00 00                	add    %al,(%eax)
  30e61c:	69 00 00 00 6f 00    	imul   $0x6f0000,(%eax),%eax
  30e622:	00 00                	add    %al,(%eax)
  30e624:	70 00                	jo     30e626 <keymap+0x66>
  30e626:	00 00                	add    %al,(%eax)
  30e628:	5b                   	pop    %ebx
  30e629:	00 00                	add    %al,(%eax)
  30e62b:	00 5d 00             	add    %bl,0x0(%ebp)
  30e62e:	00 00                	add    %al,(%eax)
  30e630:	0a 00                	or     (%eax),%al
  30e632:	00 00                	add    %al,(%eax)
  30e634:	00 01                	add    %al,(%ecx)
  30e636:	00 00                	add    %al,(%eax)
  30e638:	61                   	popa   
  30e639:	00 00                	add    %al,(%eax)
  30e63b:	00 73 00             	add    %dh,0x0(%ebx)
  30e63e:	00 00                	add    %al,(%eax)
  30e640:	64 00 00             	add    %al,%fs:(%eax)
  30e643:	00 66 00             	add    %ah,0x0(%esi)
  30e646:	00 00                	add    %al,(%eax)
  30e648:	67 00 00             	add    %al,(%bx,%si)
  30e64b:	00 68 00             	add    %ch,0x0(%eax)
  30e64e:	00 00                	add    %al,(%eax)
  30e650:	6a 00                	push   $0x0
  30e652:	00 00                	add    %al,(%eax)
  30e654:	6b 00 00             	imul   $0x0,(%eax),%eax
  30e657:	00 6c 00 00          	add    %ch,0x0(%eax,%eax,1)
  30e65b:	00 3b                	add    %bh,(%ebx)
  30e65d:	00 00                	add    %al,(%eax)
  30e65f:	00 27                	add    %ah,(%edi)
  30e661:	00 00                	add    %al,(%eax)
  30e663:	00 60 00             	add    %ah,0x0(%eax)
  30e666:	00 00                	add    %al,(%eax)
  30e668:	01 01                	add    %eax,(%ecx)
  30e66a:	00 00                	add    %al,(%eax)
  30e66c:	5c                   	pop    %esp
  30e66d:	00 00                	add    %al,(%eax)
  30e66f:	00 7a 00             	add    %bh,0x0(%edx)
  30e672:	00 00                	add    %al,(%eax)
  30e674:	78 00                	js     30e676 <keymap+0xb6>
  30e676:	00 00                	add    %al,(%eax)
  30e678:	63 00                	arpl   %ax,(%eax)
  30e67a:	00 00                	add    %al,(%eax)
  30e67c:	76 00                	jbe    30e67e <keymap+0xbe>
  30e67e:	00 00                	add    %al,(%eax)
  30e680:	62 00                	bound  %eax,(%eax)
  30e682:	00 00                	add    %al,(%eax)
  30e684:	6e                   	outsb  %ds:(%esi),(%dx)
  30e685:	00 00                	add    %al,(%eax)
  30e687:	00 6d 00             	add    %ch,0x0(%ebp)
  30e68a:	00 00                	add    %al,(%eax)
  30e68c:	2c 00                	sub    $0x0,%al
  30e68e:	00 00                	add    %al,(%eax)
  30e690:	2e 00 00             	add    %al,%cs:(%eax)
  30e693:	00 2f                	add    %ch,(%edi)
  30e695:	00 00                	add    %al,(%eax)
  30e697:	00 02                	add    %al,(%edx)
  30e699:	01 00                	add    %eax,(%eax)
  30e69b:	00 03                	add    %al,(%ebx)
  30e69d:	01 00                	add    %eax,(%eax)
  30e69f:	00 04 01             	add    %al,(%ecx,%eax,1)
  30e6a2:	00 00                	add    %al,(%eax)
  30e6a4:	20 00                	and    %al,(%eax)
  30e6a6:	00 00                	add    %al,(%eax)
  30e6a8:	05 01 00 00 06       	add    $0x6000001,%eax
  30e6ad:	01 00                	add    %eax,(%eax)
  30e6af:	00 07                	add    %al,(%edi)
  30e6b1:	01 00                	add    %eax,(%eax)
  30e6b3:	00 08                	add    %cl,(%eax)
  30e6b5:	01 00                	add    %eax,(%eax)
  30e6b7:	00 09                	add    %cl,(%ecx)
  30e6b9:	01 00                	add    %eax,(%eax)
  30e6bb:	00 0a                	add    %cl,(%edx)
  30e6bd:	01 00                	add    %eax,(%eax)
  30e6bf:	00 0b                	add    %cl,(%ebx)
  30e6c1:	01 00                	add    %eax,(%eax)
  30e6c3:	00 0c 01             	add    %cl,(%ecx,%eax,1)
  30e6c6:	00 00                	add    %al,(%eax)
  30e6c8:	0d 01 00 00 0f       	or     $0xf000001,%eax
  30e6cd:	01 00                	add    %eax,(%eax)
  30e6cf:	00 10                	add    %dl,(%eax)
  30e6d1:	01 00                	add    %eax,(%eax)
  30e6d3:	00 45 01             	add    %al,0x1(%ebp)
  30e6d6:	00 00                	add    %al,(%eax)
  30e6d8:	46                   	inc    %esi
  30e6d9:	01 00                	add    %eax,(%eax)
  30e6db:	00 37                	add    %dh,(%edi)
  30e6dd:	00 00                	add    %al,(%eax)
  30e6df:	00 38                	add    %bh,(%eax)
  30e6e1:	00 00                	add    %al,(%eax)
  30e6e3:	00 39                	add    %bh,(%ecx)
  30e6e5:	00 00                	add    %al,(%eax)
  30e6e7:	00 2d 00 00 00 34    	add    %ch,0x34000000
  30e6ed:	00 00                	add    %al,(%eax)
  30e6ef:	00 35 00 00 00 36    	add    %dh,0x36000000
  30e6f5:	00 00                	add    %al,(%eax)
  30e6f7:	00 2b                	add    %ch,(%ebx)
  30e6f9:	00 00                	add    %al,(%eax)
  30e6fb:	00 31                	add    %dh,(%ecx)
  30e6fd:	00 00                	add    %al,(%eax)
  30e6ff:	00 32                	add    %dh,(%edx)
  30e701:	00 00                	add    %al,(%eax)
  30e703:	00 33                	add    %dh,(%ebx)
  30e705:	00 00                	add    %al,(%eax)
  30e707:	00 30                	add    %dh,(%eax)
  30e709:	00 00                	add    %al,(%eax)
  30e70b:	00 2e                	add    %ch,(%esi)
	...
  30e9c1:	00 00                	add    %al,(%eax)
  30e9c3:	00 1b                	add    %bl,(%ebx)
  30e9c5:	00 00                	add    %al,(%eax)
  30e9c7:	00 21                	add    %ah,(%ecx)
  30e9c9:	00 00                	add    %al,(%eax)
  30e9cb:	00 40 00             	add    %al,0x0(%eax)
  30e9ce:	00 00                	add    %al,(%eax)
  30e9d0:	23 00                	and    (%eax),%eax
  30e9d2:	00 00                	add    %al,(%eax)
  30e9d4:	24 00                	and    $0x0,%al
  30e9d6:	00 00                	add    %al,(%eax)
  30e9d8:	25 00 00 00 5e       	and    $0x5e000000,%eax
  30e9dd:	00 00                	add    %al,(%eax)
  30e9df:	00 26                	add    %ah,(%esi)
  30e9e1:	00 00                	add    %al,(%eax)
  30e9e3:	00 2a                	add    %ch,(%edx)
  30e9e5:	00 00                	add    %al,(%eax)
  30e9e7:	00 28                	add    %ch,(%eax)
  30e9e9:	00 00                	add    %al,(%eax)
  30e9eb:	00 29                	add    %ch,(%ecx)
  30e9ed:	00 00                	add    %al,(%eax)
  30e9ef:	00 5f 00             	add    %bl,0x0(%edi)
  30e9f2:	00 00                	add    %al,(%eax)
  30e9f4:	2b 00                	sub    (%eax),%eax
  30e9f6:	00 00                	add    %al,(%eax)
  30e9f8:	08 00                	or     %al,(%eax)
  30e9fa:	00 00                	add    %al,(%eax)
  30e9fc:	09 00                	or     %eax,(%eax)
  30e9fe:	00 00                	add    %al,(%eax)
  30ea00:	51                   	push   %ecx
  30ea01:	00 00                	add    %al,(%eax)
  30ea03:	00 57 00             	add    %dl,0x0(%edi)
  30ea06:	00 00                	add    %al,(%eax)
  30ea08:	45                   	inc    %ebp
  30ea09:	00 00                	add    %al,(%eax)
  30ea0b:	00 52 00             	add    %dl,0x0(%edx)
  30ea0e:	00 00                	add    %al,(%eax)
  30ea10:	54                   	push   %esp
  30ea11:	00 00                	add    %al,(%eax)
  30ea13:	00 59 00             	add    %bl,0x0(%ecx)
  30ea16:	00 00                	add    %al,(%eax)
  30ea18:	55                   	push   %ebp
  30ea19:	00 00                	add    %al,(%eax)
  30ea1b:	00 49 00             	add    %cl,0x0(%ecx)
  30ea1e:	00 00                	add    %al,(%eax)
  30ea20:	4f                   	dec    %edi
  30ea21:	00 00                	add    %al,(%eax)
  30ea23:	00 50 00             	add    %dl,0x0(%eax)
  30ea26:	00 00                	add    %al,(%eax)
  30ea28:	7b 00                	jnp    30ea2a <keymap+0x46a>
  30ea2a:	00 00                	add    %al,(%eax)
  30ea2c:	7d 00                	jge    30ea2e <keymap+0x46e>
  30ea2e:	00 00                	add    %al,(%eax)
  30ea30:	0a 00                	or     (%eax),%al
  30ea32:	00 00                	add    %al,(%eax)
  30ea34:	00 01                	add    %al,(%ecx)
  30ea36:	00 00                	add    %al,(%eax)
  30ea38:	41                   	inc    %ecx
  30ea39:	00 00                	add    %al,(%eax)
  30ea3b:	00 53 00             	add    %dl,0x0(%ebx)
  30ea3e:	00 00                	add    %al,(%eax)
  30ea40:	44                   	inc    %esp
  30ea41:	00 00                	add    %al,(%eax)
  30ea43:	00 46 00             	add    %al,0x0(%esi)
  30ea46:	00 00                	add    %al,(%eax)
  30ea48:	47                   	inc    %edi
  30ea49:	00 00                	add    %al,(%eax)
  30ea4b:	00 48 00             	add    %cl,0x0(%eax)
  30ea4e:	00 00                	add    %al,(%eax)
  30ea50:	4a                   	dec    %edx
  30ea51:	00 00                	add    %al,(%eax)
  30ea53:	00 4b 00             	add    %cl,0x0(%ebx)
  30ea56:	00 00                	add    %al,(%eax)
  30ea58:	4c                   	dec    %esp
  30ea59:	00 00                	add    %al,(%eax)
  30ea5b:	00 3a                	add    %bh,(%edx)
  30ea5d:	00 00                	add    %al,(%eax)
  30ea5f:	00 22                	add    %ah,(%edx)
  30ea61:	00 00                	add    %al,(%eax)
  30ea63:	00 7e 00             	add    %bh,0x0(%esi)
  30ea66:	00 00                	add    %al,(%eax)
  30ea68:	01 01                	add    %eax,(%ecx)
  30ea6a:	00 00                	add    %al,(%eax)
  30ea6c:	7c 00                	jl     30ea6e <keymap+0x4ae>
  30ea6e:	00 00                	add    %al,(%eax)
  30ea70:	5a                   	pop    %edx
  30ea71:	00 00                	add    %al,(%eax)
  30ea73:	00 58 00             	add    %bl,0x0(%eax)
  30ea76:	00 00                	add    %al,(%eax)
  30ea78:	43                   	inc    %ebx
  30ea79:	00 00                	add    %al,(%eax)
  30ea7b:	00 56 00             	add    %dl,0x0(%esi)
  30ea7e:	00 00                	add    %al,(%eax)
  30ea80:	42                   	inc    %edx
  30ea81:	00 00                	add    %al,(%eax)
  30ea83:	00 4e 00             	add    %cl,0x0(%esi)
  30ea86:	00 00                	add    %al,(%eax)
  30ea88:	4d                   	dec    %ebp
  30ea89:	00 00                	add    %al,(%eax)
  30ea8b:	00 3c 00             	add    %bh,(%eax,%eax,1)
  30ea8e:	00 00                	add    %al,(%eax)
  30ea90:	3e 00 00             	add    %al,%ds:(%eax)
  30ea93:	00 3f                	add    %bh,(%edi)
  30ea95:	00 00                	add    %al,(%eax)
  30ea97:	00 02                	add    %al,(%edx)
  30ea99:	01 00                	add    %eax,(%eax)
  30ea9b:	00 03                	add    %al,(%ebx)
  30ea9d:	01 00                	add    %eax,(%eax)
  30ea9f:	00 04 01             	add    %al,(%ecx,%eax,1)
  30eaa2:	00 00                	add    %al,(%eax)
  30eaa4:	20 00                	and    %al,(%eax)
  30eaa6:	00 00                	add    %al,(%eax)
  30eaa8:	05 01 00 00 06       	add    $0x6000001,%eax
  30eaad:	01 00                	add    %eax,(%eax)
  30eaaf:	00 07                	add    %al,(%edi)
  30eab1:	01 00                	add    %eax,(%eax)
  30eab3:	00 08                	add    %cl,(%eax)
  30eab5:	01 00                	add    %eax,(%eax)
  30eab7:	00 09                	add    %cl,(%ecx)
  30eab9:	01 00                	add    %eax,(%eax)
  30eabb:	00 0a                	add    %cl,(%edx)
  30eabd:	01 00                	add    %eax,(%eax)
  30eabf:	00 0b                	add    %cl,(%ebx)
  30eac1:	01 00                	add    %eax,(%eax)
  30eac3:	00 0c 01             	add    %cl,(%ecx,%eax,1)
  30eac6:	00 00                	add    %al,(%eax)
  30eac8:	0d 01 00 00 0f       	or     $0xf000001,%eax
  30eacd:	01 00                	add    %eax,(%eax)
  30eacf:	00 10                	add    %dl,(%eax)
  30ead1:	01 00                	add    %eax,(%eax)
  30ead3:	00 45 01             	add    %al,0x1(%ebp)
  30ead6:	00 00                	add    %al,(%eax)
  30ead8:	46                   	inc    %esi
  30ead9:	01 00                	add    %eax,(%eax)
  30eadb:	00 37                	add    %dh,(%edi)
  30eadd:	00 00                	add    %al,(%eax)
  30eadf:	00 38                	add    %bh,(%eax)
  30eae1:	00 00                	add    %al,(%eax)
  30eae3:	00 39                	add    %bh,(%ecx)
  30eae5:	00 00                	add    %al,(%eax)
  30eae7:	00 2d 00 00 00 34    	add    %ch,0x34000000
  30eaed:	00 00                	add    %al,(%eax)
  30eaef:	00 35 00 00 00 36    	add    %dh,0x36000000
  30eaf5:	00 00                	add    %al,(%eax)
  30eaf7:	00 2b                	add    %ch,(%ebx)
  30eaf9:	00 00                	add    %al,(%eax)
  30eafb:	00 31                	add    %dh,(%ecx)
  30eafd:	00 00                	add    %al,(%eax)
  30eaff:	00 32                	add    %dh,(%edx)
  30eb01:	00 00                	add    %al,(%eax)
  30eb03:	00 33                	add    %dh,(%ebx)
  30eb05:	00 00                	add    %al,(%eax)
  30eb07:	00 30                	add    %dh,(%eax)
  30eb09:	00 00                	add    %al,(%eax)
  30eb0b:	00 2e                	add    %ch,(%esi)
	...
  30edbd:	00 00                	add    %al,(%eax)
  30edbf:	00 25 63 00 00 30    	add    %ah,0x30000063
  30edc5:	31 32                	xor    %esi,(%edx)
  30edc7:	33 34 35 36 37 38 39 	xor    0x39383736(,%esi,1),%esi
  30edce:	61                   	popa   
  30edcf:	62 63 64             	bound  %esp,0x64(%ebx)
  30edd2:	65                   	gs
  30edd3:	66                   	data16
  30edd4:	78 00                	js     30edd6 <keymap+0x816>
	...

0030edd8 <_lowerDigits>:
  30edd8:	c4                   	(bad)  
  30edd9:	ed                   	in     (%dx),%eax
  30edda:	30 00                	xor    %al,(%eax)
  30eddc:	30 31                	xor    %dh,(%ecx)
  30edde:	32 33                	xor    (%ebx),%dh
  30ede0:	34 35                	xor    $0x35,%al
  30ede2:	36                   	ss
  30ede3:	37                   	aaa    
  30ede4:	38 39                	cmp    %bh,(%ecx)
  30ede6:	41                   	inc    %ecx
  30ede7:	42                   	inc    %edx
  30ede8:	43                   	inc    %ebx
  30ede9:	44                   	inc    %esp
  30edea:	45                   	inc    %ebp
  30edeb:	46                   	inc    %esi
  30edec:	58                   	pop    %eax
  30eded:	00 00                	add    %al,(%eax)
	...

0030edf0 <_upperDigits>:
  30edf0:	dc ed                	fsubr  %st,%st(5)
  30edf2:	30 00                	xor    %al,(%eax)
  30edf4:	3c 4e                	cmp    $0x4e,%al
  30edf6:	55                   	push   %ebp
  30edf7:	4c                   	dec    %esp
  30edf8:	4c                   	dec    %esp
  30edf9:	3e 00 00             	add    %al,%ds:(%eax)
  30edfc:	1f                   	pop    %ds
  30edfd:	d6                   	(bad)  
  30edfe:	30 00                	xor    %al,(%eax)
  30ee00:	31 d6                	xor    %edx,%esi
  30ee02:	30 00                	xor    %al,(%eax)
  30ee04:	31 d6                	xor    %edx,%esi
  30ee06:	30 00                	xor    %al,(%eax)
  30ee08:	2b d6                	sub    %esi,%edx
  30ee0a:	30 00                	xor    %al,(%eax)
  30ee0c:	31 d6                	xor    %edx,%esi
  30ee0e:	30 00                	xor    %al,(%eax)
  30ee10:	31 d6                	xor    %edx,%esi
  30ee12:	30 00                	xor    %al,(%eax)
  30ee14:	31 d6                	xor    %edx,%esi
  30ee16:	30 00                	xor    %al,(%eax)
  30ee18:	31 d6                	xor    %edx,%esi
  30ee1a:	30 00                	xor    %al,(%eax)
  30ee1c:	31 d6                	xor    %edx,%esi
  30ee1e:	30 00                	xor    %al,(%eax)
  30ee20:	31 d6                	xor    %edx,%esi
  30ee22:	30 00                	xor    %al,(%eax)
  30ee24:	31 d6                	xor    %edx,%esi
  30ee26:	30 00                	xor    %al,(%eax)
  30ee28:	19 d6                	sbb    %edx,%esi
  30ee2a:	30 00                	xor    %al,(%eax)
  30ee2c:	31 d6                	xor    %edx,%esi
  30ee2e:	30 00                	xor    %al,(%eax)
  30ee30:	13 d6                	adc    %esi,%edx
  30ee32:	30 00                	xor    %al,(%eax)
  30ee34:	31 d6                	xor    %edx,%esi
  30ee36:	30 00                	xor    %al,(%eax)
  30ee38:	31 d6                	xor    %edx,%esi
  30ee3a:	30 00                	xor    %al,(%eax)
  30ee3c:	25 d6 30 00 f6       	and    $0xf60030d6,%eax
  30ee41:	d6                   	(bad)  
  30ee42:	30 00                	xor    %al,(%eax)
  30ee44:	1c d7                	sbb    $0xd7,%al
  30ee46:	30 00                	xor    %al,(%eax)
  30ee48:	1c d7                	sbb    $0xd7,%al
  30ee4a:	30 00                	xor    %al,(%eax)
  30ee4c:	1c d7                	sbb    $0xd7,%al
  30ee4e:	30 00                	xor    %al,(%eax)
  30ee50:	1c d7                	sbb    $0xd7,%al
  30ee52:	30 00                	xor    %al,(%eax)
  30ee54:	1c d7                	sbb    $0xd7,%al
  30ee56:	30 00                	xor    %al,(%eax)
  30ee58:	1c d7                	sbb    $0xd7,%al
  30ee5a:	30 00                	xor    %al,(%eax)
  30ee5c:	1c d7                	sbb    $0xd7,%al
  30ee5e:	30 00                	xor    %al,(%eax)
  30ee60:	1c d7                	sbb    $0xd7,%al
  30ee62:	30 00                	xor    %al,(%eax)
  30ee64:	1c d7                	sbb    $0xd7,%al
  30ee66:	30 00                	xor    %al,(%eax)
  30ee68:	1c d7                	sbb    $0xd7,%al
  30ee6a:	30 00                	xor    %al,(%eax)
  30ee6c:	ce                   	into   
  30ee6d:	d6                   	(bad)  
  30ee6e:	30 00                	xor    %al,(%eax)
  30ee70:	03 d7                	add    %edi,%edx
  30ee72:	30 00                	xor    %al,(%eax)
  30ee74:	1c d7                	sbb    $0xd7,%al
  30ee76:	30 00                	xor    %al,(%eax)
  30ee78:	1c d7                	sbb    $0xd7,%al
  30ee7a:	30 00                	xor    %al,(%eax)
  30ee7c:	1c d7                	sbb    $0xd7,%al
  30ee7e:	30 00                	xor    %al,(%eax)
  30ee80:	1c d7                	sbb    $0xd7,%al
  30ee82:	30 00                	xor    %al,(%eax)
  30ee84:	0a d7                	or     %bh,%dl
  30ee86:	30 00                	xor    %al,(%eax)
  30ee88:	1c d7                	sbb    $0xd7,%al
  30ee8a:	30 00                	xor    %al,(%eax)
  30ee8c:	1c d7                	sbb    $0xd7,%al
  30ee8e:	30 00                	xor    %al,(%eax)
  30ee90:	1c d7                	sbb    $0xd7,%al
  30ee92:	30 00                	xor    %al,(%eax)
  30ee94:	1c d7                	sbb    $0xd7,%al
  30ee96:	30 00                	xor    %al,(%eax)
  30ee98:	1c d7                	sbb    $0xd7,%al
  30ee9a:	30 00                	xor    %al,(%eax)
  30ee9c:	13 d7                	adc    %edi,%edx
  30ee9e:	30 00                	xor    %al,(%eax)
  30eea0:	f2 d6                	repnz (bad) 
  30eea2:	30 00                	xor    %al,(%eax)
  30eea4:	1c d7                	sbb    $0xd7,%al
  30eea6:	30 00                	xor    %al,(%eax)
  30eea8:	1c d7                	sbb    $0xd7,%al
  30eeaa:	30 00                	xor    %al,(%eax)
  30eeac:	e9 d6 30 00 1c       	jmp    1c311f87 <_end+0x1bffc007>
  30eeb1:	d7                   	xlat   %ds:(%ebx)
  30eeb2:	30 00                	xor    %al,(%eax)
  30eeb4:	41                   	inc    %ecx
  30eeb5:	d7                   	xlat   %ds:(%ebx)
  30eeb6:	30 00                	xor    %al,(%eax)
  30eeb8:	1c d7                	sbb    $0xd7,%al
  30eeba:	30 00                	xor    %al,(%eax)
  30eebc:	1c d7                	sbb    $0xd7,%al
  30eebe:	30 00                	xor    %al,(%eax)
  30eec0:	fa                   	cli    
  30eec1:	d6                   	(bad)  
  30eec2:	30 00                	xor    %al,(%eax)
  30eec4:	61                   	popa   
  30eec5:	d7                   	xlat   %ds:(%ebx)
  30eec6:	30 00                	xor    %al,(%eax)
  30eec8:	26 d8 30             	fdivs  %es:(%eax)
  30eecb:	00 26                	add    %ah,(%esi)
  30eecd:	d8 30                	fdivs  (%eax)
  30eecf:	00 26                	add    %ah,(%esi)
  30eed1:	d8 30                	fdivs  (%eax)
  30eed3:	00 a6 d7 30 00 26    	add    %ah,0x260030d7(%esi)
  30eed9:	d8 30                	fdivs  (%eax)
  30eedb:	00 26                	add    %ah,(%esi)
  30eedd:	d8 30                	fdivs  (%eax)
  30eedf:	00 26                	add    %ah,(%esi)
  30eee1:	d8 30                	fdivs  (%eax)
  30eee3:	00 26                	add    %ah,(%esi)
  30eee5:	d8 30                	fdivs  (%eax)
  30eee7:	00 26                	add    %ah,(%esi)
  30eee9:	d8 30                	fdivs  (%eax)
  30eeeb:	00 26                	add    %ah,(%esi)
  30eeed:	d8 30                	fdivs  (%eax)
  30eeef:	00 26                	add    %ah,(%esi)
  30eef1:	d8 30                	fdivs  (%eax)
  30eef3:	00 26                	add    %ah,(%esi)
  30eef5:	d8 30                	fdivs  (%eax)
  30eef7:	00 26                	add    %ah,(%esi)
  30eef9:	d8 30                	fdivs  (%eax)
  30eefb:	00 26                	add    %ah,(%esi)
  30eefd:	d8 30                	fdivs  (%eax)
  30eeff:	00 26                	add    %ah,(%esi)
  30ef01:	d8 30                	fdivs  (%eax)
  30ef03:	00 26                	add    %ah,(%esi)
  30ef05:	d8 30                	fdivs  (%eax)
  30ef07:	00 26                	add    %ah,(%esi)
  30ef09:	d8 30                	fdivs  (%eax)
  30ef0b:	00 26                	add    %ah,(%esi)
  30ef0d:	d8 30                	fdivs  (%eax)
  30ef0f:	00 26                	add    %ah,(%esi)
  30ef11:	d8 30                	fdivs  (%eax)
  30ef13:	00 26                	add    %ah,(%esi)
  30ef15:	d8 30                	fdivs  (%eax)
  30ef17:	00 26                	add    %ah,(%esi)
  30ef19:	d8 30                	fdivs  (%eax)
  30ef1b:	00 26                	add    %ah,(%esi)
  30ef1d:	d8 30                	fdivs  (%eax)
  30ef1f:	00 26                	add    %ah,(%esi)
  30ef21:	d8 30                	fdivs  (%eax)
  30ef23:	00 26                	add    %ah,(%esi)
  30ef25:	d8 30                	fdivs  (%eax)
  30ef27:	00 26                	add    %ah,(%esi)
  30ef29:	d8 30                	fdivs  (%eax)
  30ef2b:	00 26                	add    %ah,(%esi)
  30ef2d:	d8 30                	fdivs  (%eax)
  30ef2f:	00 26                	add    %ah,(%esi)
  30ef31:	d8 30                	fdivs  (%eax)
  30ef33:	00 26                	add    %ah,(%esi)
  30ef35:	d8 30                	fdivs  (%eax)
  30ef37:	00 26                	add    %ah,(%esi)
  30ef39:	d8 30                	fdivs  (%eax)
  30ef3b:	00 26                	add    %ah,(%esi)
  30ef3d:	d8 30                	fdivs  (%eax)
  30ef3f:	00 26                	add    %ah,(%esi)
  30ef41:	d8 30                	fdivs  (%eax)
  30ef43:	00 68 d7             	add    %ch,-0x29(%eax)
  30ef46:	30 00                	xor    %al,(%eax)
  30ef48:	26 d8 30             	fdivs  %es:(%eax)
  30ef4b:	00 26                	add    %ah,(%esi)
  30ef4d:	d8 30                	fdivs  (%eax)
  30ef4f:	00 26                	add    %ah,(%esi)
  30ef51:	d8 30                	fdivs  (%eax)
  30ef53:	00 6f d7             	add    %ch,-0x29(%edi)
  30ef56:	30 00                	xor    %al,(%eax)
  30ef58:	26 d8 30             	fdivs  %es:(%eax)
  30ef5b:	00 26                	add    %ah,(%esi)
  30ef5d:	d8 30                	fdivs  (%eax)
  30ef5f:	00 26                	add    %ah,(%esi)
  30ef61:	d8 30                	fdivs  (%eax)
  30ef63:	00 26                	add    %ah,(%esi)
  30ef65:	d8 30                	fdivs  (%eax)
  30ef67:	00 26                	add    %ah,(%esi)
  30ef69:	d8 30                	fdivs  (%eax)
  30ef6b:	00 26                	add    %ah,(%esi)
  30ef6d:	d8 30                	fdivs  (%eax)
  30ef6f:	00 e0                	add    %ah,%al
  30ef71:	d7                   	xlat   %ds:(%ebx)
  30ef72:	30 00                	xor    %al,(%eax)

Disassembly of section .eh_frame:

0030ef74 <.eh_frame>:
  30ef74:	14 00                	adc    $0x0,%al
  30ef76:	00 00                	add    %al,(%eax)
  30ef78:	00 00                	add    %al,(%eax)
  30ef7a:	00 00                	add    %al,(%eax)
  30ef7c:	01 7a 52             	add    %edi,0x52(%edx)
  30ef7f:	00 01                	add    %al,(%ecx)
  30ef81:	7c 08                	jl     30ef8b <_upperDigits+0x19b>
  30ef83:	01 1b                	add    %ebx,(%ebx)
  30ef85:	0c 04                	or     $0x4,%al
  30ef87:	04 88                	add    $0x88,%al
  30ef89:	01 00                	add    %eax,(%eax)
  30ef8b:	00 18                	add    %bl,(%eax)
  30ef8d:	00 00                	add    %al,(%eax)
  30ef8f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30ef92:	00 00                	add    %al,(%eax)
  30ef94:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  30ef95:	66                   	data16
  30ef96:	ff                   	(bad)  
  30ef97:	ff 1c 00             	lcall  *(%eax,%eax,1)
  30ef9a:	00 00                	add    %al,(%eax)
  30ef9c:	00 41 0e             	add    %al,0xe(%ecx)
  30ef9f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30efa5:	00 00                	add    %al,(%eax)
  30efa7:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30efaa:	00 00                	add    %al,(%eax)
  30efac:	38 00                	cmp    %al,(%eax)
  30efae:	00 00                	add    %al,(%eax)
  30efb0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  30efb1:	66                   	data16
  30efb2:	ff                   	(bad)  
  30efb3:	ff 41 00             	incl   0x0(%ecx)
  30efb6:	00 00                	add    %al,(%eax)
  30efb8:	00 41 0e             	add    %al,0xe(%ecx)
  30efbb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30efc1:	7d c5                	jge    30ef88 <_upperDigits+0x198>
  30efc3:	0c 04                	or     $0x4,%al
  30efc5:	04 00                	add    $0x0,%al
  30efc7:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30efca:	00 00                	add    %al,(%eax)
  30efcc:	58                   	pop    %eax
  30efcd:	00 00                	add    %al,(%eax)
  30efcf:	00 c5                	add    %al,%ch
  30efd1:	66                   	data16
  30efd2:	ff                   	(bad)  
  30efd3:	ff 09                	decl   (%ecx)
  30efd5:	01 00                	add    %eax,(%eax)
  30efd7:	00 00                	add    %al,(%eax)
  30efd9:	41                   	inc    %ecx
  30efda:	0e                   	push   %cs
  30efdb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30efe1:	03 05 01 c5 0c 04    	add    0x40cc501,%eax
  30efe7:	04 28                	add    $0x28,%al
  30efe9:	00 00                	add    %al,(%eax)
  30efeb:	00 78 00             	add    %bh,0x0(%eax)
  30efee:	00 00                	add    %al,(%eax)
  30eff0:	b0 67                	mov    $0x67,%al
  30eff2:	ff                   	(bad)  
  30eff3:	ff 2d 00 00 00 00    	ljmp   *0x0
  30eff9:	41                   	inc    %ecx
  30effa:	0e                   	push   %cs
  30effb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f001:	46                   	inc    %esi
  30f002:	87 03                	xchg   %eax,(%ebx)
  30f004:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f007:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  30f00c:	41                   	inc    %ecx
  30f00d:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30f014:	1c 00                	sbb    $0x0,%al
  30f016:	00 00                	add    %al,(%eax)
  30f018:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  30f019:	00 00                	add    %al,(%eax)
  30f01b:	00 b1 67 ff ff bc    	add    %dh,-0x43000099(%ecx)
  30f021:	00 00                	add    %al,(%eax)
  30f023:	00 00                	add    %al,(%eax)
  30f025:	41                   	inc    %ecx
  30f026:	0e                   	push   %cs
  30f027:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f02d:	02 b8 c5 0c 04 04    	add    0x4040cc5(%eax),%bh
  30f033:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f036:	00 00                	add    %al,(%eax)
  30f038:	c4 00                	les    (%eax),%eax
  30f03a:	00 00                	add    %al,(%eax)
  30f03c:	4d                   	dec    %ebp
  30f03d:	68 ff ff 35 00       	push   $0x35ffff
  30f042:	00 00                	add    %al,(%eax)
  30f044:	00 41 0e             	add    %al,0xe(%ecx)
  30f047:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f04d:	71 c5                	jno    30f014 <_upperDigits+0x224>
  30f04f:	0c 04                	or     $0x4,%al
  30f051:	04 00                	add    $0x0,%al
  30f053:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f056:	00 00                	add    %al,(%eax)
  30f058:	e4 00                	in     $0x0,%al
  30f05a:	00 00                	add    %al,(%eax)
  30f05c:	62 68 ff             	bound  %ebp,-0x1(%eax)
  30f05f:	ff 58 00             	lcall  *0x0(%eax)
  30f062:	00 00                	add    %al,(%eax)
  30f064:	00 41 0e             	add    %al,0xe(%ecx)
  30f067:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f06d:	02 54 c5 0c          	add    0xc(%ebp,%eax,8),%dl
  30f071:	04 04                	add    $0x4,%al
  30f073:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f076:	00 00                	add    %al,(%eax)
  30f078:	04 01                	add    $0x1,%al
  30f07a:	00 00                	add    %al,(%eax)
  30f07c:	9a 68 ff ff 1e 00 00 	lcall  $0x0,$0x1effff68
  30f083:	00 00                	add    %al,(%eax)
  30f085:	41                   	inc    %ecx
  30f086:	0e                   	push   %cs
  30f087:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f08d:	5a                   	pop    %edx
  30f08e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f091:	04 00                	add    $0x0,%al
  30f093:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f096:	00 00                	add    %al,(%eax)
  30f098:	24 01                	and    $0x1,%al
  30f09a:	00 00                	add    %al,(%eax)
  30f09c:	98                   	cwtl   
  30f09d:	68 ff ff 2e 00       	push   $0x2effff
  30f0a2:	00 00                	add    %al,(%eax)
  30f0a4:	00 41 0e             	add    %al,0xe(%ecx)
  30f0a7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f0ad:	6a c5                	push   $0xffffffc5
  30f0af:	0c 04                	or     $0x4,%al
  30f0b1:	04 00                	add    $0x0,%al
  30f0b3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f0b6:	00 00                	add    %al,(%eax)
  30f0b8:	44                   	inc    %esp
  30f0b9:	01 00                	add    %eax,(%eax)
  30f0bb:	00 a6 68 ff ff 1e    	add    %ah,0x1effff68(%esi)
  30f0c1:	00 00                	add    %al,(%eax)
  30f0c3:	00 00                	add    %al,(%eax)
  30f0c5:	41                   	inc    %ecx
  30f0c6:	0e                   	push   %cs
  30f0c7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f0cd:	5a                   	pop    %edx
  30f0ce:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f0d1:	04 00                	add    $0x0,%al
  30f0d3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f0d6:	00 00                	add    %al,(%eax)
  30f0d8:	64 01 00             	add    %eax,%fs:(%eax)
  30f0db:	00 a4 68 ff ff 2e 00 	add    %ah,0x2effff(%eax,%ebp,2)
  30f0e2:	00 00                	add    %al,(%eax)
  30f0e4:	00 41 0e             	add    %al,0xe(%ecx)
  30f0e7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f0ed:	6a c5                	push   $0xffffffc5
  30f0ef:	0c 04                	or     $0x4,%al
  30f0f1:	04 00                	add    $0x0,%al
  30f0f3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f0f6:	00 00                	add    %al,(%eax)
  30f0f8:	84 01                	test   %al,(%ecx)
  30f0fa:	00 00                	add    %al,(%eax)
  30f0fc:	b2 68                	mov    $0x68,%dl
  30f0fe:	ff                   	(bad)  
  30f0ff:	ff 1e                	lcall  *(%esi)
  30f101:	00 00                	add    %al,(%eax)
  30f103:	00 00                	add    %al,(%eax)
  30f105:	41                   	inc    %ecx
  30f106:	0e                   	push   %cs
  30f107:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f10d:	5a                   	pop    %edx
  30f10e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f111:	04 00                	add    $0x0,%al
  30f113:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f116:	00 00                	add    %al,(%eax)
  30f118:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  30f119:	01 00                	add    %eax,(%eax)
  30f11b:	00 b0 68 ff ff 1e    	add    %dh,0x1effff68(%eax)
  30f121:	00 00                	add    %al,(%eax)
  30f123:	00 00                	add    %al,(%eax)
  30f125:	41                   	inc    %ecx
  30f126:	0e                   	push   %cs
  30f127:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f12d:	5a                   	pop    %edx
  30f12e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f131:	04 00                	add    $0x0,%al
  30f133:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f136:	00 00                	add    %al,(%eax)
  30f138:	c4 01                	les    (%ecx),%eax
  30f13a:	00 00                	add    %al,(%eax)
  30f13c:	ae                   	scas   %es:(%edi),%al
  30f13d:	68 ff ff 1e 00       	push   $0x1effff
  30f142:	00 00                	add    %al,(%eax)
  30f144:	00 41 0e             	add    %al,0xe(%ecx)
  30f147:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f14d:	5a                   	pop    %edx
  30f14e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f151:	04 00                	add    $0x0,%al
  30f153:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f156:	00 00                	add    %al,(%eax)
  30f158:	e4 01                	in     $0x1,%al
  30f15a:	00 00                	add    %al,(%eax)
  30f15c:	ac                   	lods   %ds:(%esi),%al
  30f15d:	68 ff ff 1e 00       	push   $0x1effff
  30f162:	00 00                	add    %al,(%eax)
  30f164:	00 41 0e             	add    %al,0xe(%ecx)
  30f167:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f16d:	5a                   	pop    %edx
  30f16e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f171:	04 00                	add    $0x0,%al
  30f173:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f176:	00 00                	add    %al,(%eax)
  30f178:	04 02                	add    $0x2,%al
  30f17a:	00 00                	add    %al,(%eax)
  30f17c:	aa                   	stos   %al,%es:(%edi)
  30f17d:	68 ff ff 1e 00       	push   $0x1effff
  30f182:	00 00                	add    %al,(%eax)
  30f184:	00 41 0e             	add    %al,0xe(%ecx)
  30f187:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f18d:	5a                   	pop    %edx
  30f18e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f191:	04 00                	add    $0x0,%al
  30f193:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f196:	00 00                	add    %al,(%eax)
  30f198:	24 02                	and    $0x2,%al
  30f19a:	00 00                	add    %al,(%eax)
  30f19c:	a8 68                	test   $0x68,%al
  30f19e:	ff                   	(bad)  
  30f19f:	ff 1e                	lcall  *(%esi)
  30f1a1:	00 00                	add    %al,(%eax)
  30f1a3:	00 00                	add    %al,(%eax)
  30f1a5:	41                   	inc    %ecx
  30f1a6:	0e                   	push   %cs
  30f1a7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f1ad:	5a                   	pop    %edx
  30f1ae:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f1b1:	04 00                	add    $0x0,%al
  30f1b3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f1b6:	00 00                	add    %al,(%eax)
  30f1b8:	44                   	inc    %esp
  30f1b9:	02 00                	add    (%eax),%al
  30f1bb:	00 a6 68 ff ff 1e    	add    %ah,0x1effff68(%esi)
  30f1c1:	00 00                	add    %al,(%eax)
  30f1c3:	00 00                	add    %al,(%eax)
  30f1c5:	41                   	inc    %ecx
  30f1c6:	0e                   	push   %cs
  30f1c7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f1cd:	5a                   	pop    %edx
  30f1ce:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f1d1:	04 00                	add    $0x0,%al
  30f1d3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f1d6:	00 00                	add    %al,(%eax)
  30f1d8:	64 02 00             	add    %fs:(%eax),%al
  30f1db:	00 a4 68 ff ff 1e 00 	add    %ah,0x1effff(%eax,%ebp,2)
  30f1e2:	00 00                	add    %al,(%eax)
  30f1e4:	00 41 0e             	add    %al,0xe(%ecx)
  30f1e7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f1ed:	5a                   	pop    %edx
  30f1ee:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f1f1:	04 00                	add    $0x0,%al
  30f1f3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f1f6:	00 00                	add    %al,(%eax)
  30f1f8:	84 02                	test   %al,(%edx)
  30f1fa:	00 00                	add    %al,(%eax)
  30f1fc:	a2 68 ff ff 1e       	mov    %al,0x1effff68
  30f201:	00 00                	add    %al,(%eax)
  30f203:	00 00                	add    %al,(%eax)
  30f205:	41                   	inc    %ecx
  30f206:	0e                   	push   %cs
  30f207:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f20d:	5a                   	pop    %edx
  30f20e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f211:	04 00                	add    $0x0,%al
  30f213:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f216:	00 00                	add    %al,(%eax)
  30f218:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  30f219:	02 00                	add    (%eax),%al
  30f21b:	00 a0 68 ff ff 1e    	add    %ah,0x1effff68(%eax)
  30f221:	00 00                	add    %al,(%eax)
  30f223:	00 00                	add    %al,(%eax)
  30f225:	41                   	inc    %ecx
  30f226:	0e                   	push   %cs
  30f227:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f22d:	5a                   	pop    %edx
  30f22e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f231:	04 00                	add    $0x0,%al
  30f233:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f236:	00 00                	add    %al,(%eax)
  30f238:	c4 02                	les    (%edx),%eax
  30f23a:	00 00                	add    %al,(%eax)
  30f23c:	9e                   	sahf   
  30f23d:	68 ff ff 8a 00       	push   $0x8affff
  30f242:	00 00                	add    %al,(%eax)
  30f244:	00 41 0e             	add    %al,0xe(%ecx)
  30f247:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f24d:	02 86 c5 0c 04 04    	add    0x4040cc5(%esi),%al
  30f253:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f256:	00 00                	add    %al,(%eax)
  30f258:	e4 02                	in     $0x2,%al
  30f25a:	00 00                	add    %al,(%eax)
  30f25c:	08 69 ff             	or     %ch,-0x1(%ecx)
  30f25f:	ff 1e                	lcall  *(%esi)
  30f261:	00 00                	add    %al,(%eax)
  30f263:	00 00                	add    %al,(%eax)
  30f265:	41                   	inc    %ecx
  30f266:	0e                   	push   %cs
  30f267:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f26d:	5a                   	pop    %edx
  30f26e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f271:	04 00                	add    $0x0,%al
  30f273:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f276:	00 00                	add    %al,(%eax)
  30f278:	04 03                	add    $0x3,%al
  30f27a:	00 00                	add    %al,(%eax)
  30f27c:	06                   	push   %es
  30f27d:	69 ff ff 1e 00 00    	imul   $0x1eff,%edi,%edi
  30f283:	00 00                	add    %al,(%eax)
  30f285:	41                   	inc    %ecx
  30f286:	0e                   	push   %cs
  30f287:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f28d:	5a                   	pop    %edx
  30f28e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f291:	04 00                	add    $0x0,%al
  30f293:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f296:	00 00                	add    %al,(%eax)
  30f298:	24 03                	and    $0x3,%al
  30f29a:	00 00                	add    %al,(%eax)
  30f29c:	04 69                	add    $0x69,%al
  30f29e:	ff                   	(bad)  
  30f29f:	ff 05 00 00 00 00    	incl   0x0
  30f2a5:	41                   	inc    %ecx
  30f2a6:	0e                   	push   %cs
  30f2a7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f2ad:	41                   	inc    %ecx
  30f2ae:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f2b1:	04 00                	add    $0x0,%al
  30f2b3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f2b6:	00 00                	add    %al,(%eax)
  30f2b8:	44                   	inc    %esp
  30f2b9:	03 00                	add    (%eax),%eax
  30f2bb:	00 e9                	add    %ch,%cl
  30f2bd:	68 ff ff 75 00       	push   $0x75ffff
  30f2c2:	00 00                	add    %al,(%eax)
  30f2c4:	00 41 0e             	add    %al,0xe(%ecx)
  30f2c7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f2cd:	02 71 c5             	add    -0x3b(%ecx),%dh
  30f2d0:	0c 04                	or     $0x4,%al
  30f2d2:	04 00                	add    $0x0,%al
  30f2d4:	1c 00                	sbb    $0x0,%al
  30f2d6:	00 00                	add    %al,(%eax)
  30f2d8:	64 03 00             	add    %fs:(%eax),%eax
  30f2db:	00 3e                	add    %bh,(%esi)
  30f2dd:	69 ff ff 81 00 00    	imul   $0x81ff,%edi,%edi
  30f2e3:	00 00                	add    %al,(%eax)
  30f2e5:	41                   	inc    %ecx
  30f2e6:	0e                   	push   %cs
  30f2e7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f2ed:	02 7d c5             	add    -0x3b(%ebp),%bh
  30f2f0:	0c 04                	or     $0x4,%al
  30f2f2:	04 00                	add    $0x0,%al
  30f2f4:	1c 00                	sbb    $0x0,%al
  30f2f6:	00 00                	add    %al,(%eax)
  30f2f8:	84 03                	test   %al,(%ebx)
  30f2fa:	00 00                	add    %al,(%eax)
  30f2fc:	9f                   	lahf   
  30f2fd:	69 ff ff 3c 00 00    	imul   $0x3cff,%edi,%edi
  30f303:	00 00                	add    %al,(%eax)
  30f305:	41                   	inc    %ecx
  30f306:	0e                   	push   %cs
  30f307:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f30d:	78 c5                	js     30f2d4 <_upperDigits+0x4e4>
  30f30f:	0c 04                	or     $0x4,%al
  30f311:	04 00                	add    $0x0,%al
  30f313:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f316:	00 00                	add    %al,(%eax)
  30f318:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  30f319:	03 00                	add    (%eax),%eax
  30f31b:	00 bb 69 ff ff 90    	add    %bh,-0x6f000097(%ebx)
  30f321:	00 00                	add    %al,(%eax)
  30f323:	00 00                	add    %al,(%eax)
  30f325:	41                   	inc    %ecx
  30f326:	0e                   	push   %cs
  30f327:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f32d:	02 8c c5 0c 04 04 00 	add    0x4040c(%ebp,%eax,8),%cl
  30f334:	1c 00                	sbb    $0x0,%al
  30f336:	00 00                	add    %al,(%eax)
  30f338:	c4 03                	les    (%ebx),%eax
  30f33a:	00 00                	add    %al,(%eax)
  30f33c:	2b 6a ff             	sub    -0x1(%edx),%ebp
  30f33f:	ff 8e 07 00 00 00    	decl   0x7(%esi)
  30f345:	41                   	inc    %ecx
  30f346:	0e                   	push   %cs
  30f347:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f34d:	03 8a 07 c5 0c 04    	add    0x40cc507(%edx),%ecx
  30f353:	04 24                	add    $0x24,%al
  30f355:	00 00                	add    %al,(%eax)
  30f357:	00 e4                	add    %ah,%ah
  30f359:	03 00                	add    (%eax),%eax
  30f35b:	00 9c 71 ff ff 1d 00 	add    %bl,0x1dffff(%ecx,%esi,2)
  30f362:	00 00                	add    %al,(%eax)
  30f364:	00 41 0e             	add    %al,0xe(%ecx)
  30f367:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f36d:	42                   	inc    %edx
  30f36e:	87 03                	xchg   %eax,(%ebx)
  30f370:	86 04 55 c6 41 c7 41 	xchg   %al,0x41c741c6(,%edx,2)
  30f377:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f37a:	04 00                	add    $0x0,%al
  30f37c:	28 00                	sub    %al,(%eax)
  30f37e:	00 00                	add    %al,(%eax)
  30f380:	0c 04                	or     $0x4,%al
  30f382:	00 00                	add    %al,(%eax)
  30f384:	91                   	xchg   %eax,%ecx
  30f385:	71 ff                	jno    30f386 <_upperDigits+0x596>
  30f387:	ff 20                	jmp    *(%eax)
  30f389:	00 00                	add    %al,(%eax)
  30f38b:	00 00                	add    %al,(%eax)
  30f38d:	41                   	inc    %ecx
  30f38e:	0e                   	push   %cs
  30f38f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f395:	43                   	inc    %ebx
  30f396:	87 03                	xchg   %eax,(%ebx)
  30f398:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f39b:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  30f3a0:	41                   	inc    %ecx
  30f3a1:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30f3a8:	1c 00                	sbb    $0x0,%al
  30f3aa:	00 00                	add    %al,(%eax)
  30f3ac:	38 04 00             	cmp    %al,(%eax,%eax,1)
  30f3af:	00 85 71 ff ff df    	add    %al,-0x2000008f(%ebp)
  30f3b5:	00 00                	add    %al,(%eax)
  30f3b7:	00 00                	add    %al,(%eax)
  30f3b9:	41                   	inc    %ecx
  30f3ba:	0e                   	push   %cs
  30f3bb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f3c1:	02 db                	add    %bl,%bl
  30f3c3:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f3c6:	04 00                	add    $0x0,%al
  30f3c8:	1c 00                	sbb    $0x0,%al
  30f3ca:	00 00                	add    %al,(%eax)
  30f3cc:	58                   	pop    %eax
  30f3cd:	04 00                	add    $0x0,%al
  30f3cf:	00 44 72 ff          	add    %al,-0x1(%edx,%esi,2)
  30f3d3:	ff                   	(bad)  
  30f3d4:	7f 00                	jg     30f3d6 <_upperDigits+0x5e6>
  30f3d6:	00 00                	add    %al,(%eax)
  30f3d8:	00 41 0e             	add    %al,0xe(%ecx)
  30f3db:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f3e1:	02 7b c5             	add    -0x3b(%ebx),%bh
  30f3e4:	0c 04                	or     $0x4,%al
  30f3e6:	04 00                	add    $0x0,%al
  30f3e8:	1c 00                	sbb    $0x0,%al
  30f3ea:	00 00                	add    %al,(%eax)
  30f3ec:	78 04                	js     30f3f2 <_upperDigits+0x602>
  30f3ee:	00 00                	add    %al,(%eax)
  30f3f0:	a3 72 ff ff 80       	mov    %eax,0x80ffff72
  30f3f5:	00 00                	add    %al,(%eax)
  30f3f7:	00 00                	add    %al,(%eax)
  30f3f9:	41                   	inc    %ecx
  30f3fa:	0e                   	push   %cs
  30f3fb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f401:	02 7c c5 0c          	add    0xc(%ebp,%eax,8),%bh
  30f405:	04 04                	add    $0x4,%al
  30f407:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f40a:	00 00                	add    %al,(%eax)
  30f40c:	98                   	cwtl   
  30f40d:	04 00                	add    $0x0,%al
  30f40f:	00 03                	add    %al,(%ebx)
  30f411:	73 ff                	jae    30f412 <_upperDigits+0x622>
  30f413:	ff d2                	call   *%edx
  30f415:	00 00                	add    %al,(%eax)
  30f417:	00 00                	add    %al,(%eax)
  30f419:	41                   	inc    %ecx
  30f41a:	0e                   	push   %cs
  30f41b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f421:	02 ce                	add    %dh,%cl
  30f423:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f426:	04 00                	add    $0x0,%al
  30f428:	1c 00                	sbb    $0x0,%al
  30f42a:	00 00                	add    %al,(%eax)
  30f42c:	b8 04 00 00 b5       	mov    $0xb5000004,%eax
  30f431:	73 ff                	jae    30f432 <_upperDigits+0x642>
  30f433:	ff 44 00 00          	incl   0x0(%eax,%eax,1)
  30f437:	00 00                	add    %al,(%eax)
  30f439:	41                   	inc    %ecx
  30f43a:	0e                   	push   %cs
  30f43b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f441:	02 40 c5             	add    -0x3b(%eax),%al
  30f444:	0c 04                	or     $0x4,%al
  30f446:	04 00                	add    $0x0,%al
  30f448:	1c 00                	sbb    $0x0,%al
  30f44a:	00 00                	add    %al,(%eax)
  30f44c:	d8 04 00             	fadds  (%eax,%eax,1)
  30f44f:	00 d9                	add    %bl,%cl
  30f451:	73 ff                	jae    30f452 <_upperDigits+0x662>
  30f453:	ff 20                	jmp    *(%eax)
  30f455:	00 00                	add    %al,(%eax)
  30f457:	00 00                	add    %al,(%eax)
  30f459:	41                   	inc    %ecx
  30f45a:	0e                   	push   %cs
  30f45b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f461:	5c                   	pop    %esp
  30f462:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f465:	04 00                	add    $0x0,%al
  30f467:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f46a:	00 00                	add    %al,(%eax)
  30f46c:	f8                   	clc    
  30f46d:	04 00                	add    $0x0,%al
  30f46f:	00 d9                	add    %bl,%cl
  30f471:	73 ff                	jae    30f472 <_upperDigits+0x682>
  30f473:	ff 29                	ljmp   *(%ecx)
  30f475:	00 00                	add    %al,(%eax)
  30f477:	00 00                	add    %al,(%eax)
  30f479:	41                   	inc    %ecx
  30f47a:	0e                   	push   %cs
  30f47b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f481:	65 c5 0c 04          	lds    %gs:(%esp,%eax,1),%ecx
  30f485:	04 00                	add    $0x0,%al
  30f487:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f48a:	00 00                	add    %al,(%eax)
  30f48c:	18 05 00 00 e2 73    	sbb    %al,0x73e20000
  30f492:	ff                   	(bad)  
  30f493:	ff 2a                	ljmp   *(%edx)
  30f495:	00 00                	add    %al,(%eax)
  30f497:	00 00                	add    %al,(%eax)
  30f499:	41                   	inc    %ecx
  30f49a:	0e                   	push   %cs
  30f49b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f4a1:	66 c5 0c 04          	lds    (%esp,%eax,1),%cx
  30f4a5:	04 00                	add    $0x0,%al
  30f4a7:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f4aa:	00 00                	add    %al,(%eax)
  30f4ac:	38 05 00 00 ec 73    	cmp    %al,0x73ec0000
  30f4b2:	ff                   	(bad)  
  30f4b3:	ff 29                	ljmp   *(%ecx)
  30f4b5:	00 00                	add    %al,(%eax)
  30f4b7:	00 00                	add    %al,(%eax)
  30f4b9:	41                   	inc    %ecx
  30f4ba:	0e                   	push   %cs
  30f4bb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f4c1:	65 c5 0c 04          	lds    %gs:(%esp,%eax,1),%ecx
  30f4c5:	04 00                	add    $0x0,%al
  30f4c7:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f4ca:	00 00                	add    %al,(%eax)
  30f4cc:	58                   	pop    %eax
  30f4cd:	05 00 00 f5 73       	add    $0x73f50000,%eax
  30f4d2:	ff                   	(bad)  
  30f4d3:	ff eb                	ljmp   *<internal disassembler error>
  30f4d5:	00 00                	add    %al,(%eax)
  30f4d7:	00 00                	add    %al,(%eax)
  30f4d9:	41                   	inc    %ecx
  30f4da:	0e                   	push   %cs
  30f4db:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f4e1:	02 e7                	add    %bh,%ah
  30f4e3:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f4e6:	04 00                	add    $0x0,%al
  30f4e8:	1c 00                	sbb    $0x0,%al
  30f4ea:	00 00                	add    %al,(%eax)
  30f4ec:	78 05                	js     30f4f3 <_upperDigits+0x703>
  30f4ee:	00 00                	add    %al,(%eax)
  30f4f0:	c0                   	(bad)  
  30f4f1:	74 ff                	je     30f4f2 <_upperDigits+0x702>
  30f4f3:	ff                   	(bad)  
  30f4f4:	fd                   	std    
  30f4f5:	00 00                	add    %al,(%eax)
  30f4f7:	00 00                	add    %al,(%eax)
  30f4f9:	41                   	inc    %ecx
  30f4fa:	0e                   	push   %cs
  30f4fb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f501:	02 f9                	add    %cl,%bh
  30f503:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f506:	04 00                	add    $0x0,%al
  30f508:	1c 00                	sbb    $0x0,%al
  30f50a:	00 00                	add    %al,(%eax)
  30f50c:	98                   	cwtl   
  30f50d:	05 00 00 9d 75       	add    $0x759d0000,%eax
  30f512:	ff                   	(bad)  
  30f513:	ff                   	(bad)  
  30f514:	39 00                	cmp    %eax,(%eax)
  30f516:	00 00                	add    %al,(%eax)
  30f518:	00 41 0e             	add    %al,0xe(%ecx)
  30f51b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f521:	75 c5                	jne    30f4e8 <_upperDigits+0x6f8>
  30f523:	0c 04                	or     $0x4,%al
  30f525:	04 00                	add    $0x0,%al
  30f527:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f52a:	00 00                	add    %al,(%eax)
  30f52c:	b8 05 00 00 b6       	mov    $0xb6000005,%eax
  30f531:	75 ff                	jne    30f532 <_upperDigits+0x742>
  30f533:	ff 1e                	lcall  *(%esi)
  30f535:	01 00                	add    %eax,(%eax)
  30f537:	00 00                	add    %al,(%eax)
  30f539:	41                   	inc    %ecx
  30f53a:	0e                   	push   %cs
  30f53b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f541:	03 1a                	add    (%edx),%ebx
  30f543:	01 c5                	add    %eax,%ebp
  30f545:	0c 04                	or     $0x4,%al
  30f547:	04 1c                	add    $0x1c,%al
  30f549:	00 00                	add    %al,(%eax)
  30f54b:	00 d8                	add    %bl,%al
  30f54d:	05 00 00 b4 76       	add    $0x76b40000,%eax
  30f552:	ff                   	(bad)  
  30f553:	ff 23                	jmp    *(%ebx)
  30f555:	00 00                	add    %al,(%eax)
  30f557:	00 00                	add    %al,(%eax)
  30f559:	41                   	inc    %ecx
  30f55a:	0e                   	push   %cs
  30f55b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f561:	5f                   	pop    %edi
  30f562:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f565:	04 00                	add    $0x0,%al
  30f567:	00 24 00             	add    %ah,(%eax,%eax,1)
  30f56a:	00 00                	add    %al,(%eax)
  30f56c:	f8                   	clc    
  30f56d:	05 00 00 b7 76       	add    $0x76b70000,%eax
  30f572:	ff                   	(bad)  
  30f573:	ff 03                	incl   (%ebx)
  30f575:	01 00                	add    %eax,(%eax)
  30f577:	00 00                	add    %al,(%eax)
  30f579:	41                   	inc    %ecx
  30f57a:	0e                   	push   %cs
  30f57b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f581:	45                   	inc    %ebp
  30f582:	87 03                	xchg   %eax,(%ebx)
  30f584:	83 04 02 f8          	addl   $0xfffffff8,(%edx,%eax,1)
  30f588:	c3                   	ret    
  30f589:	41                   	inc    %ecx
  30f58a:	c7 41 c5 0c 04 04 1c 	movl   $0x1c04040c,-0x3b(%ecx)
  30f591:	00 00                	add    %al,(%eax)
  30f593:	00 20                	add    %ah,(%eax)
  30f595:	06                   	push   %es
  30f596:	00 00                	add    %al,(%eax)
  30f598:	92                   	xchg   %eax,%edx
  30f599:	77 ff                	ja     30f59a <_upperDigits+0x7aa>
  30f59b:	ff e5                	jmp    *%ebp
  30f59d:	00 00                	add    %al,(%eax)
  30f59f:	00 00                	add    %al,(%eax)
  30f5a1:	41                   	inc    %ecx
  30f5a2:	0e                   	push   %cs
  30f5a3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f5a9:	02 e1                	add    %cl,%ah
  30f5ab:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f5ae:	04 00                	add    $0x0,%al
  30f5b0:	28 00                	sub    %al,(%eax)
  30f5b2:	00 00                	add    %al,(%eax)
  30f5b4:	40                   	inc    %eax
  30f5b5:	06                   	push   %es
  30f5b6:	00 00                	add    %al,(%eax)
  30f5b8:	58                   	pop    %eax
  30f5b9:	78 ff                	js     30f5ba <_upperDigits+0x7ca>
  30f5bb:	ff 2d 00 00 00 00    	ljmp   *0x0
  30f5c1:	41                   	inc    %ecx
  30f5c2:	0e                   	push   %cs
  30f5c3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f5c9:	46                   	inc    %esi
  30f5ca:	87 03                	xchg   %eax,(%ebx)
  30f5cc:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f5cf:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  30f5d4:	41                   	inc    %ecx
  30f5d5:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30f5dc:	20 00                	and    %al,(%eax)
  30f5de:	00 00                	add    %al,(%eax)
  30f5e0:	6c                   	insb   (%dx),%es:(%edi)
  30f5e1:	06                   	push   %es
  30f5e2:	00 00                	add    %al,(%eax)
  30f5e4:	59                   	pop    %ecx
  30f5e5:	78 ff                	js     30f5e6 <_upperDigits+0x7f6>
  30f5e7:	ff 1e                	lcall  *(%esi)
  30f5e9:	00 00                	add    %al,(%eax)
  30f5eb:	00 00                	add    %al,(%eax)
  30f5ed:	41                   	inc    %ecx
  30f5ee:	0e                   	push   %cs
  30f5ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f5f5:	41                   	inc    %ecx
  30f5f6:	87 03                	xchg   %eax,(%ebx)
  30f5f8:	58                   	pop    %eax
  30f5f9:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30f600:	28 00                	sub    %al,(%eax)
  30f602:	00 00                	add    %al,(%eax)
  30f604:	90                   	nop
  30f605:	06                   	push   %es
  30f606:	00 00                	add    %al,(%eax)
  30f608:	53                   	push   %ebx
  30f609:	78 ff                	js     30f60a <_upperDigits+0x81a>
  30f60b:	ff 20                	jmp    *(%eax)
  30f60d:	00 00                	add    %al,(%eax)
  30f60f:	00 00                	add    %al,(%eax)
  30f611:	41                   	inc    %ecx
  30f612:	0e                   	push   %cs
  30f613:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f619:	43                   	inc    %ebx
  30f61a:	87 03                	xchg   %eax,(%ebx)
  30f61c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f61f:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  30f624:	41                   	inc    %ecx
  30f625:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30f62c:	1c 00                	sbb    $0x0,%al
  30f62e:	00 00                	add    %al,(%eax)
  30f630:	bc 06 00 00 47       	mov    $0x47000006,%esp
  30f635:	78 ff                	js     30f636 <_upperDigits+0x846>
  30f637:	ff 4d 00             	decl   0x0(%ebp)
  30f63a:	00 00                	add    %al,(%eax)
  30f63c:	00 41 0e             	add    %al,0xe(%ecx)
  30f63f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f645:	02 49 c5             	add    -0x3b(%ecx),%cl
  30f648:	0c 04                	or     $0x4,%al
  30f64a:	04 00                	add    $0x0,%al
  30f64c:	28 00                	sub    %al,(%eax)
  30f64e:	00 00                	add    %al,(%eax)
  30f650:	dc 06                	faddl  (%esi)
  30f652:	00 00                	add    %al,(%eax)
  30f654:	74 78                	je     30f6ce <_upperDigits+0x8de>
  30f656:	ff                   	(bad)  
  30f657:	ff 85 00 00 00 00    	incl   0x0(%ebp)
  30f65d:	41                   	inc    %ecx
  30f65e:	0e                   	push   %cs
  30f65f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f665:	46                   	inc    %esi
  30f666:	87 03                	xchg   %eax,(%ebx)
  30f668:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f66b:	05 02 78 c3 41       	add    $0x41c37802,%eax
  30f670:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  30f674:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f677:	04 28                	add    $0x28,%al
  30f679:	00 00                	add    %al,(%eax)
  30f67b:	00 08                	add    %cl,(%eax)
  30f67d:	07                   	pop    %es
  30f67e:	00 00                	add    %al,(%eax)
  30f680:	cd 78                	int    $0x78
  30f682:	ff                   	(bad)  
  30f683:	ff 34 00             	pushl  (%eax,%eax,1)
  30f686:	00 00                	add    %al,(%eax)
  30f688:	00 41 0e             	add    %al,0xe(%ecx)
  30f68b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f691:	46                   	inc    %esi
  30f692:	87 03                	xchg   %eax,(%ebx)
  30f694:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f697:	05 67 c3 41 c6       	add    $0xc641c367,%eax
  30f69c:	41                   	inc    %ecx
  30f69d:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30f6a4:	28 00                	sub    %al,(%eax)
  30f6a6:	00 00                	add    %al,(%eax)
  30f6a8:	34 07                	xor    $0x7,%al
  30f6aa:	00 00                	add    %al,(%eax)
  30f6ac:	d5 78                	aad    $0x78
  30f6ae:	ff                   	(bad)  
  30f6af:	ff 4c 00 00          	decl   0x0(%eax,%eax,1)
  30f6b3:	00 00                	add    %al,(%eax)
  30f6b5:	41                   	inc    %ecx
  30f6b6:	0e                   	push   %cs
  30f6b7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f6bd:	46                   	inc    %esi
  30f6be:	87 03                	xchg   %eax,(%ebx)
  30f6c0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f6c3:	05 7f c3 41 c6       	add    $0xc641c37f,%eax
  30f6c8:	41                   	inc    %ecx
  30f6c9:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30f6d0:	28 00                	sub    %al,(%eax)
  30f6d2:	00 00                	add    %al,(%eax)
  30f6d4:	60                   	pusha  
  30f6d5:	07                   	pop    %es
  30f6d6:	00 00                	add    %al,(%eax)
  30f6d8:	f5                   	cmc    
  30f6d9:	78 ff                	js     30f6da <_upperDigits+0x8ea>
  30f6db:	ff cb                	dec    %ebx
  30f6dd:	00 00                	add    %al,(%eax)
  30f6df:	00 00                	add    %al,(%eax)
  30f6e1:	41                   	inc    %ecx
  30f6e2:	0e                   	push   %cs
  30f6e3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f6e9:	46                   	inc    %esi
  30f6ea:	87 03                	xchg   %eax,(%ebx)
  30f6ec:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f6ef:	05 02 be c3 41       	add    $0x41c3be02,%eax
  30f6f4:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  30f6f8:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f6fb:	04 28                	add    $0x28,%al
  30f6fd:	00 00                	add    %al,(%eax)
  30f6ff:	00 8c 07 00 00 94 79 	add    %cl,0x79940000(%edi,%eax,1)
  30f706:	ff                   	(bad)  
  30f707:	ff 2d 00 00 00 00    	ljmp   *0x0
  30f70d:	41                   	inc    %ecx
  30f70e:	0e                   	push   %cs
  30f70f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f715:	46                   	inc    %esi
  30f716:	87 03                	xchg   %eax,(%ebx)
  30f718:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f71b:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  30f720:	41                   	inc    %ecx
  30f721:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30f728:	28 00                	sub    %al,(%eax)
  30f72a:	00 00                	add    %al,(%eax)
  30f72c:	b8 07 00 00 95       	mov    $0x95000007,%eax
  30f731:	79 ff                	jns    30f732 <_upperDigits+0x942>
  30f733:	ff 20                	jmp    *(%eax)
  30f735:	00 00                	add    %al,(%eax)
  30f737:	00 00                	add    %al,(%eax)
  30f739:	41                   	inc    %ecx
  30f73a:	0e                   	push   %cs
  30f73b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f741:	43                   	inc    %ebx
  30f742:	87 03                	xchg   %eax,(%ebx)
  30f744:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f747:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  30f74c:	41                   	inc    %ecx
  30f74d:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30f754:	1c 00                	sbb    $0x0,%al
  30f756:	00 00                	add    %al,(%eax)
  30f758:	e4 07                	in     $0x7,%al
  30f75a:	00 00                	add    %al,(%eax)
  30f75c:	89 79 ff             	mov    %edi,-0x1(%ecx)
  30f75f:	ff 36                	pushl  (%esi)
  30f761:	00 00                	add    %al,(%eax)
  30f763:	00 00                	add    %al,(%eax)
  30f765:	41                   	inc    %ecx
  30f766:	0e                   	push   %cs
  30f767:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f76d:	72 c5                	jb     30f734 <_upperDigits+0x944>
  30f76f:	0c 04                	or     $0x4,%al
  30f771:	04 00                	add    $0x0,%al
  30f773:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f776:	00 00                	add    %al,(%eax)
  30f778:	04 08                	add    $0x8,%al
  30f77a:	00 00                	add    %al,(%eax)
  30f77c:	9f                   	lahf   
  30f77d:	79 ff                	jns    30f77e <_upperDigits+0x98e>
  30f77f:	ff 59 00             	lcall  *0x0(%ecx)
  30f782:	00 00                	add    %al,(%eax)
  30f784:	00 41 0e             	add    %al,0xe(%ecx)
  30f787:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f78d:	02 55 c5             	add    -0x3b(%ebp),%dl
  30f790:	0c 04                	or     $0x4,%al
  30f792:	04 00                	add    $0x0,%al
  30f794:	1c 00                	sbb    $0x0,%al
  30f796:	00 00                	add    %al,(%eax)
  30f798:	24 08                	and    $0x8,%al
  30f79a:	00 00                	add    %al,(%eax)
  30f79c:	d8 79 ff             	fdivrs -0x1(%ecx)
  30f79f:	ff                   	(bad)  
  30f7a0:	38 00                	cmp    %al,(%eax)
  30f7a2:	00 00                	add    %al,(%eax)
  30f7a4:	00 41 0e             	add    %al,0xe(%ecx)
  30f7a7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f7ad:	74 c5                	je     30f774 <_upperDigits+0x984>
  30f7af:	0c 04                	or     $0x4,%al
  30f7b1:	04 00                	add    $0x0,%al
  30f7b3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f7b6:	00 00                	add    %al,(%eax)
  30f7b8:	44                   	inc    %esp
  30f7b9:	08 00                	or     %al,(%eax)
  30f7bb:	00 f0                	add    %dh,%al
  30f7bd:	79 ff                	jns    30f7be <_upperDigits+0x9ce>
  30f7bf:	ff 0a                	decl   (%edx)
  30f7c1:	00 00                	add    %al,(%eax)
  30f7c3:	00 00                	add    %al,(%eax)
  30f7c5:	41                   	inc    %ecx
  30f7c6:	0e                   	push   %cs
  30f7c7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f7cd:	46                   	inc    %esi
  30f7ce:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f7d1:	04 00                	add    $0x0,%al
  30f7d3:	00 28                	add    %ch,(%eax)
  30f7d5:	00 00                	add    %al,(%eax)
  30f7d7:	00 64 08 00          	add    %ah,0x0(%eax,%ecx,1)
  30f7db:	00 dc                	add    %bl,%ah
  30f7dd:	79 ff                	jns    30f7de <_upperDigits+0x9ee>
  30f7df:	ff 20                	jmp    *(%eax)
  30f7e1:	00 00                	add    %al,(%eax)
  30f7e3:	00 00                	add    %al,(%eax)
  30f7e5:	41                   	inc    %ecx
  30f7e6:	0e                   	push   %cs
  30f7e7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f7ed:	43                   	inc    %ebx
  30f7ee:	87 03                	xchg   %eax,(%ebx)
  30f7f0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f7f3:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  30f7f8:	41                   	inc    %ecx
  30f7f9:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30f800:	20 00                	and    %al,(%eax)
  30f802:	00 00                	add    %al,(%eax)
  30f804:	90                   	nop
  30f805:	08 00                	or     %al,(%eax)
  30f807:	00 d0                	add    %dl,%al
  30f809:	79 ff                	jns    30f80a <_upperDigits+0xa1a>
  30f80b:	ff 25 00 00 00 00    	jmp    *0x0
  30f811:	41                   	inc    %ecx
  30f812:	0e                   	push   %cs
  30f813:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f819:	44                   	inc    %esp
  30f81a:	87 03                	xchg   %eax,(%ebx)
  30f81c:	5c                   	pop    %esp
  30f81d:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30f824:	24 00                	and    $0x0,%al
  30f826:	00 00                	add    %al,(%eax)
  30f828:	b4 08                	mov    $0x8,%ah
  30f82a:	00 00                	add    %al,(%eax)
  30f82c:	d1 79 ff             	sarl   -0x1(%ecx)
  30f82f:	ff 6c 00 00          	ljmp   *0x0(%eax,%eax,1)
  30f833:	00 00                	add    %al,(%eax)
  30f835:	41                   	inc    %ecx
  30f836:	0e                   	push   %cs
  30f837:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f83d:	45                   	inc    %ebp
  30f83e:	87 03                	xchg   %eax,(%ebx)
  30f840:	83 04 02 61          	addl   $0x61,(%edx,%eax,1)
  30f844:	c3                   	ret    
  30f845:	41                   	inc    %ecx
  30f846:	c7 41 c5 0c 04 04 24 	movl   $0x2404040c,-0x3b(%ecx)
  30f84d:	00 00                	add    %al,(%eax)
  30f84f:	00 dc                	add    %bl,%ah
  30f851:	08 00                	or     %al,(%eax)
  30f853:	00 15 7a ff ff 6f    	add    %dl,0x6fffff7a
  30f859:	00 00                	add    %al,(%eax)
  30f85b:	00 00                	add    %al,(%eax)
  30f85d:	41                   	inc    %ecx
  30f85e:	0e                   	push   %cs
  30f85f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f865:	45                   	inc    %ebp
  30f866:	87 03                	xchg   %eax,(%ebx)
  30f868:	83 04 02 64          	addl   $0x64,(%edx,%eax,1)
  30f86c:	c3                   	ret    
  30f86d:	41                   	inc    %ecx
  30f86e:	c7 41 c5 0c 04 04 1c 	movl   $0x1c04040c,-0x3b(%ecx)
  30f875:	00 00                	add    %al,(%eax)
  30f877:	00 04 09             	add    %al,(%ecx,%ecx,1)
  30f87a:	00 00                	add    %al,(%eax)
  30f87c:	5c                   	pop    %esp
  30f87d:	7a ff                	jp     30f87e <_upperDigits+0xa8e>
  30f87f:	ff 45 00             	incl   0x0(%ebp)
  30f882:	00 00                	add    %al,(%eax)
  30f884:	00 41 0e             	add    %al,0xe(%ecx)
  30f887:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f88d:	02 41 c5             	add    -0x3b(%ecx),%al
  30f890:	0c 04                	or     $0x4,%al
  30f892:	04 00                	add    $0x0,%al
  30f894:	1c 00                	sbb    $0x0,%al
  30f896:	00 00                	add    %al,(%eax)
  30f898:	24 09                	and    $0x9,%al
  30f89a:	00 00                	add    %al,(%eax)
  30f89c:	81 7a ff ff 18 00 00 	cmpl   $0x18ff,-0x1(%edx)
  30f8a3:	00 00                	add    %al,(%eax)
  30f8a5:	41                   	inc    %ecx
  30f8a6:	0e                   	push   %cs
  30f8a7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f8ad:	54                   	push   %esp
  30f8ae:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f8b1:	04 00                	add    $0x0,%al
  30f8b3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f8b6:	00 00                	add    %al,(%eax)
  30f8b8:	44                   	inc    %esp
  30f8b9:	09 00                	or     %eax,(%eax)
  30f8bb:	00 79 7a             	add    %bh,0x7a(%ecx)
  30f8be:	ff                   	(bad)  
  30f8bf:	ff 73 00             	pushl  0x0(%ebx)
  30f8c2:	00 00                	add    %al,(%eax)
  30f8c4:	00 41 0e             	add    %al,0xe(%ecx)
  30f8c7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f8cd:	02 6f c5             	add    -0x3b(%edi),%ch
  30f8d0:	0c 04                	or     $0x4,%al
  30f8d2:	04 00                	add    $0x0,%al
  30f8d4:	1c 00                	sbb    $0x0,%al
  30f8d6:	00 00                	add    %al,(%eax)
  30f8d8:	64 09 00             	or     %eax,%fs:(%eax)
  30f8db:	00 cc                	add    %cl,%ah
  30f8dd:	7a ff                	jp     30f8de <_upperDigits+0xaee>
  30f8df:	ff 30                	pushl  (%eax)
  30f8e1:	01 00                	add    %eax,(%eax)
  30f8e3:	00 00                	add    %al,(%eax)
  30f8e5:	41                   	inc    %ecx
  30f8e6:	0e                   	push   %cs
  30f8e7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f8ed:	03 2c 01             	add    (%ecx,%eax,1),%ebp
  30f8f0:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f8f3:	04 1c                	add    $0x1c,%al
  30f8f5:	00 00                	add    %al,(%eax)
  30f8f7:	00 84 09 00 00 dc 7b 	add    %al,0x7bdc0000(%ecx,%ecx,1)
  30f8fe:	ff                   	(bad)  
  30f8ff:	ff 51 01             	call   *0x1(%ecx)
  30f902:	00 00                	add    %al,(%eax)
  30f904:	00 41 0e             	add    %al,0xe(%ecx)
  30f907:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f90d:	03 4d 01             	add    0x1(%ebp),%ecx
  30f910:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f913:	04 1c                	add    $0x1c,%al
  30f915:	00 00                	add    %al,(%eax)
  30f917:	00 a4 09 00 00 10 7d 	add    %ah,0x7d100000(%ecx,%ecx,1)
  30f91e:	ff                   	(bad)  
  30f91f:	ff 68 00             	ljmp   *0x0(%eax)
  30f922:	00 00                	add    %al,(%eax)
  30f924:	00 41 0e             	add    %al,0xe(%ecx)
  30f927:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f92d:	02 64 c5 0c          	add    0xc(%ebp,%eax,8),%ah
  30f931:	04 04                	add    $0x4,%al
  30f933:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f936:	00 00                	add    %al,(%eax)
  30f938:	c4 09                	les    (%ecx),%ecx
  30f93a:	00 00                	add    %al,(%eax)
  30f93c:	58                   	pop    %eax
  30f93d:	7d ff                	jge    30f93e <_upperDigits+0xb4e>
  30f93f:	ff a9 00 00 00 00    	ljmp   *0x0(%ecx)
  30f945:	41                   	inc    %ecx
  30f946:	0e                   	push   %cs
  30f947:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f94d:	02 a5 c5 0c 04 04    	add    0x4040cc5(%ebp),%ah
  30f953:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30f956:	00 00                	add    %al,(%eax)
  30f958:	e4 09                	in     $0x9,%al
  30f95a:	00 00                	add    %al,(%eax)
  30f95c:	e1 7d                	loope  30f9db <_upperDigits+0xbeb>
  30f95e:	ff                   	(bad)  
  30f95f:	ff 2e                	ljmp   *(%esi)
  30f961:	02 00                	add    (%eax),%al
  30f963:	00 00                	add    %al,(%eax)
  30f965:	41                   	inc    %ecx
  30f966:	0e                   	push   %cs
  30f967:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f96d:	03 2a                	add    (%edx),%ebp
  30f96f:	02 c5                	add    %ch,%al
  30f971:	0c 04                	or     $0x4,%al
  30f973:	04 28                	add    $0x28,%al
  30f975:	00 00                	add    %al,(%eax)
  30f977:	00 04 0a             	add    %al,(%edx,%ecx,1)
  30f97a:	00 00                	add    %al,(%eax)
  30f97c:	ef                   	out    %eax,(%dx)
  30f97d:	7f ff                	jg     30f97e <_upperDigits+0xb8e>
  30f97f:	ff 36                	pushl  (%esi)
  30f981:	00 00                	add    %al,(%eax)
  30f983:	00 00                	add    %al,(%eax)
  30f985:	41                   	inc    %ecx
  30f986:	0e                   	push   %cs
  30f987:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f98d:	46                   	inc    %esi
  30f98e:	87 03                	xchg   %eax,(%ebx)
  30f990:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f993:	05 69 c3 41 c6       	add    $0xc641c369,%eax
  30f998:	41                   	inc    %ecx
  30f999:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30f9a0:	1c 00                	sbb    $0x0,%al
  30f9a2:	00 00                	add    %al,(%eax)
  30f9a4:	30 0a                	xor    %cl,(%edx)
  30f9a6:	00 00                	add    %al,(%eax)
  30f9a8:	f9                   	stc    
  30f9a9:	7f ff                	jg     30f9aa <_upperDigits+0xbba>
  30f9ab:	ff 12                	call   *(%edx)
  30f9ad:	00 00                	add    %al,(%eax)
  30f9af:	00 00                	add    %al,(%eax)
  30f9b1:	41                   	inc    %ecx
  30f9b2:	0e                   	push   %cs
  30f9b3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f9b9:	4e                   	dec    %esi
  30f9ba:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f9bd:	04 00                	add    $0x0,%al
  30f9bf:	00 28                	add    %ch,(%eax)
  30f9c1:	00 00                	add    %al,(%eax)
  30f9c3:	00 50 0a             	add    %dl,0xa(%eax)
  30f9c6:	00 00                	add    %al,(%eax)
  30f9c8:	eb 7f                	jmp    30fa49 <_upperDigits+0xc59>
  30f9ca:	ff                   	(bad)  
  30f9cb:	ff 9b 00 00 00 00    	lcall  *0x0(%ebx)
  30f9d1:	41                   	inc    %ecx
  30f9d2:	0e                   	push   %cs
  30f9d3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30f9d9:	46                   	inc    %esi
  30f9da:	87 03                	xchg   %eax,(%ebx)
  30f9dc:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30f9df:	05 02 8e c3 41       	add    $0x41c38e02,%eax
  30f9e4:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  30f9e8:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30f9eb:	04 1c                	add    $0x1c,%al
  30f9ed:	00 00                	add    %al,(%eax)
  30f9ef:	00 7c 0a 00          	add    %bh,0x0(%edx,%ecx,1)
  30f9f3:	00 5a 80             	add    %bl,-0x80(%edx)
  30f9f6:	ff                   	(bad)  
  30f9f7:	ff 17                	call   *(%edi)
  30f9f9:	00 00                	add    %al,(%eax)
  30f9fb:	00 00                	add    %al,(%eax)
  30f9fd:	41                   	inc    %ecx
  30f9fe:	0e                   	push   %cs
  30f9ff:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fa05:	53                   	push   %ebx
  30fa06:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fa09:	04 00                	add    $0x0,%al
  30fa0b:	00 28                	add    %ch,(%eax)
  30fa0d:	00 00                	add    %al,(%eax)
  30fa0f:	00 9c 0a 00 00 54 80 	add    %bl,-0x7fac0000(%edx,%ecx,1)
  30fa16:	ff                   	(bad)  
  30fa17:	ff 34 00             	pushl  (%eax,%eax,1)
  30fa1a:	00 00                	add    %al,(%eax)
  30fa1c:	00 44 0c 01          	add    %al,0x1(%esp,%ecx,1)
  30fa20:	00 47 10             	add    %al,0x10(%edi)
  30fa23:	05 02 75 00 43       	add    $0x43007502,%eax
  30fa28:	0f 03 75 7c          	lsl    0x7c(%ebp),%esi
  30fa2c:	06                   	push   %es
  30fa2d:	61                   	popa   
  30fa2e:	c1 0c 01 00          	rorl   $0x0,(%ecx,%eax,1)
  30fa32:	41                   	inc    %ecx
  30fa33:	c5 43 0c             	lds    0xc(%ebx),%eax
  30fa36:	04 04                	add    $0x4,%al
  30fa38:	28 00                	sub    %al,(%eax)
  30fa3a:	00 00                	add    %al,(%eax)
  30fa3c:	c8 0a 00 00          	enter  $0xa,$0x0
  30fa40:	5c                   	pop    %esp
  30fa41:	80 ff ff             	cmp    $0xff,%bh
  30fa44:	20 00                	and    %al,(%eax)
  30fa46:	00 00                	add    %al,(%eax)
  30fa48:	00 41 0e             	add    %al,0xe(%ecx)
  30fa4b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fa51:	43                   	inc    %ebx
  30fa52:	87 03                	xchg   %eax,(%ebx)
  30fa54:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30fa57:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  30fa5c:	41                   	inc    %ecx
  30fa5d:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30fa64:	1c 00                	sbb    $0x0,%al
  30fa66:	00 00                	add    %al,(%eax)
  30fa68:	f4                   	hlt    
  30fa69:	0a 00                	or     (%eax),%al
  30fa6b:	00 50 80             	add    %dl,-0x80(%eax)
  30fa6e:	ff                   	(bad)  
  30fa6f:	ff 66 00             	jmp    *0x0(%esi)
  30fa72:	00 00                	add    %al,(%eax)
  30fa74:	00 41 0e             	add    %al,0xe(%ecx)
  30fa77:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fa7d:	02 62 c5             	add    -0x3b(%edx),%ah
  30fa80:	0c 04                	or     $0x4,%al
  30fa82:	04 00                	add    $0x0,%al
  30fa84:	1c 00                	sbb    $0x0,%al
  30fa86:	00 00                	add    %al,(%eax)
  30fa88:	14 0b                	adc    $0xb,%al
  30fa8a:	00 00                	add    %al,(%eax)
  30fa8c:	96                   	xchg   %eax,%esi
  30fa8d:	80 ff ff             	cmp    $0xff,%bh
  30fa90:	2f                   	das    
  30fa91:	00 00                	add    %al,(%eax)
  30fa93:	00 00                	add    %al,(%eax)
  30fa95:	41                   	inc    %ecx
  30fa96:	0e                   	push   %cs
  30fa97:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fa9d:	6b c5 0c             	imul   $0xc,%ebp,%eax
  30faa0:	04 04                	add    $0x4,%al
  30faa2:	00 00                	add    %al,(%eax)
  30faa4:	1c 00                	sbb    $0x0,%al
  30faa6:	00 00                	add    %al,(%eax)
  30faa8:	34 0b                	xor    $0xb,%al
  30faaa:	00 00                	add    %al,(%eax)
  30faac:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  30faad:	80 ff ff             	cmp    $0xff,%bh
  30fab0:	3c 00                	cmp    $0x0,%al
  30fab2:	00 00                	add    %al,(%eax)
  30fab4:	00 41 0e             	add    %al,0xe(%ecx)
  30fab7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fabd:	78 c5                	js     30fa84 <_upperDigits+0xc94>
  30fabf:	0c 04                	or     $0x4,%al
  30fac1:	04 00                	add    $0x0,%al
  30fac3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30fac6:	00 00                	add    %al,(%eax)
  30fac8:	54                   	push   %esp
  30fac9:	0b 00                	or     (%eax),%eax
  30facb:	00 c1                	add    %al,%cl
  30facd:	80 ff ff             	cmp    $0xff,%bh
  30fad0:	61                   	popa   
  30fad1:	00 00                	add    %al,(%eax)
  30fad3:	00 00                	add    %al,(%eax)
  30fad5:	41                   	inc    %ecx
  30fad6:	0e                   	push   %cs
  30fad7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fadd:	02 5d c5             	add    -0x3b(%ebp),%bl
  30fae0:	0c 04                	or     $0x4,%al
  30fae2:	04 00                	add    $0x0,%al
  30fae4:	1c 00                	sbb    $0x0,%al
  30fae6:	00 00                	add    %al,(%eax)
  30fae8:	74 0b                	je     30faf5 <_upperDigits+0xd05>
  30faea:	00 00                	add    %al,(%eax)
  30faec:	04 81                	add    $0x81,%al
  30faee:	ff                   	(bad)  
  30faef:	ff 63 00             	jmp    *0x0(%ebx)
  30faf2:	00 00                	add    %al,(%eax)
  30faf4:	00 41 0e             	add    %al,0xe(%ecx)
  30faf7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fafd:	02 5f c5             	add    -0x3b(%edi),%bl
  30fb00:	0c 04                	or     $0x4,%al
  30fb02:	04 00                	add    $0x0,%al
  30fb04:	1c 00                	sbb    $0x0,%al
  30fb06:	00 00                	add    %al,(%eax)
  30fb08:	94                   	xchg   %eax,%esp
  30fb09:	0b 00                	or     (%eax),%eax
  30fb0b:	00 47 81             	add    %al,-0x7f(%edi)
  30fb0e:	ff                   	(bad)  
  30fb0f:	ff 6c 01 00          	ljmp   *0x0(%ecx,%eax,1)
  30fb13:	00 00                	add    %al,(%eax)
  30fb15:	41                   	inc    %ecx
  30fb16:	0e                   	push   %cs
  30fb17:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fb1d:	03 68 01             	add    0x1(%eax),%ebp
  30fb20:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fb23:	04 1c                	add    $0x1c,%al
  30fb25:	00 00                	add    %al,(%eax)
  30fb27:	00 b4 0b 00 00 93 82 	add    %dh,-0x7d6d0000(%ebx,%ecx,1)
  30fb2e:	ff                   	(bad)  
  30fb2f:	ff 62 01             	jmp    *0x1(%edx)
  30fb32:	00 00                	add    %al,(%eax)
  30fb34:	00 41 0e             	add    %al,0xe(%ecx)
  30fb37:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fb3d:	03 5e 01             	add    0x1(%esi),%ebx
  30fb40:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fb43:	04 24                	add    $0x24,%al
  30fb45:	00 00                	add    %al,(%eax)
  30fb47:	00 d4                	add    %dl,%ah
  30fb49:	0b 00                	or     (%eax),%eax
  30fb4b:	00 d8                	add    %bl,%al
  30fb4d:	83 ff ff             	cmp    $0xffffffff,%edi
  30fb50:	1d 00 00 00 00       	sbb    $0x0,%eax
  30fb55:	41                   	inc    %ecx
  30fb56:	0e                   	push   %cs
  30fb57:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fb5d:	42                   	inc    %edx
  30fb5e:	87 03                	xchg   %eax,(%ebx)
  30fb60:	86 04 55 c6 41 c7 41 	xchg   %al,0x41c741c6(,%edx,2)
  30fb67:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fb6a:	04 00                	add    $0x0,%al
  30fb6c:	28 00                	sub    %al,(%eax)
  30fb6e:	00 00                	add    %al,(%eax)
  30fb70:	fc                   	cld    
  30fb71:	0b 00                	or     (%eax),%eax
  30fb73:	00 cd                	add    %cl,%ch
  30fb75:	83 ff ff             	cmp    $0xffffffff,%edi
  30fb78:	20 00                	and    %al,(%eax)
  30fb7a:	00 00                	add    %al,(%eax)
  30fb7c:	00 41 0e             	add    %al,0xe(%ecx)
  30fb7f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fb85:	43                   	inc    %ebx
  30fb86:	87 03                	xchg   %eax,(%ebx)
  30fb88:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30fb8b:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  30fb90:	41                   	inc    %ecx
  30fb91:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30fb98:	1c 00                	sbb    $0x0,%al
  30fb9a:	00 00                	add    %al,(%eax)
  30fb9c:	28 0c 00             	sub    %cl,(%eax,%eax,1)
  30fb9f:	00 c1                	add    %al,%cl
  30fba1:	83 ff ff             	cmp    $0xffffffff,%edi
  30fba4:	54                   	push   %esp
  30fba5:	00 00                	add    %al,(%eax)
  30fba7:	00 00                	add    %al,(%eax)
  30fba9:	41                   	inc    %ecx
  30fbaa:	0e                   	push   %cs
  30fbab:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fbb1:	02 50 c5             	add    -0x3b(%eax),%dl
  30fbb4:	0c 04                	or     $0x4,%al
  30fbb6:	04 00                	add    $0x0,%al
  30fbb8:	24 00                	and    $0x0,%al
  30fbba:	00 00                	add    %al,(%eax)
  30fbbc:	48                   	dec    %eax
  30fbbd:	0c 00                	or     $0x0,%al
  30fbbf:	00 f5                	add    %dh,%ch
  30fbc1:	83 ff ff             	cmp    $0xffffffff,%edi
  30fbc4:	ce                   	into   
  30fbc5:	00 00                	add    %al,(%eax)
  30fbc7:	00 00                	add    %al,(%eax)
  30fbc9:	41                   	inc    %ecx
  30fbca:	0e                   	push   %cs
  30fbcb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fbd1:	45                   	inc    %ebp
  30fbd2:	87 03                	xchg   %eax,(%ebx)
  30fbd4:	86 04 02             	xchg   %al,(%edx,%eax,1)
  30fbd7:	c3                   	ret    
  30fbd8:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  30fbdc:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fbdf:	04 1c                	add    $0x1c,%al
  30fbe1:	00 00                	add    %al,(%eax)
  30fbe3:	00 70 0c             	add    %dh,0xc(%eax)
  30fbe6:	00 00                	add    %al,(%eax)
  30fbe8:	9b                   	fwait
  30fbe9:	84 ff                	test   %bh,%bh
  30fbeb:	ff 22                	jmp    *(%edx)
  30fbed:	00 00                	add    %al,(%eax)
  30fbef:	00 00                	add    %al,(%eax)
  30fbf1:	41                   	inc    %ecx
  30fbf2:	0e                   	push   %cs
  30fbf3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fbf9:	5e                   	pop    %esi
  30fbfa:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fbfd:	04 00                	add    $0x0,%al
  30fbff:	00 24 00             	add    %ah,(%eax,%eax,1)
  30fc02:	00 00                	add    %al,(%eax)
  30fc04:	90                   	nop
  30fc05:	0c 00                	or     $0x0,%al
  30fc07:	00 9d 84 ff ff a5    	add    %bl,-0x5a00007c(%ebp)
  30fc0d:	00 00                	add    %al,(%eax)
  30fc0f:	00 00                	add    %al,(%eax)
  30fc11:	41                   	inc    %ecx
  30fc12:	0e                   	push   %cs
  30fc13:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fc19:	45                   	inc    %ebp
  30fc1a:	87 03                	xchg   %eax,(%ebx)
  30fc1c:	86 04 02             	xchg   %al,(%edx,%eax,1)
  30fc1f:	9a c6 41 c7 41 c5 0c 	lcall  $0xcc5,$0x41c741c6
  30fc26:	04 04                	add    $0x4,%al
  30fc28:	28 00                	sub    %al,(%eax)
  30fc2a:	00 00                	add    %al,(%eax)
  30fc2c:	b8 0c 00 00 1a       	mov    $0x1a00000c,%eax
  30fc31:	85 ff                	test   %edi,%edi
  30fc33:	ff e6                	jmp    *%esi
  30fc35:	00 00                	add    %al,(%eax)
  30fc37:	00 00                	add    %al,(%eax)
  30fc39:	41                   	inc    %ecx
  30fc3a:	0e                   	push   %cs
  30fc3b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fc41:	46                   	inc    %esi
  30fc42:	87 03                	xchg   %eax,(%ebx)
  30fc44:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30fc47:	05 02 d9 c3 41       	add    $0x41c3d902,%eax
  30fc4c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  30fc50:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fc53:	04 1c                	add    $0x1c,%al
  30fc55:	00 00                	add    %al,(%eax)
  30fc57:	00 e4                	add    %ah,%ah
  30fc59:	0c 00                	or     $0x0,%al
  30fc5b:	00 d4                	add    %dl,%ah
  30fc5d:	85 ff                	test   %edi,%edi
  30fc5f:	ff b3 00 00 00 00    	pushl  0x0(%ebx)
  30fc65:	41                   	inc    %ecx
  30fc66:	0e                   	push   %cs
  30fc67:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fc6d:	02 af c5 0c 04 04    	add    0x4040cc5(%edi),%ch
  30fc73:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30fc76:	00 00                	add    %al,(%eax)
  30fc78:	04 0d                	add    $0xd,%al
  30fc7a:	00 00                	add    %al,(%eax)
  30fc7c:	67 86 ff             	addr16 xchg %bh,%bh
  30fc7f:	ff de                	lcall  *<internal disassembler error>
  30fc81:	00 00                	add    %al,(%eax)
  30fc83:	00 00                	add    %al,(%eax)
  30fc85:	41                   	inc    %ecx
  30fc86:	0e                   	push   %cs
  30fc87:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fc8d:	02 da                	add    %dl,%bl
  30fc8f:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fc92:	04 00                	add    $0x0,%al
  30fc94:	28 00                	sub    %al,(%eax)
  30fc96:	00 00                	add    %al,(%eax)
  30fc98:	24 0d                	and    $0xd,%al
  30fc9a:	00 00                	add    %al,(%eax)
  30fc9c:	25 87 ff ff da       	and    $0xdaffff87,%eax
  30fca1:	00 00                	add    %al,(%eax)
  30fca3:	00 00                	add    %al,(%eax)
  30fca5:	41                   	inc    %ecx
  30fca6:	0e                   	push   %cs
  30fca7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fcad:	46                   	inc    %esi
  30fcae:	87 03                	xchg   %eax,(%ebx)
  30fcb0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30fcb3:	05 02 cd c3 41       	add    $0x41c3cd02,%eax
  30fcb8:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  30fcbc:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fcbf:	04 1c                	add    $0x1c,%al
  30fcc1:	00 00                	add    %al,(%eax)
  30fcc3:	00 50 0d             	add    %dl,0xd(%eax)
  30fcc6:	00 00                	add    %al,(%eax)
  30fcc8:	d3 87 ff ff a1 00    	roll   %cl,0xa1ffff(%edi)
  30fcce:	00 00                	add    %al,(%eax)
  30fcd0:	00 41 0e             	add    %al,0xe(%ecx)
  30fcd3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fcd9:	02 9d c5 0c 04 04    	add    0x4040cc5(%ebp),%bl
  30fcdf:	00 28                	add    %ch,(%eax)
  30fce1:	00 00                	add    %al,(%eax)
  30fce3:	00 70 0d             	add    %dh,0xd(%eax)
  30fce6:	00 00                	add    %al,(%eax)
  30fce8:	54                   	push   %esp
  30fce9:	88 ff                	mov    %bh,%bh
  30fceb:	ff                   	(bad)  
  30fcec:	7d 00                	jge    30fcee <_upperDigits+0xefe>
  30fcee:	00 00                	add    %al,(%eax)
  30fcf0:	00 41 0e             	add    %al,0xe(%ecx)
  30fcf3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fcf9:	46                   	inc    %esi
  30fcfa:	87 03                	xchg   %eax,(%ebx)
  30fcfc:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30fcff:	05 02 70 c3 41       	add    $0x41c37002,%eax
  30fd04:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  30fd08:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fd0b:	04 28                	add    $0x28,%al
  30fd0d:	00 00                	add    %al,(%eax)
  30fd0f:	00 9c 0d 00 00 a5 88 	add    %bl,-0x775b0000(%ebp,%ecx,1)
  30fd16:	ff                   	(bad)  
  30fd17:	ff 82 01 00 00 00    	incl   0x1(%edx)
  30fd1d:	41                   	inc    %ecx
  30fd1e:	0e                   	push   %cs
  30fd1f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fd25:	45                   	inc    %ebp
  30fd26:	87 03                	xchg   %eax,(%ebx)
  30fd28:	86 04 03             	xchg   %al,(%ebx,%eax,1)
  30fd2b:	77 01                	ja     30fd2e <_upperDigits+0xf3e>
  30fd2d:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  30fd31:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fd34:	04 00                	add    $0x0,%al
  30fd36:	00 00                	add    %al,(%eax)
  30fd38:	28 00                	sub    %al,(%eax)
  30fd3a:	00 00                	add    %al,(%eax)
  30fd3c:	c8 0d 00 00          	enter  $0xd,$0x0
  30fd40:	fb                   	sti    
  30fd41:	89 ff                	mov    %edi,%edi
  30fd43:	ff                   	(bad)  
  30fd44:	3c 01                	cmp    $0x1,%al
  30fd46:	00 00                	add    %al,(%eax)
  30fd48:	00 41 0e             	add    %al,0xe(%ecx)
  30fd4b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fd51:	45                   	inc    %ebp
  30fd52:	87 03                	xchg   %eax,(%ebx)
  30fd54:	86 04 03             	xchg   %al,(%ebx,%eax,1)
  30fd57:	31 01                	xor    %eax,(%ecx)
  30fd59:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  30fd5d:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fd60:	04 00                	add    $0x0,%al
  30fd62:	00 00                	add    %al,(%eax)
  30fd64:	28 00                	sub    %al,(%eax)
  30fd66:	00 00                	add    %al,(%eax)
  30fd68:	f4                   	hlt    
  30fd69:	0d 00 00 0b 8b       	or     $0x8b0b0000,%eax
  30fd6e:	ff                   	(bad)  
  30fd6f:	ff 06                	incl   (%esi)
  30fd71:	01 00                	add    %eax,(%eax)
  30fd73:	00 00                	add    %al,(%eax)
  30fd75:	41                   	inc    %ecx
  30fd76:	0e                   	push   %cs
  30fd77:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fd7d:	46                   	inc    %esi
  30fd7e:	87 03                	xchg   %eax,(%ebx)
  30fd80:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30fd83:	05 02 f9 c3 41       	add    $0x41c3f902,%eax
  30fd88:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  30fd8c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fd8f:	04 1c                	add    $0x1c,%al
  30fd91:	00 00                	add    %al,(%eax)
  30fd93:	00 20                	add    %ah,(%eax)
  30fd95:	0e                   	push   %cs
  30fd96:	00 00                	add    %al,(%eax)
  30fd98:	e5 8b                	in     $0x8b,%eax
  30fd9a:	ff                   	(bad)  
  30fd9b:	ff 4e 00             	decl   0x0(%esi)
  30fd9e:	00 00                	add    %al,(%eax)
  30fda0:	00 41 0e             	add    %al,0xe(%ecx)
  30fda3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fda9:	02 4a c5             	add    -0x3b(%edx),%cl
  30fdac:	0c 04                	or     $0x4,%al
  30fdae:	04 00                	add    $0x0,%al
  30fdb0:	1c 00                	sbb    $0x0,%al
  30fdb2:	00 00                	add    %al,(%eax)
  30fdb4:	40                   	inc    %eax
  30fdb5:	0e                   	push   %cs
  30fdb6:	00 00                	add    %al,(%eax)
  30fdb8:	13 8c ff ff f3 00 00 	adc    0xf3ff(%edi,%edi,8),%ecx
  30fdbf:	00 00                	add    %al,(%eax)
  30fdc1:	41                   	inc    %ecx
  30fdc2:	0e                   	push   %cs
  30fdc3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fdc9:	02 ef                	add    %bh,%ch
  30fdcb:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fdce:	04 00                	add    $0x0,%al
  30fdd0:	28 00                	sub    %al,(%eax)
  30fdd2:	00 00                	add    %al,(%eax)
  30fdd4:	60                   	pusha  
  30fdd5:	0e                   	push   %cs
  30fdd6:	00 00                	add    %al,(%eax)
  30fdd8:	e6 8c                	out    %al,$0x8c
  30fdda:	ff                   	(bad)  
  30fddb:	ff db                	lcall  *<internal disassembler error>
  30fddd:	00 00                	add    %al,(%eax)
  30fddf:	00 00                	add    %al,(%eax)
  30fde1:	41                   	inc    %ecx
  30fde2:	0e                   	push   %cs
  30fde3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fde9:	46                   	inc    %esi
  30fdea:	87 03                	xchg   %eax,(%ebx)
  30fdec:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30fdef:	05 02 ce c3 41       	add    $0x41c3ce02,%eax
  30fdf4:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  30fdf8:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fdfb:	04 1c                	add    $0x1c,%al
  30fdfd:	00 00                	add    %al,(%eax)
  30fdff:	00 8c 0e 00 00 95 8d 	add    %cl,-0x726b0000(%esi,%ecx,1)
  30fe06:	ff                   	(bad)  
  30fe07:	ff 05 00 00 00 00    	incl   0x0
  30fe0d:	41                   	inc    %ecx
  30fe0e:	0e                   	push   %cs
  30fe0f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fe15:	41                   	inc    %ecx
  30fe16:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fe19:	04 00                	add    $0x0,%al
  30fe1b:	00 24 00             	add    %ah,(%eax,%eax,1)
  30fe1e:	00 00                	add    %al,(%eax)
  30fe20:	ac                   	lods   %ds:(%esi),%al
  30fe21:	0e                   	push   %cs
  30fe22:	00 00                	add    %al,(%eax)
  30fe24:	7a 8d                	jp     30fdb3 <_upperDigits+0xfc3>
  30fe26:	ff                   	(bad)  
  30fe27:	ff c6                	inc    %esi
  30fe29:	00 00                	add    %al,(%eax)
  30fe2b:	00 00                	add    %al,(%eax)
  30fe2d:	41                   	inc    %ecx
  30fe2e:	0e                   	push   %cs
  30fe2f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fe35:	45                   	inc    %ebp
  30fe36:	87 03                	xchg   %eax,(%ebx)
  30fe38:	86 04 02             	xchg   %al,(%edx,%eax,1)
  30fe3b:	bb c6 41 c7 41       	mov    $0x41c741c6,%ebx
  30fe40:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fe43:	04 24                	add    $0x24,%al
  30fe45:	00 00                	add    %al,(%eax)
  30fe47:	00 d4                	add    %dl,%ah
  30fe49:	0e                   	push   %cs
  30fe4a:	00 00                	add    %al,(%eax)
  30fe4c:	18 8e ff ff f2 00    	sbb    %cl,0xf2ffff(%esi)
  30fe52:	00 00                	add    %al,(%eax)
  30fe54:	00 41 0e             	add    %al,0xe(%ecx)
  30fe57:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fe5d:	45                   	inc    %ebp
  30fe5e:	87 03                	xchg   %eax,(%ebx)
  30fe60:	83 04 02 e7          	addl   $0xffffffe7,(%edx,%eax,1)
  30fe64:	c3                   	ret    
  30fe65:	41                   	inc    %ecx
  30fe66:	c7 41 c5 0c 04 04 2c 	movl   $0x2c04040c,-0x3b(%ecx)
  30fe6d:	00 00                	add    %al,(%eax)
  30fe6f:	00 fc                	add    %bh,%ah
  30fe71:	0e                   	push   %cs
  30fe72:	00 00                	add    %al,(%eax)
  30fe74:	e2 8e                	loop   30fe04 <_upperDigits+0x1014>
  30fe76:	ff                   	(bad)  
  30fe77:	ff 28                	ljmp   *(%eax)
  30fe79:	01 00                	add    %eax,(%eax)
  30fe7b:	00 00                	add    %al,(%eax)
  30fe7d:	41                   	inc    %ecx
  30fe7e:	0e                   	push   %cs
  30fe7f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fe85:	46                   	inc    %esi
  30fe86:	87 03                	xchg   %eax,(%ebx)
  30fe88:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30fe8b:	05 03 1b 01 c3       	add    $0xc3011b03,%eax
  30fe90:	41                   	inc    %ecx
  30fe91:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  30fe95:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fe98:	04 00                	add    $0x0,%al
  30fe9a:	00 00                	add    %al,(%eax)
  30fe9c:	1c 00                	sbb    $0x0,%al
  30fe9e:	00 00                	add    %al,(%eax)
  30fea0:	2c 0f                	sub    $0xf,%al
  30fea2:	00 00                	add    %al,(%eax)
  30fea4:	da 8f ff ff 17 00    	fimull 0x17ffff(%edi)
  30feaa:	00 00                	add    %al,(%eax)
  30feac:	00 41 0e             	add    %al,0xe(%ecx)
  30feaf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30feb5:	53                   	push   %ebx
  30feb6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30feb9:	04 00                	add    $0x0,%al
  30febb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30febe:	00 00                	add    %al,(%eax)
  30fec0:	4c                   	dec    %esp
  30fec1:	0f 00 00             	sldt   (%eax)
  30fec4:	d4 8f                	aam    $0x8f
  30fec6:	ff                   	(bad)  
  30fec7:	ff 16                	call   *(%esi)
  30fec9:	00 00                	add    %al,(%eax)
  30fecb:	00 00                	add    %al,(%eax)
  30fecd:	41                   	inc    %ecx
  30fece:	0e                   	push   %cs
  30fecf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fed5:	52                   	push   %edx
  30fed6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30fed9:	04 00                	add    $0x0,%al
  30fedb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30fede:	00 00                	add    %al,(%eax)
  30fee0:	6c                   	insb   (%dx),%es:(%edi)
  30fee1:	0f 00 00             	sldt   (%eax)
  30fee4:	ca 8f ff             	lret   $0xff8f
  30fee7:	ff 27                	jmp    *(%edi)
  30fee9:	00 00                	add    %al,(%eax)
  30feeb:	00 00                	add    %al,(%eax)
  30feed:	41                   	inc    %ecx
  30feee:	0e                   	push   %cs
  30feef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30fef5:	63 c5                	arpl   %ax,%bp
  30fef7:	0c 04                	or     $0x4,%al
  30fef9:	04 00                	add    $0x0,%al
  30fefb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30fefe:	00 00                	add    %al,(%eax)
  30ff00:	8c 0f                	mov    %cs,(%edi)
  30ff02:	00 00                	add    %al,(%eax)
  30ff04:	d1 8f ff ff 19 00    	rorl   0x19ffff(%edi)
  30ff0a:	00 00                	add    %al,(%eax)
  30ff0c:	00 41 0e             	add    %al,0xe(%ecx)
  30ff0f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30ff15:	55                   	push   %ebp
  30ff16:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30ff19:	04 00                	add    $0x0,%al
  30ff1b:	00 24 00             	add    %ah,(%eax,%eax,1)
  30ff1e:	00 00                	add    %al,(%eax)
  30ff20:	ac                   	lods   %ds:(%esi),%al
  30ff21:	0f 00 00             	sldt   (%eax)
  30ff24:	ca 8f ff             	lret   $0xff8f
  30ff27:	ff 1d 00 00 00 00    	lcall  *0x0
  30ff2d:	41                   	inc    %ecx
  30ff2e:	0e                   	push   %cs
  30ff2f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30ff35:	42                   	inc    %edx
  30ff36:	87 03                	xchg   %eax,(%ebx)
  30ff38:	86 04 55 c6 41 c7 41 	xchg   %al,0x41c741c6(,%edx,2)
  30ff3f:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30ff42:	04 00                	add    $0x0,%al
  30ff44:	28 00                	sub    %al,(%eax)
  30ff46:	00 00                	add    %al,(%eax)
  30ff48:	d4 0f                	aam    $0xf
  30ff4a:	00 00                	add    %al,(%eax)
  30ff4c:	bf 8f ff ff 2c       	mov    $0x2cffff8f,%edi
  30ff51:	00 00                	add    %al,(%eax)
  30ff53:	00 00                	add    %al,(%eax)
  30ff55:	41                   	inc    %ecx
  30ff56:	0e                   	push   %cs
  30ff57:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30ff5d:	43                   	inc    %ebx
  30ff5e:	87 03                	xchg   %eax,(%ebx)
  30ff60:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  30ff63:	05 62 c3 41 c6       	add    $0xc641c362,%eax
  30ff68:	41                   	inc    %ecx
  30ff69:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  30ff70:	1c 00                	sbb    $0x0,%al
  30ff72:	00 00                	add    %al,(%eax)
  30ff74:	00 10                	add    %dl,(%eax)
  30ff76:	00 00                	add    %al,(%eax)
  30ff78:	bf 8f ff ff 5a       	mov    $0x5affff8f,%edi
  30ff7d:	03 00                	add    (%eax),%eax
  30ff7f:	00 00                	add    %al,(%eax)
  30ff81:	41                   	inc    %ecx
  30ff82:	0e                   	push   %cs
  30ff83:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30ff89:	03 56 03             	add    0x3(%esi),%edx
  30ff8c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30ff8f:	04 1c                	add    $0x1c,%al
  30ff91:	00 00                	add    %al,(%eax)
  30ff93:	00 20                	add    %ah,(%eax)
  30ff95:	10 00                	adc    %al,(%eax)
  30ff97:	00 f9                	add    %bh,%cl
  30ff99:	92                   	xchg   %eax,%edx
  30ff9a:	ff                   	(bad)  
  30ff9b:	ff 8c 00 00 00 00 41 	decl   0x41000000(%eax,%eax,1)
  30ffa2:	0e                   	push   %cs
  30ffa3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30ffa9:	02 88 c5 0c 04 04    	add    0x4040cc5(%eax),%cl
  30ffaf:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30ffb2:	00 00                	add    %al,(%eax)
  30ffb4:	40                   	inc    %eax
  30ffb5:	10 00                	adc    %al,(%eax)
  30ffb7:	00 65 93             	add    %ah,-0x6d(%ebp)
  30ffba:	ff                   	(bad)  
  30ffbb:	ff 18                	lcall  *(%eax)
  30ffbd:	00 00                	add    %al,(%eax)
  30ffbf:	00 00                	add    %al,(%eax)
  30ffc1:	41                   	inc    %ecx
  30ffc2:	0e                   	push   %cs
  30ffc3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30ffc9:	54                   	push   %esp
  30ffca:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  30ffcd:	04 00                	add    $0x0,%al
  30ffcf:	00 1c 00             	add    %bl,(%eax,%eax,1)
  30ffd2:	00 00                	add    %al,(%eax)
  30ffd4:	60                   	pusha  
  30ffd5:	10 00                	adc    %al,(%eax)
  30ffd7:	00 5d 93             	add    %bl,-0x6d(%ebp)
  30ffda:	ff                   	(bad)  
  30ffdb:	ff 54 00 00          	call   *0x0(%eax,%eax,1)
  30ffdf:	00 00                	add    %al,(%eax)
  30ffe1:	41                   	inc    %ecx
  30ffe2:	0e                   	push   %cs
  30ffe3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  30ffe9:	02 50 c5             	add    -0x3b(%eax),%dl
  30ffec:	0c 04                	or     $0x4,%al
  30ffee:	04 00                	add    $0x0,%al
  30fff0:	1c 00                	sbb    $0x0,%al
  30fff2:	00 00                	add    %al,(%eax)
  30fff4:	80 10 00             	adcb   $0x0,(%eax)
  30fff7:	00 91 93 ff ff 53    	add    %dl,0x53ffff93(%ecx)
  30fffd:	01 00                	add    %eax,(%eax)
  30ffff:	00 00                	add    %al,(%eax)
  310001:	41                   	inc    %ecx
  310002:	0e                   	push   %cs
  310003:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310009:	03 4f 01             	add    0x1(%edi),%ecx
  31000c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  31000f:	04 28                	add    $0x28,%al
  310011:	00 00                	add    %al,(%eax)
  310013:	00 a0 10 00 00 c4    	add    %ah,-0x3bfffff0(%eax)
  310019:	94                   	xchg   %eax,%esp
  31001a:	ff                   	(bad)  
  31001b:	ff 2d 00 00 00 00    	ljmp   *0x0
  310021:	41                   	inc    %ecx
  310022:	0e                   	push   %cs
  310023:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310029:	46                   	inc    %esi
  31002a:	87 03                	xchg   %eax,(%ebx)
  31002c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  31002f:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  310034:	41                   	inc    %ecx
  310035:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  31003c:	20 00                	and    %al,(%eax)
  31003e:	00 00                	add    %al,(%eax)
  310040:	cc                   	int3   
  310041:	10 00                	adc    %al,(%eax)
  310043:	00 c5                	add    %al,%ch
  310045:	94                   	xchg   %eax,%esp
  310046:	ff                   	(bad)  
  310047:	ff 1e                	lcall  *(%esi)
  310049:	00 00                	add    %al,(%eax)
  31004b:	00 00                	add    %al,(%eax)
  31004d:	41                   	inc    %ecx
  31004e:	0e                   	push   %cs
  31004f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310055:	41                   	inc    %ecx
  310056:	87 03                	xchg   %eax,(%ebx)
  310058:	58                   	pop    %eax
  310059:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310060:	28 00                	sub    %al,(%eax)
  310062:	00 00                	add    %al,(%eax)
  310064:	f0 10 00             	lock adc %al,(%eax)
  310067:	00 bf 94 ff ff 20    	add    %bh,0x20ffff94(%edi)
  31006d:	00 00                	add    %al,(%eax)
  31006f:	00 00                	add    %al,(%eax)
  310071:	41                   	inc    %ecx
  310072:	0e                   	push   %cs
  310073:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310079:	43                   	inc    %ebx
  31007a:	87 03                	xchg   %eax,(%ebx)
  31007c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  31007f:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  310084:	41                   	inc    %ecx
  310085:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  31008c:	1c 00                	sbb    $0x0,%al
  31008e:	00 00                	add    %al,(%eax)
  310090:	1c 11                	sbb    $0x11,%al
  310092:	00 00                	add    %al,(%eax)
  310094:	b3 94                	mov    $0x94,%bl
  310096:	ff                   	(bad)  
  310097:	ff 9e 01 00 00 00    	lcall  *0x1(%esi)
  31009d:	41                   	inc    %ecx
  31009e:	0e                   	push   %cs
  31009f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3100a5:	03 9a 01 c5 0c 04    	add    0x40cc501(%edx),%ebx
  3100ab:	04 28                	add    $0x28,%al
  3100ad:	00 00                	add    %al,(%eax)
  3100af:	00 3c 11             	add    %bh,(%ecx,%edx,1)
  3100b2:	00 00                	add    %al,(%eax)
  3100b4:	31 96 ff ff 7d 00    	xor    %edx,0x7dffff(%esi)
  3100ba:	00 00                	add    %al,(%eax)
  3100bc:	00 41 0e             	add    %al,0xe(%ecx)
  3100bf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3100c5:	46                   	inc    %esi
  3100c6:	87 03                	xchg   %eax,(%ebx)
  3100c8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  3100cb:	05 02 70 c3 41       	add    $0x41c37002,%eax
  3100d0:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  3100d4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3100d7:	04 2c                	add    $0x2c,%al
  3100d9:	00 00                	add    %al,(%eax)
  3100db:	00 68 11             	add    %ch,0x11(%eax)
  3100de:	00 00                	add    %al,(%eax)
  3100e0:	82                   	(bad)  
  3100e1:	96                   	xchg   %eax,%esi
  3100e2:	ff                   	(bad)  
  3100e3:	ff 68 02             	ljmp   *0x2(%eax)
  3100e6:	00 00                	add    %al,(%eax)
  3100e8:	00 41 0e             	add    %al,0xe(%ecx)
  3100eb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3100f1:	46                   	inc    %esi
  3100f2:	87 03                	xchg   %eax,(%ebx)
  3100f4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  3100f7:	05 03 5b 02 c3       	add    $0xc3025b03,%eax
  3100fc:	41                   	inc    %ecx
  3100fd:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310101:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310104:	04 00                	add    $0x0,%al
  310106:	00 00                	add    %al,(%eax)
  310108:	28 00                	sub    %al,(%eax)
  31010a:	00 00                	add    %al,(%eax)
  31010c:	98                   	cwtl   
  31010d:	11 00                	adc    %eax,(%eax)
  31010f:	00 ba 98 ff ff 5f    	add    %bh,0x5fffff98(%edx)
  310115:	00 00                	add    %al,(%eax)
  310117:	00 00                	add    %al,(%eax)
  310119:	41                   	inc    %ecx
  31011a:	0e                   	push   %cs
  31011b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310121:	46                   	inc    %esi
  310122:	87 03                	xchg   %eax,(%ebx)
  310124:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310127:	05 02 52 c3 41       	add    $0x41c35202,%eax
  31012c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310130:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310133:	04 28                	add    $0x28,%al
  310135:	00 00                	add    %al,(%eax)
  310137:	00 c4                	add    %al,%ah
  310139:	11 00                	adc    %eax,(%eax)
  31013b:	00 ed                	add    %ch,%ch
  31013d:	98                   	cwtl   
  31013e:	ff                   	(bad)  
  31013f:	ff 9d 00 00 00 00    	lcall  *0x0(%ebp)
  310145:	41                   	inc    %ecx
  310146:	0e                   	push   %cs
  310147:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  31014d:	46                   	inc    %esi
  31014e:	87 03                	xchg   %eax,(%ebx)
  310150:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310153:	05 02 90 c3 41       	add    $0x41c39002,%eax
  310158:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  31015c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  31015f:	04 2c                	add    $0x2c,%al
  310161:	00 00                	add    %al,(%eax)
  310163:	00 f0                	add    %dh,%al
  310165:	11 00                	adc    %eax,(%eax)
  310167:	00 5e 99             	add    %bl,-0x67(%esi)
  31016a:	ff                   	(bad)  
  31016b:	ff 94 01 00 00 00 41 	call   *0x41000000(%ecx,%eax,1)
  310172:	0e                   	push   %cs
  310173:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310179:	46                   	inc    %esi
  31017a:	87 03                	xchg   %eax,(%ebx)
  31017c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  31017f:	05 03 87 01 c3       	add    $0xc3018703,%eax
  310184:	41                   	inc    %ecx
  310185:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310189:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  31018c:	04 00                	add    $0x0,%al
  31018e:	00 00                	add    %al,(%eax)
  310190:	28 00                	sub    %al,(%eax)
  310192:	00 00                	add    %al,(%eax)
  310194:	20 12                	and    %dl,(%edx)
  310196:	00 00                	add    %al,(%eax)
  310198:	c2 9a ff             	ret    $0xff9a
  31019b:	ff 88 00 00 00 00    	decl   0x0(%eax)
  3101a1:	41                   	inc    %ecx
  3101a2:	0e                   	push   %cs
  3101a3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3101a9:	46                   	inc    %esi
  3101aa:	87 03                	xchg   %eax,(%ebx)
  3101ac:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  3101af:	05 02 7b c3 41       	add    $0x41c37b02,%eax
  3101b4:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  3101b8:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3101bb:	04 1c                	add    $0x1c,%al
  3101bd:	00 00                	add    %al,(%eax)
  3101bf:	00 4c 12 00          	add    %cl,0x0(%edx,%edx,1)
  3101c3:	00 1e                	add    %bl,(%esi)
  3101c5:	9b                   	fwait
  3101c6:	ff                   	(bad)  
  3101c7:	ff 17                	call   *(%edi)
  3101c9:	00 00                	add    %al,(%eax)
  3101cb:	00 00                	add    %al,(%eax)
  3101cd:	41                   	inc    %ecx
  3101ce:	0e                   	push   %cs
  3101cf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3101d5:	53                   	push   %ebx
  3101d6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3101d9:	04 00                	add    $0x0,%al
  3101db:	00 28                	add    %ch,(%eax)
  3101dd:	00 00                	add    %al,(%eax)
  3101df:	00 6c 12 00          	add    %ch,0x0(%edx,%edx,1)
  3101e3:	00 18                	add    %bl,(%eax)
  3101e5:	9b                   	fwait
  3101e6:	ff                   	(bad)  
  3101e7:	ff 2d 00 00 00 00    	ljmp   *0x0
  3101ed:	41                   	inc    %ecx
  3101ee:	0e                   	push   %cs
  3101ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3101f5:	46                   	inc    %esi
  3101f6:	87 03                	xchg   %eax,(%ebx)
  3101f8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  3101fb:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  310200:	41                   	inc    %ecx
  310201:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310208:	1c 00                	sbb    $0x0,%al
  31020a:	00 00                	add    %al,(%eax)
  31020c:	98                   	cwtl   
  31020d:	12 00                	adc    (%eax),%al
  31020f:	00 19                	add    %bl,(%ecx)
  310211:	9b                   	fwait
  310212:	ff                   	(bad)  
  310213:	ff                   	(bad)  
  310214:	3e 00 00             	add    %al,%ds:(%eax)
  310217:	00 00                	add    %al,(%eax)
  310219:	41                   	inc    %ecx
  31021a:	0e                   	push   %cs
  31021b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310221:	7a c5                	jp     3101e8 <_upperDigits+0x13f8>
  310223:	0c 04                	or     $0x4,%al
  310225:	04 00                	add    $0x0,%al
  310227:	00 1c 00             	add    %bl,(%eax,%eax,1)
  31022a:	00 00                	add    %al,(%eax)
  31022c:	b8 12 00 00 37       	mov    $0x37000012,%eax
  310231:	9b                   	fwait
  310232:	ff                   	(bad)  
  310233:	ff                   	(bad)  
  310234:	3a 00                	cmp    (%eax),%al
  310236:	00 00                	add    %al,(%eax)
  310238:	00 41 0e             	add    %al,0xe(%ecx)
  31023b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310241:	76 c5                	jbe    310208 <_upperDigits+0x1418>
  310243:	0c 04                	or     $0x4,%al
  310245:	04 00                	add    $0x0,%al
  310247:	00 1c 00             	add    %bl,(%eax,%eax,1)
  31024a:	00 00                	add    %al,(%eax)
  31024c:	d8 12                	fcoms  (%edx)
  31024e:	00 00                	add    %al,(%eax)
  310250:	51                   	push   %ecx
  310251:	9b                   	fwait
  310252:	ff                   	(bad)  
  310253:	ff 2d 01 00 00 00    	ljmp   *0x1
  310259:	41                   	inc    %ecx
  31025a:	0e                   	push   %cs
  31025b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310261:	03 29                	add    (%ecx),%ebp
  310263:	01 c5                	add    %eax,%ebp
  310265:	0c 04                	or     $0x4,%al
  310267:	04 1c                	add    $0x1c,%al
  310269:	00 00                	add    %al,(%eax)
  31026b:	00 f8                	add    %bh,%al
  31026d:	12 00                	adc    (%eax),%al
  31026f:	00 5e 9c             	add    %bl,-0x64(%esi)
  310272:	ff                   	(bad)  
  310273:	ff 62 00             	jmp    *0x0(%edx)
  310276:	00 00                	add    %al,(%eax)
  310278:	00 41 0e             	add    %al,0xe(%ecx)
  31027b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310281:	02 5e c5             	add    -0x3b(%esi),%bl
  310284:	0c 04                	or     $0x4,%al
  310286:	04 00                	add    $0x0,%al
  310288:	24 00                	and    $0x0,%al
  31028a:	00 00                	add    %al,(%eax)
  31028c:	18 13                	sbb    %dl,(%ebx)
  31028e:	00 00                	add    %al,(%eax)
  310290:	a0 9c ff ff 2f       	mov    0x2fffff9c,%al
  310295:	00 00                	add    %al,(%eax)
  310297:	00 00                	add    %al,(%eax)
  310299:	41                   	inc    %ecx
  31029a:	0e                   	push   %cs
  31029b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3102a1:	42                   	inc    %edx
  3102a2:	87 03                	xchg   %eax,(%ebx)
  3102a4:	86 04 67             	xchg   %al,(%edi,%eiz,2)
  3102a7:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  3102ab:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3102ae:	04 00                	add    $0x0,%al
  3102b0:	28 00                	sub    %al,(%eax)
  3102b2:	00 00                	add    %al,(%eax)
  3102b4:	40                   	inc    %eax
  3102b5:	13 00                	adc    (%eax),%eax
  3102b7:	00 a7 9c ff ff 20    	add    %ah,0x20ffff9c(%edi)
  3102bd:	00 00                	add    %al,(%eax)
  3102bf:	00 00                	add    %al,(%eax)
  3102c1:	41                   	inc    %ecx
  3102c2:	0e                   	push   %cs
  3102c3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3102c9:	43                   	inc    %ebx
  3102ca:	87 03                	xchg   %eax,(%ebx)
  3102cc:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  3102cf:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  3102d4:	41                   	inc    %ecx
  3102d5:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  3102dc:	20 00                	and    %al,(%eax)
  3102de:	00 00                	add    %al,(%eax)
  3102e0:	6c                   	insb   (%dx),%es:(%edi)
  3102e1:	13 00                	adc    (%eax),%eax
  3102e3:	00 9b 9c ff ff 25    	add    %bl,0x25ffff9c(%ebx)
  3102e9:	00 00                	add    %al,(%eax)
  3102eb:	00 00                	add    %al,(%eax)
  3102ed:	41                   	inc    %ecx
  3102ee:	0e                   	push   %cs
  3102ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3102f5:	44                   	inc    %esp
  3102f6:	87 03                	xchg   %eax,(%ebx)
  3102f8:	5c                   	pop    %esp
  3102f9:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310300:	1c 00                	sbb    $0x0,%al
  310302:	00 00                	add    %al,(%eax)
  310304:	90                   	nop
  310305:	13 00                	adc    (%eax),%eax
  310307:	00 9c 9c ff ff 5f 00 	add    %bl,0x5fffff(%esp,%ebx,4)
  31030e:	00 00                	add    %al,(%eax)
  310310:	00 41 0e             	add    %al,0xe(%ecx)
  310313:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310319:	02 5b c5             	add    -0x3b(%ebx),%bl
  31031c:	0c 04                	or     $0x4,%al
  31031e:	04 00                	add    $0x0,%al
  310320:	1c 00                	sbb    $0x0,%al
  310322:	00 00                	add    %al,(%eax)
  310324:	b0 13                	mov    $0x13,%al
  310326:	00 00                	add    %al,(%eax)
  310328:	db 9c ff ff 17 01 00 	fistpl 0x117ff(%edi,%edi,8)
  31032f:	00 00                	add    %al,(%eax)
  310331:	41                   	inc    %ecx
  310332:	0e                   	push   %cs
  310333:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310339:	03 13                	add    (%ebx),%edx
  31033b:	01 c5                	add    %eax,%ebp
  31033d:	0c 04                	or     $0x4,%al
  31033f:	04 1c                	add    $0x1c,%al
  310341:	00 00                	add    %al,(%eax)
  310343:	00 d0                	add    %dl,%al
  310345:	13 00                	adc    (%eax),%eax
  310347:	00 d2                	add    %dl,%dl
  310349:	9d                   	popf   
  31034a:	ff                   	(bad)  
  31034b:	ff 8f 00 00 00 00    	decl   0x0(%edi)
  310351:	41                   	inc    %ecx
  310352:	0e                   	push   %cs
  310353:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310359:	02 8b c5 0c 04 04    	add    0x4040cc5(%ebx),%cl
  31035f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  310362:	00 00                	add    %al,(%eax)
  310364:	f0 13 00             	lock adc (%eax),%eax
  310367:	00 44 9e ff          	add    %al,-0x1(%esi,%ebx,4)
  31036b:	ff 47 00             	incl   0x0(%edi)
  31036e:	00 00                	add    %al,(%eax)
  310370:	00 41 0e             	add    %al,0xe(%ecx)
  310373:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310379:	02 43 c5             	add    -0x3b(%ebx),%al
  31037c:	0c 04                	or     $0x4,%al
  31037e:	04 00                	add    $0x0,%al
  310380:	28 00                	sub    %al,(%eax)
  310382:	00 00                	add    %al,(%eax)
  310384:	10 14 00             	adc    %dl,(%eax,%eax,1)
  310387:	00 6c 9e ff          	add    %ch,-0x1(%esi,%ebx,4)
  31038b:	ff 20                	jmp    *(%eax)
  31038d:	00 00                	add    %al,(%eax)
  31038f:	00 00                	add    %al,(%eax)
  310391:	41                   	inc    %ecx
  310392:	0e                   	push   %cs
  310393:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310399:	43                   	inc    %ebx
  31039a:	87 03                	xchg   %eax,(%ebx)
  31039c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  31039f:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  3103a4:	41                   	inc    %ecx
  3103a5:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  3103ac:	1c 00                	sbb    $0x0,%al
  3103ae:	00 00                	add    %al,(%eax)
  3103b0:	3c 14                	cmp    $0x14,%al
  3103b2:	00 00                	add    %al,(%eax)
  3103b4:	60                   	pusha  
  3103b5:	9e                   	sahf   
  3103b6:	ff                   	(bad)  
  3103b7:	ff c4                	inc    %esp
  3103b9:	00 00                	add    %al,(%eax)
  3103bb:	00 00                	add    %al,(%eax)
  3103bd:	41                   	inc    %ecx
  3103be:	0e                   	push   %cs
  3103bf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3103c5:	02 c0                	add    %al,%al
  3103c7:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3103ca:	04 00                	add    $0x0,%al
  3103cc:	24 00                	and    $0x0,%al
  3103ce:	00 00                	add    %al,(%eax)
  3103d0:	5c                   	pop    %esp
  3103d1:	14 00                	adc    $0x0,%al
  3103d3:	00 04 9f             	add    %al,(%edi,%ebx,4)
  3103d6:	ff                   	(bad)  
  3103d7:	ff 9b 00 00 00 00    	lcall  *0x0(%ebx)
  3103dd:	41                   	inc    %ecx
  3103de:	0e                   	push   %cs
  3103df:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3103e5:	45                   	inc    %ebp
  3103e6:	87 03                	xchg   %eax,(%ebx)
  3103e8:	83 04 02 90          	addl   $0xffffff90,(%edx,%eax,1)
  3103ec:	c3                   	ret    
  3103ed:	41                   	inc    %ecx
  3103ee:	c7 41 c5 0c 04 04 24 	movl   $0x2404040c,-0x3b(%ecx)
  3103f5:	00 00                	add    %al,(%eax)
  3103f7:	00 84 14 00 00 77 9f 	add    %al,-0x60890000(%esp,%edx,1)
  3103fe:	ff                   	(bad)  
  3103ff:	ff 9b 00 00 00 00    	lcall  *0x0(%ebx)
  310405:	41                   	inc    %ecx
  310406:	0e                   	push   %cs
  310407:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  31040d:	45                   	inc    %ebp
  31040e:	86 03                	xchg   %al,(%ebx)
  310410:	83 04 02 90          	addl   $0xffffff90,(%edx,%eax,1)
  310414:	c3                   	ret    
  310415:	41                   	inc    %ecx
  310416:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  31041a:	04 04                	add    $0x4,%al
  31041c:	1c 00                	sbb    $0x0,%al
  31041e:	00 00                	add    %al,(%eax)
  310420:	ac                   	lods   %ds:(%esi),%al
  310421:	14 00                	adc    $0x0,%al
  310423:	00 ea                	add    %ch,%dl
  310425:	9f                   	lahf   
  310426:	ff                   	(bad)  
  310427:	ff                   	(bad)  
  310428:	f8                   	clc    
  310429:	01 00                	add    %eax,(%eax)
  31042b:	00 00                	add    %al,(%eax)
  31042d:	41                   	inc    %ecx
  31042e:	0e                   	push   %cs
  31042f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310435:	03 f4                	add    %esp,%esi
  310437:	01 c5                	add    %eax,%ebp
  310439:	0c 04                	or     $0x4,%al
  31043b:	04 1c                	add    $0x1c,%al
  31043d:	00 00                	add    %al,(%eax)
  31043f:	00 cc                	add    %cl,%ah
  310441:	14 00                	adc    $0x0,%al
  310443:	00 c2                	add    %al,%dl
  310445:	a1 ff ff 7d 00       	mov    0x7dffff,%eax
  31044a:	00 00                	add    %al,(%eax)
  31044c:	00 41 0e             	add    %al,0xe(%ecx)
  31044f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310455:	02 79 c5             	add    -0x3b(%ecx),%bh
  310458:	0c 04                	or     $0x4,%al
  31045a:	04 00                	add    $0x0,%al
  31045c:	1c 00                	sbb    $0x0,%al
  31045e:	00 00                	add    %al,(%eax)
  310460:	ec                   	in     (%dx),%al
  310461:	14 00                	adc    $0x0,%al
  310463:	00 1f                	add    %bl,(%edi)
  310465:	a2 ff ff 0c 01       	mov    %al,0x10cffff
  31046a:	00 00                	add    %al,(%eax)
  31046c:	00 41 0e             	add    %al,0xe(%ecx)
  31046f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310475:	03 08                	add    (%eax),%ecx
  310477:	01 c5                	add    %eax,%ebp
  310479:	0c 04                	or     $0x4,%al
  31047b:	04 1c                	add    $0x1c,%al
  31047d:	00 00                	add    %al,(%eax)
  31047f:	00 0c 15 00 00 0b a3 	add    %cl,-0x5cf50000(,%edx,1)
  310486:	ff                   	(bad)  
  310487:	ff 59 00             	lcall  *0x0(%ecx)
  31048a:	00 00                	add    %al,(%eax)
  31048c:	00 41 0e             	add    %al,0xe(%ecx)
  31048f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310495:	02 55 c5             	add    -0x3b(%ebp),%dl
  310498:	0c 04                	or     $0x4,%al
  31049a:	04 00                	add    $0x0,%al
  31049c:	1c 00                	sbb    $0x0,%al
  31049e:	00 00                	add    %al,(%eax)
  3104a0:	2c 15                	sub    $0x15,%al
  3104a2:	00 00                	add    %al,(%eax)
  3104a4:	44                   	inc    %esp
  3104a5:	a3 ff ff 3f 00       	mov    %eax,0x3fffff
  3104aa:	00 00                	add    %al,(%eax)
  3104ac:	00 41 0e             	add    %al,0xe(%ecx)
  3104af:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3104b5:	7b c5                	jnp    31047c <_upperDigits+0x168c>
  3104b7:	0c 04                	or     $0x4,%al
  3104b9:	04 00                	add    $0x0,%al
  3104bb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  3104be:	00 00                	add    %al,(%eax)
  3104c0:	4c                   	dec    %esp
  3104c1:	15 00 00 63 a3       	adc    $0xa3630000,%eax
  3104c6:	ff                   	(bad)  
  3104c7:	ff 36                	pushl  (%esi)
  3104c9:	00 00                	add    %al,(%eax)
  3104cb:	00 00                	add    %al,(%eax)
  3104cd:	41                   	inc    %ecx
  3104ce:	0e                   	push   %cs
  3104cf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3104d5:	72 c5                	jb     31049c <_upperDigits+0x16ac>
  3104d7:	0c 04                	or     $0x4,%al
  3104d9:	04 00                	add    $0x0,%al
  3104db:	00 28                	add    %ch,(%eax)
  3104dd:	00 00                	add    %al,(%eax)
  3104df:	00 6c 15 00          	add    %ch,0x0(%ebp,%edx,1)
  3104e3:	00 79 a3             	add    %bh,-0x5d(%ecx)
  3104e6:	ff                   	(bad)  
  3104e7:	ff e0                	jmp    *%eax
  3104e9:	00 00                	add    %al,(%eax)
  3104eb:	00 00                	add    %al,(%eax)
  3104ed:	41                   	inc    %ecx
  3104ee:	0e                   	push   %cs
  3104ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3104f5:	46                   	inc    %esi
  3104f6:	87 03                	xchg   %eax,(%ebx)
  3104f8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  3104fb:	05 02 d3 c3 41       	add    $0x41c3d302,%eax
  310500:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310504:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310507:	04 28                	add    $0x28,%al
  310509:	00 00                	add    %al,(%eax)
  31050b:	00 98 15 00 00 2d    	add    %bl,0x2d000015(%eax)
  310511:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  310512:	ff                   	(bad)  
  310513:	ff 6c 00 00          	ljmp   *0x0(%eax,%eax,1)
  310517:	00 00                	add    %al,(%eax)
  310519:	41                   	inc    %ecx
  31051a:	0e                   	push   %cs
  31051b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310521:	46                   	inc    %esi
  310522:	87 03                	xchg   %eax,(%ebx)
  310524:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310527:	05 02 5f c3 41       	add    $0x41c35f02,%eax
  31052c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310530:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310533:	04 28                	add    $0x28,%al
  310535:	00 00                	add    %al,(%eax)
  310537:	00 c4                	add    %al,%ah
  310539:	15 00 00 6d a4       	adc    $0xa46d0000,%eax
  31053e:	ff                   	(bad)  
  31053f:	ff 9c 00 00 00 00 41 	lcall  *0x41000000(%eax,%eax,1)
  310546:	0e                   	push   %cs
  310547:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  31054d:	46                   	inc    %esi
  31054e:	87 03                	xchg   %eax,(%ebx)
  310550:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310553:	05 02 8f c3 41       	add    $0x41c38f02,%eax
  310558:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  31055c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  31055f:	04 1c                	add    $0x1c,%al
  310561:	00 00                	add    %al,(%eax)
  310563:	00 f0                	add    %dh,%al
  310565:	15 00 00 dd a4       	adc    $0xa4dd0000,%eax
  31056a:	ff                   	(bad)  
  31056b:	ff 17                	call   *(%edi)
  31056d:	00 00                	add    %al,(%eax)
  31056f:	00 00                	add    %al,(%eax)
  310571:	41                   	inc    %ecx
  310572:	0e                   	push   %cs
  310573:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310579:	53                   	push   %ebx
  31057a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  31057d:	04 00                	add    $0x0,%al
  31057f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  310582:	00 00                	add    %al,(%eax)
  310584:	10 16                	adc    %dl,(%esi)
  310586:	00 00                	add    %al,(%eax)
  310588:	d4 a4                	aam    $0xa4
  31058a:	ff                   	(bad)  
  31058b:	ff a3 00 00 00 00    	jmp    *0x0(%ebx)
  310591:	41                   	inc    %ecx
  310592:	0e                   	push   %cs
  310593:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310599:	02 9f c5 0c 04 04    	add    0x4040cc5(%edi),%bl
  31059f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  3105a2:	00 00                	add    %al,(%eax)
  3105a4:	30 16                	xor    %dl,(%esi)
  3105a6:	00 00                	add    %al,(%eax)
  3105a8:	57                   	push   %edi
  3105a9:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  3105aa:	ff                   	(bad)  
  3105ab:	ff 72 00             	pushl  0x0(%edx)
  3105ae:	00 00                	add    %al,(%eax)
  3105b0:	00 41 0e             	add    %al,0xe(%ecx)
  3105b3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3105b9:	02 6e c5             	add    -0x3b(%esi),%ch
  3105bc:	0c 04                	or     $0x4,%al
  3105be:	04 00                	add    $0x0,%al
  3105c0:	1c 00                	sbb    $0x0,%al
  3105c2:	00 00                	add    %al,(%eax)
  3105c4:	50                   	push   %eax
  3105c5:	16                   	push   %ss
  3105c6:	00 00                	add    %al,(%eax)
  3105c8:	a9 a5 ff ff 57       	test   $0x57ffffa5,%eax
  3105cd:	00 00                	add    %al,(%eax)
  3105cf:	00 00                	add    %al,(%eax)
  3105d1:	41                   	inc    %ecx
  3105d2:	0e                   	push   %cs
  3105d3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3105d9:	02 53 c5             	add    -0x3b(%ebx),%dl
  3105dc:	0c 04                	or     $0x4,%al
  3105de:	04 00                	add    $0x0,%al
  3105e0:	1c 00                	sbb    $0x0,%al
  3105e2:	00 00                	add    %al,(%eax)
  3105e4:	70 16                	jo     3105fc <_upperDigits+0x180c>
  3105e6:	00 00                	add    %al,(%eax)
  3105e8:	e0 a5                	loopne 31058f <_upperDigits+0x179f>
  3105ea:	ff                   	(bad)  
  3105eb:	ff de                	lcall  *<internal disassembler error>
  3105ed:	00 00                	add    %al,(%eax)
  3105ef:	00 00                	add    %al,(%eax)
  3105f1:	41                   	inc    %ecx
  3105f2:	0e                   	push   %cs
  3105f3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3105f9:	02 da                	add    %dl,%bl
  3105fb:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3105fe:	04 00                	add    $0x0,%al
  310600:	28 00                	sub    %al,(%eax)
  310602:	00 00                	add    %al,(%eax)
  310604:	90                   	nop
  310605:	16                   	push   %ss
  310606:	00 00                	add    %al,(%eax)
  310608:	9e                   	sahf   
  310609:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
  31060a:	ff                   	(bad)  
  31060b:	ff                   	(bad)  
  31060c:	fb                   	sti    
  31060d:	00 00                	add    %al,(%eax)
  31060f:	00 00                	add    %al,(%eax)
  310611:	41                   	inc    %ecx
  310612:	0e                   	push   %cs
  310613:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310619:	46                   	inc    %esi
  31061a:	87 03                	xchg   %eax,(%ebx)
  31061c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  31061f:	05 02 ee c3 41       	add    $0x41c3ee02,%eax
  310624:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310628:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  31062b:	04 28                	add    $0x28,%al
  31062d:	00 00                	add    %al,(%eax)
  31062f:	00 bc 16 00 00 6d a7 	add    %bh,-0x58930000(%esi,%edx,1)
  310636:	ff                   	(bad)  
  310637:	ff                   	(bad)  
  310638:	b9 00 00 00 00       	mov    $0x0,%ecx
  31063d:	41                   	inc    %ecx
  31063e:	0e                   	push   %cs
  31063f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310645:	46                   	inc    %esi
  310646:	87 03                	xchg   %eax,(%ebx)
  310648:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  31064b:	05 02 ac c3 41       	add    $0x41c3ac02,%eax
  310650:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310654:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310657:	04 1c                	add    $0x1c,%al
  310659:	00 00                	add    %al,(%eax)
  31065b:	00 e8                	add    %ch,%al
  31065d:	16                   	push   %ss
  31065e:	00 00                	add    %al,(%eax)
  310660:	fa                   	cli    
  310661:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
  310662:	ff                   	(bad)  
  310663:	ff                   	(bad)  
  310664:	3a 00                	cmp    (%eax),%al
  310666:	00 00                	add    %al,(%eax)
  310668:	00 41 0e             	add    %al,0xe(%ecx)
  31066b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310671:	76 c5                	jbe    310638 <_upperDigits+0x1848>
  310673:	0c 04                	or     $0x4,%al
  310675:	04 00                	add    $0x0,%al
  310677:	00 2c 00             	add    %ch,(%eax,%eax,1)
  31067a:	00 00                	add    %al,(%eax)
  31067c:	08 17                	or     %dl,(%edi)
  31067e:	00 00                	add    %al,(%eax)
  310680:	14 a8                	adc    $0xa8,%al
  310682:	ff                   	(bad)  
  310683:	ff 5f 01             	lcall  *0x1(%edi)
  310686:	00 00                	add    %al,(%eax)
  310688:	00 41 0e             	add    %al,0xe(%ecx)
  31068b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310691:	46                   	inc    %esi
  310692:	87 03                	xchg   %eax,(%ebx)
  310694:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310697:	05 03 52 01 c3       	add    $0xc3015203,%eax
  31069c:	41                   	inc    %ecx
  31069d:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  3106a1:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3106a4:	04 00                	add    $0x0,%al
  3106a6:	00 00                	add    %al,(%eax)
  3106a8:	28 00                	sub    %al,(%eax)
  3106aa:	00 00                	add    %al,(%eax)
  3106ac:	38 17                	cmp    %dl,(%edi)
  3106ae:	00 00                	add    %al,(%eax)
  3106b0:	43                   	inc    %ebx
  3106b1:	a9 ff ff 9b 00       	test   $0x9bffff,%eax
  3106b6:	00 00                	add    %al,(%eax)
  3106b8:	00 41 0e             	add    %al,0xe(%ecx)
  3106bb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3106c1:	46                   	inc    %esi
  3106c2:	87 03                	xchg   %eax,(%ebx)
  3106c4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  3106c7:	05 02 8e c3 41       	add    $0x41c38e02,%eax
  3106cc:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  3106d0:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3106d3:	04 1c                	add    $0x1c,%al
  3106d5:	00 00                	add    %al,(%eax)
  3106d7:	00 64 17 00          	add    %ah,0x0(%edi,%edx,1)
  3106db:	00 b2 a9 ff ff 17    	add    %dh,0x17ffffa9(%edx)
  3106e1:	00 00                	add    %al,(%eax)
  3106e3:	00 00                	add    %al,(%eax)
  3106e5:	41                   	inc    %ecx
  3106e6:	0e                   	push   %cs
  3106e7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3106ed:	53                   	push   %ebx
  3106ee:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3106f1:	04 00                	add    $0x0,%al
  3106f3:	00 28                	add    %ch,(%eax)
  3106f5:	00 00                	add    %al,(%eax)
  3106f7:	00 84 17 00 00 ac a9 	add    %al,-0x56540000(%edi,%edx,1)
  3106fe:	ff                   	(bad)  
  3106ff:	ff 20                	jmp    *(%eax)
  310701:	00 00                	add    %al,(%eax)
  310703:	00 00                	add    %al,(%eax)
  310705:	41                   	inc    %ecx
  310706:	0e                   	push   %cs
  310707:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  31070d:	43                   	inc    %ebx
  31070e:	87 03                	xchg   %eax,(%ebx)
  310710:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310713:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  310718:	41                   	inc    %ecx
  310719:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310720:	28 00                	sub    %al,(%eax)
  310722:	00 00                	add    %al,(%eax)
  310724:	b0 17                	mov    $0x17,%al
  310726:	00 00                	add    %al,(%eax)
  310728:	a0 a9 ff ff 7b       	mov    0x7bffffa9,%al
  31072d:	00 00                	add    %al,(%eax)
  31072f:	00 00                	add    %al,(%eax)
  310731:	41                   	inc    %ecx
  310732:	0e                   	push   %cs
  310733:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310739:	46                   	inc    %esi
  31073a:	87 03                	xchg   %eax,(%ebx)
  31073c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  31073f:	05 02 6e c3 41       	add    $0x41c36e02,%eax
  310744:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310748:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  31074b:	04 28                	add    $0x28,%al
  31074d:	00 00                	add    %al,(%eax)
  31074f:	00 dc                	add    %bl,%ah
  310751:	17                   	pop    %ss
  310752:	00 00                	add    %al,(%eax)
  310754:	ef                   	out    %eax,(%dx)
  310755:	a9 ff ff 7b 00       	test   $0x7bffff,%eax
  31075a:	00 00                	add    %al,(%eax)
  31075c:	00 41 0e             	add    %al,0xe(%ecx)
  31075f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310765:	46                   	inc    %esi
  310766:	87 03                	xchg   %eax,(%ebx)
  310768:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  31076b:	05 02 6e c3 41       	add    $0x41c36e02,%eax
  310770:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310774:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310777:	04 28                	add    $0x28,%al
  310779:	00 00                	add    %al,(%eax)
  31077b:	00 08                	add    %cl,(%eax)
  31077d:	18 00                	sbb    %al,(%eax)
  31077f:	00 3e                	add    %bh,(%esi)
  310781:	aa                   	stos   %al,%es:(%edi)
  310782:	ff                   	(bad)  
  310783:	ff 6b 00             	ljmp   *0x0(%ebx)
  310786:	00 00                	add    %al,(%eax)
  310788:	00 41 0e             	add    %al,0xe(%ecx)
  31078b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310791:	46                   	inc    %esi
  310792:	87 03                	xchg   %eax,(%ebx)
  310794:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310797:	05 02 5e c3 41       	add    $0x41c35e02,%eax
  31079c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  3107a0:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3107a3:	04 1c                	add    $0x1c,%al
  3107a5:	00 00                	add    %al,(%eax)
  3107a7:	00 34 18             	add    %dh,(%eax,%ebx,1)
  3107aa:	00 00                	add    %al,(%eax)
  3107ac:	7d aa                	jge    310758 <_upperDigits+0x1968>
  3107ae:	ff                   	(bad)  
  3107af:	ff 17                	call   *(%edi)
  3107b1:	00 00                	add    %al,(%eax)
  3107b3:	00 00                	add    %al,(%eax)
  3107b5:	41                   	inc    %ecx
  3107b6:	0e                   	push   %cs
  3107b7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3107bd:	53                   	push   %ebx
  3107be:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3107c1:	04 00                	add    $0x0,%al
  3107c3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  3107c6:	00 00                	add    %al,(%eax)
  3107c8:	54                   	push   %esp
  3107c9:	18 00                	sbb    %al,(%eax)
  3107cb:	00 74 aa ff          	add    %dh,-0x1(%edx,%ebp,4)
  3107cf:	ff 95 00 00 00 00    	call   *0x0(%ebp)
  3107d5:	41                   	inc    %ecx
  3107d6:	0e                   	push   %cs
  3107d7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3107dd:	02 91 c5 0c 04 04    	add    0x4040cc5(%ecx),%dl
  3107e3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  3107e6:	00 00                	add    %al,(%eax)
  3107e8:	74 18                	je     310802 <_upperDigits+0x1a12>
  3107ea:	00 00                	add    %al,(%eax)
  3107ec:	e9 aa ff ff 95       	jmp    9631079b <_end+0x95ffa81b>
  3107f1:	00 00                	add    %al,(%eax)
  3107f3:	00 00                	add    %al,(%eax)
  3107f5:	41                   	inc    %ecx
  3107f6:	0e                   	push   %cs
  3107f7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3107fd:	02 91 c5 0c 04 04    	add    0x4040cc5(%ecx),%dl
  310803:	00 1c 00             	add    %bl,(%eax,%eax,1)
  310806:	00 00                	add    %al,(%eax)
  310808:	94                   	xchg   %eax,%esp
  310809:	18 00                	sbb    %al,(%eax)
  31080b:	00 5e ab             	add    %bl,-0x55(%esi)
  31080e:	ff                   	(bad)  
  31080f:	ff b7 00 00 00 00    	pushl  0x0(%edi)
  310815:	41                   	inc    %ecx
  310816:	0e                   	push   %cs
  310817:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  31081d:	02 b3 c5 0c 04 04    	add    0x4040cc5(%ebx),%dh
  310823:	00 2c 00             	add    %ch,(%eax,%eax,1)
  310826:	00 00                	add    %al,(%eax)
  310828:	b4 18                	mov    $0x18,%ah
  31082a:	00 00                	add    %al,(%eax)
  31082c:	f5                   	cmc    
  31082d:	ab                   	stos   %eax,%es:(%edi)
  31082e:	ff                   	(bad)  
  31082f:	ff 05 02 00 00 00    	incl   0x2
  310835:	41                   	inc    %ecx
  310836:	0e                   	push   %cs
  310837:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  31083d:	43                   	inc    %ebx
  31083e:	87 03                	xchg   %eax,(%ebx)
  310840:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310843:	05 03 fb 01 c3       	add    $0xc301fb03,%eax
  310848:	41                   	inc    %ecx
  310849:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  31084d:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310850:	04 00                	add    $0x0,%al
  310852:	00 00                	add    %al,(%eax)
  310854:	1c 00                	sbb    $0x0,%al
  310856:	00 00                	add    %al,(%eax)
  310858:	e4 18                	in     $0x18,%al
  31085a:	00 00                	add    %al,(%eax)
  31085c:	ca ad ff             	lret   $0xffad
  31085f:	ff c1                	inc    %ecx
  310861:	00 00                	add    %al,(%eax)
  310863:	00 00                	add    %al,(%eax)
  310865:	41                   	inc    %ecx
  310866:	0e                   	push   %cs
  310867:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  31086d:	02 bd c5 0c 04 04    	add    0x4040cc5(%ebp),%bh
  310873:	00 1c 00             	add    %bl,(%eax,%eax,1)
  310876:	00 00                	add    %al,(%eax)
  310878:	04 19                	add    $0x19,%al
  31087a:	00 00                	add    %al,(%eax)
  31087c:	6b ae ff ff 91 00 00 	imul   $0x0,0x91ffff(%esi),%ebp
  310883:	00 00                	add    %al,(%eax)
  310885:	41                   	inc    %ecx
  310886:	0e                   	push   %cs
  310887:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  31088d:	02 8d c5 0c 04 04    	add    0x4040cc5(%ebp),%cl
  310893:	00 20                	add    %ah,(%eax)
  310895:	00 00                	add    %al,(%eax)
  310897:	00 24 19             	add    %ah,(%ecx,%ebx,1)
  31089a:	00 00                	add    %al,(%eax)
  31089c:	dc ae ff ff 8f 00    	fsubrl 0x8fffff(%esi)
  3108a2:	00 00                	add    %al,(%eax)
  3108a4:	00 41 0e             	add    %al,0xe(%ecx)
  3108a7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3108ad:	41                   	inc    %ecx
  3108ae:	83 03 02             	addl   $0x2,(%ebx)
  3108b1:	8a c5                	mov    %ch,%al
  3108b3:	c3                   	ret    
  3108b4:	0c 04                	or     $0x4,%al
  3108b6:	04 00                	add    $0x0,%al
  3108b8:	1c 00                	sbb    $0x0,%al
  3108ba:	00 00                	add    %al,(%eax)
  3108bc:	48                   	dec    %eax
  3108bd:	19 00                	sbb    %eax,(%eax)
  3108bf:	00 47 af             	add    %al,-0x51(%edi)
  3108c2:	ff                   	(bad)  
  3108c3:	ff c6                	inc    %esi
  3108c5:	00 00                	add    %al,(%eax)
  3108c7:	00 00                	add    %al,(%eax)
  3108c9:	41                   	inc    %ecx
  3108ca:	0e                   	push   %cs
  3108cb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3108d1:	02 c2                	add    %dl,%al
  3108d3:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3108d6:	04 00                	add    $0x0,%al
  3108d8:	20 00                	and    %al,(%eax)
  3108da:	00 00                	add    %al,(%eax)
  3108dc:	68 19 00 00 ed       	push   $0xed000019
  3108e1:	af                   	scas   %es:(%edi),%eax
  3108e2:	ff                   	(bad)  
  3108e3:	ff d8                	lcall  *<internal disassembler error>
  3108e5:	00 00                	add    %al,(%eax)
  3108e7:	00 00                	add    %al,(%eax)
  3108e9:	41                   	inc    %ecx
  3108ea:	0e                   	push   %cs
  3108eb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3108f1:	44                   	inc    %esp
  3108f2:	83 03 02             	addl   $0x2,(%ebx)
  3108f5:	d0 c5                	rol    %ch
  3108f7:	c3                   	ret    
  3108f8:	0c 04                	or     $0x4,%al
  3108fa:	04 00                	add    $0x0,%al
  3108fc:	1c 00                	sbb    $0x0,%al
  3108fe:	00 00                	add    %al,(%eax)
  310900:	8c 19                	mov    %ds,(%ecx)
  310902:	00 00                	add    %al,(%eax)
  310904:	a1 b0 ff ff cb       	mov    0xcbffffb0,%eax
  310909:	05 00 00 00 41       	add    $0x41000000,%eax
  31090e:	0e                   	push   %cs
  31090f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310915:	03 c7                	add    %edi,%eax
  310917:	05 c5 0c 04 04       	add    $0x4040cc5,%eax
  31091c:	1c 00                	sbb    $0x0,%al
  31091e:	00 00                	add    %al,(%eax)
  310920:	ac                   	lods   %ds:(%esi),%al
  310921:	19 00                	sbb    %eax,(%eax)
  310923:	00 4c b6 ff          	add    %cl,-0x1(%esi,%esi,4)
  310927:	ff 61 02             	jmp    *0x2(%ecx)
  31092a:	00 00                	add    %al,(%eax)
  31092c:	00 41 0e             	add    %al,0xe(%ecx)
  31092f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310935:	03 5d 02             	add    0x2(%ebp),%ebx
  310938:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  31093b:	04 28                	add    $0x28,%al
  31093d:	00 00                	add    %al,(%eax)
  31093f:	00 cc                	add    %cl,%ah
  310941:	19 00                	sbb    %eax,(%eax)
  310943:	00 8d b8 ff ff 4d    	add    %cl,0x4dffffb8(%ebp)
  310949:	00 00                	add    %al,(%eax)
  31094b:	00 00                	add    %al,(%eax)
  31094d:	41                   	inc    %ecx
  31094e:	0e                   	push   %cs
  31094f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310955:	46                   	inc    %esi
  310956:	87 03                	xchg   %eax,(%ebx)
  310958:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  31095b:	05 02 40 c3 41       	add    $0x41c34002,%eax
  310960:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310964:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310967:	04 1c                	add    $0x1c,%al
  310969:	00 00                	add    %al,(%eax)
  31096b:	00 f8                	add    %bh,%al
  31096d:	19 00                	sbb    %eax,(%eax)
  31096f:	00 ae b8 ff ff 28    	add    %ch,0x28ffffb8(%esi)
  310975:	00 00                	add    %al,(%eax)
  310977:	00 00                	add    %al,(%eax)
  310979:	41                   	inc    %ecx
  31097a:	0e                   	push   %cs
  31097b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310981:	64 c5 0c 04          	lds    %fs:(%esp,%eax,1),%ecx
  310985:	04 00                	add    $0x0,%al
  310987:	00 28                	add    %ch,(%eax)
  310989:	00 00                	add    %al,(%eax)
  31098b:	00 18                	add    %bl,(%eax)
  31098d:	1a 00                	sbb    (%eax),%al
  31098f:	00 b6 b8 ff ff 6b    	add    %dh,0x6bffffb8(%esi)
  310995:	00 00                	add    %al,(%eax)
  310997:	00 00                	add    %al,(%eax)
  310999:	41                   	inc    %ecx
  31099a:	0e                   	push   %cs
  31099b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3109a1:	46                   	inc    %esi
  3109a2:	87 03                	xchg   %eax,(%ebx)
  3109a4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  3109a7:	05 02 5e c3 41       	add    $0x41c35e02,%eax
  3109ac:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  3109b0:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3109b3:	04 1c                	add    $0x1c,%al
  3109b5:	00 00                	add    %al,(%eax)
  3109b7:	00 44 1a 00          	add    %al,0x0(%edx,%ebx,1)
  3109bb:	00 f8                	add    %bh,%al
  3109bd:	b8 ff ff 6e 00       	mov    $0x6effff,%eax
  3109c2:	00 00                	add    %al,(%eax)
  3109c4:	00 41 0e             	add    %al,0xe(%ecx)
  3109c7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3109cd:	02 6a c5             	add    -0x3b(%edx),%ch
  3109d0:	0c 04                	or     $0x4,%al
  3109d2:	04 00                	add    $0x0,%al
  3109d4:	1c 00                	sbb    $0x0,%al
  3109d6:	00 00                	add    %al,(%eax)
  3109d8:	64 1a 00             	sbb    %fs:(%eax),%al
  3109db:	00 46 b9             	add    %al,-0x47(%esi)
  3109de:	ff                   	(bad)  
  3109df:	ff 23                	jmp    *(%ebx)
  3109e1:	00 00                	add    %al,(%eax)
  3109e3:	00 00                	add    %al,(%eax)
  3109e5:	41                   	inc    %ecx
  3109e6:	0e                   	push   %cs
  3109e7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  3109ed:	5f                   	pop    %edi
  3109ee:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  3109f1:	04 00                	add    $0x0,%al
  3109f3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  3109f6:	00 00                	add    %al,(%eax)
  3109f8:	84 1a                	test   %bl,(%edx)
  3109fa:	00 00                	add    %al,(%eax)
  3109fc:	49                   	dec    %ecx
  3109fd:	b9 ff ff 3f 00       	mov    $0x3fffff,%ecx
  310a02:	00 00                	add    %al,(%eax)
  310a04:	00 41 0e             	add    %al,0xe(%ecx)
  310a07:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310a0d:	7b c5                	jnp    3109d4 <_upperDigits+0x1be4>
  310a0f:	0c 04                	or     $0x4,%al
  310a11:	04 00                	add    $0x0,%al
  310a13:	00 1c 00             	add    %bl,(%eax,%eax,1)
  310a16:	00 00                	add    %al,(%eax)
  310a18:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  310a19:	1a 00                	sbb    (%eax),%al
  310a1b:	00 68 b9             	add    %ch,-0x47(%eax)
  310a1e:	ff                   	(bad)  
  310a1f:	ff 36                	pushl  (%esi)
  310a21:	00 00                	add    %al,(%eax)
  310a23:	00 00                	add    %al,(%eax)
  310a25:	41                   	inc    %ecx
  310a26:	0e                   	push   %cs
  310a27:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310a2d:	72 c5                	jb     3109f4 <_upperDigits+0x1c04>
  310a2f:	0c 04                	or     $0x4,%al
  310a31:	04 00                	add    $0x0,%al
  310a33:	00 1c 00             	add    %bl,(%eax,%eax,1)
  310a36:	00 00                	add    %al,(%eax)
  310a38:	c4 1a                	les    (%edx),%ebx
  310a3a:	00 00                	add    %al,(%eax)
  310a3c:	7e b9                	jle    3109f7 <_upperDigits+0x1c07>
  310a3e:	ff                   	(bad)  
  310a3f:	ff 82 00 00 00 00    	incl   0x0(%edx)
  310a45:	41                   	inc    %ecx
  310a46:	0e                   	push   %cs
  310a47:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310a4d:	02 7e c5             	add    -0x3b(%esi),%bh
  310a50:	0c 04                	or     $0x4,%al
  310a52:	04 00                	add    $0x0,%al
  310a54:	2c 00                	sub    $0x0,%al
  310a56:	00 00                	add    %al,(%eax)
  310a58:	e4 1a                	in     $0x1a,%al
  310a5a:	00 00                	add    %al,(%eax)
  310a5c:	e0 b9                	loopne 310a17 <_upperDigits+0x1c27>
  310a5e:	ff                   	(bad)  
  310a5f:	ff 5a 01             	lcall  *0x1(%edx)
  310a62:	00 00                	add    %al,(%eax)
  310a64:	00 41 0e             	add    %al,0xe(%ecx)
  310a67:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310a6d:	46                   	inc    %esi
  310a6e:	87 03                	xchg   %eax,(%ebx)
  310a70:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310a73:	05 03 4d 01 c3       	add    $0xc3014d03,%eax
  310a78:	41                   	inc    %ecx
  310a79:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310a7d:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310a80:	04 00                	add    $0x0,%al
  310a82:	00 00                	add    %al,(%eax)
  310a84:	28 00                	sub    %al,(%eax)
  310a86:	00 00                	add    %al,(%eax)
  310a88:	14 1b                	adc    $0x1b,%al
  310a8a:	00 00                	add    %al,(%eax)
  310a8c:	0a bb ff ff 83 00    	or     0x83ffff(%ebx),%bh
  310a92:	00 00                	add    %al,(%eax)
  310a94:	00 41 0e             	add    %al,0xe(%ecx)
  310a97:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310a9d:	46                   	inc    %esi
  310a9e:	87 03                	xchg   %eax,(%ebx)
  310aa0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310aa3:	05 02 76 c3 41       	add    $0x41c37602,%eax
  310aa8:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310aac:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310aaf:	04 1c                	add    $0x1c,%al
  310ab1:	00 00                	add    %al,(%eax)
  310ab3:	00 40 1b             	add    %al,0x1b(%eax)
  310ab6:	00 00                	add    %al,(%eax)
  310ab8:	61                   	popa   
  310ab9:	bb ff ff 17 00       	mov    $0x17ffff,%ebx
  310abe:	00 00                	add    %al,(%eax)
  310ac0:	00 41 0e             	add    %al,0xe(%ecx)
  310ac3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310ac9:	53                   	push   %ebx
  310aca:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310acd:	04 00                	add    $0x0,%al
  310acf:	00 28                	add    %ch,(%eax)
  310ad1:	00 00                	add    %al,(%eax)
  310ad3:	00 60 1b             	add    %ah,0x1b(%eax)
  310ad6:	00 00                	add    %al,(%eax)
  310ad8:	58                   	pop    %eax
  310ad9:	bb ff ff 20 00       	mov    $0x20ffff,%ebx
  310ade:	00 00                	add    %al,(%eax)
  310ae0:	00 41 0e             	add    %al,0xe(%ecx)
  310ae3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310ae9:	43                   	inc    %ebx
  310aea:	87 03                	xchg   %eax,(%ebx)
  310aec:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310aef:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  310af4:	41                   	inc    %ecx
  310af5:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310afc:	1c 00                	sbb    $0x0,%al
  310afe:	00 00                	add    %al,(%eax)
  310b00:	8c 1b                	mov    %ds,(%ebx)
  310b02:	00 00                	add    %al,(%eax)
  310b04:	4c                   	dec    %esp
  310b05:	bb ff ff 77 00       	mov    $0x77ffff,%ebx
  310b0a:	00 00                	add    %al,(%eax)
  310b0c:	00 41 0e             	add    %al,0xe(%ecx)
  310b0f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310b15:	02 73 c5             	add    -0x3b(%ebx),%dh
  310b18:	0c 04                	or     $0x4,%al
  310b1a:	04 00                	add    $0x0,%al
  310b1c:	1c 00                	sbb    $0x0,%al
  310b1e:	00 00                	add    %al,(%eax)
  310b20:	ac                   	lods   %ds:(%esi),%al
  310b21:	1b 00                	sbb    (%eax),%eax
  310b23:	00 a3 bb ff ff 79    	add    %ah,0x79ffffbb(%ebx)
  310b29:	00 00                	add    %al,(%eax)
  310b2b:	00 00                	add    %al,(%eax)
  310b2d:	41                   	inc    %ecx
  310b2e:	0e                   	push   %cs
  310b2f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310b35:	02 75 c5             	add    -0x3b(%ebp),%dh
  310b38:	0c 04                	or     $0x4,%al
  310b3a:	04 00                	add    $0x0,%al
  310b3c:	1c 00                	sbb    $0x0,%al
  310b3e:	00 00                	add    %al,(%eax)
  310b40:	cc                   	int3   
  310b41:	1b 00                	sbb    (%eax),%eax
  310b43:	00 fc                	add    %bh,%ah
  310b45:	bb ff ff 42 00       	mov    $0x42ffff,%ebx
  310b4a:	00 00                	add    %al,(%eax)
  310b4c:	00 41 0e             	add    %al,0xe(%ecx)
  310b4f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310b55:	7e c5                	jle    310b1c <_upperDigits+0x1d2c>
  310b57:	0c 04                	or     $0x4,%al
  310b59:	04 00                	add    $0x0,%al
  310b5b:	00 28                	add    %ch,(%eax)
  310b5d:	00 00                	add    %al,(%eax)
  310b5f:	00 ec                	add    %ch,%ah
  310b61:	1b 00                	sbb    (%eax),%eax
  310b63:	00 1e                	add    %bl,(%esi)
  310b65:	bc ff ff 36 00       	mov    $0x36ffff,%esp
  310b6a:	00 00                	add    %al,(%eax)
  310b6c:	00 41 0e             	add    %al,0xe(%ecx)
  310b6f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310b75:	46                   	inc    %esi
  310b76:	87 03                	xchg   %eax,(%ebx)
  310b78:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310b7b:	05 69 c3 41 c6       	add    $0xc641c369,%eax
  310b80:	41                   	inc    %ecx
  310b81:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310b88:	1c 00                	sbb    $0x0,%al
  310b8a:	00 00                	add    %al,(%eax)
  310b8c:	18 1c 00             	sbb    %bl,(%eax,%eax,1)
  310b8f:	00 28                	add    %ch,(%eax)
  310b91:	bc ff ff d8 01       	mov    $0x1d8ffff,%esp
  310b96:	00 00                	add    %al,(%eax)
  310b98:	00 41 0e             	add    %al,0xe(%ecx)
  310b9b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310ba1:	03 d4                	add    %esp,%edx
  310ba3:	01 c5                	add    %eax,%ebp
  310ba5:	0c 04                	or     $0x4,%al
  310ba7:	04 28                	add    $0x28,%al
  310ba9:	00 00                	add    %al,(%eax)
  310bab:	00 38                	add    %bh,(%eax)
  310bad:	1c 00                	sbb    $0x0,%al
  310baf:	00 e0                	add    %ah,%al
  310bb1:	bd ff ff f3 00       	mov    $0xf3ffff,%ebp
  310bb6:	00 00                	add    %al,(%eax)
  310bb8:	00 41 0e             	add    %al,0xe(%ecx)
  310bbb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310bc1:	46                   	inc    %esi
  310bc2:	87 03                	xchg   %eax,(%ebx)
  310bc4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310bc7:	05 02 e6 c3 41       	add    $0x41c3e602,%eax
  310bcc:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310bd0:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310bd3:	04 28                	add    $0x28,%al
  310bd5:	00 00                	add    %al,(%eax)
  310bd7:	00 64 1c 00          	add    %ah,0x0(%esp,%ebx,1)
  310bdb:	00 a7 be ff ff 44    	add    %ah,0x44ffffbe(%edi)
  310be1:	00 00                	add    %al,(%eax)
  310be3:	00 00                	add    %al,(%eax)
  310be5:	41                   	inc    %ecx
  310be6:	0e                   	push   %cs
  310be7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310bed:	46                   	inc    %esi
  310bee:	87 03                	xchg   %eax,(%ebx)
  310bf0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310bf3:	05 77 c3 41 c6       	add    $0xc641c377,%eax
  310bf8:	41                   	inc    %ecx
  310bf9:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310c00:	28 00                	sub    %al,(%eax)
  310c02:	00 00                	add    %al,(%eax)
  310c04:	90                   	nop
  310c05:	1c 00                	sbb    $0x0,%al
  310c07:	00 bf be ff ff aa    	add    %bh,-0x55000042(%edi)
  310c0d:	00 00                	add    %al,(%eax)
  310c0f:	00 00                	add    %al,(%eax)
  310c11:	41                   	inc    %ecx
  310c12:	0e                   	push   %cs
  310c13:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310c19:	46                   	inc    %esi
  310c1a:	87 03                	xchg   %eax,(%ebx)
  310c1c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310c1f:	05 02 9d c3 41       	add    $0x41c39d02,%eax
  310c24:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310c28:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310c2b:	04 28                	add    $0x28,%al
  310c2d:	00 00                	add    %al,(%eax)
  310c2f:	00 bc 1c 00 00 40 bf 	add    %bh,-0x40c00000(%esp,%ebx,1)
  310c36:	ff                   	(bad)  
  310c37:	ff 2d 00 00 00 00    	ljmp   *0x0
  310c3d:	41                   	inc    %ecx
  310c3e:	0e                   	push   %cs
  310c3f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310c45:	46                   	inc    %esi
  310c46:	87 03                	xchg   %eax,(%ebx)
  310c48:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310c4b:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  310c50:	41                   	inc    %ecx
  310c51:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310c58:	1c 00                	sbb    $0x0,%al
  310c5a:	00 00                	add    %al,(%eax)
  310c5c:	e8 1c 00 00 41       	call   41310c7d <_end+0x40ffacfd>
  310c61:	bf ff ff 32 00       	mov    $0x32ffff,%edi
  310c66:	00 00                	add    %al,(%eax)
  310c68:	00 41 0e             	add    %al,0xe(%ecx)
  310c6b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310c71:	6e                   	outsb  %ds:(%esi),(%dx)
  310c72:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310c75:	04 00                	add    $0x0,%al
  310c77:	00 1c 00             	add    %bl,(%eax,%eax,1)
  310c7a:	00 00                	add    %al,(%eax)
  310c7c:	08 1d 00 00 54 bf    	or     %bl,0xbf540000
  310c82:	ff                   	(bad)  
  310c83:	ff a8 00 00 00 00    	ljmp   *0x0(%eax)
  310c89:	41                   	inc    %ecx
  310c8a:	0e                   	push   %cs
  310c8b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310c91:	46                   	inc    %esi
  310c92:	87 03                	xchg   %eax,(%ebx)
  310c94:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310c97:	05 28 00 00 00       	add    $0x28,%eax
  310c9c:	28 1d 00 00 dc bf    	sub    %bl,0xbfdc0000
  310ca2:	ff                   	(bad)  
  310ca3:	ff 2d 00 00 00 00    	ljmp   *0x0
  310ca9:	41                   	inc    %ecx
  310caa:	0e                   	push   %cs
  310cab:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310cb1:	46                   	inc    %esi
  310cb2:	87 03                	xchg   %eax,(%ebx)
  310cb4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310cb7:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  310cbc:	41                   	inc    %ecx
  310cbd:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310cc4:	1c 00                	sbb    $0x0,%al
  310cc6:	00 00                	add    %al,(%eax)
  310cc8:	54                   	push   %esp
  310cc9:	1d 00 00 dd bf       	sbb    $0xbfdd0000,%eax
  310cce:	ff                   	(bad)  
  310ccf:	ff                   	(bad)  
  310cd0:	3f                   	aas    
  310cd1:	00 00                	add    %al,(%eax)
  310cd3:	00 00                	add    %al,(%eax)
  310cd5:	41                   	inc    %ecx
  310cd6:	0e                   	push   %cs
  310cd7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310cdd:	7b c5                	jnp    310ca4 <_upperDigits+0x1eb4>
  310cdf:	0c 04                	or     $0x4,%al
  310ce1:	04 00                	add    $0x0,%al
  310ce3:	00 28                	add    %ch,(%eax)
  310ce5:	00 00                	add    %al,(%eax)
  310ce7:	00 74 1d 00          	add    %dh,0x0(%ebp,%ebx,1)
  310ceb:	00 fc                	add    %bh,%ah
  310ced:	bf ff ff 2d 00       	mov    $0x2dffff,%edi
  310cf2:	00 00                	add    %al,(%eax)
  310cf4:	00 41 0e             	add    %al,0xe(%ecx)
  310cf7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310cfd:	46                   	inc    %esi
  310cfe:	87 03                	xchg   %eax,(%ebx)
  310d00:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310d03:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  310d08:	41                   	inc    %ecx
  310d09:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310d10:	24 00                	and    $0x0,%al
  310d12:	00 00                	add    %al,(%eax)
  310d14:	a0 1d 00 00 fd       	mov    0xfd00001d,%al
  310d19:	bf ff ff 1d 00       	mov    $0x1dffff,%edi
  310d1e:	00 00                	add    %al,(%eax)
  310d20:	00 41 0e             	add    %al,0xe(%ecx)
  310d23:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310d29:	42                   	inc    %edx
  310d2a:	87 03                	xchg   %eax,(%ebx)
  310d2c:	86 04 55 c6 41 c7 41 	xchg   %al,0x41c741c6(,%edx,2)
  310d33:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310d36:	04 00                	add    $0x0,%al
  310d38:	28 00                	sub    %al,(%eax)
  310d3a:	00 00                	add    %al,(%eax)
  310d3c:	c8 1d 00 00          	enter  $0x1d,$0x0
  310d40:	f2 bf ff ff 2c 00    	repnz mov $0x2cffff,%edi
  310d46:	00 00                	add    %al,(%eax)
  310d48:	00 41 0e             	add    %al,0xe(%ecx)
  310d4b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310d51:	43                   	inc    %ebx
  310d52:	87 03                	xchg   %eax,(%ebx)
  310d54:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310d57:	05 62 c3 41 c6       	add    $0xc641c362,%eax
  310d5c:	41                   	inc    %ecx
  310d5d:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310d64:	20 00                	and    %al,(%eax)
  310d66:	00 00                	add    %al,(%eax)
  310d68:	f4                   	hlt    
  310d69:	1d 00 00 f2 bf       	sbb    $0xbff20000,%eax
  310d6e:	ff                   	(bad)  
  310d6f:	ff 1e                	lcall  *(%esi)
  310d71:	00 00                	add    %al,(%eax)
  310d73:	00 00                	add    %al,(%eax)
  310d75:	41                   	inc    %ecx
  310d76:	0e                   	push   %cs
  310d77:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310d7d:	41                   	inc    %ecx
  310d7e:	87 03                	xchg   %eax,(%ebx)
  310d80:	58                   	pop    %eax
  310d81:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310d88:	2c 00                	sub    $0x0,%al
  310d8a:	00 00                	add    %al,(%eax)
  310d8c:	18 1e                	sbb    %bl,(%esi)
  310d8e:	00 00                	add    %al,(%eax)
  310d90:	ec                   	in     (%dx),%al
  310d91:	bf ff ff a7 01       	mov    $0x1a7ffff,%edi
  310d96:	00 00                	add    %al,(%eax)
  310d98:	00 41 0e             	add    %al,0xe(%ecx)
  310d9b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310da1:	49                   	dec    %ecx
  310da2:	87 03                	xchg   %eax,(%ebx)
  310da4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310da7:	05 03 97 01 c3       	add    $0xc3019703,%eax
  310dac:	41                   	inc    %ecx
  310dad:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310db1:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310db4:	04 00                	add    $0x0,%al
  310db6:	00 00                	add    %al,(%eax)
  310db8:	1c 00                	sbb    $0x0,%al
  310dba:	00 00                	add    %al,(%eax)
  310dbc:	48                   	dec    %eax
  310dbd:	1e                   	push   %ds
  310dbe:	00 00                	add    %al,(%eax)
  310dc0:	63 c1                	arpl   %ax,%cx
  310dc2:	ff                   	(bad)  
  310dc3:	ff 53 00             	call   *0x0(%ebx)
  310dc6:	00 00                	add    %al,(%eax)
  310dc8:	00 41 0e             	add    %al,0xe(%ecx)
  310dcb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310dd1:	02 4f c5             	add    -0x3b(%edi),%cl
  310dd4:	0c 04                	or     $0x4,%al
  310dd6:	04 00                	add    $0x0,%al
  310dd8:	28 00                	sub    %al,(%eax)
  310dda:	00 00                	add    %al,(%eax)
  310ddc:	68 1e 00 00 98       	push   $0x9800001e
  310de1:	c1 ff ff             	sar    $0xff,%edi
  310de4:	2d 00 00 00 00       	sub    $0x0,%eax
  310de9:	41                   	inc    %ecx
  310dea:	0e                   	push   %cs
  310deb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310df1:	46                   	inc    %esi
  310df2:	87 03                	xchg   %eax,(%ebx)
  310df4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310df7:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  310dfc:	41                   	inc    %ecx
  310dfd:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310e04:	20 00                	and    %al,(%eax)
  310e06:	00 00                	add    %al,(%eax)
  310e08:	94                   	xchg   %eax,%esp
  310e09:	1e                   	push   %ds
  310e0a:	00 00                	add    %al,(%eax)
  310e0c:	99                   	cltd   
  310e0d:	c1 ff ff             	sar    $0xff,%edi
  310e10:	1e                   	push   %ds
  310e11:	00 00                	add    %al,(%eax)
  310e13:	00 00                	add    %al,(%eax)
  310e15:	41                   	inc    %ecx
  310e16:	0e                   	push   %cs
  310e17:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310e1d:	41                   	inc    %ecx
  310e1e:	87 03                	xchg   %eax,(%ebx)
  310e20:	58                   	pop    %eax
  310e21:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310e28:	28 00                	sub    %al,(%eax)
  310e2a:	00 00                	add    %al,(%eax)
  310e2c:	b8 1e 00 00 93       	mov    $0x9300001e,%eax
  310e31:	c1 ff ff             	sar    $0xff,%edi
  310e34:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  310e35:	00 00                	add    %al,(%eax)
  310e37:	00 00                	add    %al,(%eax)
  310e39:	41                   	inc    %ecx
  310e3a:	0e                   	push   %cs
  310e3b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310e41:	46                   	inc    %esi
  310e42:	87 03                	xchg   %eax,(%ebx)
  310e44:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310e47:	05 02 98 c3 41       	add    $0x41c39802,%eax
  310e4c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310e50:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310e53:	04 1c                	add    $0x1c,%al
  310e55:	00 00                	add    %al,(%eax)
  310e57:	00 e4                	add    %ah,%ah
  310e59:	1e                   	push   %ds
  310e5a:	00 00                	add    %al,(%eax)
  310e5c:	0c c2                	or     $0xc2,%al
  310e5e:	ff                   	(bad)  
  310e5f:	ff 33                	pushl  (%ebx)
  310e61:	00 00                	add    %al,(%eax)
  310e63:	00 00                	add    %al,(%eax)
  310e65:	41                   	inc    %ecx
  310e66:	0e                   	push   %cs
  310e67:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310e6d:	6f                   	outsl  %ds:(%esi),(%dx)
  310e6e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310e71:	04 00                	add    $0x0,%al
  310e73:	00 28                	add    %ch,(%eax)
  310e75:	00 00                	add    %al,(%eax)
  310e77:	00 04 1f             	add    %al,(%edi,%ebx,1)
  310e7a:	00 00                	add    %al,(%eax)
  310e7c:	20 c2                	and    %al,%dl
  310e7e:	ff                   	(bad)  
  310e7f:	ff 2d 00 00 00 00    	ljmp   *0x0
  310e85:	41                   	inc    %ecx
  310e86:	0e                   	push   %cs
  310e87:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310e8d:	46                   	inc    %esi
  310e8e:	87 03                	xchg   %eax,(%ebx)
  310e90:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310e93:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  310e98:	41                   	inc    %ecx
  310e99:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310ea0:	28 00                	sub    %al,(%eax)
  310ea2:	00 00                	add    %al,(%eax)
  310ea4:	30 1f                	xor    %bl,(%edi)
  310ea6:	00 00                	add    %al,(%eax)
  310ea8:	21 c2                	and    %eax,%edx
  310eaa:	ff                   	(bad)  
  310eab:	ff 20                	jmp    *(%eax)
  310ead:	00 00                	add    %al,(%eax)
  310eaf:	00 00                	add    %al,(%eax)
  310eb1:	41                   	inc    %ecx
  310eb2:	0e                   	push   %cs
  310eb3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310eb9:	43                   	inc    %ebx
  310eba:	87 03                	xchg   %eax,(%ebx)
  310ebc:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310ebf:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  310ec4:	41                   	inc    %ecx
  310ec5:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310ecc:	28 00                	sub    %al,(%eax)
  310ece:	00 00                	add    %al,(%eax)
  310ed0:	5c                   	pop    %esp
  310ed1:	1f                   	pop    %ds
  310ed2:	00 00                	add    %al,(%eax)
  310ed4:	15 c2 ff ff 9f       	adc    $0x9fffffc2,%eax
  310ed9:	00 00                	add    %al,(%eax)
  310edb:	00 00                	add    %al,(%eax)
  310edd:	41                   	inc    %ecx
  310ede:	0e                   	push   %cs
  310edf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310ee5:	46                   	inc    %esi
  310ee6:	87 03                	xchg   %eax,(%ebx)
  310ee8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310eeb:	05 02 92 c3 41       	add    $0x41c39202,%eax
  310ef0:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  310ef4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310ef7:	04 20                	add    $0x20,%al
  310ef9:	00 00                	add    %al,(%eax)
  310efb:	00 88 1f 00 00 88    	add    %cl,-0x77ffffe1(%eax)
  310f01:	c2 ff ff             	ret    $0xffff
  310f04:	1e                   	push   %ds
  310f05:	00 00                	add    %al,(%eax)
  310f07:	00 00                	add    %al,(%eax)
  310f09:	41                   	inc    %ecx
  310f0a:	0e                   	push   %cs
  310f0b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310f11:	41                   	inc    %ecx
  310f12:	87 03                	xchg   %eax,(%ebx)
  310f14:	58                   	pop    %eax
  310f15:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310f1c:	28 00                	sub    %al,(%eax)
  310f1e:	00 00                	add    %al,(%eax)
  310f20:	ac                   	lods   %ds:(%esi),%al
  310f21:	1f                   	pop    %ds
  310f22:	00 00                	add    %al,(%eax)
  310f24:	82                   	(bad)  
  310f25:	c2 ff ff             	ret    $0xffff
  310f28:	20 00                	and    %al,(%eax)
  310f2a:	00 00                	add    %al,(%eax)
  310f2c:	00 41 0e             	add    %al,0xe(%ecx)
  310f2f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310f35:	43                   	inc    %ebx
  310f36:	87 03                	xchg   %eax,(%ebx)
  310f38:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  310f3b:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  310f40:	41                   	inc    %ecx
  310f41:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  310f48:	20 00                	and    %al,(%eax)
  310f4a:	00 00                	add    %al,(%eax)
  310f4c:	d8 1f                	fcomps (%edi)
  310f4e:	00 00                	add    %al,(%eax)
  310f50:	76 c2                	jbe    310f14 <_upperDigits+0x2124>
  310f52:	ff                   	(bad)  
  310f53:	ff 5a 00             	lcall  *0x0(%edx)
  310f56:	00 00                	add    %al,(%eax)
  310f58:	00 41 0e             	add    %al,0xe(%ecx)
  310f5b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310f61:	44                   	inc    %esp
  310f62:	83 03 02             	addl   $0x2,(%ebx)
  310f65:	51                   	push   %ecx
  310f66:	c3                   	ret    
  310f67:	41                   	inc    %ecx
  310f68:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310f6b:	04 1c                	add    $0x1c,%al
  310f6d:	00 00                	add    %al,(%eax)
  310f6f:	00 fc                	add    %bh,%ah
  310f71:	1f                   	pop    %ds
  310f72:	00 00                	add    %al,(%eax)
  310f74:	ac                   	lods   %ds:(%esi),%al
  310f75:	c2 ff ff             	ret    $0xffff
  310f78:	31 00                	xor    %eax,(%eax)
  310f7a:	00 00                	add    %al,(%eax)
  310f7c:	00 41 0e             	add    %al,0xe(%ecx)
  310f7f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310f85:	6d                   	insl   (%dx),%es:(%edi)
  310f86:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310f89:	04 00                	add    $0x0,%al
  310f8b:	00 20                	add    %ah,(%eax)
  310f8d:	00 00                	add    %al,(%eax)
  310f8f:	00 1c 20             	add    %bl,(%eax,%eiz,1)
  310f92:	00 00                	add    %al,(%eax)
  310f94:	bd c2 ff ff 5c       	mov    $0x5cffffc2,%ebp
  310f99:	00 00                	add    %al,(%eax)
  310f9b:	00 00                	add    %al,(%eax)
  310f9d:	41                   	inc    %ecx
  310f9e:	0e                   	push   %cs
  310f9f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310fa5:	44                   	inc    %esp
  310fa6:	83 03 02             	addl   $0x2,(%ebx)
  310fa9:	53                   	push   %ebx
  310faa:	c3                   	ret    
  310fab:	41                   	inc    %ecx
  310fac:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310faf:	04 1c                	add    $0x1c,%al
  310fb1:	00 00                	add    %al,(%eax)
  310fb3:	00 40 20             	add    %al,0x20(%eax)
  310fb6:	00 00                	add    %al,(%eax)
  310fb8:	f5                   	cmc    
  310fb9:	c2 ff ff             	ret    $0xffff
  310fbc:	31 00                	xor    %eax,(%eax)
  310fbe:	00 00                	add    %al,(%eax)
  310fc0:	00 41 0e             	add    %al,0xe(%ecx)
  310fc3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310fc9:	6d                   	insl   (%dx),%es:(%edi)
  310fca:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  310fcd:	04 00                	add    $0x0,%al
  310fcf:	00 1c 00             	add    %bl,(%eax,%eax,1)
  310fd2:	00 00                	add    %al,(%eax)
  310fd4:	60                   	pusha  
  310fd5:	20 00                	and    %al,(%eax)
  310fd7:	00 06                	add    %al,(%esi)
  310fd9:	c3                   	ret    
  310fda:	ff                   	(bad)  
  310fdb:	ff 23                	jmp    *(%ebx)
  310fdd:	02 00                	add    (%eax),%al
  310fdf:	00 00                	add    %al,(%eax)
  310fe1:	41                   	inc    %ecx
  310fe2:	0e                   	push   %cs
  310fe3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  310fe9:	03 1f                	add    (%edi),%ebx
  310feb:	02 c5                	add    %ch,%al
  310fed:	0c 04                	or     $0x4,%al
  310fef:	04 1c                	add    $0x1c,%al
  310ff1:	00 00                	add    %al,(%eax)
  310ff3:	00 80 20 00 00 09    	add    %al,0x9000020(%eax)
  310ff9:	c5 ff ff             	(bad)  
  310ffc:	8a 00                	mov    (%eax),%al
  310ffe:	00 00                	add    %al,(%eax)
  311000:	00 41 0e             	add    %al,0xe(%ecx)
  311003:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  311009:	02 86 c5 0c 04 04    	add    0x4040cc5(%esi),%al
  31100f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  311012:	00 00                	add    %al,(%eax)
  311014:	a0 20 00 00 73       	mov    0x73000020,%al
  311019:	c5 ff ff             	(bad)  
  31101c:	c4 02                	les    (%edx),%eax
  31101e:	00 00                	add    %al,(%eax)
  311020:	00 41 0e             	add    %al,0xe(%ecx)
  311023:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  311029:	03 c0                	add    %eax,%eax
  31102b:	02 c5                	add    %ch,%al
  31102d:	0c 04                	or     $0x4,%al
  31102f:	04 1c                	add    $0x1c,%al
  311031:	00 00                	add    %al,(%eax)
  311033:	00 c0                	add    %al,%al
  311035:	20 00                	and    %al,(%eax)
  311037:	00 17                	add    %dl,(%edi)
  311039:	c8 ff ff 29          	enter  $0xffff,$0x29
  31103d:	00 00                	add    %al,(%eax)
  31103f:	00 00                	add    %al,(%eax)
  311041:	41                   	inc    %ecx
  311042:	0e                   	push   %cs
  311043:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  311049:	65 c5 0c 04          	lds    %gs:(%esp,%eax,1),%ecx
  31104d:	04 00                	add    $0x0,%al
	...

Disassembly of section .data:

00313000 <envp>:
  313000:	00 00                	add    %al,(%eax)
	...

00313004 <gdt>:
  313004:	ff                   	(bad)  
  313005:	ff 00                	incl   (%eax)
  313007:	09 20                	or     %esp,(%eax)
	...

0031300a <idt>:
  31300a:	ff 07                	incl   (%edi)
  31300c:	00 00                	add    %al,(%eax)
  31300e:	20 00                	and    %al,(%eax)

00313010 <gdt_start>:
  313010:	ff                   	(bad)  
  313011:	ff 00                	incl   (%eax)
  313013:	00 00                	add    %al,(%eax)
  313015:	92                   	xchg   %eax,%edx
  313016:	8f 00                	popl   (%eax)
  313018:	ff                   	(bad)  
  313019:	ff 00                	incl   (%eax)
  31301b:	00 00                	add    %al,(%eax)
  31301d:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
  313024:	00 92 cf 00 ff ff    	add    %dl,-0xff31(%edx)
  31302a:	00 00                	add    %al,(%eax)
  31302c:	00 fa                	add    %bh,%dl
  31302e:	cf                   	iret   
  31302f:	00 ff                	add    %bh,%bh
  313031:	ff 00                	incl   (%eax)
  313033:	00 00                	add    %al,(%eax)
  313035:	f2 cf                	repnz iret 
  313037:	00 ff                	add    %bh,%bh
  313039:	ff 00                	incl   (%eax)
  31303b:	00 00                	add    %al,(%eax)
  31303d:	9a 8f 00 ff ff 00 00 	lcall  $0x0,$0xffff008f
  313044:	00 92 8f 00 00 01    	add    %dl,0x100008f(%edx)
  31304a:	00 08                	add    %cl,(%eax)
  31304c:	20 e9                	and    %ch,%cl
	...

00313050 <sys_call_table>:
  313050:	c5 68 30             	lds    0x30(%eax),%ebp
  313053:	00 e6                	add    %ah,%dh
  313055:	6a 30                	push   $0x30
  313057:	00 ad 6a 30 00 9c    	add    %ch,-0x63ffcf96(%ebp)
  31305d:	68 30 00 8d 7b       	push   $0x7b8d0030
  313062:	30 00                	xor    %al,(%eax)

00313064 <NR_syscalls>:
  313064:	05 00 00 00 00       	add    $0x0,%eax
	...

00313080 <tasks>:
  313080:	00 dc                	add    %bl,%ah
  313082:	30 00                	xor    %al,(%eax)
  313084:	4e                   	dec    %esi
  313085:	7a 30                	jp     3130b7 <tasks+0x37>
  313087:	00 06                	add    %al,(%esi)
  313089:	dc 30                	fdivl  (%eax)
  31308b:	00 46 c2             	add    %al,-0x3e(%esi)
  31308e:	30 00                	xor    %al,(%eax)
  313090:	0d dc 30 00 8e       	or     $0x8e0030dc,%eax
  313095:	b0 30                	mov    $0x30,%al
  313097:	00 15 dc 30 00 e2    	add    %dl,0xe20030dc
  31309d:	9c                   	pushf  
  31309e:	30 00                	xor    %al,(%eax)
  3130a0:	21 dc                	and    %ebx,%esp
  3130a2:	30 00                	xor    %al,(%eax)
  3130a4:	19 c6                	sbb    %eax,%esi
  3130a6:	30 00                	xor    %al,(%eax)
  3130a8:	28 dc                	sub    %bl,%ah
  3130aa:	30 00                	xor    %al,(%eax)
  3130ac:	29 b2 30 00 31 dc    	sub    %esi,-0x23ceffd0(%edx)
  3130b2:	30 00                	xor    %al,(%eax)
  3130b4:	45                   	inc    %ebp
  3130b5:	aa                   	stos   %al,%es:(%edi)
  3130b6:	30 00                	xor    %al,(%eax)
  3130b8:	36 dc 30             	fdivl  %ss:(%eax)
  3130bb:	00 7b 6e             	add    %bh,0x6e(%ebx)
  3130be:	30 00                	xor    %al,(%eax)

003130c0 <mmap>:
  3130c0:	00 00                	add    %al,(%eax)
  3130c2:	10 00                	adc    %al,(%eax)
	...

00313100 <bucket_dir>:
  313100:	10 00                	adc    %al,(%eax)
  313102:	00 00                	add    %al,(%eax)
  313104:	00 00                	add    %al,(%eax)
  313106:	00 00                	add    %al,(%eax)
  313108:	20 00                	and    %al,(%eax)
  31310a:	00 00                	add    %al,(%eax)
  31310c:	00 00                	add    %al,(%eax)
  31310e:	00 00                	add    %al,(%eax)
  313110:	40                   	inc    %eax
  313111:	00 00                	add    %al,(%eax)
  313113:	00 00                	add    %al,(%eax)
  313115:	00 00                	add    %al,(%eax)
  313117:	00 80 00 00 00 00    	add    %al,0x0(%eax)
  31311d:	00 00                	add    %al,(%eax)
  31311f:	00 00                	add    %al,(%eax)
  313121:	01 00                	add    %eax,(%eax)
  313123:	00 00                	add    %al,(%eax)
  313125:	00 00                	add    %al,(%eax)
  313127:	00 00                	add    %al,(%eax)
  313129:	02 00                	add    (%eax),%al
  31312b:	00 00                	add    %al,(%eax)
  31312d:	00 00                	add    %al,(%eax)
  31312f:	00 00                	add    %al,(%eax)
  313131:	04 00                	add    $0x0,%al
  313133:	00 00                	add    %al,(%eax)
  313135:	00 00                	add    %al,(%eax)
  313137:	00 00                	add    %al,(%eax)
  313139:	08 00                	or     %al,(%eax)
  31313b:	00 00                	add    %al,(%eax)
  31313d:	00 00                	add    %al,(%eax)
  31313f:	00 00                	add    %al,(%eax)
  313141:	10 00                	adc    %al,(%eax)
	...

00313150 <imr>:
  313150:	1b 00                	sbb    (%eax),%eax
	...

00313154 <str.1861>:
  313154:	c0 e5 30             	shl    $0x30,%ch
	...

Disassembly of section .bss:

00313180 <___strtok>:
	...

003131c0 <___strtok>:
	...

00313200 <buf>:
	...

00313600 <___strtok>:
  313600:	00 00                	add    %al,(%eax)
	...

00313604 <leading>:
  313604:	00 00                	add    %al,(%eax)
	...

00313608 <cr3>:
  313608:	00 00                	add    %al,(%eax)
	...

0031360c <___strtok>:
  31360c:	00 00                	add    %al,(%eax)
	...

00313610 <rdy_head>:
	...

0031361c <rdy_tail>:
	...

00313628 <tss>:
  313628:	00 00                	add    %al,(%eax)
	...

0031362c <___strtok>:
  31362c:	00 00                	add    %al,(%eax)
	...

00313630 <___strtok>:
  313630:	00 00                	add    %al,(%eax)
	...

00313634 <MEMORY_END>:
  313634:	00 00                	add    %al,(%eax)
	...

00313638 <MEMORY_MAP_END>:
  313638:	00 00                	add    %al,(%eax)
	...

0031363c <___strtok>:
  31363c:	00 00                	add    %al,(%eax)
	...

00313640 <jiffies>:
  313640:	00 00                	add    %al,(%eax)
	...

00313644 <___strtok>:
  313644:	00 00                	add    %al,(%eax)
	...

00313648 <startup_time>:
	...

00313660 <time.1862>:
	...

00313680 <___strtok>:
  313680:	00 00                	add    %al,(%eax)
	...

00313684 <___strtok>:
  313684:	00 00                	add    %al,(%eax)
	...

00313688 <first>:
  313688:	00 00                	add    %al,(%eax)
	...

0031368c <free_bucket>:
  31368c:	00 00                	add    %al,(%eax)
	...

00313690 <___strtok>:
  313690:	00 00                	add    %al,(%eax)
	...

00313694 <___strtok>:
  313694:	00 00                	add    %al,(%eax)
	...

00313698 <___strtok>:
	...

003136c0 <___strtok>:
	...

00313700 <buff>:
	...

00313b00 <block.1939>:
	...

00313f00 <___strtok>:
	...

00313f40 <blk.1942>:
	...

00314340 <___strtok>:
	...

00314380 <block.1941>:
	...

00314780 <___strtok>:
	...

003147c0 <super.1932>:
	...

00314bc0 <___strtok>:
	...

00314c00 <buf.1933>:
	...

00315000 <___strtok>:
  315000:	00 00                	add    %al,(%eax)
	...

00315004 <inq>:
  315004:	00 00                	add    %al,(%eax)
	...

00315008 <tail>:
  315008:	00 00                	add    %al,(%eax)
	...

0031500c <mac.1910>:
	...

00315018 <___strtok>:
  315018:	00 00                	add    %al,(%eax)
	...

0031501c <inq>:
  31501c:	00 00                	add    %al,(%eax)
	...

00315020 <admit>:
  315020:	00 00                	add    %al,(%eax)
	...

00315024 <___strtok>:
  315024:	00 00                	add    %al,(%eax)
	...

00315028 <ramdisk>:
  315028:	00 00                	add    %al,(%eax)
	...

0031502c <ramdiskCount>:
  31502c:	00 00                	add    %al,(%eax)
	...

00315030 <___strtok>:
  315030:	00 00                	add    %al,(%eax)
	...

00315034 <video_mem_base>:
  315034:	00 00                	add    %al,(%eax)
	...

00315038 <video_num_columns>:
  315038:	00 00                	add    %al,(%eax)
	...

0031503c <video_num_lines>:
  31503c:	00 00                	add    %al,(%eax)
	...

00315040 <video_size_row>:
  315040:	00 00                	add    %al,(%eax)
	...

00315044 <fg_cons>:
  315044:	00 00                	add    %al,(%eax)
	...

00315048 <___strtok>:
  315048:	00 00                	add    %al,(%eax)
	...

0031504c <inq>:
  31504c:	00 00                	add    %al,(%eax)
	...

00315050 <tail>:
	...

00315080 <___strtok>:
	...

003150c0 <buffer>:
	...

003151c0 <index>:
  3151c0:	00 00                	add    %al,(%eax)
	...

003151c4 <admit>:
  3151c4:	00 00                	add    %al,(%eax)
	...

003151c8 <count>:
  3151c8:	00 00                	add    %al,(%eax)
	...

003151cc <_buf>:
  3151cc:	00 00                	add    %al,(%eax)
	...

003151d0 <___strtok>:
  3151d0:	00 00                	add    %al,(%eax)
	...

003151d4 <___strtok>:
  3151d4:	00 00                	add    %al,(%eax)
	...

003151d8 <___strtok>:
  3151d8:	00 00                	add    %al,(%eax)
	...

003151dc <___strtok>:
	...

00315200 <irq_object_table>:
	...

00315240 <irq_table>:
	...

00315280 <object_table>:
	...

00315e80 <super>:
	...

00315ec0 <root_inode>:
	...

00315f1c <vc_cons>:
	...

00315f40 <kb_in>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    %edi
   1:	43                   	inc    %ebx
   2:	43                   	inc    %ebx
   3:	3a 20                	cmp    (%eax),%ah
   5:	28 47 4e             	sub    %al,0x4e(%edi)
   8:	55                   	push   %ebp
   9:	29 20                	sub    %esp,(%eax)
   b:	34 2e                	xor    $0x2e,%al
   d:	39 2e                	cmp    %ebp,(%esi)
   f:	30 00                	xor    %al,(%eax)
