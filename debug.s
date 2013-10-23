
tests/test:     file format elf32-i386


Disassembly of section .text:

00c00000 <main>:
  c00000:	55                   	push   %ebp
  c00001:	89 e5                	mov    %esp,%ebp
  c00003:	57                   	push   %edi
  c00004:	56                   	push   %esi
  c00005:	53                   	push   %ebx
  c00006:	83 e4 f0             	and    $0xfffffff0,%esp
  c00009:	83 ec 40             	sub    $0x40,%esp
  c0000c:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  c00013:	00 
  c00014:	c7 44 24 20 02 00 00 	movl   $0x2,0x20(%esp)
  c0001b:	00 
  c0001c:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  c00023:	00 
  c00024:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  c0002b:	00 
  c0002c:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
  c00033:	00 
  c00034:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  c0003b:	00 
  c0003c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  c00043:	00 
  c00044:	c7 44 24 08 ff ff 00 	movl   $0xffff,0x8(%esp)
  c0004b:	00 
  c0004c:	c7 44 24 04 00 00 0a 	movl   $0xa0000,0x4(%esp)
  c00053:	00 
  c00054:	c7 04 24 00 14 00 00 	movl   $0x1400,(%esp)
  c0005b:	e8 16 02 00 00       	call   c00276 <installGDT>
  c00060:	c7 44 24 20 02 00 00 	movl   $0x2,0x20(%esp)
  c00067:	00 
  c00068:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  c0006f:	00 
  c00070:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  c00077:	00 
  c00078:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
  c0007f:	00 
  c00080:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  c00087:	00 
  c00088:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  c0008f:	00 
  c00090:	c7 44 24 08 ff ff 00 	movl   $0xffff,0x8(%esp)
  c00097:	00 
  c00098:	c7 44 24 04 00 00 0b 	movl   $0xb0000,0x4(%esp)
  c0009f:	00 
  c000a0:	c7 04 24 00 16 00 00 	movl   $0x1600,(%esp)
  c000a7:	e8 ca 01 00 00       	call   c00276 <installGDT>
  c000ac:	c7 44 24 08 00 00 01 	movl   $0x10000,0x8(%esp)
  c000b3:	00 
  c000b4:	c7 44 24 04 00 00 0c 	movl   $0xc0000,0x4(%esp)
  c000bb:	00 
  c000bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  c000c3:	e8 9c 03 00 00       	call   c00464 <memcpy>
  c000c8:	e8 51 01 00 00       	call   c0021e <getPMInfo>
  c000cd:	89 44 24 38          	mov    %eax,0x38(%esp)
  c000d1:	8b 44 24 38          	mov    0x38(%esp),%eax
  c000d5:	66 c7 40 08 10 00    	movw   $0x10,0x8(%eax)
  c000db:	8b 44 24 38          	mov    0x38(%esp),%eax
  c000df:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  c000e3:	66 a3 00 20 c1 00    	mov    %ax,0xc12000
  c000e9:	b8 02 4f 00 00       	mov    $0x4f02,%eax
  c000ee:	bb 01 01 00 00       	mov    $0x101,%ebx
  c000f3:	b9 00 00 00 00       	mov    $0x0,%ecx
  c000f8:	ba 00 00 00 00       	mov    $0x0,%edx
  c000fd:	be 00 00 00 00       	mov    $0x0,%esi
  c00102:	bf 00 00 00 00       	mov    $0x0,%edi
  c00107:	c1 e0 10             	shl    $0x10,%eax
  c0010a:	66 b8 30 00          	mov    $0x30,%ax
  c0010e:	fa                   	cli    
  c0010f:	8e d8                	mov    %eax,%ds
  c00111:	8e c0                	mov    %eax,%es
  c00113:	8e d0                	mov    %eax,%ss
  c00115:	c1 e8 10             	shr    $0x10,%eax
  c00118:	9a 02 87 00 00 28 00 	lcall  $0x28,$0x8702
  c0011f:	c1 e0 10             	shl    $0x10,%eax
  c00122:	b8 10 00 00 00       	mov    $0x10,%eax
  c00127:	8e d0                	mov    %eax,%ss
  c00129:	8e d8                	mov    %eax,%ds
  c0012b:	8e c0                	mov    %eax,%es
  c0012d:	c1 e8 10             	shr    $0x10,%eax
  c00130:	fb                   	sti    
  c00131:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
  c00138:	00 
  c00139:	eb 29                	jmp    c00164 <main+0x164>
  c0013b:	c7 44 24 0c 50 00 00 	movl   $0x50,0xc(%esp)
  c00142:	00 
  c00143:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  c00147:	89 44 24 08          	mov    %eax,0x8(%esp)
  c0014b:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
  c00152:	00 
  c00153:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  c0015a:	e8 11 00 00 00       	call   c00170 <drawPixel>
  c0015f:	83 44 24 3c 01       	addl   $0x1,0x3c(%esp)
  c00164:	81 7c 24 3c df 01 00 	cmpl   $0x1df,0x3c(%esp)
  c0016b:	00 
  c0016c:	7e cd                	jle    c0013b <main+0x13b>
  c0016e:	eb fe                	jmp    c0016e <main+0x16e>

00c00170 <drawPixel>:
  c00170:	55                   	push   %ebp
  c00171:	89 e5                	mov    %esp,%ebp
  c00173:	57                   	push   %edi
  c00174:	56                   	push   %esi
  c00175:	53                   	push   %ebx
  c00176:	83 ec 14             	sub    $0x14,%esp
  c00179:	8b 45 14             	mov    0x14(%ebp),%eax
  c0017c:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
  c00180:	8b 55 10             	mov    0x10(%ebp),%edx
  c00183:	89 d0                	mov    %edx,%eax
  c00185:	c1 e0 02             	shl    $0x2,%eax
  c00188:	01 d0                	add    %edx,%eax
  c0018a:	c1 e0 07             	shl    $0x7,%eax
  c0018d:	89 c2                	mov    %eax,%edx
  c0018f:	8b 45 0c             	mov    0xc(%ebp),%eax
  c00192:	01 d0                	add    %edx,%eax
  c00194:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c00197:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c0019a:	c1 e8 10             	shr    $0x10,%eax
  c0019d:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  c001a1:	0f b7 05 02 20 c1 00 	movzwl 0xc12002,%eax
  c001a8:	66 39 45 ee          	cmp    %ax,-0x12(%ebp)
  c001ac:	74 54                	je     c00202 <drawPixel+0x92>
  c001ae:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  c001b2:	66 a3 02 20 c1 00    	mov    %ax,0xc12002
  c001b8:	0f b7 15 02 20 c1 00 	movzwl 0xc12002,%edx
  c001bf:	b8 05 4f 00 00       	mov    $0x4f05,%eax
  c001c4:	bb 00 00 00 00       	mov    $0x0,%ebx
  c001c9:	b9 00 00 00 00       	mov    $0x0,%ecx
  c001ce:	be 00 00 00 00       	mov    $0x0,%esi
  c001d3:	bf 00 00 00 00       	mov    $0x0,%edi
  c001d8:	c1 e0 10             	shl    $0x10,%eax
  c001db:	66 b8 30 00          	mov    $0x30,%ax
  c001df:	fa                   	cli    
  c001e0:	8e d8                	mov    %eax,%ds
  c001e2:	8e c0                	mov    %eax,%es
  c001e4:	8e d0                	mov    %eax,%ss
  c001e6:	c1 e8 10             	shr    $0x10,%eax
  c001e9:	9a 02 87 00 00 28 00 	lcall  $0x28,$0x8702
  c001f0:	c1 e0 10             	shl    $0x10,%eax
  c001f3:	b8 10 00 00 00       	mov    $0x10,%eax
  c001f8:	8e d0                	mov    %eax,%ss
  c001fa:	8e d8                	mov    %eax,%ds
  c001fc:	8e c0                	mov    %eax,%es
  c001fe:	c1 e8 10             	shr    $0x10,%eax
  c00201:	fb                   	sti    
  c00202:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00205:	25 ff ff 00 00       	and    $0xffff,%eax
  c0020a:	8d 90 00 00 0a 00    	lea    0xa0000(%eax),%edx
  c00210:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  c00214:	88 02                	mov    %al,(%edx)
  c00216:	83 c4 14             	add    $0x14,%esp
  c00219:	5b                   	pop    %ebx
  c0021a:	5e                   	pop    %esi
  c0021b:	5f                   	pop    %edi
  c0021c:	5d                   	pop    %ebp
  c0021d:	c3                   	ret    

00c0021e <getPMInfo>:
  c0021e:	55                   	push   %ebp
  c0021f:	89 e5                	mov    %esp,%ebp
  c00221:	83 ec 28             	sub    $0x28,%esp
  c00224:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c0022b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c00232:	eb 32                	jmp    c00266 <getPMInfo+0x48>
  c00234:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c00237:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c0023a:	01 d0                	add    %edx,%eax
  c0023c:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  c00243:	00 
  c00244:	c7 44 24 04 96 03 c1 	movl   $0xc10396,0x4(%esp)
  c0024b:	00 
  c0024c:	89 04 24             	mov    %eax,(%esp)
  c0024f:	e8 91 02 00 00       	call   c004e5 <strncmp>
  c00254:	85 c0                	test   %eax,%eax
  c00256:	75 0a                	jne    c00262 <getPMInfo+0x44>
  c00258:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c0025b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c0025e:	01 d0                	add    %edx,%eax
  c00260:	eb 12                	jmp    c00274 <getPMInfo+0x56>
  c00262:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  c00266:	81 7d f4 ff ff 00 00 	cmpl   $0xffff,-0xc(%ebp)
  c0026d:	7e c5                	jle    c00234 <getPMInfo+0x16>
  c0026f:	b8 00 00 00 00       	mov    $0x0,%eax
  c00274:	c9                   	leave  
  c00275:	c3                   	ret    

00c00276 <installGDT>:
  c00276:	55                   	push   %ebp
  c00277:	89 e5                	mov    %esp,%ebp
  c00279:	57                   	push   %edi
  c0027a:	56                   	push   %esi
  c0027b:	53                   	push   %ebx
  c0027c:	83 ec 34             	sub    $0x34,%esp
  c0027f:	8b 45 08             	mov    0x8(%ebp),%eax
  c00282:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  c00285:	8b 7d 14             	mov    0x14(%ebp),%edi
  c00288:	8b 75 18             	mov    0x18(%ebp),%esi
  c0028b:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
  c0028e:	8b 4d 20             	mov    0x20(%ebp),%ecx
  c00291:	8b 55 24             	mov    0x24(%ebp),%edx
  c00294:	8b 45 28             	mov    0x28(%ebp),%eax
  c00297:	89 45 c0             	mov    %eax,-0x40(%ebp)
  c0029a:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
  c0029e:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
  c002a2:	89 f8                	mov    %edi,%eax
  c002a4:	88 45 dc             	mov    %al,-0x24(%ebp)
  c002a7:	89 f0                	mov    %esi,%eax
  c002a9:	88 45 d8             	mov    %al,-0x28(%ebp)
  c002ac:	88 5d d4             	mov    %bl,-0x2c(%ebp)
  c002af:	88 4d d0             	mov    %cl,-0x30(%ebp)
  c002b2:	88 55 cc             	mov    %dl,-0x34(%ebp)
  c002b5:	0f b6 45 c0          	movzbl -0x40(%ebp),%eax
  c002b9:	88 45 c8             	mov    %al,-0x38(%ebp)
  c002bc:	c7 45 f0 00 09 20 00 	movl   $0x200900,-0x10(%ebp)
  c002c3:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  c002c7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  c002ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c002d1:	01 c2                	add    %eax,%edx
  c002d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  c002d6:	66 89 42 02          	mov    %ax,0x2(%edx)
  c002da:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  c002de:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  c002e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c002e8:	01 c2                	add    %eax,%edx
  c002ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  c002ed:	c1 e8 10             	shr    $0x10,%eax
  c002f0:	88 42 04             	mov    %al,0x4(%edx)
  c002f3:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  c002f7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  c002fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00301:	01 c2                	add    %eax,%edx
  c00303:	8b 45 0c             	mov    0xc(%ebp),%eax
  c00306:	c1 e8 18             	shr    $0x18,%eax
  c00309:	88 42 07             	mov    %al,0x7(%edx)
  c0030c:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  c00310:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  c00317:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c0031a:	01 c2                	add    %eax,%edx
  c0031c:	8b 45 10             	mov    0x10(%ebp),%eax
  c0031f:	66 89 02             	mov    %ax,(%edx)
  c00322:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  c00326:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  c0032d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00330:	01 c2                	add    %eax,%edx
  c00332:	8b 45 10             	mov    0x10(%ebp),%eax
  c00335:	c1 e8 10             	shr    $0x10,%eax
  c00338:	c1 e0 04             	shl    $0x4,%eax
  c0033b:	c0 f8 04             	sar    $0x4,%al
  c0033e:	89 c1                	mov    %eax,%ecx
  c00340:	83 e1 0f             	and    $0xf,%ecx
  c00343:	0f b6 42 06          	movzbl 0x6(%edx),%eax
  c00347:	83 e0 f0             	and    $0xfffffff0,%eax
  c0034a:	09 c8                	or     %ecx,%eax
  c0034c:	88 42 06             	mov    %al,0x6(%edx)
  c0034f:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  c00353:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  c0035a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c0035d:	01 c2                	add    %eax,%edx
  c0035f:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  c00363:	c1 e0 07             	shl    $0x7,%eax
  c00366:	c0 f8 07             	sar    $0x7,%al
  c00369:	89 c1                	mov    %eax,%ecx
  c0036b:	c1 e1 07             	shl    $0x7,%ecx
  c0036e:	0f b6 42 06          	movzbl 0x6(%edx),%eax
  c00372:	83 e0 7f             	and    $0x7f,%eax
  c00375:	09 c8                	or     %ecx,%eax
  c00377:	88 42 06             	mov    %al,0x6(%edx)
  c0037a:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  c0037e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  c00385:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00388:	01 c2                	add    %eax,%edx
  c0038a:	0f b6 45 d8          	movzbl -0x28(%ebp),%eax
  c0038e:	c1 e0 07             	shl    $0x7,%eax
  c00391:	c0 f8 07             	sar    $0x7,%al
  c00394:	83 e0 01             	and    $0x1,%eax
  c00397:	89 c1                	mov    %eax,%ecx
  c00399:	c1 e1 06             	shl    $0x6,%ecx
  c0039c:	0f b6 42 06          	movzbl 0x6(%edx),%eax
  c003a0:	83 e0 bf             	and    $0xffffffbf,%eax
  c003a3:	09 c8                	or     %ecx,%eax
  c003a5:	88 42 06             	mov    %al,0x6(%edx)
  c003a8:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  c003ac:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  c003b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c003b6:	01 c2                	add    %eax,%edx
  c003b8:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
  c003bc:	c1 e0 07             	shl    $0x7,%eax
  c003bf:	c0 f8 07             	sar    $0x7,%al
  c003c2:	89 c1                	mov    %eax,%ecx
  c003c4:	c1 e1 07             	shl    $0x7,%ecx
  c003c7:	0f b6 42 05          	movzbl 0x5(%edx),%eax
  c003cb:	83 e0 7f             	and    $0x7f,%eax
  c003ce:	09 c8                	or     %ecx,%eax
  c003d0:	88 42 05             	mov    %al,0x5(%edx)
  c003d3:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  c003d7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  c003de:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c003e1:	01 c2                	add    %eax,%edx
  c003e3:	0f b6 45 d0          	movzbl -0x30(%ebp),%eax
  c003e7:	c1 e0 06             	shl    $0x6,%eax
  c003ea:	c0 f8 06             	sar    $0x6,%al
  c003ed:	83 e0 03             	and    $0x3,%eax
  c003f0:	89 c1                	mov    %eax,%ecx
  c003f2:	c1 e1 05             	shl    $0x5,%ecx
  c003f5:	0f b6 42 05          	movzbl 0x5(%edx),%eax
  c003f9:	83 e0 9f             	and    $0xffffff9f,%eax
  c003fc:	09 c8                	or     %ecx,%eax
  c003fe:	88 42 05             	mov    %al,0x5(%edx)
  c00401:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  c00405:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  c0040c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c0040f:	01 c2                	add    %eax,%edx
  c00411:	0f b6 45 cc          	movzbl -0x34(%ebp),%eax
  c00415:	c1 e0 07             	shl    $0x7,%eax
  c00418:	c0 f8 07             	sar    $0x7,%al
  c0041b:	83 e0 01             	and    $0x1,%eax
  c0041e:	89 c1                	mov    %eax,%ecx
  c00420:	c1 e1 04             	shl    $0x4,%ecx
  c00423:	0f b6 42 05          	movzbl 0x5(%edx),%eax
  c00427:	83 e0 ef             	and    $0xffffffef,%eax
  c0042a:	09 c8                	or     %ecx,%eax
  c0042c:	88 42 05             	mov    %al,0x5(%edx)
  c0042f:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
  c00433:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  c0043a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c0043d:	01 c2                	add    %eax,%edx
  c0043f:	0f b6 45 c8          	movzbl -0x38(%ebp),%eax
  c00443:	c1 e0 04             	shl    $0x4,%eax
  c00446:	c0 f8 04             	sar    $0x4,%al
  c00449:	89 c1                	mov    %eax,%ecx
  c0044b:	83 e1 0f             	and    $0xf,%ecx
  c0044e:	0f b6 42 05          	movzbl 0x5(%edx),%eax
  c00452:	83 e0 f0             	and    $0xfffffff0,%eax
  c00455:	09 c8                	or     %ecx,%eax
  c00457:	88 42 05             	mov    %al,0x5(%edx)
  c0045a:	83 c4 34             	add    $0x34,%esp
  c0045d:	5b                   	pop    %ebx
  c0045e:	5e                   	pop    %esi
  c0045f:	5f                   	pop    %edi
  c00460:	5d                   	pop    %ebp
  c00461:	c3                   	ret    
  c00462:	66 90                	xchg   %ax,%ax

00c00464 <memcpy>:
  c00464:	55                   	push   %ebp
  c00465:	89 e5                	mov    %esp,%ebp
  c00467:	57                   	push   %edi
  c00468:	56                   	push   %esi
  c00469:	53                   	push   %ebx
  c0046a:	8b 45 10             	mov    0x10(%ebp),%eax
  c0046d:	8b 55 0c             	mov    0xc(%ebp),%edx
  c00470:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c00473:	89 c1                	mov    %eax,%ecx
  c00475:	89 d6                	mov    %edx,%esi
  c00477:	89 df                	mov    %ebx,%edi
  c00479:	fc                   	cld    
  c0047a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  c0047c:	8b 45 08             	mov    0x8(%ebp),%eax
  c0047f:	5b                   	pop    %ebx
  c00480:	5e                   	pop    %esi
  c00481:	5f                   	pop    %edi
  c00482:	5d                   	pop    %ebp
  c00483:	c3                   	ret    

00c00484 <memset>:
  c00484:	55                   	push   %ebp
  c00485:	89 e5                	mov    %esp,%ebp
  c00487:	57                   	push   %edi
  c00488:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0048b:	8b 55 08             	mov    0x8(%ebp),%edx
  c0048e:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c00491:	89 d7                	mov    %edx,%edi
  c00493:	88 07                	mov    %al,(%edi)
  c00495:	47                   	inc    %edi
  c00496:	e2 fb                	loop   c00493 <memset+0xf>
  c00498:	8b 45 08             	mov    0x8(%ebp),%eax
  c0049b:	5f                   	pop    %edi
  c0049c:	5d                   	pop    %ebp
  c0049d:	c3                   	ret    

00c0049e <strcpy>:
  c0049e:	55                   	push   %ebp
  c0049f:	89 e5                	mov    %esp,%ebp
  c004a1:	57                   	push   %edi
  c004a2:	56                   	push   %esi
  c004a3:	8b 45 08             	mov    0x8(%ebp),%eax
  c004a6:	8b 55 0c             	mov    0xc(%ebp),%edx
  c004a9:	89 c7                	mov    %eax,%edi
  c004ab:	89 d6                	mov    %edx,%esi
  c004ad:	ac                   	lods   %ds:(%esi),%al
  c004ae:	aa                   	stos   %al,%es:(%edi)
  c004af:	84 c0                	test   %al,%al
  c004b1:	75 fa                	jne    c004ad <strcpy+0xf>
  c004b3:	8b 45 08             	mov    0x8(%ebp),%eax
  c004b6:	5e                   	pop    %esi
  c004b7:	5f                   	pop    %edi
  c004b8:	5d                   	pop    %ebp
  c004b9:	c3                   	ret    

00c004ba <strlen>:
  c004ba:	55                   	push   %ebp
  c004bb:	89 e5                	mov    %esp,%ebp
  c004bd:	83 ec 10             	sub    $0x10,%esp
  c004c0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c004c7:	eb 04                	jmp    c004cd <strlen+0x13>
  c004c9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  c004cd:	8b 45 08             	mov    0x8(%ebp),%eax
  c004d0:	0f b6 00             	movzbl (%eax),%eax
  c004d3:	84 c0                	test   %al,%al
  c004d5:	0f 95 c0             	setne  %al
  c004d8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c004dc:	84 c0                	test   %al,%al
  c004de:	75 e9                	jne    c004c9 <strlen+0xf>
  c004e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c004e3:	c9                   	leave  
  c004e4:	c3                   	ret    

00c004e5 <strncmp>:
  c004e5:	55                   	push   %ebp
  c004e6:	89 e5                	mov    %esp,%ebp
  c004e8:	57                   	push   %edi
  c004e9:	56                   	push   %esi
  c004ea:	53                   	push   %ebx
  c004eb:	83 ec 14             	sub    $0x14,%esp
  c004ee:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c004f5:	8b 55 08             	mov    0x8(%ebp),%edx
  c004f8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  c004fb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c004fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c00501:	89 d6                	mov    %edx,%esi
  c00503:	89 df                	mov    %ebx,%edi
  c00505:	fc                   	cld    
  c00506:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
  c00508:	0f 95 c0             	setne  %al
  c0050b:	89 c3                	mov    %eax,%ebx
  c0050d:	89 5d f0             	mov    %ebx,-0x10(%ebp)
  c00510:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00513:	83 c4 14             	add    $0x14,%esp
  c00516:	5b                   	pop    %ebx
  c00517:	5e                   	pop    %esi
  c00518:	5f                   	pop    %edi
  c00519:	5d                   	pop    %ebp
  c0051a:	c3                   	ret    

00c0051b <strcmp>:
  c0051b:	55                   	push   %ebp
  c0051c:	89 e5                	mov    %esp,%ebp
  c0051e:	eb 08                	jmp    c00528 <strcmp+0xd>
  c00520:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c00524:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  c00528:	8b 45 08             	mov    0x8(%ebp),%eax
  c0052b:	0f b6 10             	movzbl (%eax),%edx
  c0052e:	8b 45 0c             	mov    0xc(%ebp),%eax
  c00531:	0f b6 00             	movzbl (%eax),%eax
  c00534:	38 c2                	cmp    %al,%dl
  c00536:	75 0a                	jne    c00542 <strcmp+0x27>
  c00538:	8b 45 08             	mov    0x8(%ebp),%eax
  c0053b:	0f b6 00             	movzbl (%eax),%eax
  c0053e:	84 c0                	test   %al,%al
  c00540:	75 de                	jne    c00520 <strcmp+0x5>
  c00542:	8b 45 08             	mov    0x8(%ebp),%eax
  c00545:	0f b6 00             	movzbl (%eax),%eax
  c00548:	0f be d0             	movsbl %al,%edx
  c0054b:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0054e:	0f b6 00             	movzbl (%eax),%eax
  c00551:	0f be c0             	movsbl %al,%eax
  c00554:	89 d1                	mov    %edx,%ecx
  c00556:	29 c1                	sub    %eax,%ecx
  c00558:	89 c8                	mov    %ecx,%eax
  c0055a:	5d                   	pop    %ebp
  c0055b:	c3                   	ret    
