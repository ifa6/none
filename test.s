
objs/bin/test:     file format elf32-i386


Disassembly of section .text:

00c00000 <main>:
  c00000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  c00004:	83 e4 f0             	and    $0xfffffff0,%esp
  c00007:	ff 71 fc             	pushl  -0x4(%ecx)
  c0000a:	55                   	push   %ebp
  c0000b:	89 e5                	mov    %esp,%ebp
  c0000d:	53                   	push   %ebx
  c0000e:	51                   	push   %ecx
  c0000f:	83 ec 10             	sub    $0x10,%esp
  c00012:	89 cb                	mov    %ecx,%ebx
  c00014:	83 ec 0c             	sub    $0xc,%esp
  c00017:	68 f8 08 c0 00       	push   $0xc008f8
  c0001c:	e8 d7 00 00 00       	call   c000f8 <printf>
  c00021:	83 c4 10             	add    $0x10,%esp
  c00024:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c0002b:	eb 29                	jmp    c00056 <main+0x56>
  c0002d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00030:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c00037:	8b 43 04             	mov    0x4(%ebx),%eax
  c0003a:	01 d0                	add    %edx,%eax
  c0003c:	8b 00                	mov    (%eax),%eax
  c0003e:	83 ec 04             	sub    $0x4,%esp
  c00041:	50                   	push   %eax
  c00042:	ff 75 f4             	pushl  -0xc(%ebp)
  c00045:	68 05 09 c0 00       	push   $0xc00905
  c0004a:	e8 a9 00 00 00       	call   c000f8 <printf>
  c0004f:	83 c4 10             	add    $0x10,%esp
  c00052:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  c00056:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00059:	3b 03                	cmp    (%ebx),%eax
  c0005b:	7c d0                	jl     c0002d <main+0x2d>
  c0005d:	83 ec 0c             	sub    $0xc,%esp
  c00060:	68 14 09 c0 00       	push   $0xc00914
  c00065:	e8 8e 00 00 00       	call   c000f8 <printf>
  c0006a:	83 c4 10             	add    $0x10,%esp
  c0006d:	83 ec 0c             	sub    $0xc,%esp
  c00070:	6a 00                	push   $0x0
  c00072:	e8 46 00 00 00       	call   c000bd <exit>
  c00077:	90                   	nop

00c00078 <_start>:
  c00078:	23 25 f0 ff ff ff    	and    0xfffffff0,%esp
  c0007e:	50                   	push   %eax
  c0007f:	51                   	push   %ecx
  c00080:	e8 7b ff ff ff       	call   c00000 <main>
  c00085:	83 c4 08             	add    $0x8,%esp
  c00088:	50                   	push   %eax
  c00089:	e8 2f 00 00 00       	call   c000bd <exit>
  c0008e:	66 90                	xchg   %ax,%ax

00c00090 <_run>:
  c00090:	55                   	push   %ebp
  c00091:	89 e5                	mov    %esp,%ebp
  c00093:	57                   	push   %edi
  c00094:	56                   	push   %esi
  c00095:	53                   	push   %ebx
  c00096:	83 ec 10             	sub    $0x10,%esp
  c00099:	8b 55 10             	mov    0x10(%ebp),%edx
  c0009c:	8b 75 18             	mov    0x18(%ebp),%esi
  c0009f:	8b 7d 14             	mov    0x14(%ebp),%edi
  c000a2:	b8 00 00 00 00       	mov    $0x0,%eax
  c000a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c000aa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c000ad:	cd 80                	int    $0x80
  c000af:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c000b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c000b5:	83 c4 10             	add    $0x10,%esp
  c000b8:	5b                   	pop    %ebx
  c000b9:	5e                   	pop    %esi
  c000ba:	5f                   	pop    %edi
  c000bb:	5d                   	pop    %ebp
  c000bc:	c3                   	ret    

00c000bd <exit>:
  c000bd:	55                   	push   %ebp
  c000be:	89 e5                	mov    %esp,%ebp
  c000c0:	83 ec 10             	sub    $0x10,%esp
  c000c3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c000ca:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c000d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c000d8:	8b 45 08             	mov    0x8(%ebp),%eax
  c000db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c000de:	ff 75 fc             	pushl  -0x4(%ebp)
  c000e1:	ff 75 f8             	pushl  -0x8(%ebp)
  c000e4:	ff 75 f4             	pushl  -0xc(%ebp)
  c000e7:	6a 03                	push   $0x3
  c000e9:	6a 03                	push   $0x3
  c000eb:	e8 a0 ff ff ff       	call   c00090 <_run>
  c000f0:	83 c4 14             	add    $0x14,%esp
  c000f3:	c9                   	leave  
  c000f4:	c3                   	ret    
  c000f5:	66 90                	xchg   %ax,%ax
  c000f7:	90                   	nop

00c000f8 <printf>:
  c000f8:	55                   	push   %ebp
  c000f9:	89 e5                	mov    %esp,%ebp
  c000fb:	83 ec 18             	sub    $0x18,%esp
  c000fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c00105:	8d 45 0c             	lea    0xc(%ebp),%eax
  c00108:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c0010b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c0010e:	83 ec 04             	sub    $0x4,%esp
  c00111:	50                   	push   %eax
  c00112:	ff 75 08             	pushl  0x8(%ebp)
  c00115:	68 00 20 c0 00       	push   $0xc02000
  c0011a:	e8 28 04 00 00       	call   c00547 <vsprintf>
  c0011f:	83 c4 10             	add    $0x10,%esp
  c00122:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00125:	83 ec 04             	sub    $0x4,%esp
  c00128:	ff 75 f4             	pushl  -0xc(%ebp)
  c0012b:	68 00 20 c0 00       	push   $0xc02000
  c00130:	6a 01                	push   $0x1
  c00132:	e8 2a 07 00 00       	call   c00861 <write>
  c00137:	83 c4 10             	add    $0x10,%esp
  c0013a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c0013d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00140:	c9                   	leave  
  c00141:	c3                   	ret    
  c00142:	66 90                	xchg   %ax,%ax

00c00144 <strlen>:
  c00144:	55                   	push   %ebp
  c00145:	89 e5                	mov    %esp,%ebp
  c00147:	57                   	push   %edi
  c00148:	8b 55 08             	mov    0x8(%ebp),%edx
  c0014b:	b8 00 00 00 00       	mov    $0x0,%eax
  c00150:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c00155:	89 d7                	mov    %edx,%edi
  c00157:	fc                   	cld    
  c00158:	f2 ae                	repnz scas %es:(%edi),%al
  c0015a:	f7 d1                	not    %ecx
  c0015c:	49                   	dec    %ecx
  c0015d:	89 c8                	mov    %ecx,%eax
  c0015f:	5f                   	pop    %edi
  c00160:	5d                   	pop    %ebp
  c00161:	c3                   	ret    

00c00162 <memcpy>:
  c00162:	55                   	push   %ebp
  c00163:	89 e5                	mov    %esp,%ebp
  c00165:	57                   	push   %edi
  c00166:	56                   	push   %esi
  c00167:	53                   	push   %ebx
  c00168:	8b 45 10             	mov    0x10(%ebp),%eax
  c0016b:	8b 55 0c             	mov    0xc(%ebp),%edx
  c0016e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c00171:	89 c1                	mov    %eax,%ecx
  c00173:	89 d6                	mov    %edx,%esi
  c00175:	89 df                	mov    %ebx,%edi
  c00177:	fc                   	cld    
  c00178:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  c0017a:	8b 45 08             	mov    0x8(%ebp),%eax
  c0017d:	5b                   	pop    %ebx
  c0017e:	5e                   	pop    %esi
  c0017f:	5f                   	pop    %edi
  c00180:	5d                   	pop    %ebp
  c00181:	c3                   	ret    

00c00182 <_atoi>:
  c00182:	55                   	push   %ebp
  c00183:	89 e5                	mov    %esp,%ebp
  c00185:	53                   	push   %ebx
  c00186:	83 ec 10             	sub    $0x10,%esp
  c00189:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c00190:	eb 29                	jmp    c001bb <_atoi+0x39>
  c00192:	8b 55 f8             	mov    -0x8(%ebp),%edx
  c00195:	89 d0                	mov    %edx,%eax
  c00197:	c1 e0 02             	shl    $0x2,%eax
  c0019a:	01 d0                	add    %edx,%eax
  c0019c:	01 c0                	add    %eax,%eax
  c0019e:	89 c3                	mov    %eax,%ebx
  c001a0:	8b 45 08             	mov    0x8(%ebp),%eax
  c001a3:	8b 00                	mov    (%eax),%eax
  c001a5:	8d 48 01             	lea    0x1(%eax),%ecx
  c001a8:	8b 55 08             	mov    0x8(%ebp),%edx
  c001ab:	89 0a                	mov    %ecx,(%edx)
  c001ad:	0f b6 00             	movzbl (%eax),%eax
  c001b0:	0f be c0             	movsbl %al,%eax
  c001b3:	01 d8                	add    %ebx,%eax
  c001b5:	83 e8 30             	sub    $0x30,%eax
  c001b8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c001bb:	8b 45 08             	mov    0x8(%ebp),%eax
  c001be:	8b 00                	mov    (%eax),%eax
  c001c0:	0f b6 00             	movzbl (%eax),%eax
  c001c3:	3c 2f                	cmp    $0x2f,%al
  c001c5:	7e 0c                	jle    c001d3 <_atoi+0x51>
  c001c7:	8b 45 08             	mov    0x8(%ebp),%eax
  c001ca:	8b 00                	mov    (%eax),%eax
  c001cc:	0f b6 00             	movzbl (%eax),%eax
  c001cf:	3c 39                	cmp    $0x39,%al
  c001d1:	7e bf                	jle    c00192 <_atoi+0x10>
  c001d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c001d6:	83 c4 10             	add    $0x10,%esp
  c001d9:	5b                   	pop    %ebx
  c001da:	5d                   	pop    %ebp
  c001db:	c3                   	ret    

00c001dc <_octal>:
  c001dc:	55                   	push   %ebp
  c001dd:	89 e5                	mov    %esp,%ebp
  c001df:	83 ec 10             	sub    $0x10,%esp
  c001e2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c001e9:	8b 45 08             	mov    0x8(%ebp),%eax
  c001ec:	8d 50 04             	lea    0x4(%eax),%edx
  c001ef:	89 55 08             	mov    %edx,0x8(%ebp)
  c001f2:	8b 55 0c             	mov    0xc(%ebp),%edx
  c001f5:	83 e2 07             	and    $0x7,%edx
  c001f8:	89 10                	mov    %edx,(%eax)
  c001fa:	c1 6d 0c 03          	shrl   $0x3,0xc(%ebp)
  c001fe:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  c00202:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c00206:	75 e1                	jne    c001e9 <_octal+0xd>
  c00208:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c0020b:	c9                   	leave  
  c0020c:	c3                   	ret    

00c0020d <_decimal>:
  c0020d:	55                   	push   %ebp
  c0020e:	89 e5                	mov    %esp,%ebp
  c00210:	53                   	push   %ebx
  c00211:	83 ec 10             	sub    $0x10,%esp
  c00214:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c0021b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c0021e:	8d 41 04             	lea    0x4(%ecx),%eax
  c00221:	89 45 08             	mov    %eax,0x8(%ebp)
  c00224:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  c00227:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  c0022c:	89 d8                	mov    %ebx,%eax
  c0022e:	f7 e2                	mul    %edx
  c00230:	c1 ea 03             	shr    $0x3,%edx
  c00233:	89 d0                	mov    %edx,%eax
  c00235:	c1 e0 02             	shl    $0x2,%eax
  c00238:	01 d0                	add    %edx,%eax
  c0023a:	01 c0                	add    %eax,%eax
  c0023c:	29 c3                	sub    %eax,%ebx
  c0023e:	89 da                	mov    %ebx,%edx
  c00240:	89 d0                	mov    %edx,%eax
  c00242:	89 01                	mov    %eax,(%ecx)
  c00244:	8b 45 0c             	mov    0xc(%ebp),%eax
  c00247:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  c0024c:	f7 e2                	mul    %edx
  c0024e:	89 d0                	mov    %edx,%eax
  c00250:	c1 e8 03             	shr    $0x3,%eax
  c00253:	89 45 0c             	mov    %eax,0xc(%ebp)
  c00256:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  c0025a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c0025e:	75 bb                	jne    c0021b <_decimal+0xe>
  c00260:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c00263:	83 c4 10             	add    $0x10,%esp
  c00266:	5b                   	pop    %ebx
  c00267:	5d                   	pop    %ebp
  c00268:	c3                   	ret    

00c00269 <_hex>:
  c00269:	55                   	push   %ebp
  c0026a:	89 e5                	mov    %esp,%ebp
  c0026c:	83 ec 10             	sub    $0x10,%esp
  c0026f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c00276:	8b 45 08             	mov    0x8(%ebp),%eax
  c00279:	8d 50 04             	lea    0x4(%eax),%edx
  c0027c:	89 55 08             	mov    %edx,0x8(%ebp)
  c0027f:	8b 55 0c             	mov    0xc(%ebp),%edx
  c00282:	83 e2 0f             	and    $0xf,%edx
  c00285:	89 10                	mov    %edx,(%eax)
  c00287:	c1 6d 0c 04          	shrl   $0x4,0xc(%ebp)
  c0028b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  c0028f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c00293:	75 e1                	jne    c00276 <_hex+0xd>
  c00295:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c00298:	c9                   	leave  
  c00299:	c3                   	ret    

00c0029a <_toNumber>:
  c0029a:	55                   	push   %ebp
  c0029b:	89 e5                	mov    %esp,%ebp
  c0029d:	81 ec 18 01 00 00    	sub    $0x118,%esp
  c002a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  c002a6:	89 85 e8 fe ff ff    	mov    %eax,-0x118(%ebp)
  c002ac:	8b 45 10             	mov    0x10(%ebp),%eax
  c002af:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
  c002b5:	c6 45 ff 2b          	movb   $0x2b,-0x1(%ebp)
  c002b9:	c7 45 f8 24 09 c0 00 	movl   $0xc00924,-0x8(%ebp)
  c002c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c002c7:	8b 45 20             	mov    0x20(%ebp),%eax
  c002ca:	83 e0 10             	and    $0x10,%eax
  c002cd:	85 c0                	test   %eax,%eax
  c002cf:	74 07                	je     c002d8 <_toNumber+0x3e>
  c002d1:	c7 45 f8 3c 09 c0 00 	movl   $0xc0093c,-0x8(%ebp)
  c002d8:	8b 45 20             	mov    0x20(%ebp),%eax
  c002db:	83 e0 01             	and    $0x1,%eax
  c002de:	85 c0                	test   %eax,%eax
  c002e0:	74 04                	je     c002e6 <_toNumber+0x4c>
  c002e2:	83 65 20 f7          	andl   $0xfffffff7,0x20(%ebp)
  c002e6:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
  c002ea:	74 0d                	je     c002f9 <_toNumber+0x5f>
  c002ec:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
  c002f3:	83 65 20 fd          	andl   $0xfffffffd,0x20(%ebp)
  c002f7:	eb 04                	jmp    c002fd <_toNumber+0x63>
  c002f9:	83 65 20 fb          	andl   $0xfffffffb,0x20(%ebp)
  c002fd:	8b 45 20             	mov    0x20(%ebp),%eax
  c00300:	83 e0 04             	and    $0x4,%eax
  c00303:	85 c0                	test   %eax,%eax
  c00305:	74 16                	je     c0031d <_toNumber+0x83>
  c00307:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
  c0030b:	75 06                	jne    c00313 <_toNumber+0x79>
  c0030d:	83 6d 1c 02          	subl   $0x2,0x1c(%ebp)
  c00311:	eb 0a                	jmp    c0031d <_toNumber+0x83>
  c00313:	83 7d 18 08          	cmpl   $0x8,0x18(%ebp)
  c00317:	75 04                	jne    c0031d <_toNumber+0x83>
  c00319:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  c0031d:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
  c00321:	75 2b                	jne    c0034e <_toNumber+0xb4>
  c00323:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  c00329:	8b 95 ec fe ff ff    	mov    -0x114(%ebp),%edx
  c0032f:	85 d2                	test   %edx,%edx
  c00331:	79 1b                	jns    c0034e <_toNumber+0xb4>
  c00333:	83 4d 20 02          	orl    $0x2,0x20(%ebp)
  c00337:	f7 9d e8 fe ff ff    	negl   -0x118(%ebp)
  c0033d:	83 95 ec fe ff ff 00 	adcl   $0x0,-0x114(%ebp)
  c00344:	f7 9d ec fe ff ff    	negl   -0x114(%ebp)
  c0034a:	c6 45 ff 2d          	movb   $0x2d,-0x1(%ebp)
  c0034e:	8b 45 24             	mov    0x24(%ebp),%eax
  c00351:	99                   	cltd   
  c00352:	21 85 e8 fe ff ff    	and    %eax,-0x118(%ebp)
  c00358:	21 95 ec fe ff ff    	and    %edx,-0x114(%ebp)
  c0035e:	8b 45 20             	mov    0x20(%ebp),%eax
  c00361:	83 e0 02             	and    $0x2,%eax
  c00364:	85 c0                	test   %eax,%eax
  c00366:	74 04                	je     c0036c <_toNumber+0xd2>
  c00368:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  c0036c:	8b 45 18             	mov    0x18(%ebp),%eax
  c0036f:	83 f8 0a             	cmp    $0xa,%eax
  c00372:	74 25                	je     c00399 <_toNumber+0xff>
  c00374:	83 f8 10             	cmp    $0x10,%eax
  c00377:	74 3b                	je     c003b4 <_toNumber+0x11a>
  c00379:	83 f8 08             	cmp    $0x8,%eax
  c0037c:	75 50                	jne    c003ce <_toNumber+0x134>
  c0037e:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  c00384:	50                   	push   %eax
  c00385:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  c0038b:	50                   	push   %eax
  c0038c:	e8 4b fe ff ff       	call   c001dc <_octal>
  c00391:	83 c4 08             	add    $0x8,%esp
  c00394:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00397:	eb 35                	jmp    c003ce <_toNumber+0x134>
  c00399:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  c0039f:	50                   	push   %eax
  c003a0:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  c003a6:	50                   	push   %eax
  c003a7:	e8 61 fe ff ff       	call   c0020d <_decimal>
  c003ac:	83 c4 08             	add    $0x8,%esp
  c003af:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c003b2:	eb 1a                	jmp    c003ce <_toNumber+0x134>
  c003b4:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  c003ba:	50                   	push   %eax
  c003bb:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  c003c1:	50                   	push   %eax
  c003c2:	e8 a2 fe ff ff       	call   c00269 <_hex>
  c003c7:	83 c4 08             	add    $0x8,%esp
  c003ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c003cd:	90                   	nop
  c003ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c003d1:	29 45 1c             	sub    %eax,0x1c(%ebp)
  c003d4:	8b 45 20             	mov    0x20(%ebp),%eax
  c003d7:	83 e0 09             	and    $0x9,%eax
  c003da:	85 c0                	test   %eax,%eax
  c003dc:	75 1b                	jne    c003f9 <_toNumber+0x15f>
  c003de:	eb 0c                	jmp    c003ec <_toNumber+0x152>
  c003e0:	8b 45 08             	mov    0x8(%ebp),%eax
  c003e3:	8d 50 01             	lea    0x1(%eax),%edx
  c003e6:	89 55 08             	mov    %edx,0x8(%ebp)
  c003e9:	c6 00 20             	movb   $0x20,(%eax)
  c003ec:	8b 45 1c             	mov    0x1c(%ebp),%eax
  c003ef:	8d 50 ff             	lea    -0x1(%eax),%edx
  c003f2:	89 55 1c             	mov    %edx,0x1c(%ebp)
  c003f5:	85 c0                	test   %eax,%eax
  c003f7:	7f e7                	jg     c003e0 <_toNumber+0x146>
  c003f9:	8b 45 20             	mov    0x20(%ebp),%eax
  c003fc:	83 e0 02             	and    $0x2,%eax
  c003ff:	85 c0                	test   %eax,%eax
  c00401:	74 0f                	je     c00412 <_toNumber+0x178>
  c00403:	8b 45 08             	mov    0x8(%ebp),%eax
  c00406:	8d 50 01             	lea    0x1(%eax),%edx
  c00409:	89 55 08             	mov    %edx,0x8(%ebp)
  c0040c:	0f b6 55 ff          	movzbl -0x1(%ebp),%edx
  c00410:	88 10                	mov    %dl,(%eax)
  c00412:	8b 45 20             	mov    0x20(%ebp),%eax
  c00415:	83 e0 04             	and    $0x4,%eax
  c00418:	85 c0                	test   %eax,%eax
  c0041a:	74 24                	je     c00440 <_toNumber+0x1a6>
  c0041c:	8b 45 08             	mov    0x8(%ebp),%eax
  c0041f:	8d 50 01             	lea    0x1(%eax),%edx
  c00422:	89 55 08             	mov    %edx,0x8(%ebp)
  c00425:	c6 00 30             	movb   $0x30,(%eax)
  c00428:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
  c0042c:	75 12                	jne    c00440 <_toNumber+0x1a6>
  c0042e:	8b 45 08             	mov    0x8(%ebp),%eax
  c00431:	8d 50 01             	lea    0x1(%eax),%edx
  c00434:	89 55 08             	mov    %edx,0x8(%ebp)
  c00437:	8b 55 f8             	mov    -0x8(%ebp),%edx
  c0043a:	0f b6 52 10          	movzbl 0x10(%edx),%edx
  c0043e:	88 10                	mov    %dl,(%eax)
  c00440:	8b 45 20             	mov    0x20(%ebp),%eax
  c00443:	83 e0 08             	and    $0x8,%eax
  c00446:	85 c0                	test   %eax,%eax
  c00448:	74 1b                	je     c00465 <_toNumber+0x1cb>
  c0044a:	eb 0c                	jmp    c00458 <_toNumber+0x1be>
  c0044c:	8b 45 08             	mov    0x8(%ebp),%eax
  c0044f:	8d 50 01             	lea    0x1(%eax),%edx
  c00452:	89 55 08             	mov    %edx,0x8(%ebp)
  c00455:	c6 00 30             	movb   $0x30,(%eax)
  c00458:	8b 45 1c             	mov    0x1c(%ebp),%eax
  c0045b:	8d 50 ff             	lea    -0x1(%eax),%edx
  c0045e:	89 55 1c             	mov    %edx,0x1c(%ebp)
  c00461:	85 c0                	test   %eax,%eax
  c00463:	7f e7                	jg     c0044c <_toNumber+0x1b2>
  c00465:	eb 1f                	jmp    c00486 <_toNumber+0x1ec>
  c00467:	8b 45 08             	mov    0x8(%ebp),%eax
  c0046a:	8d 50 01             	lea    0x1(%eax),%edx
  c0046d:	89 55 08             	mov    %edx,0x8(%ebp)
  c00470:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c00473:	8b 94 95 f4 fe ff ff 	mov    -0x10c(%ebp,%edx,4),%edx
  c0047a:	89 d1                	mov    %edx,%ecx
  c0047c:	8b 55 f8             	mov    -0x8(%ebp),%edx
  c0047f:	01 ca                	add    %ecx,%edx
  c00481:	0f b6 12             	movzbl (%edx),%edx
  c00484:	88 10                	mov    %dl,(%eax)
  c00486:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00489:	8d 50 ff             	lea    -0x1(%eax),%edx
  c0048c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  c0048f:	85 c0                	test   %eax,%eax
  c00491:	7f d4                	jg     c00467 <_toNumber+0x1cd>
  c00493:	8b 45 20             	mov    0x20(%ebp),%eax
  c00496:	83 e0 01             	and    $0x1,%eax
  c00499:	85 c0                	test   %eax,%eax
  c0049b:	74 1b                	je     c004b8 <_toNumber+0x21e>
  c0049d:	eb 0c                	jmp    c004ab <_toNumber+0x211>
  c0049f:	8b 45 08             	mov    0x8(%ebp),%eax
  c004a2:	8d 50 01             	lea    0x1(%eax),%edx
  c004a5:	89 55 08             	mov    %edx,0x8(%ebp)
  c004a8:	c6 00 20             	movb   $0x20,(%eax)
  c004ab:	8b 45 1c             	mov    0x1c(%ebp),%eax
  c004ae:	8d 50 ff             	lea    -0x1(%eax),%edx
  c004b1:	89 55 1c             	mov    %edx,0x1c(%ebp)
  c004b4:	85 c0                	test   %eax,%eax
  c004b6:	7f e7                	jg     c0049f <_toNumber+0x205>
  c004b8:	8b 45 08             	mov    0x8(%ebp),%eax
  c004bb:	c9                   	leave  
  c004bc:	c3                   	ret    

00c004bd <_toString>:
  c004bd:	55                   	push   %ebp
  c004be:	89 e5                	mov    %esp,%ebp
  c004c0:	83 ec 10             	sub    $0x10,%esp
  c004c3:	ff 75 0c             	pushl  0xc(%ebp)
  c004c6:	e8 79 fc ff ff       	call   c00144 <strlen>
  c004cb:	83 c4 04             	add    $0x4,%esp
  c004ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c004d1:	8b 45 08             	mov    0x8(%ebp),%eax
  c004d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c004d7:	8b 45 08             	mov    0x8(%ebp),%eax
  c004da:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c004dd:	8b 45 14             	mov    0x14(%ebp),%eax
  c004e0:	83 e0 01             	and    $0x1,%eax
  c004e3:	85 c0                	test   %eax,%eax
  c004e5:	74 0d                	je     c004f4 <_toString+0x37>
  c004e7:	8b 55 f0             	mov    -0x10(%ebp),%edx
  c004ea:	8b 45 08             	mov    0x8(%ebp),%eax
  c004ed:	01 d0                	add    %edx,%eax
  c004ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c004f2:	eb 0b                	jmp    c004ff <_toString+0x42>
  c004f4:	8b 55 f0             	mov    -0x10(%ebp),%edx
  c004f7:	8b 45 08             	mov    0x8(%ebp),%eax
  c004fa:	01 d0                	add    %edx,%eax
  c004fc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c004ff:	ff 75 f0             	pushl  -0x10(%ebp)
  c00502:	ff 75 0c             	pushl  0xc(%ebp)
  c00505:	ff 75 fc             	pushl  -0x4(%ebp)
  c00508:	e8 55 fc ff ff       	call   c00162 <memcpy>
  c0050d:	83 c4 0c             	add    $0xc,%esp
  c00510:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c00517:	eb 10                	jmp    c00529 <_toString+0x6c>
  c00519:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c0051c:	8d 50 01             	lea    0x1(%eax),%edx
  c0051f:	89 55 f8             	mov    %edx,-0x8(%ebp)
  c00522:	c6 00 20             	movb   $0x20,(%eax)
  c00525:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  c00529:	8b 45 10             	mov    0x10(%ebp),%eax
  c0052c:	2b 45 f0             	sub    -0x10(%ebp),%eax
  c0052f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  c00532:	7f e5                	jg     c00519 <_toString+0x5c>
  c00534:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00537:	39 45 10             	cmp    %eax,0x10(%ebp)
  c0053a:	0f 4d 45 10          	cmovge 0x10(%ebp),%eax
  c0053e:	89 c2                	mov    %eax,%edx
  c00540:	8b 45 08             	mov    0x8(%ebp),%eax
  c00543:	01 d0                	add    %edx,%eax
  c00545:	c9                   	leave  
  c00546:	c3                   	ret    

00c00547 <vsprintf>:
  c00547:	55                   	push   %ebp
  c00548:	89 e5                	mov    %esp,%ebp
  c0054a:	83 ec 30             	sub    $0x30,%esp
  c0054d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c00554:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c0055b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c00562:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  c00569:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  c00570:	c7 45 e4 6c 00 00 00 	movl   $0x6c,-0x1c(%ebp)
  c00577:	8b 45 08             	mov    0x8(%ebp),%eax
  c0057a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c0057d:	e9 69 02 00 00       	jmp    c007eb <vsprintf+0x2a4>
  c00582:	8b 45 0c             	mov    0xc(%ebp),%eax
  c00585:	0f b6 00             	movzbl (%eax),%eax
  c00588:	3c 25                	cmp    $0x25,%al
  c0058a:	0f 85 41 02 00 00    	jne    c007d1 <vsprintf+0x28a>
  c00590:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c00597:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c0059e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c005a5:	c7 45 e4 6c 00 00 00 	movl   $0x6c,-0x1c(%ebp)
  c005ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  c005af:	83 c0 01             	add    $0x1,%eax
  c005b2:	89 45 0c             	mov    %eax,0xc(%ebp)
  c005b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  c005b8:	0f b6 00             	movzbl (%eax),%eax
  c005bb:	0f be c0             	movsbl %al,%eax
  c005be:	83 e8 20             	sub    $0x20,%eax
  c005c1:	83 f8 10             	cmp    $0x10,%eax
  c005c4:	77 27                	ja     c005ed <vsprintf+0xa6>
  c005c6:	8b 04 85 5c 09 c0 00 	mov    0xc0095c(,%eax,4),%eax
  c005cd:	ff e0                	jmp    *%eax
  c005cf:	83 4d fc 01          	orl    $0x1,-0x4(%ebp)
  c005d3:	eb d7                	jmp    c005ac <vsprintf+0x65>
  c005d5:	83 4d fc 02          	orl    $0x2,-0x4(%ebp)
  c005d9:	eb d1                	jmp    c005ac <vsprintf+0x65>
  c005db:	83 4d fc 02          	orl    $0x2,-0x4(%ebp)
  c005df:	eb cb                	jmp    c005ac <vsprintf+0x65>
  c005e1:	83 4d fc 08          	orl    $0x8,-0x4(%ebp)
  c005e5:	eb c5                	jmp    c005ac <vsprintf+0x65>
  c005e7:	83 4d fc 04          	orl    $0x4,-0x4(%ebp)
  c005eb:	eb bf                	jmp    c005ac <vsprintf+0x65>
  c005ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  c005f0:	0f b6 00             	movzbl (%eax),%eax
  c005f3:	3c 2f                	cmp    $0x2f,%al
  c005f5:	7e 1b                	jle    c00612 <vsprintf+0xcb>
  c005f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  c005fa:	0f b6 00             	movzbl (%eax),%eax
  c005fd:	3c 39                	cmp    $0x39,%al
  c005ff:	7f 11                	jg     c00612 <vsprintf+0xcb>
  c00601:	8d 45 0c             	lea    0xc(%ebp),%eax
  c00604:	50                   	push   %eax
  c00605:	e8 78 fb ff ff       	call   c00182 <_atoi>
  c0060a:	83 c4 04             	add    $0x4,%esp
  c0060d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c00610:	eb 21                	jmp    c00633 <vsprintf+0xec>
  c00612:	8b 45 0c             	mov    0xc(%ebp),%eax
  c00615:	0f b6 00             	movzbl (%eax),%eax
  c00618:	3c 2a                	cmp    $0x2a,%al
  c0061a:	75 17                	jne    c00633 <vsprintf+0xec>
  c0061c:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0061f:	83 c0 01             	add    $0x1,%eax
  c00622:	89 45 0c             	mov    %eax,0xc(%ebp)
  c00625:	8b 45 10             	mov    0x10(%ebp),%eax
  c00628:	8d 50 04             	lea    0x4(%eax),%edx
  c0062b:	89 55 10             	mov    %edx,0x10(%ebp)
  c0062e:	8b 00                	mov    (%eax),%eax
  c00630:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c00633:	8b 45 0c             	mov    0xc(%ebp),%eax
  c00636:	0f b6 00             	movzbl (%eax),%eax
  c00639:	3c 68                	cmp    $0x68,%al
  c0063b:	74 1e                	je     c0065b <vsprintf+0x114>
  c0063d:	8b 45 0c             	mov    0xc(%ebp),%eax
  c00640:	0f b6 00             	movzbl (%eax),%eax
  c00643:	3c 6c                	cmp    $0x6c,%al
  c00645:	74 14                	je     c0065b <vsprintf+0x114>
  c00647:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0064a:	0f b6 00             	movzbl (%eax),%eax
  c0064d:	3c 4c                	cmp    $0x4c,%al
  c0064f:	74 0a                	je     c0065b <vsprintf+0x114>
  c00651:	8b 45 0c             	mov    0xc(%ebp),%eax
  c00654:	0f b6 00             	movzbl (%eax),%eax
  c00657:	3c 48                	cmp    $0x48,%al
  c00659:	75 15                	jne    c00670 <vsprintf+0x129>
  c0065b:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0065e:	0f b6 00             	movzbl (%eax),%eax
  c00661:	0f be c0             	movsbl %al,%eax
  c00664:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c00667:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0066a:	83 c0 01             	add    $0x1,%eax
  c0066d:	89 45 0c             	mov    %eax,0xc(%ebp)
  c00670:	8b 45 0c             	mov    0xc(%ebp),%eax
  c00673:	0f b6 00             	movzbl (%eax),%eax
  c00676:	0f be c0             	movsbl %al,%eax
  c00679:	83 e8 58             	sub    $0x58,%eax
  c0067c:	83 f8 20             	cmp    $0x20,%eax
  c0067f:	77 57                	ja     c006d8 <vsprintf+0x191>
  c00681:	8b 04 85 a0 09 c0 00 	mov    0xc009a0(,%eax,4),%eax
  c00688:	ff e0                	jmp    *%eax
  c0068a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c0068d:	8d 50 01             	lea    0x1(%eax),%edx
  c00690:	89 55 ec             	mov    %edx,-0x14(%ebp)
  c00693:	8b 55 10             	mov    0x10(%ebp),%edx
  c00696:	8d 4a 04             	lea    0x4(%edx),%ecx
  c00699:	89 4d 10             	mov    %ecx,0x10(%ebp)
  c0069c:	8b 12                	mov    (%edx),%edx
  c0069e:	88 10                	mov    %dl,(%eax)
  c006a0:	e9 3d 01 00 00       	jmp    c007e2 <vsprintf+0x29b>
  c006a5:	c7 45 e4 73 00 00 00 	movl   $0x73,-0x1c(%ebp)
  c006ac:	eb 50                	jmp    c006fe <vsprintf+0x1b7>
  c006ae:	83 4d fc 04          	orl    $0x4,-0x4(%ebp)
  c006b2:	83 4d fc 10          	orl    $0x10,-0x4(%ebp)
  c006b6:	c7 45 f0 10 00 00 00 	movl   $0x10,-0x10(%ebp)
  c006bd:	eb 3f                	jmp    c006fe <vsprintf+0x1b7>
  c006bf:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  c006c6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  c006cd:	eb 2e                	jmp    c006fd <vsprintf+0x1b6>
  c006cf:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
  c006d6:	eb 26                	jmp    c006fe <vsprintf+0x1b7>
  c006d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  c006db:	0f b6 00             	movzbl (%eax),%eax
  c006de:	84 c0                	test   %al,%al
  c006e0:	74 16                	je     c006f8 <vsprintf+0x1b1>
  c006e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c006e5:	8d 50 01             	lea    0x1(%eax),%edx
  c006e8:	89 55 ec             	mov    %edx,-0x14(%ebp)
  c006eb:	8b 55 0c             	mov    0xc(%ebp),%edx
  c006ee:	0f b6 12             	movzbl (%edx),%edx
  c006f1:	88 10                	mov    %dl,(%eax)
  c006f3:	e9 ea 00 00 00       	jmp    c007e2 <vsprintf+0x29b>
  c006f8:	e9 e5 00 00 00       	jmp    c007e2 <vsprintf+0x29b>
  c006fd:	90                   	nop
  c006fe:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  c00705:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c00708:	83 e8 48             	sub    $0x48,%eax
  c0070b:	83 f8 2b             	cmp    $0x2b,%eax
  c0070e:	0f 87 ce 00 00 00    	ja     c007e2 <vsprintf+0x29b>
  c00714:	8b 04 85 24 0a c0 00 	mov    0xc00a24(,%eax,4),%eax
  c0071b:	ff e0                	jmp    *%eax
  c0071d:	c7 45 e0 ff 00 00 00 	movl   $0xff,-0x20(%ebp)
  c00724:	81 65 e0 ff ff 00 00 	andl   $0xffff,-0x20(%ebp)
  c0072b:	8b 45 10             	mov    0x10(%ebp),%eax
  c0072e:	8d 50 04             	lea    0x4(%eax),%edx
  c00731:	89 55 10             	mov    %edx,0x10(%ebp)
  c00734:	8b 00                	mov    (%eax),%eax
  c00736:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c00739:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c0073c:	ba 00 00 00 00       	mov    $0x0,%edx
  c00741:	ff 75 e0             	pushl  -0x20(%ebp)
  c00744:	ff 75 fc             	pushl  -0x4(%ebp)
  c00747:	ff 75 f8             	pushl  -0x8(%ebp)
  c0074a:	ff 75 f0             	pushl  -0x10(%ebp)
  c0074d:	ff 75 f4             	pushl  -0xc(%ebp)
  c00750:	52                   	push   %edx
  c00751:	50                   	push   %eax
  c00752:	ff 75 ec             	pushl  -0x14(%ebp)
  c00755:	e8 40 fb ff ff       	call   c0029a <_toNumber>
  c0075a:	83 c4 20             	add    $0x20,%esp
  c0075d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c00760:	eb 6d                	jmp    c007cf <vsprintf+0x288>
  c00762:	8b 45 10             	mov    0x10(%ebp),%eax
  c00765:	8d 50 08             	lea    0x8(%eax),%edx
  c00768:	89 55 10             	mov    %edx,0x10(%ebp)
  c0076b:	8b 50 04             	mov    0x4(%eax),%edx
  c0076e:	8b 00                	mov    (%eax),%eax
  c00770:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c00773:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00776:	ba 00 00 00 00       	mov    $0x0,%edx
  c0077b:	ff 75 e0             	pushl  -0x20(%ebp)
  c0077e:	ff 75 fc             	pushl  -0x4(%ebp)
  c00781:	ff 75 f8             	pushl  -0x8(%ebp)
  c00784:	ff 75 f0             	pushl  -0x10(%ebp)
  c00787:	ff 75 f4             	pushl  -0xc(%ebp)
  c0078a:	52                   	push   %edx
  c0078b:	50                   	push   %eax
  c0078c:	ff 75 ec             	pushl  -0x14(%ebp)
  c0078f:	e8 06 fb ff ff       	call   c0029a <_toNumber>
  c00794:	83 c4 20             	add    $0x20,%esp
  c00797:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c0079a:	eb 33                	jmp    c007cf <vsprintf+0x288>
  c0079c:	8b 45 10             	mov    0x10(%ebp),%eax
  c0079f:	8d 50 04             	lea    0x4(%eax),%edx
  c007a2:	89 55 10             	mov    %edx,0x10(%ebp)
  c007a5:	8b 00                	mov    (%eax),%eax
  c007a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c007aa:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  c007ae:	75 07                	jne    c007b7 <vsprintf+0x270>
  c007b0:	c7 45 e8 54 09 c0 00 	movl   $0xc00954,-0x18(%ebp)
  c007b7:	ff 75 fc             	pushl  -0x4(%ebp)
  c007ba:	ff 75 f8             	pushl  -0x8(%ebp)
  c007bd:	ff 75 e8             	pushl  -0x18(%ebp)
  c007c0:	ff 75 ec             	pushl  -0x14(%ebp)
  c007c3:	e8 f5 fc ff ff       	call   c004bd <_toString>
  c007c8:	83 c4 10             	add    $0x10,%esp
  c007cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c007ce:	90                   	nop
  c007cf:	eb 11                	jmp    c007e2 <vsprintf+0x29b>
  c007d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c007d4:	8d 50 01             	lea    0x1(%eax),%edx
  c007d7:	89 55 ec             	mov    %edx,-0x14(%ebp)
  c007da:	8b 55 0c             	mov    0xc(%ebp),%edx
  c007dd:	0f b6 12             	movzbl (%edx),%edx
  c007e0:	88 10                	mov    %dl,(%eax)
  c007e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  c007e5:	83 c0 01             	add    $0x1,%eax
  c007e8:	89 45 0c             	mov    %eax,0xc(%ebp)
  c007eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  c007ee:	0f b6 00             	movzbl (%eax),%eax
  c007f1:	84 c0                	test   %al,%al
  c007f3:	0f 85 89 fd ff ff    	jne    c00582 <vsprintf+0x3b>
  c007f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c007fc:	c6 00 00             	movb   $0x0,(%eax)
  c007ff:	8b 55 ec             	mov    -0x14(%ebp),%edx
  c00802:	8b 45 08             	mov    0x8(%ebp),%eax
  c00805:	29 c2                	sub    %eax,%edx
  c00807:	89 d0                	mov    %edx,%eax
  c00809:	c9                   	leave  
  c0080a:	c3                   	ret    

00c0080b <sprintf>:
  c0080b:	55                   	push   %ebp
  c0080c:	89 e5                	mov    %esp,%ebp
  c0080e:	83 ec 10             	sub    $0x10,%esp
  c00811:	8d 45 10             	lea    0x10(%ebp),%eax
  c00814:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c00817:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c0081a:	83 ec 04             	sub    $0x4,%esp
  c0081d:	50                   	push   %eax
  c0081e:	ff 75 0c             	pushl  0xc(%ebp)
  c00821:	ff 75 08             	pushl  0x8(%ebp)
  c00824:	e8 1e fd ff ff       	call   c00547 <vsprintf>
  c00829:	83 c4 10             	add    $0x10,%esp
  c0082c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c0082f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c00832:	c9                   	leave  
  c00833:	c3                   	ret    

00c00834 <_run>:
  c00834:	55                   	push   %ebp
  c00835:	89 e5                	mov    %esp,%ebp
  c00837:	57                   	push   %edi
  c00838:	56                   	push   %esi
  c00839:	53                   	push   %ebx
  c0083a:	83 ec 10             	sub    $0x10,%esp
  c0083d:	8b 55 10             	mov    0x10(%ebp),%edx
  c00840:	8b 75 18             	mov    0x18(%ebp),%esi
  c00843:	8b 7d 14             	mov    0x14(%ebp),%edi
  c00846:	b8 00 00 00 00       	mov    $0x0,%eax
  c0084b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c0084e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c00851:	cd 80                	int    $0x80
  c00853:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c00856:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00859:	83 c4 10             	add    $0x10,%esp
  c0085c:	5b                   	pop    %ebx
  c0085d:	5e                   	pop    %esi
  c0085e:	5f                   	pop    %edi
  c0085f:	5d                   	pop    %ebp
  c00860:	c3                   	ret    

00c00861 <write>:
  c00861:	55                   	push   %ebp
  c00862:	89 e5                	mov    %esp,%ebp
  c00864:	57                   	push   %edi
  c00865:	56                   	push   %esi
  c00866:	53                   	push   %ebx
  c00867:	83 ec 20             	sub    $0x20,%esp
  c0086a:	b8 04 00 00 00       	mov    $0x4,%eax
  c0086f:	bb 01 00 00 00       	mov    $0x1,%ebx
  c00874:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c00877:	8b 55 10             	mov    0x10(%ebp),%edx
  c0087a:	be 00 00 00 00       	mov    $0x0,%esi
  c0087f:	bf 00 00 00 00       	mov    $0x0,%edi
  c00884:	cd 80                	int    $0x80
  c00886:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c00889:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c0088c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c0088f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  c00896:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c0089d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c008a4:	8b 45 10             	mov    0x10(%ebp),%eax
  c008a7:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c008aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c008ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c008b0:	ff 75 e0             	pushl  -0x20(%ebp)
  c008b3:	ff 75 dc             	pushl  -0x24(%ebp)
  c008b6:	ff 75 d8             	pushl  -0x28(%ebp)
  c008b9:	6a 01                	push   $0x1
  c008bb:	ff 75 08             	pushl  0x8(%ebp)
  c008be:	e8 71 ff ff ff       	call   c00834 <_run>
  c008c3:	83 c4 14             	add    $0x14,%esp
  c008c6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c008c9:	b8 04 00 00 00       	mov    $0x4,%eax
  c008ce:	bb 00 00 00 00       	mov    $0x0,%ebx
  c008d3:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  c008d6:	ba 00 00 00 00       	mov    $0x0,%edx
  c008db:	be 00 00 00 00       	mov    $0x0,%esi
  c008e0:	bf 00 00 00 00       	mov    $0x0,%edi
  c008e5:	cd 80                	int    $0x80
  c008e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c008ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c008ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c008f0:	5b                   	pop    %ebx
  c008f1:	5e                   	pop    %esi
  c008f2:	5f                   	pop    %edi
  c008f3:	5d                   	pop    %ebp
  c008f4:	c3                   	ret    

Disassembly of section .rodata:

00c008f8 <_lowerDigits-0x40>:
  c008f8:	45                   	inc    %ebp
  c008f9:	6e                   	outsb  %ds:(%esi),(%dx)
  c008fa:	74 65                	je     c00961 <_upperDigits+0x11>
  c008fc:	72 20                	jb     c0091e <write+0xbd>
  c008fe:	74 65                	je     c00965 <_upperDigits+0x15>
  c00900:	73 74                	jae    c00976 <_upperDigits+0x26>
  c00902:	2e 0a 00             	or     %cs:(%eax),%al
  c00905:	61                   	popa   
  c00906:	72 67                	jb     c0096f <_upperDigits+0x1f>
  c00908:	76 5b                	jbe    c00965 <_upperDigits+0x15>
  c0090a:	25 64 5d 20 3d       	and    $0x3d205d64,%eax
  c0090f:	20 25 73 0a 00 4c    	and    %ah,0x4c000a73
  c00915:	65                   	gs
  c00916:	76 61                	jbe    c00979 <_upperDigits+0x29>
  c00918:	6c                   	insb   (%dx),%es:(%edi)
  c00919:	20 74 65 73          	and    %dh,0x73(%ebp,%eiz,2)
  c0091d:	74 2e                	je     c0094d <_lowerDigits+0x15>
  c0091f:	0a 00                	or     (%eax),%al
  c00921:	00 00                	add    %al,(%eax)
  c00923:	00 30                	add    %dh,(%eax)
  c00925:	31 32                	xor    %esi,(%edx)
  c00927:	33 34 35 36 37 38 39 	xor    0x39383736(,%esi,1),%esi
  c0092e:	61                   	popa   
  c0092f:	62 63 64             	bound  %esp,0x64(%ebx)
  c00932:	65                   	gs
  c00933:	66                   	data16
  c00934:	78 00                	js     c00936 <write+0xd5>
	...

00c00938 <_lowerDigits>:
  c00938:	24 09                	and    $0x9,%al
  c0093a:	c0 00 30             	rolb   $0x30,(%eax)
  c0093d:	31 32                	xor    %esi,(%edx)
  c0093f:	33 34 35 36 37 38 39 	xor    0x39383736(,%esi,1),%esi
  c00946:	41                   	inc    %ecx
  c00947:	42                   	inc    %edx
  c00948:	43                   	inc    %ebx
  c00949:	44                   	inc    %esp
  c0094a:	45                   	inc    %ebp
  c0094b:	46                   	inc    %esi
  c0094c:	58                   	pop    %eax
  c0094d:	00 00                	add    %al,(%eax)
	...

00c00950 <_upperDigits>:
  c00950:	3c 09                	cmp    $0x9,%al
  c00952:	c0 00 3c             	rolb   $0x3c,(%eax)
  c00955:	4e                   	dec    %esi
  c00956:	55                   	push   %ebp
  c00957:	4c                   	dec    %esp
  c00958:	4c                   	dec    %esp
  c00959:	3e 00 00             	add    %al,%ds:(%eax)
  c0095c:	db 05 c0 00 ed 05    	fildl  0x5ed00c0
  c00962:	c0 00 ed             	rolb   $0xed,(%eax)
  c00965:	05 c0 00 e7 05       	add    $0x5e700c0,%eax
  c0096a:	c0 00 ed             	rolb   $0xed,(%eax)
  c0096d:	05 c0 00 ed 05       	add    $0x5ed00c0,%eax
  c00972:	c0 00 ed             	rolb   $0xed,(%eax)
  c00975:	05 c0 00 ed 05       	add    $0x5ed00c0,%eax
  c0097a:	c0 00 ed             	rolb   $0xed,(%eax)
  c0097d:	05 c0 00 ed 05       	add    $0x5ed00c0,%eax
  c00982:	c0 00 ed             	rolb   $0xed,(%eax)
  c00985:	05 c0 00 d5 05       	add    $0x5d500c0,%eax
  c0098a:	c0 00 ed             	rolb   $0xed,(%eax)
  c0098d:	05 c0 00 cf 05       	add    $0x5cf00c0,%eax
  c00992:	c0 00 ed             	rolb   $0xed,(%eax)
  c00995:	05 c0 00 ed 05       	add    $0x5ed00c0,%eax
  c0099a:	c0 00 e1             	rolb   $0xe1,(%eax)
  c0099d:	05 c0 00 b2 06       	add    $0x6b200c0,%eax
  c009a2:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009a5:	06                   	push   %es
  c009a6:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009a9:	06                   	push   %es
  c009aa:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009ad:	06                   	push   %es
  c009ae:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009b1:	06                   	push   %es
  c009b2:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009b5:	06                   	push   %es
  c009b6:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009b9:	06                   	push   %es
  c009ba:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009bd:	06                   	push   %es
  c009be:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009c1:	06                   	push   %es
  c009c2:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009c5:	06                   	push   %es
  c009c6:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009c9:	06                   	push   %es
  c009ca:	c0 00 8a             	rolb   $0x8a,(%eax)
  c009cd:	06                   	push   %es
  c009ce:	c0 00 bf             	rolb   $0xbf,(%eax)
  c009d1:	06                   	push   %es
  c009d2:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009d5:	06                   	push   %es
  c009d6:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009d9:	06                   	push   %es
  c009da:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009dd:	06                   	push   %es
  c009de:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009e1:	06                   	push   %es
  c009e2:	c0 00 c6             	rolb   $0xc6,(%eax)
  c009e5:	06                   	push   %es
  c009e6:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009e9:	06                   	push   %es
  c009ea:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009ed:	06                   	push   %es
  c009ee:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009f1:	06                   	push   %es
  c009f2:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009f5:	06                   	push   %es
  c009f6:	c0 00 d8             	rolb   $0xd8,(%eax)
  c009f9:	06                   	push   %es
  c009fa:	c0 00 cf             	rolb   $0xcf,(%eax)
  c009fd:	06                   	push   %es
  c009fe:	c0 00 ae             	rolb   $0xae,(%eax)
  c00a01:	06                   	push   %es
  c00a02:	c0 00 d8             	rolb   $0xd8,(%eax)
  c00a05:	06                   	push   %es
  c00a06:	c0 00 d8             	rolb   $0xd8,(%eax)
  c00a09:	06                   	push   %es
  c00a0a:	c0 00 a5             	rolb   $0xa5,(%eax)
  c00a0d:	06                   	push   %es
  c00a0e:	c0 00 d8             	rolb   $0xd8,(%eax)
  c00a11:	06                   	push   %es
  c00a12:	c0 00 fd             	rolb   $0xfd,(%eax)
  c00a15:	06                   	push   %es
  c00a16:	c0 00 d8             	rolb   $0xd8,(%eax)
  c00a19:	06                   	push   %es
  c00a1a:	c0 00 d8             	rolb   $0xd8,(%eax)
  c00a1d:	06                   	push   %es
  c00a1e:	c0 00 b6             	rolb   $0xb6,(%eax)
  c00a21:	06                   	push   %es
  c00a22:	c0 00 1d             	rolb   $0x1d,(%eax)
  c00a25:	07                   	pop    %es
  c00a26:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a29:	07                   	pop    %es
  c00a2a:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a2d:	07                   	pop    %es
  c00a2e:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a31:	07                   	pop    %es
  c00a32:	c0 00 62             	rolb   $0x62,(%eax)
  c00a35:	07                   	pop    %es
  c00a36:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a39:	07                   	pop    %es
  c00a3a:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a3d:	07                   	pop    %es
  c00a3e:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a41:	07                   	pop    %es
  c00a42:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a45:	07                   	pop    %es
  c00a46:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a49:	07                   	pop    %es
  c00a4a:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a4d:	07                   	pop    %es
  c00a4e:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a51:	07                   	pop    %es
  c00a52:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a55:	07                   	pop    %es
  c00a56:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a59:	07                   	pop    %es
  c00a5a:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a5d:	07                   	pop    %es
  c00a5e:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a61:	07                   	pop    %es
  c00a62:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a65:	07                   	pop    %es
  c00a66:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a69:	07                   	pop    %es
  c00a6a:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a6d:	07                   	pop    %es
  c00a6e:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a71:	07                   	pop    %es
  c00a72:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a75:	07                   	pop    %es
  c00a76:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a79:	07                   	pop    %es
  c00a7a:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a7d:	07                   	pop    %es
  c00a7e:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a81:	07                   	pop    %es
  c00a82:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a85:	07                   	pop    %es
  c00a86:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a89:	07                   	pop    %es
  c00a8a:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a8d:	07                   	pop    %es
  c00a8e:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a91:	07                   	pop    %es
  c00a92:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a95:	07                   	pop    %es
  c00a96:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a99:	07                   	pop    %es
  c00a9a:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00a9d:	07                   	pop    %es
  c00a9e:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00aa1:	07                   	pop    %es
  c00aa2:	c0 00 24             	rolb   $0x24,(%eax)
  c00aa5:	07                   	pop    %es
  c00aa6:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00aa9:	07                   	pop    %es
  c00aaa:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00aad:	07                   	pop    %es
  c00aae:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00ab1:	07                   	pop    %es
  c00ab2:	c0 00 2b             	rolb   $0x2b,(%eax)
  c00ab5:	07                   	pop    %es
  c00ab6:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00ab9:	07                   	pop    %es
  c00aba:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00abd:	07                   	pop    %es
  c00abe:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00ac1:	07                   	pop    %es
  c00ac2:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00ac5:	07                   	pop    %es
  c00ac6:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00ac9:	07                   	pop    %es
  c00aca:	c0 00 e2             	rolb   $0xe2,(%eax)
  c00acd:	07                   	pop    %es
  c00ace:	c0 00 9c             	rolb   $0x9c,(%eax)
  c00ad1:	07                   	pop    %es
  c00ad2:	c0                   	.byte 0xc0
	...

Disassembly of section .eh_frame:

00c00ad4 <.eh_frame>:
  c00ad4:	14 00                	adc    $0x0,%al
  c00ad6:	00 00                	add    %al,(%eax)
  c00ad8:	00 00                	add    %al,(%eax)
  c00ada:	00 00                	add    %al,(%eax)
  c00adc:	01 7a 52             	add    %edi,0x52(%edx)
  c00adf:	00 01                	add    %al,(%ecx)
  c00ae1:	7c 08                	jl     c00aeb <_upperDigits+0x19b>
  c00ae3:	01 1b                	add    %ebx,(%ebx)
  c00ae5:	0c 04                	or     $0x4,%al
  c00ae7:	04 88                	add    $0x88,%al
  c00ae9:	01 00                	add    %eax,(%eax)
  c00aeb:	00 24 00             	add    %ah,(%eax,%eax,1)
  c00aee:	00 00                	add    %al,(%eax)
  c00af0:	1c 00                	sbb    $0x0,%al
  c00af2:	00 00                	add    %al,(%eax)
  c00af4:	0c f5                	or     $0xf5,%al
  c00af6:	ff                   	(bad)  
  c00af7:	ff 77 00             	pushl  0x0(%edi)
  c00afa:	00 00                	add    %al,(%eax)
  c00afc:	00 44 0c 01          	add    %al,0x1(%esp,%ecx,1)
  c00b00:	00 47 10             	add    %al,0x10(%edi)
  c00b03:	05 02 75 00 44       	add    $0x44007502,%eax
  c00b08:	0f 03 75 78          	lsl    0x78(%ebp),%esi
  c00b0c:	06                   	push   %es
  c00b0d:	10 03                	adc    %al,(%ebx)
  c00b0f:	02 75 7c             	add    0x7c(%ebp),%dh
  c00b12:	00 00                	add    %al,(%eax)
  c00b14:	28 00                	sub    %al,(%eax)
  c00b16:	00 00                	add    %al,(%eax)
  c00b18:	44                   	inc    %esp
  c00b19:	00 00                	add    %al,(%eax)
  c00b1b:	00 74 f5 ff          	add    %dh,-0x1(%ebp,%esi,8)
  c00b1f:	ff 2d 00 00 00 00    	ljmp   *0x0
  c00b25:	41                   	inc    %ecx
  c00b26:	0e                   	push   %cs
  c00b27:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00b2d:	46                   	inc    %esi
  c00b2e:	87 03                	xchg   %eax,(%ebx)
  c00b30:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c00b33:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c00b38:	41                   	inc    %ecx
  c00b39:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c00b40:	1c 00                	sbb    $0x0,%al
  c00b42:	00 00                	add    %al,(%eax)
  c00b44:	70 00                	jo     c00b46 <_upperDigits+0x1f6>
  c00b46:	00 00                	add    %al,(%eax)
  c00b48:	75 f5                	jne    c00b3f <_upperDigits+0x1ef>
  c00b4a:	ff                   	(bad)  
  c00b4b:	ff                   	(bad)  
  c00b4c:	38 00                	cmp    %al,(%eax)
  c00b4e:	00 00                	add    %al,(%eax)
  c00b50:	00 41 0e             	add    %al,0xe(%ecx)
  c00b53:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00b59:	74 c5                	je     c00b20 <_upperDigits+0x1d0>
  c00b5b:	0c 04                	or     $0x4,%al
  c00b5d:	04 00                	add    $0x0,%al
  c00b5f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c00b62:	00 00                	add    %al,(%eax)
  c00b64:	90                   	nop
  c00b65:	00 00                	add    %al,(%eax)
  c00b67:	00 90 f5 ff ff 4a    	add    %dl,0x4afffff5(%eax)
  c00b6d:	00 00                	add    %al,(%eax)
  c00b6f:	00 00                	add    %al,(%eax)
  c00b71:	41                   	inc    %ecx
  c00b72:	0e                   	push   %cs
  c00b73:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00b79:	02 46 c5             	add    -0x3b(%esi),%al
  c00b7c:	0c 04                	or     $0x4,%al
  c00b7e:	04 00                	add    $0x0,%al
  c00b80:	20 00                	and    %al,(%eax)
  c00b82:	00 00                	add    %al,(%eax)
  c00b84:	b0 00                	mov    $0x0,%al
  c00b86:	00 00                	add    %al,(%eax)
  c00b88:	bc f5 ff ff 1e       	mov    $0x1efffff5,%esp
  c00b8d:	00 00                	add    %al,(%eax)
  c00b8f:	00 00                	add    %al,(%eax)
  c00b91:	41                   	inc    %ecx
  c00b92:	0e                   	push   %cs
  c00b93:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00b99:	41                   	inc    %ecx
  c00b9a:	87 03                	xchg   %eax,(%ebx)
  c00b9c:	58                   	pop    %eax
  c00b9d:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c00ba4:	28 00                	sub    %al,(%eax)
  c00ba6:	00 00                	add    %al,(%eax)
  c00ba8:	d4 00                	aam    $0x0
  c00baa:	00 00                	add    %al,(%eax)
  c00bac:	b6 f5                	mov    $0xf5,%dh
  c00bae:	ff                   	(bad)  
  c00baf:	ff 20                	jmp    *(%eax)
  c00bb1:	00 00                	add    %al,(%eax)
  c00bb3:	00 00                	add    %al,(%eax)
  c00bb5:	41                   	inc    %ecx
  c00bb6:	0e                   	push   %cs
  c00bb7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00bbd:	43                   	inc    %ebx
  c00bbe:	87 03                	xchg   %eax,(%ebx)
  c00bc0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c00bc3:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  c00bc8:	41                   	inc    %ecx
  c00bc9:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c00bd0:	20 00                	and    %al,(%eax)
  c00bd2:	00 00                	add    %al,(%eax)
  c00bd4:	00 01                	add    %al,(%ecx)
  c00bd6:	00 00                	add    %al,(%eax)
  c00bd8:	aa                   	stos   %al,%es:(%edi)
  c00bd9:	f5                   	cmc    
  c00bda:	ff                   	(bad)  
  c00bdb:	ff 5a 00             	lcall  *0x0(%edx)
  c00bde:	00 00                	add    %al,(%eax)
  c00be0:	00 41 0e             	add    %al,0xe(%ecx)
  c00be3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00be9:	44                   	inc    %esp
  c00bea:	83 03 02             	addl   $0x2,(%ebx)
  c00bed:	51                   	push   %ecx
  c00bee:	c3                   	ret    
  c00bef:	41                   	inc    %ecx
  c00bf0:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c00bf3:	04 1c                	add    $0x1c,%al
  c00bf5:	00 00                	add    %al,(%eax)
  c00bf7:	00 24 01             	add    %ah,(%ecx,%eax,1)
  c00bfa:	00 00                	add    %al,(%eax)
  c00bfc:	e0 f5                	loopne c00bf3 <_upperDigits+0x2a3>
  c00bfe:	ff                   	(bad)  
  c00bff:	ff 31                	pushl  (%ecx)
  c00c01:	00 00                	add    %al,(%eax)
  c00c03:	00 00                	add    %al,(%eax)
  c00c05:	41                   	inc    %ecx
  c00c06:	0e                   	push   %cs
  c00c07:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00c0d:	6d                   	insl   (%dx),%es:(%edi)
  c00c0e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c00c11:	04 00                	add    $0x0,%al
  c00c13:	00 20                	add    %ah,(%eax)
  c00c15:	00 00                	add    %al,(%eax)
  c00c17:	00 44 01 00          	add    %al,0x0(%ecx,%eax,1)
  c00c1b:	00 f1                	add    %dh,%cl
  c00c1d:	f5                   	cmc    
  c00c1e:	ff                   	(bad)  
  c00c1f:	ff 5c 00 00          	lcall  *0x0(%eax,%eax,1)
  c00c23:	00 00                	add    %al,(%eax)
  c00c25:	41                   	inc    %ecx
  c00c26:	0e                   	push   %cs
  c00c27:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00c2d:	44                   	inc    %esp
  c00c2e:	83 03 02             	addl   $0x2,(%ebx)
  c00c31:	53                   	push   %ebx
  c00c32:	c3                   	ret    
  c00c33:	41                   	inc    %ecx
  c00c34:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c00c37:	04 1c                	add    $0x1c,%al
  c00c39:	00 00                	add    %al,(%eax)
  c00c3b:	00 68 01             	add    %ch,0x1(%eax)
  c00c3e:	00 00                	add    %al,(%eax)
  c00c40:	29 f6                	sub    %esi,%esi
  c00c42:	ff                   	(bad)  
  c00c43:	ff 31                	pushl  (%ecx)
  c00c45:	00 00                	add    %al,(%eax)
  c00c47:	00 00                	add    %al,(%eax)
  c00c49:	41                   	inc    %ecx
  c00c4a:	0e                   	push   %cs
  c00c4b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00c51:	6d                   	insl   (%dx),%es:(%edi)
  c00c52:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c00c55:	04 00                	add    $0x0,%al
  c00c57:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c00c5a:	00 00                	add    %al,(%eax)
  c00c5c:	88 01                	mov    %al,(%ecx)
  c00c5e:	00 00                	add    %al,(%eax)
  c00c60:	3a f6                	cmp    %dh,%dh
  c00c62:	ff                   	(bad)  
  c00c63:	ff 23                	jmp    *(%ebx)
  c00c65:	02 00                	add    (%eax),%al
  c00c67:	00 00                	add    %al,(%eax)
  c00c69:	41                   	inc    %ecx
  c00c6a:	0e                   	push   %cs
  c00c6b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00c71:	03 1f                	add    (%edi),%ebx
  c00c73:	02 c5                	add    %ch,%al
  c00c75:	0c 04                	or     $0x4,%al
  c00c77:	04 1c                	add    $0x1c,%al
  c00c79:	00 00                	add    %al,(%eax)
  c00c7b:	00 a8 01 00 00 3d    	add    %ch,0x3d000001(%eax)
  c00c81:	f8                   	clc    
  c00c82:	ff                   	(bad)  
  c00c83:	ff 8a 00 00 00 00    	decl   0x0(%edx)
  c00c89:	41                   	inc    %ecx
  c00c8a:	0e                   	push   %cs
  c00c8b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00c91:	02 86 c5 0c 04 04    	add    0x4040cc5(%esi),%al
  c00c97:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c00c9a:	00 00                	add    %al,(%eax)
  c00c9c:	c8 01 00 00          	enter  $0x1,$0x0
  c00ca0:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
  c00ca1:	f8                   	clc    
  c00ca2:	ff                   	(bad)  
  c00ca3:	ff c4                	inc    %esp
  c00ca5:	02 00                	add    (%eax),%al
  c00ca7:	00 00                	add    %al,(%eax)
  c00ca9:	41                   	inc    %ecx
  c00caa:	0e                   	push   %cs
  c00cab:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00cb1:	03 c0                	add    %eax,%eax
  c00cb3:	02 c5                	add    %ch,%al
  c00cb5:	0c 04                	or     $0x4,%al
  c00cb7:	04 1c                	add    $0x1c,%al
  c00cb9:	00 00                	add    %al,(%eax)
  c00cbb:	00 e8                	add    %ch,%al
  c00cbd:	01 00                	add    %eax,(%eax)
  c00cbf:	00 4b fb             	add    %cl,-0x5(%ebx)
  c00cc2:	ff                   	(bad)  
  c00cc3:	ff 29                	ljmp   *(%ecx)
  c00cc5:	00 00                	add    %al,(%eax)
  c00cc7:	00 00                	add    %al,(%eax)
  c00cc9:	41                   	inc    %ecx
  c00cca:	0e                   	push   %cs
  c00ccb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00cd1:	65 c5 0c 04          	lds    %gs:(%esp,%eax,1),%ecx
  c00cd5:	04 00                	add    $0x0,%al
  c00cd7:	00 28                	add    %ch,(%eax)
  c00cd9:	00 00                	add    %al,(%eax)
  c00cdb:	00 08                	add    %cl,(%eax)
  c00cdd:	02 00                	add    (%eax),%al
  c00cdf:	00 54 fb ff          	add    %dl,-0x1(%ebx,%edi,8)
  c00ce3:	ff 2d 00 00 00 00    	ljmp   *0x0
  c00ce9:	41                   	inc    %ecx
  c00cea:	0e                   	push   %cs
  c00ceb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00cf1:	46                   	inc    %esi
  c00cf2:	87 03                	xchg   %eax,(%ebx)
  c00cf4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c00cf7:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c00cfc:	41                   	inc    %ecx
  c00cfd:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c00d04:	28 00                	sub    %al,(%eax)
  c00d06:	00 00                	add    %al,(%eax)
  c00d08:	34 02                	xor    $0x2,%al
  c00d0a:	00 00                	add    %al,(%eax)
  c00d0c:	55                   	push   %ebp
  c00d0d:	fb                   	sti    
  c00d0e:	ff                   	(bad)  
  c00d0f:	ff 94 00 00 00 00 41 	call   *0x41000000(%eax,%eax,1)
  c00d16:	0e                   	push   %cs
  c00d17:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c00d1d:	46                   	inc    %esi
  c00d1e:	87 03                	xchg   %eax,(%ebx)
  c00d20:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c00d23:	05 02 87 c3 41       	add    $0x41c38702,%eax
  c00d28:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c00d2c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c00d2f:	04                   	.byte 0x4

Disassembly of section .bss:

00c02000 <__bss_start>:
	...

00c02400 <___strtok>:
  c02400:	00 00                	add    %al,(%eax)
	...

00c02404 <___strtok>:
  c02404:	00 00                	add    %al,(%eax)
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
