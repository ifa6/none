
objs/bin/v6sh:     file format elf32-i386


Disassembly of section .text:

00c00000 <_run>:
  c00000:	55                   	push   %ebp
  c00001:	89 e5                	mov    %esp,%ebp
  c00003:	57                   	push   %edi
  c00004:	56                   	push   %esi
  c00005:	53                   	push   %ebx
  c00006:	83 ec 10             	sub    $0x10,%esp
  c00009:	8b 55 10             	mov    0x10(%ebp),%edx
  c0000c:	8b 75 18             	mov    0x18(%ebp),%esi
  c0000f:	8b 7d 14             	mov    0x14(%ebp),%edi
  c00012:	b8 00 00 00 00       	mov    $0x0,%eax
  c00017:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c0001a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c0001d:	cd 80                	int    $0x80
  c0001f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c00022:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00025:	83 c4 10             	add    $0x10,%esp
  c00028:	5b                   	pop    %ebx
  c00029:	5e                   	pop    %esi
  c0002a:	5f                   	pop    %edi
  c0002b:	5d                   	pop    %ebp
  c0002c:	c3                   	ret    

00c0002d <main>:
  c0002d:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  c00031:	83 e4 f0             	and    $0xfffffff0,%esp
  c00034:	ff 71 fc             	pushl  -0x4(%ecx)
  c00037:	55                   	push   %ebp
  c00038:	89 e5                	mov    %esp,%ebp
  c0003a:	53                   	push   %ebx
  c0003b:	51                   	push   %ecx
  c0003c:	83 ec 10             	sub    $0x10,%esp
  c0003f:	89 cb                	mov    %ecx,%ebx
  c00041:	c7 05 80 61 c0 00 58 	movl   $0xc02658,0xc06180
  c00048:	26 c0 00 
  c0004b:	83 3b 01             	cmpl   $0x1,(%ebx)
  c0004e:	0f 8e b6 00 00 00    	jle    c0010a <main+0xdd>
  c00054:	c7 05 80 61 c0 00 00 	movl   $0x0,0xc06180
  c0005b:	00 00 00 
  c0005e:	8b 43 04             	mov    0x4(%ebx),%eax
  c00061:	83 c0 04             	add    $0x4,%eax
  c00064:	8b 00                	mov    (%eax),%eax
  c00066:	0f b6 00             	movzbl (%eax),%eax
  c00069:	3c 2d                	cmp    $0x2d,%al
  c0006b:	75 4a                	jne    c000b7 <main+0x8a>
  c0006d:	8b 43 04             	mov    0x4(%ebx),%eax
  c00070:	8b 00                	mov    (%eax),%eax
  c00072:	c6 00 2d             	movb   $0x2d,(%eax)
  c00075:	8b 43 04             	mov    0x4(%ebx),%eax
  c00078:	83 c0 04             	add    $0x4,%eax
  c0007b:	8b 00                	mov    (%eax),%eax
  c0007d:	83 c0 01             	add    $0x1,%eax
  c00080:	0f b6 00             	movzbl (%eax),%eax
  c00083:	3c 63                	cmp    $0x63,%al
  c00085:	75 12                	jne    c00099 <main+0x6c>
  c00087:	83 3b 02             	cmpl   $0x2,(%ebx)
  c0008a:	7e 0d                	jle    c00099 <main+0x6c>
  c0008c:	8b 43 04             	mov    0x4(%ebx),%eax
  c0008f:	8b 40 08             	mov    0x8(%eax),%eax
  c00092:	a3 90 50 c0 00       	mov    %eax,0xc05090
  c00097:	eb 71                	jmp    c0010a <main+0xdd>
  c00099:	8b 43 04             	mov    0x4(%ebx),%eax
  c0009c:	83 c0 04             	add    $0x4,%eax
  c0009f:	8b 00                	mov    (%eax),%eax
  c000a1:	83 c0 01             	add    $0x1,%eax
  c000a4:	0f b6 00             	movzbl (%eax),%eax
  c000a7:	3c 74                	cmp    $0x74,%al
  c000a9:	75 5f                	jne    c0010a <main+0xdd>
  c000ab:	c7 05 94 50 c0 00 02 	movl   $0x2,0xc05094
  c000b2:	00 00 00 
  c000b5:	eb 53                	jmp    c0010a <main+0xdd>
  c000b7:	8b 43 04             	mov    0x4(%ebx),%eax
  c000ba:	83 c0 04             	add    $0x4,%eax
  c000bd:	8b 00                	mov    (%eax),%eax
  c000bf:	83 ec 08             	sub    $0x8,%esp
  c000c2:	6a 00                	push   $0x0
  c000c4:	50                   	push   %eax
  c000c5:	e8 2d 1b 00 00       	call   c01bf7 <open>
  c000ca:	83 c4 10             	add    $0x10,%esp
  c000cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c000d0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c000d4:	79 24                	jns    c000fa <main+0xcd>
  c000d6:	8b 43 04             	mov    0x4(%ebx),%eax
  c000d9:	83 c0 04             	add    $0x4,%eax
  c000dc:	8b 00                	mov    (%eax),%eax
  c000de:	83 ec 0c             	sub    $0xc,%esp
  c000e1:	50                   	push   %eax
  c000e2:	e8 89 10 00 00       	call   c01170 <prs>
  c000e7:	83 c4 10             	add    $0x10,%esp
  c000ea:	83 ec 0c             	sub    $0xc,%esp
  c000ed:	68 5b 26 c0 00       	push   $0xc0265b
  c000f2:	e8 2f 10 00 00       	call   c01126 <err>
  c000f7:	83 c4 10             	add    $0x10,%esp
  c000fa:	83 ec 08             	sub    $0x8,%esp
  c000fd:	6a 00                	push   $0x0
  c000ff:	ff 75 f4             	pushl  -0xc(%ebp)
  c00102:	e8 8e 16 00 00       	call   c01795 <dup2>
  c00107:	83 c4 10             	add    $0x10,%esp
  c0010a:	8b 43 04             	mov    0x4(%ebx),%eax
  c0010d:	8b 00                	mov    (%eax),%eax
  c0010f:	0f b6 00             	movzbl (%eax),%eax
  c00112:	3c 2d                	cmp    $0x2d,%al
  c00114:	75 0d                	jne    c00123 <main+0xf6>
  c00116:	a1 8c 50 c0 00       	mov    0xc0508c,%eax
  c0011b:	83 c0 01             	add    $0x1,%eax
  c0011e:	a3 8c 50 c0 00       	mov    %eax,0xc0508c
  c00123:	8b 43 04             	mov    0x4(%ebx),%eax
  c00126:	83 c0 04             	add    $0x4,%eax
  c00129:	a3 58 68 c0 00       	mov    %eax,0xc06858
  c0012e:	8b 03                	mov    (%ebx),%eax
  c00130:	83 e8 01             	sub    $0x1,%eax
  c00133:	a3 5c 68 c0 00       	mov    %eax,0xc0685c
  c00138:	c7 05 78 68 c0 00 00 	movl   $0x0,0xc06878
  c0013f:	00 00 00 
  c00142:	c7 05 88 50 c0 00 00 	movl   $0x0,0xc05088
  c00149:	00 00 00 
  c0014c:	a1 80 61 c0 00       	mov    0xc06180,%eax
  c00151:	85 c0                	test   %eax,%eax
  c00153:	74 11                	je     c00166 <main+0x139>
  c00155:	a1 80 61 c0 00       	mov    0xc06180,%eax
  c0015a:	83 ec 0c             	sub    $0xc,%esp
  c0015d:	50                   	push   %eax
  c0015e:	e8 0d 10 00 00       	call   c01170 <prs>
  c00163:	83 c4 10             	add    $0x10,%esp
  c00166:	e8 55 00 00 00       	call   c001c0 <lexscan>
  c0016b:	a1 88 50 c0 00       	mov    0xc05088,%eax
  c00170:	85 c0                	test   %eax,%eax
  c00172:	74 12                	je     c00186 <main+0x159>
  c00174:	83 ec 0c             	sub    $0xc,%esp
  c00177:	68 69 26 c0 00       	push   $0xc02669
  c0017c:	e8 a5 0f 00 00       	call   c01126 <err>
  c00181:	83 c4 10             	add    $0x10,%esp
  c00184:	eb 35                	jmp    c001bb <main+0x18e>
  c00186:	e8 3b 04 00 00       	call   c005c6 <parse>
  c0018b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c0018e:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c00193:	85 c0                	test   %eax,%eax
  c00195:	74 12                	je     c001a9 <main+0x17c>
  c00197:	83 ec 0c             	sub    $0xc,%esp
  c0019a:	68 7f 26 c0 00       	push   $0xc0267f
  c0019f:	e8 82 0f 00 00       	call   c01126 <err>
  c001a4:	83 c4 10             	add    $0x10,%esp
  c001a7:	eb 12                	jmp    c001bb <main+0x18e>
  c001a9:	83 ec 04             	sub    $0x4,%esp
  c001ac:	6a 00                	push   $0x0
  c001ae:	6a 00                	push   $0x0
  c001b0:	ff 75 f0             	pushl  -0x10(%ebp)
  c001b3:	e8 27 09 00 00       	call   c00adf <execute>
  c001b8:	83 c4 10             	add    $0x10,%esp
  c001bb:	e9 78 ff ff ff       	jmp    c00138 <main+0x10b>

00c001c0 <lexscan>:
  c001c0:	55                   	push   %ebp
  c001c1:	89 e5                	mov    %esp,%ebp
  c001c3:	53                   	push   %ebx
  c001c4:	83 ec 04             	sub    $0x4,%esp
  c001c7:	c7 05 60 68 c0 00 c4 	movl   $0xc061c4,0xc06860
  c001ce:	61 c0 00 
  c001d1:	c7 05 90 62 c0 00 78 	movl   $0xc06278,0xc06290
  c001d8:	62 c0 00 
  c001db:	c7 05 84 61 c0 00 c0 	movl   $0xc062c0,0xc06184
  c001e2:	62 c0 00 
  c001e5:	c7 05 7c 68 c0 00 bb 	movl   $0xc066bb,0xc0687c
  c001ec:	66 c0 00 
  c001ef:	e8 53 01 00 00       	call   c00347 <nextc>
  c001f4:	89 c3                	mov    %eax,%ebx
  c001f6:	83 fb 20             	cmp    $0x20,%ebx
  c001f9:	74 f4                	je     c001ef <lexscan+0x2f>
  c001fb:	83 fb 09             	cmp    $0x9,%ebx
  c001fe:	74 ef                	je     c001ef <lexscan+0x2f>
  c00200:	83 fb 23             	cmp    $0x23,%ebx
  c00203:	75 0c                	jne    c00211 <lexscan+0x51>
  c00205:	e8 3d 01 00 00       	call   c00347 <nextc>
  c0020a:	89 c3                	mov    %eax,%ebx
  c0020c:	83 fb 0a             	cmp    $0xa,%ebx
  c0020f:	75 f4                	jne    c00205 <lexscan+0x45>
  c00211:	89 d8                	mov    %ebx,%eax
  c00213:	0f be c0             	movsbl %al,%eax
  c00216:	a3 84 50 c0 00       	mov    %eax,0xc05084
  c0021b:	8b 1d 84 61 c0 00    	mov    0xc06184,%ebx
  c00221:	e8 0d 00 00 00       	call   c00233 <word>
  c00226:	0f b6 03             	movzbl (%ebx),%eax
  c00229:	3c 0a                	cmp    $0xa,%al
  c0022b:	75 ee                	jne    c0021b <lexscan+0x5b>
  c0022d:	83 c4 04             	add    $0x4,%esp
  c00230:	5b                   	pop    %ebx
  c00231:	5d                   	pop    %ebp
  c00232:	c3                   	ret    

00c00233 <word>:
  c00233:	55                   	push   %ebp
  c00234:	89 e5                	mov    %esp,%ebp
  c00236:	56                   	push   %esi
  c00237:	53                   	push   %ebx
  c00238:	a1 60 68 c0 00       	mov    0xc06860,%eax
  c0023d:	8d 50 04             	lea    0x4(%eax),%edx
  c00240:	89 15 60 68 c0 00    	mov    %edx,0xc06860
  c00246:	8b 15 84 61 c0 00    	mov    0xc06184,%edx
  c0024c:	89 10                	mov    %edx,(%eax)
  c0024e:	e8 f4 00 00 00       	call   c00347 <nextc>
  c00253:	89 c3                	mov    %eax,%ebx
  c00255:	83 fb 20             	cmp    $0x20,%ebx
  c00258:	74 f4                	je     c0024e <word+0x1b>
  c0025a:	83 fb 09             	cmp    $0x9,%ebx
  c0025d:	74 ef                	je     c0024e <word+0x1b>
  c0025f:	83 ec 08             	sub    $0x8,%esp
  c00262:	68 8c 26 c0 00       	push   $0xc0268c
  c00267:	53                   	push   %ebx
  c00268:	e8 50 10 00 00       	call   c012bd <any>
  c0026d:	83 c4 10             	add    $0x10,%esp
  c00270:	85 c0                	test   %eax,%eax
  c00272:	74 28                	je     c0029c <word+0x69>
  c00274:	a1 84 61 c0 00       	mov    0xc06184,%eax
  c00279:	8d 50 01             	lea    0x1(%eax),%edx
  c0027c:	89 15 84 61 c0 00    	mov    %edx,0xc06184
  c00282:	89 da                	mov    %ebx,%edx
  c00284:	88 10                	mov    %dl,(%eax)
  c00286:	a1 84 61 c0 00       	mov    0xc06184,%eax
  c0028b:	8d 50 01             	lea    0x1(%eax),%edx
  c0028e:	89 15 84 61 c0 00    	mov    %edx,0xc06184
  c00294:	c6 00 00             	movb   $0x0,(%eax)
  c00297:	e9 a4 00 00 00       	jmp    c00340 <word+0x10d>
  c0029c:	89 1d 84 50 c0 00    	mov    %ebx,0xc05084
  c002a2:	e8 a0 00 00 00       	call   c00347 <nextc>
  c002a7:	89 c3                	mov    %eax,%ebx
  c002a9:	83 ec 08             	sub    $0x8,%esp
  c002ac:	68 95 26 c0 00       	push   $0xc02695
  c002b1:	53                   	push   %ebx
  c002b2:	e8 06 10 00 00       	call   c012bd <any>
  c002b7:	83 c4 10             	add    $0x10,%esp
  c002ba:	85 c0                	test   %eax,%eax
  c002bc:	74 1d                	je     c002db <word+0xa8>
  c002be:	89 d8                	mov    %ebx,%eax
  c002c0:	0f be c0             	movsbl %al,%eax
  c002c3:	a3 84 50 c0 00       	mov    %eax,0xc05084
  c002c8:	a1 84 61 c0 00       	mov    0xc06184,%eax
  c002cd:	8d 50 01             	lea    0x1(%eax),%edx
  c002d0:	89 15 84 61 c0 00    	mov    %edx,0xc06184
  c002d6:	c6 00 00             	movb   $0x0,(%eax)
  c002d9:	eb 65                	jmp    c00340 <word+0x10d>
  c002db:	83 fb 27             	cmp    $0x27,%ebx
  c002de:	74 05                	je     c002e5 <word+0xb2>
  c002e0:	83 fb 22             	cmp    $0x22,%ebx
  c002e3:	75 44                	jne    c00329 <word+0xf6>
  c002e5:	89 de                	mov    %ebx,%esi
  c002e7:	eb 33                	jmp    c0031c <word+0xe9>
  c002e9:	83 fb 0a             	cmp    $0xa,%ebx
  c002ec:	75 19                	jne    c00307 <word+0xd4>
  c002ee:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c002f3:	83 c0 01             	add    $0x1,%eax
  c002f6:	a3 78 68 c0 00       	mov    %eax,0xc06878
  c002fb:	89 d8                	mov    %ebx,%eax
  c002fd:	0f be c0             	movsbl %al,%eax
  c00300:	a3 84 50 c0 00       	mov    %eax,0xc05084
  c00305:	eb 39                	jmp    c00340 <word+0x10d>
  c00307:	a1 84 61 c0 00       	mov    0xc06184,%eax
  c0030c:	8d 50 01             	lea    0x1(%eax),%edx
  c0030f:	89 15 84 61 c0 00    	mov    %edx,0xc06184
  c00315:	89 da                	mov    %ebx,%edx
  c00317:	83 ca 80             	or     $0xffffff80,%edx
  c0031a:	88 10                	mov    %dl,(%eax)
  c0031c:	e8 f9 01 00 00       	call   c0051a <readc>
  c00321:	89 c3                	mov    %eax,%ebx
  c00323:	39 f3                	cmp    %esi,%ebx
  c00325:	75 c2                	jne    c002e9 <word+0xb6>
  c00327:	eb 12                	jmp    c0033b <word+0x108>
  c00329:	a1 84 61 c0 00       	mov    0xc06184,%eax
  c0032e:	8d 50 01             	lea    0x1(%eax),%edx
  c00331:	89 15 84 61 c0 00    	mov    %edx,0xc06184
  c00337:	89 da                	mov    %ebx,%edx
  c00339:	88 10                	mov    %dl,(%eax)
  c0033b:	e9 62 ff ff ff       	jmp    c002a2 <word+0x6f>
  c00340:	8d 65 f8             	lea    -0x8(%ebp),%esp
  c00343:	5b                   	pop    %ebx
  c00344:	5e                   	pop    %esi
  c00345:	5d                   	pop    %ebp
  c00346:	c3                   	ret    

00c00347 <nextc>:
  c00347:	55                   	push   %ebp
  c00348:	89 e5                	mov    %esp,%ebp
  c0034a:	83 ec 18             	sub    $0x18,%esp
  c0034d:	a1 84 50 c0 00       	mov    0xc05084,%eax
  c00352:	85 c0                	test   %eax,%eax
  c00354:	74 1a                	je     c00370 <nextc+0x29>
  c00356:	a1 84 50 c0 00       	mov    0xc05084,%eax
  c0035b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c0035e:	c7 05 84 50 c0 00 00 	movl   $0x0,0xc05084
  c00365:	00 00 00 
  c00368:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c0036b:	e9 a8 01 00 00       	jmp    c00518 <nextc+0x1d1>
  c00370:	8b 15 60 68 c0 00    	mov    0xc06860,%edx
  c00376:	a1 90 62 c0 00       	mov    0xc06290,%eax
  c0037b:	39 c2                	cmp    %eax,%edx
  c0037d:	76 4d                	jbe    c003cc <nextc+0x85>
  c0037f:	a1 60 68 c0 00       	mov    0xc06860,%eax
  c00384:	83 e8 28             	sub    $0x28,%eax
  c00387:	a3 60 68 c0 00       	mov    %eax,0xc06860
  c0038c:	e8 b6 ff ff ff       	call   c00347 <nextc>
  c00391:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00394:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
  c00398:	75 f2                	jne    c0038c <nextc+0x45>
  c0039a:	a1 60 68 c0 00       	mov    0xc06860,%eax
  c0039f:	83 c0 28             	add    $0x28,%eax
  c003a2:	a3 60 68 c0 00       	mov    %eax,0xc06860
  c003a7:	83 ec 0c             	sub    $0xc,%esp
  c003aa:	68 a0 26 c0 00       	push   $0xc026a0
  c003af:	e8 72 0d 00 00       	call   c01126 <err>
  c003b4:	83 c4 10             	add    $0x10,%esp
  c003b7:	a1 88 50 c0 00       	mov    0xc05088,%eax
  c003bc:	83 c0 01             	add    $0x1,%eax
  c003bf:	a3 88 50 c0 00       	mov    %eax,0xc05088
  c003c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c003c7:	e9 4c 01 00 00       	jmp    c00518 <nextc+0x1d1>
  c003cc:	8b 15 84 61 c0 00    	mov    0xc06184,%edx
  c003d2:	a1 7c 68 c0 00       	mov    0xc0687c,%eax
  c003d7:	39 c2                	cmp    %eax,%edx
  c003d9:	76 4d                	jbe    c00428 <nextc+0xe1>
  c003db:	a1 84 61 c0 00       	mov    0xc06184,%eax
  c003e0:	83 e8 0a             	sub    $0xa,%eax
  c003e3:	a3 84 61 c0 00       	mov    %eax,0xc06184
  c003e8:	e8 5a ff ff ff       	call   c00347 <nextc>
  c003ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c003f0:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
  c003f4:	75 f2                	jne    c003e8 <nextc+0xa1>
  c003f6:	a1 84 61 c0 00       	mov    0xc06184,%eax
  c003fb:	83 c0 0a             	add    $0xa,%eax
  c003fe:	a3 84 61 c0 00       	mov    %eax,0xc06184
  c00403:	83 ec 0c             	sub    $0xc,%esp
  c00406:	68 ae 26 c0 00       	push   $0xc026ae
  c0040b:	e8 16 0d 00 00       	call   c01126 <err>
  c00410:	83 c4 10             	add    $0x10,%esp
  c00413:	a1 88 50 c0 00       	mov    0xc05088,%eax
  c00418:	83 c0 01             	add    $0x1,%eax
  c0041b:	a3 88 50 c0 00       	mov    %eax,0xc05088
  c00420:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00423:	e9 f0 00 00 00       	jmp    c00518 <nextc+0x1d1>
  c00428:	a1 80 50 c0 00       	mov    0xc05080,%eax
  c0042d:	85 c0                	test   %eax,%eax
  c0042f:	0f 85 a9 00 00 00    	jne    c004de <nextc+0x197>
  c00435:	e8 e0 00 00 00       	call   c0051a <readc>
  c0043a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c0043d:	83 7d f4 5c          	cmpl   $0x5c,-0xc(%ebp)
  c00441:	75 22                	jne    c00465 <nextc+0x11e>
  c00443:	e8 d2 00 00 00       	call   c0051a <readc>
  c00448:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c0044b:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
  c0044f:	75 0a                	jne    c0045b <nextc+0x114>
  c00451:	b8 20 00 00 00       	mov    $0x20,%eax
  c00456:	e9 bd 00 00 00       	jmp    c00518 <nextc+0x1d1>
  c0045b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c0045e:	0c 80                	or     $0x80,%al
  c00460:	e9 b3 00 00 00       	jmp    c00518 <nextc+0x1d1>
  c00465:	83 7d f4 24          	cmpl   $0x24,-0xc(%ebp)
  c00469:	75 73                	jne    c004de <nextc+0x197>
  c0046b:	e8 aa 00 00 00       	call   c0051a <readc>
  c00470:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00473:	83 7d f4 2f          	cmpl   $0x2f,-0xc(%ebp)
  c00477:	7e 2f                	jle    c004a8 <nextc+0x161>
  c00479:	83 7d f4 39          	cmpl   $0x39,-0xc(%ebp)
  c0047d:	7f 29                	jg     c004a8 <nextc+0x161>
  c0047f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00482:	8d 50 d0             	lea    -0x30(%eax),%edx
  c00485:	a1 5c 68 c0 00       	mov    0xc0685c,%eax
  c0048a:	39 c2                	cmp    %eax,%edx
  c0048c:	7d 1a                	jge    c004a8 <nextc+0x161>
  c0048e:	a1 58 68 c0 00       	mov    0xc06858,%eax
  c00493:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c00496:	81 c2 d0 ff ff 3f    	add    $0x3fffffd0,%edx
  c0049c:	c1 e2 02             	shl    $0x2,%edx
  c0049f:	01 d0                	add    %edx,%eax
  c004a1:	8b 00                	mov    (%eax),%eax
  c004a3:	a3 80 50 c0 00       	mov    %eax,0xc05080
  c004a8:	83 7d f4 24          	cmpl   $0x24,-0xc(%ebp)
  c004ac:	75 0a                	jne    c004b8 <nextc+0x171>
  c004ae:	c7 05 80 50 c0 00 6c 	movl   $0xc0686c,0xc05080
  c004b5:	68 c0 00 
  c004b8:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
  c004bc:	75 20                	jne    c004de <nextc+0x197>
  c004be:	a1 98 50 c0 00       	mov    0xc05098,%eax
  c004c3:	83 ec 08             	sub    $0x8,%esp
  c004c6:	68 64 68 c0 00       	push   $0xc06864
  c004cb:	50                   	push   %eax
  c004cc:	e8 5a 0d 00 00       	call   c0122b <sprn>
  c004d1:	83 c4 10             	add    $0x10,%esp
  c004d4:	c7 05 80 50 c0 00 64 	movl   $0xc06864,0xc05080
  c004db:	68 c0 00 
  c004de:	a1 80 50 c0 00       	mov    0xc05080,%eax
  c004e3:	85 c0                	test   %eax,%eax
  c004e5:	74 2c                	je     c00513 <nextc+0x1cc>
  c004e7:	a1 80 50 c0 00       	mov    0xc05080,%eax
  c004ec:	8d 50 01             	lea    0x1(%eax),%edx
  c004ef:	89 15 80 50 c0 00    	mov    %edx,0xc05080
  c004f5:	0f b6 00             	movzbl (%eax),%eax
  c004f8:	0f be c0             	movsbl %al,%eax
  c004fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c004fe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c00502:	74 05                	je     c00509 <nextc+0x1c2>
  c00504:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00507:	eb 0f                	jmp    c00518 <nextc+0x1d1>
  c00509:	c7 05 80 50 c0 00 00 	movl   $0x0,0xc05080
  c00510:	00 00 00 
  c00513:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00516:	24 7f                	and    $0x7f,%al
  c00518:	c9                   	leave  
  c00519:	c3                   	ret    

00c0051a <readc>:
  c0051a:	55                   	push   %ebp
  c0051b:	89 e5                	mov    %esp,%ebp
  c0051d:	83 ec 18             	sub    $0x18,%esp
  c00520:	a1 90 50 c0 00       	mov    0xc05090,%eax
  c00525:	85 c0                	test   %eax,%eax
  c00527:	74 40                	je     c00569 <readc+0x4f>
  c00529:	a1 90 50 c0 00       	mov    0xc05090,%eax
  c0052e:	8d 50 01             	lea    0x1(%eax),%edx
  c00531:	89 15 90 50 c0 00    	mov    %edx,0xc05090
  c00537:	0f b6 00             	movzbl (%eax),%eax
  c0053a:	0f be c0             	movsbl %al,%eax
  c0053d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00540:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c00544:	75 1e                	jne    c00564 <readc+0x4a>
  c00546:	c7 05 90 50 c0 00 00 	movl   $0x0,0xc05090
  c0054d:	00 00 00 
  c00550:	a1 94 50 c0 00       	mov    0xc05094,%eax
  c00555:	83 c0 01             	add    $0x1,%eax
  c00558:	a3 94 50 c0 00       	mov    %eax,0xc05094
  c0055d:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
  c00564:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00567:	eb 5b                	jmp    c005c4 <readc+0xaa>
  c00569:	a1 94 50 c0 00       	mov    0xc05094,%eax
  c0056e:	83 f8 01             	cmp    $0x1,%eax
  c00571:	75 0a                	jne    c0057d <readc+0x63>
  c00573:	83 ec 0c             	sub    $0xc,%esp
  c00576:	6a 00                	push   $0x0
  c00578:	e8 6c 18 00 00       	call   c01de9 <exit>
  c0057d:	83 ec 04             	sub    $0x4,%esp
  c00580:	6a 01                	push   $0x1
  c00582:	8d 45 f3             	lea    -0xd(%ebp),%eax
  c00585:	50                   	push   %eax
  c00586:	6a 00                	push   $0x0
  c00588:	e8 90 17 00 00       	call   c01d1d <read>
  c0058d:	83 c4 10             	add    $0x10,%esp
  c00590:	83 f8 01             	cmp    $0x1,%eax
  c00593:	74 0a                	je     c0059f <readc+0x85>
  c00595:	83 ec 0c             	sub    $0xc,%esp
  c00598:	6a 00                	push   $0x0
  c0059a:	e8 4a 18 00 00       	call   c01de9 <exit>
  c0059f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  c005a3:	3c 0a                	cmp    $0xa,%al
  c005a5:	75 16                	jne    c005bd <readc+0xa3>
  c005a7:	a1 94 50 c0 00       	mov    0xc05094,%eax
  c005ac:	85 c0                	test   %eax,%eax
  c005ae:	74 0d                	je     c005bd <readc+0xa3>
  c005b0:	a1 94 50 c0 00       	mov    0xc05094,%eax
  c005b5:	83 e8 01             	sub    $0x1,%eax
  c005b8:	a3 94 50 c0 00       	mov    %eax,0xc05094
  c005bd:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  c005c1:	0f be c0             	movsbl %al,%eax
  c005c4:	c9                   	leave  
  c005c5:	c3                   	ret    

00c005c6 <parse>:
  c005c6:	55                   	push   %ebp
  c005c7:	89 e5                	mov    %esp,%ebp
  c005c9:	83 ec 18             	sub    $0x18,%esp
  c005cc:	c7 05 8c 62 c0 00 c0 	movl   $0xc066c0,0xc0628c
  c005d3:	66 c0 00 
  c005d6:	c7 05 68 68 c0 00 58 	movl   $0xc06858,0xc06868
  c005dd:	68 c0 00 
  c005e0:	c7 45 f4 c4 61 c0 00 	movl   $0xc061c4,-0xc(%ebp)
  c005e7:	eb 04                	jmp    c005ed <parse+0x27>
  c005e9:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
  c005ed:	a1 60 68 c0 00       	mov    0xc06860,%eax
  c005f2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  c005f5:	74 0c                	je     c00603 <parse+0x3d>
  c005f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c005fa:	8b 00                	mov    (%eax),%eax
  c005fc:	0f b6 00             	movzbl (%eax),%eax
  c005ff:	3c 0a                	cmp    $0xa,%al
  c00601:	74 e6                	je     c005e9 <parse+0x23>
  c00603:	a1 60 68 c0 00       	mov    0xc06860,%eax
  c00608:	83 ec 08             	sub    $0x8,%esp
  c0060b:	50                   	push   %eax
  c0060c:	ff 75 f4             	pushl  -0xc(%ebp)
  c0060f:	e8 05 00 00 00       	call   c00619 <cmdlist>
  c00614:	83 c4 10             	add    $0x10,%esp
  c00617:	c9                   	leave  
  c00618:	c3                   	ret    

00c00619 <cmdlist>:
  c00619:	55                   	push   %ebp
  c0061a:	89 e5                	mov    %esp,%ebp
  c0061c:	56                   	push   %esi
  c0061d:	53                   	push   %ebx
  c0061e:	83 ec 10             	sub    $0x10,%esp
  c00621:	8b 45 08             	mov    0x8(%ebp),%eax
  c00624:	3b 45 0c             	cmp    0xc(%ebp),%eax
  c00627:	75 0a                	jne    c00633 <cmdlist+0x1a>
  c00629:	b8 00 00 00 00       	mov    $0x0,%eax
  c0062e:	e9 4f 01 00 00       	jmp    c00782 <cmdlist+0x169>
  c00633:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c0063a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c0063d:	e9 0c 01 00 00       	jmp    c0074e <cmdlist+0x135>
  c00642:	8b 03                	mov    (%ebx),%eax
  c00644:	0f b6 00             	movzbl (%eax),%eax
  c00647:	0f be c0             	movsbl %al,%eax
  c0064a:	83 e8 0a             	sub    $0xa,%eax
  c0064d:	83 f8 31             	cmp    $0x31,%eax
  c00650:	0f 87 f5 00 00 00    	ja     c0074b <cmdlist+0x132>
  c00656:	8b 04 85 c8 26 c0 00 	mov    0xc026c8(,%eax,4),%eax
  c0065d:	ff e0                	jmp    *%eax
  c0065f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  c00663:	e9 e3 00 00 00       	jmp    c0074b <cmdlist+0x132>
  c00668:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  c0066c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c00670:	79 12                	jns    c00684 <cmdlist+0x6b>
  c00672:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c00677:	83 c0 01             	add    $0x1,%eax
  c0067a:	a3 78 68 c0 00       	mov    %eax,0xc06878
  c0067f:	e9 c7 00 00 00       	jmp    c0074b <cmdlist+0x132>
  c00684:	e9 c2 00 00 00       	jmp    c0074b <cmdlist+0x132>
  c00689:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c0068d:	0f 85 b8 00 00 00    	jne    c0074b <cmdlist+0x132>
  c00693:	8b 03                	mov    (%ebx),%eax
  c00695:	0f b6 00             	movzbl (%eax),%eax
  c00698:	0f be c0             	movsbl %al,%eax
  c0069b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c0069e:	83 ec 0c             	sub    $0xc,%esp
  c006a1:	6a 04                	push   $0x4
  c006a3:	e8 df 03 00 00       	call   c00a87 <tree>
  c006a8:	83 c4 10             	add    $0x10,%esp
  c006ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c006ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c006b1:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  c006b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c006ba:	8d 70 04             	lea    0x4(%eax),%esi
  c006bd:	83 ec 08             	sub    $0x8,%esp
  c006c0:	53                   	push   %ebx
  c006c1:	ff 75 08             	pushl  0x8(%ebp)
  c006c4:	e8 c0 00 00 00       	call   c00789 <pipeline>
  c006c9:	83 c4 10             	add    $0x10,%esp
  c006cc:	89 06                	mov    %eax,(%esi)
  c006ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c006d1:	83 c0 0c             	add    $0xc,%eax
  c006d4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  c006da:	83 7d f4 26          	cmpl   $0x26,-0xc(%ebp)
  c006de:	75 1e                	jne    c006fe <cmdlist+0xe5>
  c006e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c006e3:	83 c0 04             	add    $0x4,%eax
  c006e6:	8b 00                	mov    (%eax),%eax
  c006e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c006eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c006ee:	83 c0 0c             	add    $0xc,%eax
  c006f1:	8b 55 ec             	mov    -0x14(%ebp),%edx
  c006f4:	83 c2 0c             	add    $0xc,%edx
  c006f7:	8b 12                	mov    (%edx),%edx
  c006f9:	83 ca 61             	or     $0x61,%edx
  c006fc:	89 10                	mov    %edx,(%eax)
  c006fe:	8d 43 04             	lea    0x4(%ebx),%eax
  c00701:	8b 00                	mov    (%eax),%eax
  c00703:	83 ec 08             	sub    $0x8,%esp
  c00706:	68 c2 26 c0 00       	push   $0xc026c2
  c0070b:	50                   	push   %eax
  c0070c:	e8 ac 0b 00 00       	call   c012bd <any>
  c00711:	83 c4 10             	add    $0x10,%esp
  c00714:	85 c0                	test   %eax,%eax
  c00716:	74 14                	je     c0072c <cmdlist+0x113>
  c00718:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c0071d:	83 c0 01             	add    $0x1,%eax
  c00720:	a3 78 68 c0 00       	mov    %eax,0xc06878
  c00725:	b8 00 00 00 00       	mov    $0x0,%eax
  c0072a:	eb 56                	jmp    c00782 <cmdlist+0x169>
  c0072c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c0072f:	8d 70 08             	lea    0x8(%eax),%esi
  c00732:	8d 43 04             	lea    0x4(%ebx),%eax
  c00735:	83 ec 08             	sub    $0x8,%esp
  c00738:	ff 75 0c             	pushl  0xc(%ebp)
  c0073b:	50                   	push   %eax
  c0073c:	e8 d8 fe ff ff       	call   c00619 <cmdlist>
  c00741:	83 c4 10             	add    $0x10,%esp
  c00744:	89 06                	mov    %eax,(%esi)
  c00746:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00749:	eb 37                	jmp    c00782 <cmdlist+0x169>
  c0074b:	83 c3 04             	add    $0x4,%ebx
  c0074e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  c00751:	0f 85 eb fe ff ff    	jne    c00642 <cmdlist+0x29>
  c00757:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c0075b:	75 13                	jne    c00770 <cmdlist+0x157>
  c0075d:	83 ec 08             	sub    $0x8,%esp
  c00760:	ff 75 0c             	pushl  0xc(%ebp)
  c00763:	ff 75 08             	pushl  0x8(%ebp)
  c00766:	e8 1e 00 00 00       	call   c00789 <pipeline>
  c0076b:	83 c4 10             	add    $0x10,%esp
  c0076e:	eb 12                	jmp    c00782 <cmdlist+0x169>
  c00770:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c00775:	83 c0 01             	add    $0x1,%eax
  c00778:	a3 78 68 c0 00       	mov    %eax,0xc06878
  c0077d:	b8 00 00 00 00       	mov    $0x0,%eax
  c00782:	8d 65 f8             	lea    -0x8(%ebp),%esp
  c00785:	5b                   	pop    %ebx
  c00786:	5e                   	pop    %esi
  c00787:	5d                   	pop    %ebp
  c00788:	c3                   	ret    

00c00789 <pipeline>:
  c00789:	55                   	push   %ebp
  c0078a:	89 e5                	mov    %esp,%ebp
  c0078c:	56                   	push   %esi
  c0078d:	53                   	push   %ebx
  c0078e:	83 ec 10             	sub    $0x10,%esp
  c00791:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c00798:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c0079b:	e9 87 00 00 00       	jmp    c00827 <pipeline+0x9e>
  c007a0:	8b 03                	mov    (%ebx),%eax
  c007a2:	0f b6 00             	movzbl (%eax),%eax
  c007a5:	0f be c0             	movsbl %al,%eax
  c007a8:	83 f8 29             	cmp    $0x29,%eax
  c007ab:	74 10                	je     c007bd <pipeline+0x34>
  c007ad:	83 f8 7c             	cmp    $0x7c,%eax
  c007b0:	74 11                	je     c007c3 <pipeline+0x3a>
  c007b2:	83 f8 28             	cmp    $0x28,%eax
  c007b5:	75 6d                	jne    c00824 <pipeline+0x9b>
  c007b7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  c007bb:	eb 67                	jmp    c00824 <pipeline+0x9b>
  c007bd:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  c007c1:	eb 61                	jmp    c00824 <pipeline+0x9b>
  c007c3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c007c7:	75 5b                	jne    c00824 <pipeline+0x9b>
  c007c9:	83 ec 0c             	sub    $0xc,%esp
  c007cc:	6a 04                	push   $0x4
  c007ce:	e8 b4 02 00 00       	call   c00a87 <tree>
  c007d3:	83 c4 10             	add    $0x10,%esp
  c007d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c007d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c007dc:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  c007e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c007e5:	8d 70 04             	lea    0x4(%eax),%esi
  c007e8:	83 ec 08             	sub    $0x8,%esp
  c007eb:	53                   	push   %ebx
  c007ec:	ff 75 08             	pushl  0x8(%ebp)
  c007ef:	e8 54 00 00 00       	call   c00848 <command>
  c007f4:	83 c4 10             	add    $0x10,%esp
  c007f7:	89 06                	mov    %eax,(%esi)
  c007f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c007fc:	8d 70 08             	lea    0x8(%eax),%esi
  c007ff:	8d 43 04             	lea    0x4(%ebx),%eax
  c00802:	83 ec 08             	sub    $0x8,%esp
  c00805:	ff 75 0c             	pushl  0xc(%ebp)
  c00808:	50                   	push   %eax
  c00809:	e8 7b ff ff ff       	call   c00789 <pipeline>
  c0080e:	83 c4 10             	add    $0x10,%esp
  c00811:	89 06                	mov    %eax,(%esi)
  c00813:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00816:	83 c0 0c             	add    $0xc,%eax
  c00819:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  c0081f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00822:	eb 1d                	jmp    c00841 <pipeline+0xb8>
  c00824:	83 c3 04             	add    $0x4,%ebx
  c00827:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  c0082a:	0f 85 70 ff ff ff    	jne    c007a0 <pipeline+0x17>
  c00830:	83 ec 08             	sub    $0x8,%esp
  c00833:	ff 75 0c             	pushl  0xc(%ebp)
  c00836:	ff 75 08             	pushl  0x8(%ebp)
  c00839:	e8 0a 00 00 00       	call   c00848 <command>
  c0083e:	83 c4 10             	add    $0x10,%esp
  c00841:	8d 65 f8             	lea    -0x8(%ebp),%esp
  c00844:	5b                   	pop    %ebx
  c00845:	5e                   	pop    %esi
  c00846:	5d                   	pop    %ebp
  c00847:	c3                   	ret    

00c00848 <command>:
  c00848:	55                   	push   %ebp
  c00849:	89 e5                	mov    %esp,%ebp
  c0084b:	53                   	push   %ebx
  c0084c:	83 ec 34             	sub    $0x34,%esp
  c0084f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c00856:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c0085d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  c00864:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  c0086b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c00872:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c00879:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  c00880:	8b 45 0c             	mov    0xc(%ebp),%eax
  c00883:	8b 00                	mov    (%eax),%eax
  c00885:	0f b6 00             	movzbl (%eax),%eax
  c00888:	3c 29                	cmp    $0x29,%al
  c0088a:	75 04                	jne    c00890 <command+0x48>
  c0088c:	83 4d d8 10          	orl    $0x10,-0x28(%ebp)
  c00890:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c00893:	e9 2e 01 00 00       	jmp    c009c6 <command+0x17e>
  c00898:	8b 03                	mov    (%ebx),%eax
  c0089a:	0f b6 00             	movzbl (%eax),%eax
  c0089d:	0f be c0             	movsbl %al,%eax
  c008a0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  c008a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  c008a6:	83 f8 29             	cmp    $0x29,%eax
  c008a9:	74 46                	je     c008f1 <command+0xa9>
  c008ab:	83 f8 29             	cmp    $0x29,%eax
  c008ae:	7f 0a                	jg     c008ba <command+0x72>
  c008b0:	83 f8 28             	cmp    $0x28,%eax
  c008b3:	74 14                	je     c008c9 <command+0x81>
  c008b5:	e9 ea 00 00 00       	jmp    c009a4 <command+0x15c>
  c008ba:	83 f8 3c             	cmp    $0x3c,%eax
  c008bd:	74 63                	je     c00922 <command+0xda>
  c008bf:	83 f8 3e             	cmp    $0x3e,%eax
  c008c2:	74 44                	je     c00908 <command+0xc0>
  c008c4:	e9 db 00 00 00       	jmp    c009a4 <command+0x15c>
  c008c9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  c008cd:	75 19                	jne    c008e8 <command+0xa0>
  c008cf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c008d3:	74 0d                	je     c008e2 <command+0x9a>
  c008d5:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c008da:	83 c0 01             	add    $0x1,%eax
  c008dd:	a3 78 68 c0 00       	mov    %eax,0xc06878
  c008e2:	8d 43 04             	lea    0x4(%ebx),%eax
  c008e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c008e8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  c008ec:	e9 d2 00 00 00       	jmp    c009c3 <command+0x17b>
  c008f1:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  c008f5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  c008f9:	75 08                	jne    c00903 <command+0xbb>
  c008fb:	89 5d f0             	mov    %ebx,-0x10(%ebp)
  c008fe:	e9 c0 00 00 00       	jmp    c009c3 <command+0x17b>
  c00903:	e9 bb 00 00 00       	jmp    c009c3 <command+0x17b>
  c00908:	83 c3 04             	add    $0x4,%ebx
  c0090b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  c0090e:	74 0f                	je     c0091f <command+0xd7>
  c00910:	8b 03                	mov    (%ebx),%eax
  c00912:	0f b6 00             	movzbl (%eax),%eax
  c00915:	3c 3e                	cmp    $0x3e,%al
  c00917:	75 06                	jne    c0091f <command+0xd7>
  c00919:	83 4d d8 02          	orl    $0x2,-0x28(%ebp)
  c0091d:	eb 03                	jmp    c00922 <command+0xda>
  c0091f:	83 eb 04             	sub    $0x4,%ebx
  c00922:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  c00926:	75 7c                	jne    c009a4 <command+0x15c>
  c00928:	83 c3 04             	add    $0x4,%ebx
  c0092b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  c0092e:	75 10                	jne    c00940 <command+0xf8>
  c00930:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c00935:	83 c0 01             	add    $0x1,%eax
  c00938:	a3 78 68 c0 00       	mov    %eax,0xc06878
  c0093d:	83 eb 04             	sub    $0x4,%ebx
  c00940:	8b 03                	mov    (%ebx),%eax
  c00942:	0f b6 00             	movzbl (%eax),%eax
  c00945:	0f be c0             	movsbl %al,%eax
  c00948:	83 ec 08             	sub    $0x8,%esp
  c0094b:	68 90 27 c0 00       	push   $0xc02790
  c00950:	50                   	push   %eax
  c00951:	e8 67 09 00 00       	call   c012bd <any>
  c00956:	83 c4 10             	add    $0x10,%esp
  c00959:	85 c0                	test   %eax,%eax
  c0095b:	74 0d                	je     c0096a <command+0x122>
  c0095d:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c00962:	83 c0 01             	add    $0x1,%eax
  c00965:	a3 78 68 c0 00       	mov    %eax,0xc06878
  c0096a:	83 7d d4 3c          	cmpl   $0x3c,-0x2c(%ebp)
  c0096e:	75 1a                	jne    c0098a <command+0x142>
  c00970:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  c00974:	74 0d                	je     c00983 <command+0x13b>
  c00976:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c0097b:	83 c0 01             	add    $0x1,%eax
  c0097e:	a3 78 68 c0 00       	mov    %eax,0xc06878
  c00983:	8b 03                	mov    (%ebx),%eax
  c00985:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c00988:	eb 39                	jmp    c009c3 <command+0x17b>
  c0098a:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  c0098e:	74 0d                	je     c0099d <command+0x155>
  c00990:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c00995:	83 c0 01             	add    $0x1,%eax
  c00998:	a3 78 68 c0 00       	mov    %eax,0xc06878
  c0099d:	8b 03                	mov    (%ebx),%eax
  c0099f:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c009a2:	eb 1f                	jmp    c009c3 <command+0x17b>
  c009a4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  c009a8:	75 19                	jne    c009c3 <command+0x17b>
  c009aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c009ad:	8d 50 01             	lea    0x1(%eax),%edx
  c009b0:	89 55 e8             	mov    %edx,-0x18(%ebp)
  c009b3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c009ba:	8b 45 08             	mov    0x8(%ebp),%eax
  c009bd:	01 c2                	add    %eax,%edx
  c009bf:	8b 03                	mov    (%ebx),%eax
  c009c1:	89 02                	mov    %eax,(%edx)
  c009c3:	83 c3 04             	add    $0x4,%ebx
  c009c6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  c009c9:	0f 85 c9 fe ff ff    	jne    c00898 <command+0x50>
  c009cf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c009d3:	74 47                	je     c00a1c <command+0x1d4>
  c009d5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  c009d9:	74 0d                	je     c009e8 <command+0x1a0>
  c009db:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c009e0:	83 c0 01             	add    $0x1,%eax
  c009e3:	a3 78 68 c0 00       	mov    %eax,0xc06878
  c009e8:	83 ec 0c             	sub    $0xc,%esp
  c009eb:	6a 05                	push   $0x5
  c009ed:	e8 95 00 00 00       	call   c00a87 <tree>
  c009f2:	83 c4 10             	add    $0x10,%esp
  c009f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c009f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c009fb:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  c00a01:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00a04:	8d 58 10             	lea    0x10(%eax),%ebx
  c00a07:	83 ec 08             	sub    $0x8,%esp
  c00a0a:	ff 75 f0             	pushl  -0x10(%ebp)
  c00a0d:	ff 75 f4             	pushl  -0xc(%ebp)
  c00a10:	e8 04 fc ff ff       	call   c00619 <cmdlist>
  c00a15:	83 c4 10             	add    $0x10,%esp
  c00a18:	89 03                	mov    %eax,(%ebx)
  c00a1a:	eb 42                	jmp    c00a5e <command+0x216>
  c00a1c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  c00a20:	75 0d                	jne    c00a2f <command+0x1e7>
  c00a22:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c00a27:	83 c0 01             	add    $0x1,%eax
  c00a2a:	a3 78 68 c0 00       	mov    %eax,0xc06878
  c00a2f:	83 ec 0c             	sub    $0xc,%esp
  c00a32:	6a 06                	push   $0x6
  c00a34:	e8 4e 00 00 00       	call   c00a87 <tree>
  c00a39:	83 c4 10             	add    $0x10,%esp
  c00a3c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c00a3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00a42:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  c00a48:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00a4b:	8d 50 10             	lea    0x10(%eax),%edx
  c00a4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c00a51:	89 02                	mov    %eax,(%edx)
  c00a53:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00a56:	8d 50 14             	lea    0x14(%eax),%edx
  c00a59:	8b 45 08             	mov    0x8(%ebp),%eax
  c00a5c:	89 02                	mov    %eax,(%edx)
  c00a5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00a61:	8d 50 0c             	lea    0xc(%eax),%edx
  c00a64:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c00a67:	89 02                	mov    %eax,(%edx)
  c00a69:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00a6c:	8d 50 04             	lea    0x4(%eax),%edx
  c00a6f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c00a72:	89 02                	mov    %eax,(%edx)
  c00a74:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00a77:	8d 50 08             	lea    0x8(%eax),%edx
  c00a7a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00a7d:	89 02                	mov    %eax,(%edx)
  c00a7f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00a82:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c00a85:	c9                   	leave  
  c00a86:	c3                   	ret    

00c00a87 <tree>:
  c00a87:	55                   	push   %ebp
  c00a88:	89 e5                	mov    %esp,%ebp
  c00a8a:	83 ec 18             	sub    $0x18,%esp
  c00a8d:	a1 8c 62 c0 00       	mov    0xc0628c,%eax
  c00a92:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00a95:	a1 8c 62 c0 00       	mov    0xc0628c,%eax
  c00a9a:	8b 55 08             	mov    0x8(%ebp),%edx
  c00a9d:	c1 e2 02             	shl    $0x2,%edx
  c00aa0:	01 d0                	add    %edx,%eax
  c00aa2:	a3 8c 62 c0 00       	mov    %eax,0xc0628c
  c00aa7:	8b 15 8c 62 c0 00    	mov    0xc0628c,%edx
  c00aad:	a1 68 68 c0 00       	mov    0xc06868,%eax
  c00ab2:	39 c2                	cmp    %eax,%edx
  c00ab4:	76 24                	jbe    c00ada <tree+0x53>
  c00ab6:	83 ec 0c             	sub    $0xc,%esp
  c00ab9:	68 94 27 c0 00       	push   $0xc02794
  c00abe:	e8 ad 06 00 00       	call   c01170 <prs>
  c00ac3:	83 c4 10             	add    $0x10,%esp
  c00ac6:	a1 78 68 c0 00       	mov    0xc06878,%eax
  c00acb:	83 c0 01             	add    $0x1,%eax
  c00ace:	a3 78 68 c0 00       	mov    %eax,0xc06878
  c00ad3:	b8 00 00 00 00       	mov    $0x0,%eax
  c00ad8:	eb 03                	jmp    c00add <tree+0x56>
  c00ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00add:	c9                   	leave  
  c00ade:	c3                   	ret    

00c00adf <execute>:
  c00adf:	55                   	push   %ebp
  c00ae0:	89 e5                	mov    %esp,%ebp
  c00ae2:	53                   	push   %ebx
  c00ae3:	83 ec 14             	sub    $0x14,%esp
  c00ae6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c00aea:	75 05                	jne    c00af1 <execute+0x12>
  c00aec:	e9 05 02 00 00       	jmp    c00cf6 <execute+0x217>
  c00af1:	8b 45 08             	mov    0x8(%ebp),%eax
  c00af4:	8b 00                	mov    (%eax),%eax
  c00af6:	83 f8 02             	cmp    $0x2,%eax
  c00af9:	0f 84 b4 00 00 00    	je     c00bb3 <execute+0xd4>
  c00aff:	83 f8 02             	cmp    $0x2,%eax
  c00b02:	7f 0e                	jg     c00b12 <execute+0x33>
  c00b04:	83 f8 01             	cmp    $0x1,%eax
  c00b07:	0f 84 8f 00 00 00    	je     c00b9c <execute+0xbd>
  c00b0d:	e9 e4 01 00 00       	jmp    c00cf6 <execute+0x217>
  c00b12:	83 f8 03             	cmp    $0x3,%eax
  c00b15:	74 77                	je     c00b8e <execute+0xaf>
  c00b17:	83 f8 04             	cmp    $0x4,%eax
  c00b1a:	0f 85 d6 01 00 00    	jne    c00cf6 <execute+0x217>
  c00b20:	8b 45 08             	mov    0x8(%ebp),%eax
  c00b23:	8b 40 0c             	mov    0xc(%eax),%eax
  c00b26:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c00b29:	8b 45 08             	mov    0x8(%ebp),%eax
  c00b2c:	83 c0 04             	add    $0x4,%eax
  c00b2f:	8b 00                	mov    (%eax),%eax
  c00b31:	89 c3                	mov    %eax,%ebx
  c00b33:	85 db                	test   %ebx,%ebx
  c00b35:	74 12                	je     c00b49 <execute+0x6a>
  c00b37:	8d 43 0c             	lea    0xc(%ebx),%eax
  c00b3a:	8d 53 0c             	lea    0xc(%ebx),%edx
  c00b3d:	8b 12                	mov    (%edx),%edx
  c00b3f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  c00b42:	83 e1 20             	and    $0x20,%ecx
  c00b45:	09 ca                	or     %ecx,%edx
  c00b47:	89 10                	mov    %edx,(%eax)
  c00b49:	83 ec 04             	sub    $0x4,%esp
  c00b4c:	6a 00                	push   $0x0
  c00b4e:	6a 00                	push   $0x0
  c00b50:	53                   	push   %ebx
  c00b51:	e8 89 ff ff ff       	call   c00adf <execute>
  c00b56:	83 c4 10             	add    $0x10,%esp
  c00b59:	8b 45 08             	mov    0x8(%ebp),%eax
  c00b5c:	83 c0 08             	add    $0x8,%eax
  c00b5f:	8b 00                	mov    (%eax),%eax
  c00b61:	89 c3                	mov    %eax,%ebx
  c00b63:	85 db                	test   %ebx,%ebx
  c00b65:	74 12                	je     c00b79 <execute+0x9a>
  c00b67:	8d 43 0c             	lea    0xc(%ebx),%eax
  c00b6a:	8d 53 0c             	lea    0xc(%ebx),%edx
  c00b6d:	8b 12                	mov    (%edx),%edx
  c00b6f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  c00b72:	83 e1 20             	and    $0x20,%ecx
  c00b75:	09 ca                	or     %ecx,%edx
  c00b77:	89 10                	mov    %edx,(%eax)
  c00b79:	83 ec 04             	sub    $0x4,%esp
  c00b7c:	6a 00                	push   $0x0
  c00b7e:	6a 00                	push   $0x0
  c00b80:	53                   	push   %ebx
  c00b81:	e8 59 ff ff ff       	call   c00adf <execute>
  c00b86:	83 c4 10             	add    $0x10,%esp
  c00b89:	e9 68 01 00 00       	jmp    c00cf6 <execute+0x217>
  c00b8e:	8b 45 08             	mov    0x8(%ebp),%eax
  c00b91:	8b 40 0c             	mov    0xc(%eax),%eax
  c00b94:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c00b97:	e9 5a 01 00 00       	jmp    c00cf6 <execute+0x217>
  c00b9c:	83 ec 0c             	sub    $0xc,%esp
  c00b9f:	ff 75 08             	pushl  0x8(%ebp)
  c00ba2:	e8 c4 01 00 00       	call   c00d6b <builtin>
  c00ba7:	83 c4 10             	add    $0x10,%esp
  c00baa:	85 c0                	test   %eax,%eax
  c00bac:	74 05                	je     c00bb3 <execute+0xd4>
  c00bae:	e9 43 01 00 00       	jmp    c00cf6 <execute+0x217>
  c00bb3:	8b 45 08             	mov    0x8(%ebp),%eax
  c00bb6:	8b 40 0c             	mov    0xc(%eax),%eax
  c00bb9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c00bbc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c00bc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00bc6:	83 e0 10             	and    $0x10,%eax
  c00bc9:	85 c0                	test   %eax,%eax
  c00bcb:	75 08                	jne    c00bd5 <execute+0xf6>
  c00bcd:	e8 5b 0b 00 00       	call   c0172d <fork>
  c00bd2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00bd5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  c00bd9:	75 15                	jne    c00bf0 <execute+0x111>
  c00bdb:	83 ec 0c             	sub    $0xc,%esp
  c00bde:	68 ab 27 c0 00       	push   $0xc027ab
  c00be3:	e8 3e 05 00 00       	call   c01126 <err>
  c00be8:	83 c4 10             	add    $0x10,%esp
  c00beb:	e9 06 01 00 00       	jmp    c00cf6 <execute+0x217>
  c00bf0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c00bf4:	74 68                	je     c00c5e <execute+0x17f>
  c00bf6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00bf9:	83 e0 40             	and    $0x40,%eax
  c00bfc:	85 c0                	test   %eax,%eax
  c00bfe:	74 1e                	je     c00c1e <execute+0x13f>
  c00c00:	83 ec 0c             	sub    $0xc,%esp
  c00c03:	ff 75 f4             	pushl  -0xc(%ebp)
  c00c06:	e8 b5 05 00 00       	call   c011c0 <prn>
  c00c0b:	83 c4 10             	add    $0x10,%esp
  c00c0e:	83 ec 0c             	sub    $0xc,%esp
  c00c11:	68 b5 27 c0 00       	push   $0xc027b5
  c00c16:	e8 55 05 00 00       	call   c01170 <prs>
  c00c1b:	83 c4 10             	add    $0x10,%esp
  c00c1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00c21:	83 e0 01             	and    $0x1,%eax
  c00c24:	85 c0                	test   %eax,%eax
  c00c26:	74 0f                	je     c00c37 <execute+0x158>
  c00c28:	c7 05 98 50 c0 00 00 	movl   $0x0,0xc05098
  c00c2f:	00 00 00 
  c00c32:	e9 bf 00 00 00       	jmp    c00cf6 <execute+0x217>
  c00c37:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00c3a:	83 e0 08             	and    $0x8,%eax
  c00c3d:	85 c0                	test   %eax,%eax
  c00c3f:	75 18                	jne    c00c59 <execute+0x17a>
  c00c41:	83 ec 0c             	sub    $0xc,%esp
  c00c44:	ff 75 f4             	pushl  -0xc(%ebp)
  c00c47:	e8 d8 06 00 00       	call   c01324 <pwait>
  c00c4c:	83 c4 10             	add    $0x10,%esp
  c00c4f:	a3 98 50 c0 00       	mov    %eax,0xc05098
  c00c54:	e9 9d 00 00 00       	jmp    c00cf6 <execute+0x217>
  c00c59:	e9 98 00 00 00       	jmp    c00cf6 <execute+0x217>
  c00c5e:	83 ec 0c             	sub    $0xc,%esp
  c00c61:	ff 75 08             	pushl  0x8(%ebp)
  c00c64:	e8 92 00 00 00       	call   c00cfb <redirect>
  c00c69:	83 c4 10             	add    $0x10,%esp
  c00c6c:	85 c0                	test   %eax,%eax
  c00c6e:	74 0a                	je     c00c7a <execute+0x19b>
  c00c70:	83 ec 0c             	sub    $0xc,%esp
  c00c73:	6a 01                	push   $0x1
  c00c75:	e8 6f 11 00 00       	call   c01de9 <exit>
  c00c7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00c7d:	83 e0 20             	and    $0x20,%eax
  c00c80:	85 c0                	test   %eax,%eax
  c00c82:	74 0a                	je     c00c8e <execute+0x1af>
  c00c84:	8b 45 08             	mov    0x8(%ebp),%eax
  c00c87:	83 c0 04             	add    $0x4,%eax
  c00c8a:	8b 00                	mov    (%eax),%eax
  c00c8c:	85 c0                	test   %eax,%eax
  c00c8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c00c91:	83 e0 20             	and    $0x20,%eax
  c00c94:	85 c0                	test   %eax,%eax
  c00c96:	8b 45 08             	mov    0x8(%ebp),%eax
  c00c99:	8b 00                	mov    (%eax),%eax
  c00c9b:	83 f8 02             	cmp    $0x2,%eax
  c00c9e:	75 3a                	jne    c00cda <execute+0x1fb>
  c00ca0:	8b 45 08             	mov    0x8(%ebp),%eax
  c00ca3:	83 c0 10             	add    $0x10,%eax
  c00ca6:	8b 00                	mov    (%eax),%eax
  c00ca8:	89 c3                	mov    %eax,%ebx
  c00caa:	85 db                	test   %ebx,%ebx
  c00cac:	74 12                	je     c00cc0 <execute+0x1e1>
  c00cae:	8d 43 0c             	lea    0xc(%ebx),%eax
  c00cb1:	8d 53 0c             	lea    0xc(%ebx),%edx
  c00cb4:	8b 12                	mov    (%edx),%edx
  c00cb6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  c00cb9:	83 e1 20             	and    $0x20,%ecx
  c00cbc:	09 ca                	or     %ecx,%edx
  c00cbe:	89 10                	mov    %edx,(%eax)
  c00cc0:	83 ec 04             	sub    $0x4,%esp
  c00cc3:	6a 00                	push   $0x0
  c00cc5:	6a 00                	push   $0x0
  c00cc7:	53                   	push   %ebx
  c00cc8:	e8 12 fe ff ff       	call   c00adf <execute>
  c00ccd:	83 c4 10             	add    $0x10,%esp
  c00cd0:	83 ec 0c             	sub    $0xc,%esp
  c00cd3:	6a 01                	push   $0x1
  c00cd5:	e8 0f 11 00 00       	call   c01de9 <exit>
  c00cda:	83 ec 0c             	sub    $0xc,%esp
  c00cdd:	ff 75 08             	pushl  0x8(%ebp)
  c00ce0:	e8 3d 03 00 00       	call   c01022 <execcmd>
  c00ce5:	83 c4 10             	add    $0x10,%esp
  c00ce8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00ceb:	83 ec 0c             	sub    $0xc,%esp
  c00cee:	ff 75 f4             	pushl  -0xc(%ebp)
  c00cf1:	e8 f3 10 00 00       	call   c01de9 <exit>
  c00cf6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c00cf9:	c9                   	leave  
  c00cfa:	c3                   	ret    

00c00cfb <redirect>:
  c00cfb:	55                   	push   %ebp
  c00cfc:	89 e5                	mov    %esp,%ebp
  c00cfe:	83 ec 18             	sub    $0x18,%esp
  c00d01:	8b 45 08             	mov    0x8(%ebp),%eax
  c00d04:	83 c0 04             	add    $0x4,%eax
  c00d07:	8b 00                	mov    (%eax),%eax
  c00d09:	85 c0                	test   %eax,%eax
  c00d0b:	74 57                	je     c00d64 <redirect+0x69>
  c00d0d:	83 ec 0c             	sub    $0xc,%esp
  c00d10:	6a 00                	push   $0x0
  c00d12:	e8 85 0f 00 00       	call   c01c9c <close>
  c00d17:	83 c4 10             	add    $0x10,%esp
  c00d1a:	8b 45 08             	mov    0x8(%ebp),%eax
  c00d1d:	83 c0 04             	add    $0x4,%eax
  c00d20:	8b 00                	mov    (%eax),%eax
  c00d22:	83 ec 08             	sub    $0x8,%esp
  c00d25:	6a 00                	push   $0x0
  c00d27:	50                   	push   %eax
  c00d28:	e8 ca 0e 00 00       	call   c01bf7 <open>
  c00d2d:	83 c4 10             	add    $0x10,%esp
  c00d30:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00d33:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c00d37:	79 2b                	jns    c00d64 <redirect+0x69>
  c00d39:	8b 45 08             	mov    0x8(%ebp),%eax
  c00d3c:	83 c0 04             	add    $0x4,%eax
  c00d3f:	8b 00                	mov    (%eax),%eax
  c00d41:	83 ec 0c             	sub    $0xc,%esp
  c00d44:	50                   	push   %eax
  c00d45:	e8 26 04 00 00       	call   c01170 <prs>
  c00d4a:	83 c4 10             	add    $0x10,%esp
  c00d4d:	83 ec 0c             	sub    $0xc,%esp
  c00d50:	68 5b 26 c0 00       	push   $0xc0265b
  c00d55:	e8 cc 03 00 00       	call   c01126 <err>
  c00d5a:	83 c4 10             	add    $0x10,%esp
  c00d5d:	b8 01 00 00 00       	mov    $0x1,%eax
  c00d62:	eb 05                	jmp    c00d69 <redirect+0x6e>
  c00d64:	b8 00 00 00 00       	mov    $0x0,%eax
  c00d69:	c9                   	leave  
  c00d6a:	c3                   	ret    

00c00d6b <builtin>:
  c00d6b:	55                   	push   %ebp
  c00d6c:	89 e5                	mov    %esp,%ebp
  c00d6e:	53                   	push   %ebx
  c00d6f:	83 ec 14             	sub    $0x14,%esp
  c00d72:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c00d79:	8b 45 08             	mov    0x8(%ebp),%eax
  c00d7c:	8b 40 10             	mov    0x10(%eax),%eax
  c00d7f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c00d82:	8b 45 08             	mov    0x8(%ebp),%eax
  c00d85:	83 c0 14             	add    $0x14,%eax
  c00d88:	8b 00                	mov    (%eax),%eax
  c00d8a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c00d8d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00d90:	8b 18                	mov    (%eax),%ebx
  c00d92:	83 ec 08             	sub    $0x8,%esp
  c00d95:	68 b7 27 c0 00       	push   $0xc027b7
  c00d9a:	53                   	push   %ebx
  c00d9b:	e8 4c 05 00 00       	call   c012ec <equal>
  c00da0:	83 c4 10             	add    $0x10,%esp
  c00da3:	85 c0                	test   %eax,%eax
  c00da5:	75 15                	jne    c00dbc <builtin+0x51>
  c00da7:	83 ec 08             	sub    $0x8,%esp
  c00daa:	68 ba 27 c0 00       	push   $0xc027ba
  c00daf:	53                   	push   %ebx
  c00db0:	e8 37 05 00 00       	call   c012ec <equal>
  c00db5:	83 c4 10             	add    $0x10,%esp
  c00db8:	85 c0                	test   %eax,%eax
  c00dba:	74 20                	je     c00ddc <builtin+0x71>
  c00dbc:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
  c00dc0:	74 10                	je     c00dd2 <builtin+0x67>
  c00dc2:	83 ec 0c             	sub    $0xc,%esp
  c00dc5:	68 c0 27 c0 00       	push   $0xc027c0
  c00dca:	e8 57 03 00 00       	call   c01126 <err>
  c00dcf:	83 c4 10             	add    $0x10,%esp
  c00dd2:	b8 01 00 00 00       	mov    $0x1,%eax
  c00dd7:	e9 41 02 00 00       	jmp    c0101d <builtin+0x2b2>
  c00ddc:	83 ec 08             	sub    $0x8,%esp
  c00ddf:	68 d1 27 c0 00       	push   $0xc027d1
  c00de4:	53                   	push   %ebx
  c00de5:	e8 02 05 00 00       	call   c012ec <equal>
  c00dea:	83 c4 10             	add    $0x10,%esp
  c00ded:	85 c0                	test   %eax,%eax
  c00def:	74 58                	je     c00e49 <builtin+0xde>
  c00df1:	a1 5c 68 c0 00       	mov    0xc0685c,%eax
  c00df6:	85 c0                	test   %eax,%eax
  c00df8:	7f 1a                	jg     c00e14 <builtin+0xa9>
  c00dfa:	83 ec 0c             	sub    $0xc,%esp
  c00dfd:	68 d7 27 c0 00       	push   $0xc027d7
  c00e02:	e8 69 03 00 00       	call   c01170 <prs>
  c00e07:	83 c4 10             	add    $0x10,%esp
  c00e0a:	b8 01 00 00 00       	mov    $0x1,%eax
  c00e0f:	e9 09 02 00 00       	jmp    c0101d <builtin+0x2b2>
  c00e14:	a1 58 68 c0 00       	mov    0xc06858,%eax
  c00e19:	8d 50 04             	lea    0x4(%eax),%edx
  c00e1c:	a1 58 68 c0 00       	mov    0xc06858,%eax
  c00e21:	8b 00                	mov    (%eax),%eax
  c00e23:	89 02                	mov    %eax,(%edx)
  c00e25:	a1 58 68 c0 00       	mov    0xc06858,%eax
  c00e2a:	83 c0 04             	add    $0x4,%eax
  c00e2d:	a3 58 68 c0 00       	mov    %eax,0xc06858
  c00e32:	a1 5c 68 c0 00       	mov    0xc0685c,%eax
  c00e37:	83 e8 01             	sub    $0x1,%eax
  c00e3a:	a3 5c 68 c0 00       	mov    %eax,0xc0685c
  c00e3f:	b8 01 00 00 00       	mov    $0x1,%eax
  c00e44:	e9 d4 01 00 00       	jmp    c0101d <builtin+0x2b2>
  c00e49:	83 ec 08             	sub    $0x8,%esp
  c00e4c:	68 e7 27 c0 00       	push   $0xc027e7
  c00e51:	53                   	push   %ebx
  c00e52:	e8 95 04 00 00       	call   c012ec <equal>
  c00e57:	83 c4 10             	add    $0x10,%esp
  c00e5a:	85 c0                	test   %eax,%eax
  c00e5c:	74 1a                	je     c00e78 <builtin+0x10d>
  c00e5e:	83 ec 0c             	sub    $0xc,%esp
  c00e61:	68 ed 27 c0 00       	push   $0xc027ed
  c00e66:	e8 05 03 00 00       	call   c01170 <prs>
  c00e6b:	83 c4 10             	add    $0x10,%esp
  c00e6e:	b8 01 00 00 00       	mov    $0x1,%eax
  c00e73:	e9 a5 01 00 00       	jmp    c0101d <builtin+0x2b2>
  c00e78:	83 ec 08             	sub    $0x8,%esp
  c00e7b:	68 04 28 c0 00       	push   $0xc02804
  c00e80:	53                   	push   %ebx
  c00e81:	e8 66 04 00 00       	call   c012ec <equal>
  c00e86:	83 c4 10             	add    $0x10,%esp
  c00e89:	85 c0                	test   %eax,%eax
  c00e8b:	74 1a                	je     c00ea7 <builtin+0x13c>
  c00e8d:	83 ec 0c             	sub    $0xc,%esp
  c00e90:	68 0b 28 c0 00       	push   $0xc0280b
  c00e95:	e8 d6 02 00 00       	call   c01170 <prs>
  c00e9a:	83 c4 10             	add    $0x10,%esp
  c00e9d:	b8 01 00 00 00       	mov    $0x1,%eax
  c00ea2:	e9 76 01 00 00       	jmp    c0101d <builtin+0x2b2>
  c00ea7:	83 ec 08             	sub    $0x8,%esp
  c00eaa:	68 23 28 c0 00       	push   $0xc02823
  c00eaf:	53                   	push   %ebx
  c00eb0:	e8 37 04 00 00       	call   c012ec <equal>
  c00eb5:	83 c4 10             	add    $0x10,%esp
  c00eb8:	85 c0                	test   %eax,%eax
  c00eba:	74 17                	je     c00ed3 <builtin+0x168>
  c00ebc:	83 ec 0c             	sub    $0xc,%esp
  c00ebf:	6a ff                	push   $0xffffffff
  c00ec1:	e8 5e 04 00 00       	call   c01324 <pwait>
  c00ec6:	83 c4 10             	add    $0x10,%esp
  c00ec9:	b8 01 00 00 00       	mov    $0x1,%eax
  c00ece:	e9 4a 01 00 00       	jmp    c0101d <builtin+0x2b2>
  c00ed3:	83 ec 08             	sub    $0x8,%esp
  c00ed6:	68 28 28 c0 00       	push   $0xc02828
  c00edb:	53                   	push   %ebx
  c00edc:	e8 0b 04 00 00       	call   c012ec <equal>
  c00ee1:	83 c4 10             	add    $0x10,%esp
  c00ee4:	85 c0                	test   %eax,%eax
  c00ee6:	74 0a                	je     c00ef2 <builtin+0x187>
  c00ee8:	b8 01 00 00 00       	mov    $0x1,%eax
  c00eed:	e9 2b 01 00 00       	jmp    c0101d <builtin+0x2b2>
  c00ef2:	83 ec 08             	sub    $0x8,%esp
  c00ef5:	68 2a 28 c0 00       	push   $0xc0282a
  c00efa:	53                   	push   %ebx
  c00efb:	e8 ec 03 00 00       	call   c012ec <equal>
  c00f00:	83 c4 10             	add    $0x10,%esp
  c00f03:	85 c0                	test   %eax,%eax
  c00f05:	0f 84 88 00 00 00    	je     c00f93 <builtin+0x228>
  c00f0b:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
  c00f0f:	75 3d                	jne    c00f4e <builtin+0x1e3>
  c00f11:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00f14:	8b 58 04             	mov    0x4(%eax),%ebx
  c00f17:	eb 19                	jmp    c00f32 <builtin+0x1c7>
  c00f19:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c00f1c:	89 d0                	mov    %edx,%eax
  c00f1e:	c1 e0 02             	shl    $0x2,%eax
  c00f21:	01 d0                	add    %edx,%eax
  c00f23:	01 c0                	add    %eax,%eax
  c00f25:	89 c2                	mov    %eax,%edx
  c00f27:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c00f2a:	01 d0                	add    %edx,%eax
  c00f2c:	83 e8 30             	sub    $0x30,%eax
  c00f2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00f32:	89 d8                	mov    %ebx,%eax
  c00f34:	8d 58 01             	lea    0x1(%eax),%ebx
  c00f37:	0f b6 00             	movzbl (%eax),%eax
  c00f3a:	0f be c0             	movsbl %al,%eax
  c00f3d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c00f40:	83 7d e8 2f          	cmpl   $0x2f,-0x18(%ebp)
  c00f44:	7e 28                	jle    c00f6e <builtin+0x203>
  c00f46:	83 7d e8 39          	cmpl   $0x39,-0x18(%ebp)
  c00f4a:	7e cd                	jle    c00f19 <builtin+0x1ae>
  c00f4c:	eb 20                	jmp    c00f6e <builtin+0x203>
  c00f4e:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
  c00f52:	7e 1a                	jle    c00f6e <builtin+0x203>
  c00f54:	83 ec 0c             	sub    $0xc,%esp
  c00f57:	68 2f 28 c0 00       	push   $0xc0282f
  c00f5c:	e8 c5 01 00 00       	call   c01126 <err>
  c00f61:	83 c4 10             	add    $0x10,%esp
  c00f64:	b8 01 00 00 00       	mov    $0x1,%eax
  c00f69:	e9 af 00 00 00       	jmp    c0101d <builtin+0x2b2>
  c00f6e:	a1 80 61 c0 00       	mov    0xc06180,%eax
  c00f73:	85 c0                	test   %eax,%eax
  c00f75:	75 11                	jne    c00f88 <builtin+0x21d>
  c00f77:	83 ec 04             	sub    $0x4,%esp
  c00f7a:	6a 02                	push   $0x2
  c00f7c:	6a 00                	push   $0x0
  c00f7e:	6a 00                	push   $0x0
  c00f80:	e8 7c 08 00 00       	call   c01801 <lseek>
  c00f85:	83 c4 10             	add    $0x10,%esp
  c00f88:	83 ec 0c             	sub    $0xc,%esp
  c00f8b:	ff 75 f4             	pushl  -0xc(%ebp)
  c00f8e:	e8 56 0e 00 00       	call   c01de9 <exit>
  c00f93:	83 ec 08             	sub    $0x8,%esp
  c00f96:	68 3f 28 c0 00       	push   $0xc0283f
  c00f9b:	53                   	push   %ebx
  c00f9c:	e8 4b 03 00 00       	call   c012ec <equal>
  c00fa1:	83 c4 10             	add    $0x10,%esp
  c00fa4:	85 c0                	test   %eax,%eax
  c00fa6:	74 70                	je     c01018 <builtin+0x2ad>
  c00fa8:	83 ec 0c             	sub    $0xc,%esp
  c00fab:	ff 75 08             	pushl  0x8(%ebp)
  c00fae:	e8 48 fd ff ff       	call   c00cfb <redirect>
  c00fb3:	83 c4 10             	add    $0x10,%esp
  c00fb6:	85 c0                	test   %eax,%eax
  c00fb8:	74 11                	je     c00fcb <builtin+0x260>
  c00fba:	c7 05 98 50 c0 00 01 	movl   $0x1,0xc05098
  c00fc1:	00 00 00 
  c00fc4:	b8 01 00 00 00       	mov    $0x1,%eax
  c00fc9:	eb 52                	jmp    c0101d <builtin+0x2b2>
  c00fcb:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
  c00fcf:	7e 36                	jle    c01007 <builtin+0x29c>
  c00fd1:	8b 45 08             	mov    0x8(%ebp),%eax
  c00fd4:	83 c0 10             	add    $0x10,%eax
  c00fd7:	8b 55 f0             	mov    -0x10(%ebp),%edx
  c00fda:	83 ea 01             	sub    $0x1,%edx
  c00fdd:	89 10                	mov    %edx,(%eax)
  c00fdf:	8b 45 08             	mov    0x8(%ebp),%eax
  c00fe2:	8d 50 14             	lea    0x14(%eax),%edx
  c00fe5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00fe8:	83 c0 04             	add    $0x4,%eax
  c00feb:	89 02                	mov    %eax,(%edx)
  c00fed:	83 ec 0c             	sub    $0xc,%esp
  c00ff0:	ff 75 08             	pushl  0x8(%ebp)
  c00ff3:	e8 2a 00 00 00       	call   c01022 <execcmd>
  c00ff8:	83 c4 10             	add    $0x10,%esp
  c00ffb:	a3 98 50 c0 00       	mov    %eax,0xc05098
  c01000:	b8 01 00 00 00       	mov    $0x1,%eax
  c01005:	eb 16                	jmp    c0101d <builtin+0x2b2>
  c01007:	c7 05 98 50 c0 00 00 	movl   $0x0,0xc05098
  c0100e:	00 00 00 
  c01011:	b8 01 00 00 00       	mov    $0x1,%eax
  c01016:	eb 05                	jmp    c0101d <builtin+0x2b2>
  c01018:	b8 00 00 00 00       	mov    $0x0,%eax
  c0101d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c01020:	c9                   	leave  
  c01021:	c3                   	ret    

00c01022 <execcmd>:
  c01022:	55                   	push   %ebp
  c01023:	89 e5                	mov    %esp,%ebp
  c01025:	83 ec 18             	sub    $0x18,%esp
  c01028:	8b 45 08             	mov    0x8(%ebp),%eax
  c0102b:	8b 40 10             	mov    0x10(%eax),%eax
  c0102e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c01031:	8b 45 08             	mov    0x8(%ebp),%eax
  c01034:	83 c0 14             	add    $0x14,%eax
  c01037:	8b 00                	mov    (%eax),%eax
  c01039:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c0103c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c0103f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c01046:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01049:	01 d0                	add    %edx,%eax
  c0104b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  c01051:	83 ec 08             	sub    $0x8,%esp
  c01054:	68 1c 11 c0 00       	push   $0xc0111c
  c01059:	ff 75 f0             	pushl  -0x10(%ebp)
  c0105c:	e8 4a 00 00 00       	call   c010ab <scan>
  c01061:	83 c4 10             	add    $0x10,%esp
  c01064:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01067:	8b 00                	mov    (%eax),%eax
  c01069:	83 ec 08             	sub    $0x8,%esp
  c0106c:	ff 75 f0             	pushl  -0x10(%ebp)
  c0106f:	50                   	push   %eax
  c01070:	e8 05 00 00 00       	call   c0107a <texec>
  c01075:	83 c4 10             	add    $0x10,%esp
  c01078:	c9                   	leave  
  c01079:	c3                   	ret    

00c0107a <texec>:
  c0107a:	55                   	push   %ebp
  c0107b:	89 e5                	mov    %esp,%ebp
  c0107d:	83 ec 08             	sub    $0x8,%esp
  c01080:	83 ec 08             	sub    $0x8,%esp
  c01083:	ff 75 0c             	pushl  0xc(%ebp)
  c01086:	ff 75 08             	pushl  0x8(%ebp)
  c01089:	e8 ed 09 00 00       	call   c01a7b <execvp>
  c0108e:	83 c4 10             	add    $0x10,%esp
  c01091:	83 ec 08             	sub    $0x8,%esp
  c01094:	ff 75 08             	pushl  0x8(%ebp)
  c01097:	68 44 28 c0 00       	push   $0xc02844
  c0109c:	e8 83 0d 00 00       	call   c01e24 <printf>
  c010a1:	83 c4 10             	add    $0x10,%esp
  c010a4:	b8 7e 00 00 00       	mov    $0x7e,%eax
  c010a9:	c9                   	leave  
  c010aa:	c3                   	ret    

00c010ab <scan>:
  c010ab:	55                   	push   %ebp
  c010ac:	89 e5                	mov    %esp,%ebp
  c010ae:	57                   	push   %edi
  c010af:	56                   	push   %esi
  c010b0:	53                   	push   %ebx
  c010b1:	83 ec 0c             	sub    $0xc,%esp
  c010b4:	eb 23                	jmp    c010d9 <scan+0x2e>
  c010b6:	eb 18                	jmp    c010d0 <scan+0x25>
  c010b8:	89 de                	mov    %ebx,%esi
  c010ba:	8d 5e 01             	lea    0x1(%esi),%ebx
  c010bd:	89 f8                	mov    %edi,%eax
  c010bf:	0f be c0             	movsbl %al,%eax
  c010c2:	83 ec 0c             	sub    $0xc,%esp
  c010c5:	50                   	push   %eax
  c010c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  c010c9:	ff d0                	call   *%eax
  c010cb:	83 c4 10             	add    $0x10,%esp
  c010ce:	88 06                	mov    %al,(%esi)
  c010d0:	0f b6 3b             	movzbl (%ebx),%edi
  c010d3:	89 f8                	mov    %edi,%eax
  c010d5:	84 c0                	test   %al,%al
  c010d7:	75 df                	jne    c010b8 <scan+0xd>
  c010d9:	8b 45 08             	mov    0x8(%ebp),%eax
  c010dc:	8d 50 04             	lea    0x4(%eax),%edx
  c010df:	89 55 08             	mov    %edx,0x8(%ebp)
  c010e2:	8b 18                	mov    (%eax),%ebx
  c010e4:	85 db                	test   %ebx,%ebx
  c010e6:	75 ce                	jne    c010b6 <scan+0xb>
  c010e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c010eb:	5b                   	pop    %ebx
  c010ec:	5e                   	pop    %esi
  c010ed:	5f                   	pop    %edi
  c010ee:	5d                   	pop    %ebp
  c010ef:	c3                   	ret    

00c010f0 <tglob>:
  c010f0:	55                   	push   %ebp
  c010f1:	89 e5                	mov    %esp,%ebp
  c010f3:	83 ec 08             	sub    $0x8,%esp
  c010f6:	83 ec 08             	sub    $0x8,%esp
  c010f9:	68 62 28 c0 00       	push   $0xc02862
  c010fe:	ff 75 08             	pushl  0x8(%ebp)
  c01101:	e8 b7 01 00 00       	call   c012bd <any>
  c01106:	83 c4 10             	add    $0x10,%esp
  c01109:	85 c0                	test   %eax,%eax
  c0110b:	74 0a                	je     c01117 <tglob+0x27>
  c0110d:	c7 05 88 50 c0 00 01 	movl   $0x1,0xc05088
  c01114:	00 00 00 
  c01117:	8b 45 08             	mov    0x8(%ebp),%eax
  c0111a:	c9                   	leave  
  c0111b:	c3                   	ret    

00c0111c <trim>:
  c0111c:	55                   	push   %ebp
  c0111d:	89 e5                	mov    %esp,%ebp
  c0111f:	8b 45 08             	mov    0x8(%ebp),%eax
  c01122:	24 7f                	and    $0x7f,%al
  c01124:	5d                   	pop    %ebp
  c01125:	c3                   	ret    

00c01126 <err>:
  c01126:	55                   	push   %ebp
  c01127:	89 e5                	mov    %esp,%ebp
  c01129:	83 ec 08             	sub    $0x8,%esp
  c0112c:	83 ec 0c             	sub    $0xc,%esp
  c0112f:	ff 75 08             	pushl  0x8(%ebp)
  c01132:	e8 39 00 00 00       	call   c01170 <prs>
  c01137:	83 c4 10             	add    $0x10,%esp
  c0113a:	83 ec 0c             	sub    $0xc,%esp
  c0113d:	68 b5 27 c0 00       	push   $0xc027b5
  c01142:	e8 29 00 00 00       	call   c01170 <prs>
  c01147:	83 c4 10             	add    $0x10,%esp
  c0114a:	a1 80 61 c0 00       	mov    0xc06180,%eax
  c0114f:	85 c0                	test   %eax,%eax
  c01151:	75 1b                	jne    c0116e <err+0x48>
  c01153:	83 ec 04             	sub    $0x4,%esp
  c01156:	6a 02                	push   $0x2
  c01158:	6a 00                	push   $0x0
  c0115a:	6a 00                	push   $0x0
  c0115c:	e8 a0 06 00 00       	call   c01801 <lseek>
  c01161:	83 c4 10             	add    $0x10,%esp
  c01164:	83 ec 0c             	sub    $0xc,%esp
  c01167:	6a 01                	push   $0x1
  c01169:	e8 7b 0c 00 00       	call   c01de9 <exit>
  c0116e:	c9                   	leave  
  c0116f:	c3                   	ret    

00c01170 <prs>:
  c01170:	55                   	push   %ebp
  c01171:	89 e5                	mov    %esp,%ebp
  c01173:	53                   	push   %ebx
  c01174:	83 ec 04             	sub    $0x4,%esp
  c01177:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c0117a:	eb 17                	jmp    c01193 <prs+0x23>
  c0117c:	89 d8                	mov    %ebx,%eax
  c0117e:	8d 58 01             	lea    0x1(%eax),%ebx
  c01181:	0f b6 00             	movzbl (%eax),%eax
  c01184:	0f be c0             	movsbl %al,%eax
  c01187:	83 ec 0c             	sub    $0xc,%esp
  c0118a:	50                   	push   %eax
  c0118b:	e8 0f 00 00 00       	call   c0119f <prc>
  c01190:	83 c4 10             	add    $0x10,%esp
  c01193:	0f b6 03             	movzbl (%ebx),%eax
  c01196:	84 c0                	test   %al,%al
  c01198:	75 e2                	jne    c0117c <prs+0xc>
  c0119a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c0119d:	c9                   	leave  
  c0119e:	c3                   	ret    

00c0119f <prc>:
  c0119f:	55                   	push   %ebp
  c011a0:	89 e5                	mov    %esp,%ebp
  c011a2:	83 ec 18             	sub    $0x18,%esp
  c011a5:	8b 45 08             	mov    0x8(%ebp),%eax
  c011a8:	88 45 f4             	mov    %al,-0xc(%ebp)
  c011ab:	83 ec 04             	sub    $0x4,%esp
  c011ae:	6a 01                	push   $0x1
  c011b0:	8d 45 f4             	lea    -0xc(%ebp),%eax
  c011b3:	50                   	push   %eax
  c011b4:	6a 02                	push   $0x2
  c011b6:	e8 5a 09 00 00       	call   c01b15 <write>
  c011bb:	83 c4 10             	add    $0x10,%esp
  c011be:	c9                   	leave  
  c011bf:	c3                   	ret    

00c011c0 <prn>:
  c011c0:	55                   	push   %ebp
  c011c1:	89 e5                	mov    %esp,%ebp
  c011c3:	53                   	push   %ebx
  c011c4:	83 ec 04             	sub    $0x4,%esp
  c011c7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c011ca:	ba 67 66 66 66       	mov    $0x66666667,%edx
  c011cf:	89 c8                	mov    %ecx,%eax
  c011d1:	f7 ea                	imul   %edx
  c011d3:	c1 fa 02             	sar    $0x2,%edx
  c011d6:	89 c8                	mov    %ecx,%eax
  c011d8:	c1 f8 1f             	sar    $0x1f,%eax
  c011db:	89 d3                	mov    %edx,%ebx
  c011dd:	29 c3                	sub    %eax,%ebx
  c011df:	85 db                	test   %ebx,%ebx
  c011e1:	74 0c                	je     c011ef <prn+0x2f>
  c011e3:	83 ec 0c             	sub    $0xc,%esp
  c011e6:	53                   	push   %ebx
  c011e7:	e8 d4 ff ff ff       	call   c011c0 <prn>
  c011ec:	83 c4 10             	add    $0x10,%esp
  c011ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c011f2:	ba 67 66 66 66       	mov    $0x66666667,%edx
  c011f7:	89 c8                	mov    %ecx,%eax
  c011f9:	f7 ea                	imul   %edx
  c011fb:	c1 fa 02             	sar    $0x2,%edx
  c011fe:	89 c8                	mov    %ecx,%eax
  c01200:	c1 f8 1f             	sar    $0x1f,%eax
  c01203:	29 c2                	sub    %eax,%edx
  c01205:	89 d0                	mov    %edx,%eax
  c01207:	c1 e0 02             	shl    $0x2,%eax
  c0120a:	01 d0                	add    %edx,%eax
  c0120c:	01 c0                	add    %eax,%eax
  c0120e:	29 c1                	sub    %eax,%ecx
  c01210:	89 ca                	mov    %ecx,%edx
  c01212:	89 d0                	mov    %edx,%eax
  c01214:	83 c0 30             	add    $0x30,%eax
  c01217:	0f be c0             	movsbl %al,%eax
  c0121a:	83 ec 0c             	sub    $0xc,%esp
  c0121d:	50                   	push   %eax
  c0121e:	e8 7c ff ff ff       	call   c0119f <prc>
  c01223:	83 c4 10             	add    $0x10,%esp
  c01226:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c01229:	c9                   	leave  
  c0122a:	c3                   	ret    

00c0122b <sprn>:
  c0122b:	55                   	push   %ebp
  c0122c:	89 e5                	mov    %esp,%ebp
  c0122e:	83 ec 10             	sub    $0x10,%esp
  c01231:	c7 45 fc 00 ca 9a 3b 	movl   $0x3b9aca00,-0x4(%ebp)
  c01238:	eb 1b                	jmp    c01255 <sprn+0x2a>
  c0123a:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  c0123d:	ba 67 66 66 66       	mov    $0x66666667,%edx
  c01242:	89 c8                	mov    %ecx,%eax
  c01244:	f7 ea                	imul   %edx
  c01246:	c1 fa 02             	sar    $0x2,%edx
  c01249:	89 c8                	mov    %ecx,%eax
  c0124b:	c1 f8 1f             	sar    $0x1f,%eax
  c0124e:	29 c2                	sub    %eax,%edx
  c01250:	89 d0                	mov    %edx,%eax
  c01252:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c01255:	8b 45 08             	mov    0x8(%ebp),%eax
  c01258:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  c0125b:	7d 06                	jge    c01263 <sprn+0x38>
  c0125d:	83 7d fc 01          	cmpl   $0x1,-0x4(%ebp)
  c01261:	7f d7                	jg     c0123a <sprn+0xf>
  c01263:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c0126a:	eb 3e                	jmp    c012aa <sprn+0x7f>
  c0126c:	8b 55 f8             	mov    -0x8(%ebp),%edx
  c0126f:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01272:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  c01275:	8b 45 08             	mov    0x8(%ebp),%eax
  c01278:	99                   	cltd   
  c01279:	f7 7d fc             	idivl  -0x4(%ebp)
  c0127c:	83 c0 30             	add    $0x30,%eax
  c0127f:	88 01                	mov    %al,(%ecx)
  c01281:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  c01285:	8b 45 08             	mov    0x8(%ebp),%eax
  c01288:	99                   	cltd   
  c01289:	f7 7d fc             	idivl  -0x4(%ebp)
  c0128c:	89 55 08             	mov    %edx,0x8(%ebp)
  c0128f:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  c01292:	ba 67 66 66 66       	mov    $0x66666667,%edx
  c01297:	89 c8                	mov    %ecx,%eax
  c01299:	f7 ea                	imul   %edx
  c0129b:	c1 fa 02             	sar    $0x2,%edx
  c0129e:	89 c8                	mov    %ecx,%eax
  c012a0:	c1 f8 1f             	sar    $0x1f,%eax
  c012a3:	29 c2                	sub    %eax,%edx
  c012a5:	89 d0                	mov    %edx,%eax
  c012a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c012aa:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  c012ae:	7f bc                	jg     c0126c <sprn+0x41>
  c012b0:	8b 55 f8             	mov    -0x8(%ebp),%edx
  c012b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  c012b6:	01 d0                	add    %edx,%eax
  c012b8:	c6 00 00             	movb   $0x0,(%eax)
  c012bb:	c9                   	leave  
  c012bc:	c3                   	ret    

00c012bd <any>:
  c012bd:	55                   	push   %ebp
  c012be:	89 e5                	mov    %esp,%ebp
  c012c0:	53                   	push   %ebx
  c012c1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  c012c4:	eb 17                	jmp    c012dd <any+0x20>
  c012c6:	89 d8                	mov    %ebx,%eax
  c012c8:	8d 58 01             	lea    0x1(%eax),%ebx
  c012cb:	0f b6 00             	movzbl (%eax),%eax
  c012ce:	0f be c0             	movsbl %al,%eax
  c012d1:	3b 45 08             	cmp    0x8(%ebp),%eax
  c012d4:	75 07                	jne    c012dd <any+0x20>
  c012d6:	b8 01 00 00 00       	mov    $0x1,%eax
  c012db:	eb 0c                	jmp    c012e9 <any+0x2c>
  c012dd:	0f b6 03             	movzbl (%ebx),%eax
  c012e0:	84 c0                	test   %al,%al
  c012e2:	75 e2                	jne    c012c6 <any+0x9>
  c012e4:	b8 00 00 00 00       	mov    $0x0,%eax
  c012e9:	5b                   	pop    %ebx
  c012ea:	5d                   	pop    %ebp
  c012eb:	c3                   	ret    

00c012ec <equal>:
  c012ec:	55                   	push   %ebp
  c012ed:	89 e5                	mov    %esp,%ebp
  c012ef:	56                   	push   %esi
  c012f0:	53                   	push   %ebx
  c012f1:	8b 75 08             	mov    0x8(%ebp),%esi
  c012f4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  c012f7:	eb 13                	jmp    c0130c <equal+0x20>
  c012f9:	89 d8                	mov    %ebx,%eax
  c012fb:	8d 58 01             	lea    0x1(%eax),%ebx
  c012fe:	0f b6 00             	movzbl (%eax),%eax
  c01301:	84 c0                	test   %al,%al
  c01303:	75 07                	jne    c0130c <equal+0x20>
  c01305:	b8 01 00 00 00       	mov    $0x1,%eax
  c0130a:	eb 14                	jmp    c01320 <equal+0x34>
  c0130c:	89 f0                	mov    %esi,%eax
  c0130e:	8d 70 01             	lea    0x1(%eax),%esi
  c01311:	0f b6 10             	movzbl (%eax),%edx
  c01314:	0f b6 03             	movzbl (%ebx),%eax
  c01317:	38 c2                	cmp    %al,%dl
  c01319:	74 de                	je     c012f9 <equal+0xd>
  c0131b:	b8 00 00 00 00       	mov    $0x0,%eax
  c01320:	5b                   	pop    %ebx
  c01321:	5e                   	pop    %esi
  c01322:	5d                   	pop    %ebp
  c01323:	c3                   	ret    

00c01324 <pwait>:
  c01324:	55                   	push   %ebp
  c01325:	89 e5                	mov    %esp,%ebp
  c01327:	83 ec 10             	sub    $0x10,%esp
  c0132a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c0132e:	75 07                	jne    c01337 <pwait+0x13>
  c01330:	b8 00 00 00 00       	mov    $0x0,%eax
  c01335:	eb 37                	jmp    c0136e <pwait+0x4a>
  c01337:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c0133e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c01345:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c0134c:	ff 75 f8             	pushl  -0x8(%ebp)
  c0134f:	ff 75 f4             	pushl  -0xc(%ebp)
  c01352:	ff 75 f0             	pushl  -0x10(%ebp)
  c01355:	6a 0f                	push   $0xf
  c01357:	6a 03                	push   $0x3
  c01359:	e8 a2 ec ff ff       	call   c00000 <_run>
  c0135e:	83 c4 14             	add    $0x14,%esp
  c01361:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c01364:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%ebp)
  c01368:	75 01                	jne    c0136b <pwait+0x47>
  c0136a:	90                   	nop
  c0136b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c0136e:	c9                   	leave  
  c0136f:	c3                   	ret    

00c01370 <glob>:
  c01370:	55                   	push   %ebp
  c01371:	89 e5                	mov    %esp,%ebp
  c01373:	83 ec 08             	sub    $0x8,%esp
  c01376:	c7 05 c0 54 c0 00 c0 	movl   $0xc050c0,0xc054c0
  c0137d:	50 c0 00 
  c01380:	c7 05 00 5d c0 00 00 	movl   $0xc05500,0xc05d00
  c01387:	55 c0 00 
  c0138a:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  c0138e:	7f 1b                	jg     c013ab <glob+0x3b>
  c01390:	83 ec 04             	sub    $0x4,%esp
  c01393:	6a 0a                	push   $0xa
  c01395:	68 66 28 c0 00       	push   $0xc02866
  c0139a:	6a 02                	push   $0x2
  c0139c:	e8 74 07 00 00       	call   c01b15 <write>
  c013a1:	83 c4 10             	add    $0x10,%esp
  c013a4:	b8 01 00 00 00       	mov    $0x1,%eax
  c013a9:	eb 50                	jmp    c013fb <glob+0x8b>
  c013ab:	83 45 0c 04          	addl   $0x4,0xc(%ebp)
  c013af:	a1 00 5d c0 00       	mov    0xc05d00,%eax
  c013b4:	8d 50 04             	lea    0x4(%eax),%edx
  c013b7:	89 15 00 5d c0 00    	mov    %edx,0xc05d00
  c013bd:	8b 55 0c             	mov    0xc(%ebp),%edx
  c013c0:	8b 12                	mov    (%edx),%edx
  c013c2:	89 10                	mov    %edx,(%eax)
  c013c4:	eb 15                	jmp    c013db <glob+0x6b>
  c013c6:	83 45 0c 04          	addl   $0x4,0xc(%ebp)
  c013ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  c013cd:	8b 00                	mov    (%eax),%eax
  c013cf:	83 ec 0c             	sub    $0xc,%esp
  c013d2:	50                   	push   %eax
  c013d3:	e8 25 00 00 00       	call   c013fd <expand>
  c013d8:	83 c4 10             	add    $0x10,%esp
  c013db:	83 6d 08 01          	subl   $0x1,0x8(%ebp)
  c013df:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  c013e3:	7f e1                	jg     c013c6 <glob+0x56>
  c013e5:	a1 00 55 c0 00       	mov    0xc05500,%eax
  c013ea:	83 ec 08             	sub    $0x8,%esp
  c013ed:	68 00 55 c0 00       	push   $0xc05500
  c013f2:	50                   	push   %eax
  c013f3:	e8 82 fc ff ff       	call   c0107a <texec>
  c013f8:	83 c4 10             	add    $0x10,%esp
  c013fb:	c9                   	leave  
  c013fc:	c3                   	ret    

00c013fd <expand>:
  c013fd:	55                   	push   %ebp
  c013fe:	89 e5                	mov    %esp,%ebp
  c01400:	56                   	push   %esi
  c01401:	53                   	push   %ebx
  c01402:	c7 05 04 5d c0 00 00 	movl   $0x0,0xc05d04
  c01409:	00 00 00 
  c0140c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c0140f:	89 de                	mov    %ebx,%esi
  c01411:	eb 2f                	jmp    c01442 <expand+0x45>
  c01413:	89 d8                	mov    %ebx,%eax
  c01415:	8d 58 01             	lea    0x1(%eax),%ebx
  c01418:	0f b6 00             	movzbl (%eax),%eax
  c0141b:	84 c0                	test   %al,%al
  c0141d:	75 23                	jne    c01442 <expand+0x45>
  c0141f:	8b 1d 00 5d c0 00    	mov    0xc05d00,%ebx
  c01425:	8d 43 04             	lea    0x4(%ebx),%eax
  c01428:	a3 00 5d c0 00       	mov    %eax,0xc05d00
  c0142d:	83 ec 08             	sub    $0x8,%esp
  c01430:	68 71 28 c0 00       	push   $0xc02871
  c01435:	56                   	push   %esi
  c01436:	e8 39 02 00 00       	call   c01674 <cat>
  c0143b:	83 c4 10             	add    $0x10,%esp
  c0143e:	89 03                	mov    %eax,(%ebx)
  c01440:	eb 15                	jmp    c01457 <expand+0x5a>
  c01442:	0f b6 03             	movzbl (%ebx),%eax
  c01445:	3c 2a                	cmp    $0x2a,%al
  c01447:	74 0e                	je     c01457 <expand+0x5a>
  c01449:	0f b6 03             	movzbl (%ebx),%eax
  c0144c:	3c 3f                	cmp    $0x3f,%al
  c0144e:	74 07                	je     c01457 <expand+0x5a>
  c01450:	0f b6 03             	movzbl (%ebx),%eax
  c01453:	3c 5b                	cmp    $0x5b,%al
  c01455:	75 bc                	jne    c01413 <expand+0x16>
  c01457:	8d 65 f8             	lea    -0x8(%ebp),%esp
  c0145a:	5b                   	pop    %ebx
  c0145b:	5e                   	pop    %esi
  c0145c:	5d                   	pop    %ebp
  c0145d:	c3                   	ret    

00c0145e <toolong>:
  c0145e:	55                   	push   %ebp
  c0145f:	89 e5                	mov    %esp,%ebp
  c01461:	83 ec 08             	sub    $0x8,%esp
  c01464:	83 ec 04             	sub    $0x4,%esp
  c01467:	6a 12                	push   $0x12
  c01469:	68 72 28 c0 00       	push   $0xc02872
  c0146e:	6a 02                	push   $0x2
  c01470:	e8 a0 06 00 00       	call   c01b15 <write>
  c01475:	83 c4 10             	add    $0x10,%esp
  c01478:	c9                   	leave  
  c01479:	c3                   	ret    

00c0147a <amatch>:
  c0147a:	55                   	push   %ebp
  c0147b:	89 e5                	mov    %esp,%ebp
  c0147d:	57                   	push   %edi
  c0147e:	56                   	push   %esi
  c0147f:	53                   	push   %ebx
  c01480:	83 ec 2c             	sub    $0x2c,%esp
  c01483:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c0148a:	8b 7d 08             	mov    0x8(%ebp),%edi
  c0148d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  c01490:	89 f8                	mov    %edi,%eax
  c01492:	8d 78 01             	lea    0x1(%eax),%edi
  c01495:	0f b6 00             	movzbl (%eax),%eax
  c01498:	0f be f0             	movsbl %al,%esi
  c0149b:	85 f6                	test   %esi,%esi
  c0149d:	74 0f                	je     c014ae <amatch+0x34>
  c0149f:	81 e6 7f ff ff ff    	and    $0xffffff7f,%esi
  c014a5:	85 f6                	test   %esi,%esi
  c014a7:	75 05                	jne    c014ae <amatch+0x34>
  c014a9:	be 80 00 00 00       	mov    $0x80,%esi
  c014ae:	89 d8                	mov    %ebx,%eax
  c014b0:	8d 58 01             	lea    0x1(%eax),%ebx
  c014b3:	0f b6 00             	movzbl (%eax),%eax
  c014b6:	0f be c0             	movsbl %al,%eax
  c014b9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c014bc:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c014bf:	83 f8 2a             	cmp    $0x2a,%eax
  c014c2:	0f 84 f7 00 00 00    	je     c015bf <amatch+0x145>
  c014c8:	83 f8 2a             	cmp    $0x2a,%eax
  c014cb:	7f 0d                	jg     c014da <amatch+0x60>
  c014cd:	85 c0                	test   %eax,%eax
  c014cf:	0f 84 fc 00 00 00    	je     c015d1 <amatch+0x157>
  c014d5:	e9 bf 00 00 00       	jmp    c01599 <amatch+0x11f>
  c014da:	83 f8 3f             	cmp    $0x3f,%eax
  c014dd:	0f 84 c2 00 00 00    	je     c015a5 <amatch+0x12b>
  c014e3:	83 f8 5b             	cmp    $0x5b,%eax
  c014e6:	0f 85 ad 00 00 00    	jne    c01599 <amatch+0x11f>
  c014ec:	0f b6 03             	movzbl (%ebx),%eax
  c014ef:	3c 21                	cmp    $0x21,%al
  c014f1:	75 0a                	jne    c014fd <amatch+0x83>
  c014f3:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
  c014fa:	83 c3 01             	add    $0x1,%ebx
  c014fd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  c01504:	c7 45 e0 ff ff 00 00 	movl   $0xffff,-0x20(%ebp)
  c0150b:	eb 6d                	jmp    c0157a <amatch+0x100>
  c0150d:	83 7d d4 5d          	cmpl   $0x5d,-0x2c(%ebp)
  c01511:	75 34                	jne    c01547 <amatch+0xcd>
  c01513:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  c01517:	74 06                	je     c0151f <amatch+0xa5>
  c01519:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  c0151d:	74 0c                	je     c0152b <amatch+0xb1>
  c0151f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  c01523:	75 18                	jne    c0153d <amatch+0xc3>
  c01525:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  c01529:	74 12                	je     c0153d <amatch+0xc3>
  c0152b:	83 ec 08             	sub    $0x8,%esp
  c0152e:	53                   	push   %ebx
  c0152f:	57                   	push   %edi
  c01530:	e8 45 ff ff ff       	call   c0147a <amatch>
  c01535:	83 c4 10             	add    $0x10,%esp
  c01538:	e9 9c 00 00 00       	jmp    c015d9 <amatch+0x15f>
  c0153d:	b8 00 00 00 00       	mov    $0x0,%eax
  c01542:	e9 92 00 00 00       	jmp    c015d9 <amatch+0x15f>
  c01547:	83 7d d4 2d          	cmpl   $0x2d,-0x2c(%ebp)
  c0154b:	75 1e                	jne    c0156b <amatch+0xf1>
  c0154d:	39 75 e0             	cmp    %esi,-0x20(%ebp)
  c01550:	7f 28                	jg     c0157a <amatch+0x100>
  c01552:	89 d8                	mov    %ebx,%eax
  c01554:	8d 58 01             	lea    0x1(%eax),%ebx
  c01557:	0f b6 00             	movzbl (%eax),%eax
  c0155a:	0f be c0             	movsbl %al,%eax
  c0155d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c01560:	39 75 d8             	cmp    %esi,-0x28(%ebp)
  c01563:	7c 15                	jl     c0157a <amatch+0x100>
  c01565:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  c01569:	eb 0f                	jmp    c0157a <amatch+0x100>
  c0156b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  c0156e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c01571:	39 75 e0             	cmp    %esi,-0x20(%ebp)
  c01574:	75 04                	jne    c0157a <amatch+0x100>
  c01576:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  c0157a:	89 d8                	mov    %ebx,%eax
  c0157c:	8d 58 01             	lea    0x1(%eax),%ebx
  c0157f:	0f b6 00             	movzbl (%eax),%eax
  c01582:	0f be c0             	movsbl %al,%eax
  c01585:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  c01588:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  c0158c:	0f 85 7b ff ff ff    	jne    c0150d <amatch+0x93>
  c01592:	b8 00 00 00 00       	mov    $0x0,%eax
  c01597:	eb 40                	jmp    c015d9 <amatch+0x15f>
  c01599:	39 75 d8             	cmp    %esi,-0x28(%ebp)
  c0159c:	74 07                	je     c015a5 <amatch+0x12b>
  c0159e:	b8 00 00 00 00       	mov    $0x0,%eax
  c015a3:	eb 34                	jmp    c015d9 <amatch+0x15f>
  c015a5:	85 f6                	test   %esi,%esi
  c015a7:	74 0f                	je     c015b8 <amatch+0x13e>
  c015a9:	83 ec 08             	sub    $0x8,%esp
  c015ac:	53                   	push   %ebx
  c015ad:	57                   	push   %edi
  c015ae:	e8 c7 fe ff ff       	call   c0147a <amatch>
  c015b3:	83 c4 10             	add    $0x10,%esp
  c015b6:	eb 21                	jmp    c015d9 <amatch+0x15f>
  c015b8:	b8 00 00 00 00       	mov    $0x0,%eax
  c015bd:	eb 1a                	jmp    c015d9 <amatch+0x15f>
  c015bf:	83 ef 01             	sub    $0x1,%edi
  c015c2:	83 ec 08             	sub    $0x8,%esp
  c015c5:	53                   	push   %ebx
  c015c6:	57                   	push   %edi
  c015c7:	e8 15 00 00 00       	call   c015e1 <umatch>
  c015cc:	83 c4 10             	add    $0x10,%esp
  c015cf:	eb 08                	jmp    c015d9 <amatch+0x15f>
  c015d1:	85 f6                	test   %esi,%esi
  c015d3:	0f 94 c0             	sete   %al
  c015d6:	0f b6 c0             	movzbl %al,%eax
  c015d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c015dc:	5b                   	pop    %ebx
  c015dd:	5e                   	pop    %esi
  c015de:	5f                   	pop    %edi
  c015df:	5d                   	pop    %ebp
  c015e0:	c3                   	ret    

00c015e1 <umatch>:
  c015e1:	55                   	push   %ebp
  c015e2:	89 e5                	mov    %esp,%ebp
  c015e4:	83 ec 08             	sub    $0x8,%esp
  c015e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  c015ea:	0f b6 00             	movzbl (%eax),%eax
  c015ed:	84 c0                	test   %al,%al
  c015ef:	75 07                	jne    c015f8 <umatch+0x17>
  c015f1:	b8 01 00 00 00       	mov    $0x1,%eax
  c015f6:	eb 34                	jmp    c0162c <umatch+0x4b>
  c015f8:	eb 23                	jmp    c0161d <umatch+0x3c>
  c015fa:	8b 45 08             	mov    0x8(%ebp),%eax
  c015fd:	8d 50 01             	lea    0x1(%eax),%edx
  c01600:	89 55 08             	mov    %edx,0x8(%ebp)
  c01603:	83 ec 08             	sub    $0x8,%esp
  c01606:	ff 75 0c             	pushl  0xc(%ebp)
  c01609:	50                   	push   %eax
  c0160a:	e8 6b fe ff ff       	call   c0147a <amatch>
  c0160f:	83 c4 10             	add    $0x10,%esp
  c01612:	85 c0                	test   %eax,%eax
  c01614:	74 07                	je     c0161d <umatch+0x3c>
  c01616:	b8 01 00 00 00       	mov    $0x1,%eax
  c0161b:	eb 0f                	jmp    c0162c <umatch+0x4b>
  c0161d:	8b 45 08             	mov    0x8(%ebp),%eax
  c01620:	0f b6 00             	movzbl (%eax),%eax
  c01623:	84 c0                	test   %al,%al
  c01625:	75 d3                	jne    c015fa <umatch+0x19>
  c01627:	b8 00 00 00 00       	mov    $0x0,%eax
  c0162c:	c9                   	leave  
  c0162d:	c3                   	ret    

00c0162e <compare>:
  c0162e:	55                   	push   %ebp
  c0162f:	89 e5                	mov    %esp,%ebp
  c01631:	56                   	push   %esi
  c01632:	53                   	push   %ebx
  c01633:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c01636:	8b 75 0c             	mov    0xc(%ebp),%esi
  c01639:	eb 13                	jmp    c0164e <compare+0x20>
  c0163b:	89 f0                	mov    %esi,%eax
  c0163d:	8d 70 01             	lea    0x1(%eax),%esi
  c01640:	0f b6 00             	movzbl (%eax),%eax
  c01643:	84 c0                	test   %al,%al
  c01645:	75 07                	jne    c0164e <compare+0x20>
  c01647:	b8 00 00 00 00       	mov    $0x0,%eax
  c0164c:	eb 22                	jmp    c01670 <compare+0x42>
  c0164e:	89 d8                	mov    %ebx,%eax
  c01650:	8d 58 01             	lea    0x1(%eax),%ebx
  c01653:	0f b6 10             	movzbl (%eax),%edx
  c01656:	0f b6 06             	movzbl (%esi),%eax
  c01659:	38 c2                	cmp    %al,%dl
  c0165b:	74 de                	je     c0163b <compare+0xd>
  c0165d:	83 eb 01             	sub    $0x1,%ebx
  c01660:	0f b6 03             	movzbl (%ebx),%eax
  c01663:	0f be d0             	movsbl %al,%edx
  c01666:	0f b6 06             	movzbl (%esi),%eax
  c01669:	0f be c0             	movsbl %al,%eax
  c0166c:	29 c2                	sub    %eax,%edx
  c0166e:	89 d0                	mov    %edx,%eax
  c01670:	5b                   	pop    %ebx
  c01671:	5e                   	pop    %esi
  c01672:	5d                   	pop    %ebp
  c01673:	c3                   	ret    

00c01674 <cat>:
  c01674:	55                   	push   %ebp
  c01675:	89 e5                	mov    %esp,%ebp
  c01677:	57                   	push   %edi
  c01678:	56                   	push   %esi
  c01679:	53                   	push   %ebx
  c0167a:	83 ec 0c             	sub    $0xc,%esp
  c0167d:	8b 1d c0 54 c0 00    	mov    0xc054c0,%ebx
  c01683:	8b 7d 08             	mov    0x8(%ebp),%edi
  c01686:	eb 2a                	jmp    c016b2 <cat+0x3e>
  c01688:	81 fb c0 54 c0 00    	cmp    $0xc054c0,%ebx
  c0168e:	76 05                	jbe    c01695 <cat+0x21>
  c01690:	e8 c9 fd ff ff       	call   c0145e <toolong>
  c01695:	81 e6 7f ff ff ff    	and    $0xffffff7f,%esi
  c0169b:	85 f6                	test   %esi,%esi
  c0169d:	75 0a                	jne    c016a9 <cat+0x35>
  c0169f:	89 d8                	mov    %ebx,%eax
  c016a1:	8d 58 01             	lea    0x1(%eax),%ebx
  c016a4:	c6 00 2f             	movb   $0x2f,(%eax)
  c016a7:	eb 18                	jmp    c016c1 <cat+0x4d>
  c016a9:	89 d8                	mov    %ebx,%eax
  c016ab:	8d 58 01             	lea    0x1(%eax),%ebx
  c016ae:	89 f2                	mov    %esi,%edx
  c016b0:	88 10                	mov    %dl,(%eax)
  c016b2:	89 f8                	mov    %edi,%eax
  c016b4:	8d 78 01             	lea    0x1(%eax),%edi
  c016b7:	0f b6 00             	movzbl (%eax),%eax
  c016ba:	0f be f0             	movsbl %al,%esi
  c016bd:	85 f6                	test   %esi,%esi
  c016bf:	75 c7                	jne    c01688 <cat+0x14>
  c016c1:	8b 7d 0c             	mov    0xc(%ebp),%edi
  c016c4:	81 fb c0 54 c0 00    	cmp    $0xc054c0,%ebx
  c016ca:	76 05                	jbe    c016d1 <cat+0x5d>
  c016cc:	e8 8d fd ff ff       	call   c0145e <toolong>
  c016d1:	89 d8                	mov    %ebx,%eax
  c016d3:	8d 58 01             	lea    0x1(%eax),%ebx
  c016d6:	89 fa                	mov    %edi,%edx
  c016d8:	8d 7a 01             	lea    0x1(%edx),%edi
  c016db:	0f b6 12             	movzbl (%edx),%edx
  c016de:	0f be f2             	movsbl %dl,%esi
  c016e1:	89 f2                	mov    %esi,%edx
  c016e3:	88 10                	mov    %dl,(%eax)
  c016e5:	85 f6                	test   %esi,%esi
  c016e7:	75 db                	jne    c016c4 <cat+0x50>
  c016e9:	8b 3d c0 54 c0 00    	mov    0xc054c0,%edi
  c016ef:	89 1d c0 54 c0 00    	mov    %ebx,0xc054c0
  c016f5:	89 f8                	mov    %edi,%eax
  c016f7:	83 c4 0c             	add    $0xc,%esp
  c016fa:	5b                   	pop    %ebx
  c016fb:	5e                   	pop    %esi
  c016fc:	5f                   	pop    %edi
  c016fd:	5d                   	pop    %ebp
  c016fe:	c3                   	ret    
  c016ff:	90                   	nop

00c01700 <_run>:
  c01700:	55                   	push   %ebp
  c01701:	89 e5                	mov    %esp,%ebp
  c01703:	57                   	push   %edi
  c01704:	56                   	push   %esi
  c01705:	53                   	push   %ebx
  c01706:	83 ec 10             	sub    $0x10,%esp
  c01709:	8b 55 10             	mov    0x10(%ebp),%edx
  c0170c:	8b 75 18             	mov    0x18(%ebp),%esi
  c0170f:	8b 7d 14             	mov    0x14(%ebp),%edi
  c01712:	b8 00 00 00 00       	mov    $0x0,%eax
  c01717:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c0171a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c0171d:	cd 80                	int    $0x80
  c0171f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01722:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01725:	83 c4 10             	add    $0x10,%esp
  c01728:	5b                   	pop    %ebx
  c01729:	5e                   	pop    %esi
  c0172a:	5f                   	pop    %edi
  c0172b:	5d                   	pop    %ebp
  c0172c:	c3                   	ret    

00c0172d <fork>:
  c0172d:	55                   	push   %ebp
  c0172e:	89 e5                	mov    %esp,%ebp
  c01730:	83 ec 10             	sub    $0x10,%esp
  c01733:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c0173a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c01741:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c01748:	ff 75 fc             	pushl  -0x4(%ebp)
  c0174b:	ff 75 f8             	pushl  -0x8(%ebp)
  c0174e:	ff 75 f4             	pushl  -0xc(%ebp)
  c01751:	6a 04                	push   $0x4
  c01753:	6a 03                	push   $0x3
  c01755:	e8 a6 ff ff ff       	call   c01700 <_run>
  c0175a:	83 c4 14             	add    $0x14,%esp
  c0175d:	c9                   	leave  
  c0175e:	c3                   	ret    
  c0175f:	90                   	nop

00c01760 <_run>:
  c01760:	55                   	push   %ebp
  c01761:	89 e5                	mov    %esp,%ebp
  c01763:	57                   	push   %edi
  c01764:	56                   	push   %esi
  c01765:	53                   	push   %ebx
  c01766:	83 ec 10             	sub    $0x10,%esp
  c01769:	8b 55 10             	mov    0x10(%ebp),%edx
  c0176c:	8b 75 18             	mov    0x18(%ebp),%esi
  c0176f:	8b 7d 14             	mov    0x14(%ebp),%edi
  c01772:	b8 00 00 00 00       	mov    $0x0,%eax
  c01777:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c0177a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c0177d:	cd 80                	int    $0x80
  c0177f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01782:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01785:	83 c4 10             	add    $0x10,%esp
  c01788:	5b                   	pop    %ebx
  c01789:	5e                   	pop    %esi
  c0178a:	5f                   	pop    %edi
  c0178b:	5d                   	pop    %ebp
  c0178c:	c3                   	ret    

00c0178d <dup>:
  c0178d:	55                   	push   %ebp
  c0178e:	89 e5                	mov    %esp,%ebp
  c01790:	8b 45 08             	mov    0x8(%ebp),%eax
  c01793:	5d                   	pop    %ebp
  c01794:	c3                   	ret    

00c01795 <dup2>:
  c01795:	55                   	push   %ebp
  c01796:	89 e5                	mov    %esp,%ebp
  c01798:	83 ec 10             	sub    $0x10,%esp
  c0179b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c017a2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c017a9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c017b0:	8b 45 08             	mov    0x8(%ebp),%eax
  c017b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c017b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  c017b9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c017bc:	ff 75 fc             	pushl  -0x4(%ebp)
  c017bf:	ff 75 f8             	pushl  -0x8(%ebp)
  c017c2:	ff 75 f4             	pushl  -0xc(%ebp)
  c017c5:	6a 09                	push   $0x9
  c017c7:	6a 04                	push   $0x4
  c017c9:	e8 92 ff ff ff       	call   c01760 <_run>
  c017ce:	83 c4 14             	add    $0x14,%esp
  c017d1:	c9                   	leave  
  c017d2:	c3                   	ret    
  c017d3:	90                   	nop

00c017d4 <_run>:
  c017d4:	55                   	push   %ebp
  c017d5:	89 e5                	mov    %esp,%ebp
  c017d7:	57                   	push   %edi
  c017d8:	56                   	push   %esi
  c017d9:	53                   	push   %ebx
  c017da:	83 ec 10             	sub    $0x10,%esp
  c017dd:	8b 55 10             	mov    0x10(%ebp),%edx
  c017e0:	8b 75 18             	mov    0x18(%ebp),%esi
  c017e3:	8b 7d 14             	mov    0x14(%ebp),%edi
  c017e6:	b8 00 00 00 00       	mov    $0x0,%eax
  c017eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c017ee:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c017f1:	cd 80                	int    $0x80
  c017f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c017f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c017f9:	83 c4 10             	add    $0x10,%esp
  c017fc:	5b                   	pop    %ebx
  c017fd:	5e                   	pop    %esi
  c017fe:	5f                   	pop    %edi
  c017ff:	5d                   	pop    %ebp
  c01800:	c3                   	ret    

00c01801 <lseek>:
  c01801:	55                   	push   %ebp
  c01802:	89 e5                	mov    %esp,%ebp
  c01804:	83 ec 10             	sub    $0x10,%esp
  c01807:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c0180e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c01815:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c0181c:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0181f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c01822:	8b 45 10             	mov    0x10(%ebp),%eax
  c01825:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c01828:	ff 75 fc             	pushl  -0x4(%ebp)
  c0182b:	ff 75 f8             	pushl  -0x8(%ebp)
  c0182e:	ff 75 f4             	pushl  -0xc(%ebp)
  c01831:	6a 0c                	push   $0xc
  c01833:	ff 75 08             	pushl  0x8(%ebp)
  c01836:	e8 99 ff ff ff       	call   c017d4 <_run>
  c0183b:	83 c4 14             	add    $0x14,%esp
  c0183e:	c9                   	leave  
  c0183f:	c3                   	ret    

00c01840 <_run>:
  c01840:	55                   	push   %ebp
  c01841:	89 e5                	mov    %esp,%ebp
  c01843:	57                   	push   %edi
  c01844:	56                   	push   %esi
  c01845:	53                   	push   %ebx
  c01846:	83 ec 10             	sub    $0x10,%esp
  c01849:	8b 55 10             	mov    0x10(%ebp),%edx
  c0184c:	8b 75 18             	mov    0x18(%ebp),%esi
  c0184f:	8b 7d 14             	mov    0x14(%ebp),%edi
  c01852:	b8 00 00 00 00       	mov    $0x0,%eax
  c01857:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c0185a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c0185d:	cd 80                	int    $0x80
  c0185f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01862:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01865:	83 c4 10             	add    $0x10,%esp
  c01868:	5b                   	pop    %ebx
  c01869:	5e                   	pop    %esi
  c0186a:	5f                   	pop    %edi
  c0186b:	5d                   	pop    %ebp
  c0186c:	c3                   	ret    

00c0186d <strcpy>:
  c0186d:	55                   	push   %ebp
  c0186e:	89 e5                	mov    %esp,%ebp
  c01870:	57                   	push   %edi
  c01871:	56                   	push   %esi
  c01872:	8b 55 0c             	mov    0xc(%ebp),%edx
  c01875:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c01878:	89 d6                	mov    %edx,%esi
  c0187a:	89 cf                	mov    %ecx,%edi
  c0187c:	fc                   	cld    
  c0187d:	ac                   	lods   %ds:(%esi),%al
  c0187e:	aa                   	stos   %al,%es:(%edi)
  c0187f:	84 c0                	test   %al,%al
  c01881:	75 fa                	jne    c0187d <strcpy+0x10>
  c01883:	8b 45 08             	mov    0x8(%ebp),%eax
  c01886:	5e                   	pop    %esi
  c01887:	5f                   	pop    %edi
  c01888:	5d                   	pop    %ebp
  c01889:	c3                   	ret    

00c0188a <strcat>:
  c0188a:	55                   	push   %ebp
  c0188b:	89 e5                	mov    %esp,%ebp
  c0188d:	57                   	push   %edi
  c0188e:	56                   	push   %esi
  c0188f:	53                   	push   %ebx
  c01890:	8b 55 0c             	mov    0xc(%ebp),%edx
  c01893:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c01896:	b8 00 00 00 00       	mov    $0x0,%eax
  c0189b:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c018a0:	89 d6                	mov    %edx,%esi
  c018a2:	89 df                	mov    %ebx,%edi
  c018a4:	fc                   	cld    
  c018a5:	f2 ae                	repnz scas %es:(%edi),%al
  c018a7:	4f                   	dec    %edi
  c018a8:	ac                   	lods   %ds:(%esi),%al
  c018a9:	aa                   	stos   %al,%es:(%edi)
  c018aa:	84 c0                	test   %al,%al
  c018ac:	75 fa                	jne    c018a8 <strcat+0x1e>
  c018ae:	8b 45 08             	mov    0x8(%ebp),%eax
  c018b1:	5b                   	pop    %ebx
  c018b2:	5e                   	pop    %esi
  c018b3:	5f                   	pop    %edi
  c018b4:	5d                   	pop    %ebp
  c018b5:	c3                   	ret    

00c018b6 <strlen>:
  c018b6:	55                   	push   %ebp
  c018b7:	89 e5                	mov    %esp,%ebp
  c018b9:	57                   	push   %edi
  c018ba:	8b 55 08             	mov    0x8(%ebp),%edx
  c018bd:	b8 00 00 00 00       	mov    $0x0,%eax
  c018c2:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c018c7:	89 d7                	mov    %edx,%edi
  c018c9:	fc                   	cld    
  c018ca:	f2 ae                	repnz scas %es:(%edi),%al
  c018cc:	f7 d1                	not    %ecx
  c018ce:	49                   	dec    %ecx
  c018cf:	89 c8                	mov    %ecx,%eax
  c018d1:	5f                   	pop    %edi
  c018d2:	5d                   	pop    %ebp
  c018d3:	c3                   	ret    

00c018d4 <exec>:
  c018d4:	55                   	push   %ebp
  c018d5:	89 e5                	mov    %esp,%ebp
  c018d7:	57                   	push   %edi
  c018d8:	56                   	push   %esi
  c018d9:	53                   	push   %ebx
  c018da:	81 ec bc 00 00 00    	sub    $0xbc,%esp
  c018e0:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  c018e7:	c7 85 3b ff ff ff 2f 	movl   $0x6e69622f,-0xc5(%ebp)
  c018ee:	62 69 6e 
  c018f1:	c7 85 3f ff ff ff 2f 	movl   $0x2f,-0xc1(%ebp)
  c018f8:	00 00 00 
  c018fb:	8d 85 43 ff ff ff    	lea    -0xbd(%ebp),%eax
  c01901:	ba 75 00 00 00       	mov    $0x75,%edx
  c01906:	be 00 00 00 00       	mov    $0x0,%esi
  c0190b:	89 30                	mov    %esi,(%eax)
  c0190d:	89 74 10 fc          	mov    %esi,-0x4(%eax,%edx,1)
  c01911:	8d 58 04             	lea    0x4(%eax),%ebx
  c01914:	83 e3 fc             	and    $0xfffffffc,%ebx
  c01917:	29 d8                	sub    %ebx,%eax
  c01919:	01 c2                	add    %eax,%edx
  c0191b:	83 e2 fc             	and    $0xfffffffc,%edx
  c0191e:	c1 ea 02             	shr    $0x2,%edx
  c01921:	89 df                	mov    %ebx,%edi
  c01923:	89 d1                	mov    %edx,%ecx
  c01925:	89 f0                	mov    %esi,%eax
  c01927:	f3 ab                	rep stos %eax,%es:(%edi)
  c01929:	8b 45 08             	mov    0x8(%ebp),%eax
  c0192c:	0f b6 00             	movzbl (%eax),%eax
  c0192f:	3c 2e                	cmp    $0x2e,%al
  c01931:	74 0a                	je     c0193d <exec+0x69>
  c01933:	8b 45 08             	mov    0x8(%ebp),%eax
  c01936:	0f b6 00             	movzbl (%eax),%eax
  c01939:	3c 2f                	cmp    $0x2f,%al
  c0193b:	75 14                	jne    c01951 <exec+0x7d>
  c0193d:	ff 75 08             	pushl  0x8(%ebp)
  c01940:	8d 85 3b ff ff ff    	lea    -0xc5(%ebp),%eax
  c01946:	50                   	push   %eax
  c01947:	e8 21 ff ff ff       	call   c0186d <strcpy>
  c0194c:	83 c4 08             	add    $0x8,%esp
  c0194f:	eb 12                	jmp    c01963 <exec+0x8f>
  c01951:	ff 75 08             	pushl  0x8(%ebp)
  c01954:	8d 85 3b ff ff ff    	lea    -0xc5(%ebp),%eax
  c0195a:	50                   	push   %eax
  c0195b:	e8 2a ff ff ff       	call   c0188a <strcat>
  c01960:	83 c4 08             	add    $0x8,%esp
  c01963:	83 ec 08             	sub    $0x8,%esp
  c01966:	6a 00                	push   $0x0
  c01968:	8d 85 3b ff ff ff    	lea    -0xc5(%ebp),%eax
  c0196e:	50                   	push   %eax
  c0196f:	e8 83 02 00 00       	call   c01bf7 <open>
  c01974:	83 c4 10             	add    $0x10,%esp
  c01977:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c0197a:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
  c0197e:	75 05                	jne    c01985 <exec+0xb1>
  c01980:	e9 eb 00 00 00       	jmp    c01a70 <exec+0x19c>
  c01985:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c01988:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  c0198b:	b8 1f 00 00 00       	mov    $0x1f,%eax
  c01990:	83 7d 0c 1f          	cmpl   $0x1f,0xc(%ebp)
  c01994:	0f 4e 45 0c          	cmovle 0xc(%ebp),%eax
  c01998:	89 45 d0             	mov    %eax,-0x30(%ebp)
  c0199b:	b8 04 00 00 00       	mov    $0x4,%eax
  c019a0:	bb 01 00 00 00       	mov    $0x1,%ebx
  c019a5:	b9 00 00 00 00       	mov    $0x0,%ecx
  c019aa:	ba 00 00 00 00       	mov    $0x0,%edx
  c019af:	be 00 00 00 00       	mov    $0x0,%esi
  c019b4:	bf 00 00 00 00       	mov    $0x0,%edi
  c019b9:	cd 80                	int    $0x80
  c019bb:	89 45 cc             	mov    %eax,-0x34(%ebp)
  c019be:	8b 45 cc             	mov    -0x34(%ebp),%eax
  c019c1:	89 45 c8             	mov    %eax,-0x38(%ebp)
  c019c4:	8b 45 c8             	mov    -0x38(%ebp),%eax
  c019c7:	83 e8 80             	sub    $0xffffff80,%eax
  c019ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c019cd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c019d4:	eb 44                	jmp    c01a1a <exec+0x146>
  c019d6:	8b 45 c8             	mov    -0x38(%ebp),%eax
  c019d9:	8b 55 dc             	mov    -0x24(%ebp),%edx
  c019dc:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  c019df:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  c019e2:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c019e5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c019ec:	8b 45 10             	mov    0x10(%ebp),%eax
  c019ef:	01 d0                	add    %edx,%eax
  c019f1:	8b 00                	mov    (%eax),%eax
  c019f3:	83 ec 08             	sub    $0x8,%esp
  c019f6:	50                   	push   %eax
  c019f7:	ff 75 e0             	pushl  -0x20(%ebp)
  c019fa:	e8 6e fe ff ff       	call   c0186d <strcpy>
  c019ff:	83 c4 10             	add    $0x10,%esp
  c01a02:	83 ec 0c             	sub    $0xc,%esp
  c01a05:	ff 75 e0             	pushl  -0x20(%ebp)
  c01a08:	e8 a9 fe ff ff       	call   c018b6 <strlen>
  c01a0d:	83 c4 10             	add    $0x10,%esp
  c01a10:	83 c0 01             	add    $0x1,%eax
  c01a13:	01 45 e0             	add    %eax,-0x20(%ebp)
  c01a16:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
  c01a1a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c01a1d:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  c01a20:	72 b4                	jb     c019d6 <exec+0x102>
  c01a22:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  c01a25:	89 45 b8             	mov    %eax,-0x48(%ebp)
  c01a28:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01a2b:	89 45 bc             	mov    %eax,-0x44(%ebp)
  c01a2e:	8b 45 c8             	mov    -0x38(%ebp),%eax
  c01a31:	89 45 c0             	mov    %eax,-0x40(%ebp)
  c01a34:	83 ec 0c             	sub    $0xc,%esp
  c01a37:	ff 75 c0             	pushl  -0x40(%ebp)
  c01a3a:	ff 75 bc             	pushl  -0x44(%ebp)
  c01a3d:	ff 75 b8             	pushl  -0x48(%ebp)
  c01a40:	6a 0b                	push   $0xb
  c01a42:	6a 03                	push   $0x3
  c01a44:	e8 f7 fd ff ff       	call   c01840 <_run>
  c01a49:	83 c4 20             	add    $0x20,%esp
  c01a4c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c01a4f:	b8 04 00 00 00       	mov    $0x4,%eax
  c01a54:	bb 00 00 00 00       	mov    $0x0,%ebx
  c01a59:	8b 4d c8             	mov    -0x38(%ebp),%ecx
  c01a5c:	ba 00 00 00 00       	mov    $0x0,%edx
  c01a61:	be 00 00 00 00       	mov    $0x0,%esi
  c01a66:	bf 00 00 00 00       	mov    $0x0,%edi
  c01a6b:	cd 80                	int    $0x80
  c01a6d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  c01a70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c01a73:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c01a76:	5b                   	pop    %ebx
  c01a77:	5e                   	pop    %esi
  c01a78:	5f                   	pop    %edi
  c01a79:	5d                   	pop    %ebp
  c01a7a:	c3                   	ret    

00c01a7b <execvp>:
  c01a7b:	55                   	push   %ebp
  c01a7c:	89 e5                	mov    %esp,%ebp
  c01a7e:	83 ec 18             	sub    $0x18,%esp
  c01a81:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  c01a88:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c01a8f:	eb 32                	jmp    c01ac3 <execvp+0x48>
  c01a91:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01a94:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c01a9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01a9e:	01 d0                	add    %edx,%eax
  c01aa0:	8b 00                	mov    (%eax),%eax
  c01aa2:	85 c0                	test   %eax,%eax
  c01aa4:	75 19                	jne    c01abf <execvp+0x44>
  c01aa6:	83 ec 04             	sub    $0x4,%esp
  c01aa9:	ff 75 0c             	pushl  0xc(%ebp)
  c01aac:	ff 75 f0             	pushl  -0x10(%ebp)
  c01aaf:	ff 75 08             	pushl  0x8(%ebp)
  c01ab2:	e8 1d fe ff ff       	call   c018d4 <exec>
  c01ab7:	83 c4 10             	add    $0x10,%esp
  c01aba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c01abd:	eb 0a                	jmp    c01ac9 <execvp+0x4e>
  c01abf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  c01ac3:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  c01ac7:	7e c8                	jle    c01a91 <execvp+0x16>
  c01ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01acc:	c9                   	leave  
  c01acd:	c3                   	ret    
  c01ace:	66 90                	xchg   %ax,%ax

00c01ad0 <_start>:
  c01ad0:	23 25 f0 ff ff ff    	and    0xfffffff0,%esp
  c01ad6:	50                   	push   %eax
  c01ad7:	51                   	push   %ecx
  c01ad8:	e8 50 e5 ff ff       	call   c0002d <main>
  c01add:	83 c4 08             	add    $0x8,%esp
  c01ae0:	50                   	push   %eax
  c01ae1:	e8 03 03 00 00       	call   c01de9 <exit>
  c01ae6:	66 90                	xchg   %ax,%ax

00c01ae8 <_run>:
  c01ae8:	55                   	push   %ebp
  c01ae9:	89 e5                	mov    %esp,%ebp
  c01aeb:	57                   	push   %edi
  c01aec:	56                   	push   %esi
  c01aed:	53                   	push   %ebx
  c01aee:	83 ec 10             	sub    $0x10,%esp
  c01af1:	8b 55 10             	mov    0x10(%ebp),%edx
  c01af4:	8b 75 18             	mov    0x18(%ebp),%esi
  c01af7:	8b 7d 14             	mov    0x14(%ebp),%edi
  c01afa:	b8 00 00 00 00       	mov    $0x0,%eax
  c01aff:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c01b02:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c01b05:	cd 80                	int    $0x80
  c01b07:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01b0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01b0d:	83 c4 10             	add    $0x10,%esp
  c01b10:	5b                   	pop    %ebx
  c01b11:	5e                   	pop    %esi
  c01b12:	5f                   	pop    %edi
  c01b13:	5d                   	pop    %ebp
  c01b14:	c3                   	ret    

00c01b15 <write>:
  c01b15:	55                   	push   %ebp
  c01b16:	89 e5                	mov    %esp,%ebp
  c01b18:	57                   	push   %edi
  c01b19:	56                   	push   %esi
  c01b1a:	53                   	push   %ebx
  c01b1b:	83 ec 20             	sub    $0x20,%esp
  c01b1e:	b8 04 00 00 00       	mov    $0x4,%eax
  c01b23:	bb 01 00 00 00       	mov    $0x1,%ebx
  c01b28:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c01b2b:	8b 55 10             	mov    0x10(%ebp),%edx
  c01b2e:	be 00 00 00 00       	mov    $0x0,%esi
  c01b33:	bf 00 00 00 00       	mov    $0x0,%edi
  c01b38:	cd 80                	int    $0x80
  c01b3a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01b3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01b40:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c01b43:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  c01b4a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c01b51:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c01b58:	8b 45 10             	mov    0x10(%ebp),%eax
  c01b5b:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c01b5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c01b61:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c01b64:	ff 75 e0             	pushl  -0x20(%ebp)
  c01b67:	ff 75 dc             	pushl  -0x24(%ebp)
  c01b6a:	ff 75 d8             	pushl  -0x28(%ebp)
  c01b6d:	6a 01                	push   $0x1
  c01b6f:	ff 75 08             	pushl  0x8(%ebp)
  c01b72:	e8 71 ff ff ff       	call   c01ae8 <_run>
  c01b77:	83 c4 14             	add    $0x14,%esp
  c01b7a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c01b7d:	b8 04 00 00 00       	mov    $0x4,%eax
  c01b82:	bb 00 00 00 00       	mov    $0x0,%ebx
  c01b87:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  c01b8a:	ba 00 00 00 00       	mov    $0x0,%edx
  c01b8f:	be 00 00 00 00       	mov    $0x0,%esi
  c01b94:	bf 00 00 00 00       	mov    $0x0,%edi
  c01b99:	cd 80                	int    $0x80
  c01b9b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c01b9e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c01ba1:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c01ba4:	5b                   	pop    %ebx
  c01ba5:	5e                   	pop    %esi
  c01ba6:	5f                   	pop    %edi
  c01ba7:	5d                   	pop    %ebp
  c01ba8:	c3                   	ret    
  c01ba9:	66 90                	xchg   %ax,%ax
  c01bab:	90                   	nop

00c01bac <_run>:
  c01bac:	55                   	push   %ebp
  c01bad:	89 e5                	mov    %esp,%ebp
  c01baf:	57                   	push   %edi
  c01bb0:	56                   	push   %esi
  c01bb1:	53                   	push   %ebx
  c01bb2:	83 ec 10             	sub    $0x10,%esp
  c01bb5:	8b 55 10             	mov    0x10(%ebp),%edx
  c01bb8:	8b 75 18             	mov    0x18(%ebp),%esi
  c01bbb:	8b 7d 14             	mov    0x14(%ebp),%edi
  c01bbe:	b8 00 00 00 00       	mov    $0x0,%eax
  c01bc3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c01bc6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c01bc9:	cd 80                	int    $0x80
  c01bcb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01bce:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01bd1:	83 c4 10             	add    $0x10,%esp
  c01bd4:	5b                   	pop    %ebx
  c01bd5:	5e                   	pop    %esi
  c01bd6:	5f                   	pop    %edi
  c01bd7:	5d                   	pop    %ebp
  c01bd8:	c3                   	ret    

00c01bd9 <strlen>:
  c01bd9:	55                   	push   %ebp
  c01bda:	89 e5                	mov    %esp,%ebp
  c01bdc:	57                   	push   %edi
  c01bdd:	8b 55 08             	mov    0x8(%ebp),%edx
  c01be0:	b8 00 00 00 00       	mov    $0x0,%eax
  c01be5:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c01bea:	89 d7                	mov    %edx,%edi
  c01bec:	fc                   	cld    
  c01bed:	f2 ae                	repnz scas %es:(%edi),%al
  c01bef:	f7 d1                	not    %ecx
  c01bf1:	49                   	dec    %ecx
  c01bf2:	89 c8                	mov    %ecx,%eax
  c01bf4:	5f                   	pop    %edi
  c01bf5:	5d                   	pop    %ebp
  c01bf6:	c3                   	ret    

00c01bf7 <open>:
  c01bf7:	55                   	push   %ebp
  c01bf8:	89 e5                	mov    %esp,%ebp
  c01bfa:	57                   	push   %edi
  c01bfb:	56                   	push   %esi
  c01bfc:	53                   	push   %ebx
  c01bfd:	83 ec 20             	sub    $0x20,%esp
  c01c00:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c01c07:	ff 75 08             	pushl  0x8(%ebp)
  c01c0a:	e8 ca ff ff ff       	call   c01bd9 <strlen>
  c01c0f:	83 c4 04             	add    $0x4,%esp
  c01c12:	8d 50 01             	lea    0x1(%eax),%edx
  c01c15:	b8 04 00 00 00       	mov    $0x4,%eax
  c01c1a:	bb 01 00 00 00       	mov    $0x1,%ebx
  c01c1f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c01c22:	be 00 00 00 00       	mov    $0x0,%esi
  c01c27:	bf 00 00 00 00       	mov    $0x0,%edi
  c01c2c:	cd 80                	int    $0x80
  c01c2e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c01c31:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c01c34:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c01c37:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  c01c3e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c01c45:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c01c4c:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01c4f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c01c52:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c01c55:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c01c58:	ff 75 e0             	pushl  -0x20(%ebp)
  c01c5b:	ff 75 dc             	pushl  -0x24(%ebp)
  c01c5e:	ff 75 d8             	pushl  -0x28(%ebp)
  c01c61:	6a 02                	push   $0x2
  c01c63:	6a 08                	push   $0x8
  c01c65:	e8 42 ff ff ff       	call   c01bac <_run>
  c01c6a:	83 c4 14             	add    $0x14,%esp
  c01c6d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01c70:	b8 04 00 00 00       	mov    $0x4,%eax
  c01c75:	bb 00 00 00 00       	mov    $0x0,%ebx
  c01c7a:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  c01c7d:	ba 00 00 00 00       	mov    $0x0,%edx
  c01c82:	be 00 00 00 00       	mov    $0x0,%esi
  c01c87:	bf 00 00 00 00       	mov    $0x0,%edi
  c01c8c:	cd 80                	int    $0x80
  c01c8e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c01c91:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01c94:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c01c97:	5b                   	pop    %ebx
  c01c98:	5e                   	pop    %esi
  c01c99:	5f                   	pop    %edi
  c01c9a:	5d                   	pop    %ebp
  c01c9b:	c3                   	ret    

00c01c9c <close>:
  c01c9c:	55                   	push   %ebp
  c01c9d:	89 e5                	mov    %esp,%ebp
  c01c9f:	83 ec 10             	sub    $0x10,%esp
  c01ca2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c01ca9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c01cb0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c01cb7:	ff 75 fc             	pushl  -0x4(%ebp)
  c01cba:	ff 75 f8             	pushl  -0x8(%ebp)
  c01cbd:	ff 75 f4             	pushl  -0xc(%ebp)
  c01cc0:	6a 03                	push   $0x3
  c01cc2:	ff 75 08             	pushl  0x8(%ebp)
  c01cc5:	e8 e2 fe ff ff       	call   c01bac <_run>
  c01cca:	83 c4 14             	add    $0x14,%esp
  c01ccd:	c9                   	leave  
  c01cce:	c3                   	ret    
  c01ccf:	90                   	nop

00c01cd0 <_run>:
  c01cd0:	55                   	push   %ebp
  c01cd1:	89 e5                	mov    %esp,%ebp
  c01cd3:	57                   	push   %edi
  c01cd4:	56                   	push   %esi
  c01cd5:	53                   	push   %ebx
  c01cd6:	83 ec 10             	sub    $0x10,%esp
  c01cd9:	8b 55 10             	mov    0x10(%ebp),%edx
  c01cdc:	8b 75 18             	mov    0x18(%ebp),%esi
  c01cdf:	8b 7d 14             	mov    0x14(%ebp),%edi
  c01ce2:	b8 00 00 00 00       	mov    $0x0,%eax
  c01ce7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c01cea:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c01ced:	cd 80                	int    $0x80
  c01cef:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01cf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01cf5:	83 c4 10             	add    $0x10,%esp
  c01cf8:	5b                   	pop    %ebx
  c01cf9:	5e                   	pop    %esi
  c01cfa:	5f                   	pop    %edi
  c01cfb:	5d                   	pop    %ebp
  c01cfc:	c3                   	ret    

00c01cfd <memcpy>:
  c01cfd:	55                   	push   %ebp
  c01cfe:	89 e5                	mov    %esp,%ebp
  c01d00:	57                   	push   %edi
  c01d01:	56                   	push   %esi
  c01d02:	53                   	push   %ebx
  c01d03:	8b 45 10             	mov    0x10(%ebp),%eax
  c01d06:	8b 55 0c             	mov    0xc(%ebp),%edx
  c01d09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c01d0c:	89 c1                	mov    %eax,%ecx
  c01d0e:	89 d6                	mov    %edx,%esi
  c01d10:	89 df                	mov    %ebx,%edi
  c01d12:	fc                   	cld    
  c01d13:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  c01d15:	8b 45 08             	mov    0x8(%ebp),%eax
  c01d18:	5b                   	pop    %ebx
  c01d19:	5e                   	pop    %esi
  c01d1a:	5f                   	pop    %edi
  c01d1b:	5d                   	pop    %ebp
  c01d1c:	c3                   	ret    

00c01d1d <read>:
  c01d1d:	55                   	push   %ebp
  c01d1e:	89 e5                	mov    %esp,%ebp
  c01d20:	57                   	push   %edi
  c01d21:	56                   	push   %esi
  c01d22:	53                   	push   %ebx
  c01d23:	83 ec 20             	sub    $0x20,%esp
  c01d26:	b8 04 00 00 00       	mov    $0x4,%eax
  c01d2b:	bb 01 00 00 00       	mov    $0x1,%ebx
  c01d30:	b9 00 00 00 00       	mov    $0x0,%ecx
  c01d35:	8b 55 10             	mov    0x10(%ebp),%edx
  c01d38:	be 00 00 00 00       	mov    $0x0,%esi
  c01d3d:	bf 00 00 00 00       	mov    $0x0,%edi
  c01d42:	cd 80                	int    $0x80
  c01d44:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01d47:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01d4a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c01d4d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  c01d54:	8b 45 10             	mov    0x10(%ebp),%eax
  c01d57:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c01d5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c01d5d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c01d60:	ff 75 e0             	pushl  -0x20(%ebp)
  c01d63:	ff 75 dc             	pushl  -0x24(%ebp)
  c01d66:	ff 75 d8             	pushl  -0x28(%ebp)
  c01d69:	6a 00                	push   $0x0
  c01d6b:	ff 75 08             	pushl  0x8(%ebp)
  c01d6e:	e8 5d ff ff ff       	call   c01cd0 <_run>
  c01d73:	83 c4 14             	add    $0x14,%esp
  c01d76:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c01d79:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%ebp)
  c01d7d:	74 11                	je     c01d90 <read+0x73>
  c01d7f:	ff 75 e8             	pushl  -0x18(%ebp)
  c01d82:	ff 75 ec             	pushl  -0x14(%ebp)
  c01d85:	ff 75 0c             	pushl  0xc(%ebp)
  c01d88:	e8 70 ff ff ff       	call   c01cfd <memcpy>
  c01d8d:	83 c4 0c             	add    $0xc,%esp
  c01d90:	b8 04 00 00 00       	mov    $0x4,%eax
  c01d95:	bb 00 00 00 00       	mov    $0x0,%ebx
  c01d9a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  c01d9d:	ba 00 00 00 00       	mov    $0x0,%edx
  c01da2:	be 00 00 00 00       	mov    $0x0,%esi
  c01da7:	bf 00 00 00 00       	mov    $0x0,%edi
  c01dac:	cd 80                	int    $0x80
  c01dae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c01db1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c01db4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c01db7:	5b                   	pop    %ebx
  c01db8:	5e                   	pop    %esi
  c01db9:	5f                   	pop    %edi
  c01dba:	5d                   	pop    %ebp
  c01dbb:	c3                   	ret    

00c01dbc <_run>:
  c01dbc:	55                   	push   %ebp
  c01dbd:	89 e5                	mov    %esp,%ebp
  c01dbf:	57                   	push   %edi
  c01dc0:	56                   	push   %esi
  c01dc1:	53                   	push   %ebx
  c01dc2:	83 ec 10             	sub    $0x10,%esp
  c01dc5:	8b 55 10             	mov    0x10(%ebp),%edx
  c01dc8:	8b 75 18             	mov    0x18(%ebp),%esi
  c01dcb:	8b 7d 14             	mov    0x14(%ebp),%edi
  c01dce:	b8 00 00 00 00       	mov    $0x0,%eax
  c01dd3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c01dd6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c01dd9:	cd 80                	int    $0x80
  c01ddb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01dde:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01de1:	83 c4 10             	add    $0x10,%esp
  c01de4:	5b                   	pop    %ebx
  c01de5:	5e                   	pop    %esi
  c01de6:	5f                   	pop    %edi
  c01de7:	5d                   	pop    %ebp
  c01de8:	c3                   	ret    

00c01de9 <exit>:
  c01de9:	55                   	push   %ebp
  c01dea:	89 e5                	mov    %esp,%ebp
  c01dec:	83 ec 10             	sub    $0x10,%esp
  c01def:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c01df6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c01dfd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c01e04:	8b 45 08             	mov    0x8(%ebp),%eax
  c01e07:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c01e0a:	ff 75 fc             	pushl  -0x4(%ebp)
  c01e0d:	ff 75 f8             	pushl  -0x8(%ebp)
  c01e10:	ff 75 f4             	pushl  -0xc(%ebp)
  c01e13:	6a 03                	push   $0x3
  c01e15:	6a 03                	push   $0x3
  c01e17:	e8 a0 ff ff ff       	call   c01dbc <_run>
  c01e1c:	83 c4 14             	add    $0x14,%esp
  c01e1f:	c9                   	leave  
  c01e20:	c3                   	ret    
  c01e21:	66 90                	xchg   %ax,%ax
  c01e23:	90                   	nop

00c01e24 <printf>:
  c01e24:	55                   	push   %ebp
  c01e25:	89 e5                	mov    %esp,%ebp
  c01e27:	83 ec 18             	sub    $0x18,%esp
  c01e2a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c01e31:	8d 45 0c             	lea    0xc(%ebp),%eax
  c01e34:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01e37:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01e3a:	83 ec 04             	sub    $0x4,%esp
  c01e3d:	50                   	push   %eax
  c01e3e:	ff 75 08             	pushl  0x8(%ebp)
  c01e41:	68 40 5d c0 00       	push   $0xc05d40
  c01e46:	e8 28 04 00 00       	call   c02273 <vsprintf>
  c01e4b:	83 c4 10             	add    $0x10,%esp
  c01e4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c01e51:	83 ec 04             	sub    $0x4,%esp
  c01e54:	ff 75 f4             	pushl  -0xc(%ebp)
  c01e57:	68 40 5d c0 00       	push   $0xc05d40
  c01e5c:	6a 01                	push   $0x1
  c01e5e:	e8 b2 fc ff ff       	call   c01b15 <write>
  c01e63:	83 c4 10             	add    $0x10,%esp
  c01e66:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c01e69:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01e6c:	c9                   	leave  
  c01e6d:	c3                   	ret    
  c01e6e:	66 90                	xchg   %ax,%ax

00c01e70 <strlen>:
  c01e70:	55                   	push   %ebp
  c01e71:	89 e5                	mov    %esp,%ebp
  c01e73:	57                   	push   %edi
  c01e74:	8b 55 08             	mov    0x8(%ebp),%edx
  c01e77:	b8 00 00 00 00       	mov    $0x0,%eax
  c01e7c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c01e81:	89 d7                	mov    %edx,%edi
  c01e83:	fc                   	cld    
  c01e84:	f2 ae                	repnz scas %es:(%edi),%al
  c01e86:	f7 d1                	not    %ecx
  c01e88:	49                   	dec    %ecx
  c01e89:	89 c8                	mov    %ecx,%eax
  c01e8b:	5f                   	pop    %edi
  c01e8c:	5d                   	pop    %ebp
  c01e8d:	c3                   	ret    

00c01e8e <memcpy>:
  c01e8e:	55                   	push   %ebp
  c01e8f:	89 e5                	mov    %esp,%ebp
  c01e91:	57                   	push   %edi
  c01e92:	56                   	push   %esi
  c01e93:	53                   	push   %ebx
  c01e94:	8b 45 10             	mov    0x10(%ebp),%eax
  c01e97:	8b 55 0c             	mov    0xc(%ebp),%edx
  c01e9a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c01e9d:	89 c1                	mov    %eax,%ecx
  c01e9f:	89 d6                	mov    %edx,%esi
  c01ea1:	89 df                	mov    %ebx,%edi
  c01ea3:	fc                   	cld    
  c01ea4:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  c01ea6:	8b 45 08             	mov    0x8(%ebp),%eax
  c01ea9:	5b                   	pop    %ebx
  c01eaa:	5e                   	pop    %esi
  c01eab:	5f                   	pop    %edi
  c01eac:	5d                   	pop    %ebp
  c01ead:	c3                   	ret    

00c01eae <_atoi>:
  c01eae:	55                   	push   %ebp
  c01eaf:	89 e5                	mov    %esp,%ebp
  c01eb1:	53                   	push   %ebx
  c01eb2:	83 ec 10             	sub    $0x10,%esp
  c01eb5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c01ebc:	eb 29                	jmp    c01ee7 <_atoi+0x39>
  c01ebe:	8b 55 f8             	mov    -0x8(%ebp),%edx
  c01ec1:	89 d0                	mov    %edx,%eax
  c01ec3:	c1 e0 02             	shl    $0x2,%eax
  c01ec6:	01 d0                	add    %edx,%eax
  c01ec8:	01 c0                	add    %eax,%eax
  c01eca:	89 c3                	mov    %eax,%ebx
  c01ecc:	8b 45 08             	mov    0x8(%ebp),%eax
  c01ecf:	8b 00                	mov    (%eax),%eax
  c01ed1:	8d 48 01             	lea    0x1(%eax),%ecx
  c01ed4:	8b 55 08             	mov    0x8(%ebp),%edx
  c01ed7:	89 0a                	mov    %ecx,(%edx)
  c01ed9:	0f b6 00             	movzbl (%eax),%eax
  c01edc:	0f be c0             	movsbl %al,%eax
  c01edf:	01 d8                	add    %ebx,%eax
  c01ee1:	83 e8 30             	sub    $0x30,%eax
  c01ee4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c01ee7:	8b 45 08             	mov    0x8(%ebp),%eax
  c01eea:	8b 00                	mov    (%eax),%eax
  c01eec:	0f b6 00             	movzbl (%eax),%eax
  c01eef:	3c 2f                	cmp    $0x2f,%al
  c01ef1:	7e 0c                	jle    c01eff <_atoi+0x51>
  c01ef3:	8b 45 08             	mov    0x8(%ebp),%eax
  c01ef6:	8b 00                	mov    (%eax),%eax
  c01ef8:	0f b6 00             	movzbl (%eax),%eax
  c01efb:	3c 39                	cmp    $0x39,%al
  c01efd:	7e bf                	jle    c01ebe <_atoi+0x10>
  c01eff:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c01f02:	83 c4 10             	add    $0x10,%esp
  c01f05:	5b                   	pop    %ebx
  c01f06:	5d                   	pop    %ebp
  c01f07:	c3                   	ret    

00c01f08 <_octal>:
  c01f08:	55                   	push   %ebp
  c01f09:	89 e5                	mov    %esp,%ebp
  c01f0b:	83 ec 10             	sub    $0x10,%esp
  c01f0e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c01f15:	8b 45 08             	mov    0x8(%ebp),%eax
  c01f18:	8d 50 04             	lea    0x4(%eax),%edx
  c01f1b:	89 55 08             	mov    %edx,0x8(%ebp)
  c01f1e:	8b 55 0c             	mov    0xc(%ebp),%edx
  c01f21:	83 e2 07             	and    $0x7,%edx
  c01f24:	89 10                	mov    %edx,(%eax)
  c01f26:	c1 6d 0c 03          	shrl   $0x3,0xc(%ebp)
  c01f2a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  c01f2e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c01f32:	75 e1                	jne    c01f15 <_octal+0xd>
  c01f34:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c01f37:	c9                   	leave  
  c01f38:	c3                   	ret    

00c01f39 <_decimal>:
  c01f39:	55                   	push   %ebp
  c01f3a:	89 e5                	mov    %esp,%ebp
  c01f3c:	53                   	push   %ebx
  c01f3d:	83 ec 10             	sub    $0x10,%esp
  c01f40:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c01f47:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c01f4a:	8d 41 04             	lea    0x4(%ecx),%eax
  c01f4d:	89 45 08             	mov    %eax,0x8(%ebp)
  c01f50:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  c01f53:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  c01f58:	89 d8                	mov    %ebx,%eax
  c01f5a:	f7 e2                	mul    %edx
  c01f5c:	c1 ea 03             	shr    $0x3,%edx
  c01f5f:	89 d0                	mov    %edx,%eax
  c01f61:	c1 e0 02             	shl    $0x2,%eax
  c01f64:	01 d0                	add    %edx,%eax
  c01f66:	01 c0                	add    %eax,%eax
  c01f68:	29 c3                	sub    %eax,%ebx
  c01f6a:	89 da                	mov    %ebx,%edx
  c01f6c:	89 d0                	mov    %edx,%eax
  c01f6e:	89 01                	mov    %eax,(%ecx)
  c01f70:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01f73:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  c01f78:	f7 e2                	mul    %edx
  c01f7a:	89 d0                	mov    %edx,%eax
  c01f7c:	c1 e8 03             	shr    $0x3,%eax
  c01f7f:	89 45 0c             	mov    %eax,0xc(%ebp)
  c01f82:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  c01f86:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c01f8a:	75 bb                	jne    c01f47 <_decimal+0xe>
  c01f8c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c01f8f:	83 c4 10             	add    $0x10,%esp
  c01f92:	5b                   	pop    %ebx
  c01f93:	5d                   	pop    %ebp
  c01f94:	c3                   	ret    

00c01f95 <_hex>:
  c01f95:	55                   	push   %ebp
  c01f96:	89 e5                	mov    %esp,%ebp
  c01f98:	83 ec 10             	sub    $0x10,%esp
  c01f9b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c01fa2:	8b 45 08             	mov    0x8(%ebp),%eax
  c01fa5:	8d 50 04             	lea    0x4(%eax),%edx
  c01fa8:	89 55 08             	mov    %edx,0x8(%ebp)
  c01fab:	8b 55 0c             	mov    0xc(%ebp),%edx
  c01fae:	83 e2 0f             	and    $0xf,%edx
  c01fb1:	89 10                	mov    %edx,(%eax)
  c01fb3:	c1 6d 0c 04          	shrl   $0x4,0xc(%ebp)
  c01fb7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  c01fbb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c01fbf:	75 e1                	jne    c01fa2 <_hex+0xd>
  c01fc1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c01fc4:	c9                   	leave  
  c01fc5:	c3                   	ret    

00c01fc6 <_toNumber>:
  c01fc6:	55                   	push   %ebp
  c01fc7:	89 e5                	mov    %esp,%ebp
  c01fc9:	81 ec 18 01 00 00    	sub    $0x118,%esp
  c01fcf:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01fd2:	89 85 e8 fe ff ff    	mov    %eax,-0x118(%ebp)
  c01fd8:	8b 45 10             	mov    0x10(%ebp),%eax
  c01fdb:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
  c01fe1:	c6 45 ff 2b          	movb   $0x2b,-0x1(%ebp)
  c01fe5:	c7 45 f8 88 28 c0 00 	movl   $0xc02888,-0x8(%ebp)
  c01fec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c01ff3:	8b 45 20             	mov    0x20(%ebp),%eax
  c01ff6:	83 e0 10             	and    $0x10,%eax
  c01ff9:	85 c0                	test   %eax,%eax
  c01ffb:	74 07                	je     c02004 <_toNumber+0x3e>
  c01ffd:	c7 45 f8 a0 28 c0 00 	movl   $0xc028a0,-0x8(%ebp)
  c02004:	8b 45 20             	mov    0x20(%ebp),%eax
  c02007:	83 e0 01             	and    $0x1,%eax
  c0200a:	85 c0                	test   %eax,%eax
  c0200c:	74 04                	je     c02012 <_toNumber+0x4c>
  c0200e:	83 65 20 f7          	andl   $0xfffffff7,0x20(%ebp)
  c02012:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
  c02016:	74 0d                	je     c02025 <_toNumber+0x5f>
  c02018:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
  c0201f:	83 65 20 fd          	andl   $0xfffffffd,0x20(%ebp)
  c02023:	eb 04                	jmp    c02029 <_toNumber+0x63>
  c02025:	83 65 20 fb          	andl   $0xfffffffb,0x20(%ebp)
  c02029:	8b 45 20             	mov    0x20(%ebp),%eax
  c0202c:	83 e0 04             	and    $0x4,%eax
  c0202f:	85 c0                	test   %eax,%eax
  c02031:	74 16                	je     c02049 <_toNumber+0x83>
  c02033:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
  c02037:	75 06                	jne    c0203f <_toNumber+0x79>
  c02039:	83 6d 1c 02          	subl   $0x2,0x1c(%ebp)
  c0203d:	eb 0a                	jmp    c02049 <_toNumber+0x83>
  c0203f:	83 7d 18 08          	cmpl   $0x8,0x18(%ebp)
  c02043:	75 04                	jne    c02049 <_toNumber+0x83>
  c02045:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  c02049:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
  c0204d:	75 2b                	jne    c0207a <_toNumber+0xb4>
  c0204f:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  c02055:	8b 95 ec fe ff ff    	mov    -0x114(%ebp),%edx
  c0205b:	85 d2                	test   %edx,%edx
  c0205d:	79 1b                	jns    c0207a <_toNumber+0xb4>
  c0205f:	83 4d 20 02          	orl    $0x2,0x20(%ebp)
  c02063:	f7 9d e8 fe ff ff    	negl   -0x118(%ebp)
  c02069:	83 95 ec fe ff ff 00 	adcl   $0x0,-0x114(%ebp)
  c02070:	f7 9d ec fe ff ff    	negl   -0x114(%ebp)
  c02076:	c6 45 ff 2d          	movb   $0x2d,-0x1(%ebp)
  c0207a:	8b 45 24             	mov    0x24(%ebp),%eax
  c0207d:	99                   	cltd   
  c0207e:	21 85 e8 fe ff ff    	and    %eax,-0x118(%ebp)
  c02084:	21 95 ec fe ff ff    	and    %edx,-0x114(%ebp)
  c0208a:	8b 45 20             	mov    0x20(%ebp),%eax
  c0208d:	83 e0 02             	and    $0x2,%eax
  c02090:	85 c0                	test   %eax,%eax
  c02092:	74 04                	je     c02098 <_toNumber+0xd2>
  c02094:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  c02098:	8b 45 18             	mov    0x18(%ebp),%eax
  c0209b:	83 f8 0a             	cmp    $0xa,%eax
  c0209e:	74 25                	je     c020c5 <_toNumber+0xff>
  c020a0:	83 f8 10             	cmp    $0x10,%eax
  c020a3:	74 3b                	je     c020e0 <_toNumber+0x11a>
  c020a5:	83 f8 08             	cmp    $0x8,%eax
  c020a8:	75 50                	jne    c020fa <_toNumber+0x134>
  c020aa:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  c020b0:	50                   	push   %eax
  c020b1:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  c020b7:	50                   	push   %eax
  c020b8:	e8 4b fe ff ff       	call   c01f08 <_octal>
  c020bd:	83 c4 08             	add    $0x8,%esp
  c020c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c020c3:	eb 35                	jmp    c020fa <_toNumber+0x134>
  c020c5:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  c020cb:	50                   	push   %eax
  c020cc:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  c020d2:	50                   	push   %eax
  c020d3:	e8 61 fe ff ff       	call   c01f39 <_decimal>
  c020d8:	83 c4 08             	add    $0x8,%esp
  c020db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c020de:	eb 1a                	jmp    c020fa <_toNumber+0x134>
  c020e0:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  c020e6:	50                   	push   %eax
  c020e7:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  c020ed:	50                   	push   %eax
  c020ee:	e8 a2 fe ff ff       	call   c01f95 <_hex>
  c020f3:	83 c4 08             	add    $0x8,%esp
  c020f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c020f9:	90                   	nop
  c020fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c020fd:	29 45 1c             	sub    %eax,0x1c(%ebp)
  c02100:	8b 45 20             	mov    0x20(%ebp),%eax
  c02103:	83 e0 09             	and    $0x9,%eax
  c02106:	85 c0                	test   %eax,%eax
  c02108:	75 1b                	jne    c02125 <_toNumber+0x15f>
  c0210a:	eb 0c                	jmp    c02118 <_toNumber+0x152>
  c0210c:	8b 45 08             	mov    0x8(%ebp),%eax
  c0210f:	8d 50 01             	lea    0x1(%eax),%edx
  c02112:	89 55 08             	mov    %edx,0x8(%ebp)
  c02115:	c6 00 20             	movb   $0x20,(%eax)
  c02118:	8b 45 1c             	mov    0x1c(%ebp),%eax
  c0211b:	8d 50 ff             	lea    -0x1(%eax),%edx
  c0211e:	89 55 1c             	mov    %edx,0x1c(%ebp)
  c02121:	85 c0                	test   %eax,%eax
  c02123:	7f e7                	jg     c0210c <_toNumber+0x146>
  c02125:	8b 45 20             	mov    0x20(%ebp),%eax
  c02128:	83 e0 02             	and    $0x2,%eax
  c0212b:	85 c0                	test   %eax,%eax
  c0212d:	74 0f                	je     c0213e <_toNumber+0x178>
  c0212f:	8b 45 08             	mov    0x8(%ebp),%eax
  c02132:	8d 50 01             	lea    0x1(%eax),%edx
  c02135:	89 55 08             	mov    %edx,0x8(%ebp)
  c02138:	0f b6 55 ff          	movzbl -0x1(%ebp),%edx
  c0213c:	88 10                	mov    %dl,(%eax)
  c0213e:	8b 45 20             	mov    0x20(%ebp),%eax
  c02141:	83 e0 04             	and    $0x4,%eax
  c02144:	85 c0                	test   %eax,%eax
  c02146:	74 24                	je     c0216c <_toNumber+0x1a6>
  c02148:	8b 45 08             	mov    0x8(%ebp),%eax
  c0214b:	8d 50 01             	lea    0x1(%eax),%edx
  c0214e:	89 55 08             	mov    %edx,0x8(%ebp)
  c02151:	c6 00 30             	movb   $0x30,(%eax)
  c02154:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
  c02158:	75 12                	jne    c0216c <_toNumber+0x1a6>
  c0215a:	8b 45 08             	mov    0x8(%ebp),%eax
  c0215d:	8d 50 01             	lea    0x1(%eax),%edx
  c02160:	89 55 08             	mov    %edx,0x8(%ebp)
  c02163:	8b 55 f8             	mov    -0x8(%ebp),%edx
  c02166:	0f b6 52 10          	movzbl 0x10(%edx),%edx
  c0216a:	88 10                	mov    %dl,(%eax)
  c0216c:	8b 45 20             	mov    0x20(%ebp),%eax
  c0216f:	83 e0 08             	and    $0x8,%eax
  c02172:	85 c0                	test   %eax,%eax
  c02174:	74 1b                	je     c02191 <_toNumber+0x1cb>
  c02176:	eb 0c                	jmp    c02184 <_toNumber+0x1be>
  c02178:	8b 45 08             	mov    0x8(%ebp),%eax
  c0217b:	8d 50 01             	lea    0x1(%eax),%edx
  c0217e:	89 55 08             	mov    %edx,0x8(%ebp)
  c02181:	c6 00 30             	movb   $0x30,(%eax)
  c02184:	8b 45 1c             	mov    0x1c(%ebp),%eax
  c02187:	8d 50 ff             	lea    -0x1(%eax),%edx
  c0218a:	89 55 1c             	mov    %edx,0x1c(%ebp)
  c0218d:	85 c0                	test   %eax,%eax
  c0218f:	7f e7                	jg     c02178 <_toNumber+0x1b2>
  c02191:	eb 1f                	jmp    c021b2 <_toNumber+0x1ec>
  c02193:	8b 45 08             	mov    0x8(%ebp),%eax
  c02196:	8d 50 01             	lea    0x1(%eax),%edx
  c02199:	89 55 08             	mov    %edx,0x8(%ebp)
  c0219c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c0219f:	8b 94 95 f4 fe ff ff 	mov    -0x10c(%ebp,%edx,4),%edx
  c021a6:	89 d1                	mov    %edx,%ecx
  c021a8:	8b 55 f8             	mov    -0x8(%ebp),%edx
  c021ab:	01 ca                	add    %ecx,%edx
  c021ad:	0f b6 12             	movzbl (%edx),%edx
  c021b0:	88 10                	mov    %dl,(%eax)
  c021b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c021b5:	8d 50 ff             	lea    -0x1(%eax),%edx
  c021b8:	89 55 f4             	mov    %edx,-0xc(%ebp)
  c021bb:	85 c0                	test   %eax,%eax
  c021bd:	7f d4                	jg     c02193 <_toNumber+0x1cd>
  c021bf:	8b 45 20             	mov    0x20(%ebp),%eax
  c021c2:	83 e0 01             	and    $0x1,%eax
  c021c5:	85 c0                	test   %eax,%eax
  c021c7:	74 1b                	je     c021e4 <_toNumber+0x21e>
  c021c9:	eb 0c                	jmp    c021d7 <_toNumber+0x211>
  c021cb:	8b 45 08             	mov    0x8(%ebp),%eax
  c021ce:	8d 50 01             	lea    0x1(%eax),%edx
  c021d1:	89 55 08             	mov    %edx,0x8(%ebp)
  c021d4:	c6 00 20             	movb   $0x20,(%eax)
  c021d7:	8b 45 1c             	mov    0x1c(%ebp),%eax
  c021da:	8d 50 ff             	lea    -0x1(%eax),%edx
  c021dd:	89 55 1c             	mov    %edx,0x1c(%ebp)
  c021e0:	85 c0                	test   %eax,%eax
  c021e2:	7f e7                	jg     c021cb <_toNumber+0x205>
  c021e4:	8b 45 08             	mov    0x8(%ebp),%eax
  c021e7:	c9                   	leave  
  c021e8:	c3                   	ret    

00c021e9 <_toString>:
  c021e9:	55                   	push   %ebp
  c021ea:	89 e5                	mov    %esp,%ebp
  c021ec:	83 ec 10             	sub    $0x10,%esp
  c021ef:	ff 75 0c             	pushl  0xc(%ebp)
  c021f2:	e8 79 fc ff ff       	call   c01e70 <strlen>
  c021f7:	83 c4 04             	add    $0x4,%esp
  c021fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c021fd:	8b 45 08             	mov    0x8(%ebp),%eax
  c02200:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c02203:	8b 45 08             	mov    0x8(%ebp),%eax
  c02206:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c02209:	8b 45 14             	mov    0x14(%ebp),%eax
  c0220c:	83 e0 01             	and    $0x1,%eax
  c0220f:	85 c0                	test   %eax,%eax
  c02211:	74 0d                	je     c02220 <_toString+0x37>
  c02213:	8b 55 f0             	mov    -0x10(%ebp),%edx
  c02216:	8b 45 08             	mov    0x8(%ebp),%eax
  c02219:	01 d0                	add    %edx,%eax
  c0221b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c0221e:	eb 0b                	jmp    c0222b <_toString+0x42>
  c02220:	8b 55 f0             	mov    -0x10(%ebp),%edx
  c02223:	8b 45 08             	mov    0x8(%ebp),%eax
  c02226:	01 d0                	add    %edx,%eax
  c02228:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c0222b:	ff 75 f0             	pushl  -0x10(%ebp)
  c0222e:	ff 75 0c             	pushl  0xc(%ebp)
  c02231:	ff 75 fc             	pushl  -0x4(%ebp)
  c02234:	e8 55 fc ff ff       	call   c01e8e <memcpy>
  c02239:	83 c4 0c             	add    $0xc,%esp
  c0223c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c02243:	eb 10                	jmp    c02255 <_toString+0x6c>
  c02245:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c02248:	8d 50 01             	lea    0x1(%eax),%edx
  c0224b:	89 55 f8             	mov    %edx,-0x8(%ebp)
  c0224e:	c6 00 20             	movb   $0x20,(%eax)
  c02251:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  c02255:	8b 45 10             	mov    0x10(%ebp),%eax
  c02258:	2b 45 f0             	sub    -0x10(%ebp),%eax
  c0225b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  c0225e:	7f e5                	jg     c02245 <_toString+0x5c>
  c02260:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c02263:	39 45 10             	cmp    %eax,0x10(%ebp)
  c02266:	0f 4d 45 10          	cmovge 0x10(%ebp),%eax
  c0226a:	89 c2                	mov    %eax,%edx
  c0226c:	8b 45 08             	mov    0x8(%ebp),%eax
  c0226f:	01 d0                	add    %edx,%eax
  c02271:	c9                   	leave  
  c02272:	c3                   	ret    

00c02273 <vsprintf>:
  c02273:	55                   	push   %ebp
  c02274:	89 e5                	mov    %esp,%ebp
  c02276:	83 ec 30             	sub    $0x30,%esp
  c02279:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c02280:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c02287:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c0228e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  c02295:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  c0229c:	c7 45 e4 6c 00 00 00 	movl   $0x6c,-0x1c(%ebp)
  c022a3:	8b 45 08             	mov    0x8(%ebp),%eax
  c022a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c022a9:	e9 69 02 00 00       	jmp    c02517 <vsprintf+0x2a4>
  c022ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  c022b1:	0f b6 00             	movzbl (%eax),%eax
  c022b4:	3c 25                	cmp    $0x25,%al
  c022b6:	0f 85 41 02 00 00    	jne    c024fd <vsprintf+0x28a>
  c022bc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c022c3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c022ca:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c022d1:	c7 45 e4 6c 00 00 00 	movl   $0x6c,-0x1c(%ebp)
  c022d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  c022db:	83 c0 01             	add    $0x1,%eax
  c022de:	89 45 0c             	mov    %eax,0xc(%ebp)
  c022e1:	8b 45 0c             	mov    0xc(%ebp),%eax
  c022e4:	0f b6 00             	movzbl (%eax),%eax
  c022e7:	0f be c0             	movsbl %al,%eax
  c022ea:	83 e8 20             	sub    $0x20,%eax
  c022ed:	83 f8 10             	cmp    $0x10,%eax
  c022f0:	77 27                	ja     c02319 <vsprintf+0xa6>
  c022f2:	8b 04 85 c0 28 c0 00 	mov    0xc028c0(,%eax,4),%eax
  c022f9:	ff e0                	jmp    *%eax
  c022fb:	83 4d fc 01          	orl    $0x1,-0x4(%ebp)
  c022ff:	eb d7                	jmp    c022d8 <vsprintf+0x65>
  c02301:	83 4d fc 02          	orl    $0x2,-0x4(%ebp)
  c02305:	eb d1                	jmp    c022d8 <vsprintf+0x65>
  c02307:	83 4d fc 02          	orl    $0x2,-0x4(%ebp)
  c0230b:	eb cb                	jmp    c022d8 <vsprintf+0x65>
  c0230d:	83 4d fc 08          	orl    $0x8,-0x4(%ebp)
  c02311:	eb c5                	jmp    c022d8 <vsprintf+0x65>
  c02313:	83 4d fc 04          	orl    $0x4,-0x4(%ebp)
  c02317:	eb bf                	jmp    c022d8 <vsprintf+0x65>
  c02319:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0231c:	0f b6 00             	movzbl (%eax),%eax
  c0231f:	3c 2f                	cmp    $0x2f,%al
  c02321:	7e 1b                	jle    c0233e <vsprintf+0xcb>
  c02323:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02326:	0f b6 00             	movzbl (%eax),%eax
  c02329:	3c 39                	cmp    $0x39,%al
  c0232b:	7f 11                	jg     c0233e <vsprintf+0xcb>
  c0232d:	8d 45 0c             	lea    0xc(%ebp),%eax
  c02330:	50                   	push   %eax
  c02331:	e8 78 fb ff ff       	call   c01eae <_atoi>
  c02336:	83 c4 04             	add    $0x4,%esp
  c02339:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c0233c:	eb 21                	jmp    c0235f <vsprintf+0xec>
  c0233e:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02341:	0f b6 00             	movzbl (%eax),%eax
  c02344:	3c 2a                	cmp    $0x2a,%al
  c02346:	75 17                	jne    c0235f <vsprintf+0xec>
  c02348:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0234b:	83 c0 01             	add    $0x1,%eax
  c0234e:	89 45 0c             	mov    %eax,0xc(%ebp)
  c02351:	8b 45 10             	mov    0x10(%ebp),%eax
  c02354:	8d 50 04             	lea    0x4(%eax),%edx
  c02357:	89 55 10             	mov    %edx,0x10(%ebp)
  c0235a:	8b 00                	mov    (%eax),%eax
  c0235c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c0235f:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02362:	0f b6 00             	movzbl (%eax),%eax
  c02365:	3c 68                	cmp    $0x68,%al
  c02367:	74 1e                	je     c02387 <vsprintf+0x114>
  c02369:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0236c:	0f b6 00             	movzbl (%eax),%eax
  c0236f:	3c 6c                	cmp    $0x6c,%al
  c02371:	74 14                	je     c02387 <vsprintf+0x114>
  c02373:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02376:	0f b6 00             	movzbl (%eax),%eax
  c02379:	3c 4c                	cmp    $0x4c,%al
  c0237b:	74 0a                	je     c02387 <vsprintf+0x114>
  c0237d:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02380:	0f b6 00             	movzbl (%eax),%eax
  c02383:	3c 48                	cmp    $0x48,%al
  c02385:	75 15                	jne    c0239c <vsprintf+0x129>
  c02387:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0238a:	0f b6 00             	movzbl (%eax),%eax
  c0238d:	0f be c0             	movsbl %al,%eax
  c02390:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c02393:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02396:	83 c0 01             	add    $0x1,%eax
  c02399:	89 45 0c             	mov    %eax,0xc(%ebp)
  c0239c:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0239f:	0f b6 00             	movzbl (%eax),%eax
  c023a2:	0f be c0             	movsbl %al,%eax
  c023a5:	83 e8 58             	sub    $0x58,%eax
  c023a8:	83 f8 20             	cmp    $0x20,%eax
  c023ab:	77 57                	ja     c02404 <vsprintf+0x191>
  c023ad:	8b 04 85 04 29 c0 00 	mov    0xc02904(,%eax,4),%eax
  c023b4:	ff e0                	jmp    *%eax
  c023b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c023b9:	8d 50 01             	lea    0x1(%eax),%edx
  c023bc:	89 55 ec             	mov    %edx,-0x14(%ebp)
  c023bf:	8b 55 10             	mov    0x10(%ebp),%edx
  c023c2:	8d 4a 04             	lea    0x4(%edx),%ecx
  c023c5:	89 4d 10             	mov    %ecx,0x10(%ebp)
  c023c8:	8b 12                	mov    (%edx),%edx
  c023ca:	88 10                	mov    %dl,(%eax)
  c023cc:	e9 3d 01 00 00       	jmp    c0250e <vsprintf+0x29b>
  c023d1:	c7 45 e4 73 00 00 00 	movl   $0x73,-0x1c(%ebp)
  c023d8:	eb 50                	jmp    c0242a <vsprintf+0x1b7>
  c023da:	83 4d fc 04          	orl    $0x4,-0x4(%ebp)
  c023de:	83 4d fc 10          	orl    $0x10,-0x4(%ebp)
  c023e2:	c7 45 f0 10 00 00 00 	movl   $0x10,-0x10(%ebp)
  c023e9:	eb 3f                	jmp    c0242a <vsprintf+0x1b7>
  c023eb:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  c023f2:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  c023f9:	eb 2e                	jmp    c02429 <vsprintf+0x1b6>
  c023fb:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
  c02402:	eb 26                	jmp    c0242a <vsprintf+0x1b7>
  c02404:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02407:	0f b6 00             	movzbl (%eax),%eax
  c0240a:	84 c0                	test   %al,%al
  c0240c:	74 16                	je     c02424 <vsprintf+0x1b1>
  c0240e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c02411:	8d 50 01             	lea    0x1(%eax),%edx
  c02414:	89 55 ec             	mov    %edx,-0x14(%ebp)
  c02417:	8b 55 0c             	mov    0xc(%ebp),%edx
  c0241a:	0f b6 12             	movzbl (%edx),%edx
  c0241d:	88 10                	mov    %dl,(%eax)
  c0241f:	e9 ea 00 00 00       	jmp    c0250e <vsprintf+0x29b>
  c02424:	e9 e5 00 00 00       	jmp    c0250e <vsprintf+0x29b>
  c02429:	90                   	nop
  c0242a:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  c02431:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c02434:	83 e8 48             	sub    $0x48,%eax
  c02437:	83 f8 2b             	cmp    $0x2b,%eax
  c0243a:	0f 87 ce 00 00 00    	ja     c0250e <vsprintf+0x29b>
  c02440:	8b 04 85 88 29 c0 00 	mov    0xc02988(,%eax,4),%eax
  c02447:	ff e0                	jmp    *%eax
  c02449:	c7 45 e0 ff 00 00 00 	movl   $0xff,-0x20(%ebp)
  c02450:	81 65 e0 ff ff 00 00 	andl   $0xffff,-0x20(%ebp)
  c02457:	8b 45 10             	mov    0x10(%ebp),%eax
  c0245a:	8d 50 04             	lea    0x4(%eax),%edx
  c0245d:	89 55 10             	mov    %edx,0x10(%ebp)
  c02460:	8b 00                	mov    (%eax),%eax
  c02462:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c02465:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c02468:	ba 00 00 00 00       	mov    $0x0,%edx
  c0246d:	ff 75 e0             	pushl  -0x20(%ebp)
  c02470:	ff 75 fc             	pushl  -0x4(%ebp)
  c02473:	ff 75 f8             	pushl  -0x8(%ebp)
  c02476:	ff 75 f0             	pushl  -0x10(%ebp)
  c02479:	ff 75 f4             	pushl  -0xc(%ebp)
  c0247c:	52                   	push   %edx
  c0247d:	50                   	push   %eax
  c0247e:	ff 75 ec             	pushl  -0x14(%ebp)
  c02481:	e8 40 fb ff ff       	call   c01fc6 <_toNumber>
  c02486:	83 c4 20             	add    $0x20,%esp
  c02489:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c0248c:	eb 6d                	jmp    c024fb <vsprintf+0x288>
  c0248e:	8b 45 10             	mov    0x10(%ebp),%eax
  c02491:	8d 50 08             	lea    0x8(%eax),%edx
  c02494:	89 55 10             	mov    %edx,0x10(%ebp)
  c02497:	8b 50 04             	mov    0x4(%eax),%edx
  c0249a:	8b 00                	mov    (%eax),%eax
  c0249c:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c0249f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c024a2:	ba 00 00 00 00       	mov    $0x0,%edx
  c024a7:	ff 75 e0             	pushl  -0x20(%ebp)
  c024aa:	ff 75 fc             	pushl  -0x4(%ebp)
  c024ad:	ff 75 f8             	pushl  -0x8(%ebp)
  c024b0:	ff 75 f0             	pushl  -0x10(%ebp)
  c024b3:	ff 75 f4             	pushl  -0xc(%ebp)
  c024b6:	52                   	push   %edx
  c024b7:	50                   	push   %eax
  c024b8:	ff 75 ec             	pushl  -0x14(%ebp)
  c024bb:	e8 06 fb ff ff       	call   c01fc6 <_toNumber>
  c024c0:	83 c4 20             	add    $0x20,%esp
  c024c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c024c6:	eb 33                	jmp    c024fb <vsprintf+0x288>
  c024c8:	8b 45 10             	mov    0x10(%ebp),%eax
  c024cb:	8d 50 04             	lea    0x4(%eax),%edx
  c024ce:	89 55 10             	mov    %edx,0x10(%ebp)
  c024d1:	8b 00                	mov    (%eax),%eax
  c024d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c024d6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  c024da:	75 07                	jne    c024e3 <vsprintf+0x270>
  c024dc:	c7 45 e8 b8 28 c0 00 	movl   $0xc028b8,-0x18(%ebp)
  c024e3:	ff 75 fc             	pushl  -0x4(%ebp)
  c024e6:	ff 75 f8             	pushl  -0x8(%ebp)
  c024e9:	ff 75 e8             	pushl  -0x18(%ebp)
  c024ec:	ff 75 ec             	pushl  -0x14(%ebp)
  c024ef:	e8 f5 fc ff ff       	call   c021e9 <_toString>
  c024f4:	83 c4 10             	add    $0x10,%esp
  c024f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c024fa:	90                   	nop
  c024fb:	eb 11                	jmp    c0250e <vsprintf+0x29b>
  c024fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c02500:	8d 50 01             	lea    0x1(%eax),%edx
  c02503:	89 55 ec             	mov    %edx,-0x14(%ebp)
  c02506:	8b 55 0c             	mov    0xc(%ebp),%edx
  c02509:	0f b6 12             	movzbl (%edx),%edx
  c0250c:	88 10                	mov    %dl,(%eax)
  c0250e:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02511:	83 c0 01             	add    $0x1,%eax
  c02514:	89 45 0c             	mov    %eax,0xc(%ebp)
  c02517:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0251a:	0f b6 00             	movzbl (%eax),%eax
  c0251d:	84 c0                	test   %al,%al
  c0251f:	0f 85 89 fd ff ff    	jne    c022ae <vsprintf+0x3b>
  c02525:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c02528:	c6 00 00             	movb   $0x0,(%eax)
  c0252b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  c0252e:	8b 45 08             	mov    0x8(%ebp),%eax
  c02531:	29 c2                	sub    %eax,%edx
  c02533:	89 d0                	mov    %edx,%eax
  c02535:	c9                   	leave  
  c02536:	c3                   	ret    

00c02537 <sprintf>:
  c02537:	55                   	push   %ebp
  c02538:	89 e5                	mov    %esp,%ebp
  c0253a:	83 ec 10             	sub    $0x10,%esp
  c0253d:	8d 45 10             	lea    0x10(%ebp),%eax
  c02540:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c02543:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c02546:	83 ec 04             	sub    $0x4,%esp
  c02549:	50                   	push   %eax
  c0254a:	ff 75 0c             	pushl  0xc(%ebp)
  c0254d:	ff 75 08             	pushl  0x8(%ebp)
  c02550:	e8 1e fd ff ff       	call   c02273 <vsprintf>
  c02555:	83 c4 10             	add    $0x10,%esp
  c02558:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c0255b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c0255e:	c9                   	leave  
  c0255f:	c3                   	ret    

Disassembly of section .rodata:

00c02560 <_lowerDigits-0x33c>:
  c02560:	48                   	dec    %eax
  c02561:	61                   	popa   
  c02562:	6e                   	outsb  %ds:(%esi),(%dx)
  c02563:	67 75 70             	addr16 jne c025d6 <sprintf+0x9f>
  c02566:	00 51 75             	add    %dl,0x75(%ecx)
  c02569:	69 74 00 49 6c 6c 65 	imul   $0x67656c6c,0x49(%eax,%eax,1),%esi
  c02570:	67 
  c02571:	61                   	popa   
  c02572:	6c                   	insb   (%dx),%es:(%edi)
  c02573:	20 69 6e             	and    %ch,0x6e(%ecx)
  c02576:	73 74                	jae    c025ec <sprintf+0xb5>
  c02578:	72 75                	jb     c025ef <sprintf+0xb8>
  c0257a:	63 74 69 6f          	arpl   %si,0x6f(%ecx,%ebp,2)
  c0257e:	6e                   	outsb  %ds:(%esi),(%dx)
  c0257f:	00 54 72 61          	add    %dl,0x61(%edx,%esi,2)
  c02583:	63 65 20             	arpl   %sp,0x20(%ebp)
  c02586:	74 72                	je     c025fa <sprintf+0xc3>
  c02588:	61                   	popa   
  c02589:	70 00                	jo     c0258b <sprintf+0x54>
  c0258b:	41                   	inc    %ecx
  c0258c:	62 6f 72             	bound  %ebp,0x72(%edi)
  c0258f:	74 00                	je     c02591 <sprintf+0x5a>
  c02591:	53                   	push   %ebx
  c02592:	69 67 6e 61 6c 20 37 	imul   $0x37206c61,0x6e(%edi),%esp
  c02599:	00 46 6c             	add    %al,0x6c(%esi)
  c0259c:	6f                   	outsl  %ds:(%esi),(%dx)
  c0259d:	61                   	popa   
  c0259e:	74 69                	je     c02609 <sprintf+0xd2>
  c025a0:	6e                   	outsb  %ds:(%esi),(%dx)
  c025a1:	67 20 70 6f          	and    %dh,0x6f(%bx,%si)
  c025a5:	69 6e 74 20 65 78 63 	imul   $0x63786520,0x74(%esi),%ebp
  c025ac:	65                   	gs
  c025ad:	70 74                	jo     c02623 <sprintf+0xec>
  c025af:	69 6f 6e 00 4b 69 6c 	imul   $0x6c694b00,0x6e(%edi),%ebp
  c025b6:	6c                   	insb   (%dx),%es:(%edi)
  c025b7:	65 64 00 53 69       	gs add %dl,%fs:%gs:0x69(%ebx)
  c025bc:	67 6e                	outsb  %ds:(%si),(%dx)
  c025be:	61                   	popa   
  c025bf:	6c                   	insb   (%dx),%es:(%edi)
  c025c0:	20 31                	and    %dh,(%ecx)
  c025c2:	30 00                	xor    %al,(%eax)
  c025c4:	53                   	push   %ebx
  c025c5:	65                   	gs
  c025c6:	67 6d                	insl   (%dx),%es:(%di)
  c025c8:	65 6e                	outsb  %gs:(%esi),(%dx)
  c025ca:	74 61                	je     c0262d <sprintf+0xf6>
  c025cc:	74 69                	je     c02637 <sprintf+0x100>
  c025ce:	6f                   	outsl  %ds:(%esi),(%dx)
  c025cf:	6e                   	outsb  %ds:(%esi),(%dx)
  c025d0:	20 76 69             	and    %dh,0x69(%esi)
  c025d3:	6f                   	outsl  %ds:(%esi),(%dx)
  c025d4:	6c                   	insb   (%dx),%es:(%edi)
  c025d5:	61                   	popa   
  c025d6:	74 69                	je     c02641 <sprintf+0x10a>
  c025d8:	6f                   	outsl  %ds:(%esi),(%dx)
  c025d9:	6e                   	outsb  %ds:(%esi),(%dx)
  c025da:	00 42 61             	add    %al,0x61(%edx)
  c025dd:	64 20 61 72          	and    %ah,%fs:0x72(%ecx)
  c025e1:	67 75 6d             	addr16 jne c02651 <sprintf+0x11a>
  c025e4:	65 6e                	outsb  %gs:(%esi),(%dx)
  c025e6:	74 20                	je     c02608 <sprintf+0xd1>
  c025e8:	74 6f                	je     c02659 <sprintf+0x122>
  c025ea:	20 73 79             	and    %dh,0x79(%ebx)
  c025ed:	73 74                	jae    c02663 <sprintf+0x12c>
  c025ef:	65                   	gs
  c025f0:	6d                   	insl   (%dx),%es:(%edi)
  c025f1:	20 63 61             	and    %ah,0x61(%ebx)
  c025f4:	6c                   	insb   (%dx),%es:(%edi)
  c025f5:	6c                   	insb   (%dx),%es:(%edi)
  c025f6:	00 41 6c             	add    %al,0x6c(%ecx)
  c025f9:	61                   	popa   
  c025fa:	72 6d                	jb     c02669 <sprintf+0x132>
  c025fc:	20 63 6c             	and    %ah,0x6c(%ebx)
  c025ff:	6f                   	outsl  %ds:(%esi),(%dx)
  c02600:	63 6b 00             	arpl   %bp,0x0(%ebx)
  c02603:	00 53 6f             	add    %dl,0x6f(%ebx)
  c02606:	66                   	data16
  c02607:	74 77                	je     c02680 <sprintf+0x149>
  c02609:	61                   	popa   
  c0260a:	72 65                	jb     c02671 <sprintf+0x13a>
  c0260c:	20 74 65 72          	and    %dh,0x72(%ebp,%eiz,2)
  c02610:	6d                   	insl   (%dx),%es:(%edi)
  c02611:	69 6e 61 74 69 6f 6e 	imul   $0x6e6f6974,0x61(%esi),%ebp
  c02618:	20 73 69             	and    %dh,0x69(%ebx)
  c0261b:	67 6e                	outsb  %ds:(%si),(%dx)
  c0261d:	61                   	popa   
  c0261e:	6c                   	insb   (%dx),%es:(%edi)
  c0261f:	20 66 72             	and    %ah,0x72(%esi)
  c02622:	6f                   	outsl  %ds:(%esi),(%dx)
  c02623:	6d                   	insl   (%dx),%es:(%edi)
  c02624:	20 6b 69             	and    %ch,0x69(%ebx)
  c02627:	6c                   	insb   (%dx),%es:(%edi)
  c02628:	6c                   	insb   (%dx),%es:(%edi)
  c02629:	00 53 69             	add    %dl,0x69(%ebx)
  c0262c:	67 6e                	outsb  %ds:(%si),(%dx)
  c0262e:	61                   	popa   
  c0262f:	6c                   	insb   (%dx),%es:(%edi)
  c02630:	20 31                	and    %dh,(%ecx)
  c02632:	36 00 43 68          	add    %al,%ss:0x68(%ebx)
  c02636:	69 6c 64 20 70 72 6f 	imul   $0x636f7270,0x20(%esp,%eiz,2),%ebp
  c0263d:	63 
  c0263e:	65                   	gs
  c0263f:	73 73                	jae    c026b4 <sprintf+0x17d>
  c02641:	20 74 65 72          	and    %dh,0x72(%ebp,%eiz,2)
  c02645:	6d                   	insl   (%dx),%es:(%edi)
  c02646:	69 6e 61 74 65 64 20 	imul   $0x20646574,0x61(%esi),%ebp
  c0264d:	6f                   	outsl  %ds:(%esi),(%dx)
  c0264e:	72 20                	jb     c02670 <sprintf+0x139>
  c02650:	73 74                	jae    c026c6 <sprintf+0x18f>
  c02652:	6f                   	outsl  %ds:(%esi),(%dx)
  c02653:	70 70                	jo     c026c5 <sprintf+0x18e>
  c02655:	65 64 00 25 20 00 3a 	gs add %ah,%fs:%gs:0x203a0020
  c0265c:	20 
  c0265d:	63 61 6e             	arpl   %sp,0x6e(%ecx)
  c02660:	6e                   	outsb  %ds:(%esi),(%dx)
  c02661:	6f                   	outsl  %ds:(%esi),(%dx)
  c02662:	74 20                	je     c02684 <sprintf+0x14d>
  c02664:	6f                   	outsl  %ds:(%esi),(%dx)
  c02665:	70 65                	jo     c026cc <sprintf+0x195>
  c02667:	6e                   	outsb  %ds:(%esi),(%dx)
  c02668:	00 43 6f             	add    %al,0x6f(%ebx)
  c0266b:	6d                   	insl   (%dx),%es:(%edi)
  c0266c:	6d                   	insl   (%dx),%es:(%edi)
  c0266d:	61                   	popa   
  c0266e:	6e                   	outsb  %ds:(%esi),(%dx)
  c0266f:	64 20 6c 69 6e       	and    %ch,%fs:0x6e(%ecx,%ebp,2)
  c02674:	65 20 6f 76          	and    %ch,%gs:0x76(%edi)
  c02678:	65                   	gs
  c02679:	72 66                	jb     c026e1 <sprintf+0x1aa>
  c0267b:	6c                   	insb   (%dx),%es:(%edi)
  c0267c:	6f                   	outsl  %ds:(%esi),(%dx)
  c0267d:	77 00                	ja     c0267f <sprintf+0x148>
  c0267f:	73 79                	jae    c026fa <sprintf+0x1c3>
  c02681:	6e                   	outsb  %ds:(%esi),(%dx)
  c02682:	74 61                	je     c026e5 <sprintf+0x1ae>
  c02684:	78 20                	js     c026a6 <sprintf+0x16f>
  c02686:	65                   	gs
  c02687:	72 72                	jb     c026fb <sprintf+0x1c4>
  c02689:	6f                   	outsl  %ds:(%esi),(%dx)
  c0268a:	72 00                	jb     c0268c <sprintf+0x155>
  c0268c:	3b 26                	cmp    (%esi),%esp
  c0268e:	3c 3e                	cmp    $0x3e,%al
  c02690:	28 29                	sub    %ch,(%ecx)
  c02692:	7c 0a                	jl     c0269e <sprintf+0x167>
  c02694:	00 20                	add    %ah,(%eax)
  c02696:	09 3b                	or     %edi,(%ebx)
  c02698:	26                   	es
  c02699:	3c 3e                	cmp    $0x3e,%al
  c0269b:	28 29                	sub    %ch,(%ecx)
  c0269d:	7c 0a                	jl     c026a9 <sprintf+0x172>
  c0269f:	00 54 6f 6f          	add    %dl,0x6f(%edi,%ebp,2)
  c026a3:	20 6d 61             	and    %ch,0x61(%ebp)
  c026a6:	6e                   	outsb  %ds:(%esi),(%dx)
  c026a7:	79 20                	jns    c026c9 <sprintf+0x192>
  c026a9:	61                   	popa   
  c026aa:	72 67                	jb     c02713 <sprintf+0x1dc>
  c026ac:	73 00                	jae    c026ae <sprintf+0x177>
  c026ae:	54                   	push   %esp
  c026af:	6f                   	outsl  %ds:(%esi),(%dx)
  c026b0:	6f                   	outsl  %ds:(%esi),(%dx)
  c026b1:	20 6d 61             	and    %ch,0x61(%ebp)
  c026b4:	6e                   	outsb  %ds:(%esi),(%dx)
  c026b5:	79 20                	jns    c026d7 <sprintf+0x1a0>
  c026b7:	63 68 61             	arpl   %bp,0x61(%eax)
  c026ba:	72 61                	jb     c0271d <sprintf+0x1e6>
  c026bc:	63 74 65 72          	arpl   %si,0x72(%ebp,%eiz,2)
  c026c0:	73 00                	jae    c026c2 <sprintf+0x18b>
  c026c2:	3b 26                	cmp    (%esi),%esp
  c026c4:	00 00                	add    %al,(%eax)
  c026c6:	00 00                	add    %al,(%eax)
  c026c8:	89 06                	mov    %eax,(%esi)
  c026ca:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026cd:	07                   	pop    %es
  c026ce:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026d1:	07                   	pop    %es
  c026d2:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026d5:	07                   	pop    %es
  c026d6:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026d9:	07                   	pop    %es
  c026da:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026dd:	07                   	pop    %es
  c026de:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026e1:	07                   	pop    %es
  c026e2:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026e5:	07                   	pop    %es
  c026e6:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026e9:	07                   	pop    %es
  c026ea:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026ed:	07                   	pop    %es
  c026ee:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026f1:	07                   	pop    %es
  c026f2:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026f5:	07                   	pop    %es
  c026f6:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026f9:	07                   	pop    %es
  c026fa:	c0 00 4b             	rolb   $0x4b,(%eax)
  c026fd:	07                   	pop    %es
  c026fe:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02701:	07                   	pop    %es
  c02702:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02705:	07                   	pop    %es
  c02706:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02709:	07                   	pop    %es
  c0270a:	c0 00 4b             	rolb   $0x4b,(%eax)
  c0270d:	07                   	pop    %es
  c0270e:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02711:	07                   	pop    %es
  c02712:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02715:	07                   	pop    %es
  c02716:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02719:	07                   	pop    %es
  c0271a:	c0 00 4b             	rolb   $0x4b,(%eax)
  c0271d:	07                   	pop    %es
  c0271e:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02721:	07                   	pop    %es
  c02722:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02725:	07                   	pop    %es
  c02726:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02729:	07                   	pop    %es
  c0272a:	c0 00 4b             	rolb   $0x4b,(%eax)
  c0272d:	07                   	pop    %es
  c0272e:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02731:	07                   	pop    %es
  c02732:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02735:	07                   	pop    %es
  c02736:	c0 00 89             	rolb   $0x89,(%eax)
  c02739:	06                   	push   %es
  c0273a:	c0 00 4b             	rolb   $0x4b,(%eax)
  c0273d:	07                   	pop    %es
  c0273e:	c0 00 5f             	rolb   $0x5f,(%eax)
  c02741:	06                   	push   %es
  c02742:	c0 00 68             	rolb   $0x68,(%eax)
  c02745:	06                   	push   %es
  c02746:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02749:	07                   	pop    %es
  c0274a:	c0 00 4b             	rolb   $0x4b,(%eax)
  c0274d:	07                   	pop    %es
  c0274e:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02751:	07                   	pop    %es
  c02752:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02755:	07                   	pop    %es
  c02756:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02759:	07                   	pop    %es
  c0275a:	c0 00 4b             	rolb   $0x4b,(%eax)
  c0275d:	07                   	pop    %es
  c0275e:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02761:	07                   	pop    %es
  c02762:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02765:	07                   	pop    %es
  c02766:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02769:	07                   	pop    %es
  c0276a:	c0 00 4b             	rolb   $0x4b,(%eax)
  c0276d:	07                   	pop    %es
  c0276e:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02771:	07                   	pop    %es
  c02772:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02775:	07                   	pop    %es
  c02776:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02779:	07                   	pop    %es
  c0277a:	c0 00 4b             	rolb   $0x4b,(%eax)
  c0277d:	07                   	pop    %es
  c0277e:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02781:	07                   	pop    %es
  c02782:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02785:	07                   	pop    %es
  c02786:	c0 00 4b             	rolb   $0x4b,(%eax)
  c02789:	07                   	pop    %es
  c0278a:	c0 00 89             	rolb   $0x89,(%eax)
  c0278d:	06                   	push   %es
  c0278e:	c0 00 3c             	rolb   $0x3c,(%eax)
  c02791:	3e 28 00             	sub    %al,%ds:(%eax)
  c02794:	43                   	inc    %ebx
  c02795:	6f                   	outsl  %ds:(%esi),(%dx)
  c02796:	6d                   	insl   (%dx),%es:(%edi)
  c02797:	6d                   	insl   (%dx),%es:(%edi)
  c02798:	61                   	popa   
  c02799:	6e                   	outsb  %ds:(%esi),(%dx)
  c0279a:	64 20 6c 69 6e       	and    %ch,%fs:0x6e(%ecx,%ebp,2)
  c0279f:	65 20 6f 76          	and    %ch,%gs:0x76(%edi)
  c027a3:	65                   	gs
  c027a4:	72 66                	jb     c0280c <sprintf+0x2d5>
  c027a6:	6c                   	insb   (%dx),%es:(%edi)
  c027a7:	6f                   	outsl  %ds:(%esi),(%dx)
  c027a8:	77 0a                	ja     c027b4 <sprintf+0x27d>
  c027aa:	00 74 72 79          	add    %dh,0x79(%edx,%esi,2)
  c027ae:	20 61 67             	and    %ah,0x67(%ecx)
  c027b1:	61                   	popa   
  c027b2:	69 6e 00 0a 00 63 64 	imul   $0x6463000a,0x0(%esi),%ebp
  c027b9:	00 63 68             	add    %ah,0x68(%ebx)
  c027bc:	64 69 72 00 63 68 64 	imul   $0x69646863,%fs:0x0(%edx),%esi
  c027c3:	69 
  c027c4:	72 3a                	jb     c02800 <sprintf+0x2c9>
  c027c6:	20 61 72             	and    %ah,0x72(%ecx)
  c027c9:	67 20 63 6f          	and    %ah,0x6f(%bp,%di)
  c027cd:	75 6e                	jne    c0283d <sprintf+0x306>
  c027cf:	74 00                	je     c027d1 <sprintf+0x29a>
  c027d1:	73 68                	jae    c0283b <sprintf+0x304>
  c027d3:	69 66 74 00 73 68 69 	imul   $0x69687300,0x74(%esi),%esp
  c027da:	66                   	data16
  c027db:	74 3a                	je     c02817 <sprintf+0x2e0>
  c027dd:	20 6e 6f             	and    %ch,0x6f(%esi)
  c027e0:	20 61 72             	and    %ah,0x72(%ecx)
  c027e3:	67 73 0a             	addr16 jae c027f0 <sprintf+0x2b9>
  c027e6:	00 6c 6f 67          	add    %ch,0x67(%edi,%ebp,2)
  c027ea:	69 6e 00 6c 6f 67 69 	imul   $0x69676f6c,0x0(%esi),%ebp
  c027f1:	6e                   	outsb  %ds:(%esi),(%dx)
  c027f2:	3a 20                	cmp    (%eax),%ah
  c027f4:	63 61 6e             	arpl   %sp,0x6e(%ecx)
  c027f7:	6e                   	outsb  %ds:(%esi),(%dx)
  c027f8:	6f                   	outsl  %ds:(%esi),(%dx)
  c027f9:	74 20                	je     c0281b <sprintf+0x2e4>
  c027fb:	65                   	gs
  c027fc:	78 65                	js     c02863 <sprintf+0x32c>
  c027fe:	63 75 74             	arpl   %si,0x74(%ebp)
  c02801:	65 0a 00             	or     %gs:(%eax),%al
  c02804:	6e                   	outsb  %ds:(%esi),(%dx)
  c02805:	65                   	gs
  c02806:	77 67                	ja     c0286f <sprintf+0x338>
  c02808:	72 70                	jb     c0287a <sprintf+0x343>
  c0280a:	00 6e 65             	add    %ch,0x65(%esi)
  c0280d:	77 67                	ja     c02876 <sprintf+0x33f>
  c0280f:	72 70                	jb     c02881 <sprintf+0x34a>
  c02811:	3a 20                	cmp    (%eax),%ah
  c02813:	63 61 6e             	arpl   %sp,0x6e(%ecx)
  c02816:	6e                   	outsb  %ds:(%esi),(%dx)
  c02817:	6f                   	outsl  %ds:(%esi),(%dx)
  c02818:	74 20                	je     c0283a <sprintf+0x303>
  c0281a:	65                   	gs
  c0281b:	78 65                	js     c02882 <sprintf+0x34b>
  c0281d:	63 75 74             	arpl   %si,0x74(%ebp)
  c02820:	65 0a 00             	or     %gs:(%eax),%al
  c02823:	77 61                	ja     c02886 <sprintf+0x34f>
  c02825:	69 74 00 3a 00 65 78 	imul   $0x69786500,0x3a(%eax,%eax,1),%esi
  c0282c:	69 
  c0282d:	74 00                	je     c0282f <sprintf+0x2f8>
  c0282f:	65                   	gs
  c02830:	78 69                	js     c0289b <sprintf+0x364>
  c02832:	74 3a                	je     c0286e <sprintf+0x337>
  c02834:	20 61 72             	and    %ah,0x72(%ecx)
  c02837:	67 20 63 6f          	and    %ah,0x6f(%bp,%di)
  c0283b:	75 6e                	jne    c028ab <_lowerDigits+0xf>
  c0283d:	74 00                	je     c0283f <sprintf+0x308>
  c0283f:	65                   	gs
  c02840:	78 65                	js     c028a7 <_lowerDigits+0xb>
  c02842:	63 00                	arpl   %ax,(%eax)
  c02844:	76 36                	jbe    c0287c <sprintf+0x345>
  c02846:	73 68                	jae    c028b0 <_lowerDigits+0x14>
  c02848:	20 3a                	and    %bh,(%edx)
  c0284a:	20 25 73 20 63 6f    	and    %ah,0x6f632073
  c02850:	6d                   	insl   (%dx),%es:(%edi)
  c02851:	6d                   	insl   (%dx),%es:(%edi)
  c02852:	61                   	popa   
  c02853:	6e                   	outsb  %ds:(%esi),(%dx)
  c02854:	64 20 6e 6f          	and    %ch,%fs:0x6f(%esi)
  c02858:	74 20                	je     c0287a <sprintf+0x343>
  c0285a:	66 6f                	outsw  %ds:(%esi),(%dx)
  c0285c:	75 6e                	jne    c028cc <_upperDigits+0x18>
  c0285e:	64 2e 0a 00          	fs or  %cs:%fs:(%eax),%al
  c02862:	5b                   	pop    %ebx
  c02863:	3f                   	aas    
  c02864:	2a 00                	sub    (%eax),%al
  c02866:	41                   	inc    %ecx
  c02867:	72 67                	jb     c028d0 <_upperDigits+0x1c>
  c02869:	20 63 6f             	and    %ah,0x6f(%ebx)
  c0286c:	75 6e                	jne    c028dc <_upperDigits+0x28>
  c0286e:	74 0a                	je     c0287a <sprintf+0x343>
  c02870:	00 00                	add    %al,(%eax)
  c02872:	41                   	inc    %ecx
  c02873:	72 67                	jb     c028dc <_upperDigits+0x28>
  c02875:	20 6c 69 73          	and    %ch,0x73(%ecx,%ebp,2)
  c02879:	74 20                	je     c0289b <sprintf+0x364>
  c0287b:	74 6f                	je     c028ec <_upperDigits+0x38>
  c0287d:	6f                   	outsl  %ds:(%esi),(%dx)
  c0287e:	20 6c 6f 6e          	and    %ch,0x6e(%edi,%ebp,2)
  c02882:	67 0a 00             	or     (%bx,%si),%al
  c02885:	00 00                	add    %al,(%eax)
  c02887:	00 30                	add    %dh,(%eax)
  c02889:	31 32                	xor    %esi,(%edx)
  c0288b:	33 34 35 36 37 38 39 	xor    0x39383736(,%esi,1),%esi
  c02892:	61                   	popa   
  c02893:	62 63 64             	bound  %esp,0x64(%ebx)
  c02896:	65                   	gs
  c02897:	66                   	data16
  c02898:	78 00                	js     c0289a <sprintf+0x363>
	...

00c0289c <_lowerDigits>:
  c0289c:	88 28                	mov    %ch,(%eax)
  c0289e:	c0 00 30             	rolb   $0x30,(%eax)
  c028a1:	31 32                	xor    %esi,(%edx)
  c028a3:	33 34 35 36 37 38 39 	xor    0x39383736(,%esi,1),%esi
  c028aa:	41                   	inc    %ecx
  c028ab:	42                   	inc    %edx
  c028ac:	43                   	inc    %ebx
  c028ad:	44                   	inc    %esp
  c028ae:	45                   	inc    %ebp
  c028af:	46                   	inc    %esi
  c028b0:	58                   	pop    %eax
  c028b1:	00 00                	add    %al,(%eax)
	...

00c028b4 <_upperDigits>:
  c028b4:	a0 28 c0 00 3c       	mov    0x3c00c028,%al
  c028b9:	4e                   	dec    %esi
  c028ba:	55                   	push   %ebp
  c028bb:	4c                   	dec    %esp
  c028bc:	4c                   	dec    %esp
  c028bd:	3e 00 00             	add    %al,%ds:(%eax)
  c028c0:	07                   	pop    %es
  c028c1:	23 c0                	and    %eax,%eax
  c028c3:	00 19                	add    %bl,(%ecx)
  c028c5:	23 c0                	and    %eax,%eax
  c028c7:	00 19                	add    %bl,(%ecx)
  c028c9:	23 c0                	and    %eax,%eax
  c028cb:	00 13                	add    %dl,(%ebx)
  c028cd:	23 c0                	and    %eax,%eax
  c028cf:	00 19                	add    %bl,(%ecx)
  c028d1:	23 c0                	and    %eax,%eax
  c028d3:	00 19                	add    %bl,(%ecx)
  c028d5:	23 c0                	and    %eax,%eax
  c028d7:	00 19                	add    %bl,(%ecx)
  c028d9:	23 c0                	and    %eax,%eax
  c028db:	00 19                	add    %bl,(%ecx)
  c028dd:	23 c0                	and    %eax,%eax
  c028df:	00 19                	add    %bl,(%ecx)
  c028e1:	23 c0                	and    %eax,%eax
  c028e3:	00 19                	add    %bl,(%ecx)
  c028e5:	23 c0                	and    %eax,%eax
  c028e7:	00 19                	add    %bl,(%ecx)
  c028e9:	23 c0                	and    %eax,%eax
  c028eb:	00 01                	add    %al,(%ecx)
  c028ed:	23 c0                	and    %eax,%eax
  c028ef:	00 19                	add    %bl,(%ecx)
  c028f1:	23 c0                	and    %eax,%eax
  c028f3:	00 fb                	add    %bh,%bl
  c028f5:	22 c0                	and    %al,%al
  c028f7:	00 19                	add    %bl,(%ecx)
  c028f9:	23 c0                	and    %eax,%eax
  c028fb:	00 19                	add    %bl,(%ecx)
  c028fd:	23 c0                	and    %eax,%eax
  c028ff:	00 0d 23 c0 00 de    	add    %cl,0xde00c023
  c02905:	23 c0                	and    %eax,%eax
  c02907:	00 04 24             	add    %al,(%esp)
  c0290a:	c0 00 04             	rolb   $0x4,(%eax)
  c0290d:	24 c0                	and    $0xc0,%al
  c0290f:	00 04 24             	add    %al,(%esp)
  c02912:	c0 00 04             	rolb   $0x4,(%eax)
  c02915:	24 c0                	and    $0xc0,%al
  c02917:	00 04 24             	add    %al,(%esp)
  c0291a:	c0 00 04             	rolb   $0x4,(%eax)
  c0291d:	24 c0                	and    $0xc0,%al
  c0291f:	00 04 24             	add    %al,(%esp)
  c02922:	c0 00 04             	rolb   $0x4,(%eax)
  c02925:	24 c0                	and    $0xc0,%al
  c02927:	00 04 24             	add    %al,(%esp)
  c0292a:	c0 00 04             	rolb   $0x4,(%eax)
  c0292d:	24 c0                	and    $0xc0,%al
  c0292f:	00 b6 23 c0 00 eb    	add    %dh,-0x14ff3fdd(%esi)
  c02935:	23 c0                	and    %eax,%eax
  c02937:	00 04 24             	add    %al,(%esp)
  c0293a:	c0 00 04             	rolb   $0x4,(%eax)
  c0293d:	24 c0                	and    $0xc0,%al
  c0293f:	00 04 24             	add    %al,(%esp)
  c02942:	c0 00 04             	rolb   $0x4,(%eax)
  c02945:	24 c0                	and    $0xc0,%al
  c02947:	00 f2                	add    %dh,%dl
  c02949:	23 c0                	and    %eax,%eax
  c0294b:	00 04 24             	add    %al,(%esp)
  c0294e:	c0 00 04             	rolb   $0x4,(%eax)
  c02951:	24 c0                	and    $0xc0,%al
  c02953:	00 04 24             	add    %al,(%esp)
  c02956:	c0 00 04             	rolb   $0x4,(%eax)
  c02959:	24 c0                	and    $0xc0,%al
  c0295b:	00 04 24             	add    %al,(%esp)
  c0295e:	c0 00 fb             	rolb   $0xfb,(%eax)
  c02961:	23 c0                	and    %eax,%eax
  c02963:	00 da                	add    %bl,%dl
  c02965:	23 c0                	and    %eax,%eax
  c02967:	00 04 24             	add    %al,(%esp)
  c0296a:	c0 00 04             	rolb   $0x4,(%eax)
  c0296d:	24 c0                	and    $0xc0,%al
  c0296f:	00 d1                	add    %dl,%cl
  c02971:	23 c0                	and    %eax,%eax
  c02973:	00 04 24             	add    %al,(%esp)
  c02976:	c0 00 29             	rolb   $0x29,(%eax)
  c02979:	24 c0                	and    $0xc0,%al
  c0297b:	00 04 24             	add    %al,(%esp)
  c0297e:	c0 00 04             	rolb   $0x4,(%eax)
  c02981:	24 c0                	and    $0xc0,%al
  c02983:	00 e2                	add    %ah,%dl
  c02985:	23 c0                	and    %eax,%eax
  c02987:	00 49 24             	add    %cl,0x24(%ecx)
  c0298a:	c0 00 0e             	rolb   $0xe,(%eax)
  c0298d:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c02992:	c0 00 0e             	rolb   $0xe,(%eax)
  c02995:	25 c0 00 8e 24       	and    $0x248e00c0,%eax
  c0299a:	c0 00 0e             	rolb   $0xe,(%eax)
  c0299d:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c029a2:	c0 00 0e             	rolb   $0xe,(%eax)
  c029a5:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c029aa:	c0 00 0e             	rolb   $0xe,(%eax)
  c029ad:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c029b2:	c0 00 0e             	rolb   $0xe,(%eax)
  c029b5:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c029ba:	c0 00 0e             	rolb   $0xe,(%eax)
  c029bd:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c029c2:	c0 00 0e             	rolb   $0xe,(%eax)
  c029c5:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c029ca:	c0 00 0e             	rolb   $0xe,(%eax)
  c029cd:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c029d2:	c0 00 0e             	rolb   $0xe,(%eax)
  c029d5:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c029da:	c0 00 0e             	rolb   $0xe,(%eax)
  c029dd:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c029e2:	c0 00 0e             	rolb   $0xe,(%eax)
  c029e5:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c029ea:	c0 00 0e             	rolb   $0xe,(%eax)
  c029ed:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c029f2:	c0 00 0e             	rolb   $0xe,(%eax)
  c029f5:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c029fa:	c0 00 0e             	rolb   $0xe,(%eax)
  c029fd:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c02a02:	c0 00 0e             	rolb   $0xe,(%eax)
  c02a05:	25 c0 00 50 24       	and    $0x245000c0,%eax
  c02a0a:	c0 00 0e             	rolb   $0xe,(%eax)
  c02a0d:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c02a12:	c0 00 0e             	rolb   $0xe,(%eax)
  c02a15:	25 c0 00 57 24       	and    $0x245700c0,%eax
  c02a1a:	c0 00 0e             	rolb   $0xe,(%eax)
  c02a1d:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c02a22:	c0 00 0e             	rolb   $0xe,(%eax)
  c02a25:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c02a2a:	c0 00 0e             	rolb   $0xe,(%eax)
  c02a2d:	25 c0 00 0e 25       	and    $0x250e00c0,%eax
  c02a32:	c0 00 c8             	rolb   $0xc8,(%eax)
  c02a35:	24 c0                	and    $0xc0,%al
	...

Disassembly of section .eh_frame:

00c02a38 <.eh_frame>:
  c02a38:	14 00                	adc    $0x0,%al
  c02a3a:	00 00                	add    %al,(%eax)
  c02a3c:	00 00                	add    %al,(%eax)
  c02a3e:	00 00                	add    %al,(%eax)
  c02a40:	01 7a 52             	add    %edi,0x52(%edx)
  c02a43:	00 01                	add    %al,(%ecx)
  c02a45:	7c 08                	jl     c02a4f <_upperDigits+0x19b>
  c02a47:	01 1b                	add    %ebx,(%ebx)
  c02a49:	0c 04                	or     $0x4,%al
  c02a4b:	04 88                	add    $0x88,%al
  c02a4d:	01 00                	add    %eax,(%eax)
  c02a4f:	00 28                	add    %ch,(%eax)
  c02a51:	00 00                	add    %al,(%eax)
  c02a53:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c02a56:	00 00                	add    %al,(%eax)
  c02a58:	a8 d5                	test   $0xd5,%al
  c02a5a:	ff                   	(bad)  
  c02a5b:	ff 2d 00 00 00 00    	ljmp   *0x0
  c02a61:	41                   	inc    %ecx
  c02a62:	0e                   	push   %cs
  c02a63:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02a69:	46                   	inc    %esi
  c02a6a:	87 03                	xchg   %eax,(%ebx)
  c02a6c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c02a6f:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c02a74:	41                   	inc    %ecx
  c02a75:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c02a7c:	24 00                	and    $0x0,%al
  c02a7e:	00 00                	add    %al,(%eax)
  c02a80:	48                   	dec    %eax
  c02a81:	00 00                	add    %al,(%eax)
  c02a83:	00 a9 d5 ff ff 93    	add    %ch,-0x6c00002b(%ecx)
  c02a89:	01 00                	add    %eax,(%eax)
  c02a8b:	00 00                	add    %al,(%eax)
  c02a8d:	44                   	inc    %esp
  c02a8e:	0c 01                	or     $0x1,%al
  c02a90:	00 47 10             	add    %al,0x10(%edi)
  c02a93:	05 02 75 00 44       	add    $0x44007502,%eax
  c02a98:	0f 03 75 78          	lsl    0x78(%ebp),%esi
  c02a9c:	06                   	push   %es
  c02a9d:	10 03                	adc    %al,(%ebx)
  c02a9f:	02 75 7c             	add    0x7c(%ebp),%dh
  c02aa2:	00 00                	add    %al,(%eax)
  c02aa4:	20 00                	and    %al,(%eax)
  c02aa6:	00 00                	add    %al,(%eax)
  c02aa8:	70 00                	jo     c02aaa <_upperDigits+0x1f6>
  c02aaa:	00 00                	add    %al,(%eax)
  c02aac:	14 d7                	adc    $0xd7,%al
  c02aae:	ff                   	(bad)  
  c02aaf:	ff 73 00             	pushl  0x0(%ebx)
  c02ab2:	00 00                	add    %al,(%eax)
  c02ab4:	00 41 0e             	add    %al,0xe(%ecx)
  c02ab7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02abd:	44                   	inc    %esp
  c02abe:	83 03 02             	addl   $0x2,(%ebx)
  c02ac1:	6a c3                	push   $0xffffffc3
  c02ac3:	41                   	inc    %ecx
  c02ac4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c02ac7:	04 28                	add    $0x28,%al
  c02ac9:	00 00                	add    %al,(%eax)
  c02acb:	00 94 00 00 00 63 d7 	add    %dl,-0x289d0000(%eax,%eax,1)
  c02ad2:	ff                   	(bad)  
  c02ad3:	ff 14 01             	call   *(%ecx,%eax,1)
  c02ad6:	00 00                	add    %al,(%eax)
  c02ad8:	00 41 0e             	add    %al,0xe(%ecx)
  c02adb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02ae1:	42                   	inc    %edx
  c02ae2:	86 03                	xchg   %al,(%ebx)
  c02ae4:	83 04 03 0c          	addl   $0xc,(%ebx,%eax,1)
  c02ae8:	01 c3                	add    %eax,%ebx
  c02aea:	41                   	inc    %ecx
  c02aeb:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  c02aef:	04 04                	add    $0x4,%al
  c02af1:	00 00                	add    %al,(%eax)
  c02af3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c02af6:	00 00                	add    %al,(%eax)
  c02af8:	c0 00 00             	rolb   $0x0,(%eax)
  c02afb:	00 4b d8             	add    %cl,-0x28(%ebx)
  c02afe:	ff                   	(bad)  
  c02aff:	ff d3                	call   *%ebx
  c02b01:	01 00                	add    %eax,(%eax)
  c02b03:	00 00                	add    %al,(%eax)
  c02b05:	41                   	inc    %ecx
  c02b06:	0e                   	push   %cs
  c02b07:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02b0d:	03 cf                	add    %edi,%ecx
  c02b0f:	01 c5                	add    %eax,%ebp
  c02b11:	0c 04                	or     $0x4,%al
  c02b13:	04 1c                	add    $0x1c,%al
  c02b15:	00 00                	add    %al,(%eax)
  c02b17:	00 e0                	add    %ah,%al
  c02b19:	00 00                	add    %al,(%eax)
  c02b1b:	00 fe                	add    %bh,%dh
  c02b1d:	d9 ff                	fcos   
  c02b1f:	ff ac 00 00 00 00 41 	ljmp   *0x41000000(%eax,%eax,1)
  c02b26:	0e                   	push   %cs
  c02b27:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02b2d:	02 a8 c5 0c 04 04    	add    0x4040cc5(%eax),%ch
  c02b33:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c02b36:	00 00                	add    %al,(%eax)
  c02b38:	00 01                	add    %al,(%ecx)
  c02b3a:	00 00                	add    %al,(%eax)
  c02b3c:	8a da                	mov    %dl,%bl
  c02b3e:	ff                   	(bad)  
  c02b3f:	ff 53 00             	call   *0x0(%ebx)
  c02b42:	00 00                	add    %al,(%eax)
  c02b44:	00 41 0e             	add    %al,0xe(%ecx)
  c02b47:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02b4d:	02 4f c5             	add    -0x3b(%edi),%cl
  c02b50:	0c 04                	or     $0x4,%al
  c02b52:	04 00                	add    $0x0,%al
  c02b54:	28 00                	sub    %al,(%eax)
  c02b56:	00 00                	add    %al,(%eax)
  c02b58:	20 01                	and    %al,(%ecx)
  c02b5a:	00 00                	add    %al,(%eax)
  c02b5c:	bd da ff ff 70       	mov    $0x70ffffda,%ebp
  c02b61:	01 00                	add    %eax,(%eax)
  c02b63:	00 00                	add    %al,(%eax)
  c02b65:	41                   	inc    %ecx
  c02b66:	0e                   	push   %cs
  c02b67:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02b6d:	45                   	inc    %ebp
  c02b6e:	86 03                	xchg   %al,(%ebx)
  c02b70:	83 04 03 65          	addl   $0x65,(%ebx,%eax,1)
  c02b74:	01 c3                	add    %eax,%ebx
  c02b76:	41                   	inc    %ecx
  c02b77:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  c02b7b:	04 04                	add    $0x4,%al
  c02b7d:	00 00                	add    %al,(%eax)
  c02b7f:	00 24 00             	add    %ah,(%eax,%eax,1)
  c02b82:	00 00                	add    %al,(%eax)
  c02b84:	4c                   	dec    %esp
  c02b85:	01 00                	add    %eax,(%eax)
  c02b87:	00 01                	add    %al,(%ecx)
  c02b89:	dc ff                	fdivr  %st,%st(7)
  c02b8b:	ff                   	(bad)  
  c02b8c:	bf 00 00 00 00       	mov    $0x0,%edi
  c02b91:	41                   	inc    %ecx
  c02b92:	0e                   	push   %cs
  c02b93:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02b99:	45                   	inc    %ebp
  c02b9a:	86 03                	xchg   %al,(%ebx)
  c02b9c:	83 04 02 b4          	addl   $0xffffffb4,(%edx,%eax,1)
  c02ba0:	c3                   	ret    
  c02ba1:	41                   	inc    %ecx
  c02ba2:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  c02ba6:	04 04                	add    $0x4,%al
  c02ba8:	20 00                	and    %al,(%eax)
  c02baa:	00 00                	add    %al,(%eax)
  c02bac:	74 01                	je     c02baf <_upperDigits+0x2fb>
  c02bae:	00 00                	add    %al,(%eax)
  c02bb0:	98                   	cwtl   
  c02bb1:	dc ff                	fdivr  %st,%st(7)
  c02bb3:	ff                   	(bad)  
  c02bb4:	3f                   	aas    
  c02bb5:	02 00                	add    (%eax),%al
  c02bb7:	00 00                	add    %al,(%eax)
  c02bb9:	41                   	inc    %ecx
  c02bba:	0e                   	push   %cs
  c02bbb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02bc1:	44                   	inc    %esp
  c02bc2:	83 03 03             	addl   $0x3,(%ebx)
  c02bc5:	37                   	aaa    
  c02bc6:	02 c5                	add    %ch,%al
  c02bc8:	c3                   	ret    
  c02bc9:	0c 04                	or     $0x4,%al
  c02bcb:	04 1c                	add    $0x1c,%al
  c02bcd:	00 00                	add    %al,(%eax)
  c02bcf:	00 98 01 00 00 b3    	add    %bl,-0x4cffffff(%eax)
  c02bd5:	de ff                	fdivrp %st,%st(7)
  c02bd7:	ff 58 00             	lcall  *0x0(%eax)
  c02bda:	00 00                	add    %al,(%eax)
  c02bdc:	00 41 0e             	add    %al,0xe(%ecx)
  c02bdf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02be5:	02 54 c5 0c          	add    0xc(%ebp,%eax,8),%dl
  c02be9:	04 04                	add    $0x4,%al
  c02beb:	00 20                	add    %ah,(%eax)
  c02bed:	00 00                	add    %al,(%eax)
  c02bef:	00 b8 01 00 00 eb    	add    %bh,-0x14ffffff(%eax)
  c02bf5:	de ff                	fdivrp %st,%st(7)
  c02bf7:	ff 1c 02             	lcall  *(%edx,%eax,1)
  c02bfa:	00 00                	add    %al,(%eax)
  c02bfc:	00 41 0e             	add    %al,0xe(%ecx)
  c02bff:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02c05:	44                   	inc    %esp
  c02c06:	83 03 03             	addl   $0x3,(%ebx)
  c02c09:	14 02                	adc    $0x2,%al
  c02c0b:	c5 c3 0c             	(bad)  
  c02c0e:	04 04                	add    $0x4,%al
  c02c10:	1c 00                	sbb    $0x0,%al
  c02c12:	00 00                	add    %al,(%eax)
  c02c14:	dc 01                	faddl  (%ecx)
  c02c16:	00 00                	add    %al,(%eax)
  c02c18:	e3 e0                	jecxz  c02bfa <_upperDigits+0x346>
  c02c1a:	ff                   	(bad)  
  c02c1b:	ff 70 00             	pushl  0x0(%eax)
  c02c1e:	00 00                	add    %al,(%eax)
  c02c20:	00 41 0e             	add    %al,0xe(%ecx)
  c02c23:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02c29:	02 6c c5 0c          	add    0xc(%ebp,%eax,8),%ch
  c02c2d:	04 04                	add    $0x4,%al
  c02c2f:	00 20                	add    %ah,(%eax)
  c02c31:	00 00                	add    %al,(%eax)
  c02c33:	00 fc                	add    %bh,%ah
  c02c35:	01 00                	add    %eax,(%eax)
  c02c37:	00 33                	add    %dh,(%ebx)
  c02c39:	e1 ff                	loope  c02c3a <_upperDigits+0x386>
  c02c3b:	ff b7 02 00 00 00    	pushl  0x2(%edi)
  c02c41:	41                   	inc    %ecx
  c02c42:	0e                   	push   %cs
  c02c43:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02c49:	44                   	inc    %esp
  c02c4a:	83 03 03             	addl   $0x3,(%ebx)
  c02c4d:	af                   	scas   %es:(%edi),%eax
  c02c4e:	02 c5                	add    %ch,%al
  c02c50:	c3                   	ret    
  c02c51:	0c 04                	or     $0x4,%al
  c02c53:	04 1c                	add    $0x1c,%al
  c02c55:	00 00                	add    %al,(%eax)
  c02c57:	00 20                	add    %ah,(%eax)
  c02c59:	02 00                	add    (%eax),%al
  c02c5b:	00 c6                	add    %al,%dh
  c02c5d:	e3 ff                	jecxz  c02c5e <_upperDigits+0x3aa>
  c02c5f:	ff 58 00             	lcall  *0x0(%eax)
  c02c62:	00 00                	add    %al,(%eax)
  c02c64:	00 41 0e             	add    %al,0xe(%ecx)
  c02c67:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02c6d:	02 54 c5 0c          	add    0xc(%ebp,%eax,8),%dl
  c02c71:	04 04                	add    $0x4,%al
  c02c73:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c02c76:	00 00                	add    %al,(%eax)
  c02c78:	40                   	inc    %eax
  c02c79:	02 00                	add    (%eax),%al
  c02c7b:	00 fe                	add    %bh,%dh
  c02c7d:	e3 ff                	jecxz  c02c7e <_upperDigits+0x3ca>
  c02c7f:	ff 31                	pushl  (%ecx)
  c02c81:	00 00                	add    %al,(%eax)
  c02c83:	00 00                	add    %al,(%eax)
  c02c85:	41                   	inc    %ecx
  c02c86:	0e                   	push   %cs
  c02c87:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02c8d:	6d                   	insl   (%dx),%es:(%edi)
  c02c8e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c02c91:	04 00                	add    $0x0,%al
  c02c93:	00 28                	add    %ch,(%eax)
  c02c95:	00 00                	add    %al,(%eax)
  c02c97:	00 60 02             	add    %ah,0x2(%eax)
  c02c9a:	00 00                	add    %al,(%eax)
  c02c9c:	0f e4 ff             	pmulhuw %mm7,%mm7
  c02c9f:	ff 45 00             	incl   0x0(%ebp)
  c02ca2:	00 00                	add    %al,(%eax)
  c02ca4:	00 41 0e             	add    %al,0xe(%ecx)
  c02ca7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02cad:	46                   	inc    %esi
  c02cae:	87 03                	xchg   %eax,(%ebx)
  c02cb0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c02cb3:	05 78 c3 41 c6       	add    $0xc641c378,%eax
  c02cb8:	41                   	inc    %ecx
  c02cb9:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c02cc0:	1c 00                	sbb    $0x0,%al
  c02cc2:	00 00                	add    %al,(%eax)
  c02cc4:	8c 02                	mov    %es,(%edx)
  c02cc6:	00 00                	add    %al,(%eax)
  c02cc8:	28 e4                	sub    %ah,%ah
  c02cca:	ff                   	(bad)  
  c02ccb:	ff 2c 00             	ljmp   *(%eax,%eax,1)
  c02cce:	00 00                	add    %al,(%eax)
  c02cd0:	00 41 0e             	add    %al,0xe(%ecx)
  c02cd3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02cd9:	68 c5 0c 04 04       	push   $0x4040cc5
  c02cde:	00 00                	add    %al,(%eax)
  c02ce0:	1c 00                	sbb    $0x0,%al
  c02ce2:	00 00                	add    %al,(%eax)
  c02ce4:	ac                   	lods   %ds:(%esi),%al
  c02ce5:	02 00                	add    (%eax),%al
  c02ce7:	00 34 e4             	add    %dh,(%esp,%eiz,8)
  c02cea:	ff                   	(bad)  
  c02ceb:	ff 0a                	decl   (%edx)
  c02ced:	00 00                	add    %al,(%eax)
  c02cef:	00 00                	add    %al,(%eax)
  c02cf1:	41                   	inc    %ecx
  c02cf2:	0e                   	push   %cs
  c02cf3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02cf9:	46                   	inc    %esi
  c02cfa:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c02cfd:	04 00                	add    $0x0,%al
  c02cff:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c02d02:	00 00                	add    %al,(%eax)
  c02d04:	cc                   	int3   
  c02d05:	02 00                	add    (%eax),%al
  c02d07:	00 1e                	add    %bl,(%esi)
  c02d09:	e4 ff                	in     $0xff,%al
  c02d0b:	ff 4a 00             	decl   0x0(%edx)
  c02d0e:	00 00                	add    %al,(%eax)
  c02d10:	00 41 0e             	add    %al,0xe(%ecx)
  c02d13:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02d19:	02 46 c5             	add    -0x3b(%esi),%al
  c02d1c:	0c 04                	or     $0x4,%al
  c02d1e:	04 00                	add    $0x0,%al
  c02d20:	20 00                	and    %al,(%eax)
  c02d22:	00 00                	add    %al,(%eax)
  c02d24:	ec                   	in     (%dx),%al
  c02d25:	02 00                	add    (%eax),%al
  c02d27:	00 48 e4             	add    %cl,-0x1c(%eax)
  c02d2a:	ff                   	(bad)  
  c02d2b:	ff 2f                	ljmp   *(%edi)
  c02d2d:	00 00                	add    %al,(%eax)
  c02d2f:	00 00                	add    %al,(%eax)
  c02d31:	41                   	inc    %ecx
  c02d32:	0e                   	push   %cs
  c02d33:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02d39:	44                   	inc    %esp
  c02d3a:	83 03 67             	addl   $0x67,(%ebx)
  c02d3d:	c5 c3 0c             	(bad)  
  c02d40:	04 04                	add    $0x4,%al
  c02d42:	00 00                	add    %al,(%eax)
  c02d44:	1c 00                	sbb    $0x0,%al
  c02d46:	00 00                	add    %al,(%eax)
  c02d48:	10 03                	adc    %al,(%ebx)
  c02d4a:	00 00                	add    %al,(%eax)
  c02d4c:	53                   	push   %ebx
  c02d4d:	e4 ff                	in     $0xff,%al
  c02d4f:	ff 21                	jmp    *(%ecx)
  c02d51:	00 00                	add    %al,(%eax)
  c02d53:	00 00                	add    %al,(%eax)
  c02d55:	41                   	inc    %ecx
  c02d56:	0e                   	push   %cs
  c02d57:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02d5d:	5d                   	pop    %ebp
  c02d5e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c02d61:	04 00                	add    $0x0,%al
  c02d63:	00 20                	add    %ah,(%eax)
  c02d65:	00 00                	add    %al,(%eax)
  c02d67:	00 30                	add    %dh,(%eax)
  c02d69:	03 00                	add    (%eax),%eax
  c02d6b:	00 54 e4 ff          	add    %dl,-0x1(%esp,%eiz,8)
  c02d6f:	ff 6b 00             	ljmp   *0x0(%ebx)
  c02d72:	00 00                	add    %al,(%eax)
  c02d74:	00 41 0e             	add    %al,0xe(%ecx)
  c02d77:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02d7d:	44                   	inc    %esp
  c02d7e:	83 03 02             	addl   $0x2,(%ebx)
  c02d81:	63 c5                	arpl   %ax,%bp
  c02d83:	c3                   	ret    
  c02d84:	0c 04                	or     $0x4,%al
  c02d86:	04 00                	add    $0x0,%al
  c02d88:	1c 00                	sbb    $0x0,%al
  c02d8a:	00 00                	add    %al,(%eax)
  c02d8c:	54                   	push   %esp
  c02d8d:	03 00                	add    (%eax),%eax
  c02d8f:	00 9b e4 ff ff 92    	add    %bl,-0x6d00001c(%ebx)
  c02d95:	00 00                	add    %al,(%eax)
  c02d97:	00 00                	add    %al,(%eax)
  c02d99:	41                   	inc    %ecx
  c02d9a:	0e                   	push   %cs
  c02d9b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02da1:	02 8e c5 0c 04 04    	add    0x4040cc5(%esi),%cl
  c02da7:	00 20                	add    %ah,(%eax)
  c02da9:	00 00                	add    %al,(%eax)
  c02dab:	00 74 03 00          	add    %dh,0x0(%ebx,%eax,1)
  c02daf:	00 0d e5 ff ff 2f    	add    %cl,0x2fffffe5
  c02db5:	00 00                	add    %al,(%eax)
  c02db7:	00 00                	add    %al,(%eax)
  c02db9:	41                   	inc    %ecx
  c02dba:	0e                   	push   %cs
  c02dbb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02dc1:	41                   	inc    %ecx
  c02dc2:	83 03 69             	addl   $0x69,(%ebx)
  c02dc5:	c3                   	ret    
  c02dc6:	41                   	inc    %ecx
  c02dc7:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c02dca:	04 00                	add    $0x0,%al
  c02dcc:	24 00                	and    $0x0,%al
  c02dce:	00 00                	add    %al,(%eax)
  c02dd0:	98                   	cwtl   
  c02dd1:	03 00                	add    (%eax),%eax
  c02dd3:	00 18                	add    %bl,(%eax)
  c02dd5:	e5 ff                	in     $0xff,%eax
  c02dd7:	ff                   	(bad)  
  c02dd8:	38 00                	cmp    %al,(%eax)
  c02dda:	00 00                	add    %al,(%eax)
  c02ddc:	00 41 0e             	add    %al,0xe(%ecx)
  c02ddf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02de5:	42                   	inc    %edx
  c02de6:	86 03                	xchg   %al,(%ebx)
  c02de8:	83 04 70 c3          	addl   $0xffffffc3,(%eax,%esi,2)
  c02dec:	41                   	inc    %ecx
  c02ded:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  c02df1:	04 04                	add    $0x4,%al
  c02df3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c02df6:	00 00                	add    %al,(%eax)
  c02df8:	c0 03 00             	rolb   $0x0,(%ebx)
  c02dfb:	00 28                	add    %ch,(%eax)
  c02dfd:	e5 ff                	in     $0xff,%eax
  c02dff:	ff 4c 00 00          	decl   0x0(%eax,%eax,1)
  c02e03:	00 00                	add    %al,(%eax)
  c02e05:	41                   	inc    %ecx
  c02e06:	0e                   	push   %cs
  c02e07:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02e0d:	02 48 c5             	add    -0x3b(%eax),%cl
  c02e10:	0c 04                	or     $0x4,%al
  c02e12:	04 00                	add    $0x0,%al
  c02e14:	1c 00                	sbb    $0x0,%al
  c02e16:	00 00                	add    %al,(%eax)
  c02e18:	e0 03                	loopne c02e1d <_upperDigits+0x569>
  c02e1a:	00 00                	add    %al,(%eax)
  c02e1c:	54                   	push   %esp
  c02e1d:	e5 ff                	in     $0xff,%eax
  c02e1f:	ff 8d 00 00 00 00    	decl   0x0(%ebp)
  c02e25:	41                   	inc    %ecx
  c02e26:	0e                   	push   %cs
  c02e27:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02e2d:	02 89 c5 0c 04 04    	add    0x4040cc5(%ecx),%cl
  c02e33:	00 24 00             	add    %ah,(%eax,%eax,1)
  c02e36:	00 00                	add    %al,(%eax)
  c02e38:	00 04 00             	add    %al,(%eax,%eax,1)
  c02e3b:	00 c1                	add    %al,%cl
  c02e3d:	e5 ff                	in     $0xff,%eax
  c02e3f:	ff 61 00             	jmp    *0x0(%ecx)
  c02e42:	00 00                	add    %al,(%eax)
  c02e44:	00 41 0e             	add    %al,0xe(%ecx)
  c02e47:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02e4d:	42                   	inc    %edx
  c02e4e:	86 03                	xchg   %al,(%ebx)
  c02e50:	83 04 02 59          	addl   $0x59,(%edx,%eax,1)
  c02e54:	c3                   	ret    
  c02e55:	41                   	inc    %ecx
  c02e56:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  c02e5a:	04 04                	add    $0x4,%al
  c02e5c:	1c 00                	sbb    $0x0,%al
  c02e5e:	00 00                	add    %al,(%eax)
  c02e60:	28 04 00             	sub    %al,(%eax,%eax,1)
  c02e63:	00 fa                	add    %bh,%dl
  c02e65:	e5 ff                	in     $0xff,%eax
  c02e67:	ff 1c 00             	lcall  *(%eax,%eax,1)
  c02e6a:	00 00                	add    %al,(%eax)
  c02e6c:	00 41 0e             	add    %al,0xe(%ecx)
  c02e6f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02e75:	58                   	pop    %eax
  c02e76:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c02e79:	04 00                	add    $0x0,%al
  c02e7b:	00 2c 00             	add    %ch,(%eax,%eax,1)
  c02e7e:	00 00                	add    %al,(%eax)
  c02e80:	48                   	dec    %eax
  c02e81:	04 00                	add    $0x0,%al
  c02e83:	00 f6                	add    %dh,%dh
  c02e85:	e5 ff                	in     $0xff,%eax
  c02e87:	ff 67 01             	jmp    *0x1(%edi)
  c02e8a:	00 00                	add    %al,(%eax)
  c02e8c:	00 41 0e             	add    %al,0xe(%ecx)
  c02e8f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02e95:	46                   	inc    %esi
  c02e96:	87 03                	xchg   %eax,(%ebx)
  c02e98:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c02e9b:	05 03 5a 01 c3       	add    $0xc3015a03,%eax
  c02ea0:	41                   	inc    %ecx
  c02ea1:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c02ea5:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c02ea8:	04 00                	add    $0x0,%al
  c02eaa:	00 00                	add    %al,(%eax)
  c02eac:	1c 00                	sbb    $0x0,%al
  c02eae:	00 00                	add    %al,(%eax)
  c02eb0:	78 04                	js     c02eb6 <_upperDigits+0x602>
  c02eb2:	00 00                	add    %al,(%eax)
  c02eb4:	2d e7 ff ff 4d       	sub    $0x4dffffe7,%eax
  c02eb9:	00 00                	add    %al,(%eax)
  c02ebb:	00 00                	add    %al,(%eax)
  c02ebd:	41                   	inc    %ecx
  c02ebe:	0e                   	push   %cs
  c02ebf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02ec5:	02 49 c5             	add    -0x3b(%ecx),%cl
  c02ec8:	0c 04                	or     $0x4,%al
  c02eca:	04 00                	add    $0x0,%al
  c02ecc:	24 00                	and    $0x0,%al
  c02ece:	00 00                	add    %al,(%eax)
  c02ed0:	98                   	cwtl   
  c02ed1:	04 00                	add    $0x0,%al
  c02ed3:	00 5a e7             	add    %bl,-0x19(%edx)
  c02ed6:	ff                   	(bad)  
  c02ed7:	ff 46 00             	incl   0x0(%esi)
  c02eda:	00 00                	add    %al,(%eax)
  c02edc:	00 41 0e             	add    %al,0xe(%ecx)
  c02edf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02ee5:	42                   	inc    %edx
  c02ee6:	86 03                	xchg   %al,(%ebx)
  c02ee8:	83 04 7e c3          	addl   $0xffffffc3,(%esi,%edi,2)
  c02eec:	41                   	inc    %ecx
  c02eed:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  c02ef1:	04 04                	add    $0x4,%al
  c02ef3:	00 28                	add    %ch,(%eax)
  c02ef5:	00 00                	add    %al,(%eax)
  c02ef7:	00 c0                	add    %al,%al
  c02ef9:	04 00                	add    $0x0,%al
  c02efb:	00 78 e7             	add    %bh,-0x19(%eax)
  c02efe:	ff                   	(bad)  
  c02eff:	ff 8b 00 00 00 00    	decl   0x0(%ebx)
  c02f05:	41                   	inc    %ecx
  c02f06:	0e                   	push   %cs
  c02f07:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02f0d:	46                   	inc    %esi
  c02f0e:	87 03                	xchg   %eax,(%ebx)
  c02f10:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c02f13:	05 02 7e c3 41       	add    $0x41c37e02,%eax
  c02f18:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c02f1c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c02f1f:	04 28                	add    $0x28,%al
  c02f21:	00 00                	add    %al,(%eax)
  c02f23:	00 ec                	add    %ch,%ah
  c02f25:	04 00                	add    $0x0,%al
  c02f27:	00 d8                	add    %bl,%al
  c02f29:	e7 ff                	out    %eax,$0xff
  c02f2b:	ff 2d 00 00 00 00    	ljmp   *0x0
  c02f31:	41                   	inc    %ecx
  c02f32:	0e                   	push   %cs
  c02f33:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02f39:	46                   	inc    %esi
  c02f3a:	87 03                	xchg   %eax,(%ebx)
  c02f3c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c02f3f:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c02f44:	41                   	inc    %ecx
  c02f45:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c02f4c:	1c 00                	sbb    $0x0,%al
  c02f4e:	00 00                	add    %al,(%eax)
  c02f50:	18 05 00 00 d9 e7    	sbb    %al,0xe7d90000
  c02f56:	ff                   	(bad)  
  c02f57:	ff 32                	pushl  (%edx)
  c02f59:	00 00                	add    %al,(%eax)
  c02f5b:	00 00                	add    %al,(%eax)
  c02f5d:	41                   	inc    %ecx
  c02f5e:	0e                   	push   %cs
  c02f5f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02f65:	6e                   	outsb  %ds:(%esi),(%dx)
  c02f66:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c02f69:	04 00                	add    $0x0,%al
  c02f6b:	00 28                	add    %ch,(%eax)
  c02f6d:	00 00                	add    %al,(%eax)
  c02f6f:	00 38                	add    %bh,(%eax)
  c02f71:	05 00 00 ec e7       	add    $0xe7ec0000,%eax
  c02f76:	ff                   	(bad)  
  c02f77:	ff 2d 00 00 00 00    	ljmp   *0x0
  c02f7d:	41                   	inc    %ecx
  c02f7e:	0e                   	push   %cs
  c02f7f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02f85:	46                   	inc    %esi
  c02f86:	87 03                	xchg   %eax,(%ebx)
  c02f88:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c02f8b:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c02f90:	41                   	inc    %ecx
  c02f91:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c02f98:	1c 00                	sbb    $0x0,%al
  c02f9a:	00 00                	add    %al,(%eax)
  c02f9c:	64                   	fs
  c02f9d:	05 00 00 ed e7       	add    $0xe7ed0000,%eax
  c02fa2:	ff                   	(bad)  
  c02fa3:	ff 08                	decl   (%eax)
  c02fa5:	00 00                	add    %al,(%eax)
  c02fa7:	00 00                	add    %al,(%eax)
  c02fa9:	41                   	inc    %ecx
  c02faa:	0e                   	push   %cs
  c02fab:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02fb1:	44                   	inc    %esp
  c02fb2:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c02fb5:	04 00                	add    $0x0,%al
  c02fb7:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c02fba:	00 00                	add    %al,(%eax)
  c02fbc:	84 05 00 00 d5 e7    	test   %al,0xe7d50000
  c02fc2:	ff                   	(bad)  
  c02fc3:	ff                   	(bad)  
  c02fc4:	3e 00 00             	add    %al,%ds:(%eax)
  c02fc7:	00 00                	add    %al,(%eax)
  c02fc9:	41                   	inc    %ecx
  c02fca:	0e                   	push   %cs
  c02fcb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02fd1:	7a c5                	jp     c02f98 <_upperDigits+0x6e4>
  c02fd3:	0c 04                	or     $0x4,%al
  c02fd5:	04 00                	add    $0x0,%al
  c02fd7:	00 28                	add    %ch,(%eax)
  c02fd9:	00 00                	add    %al,(%eax)
  c02fdb:	00 a4 05 00 00 f4 e7 	add    %ah,-0x180c0000(%ebp,%eax,1)
  c02fe2:	ff                   	(bad)  
  c02fe3:	ff 2d 00 00 00 00    	ljmp   *0x0
  c02fe9:	41                   	inc    %ecx
  c02fea:	0e                   	push   %cs
  c02feb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c02ff1:	46                   	inc    %esi
  c02ff2:	87 03                	xchg   %eax,(%ebx)
  c02ff4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c02ff7:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c02ffc:	41                   	inc    %ecx
  c02ffd:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c03004:	1c 00                	sbb    $0x0,%al
  c03006:	00 00                	add    %al,(%eax)
  c03008:	d0 05 00 00 f5 e7    	rolb   0xe7f50000
  c0300e:	ff                   	(bad)  
  c0300f:	ff                   	(bad)  
  c03010:	3f                   	aas    
  c03011:	00 00                	add    %al,(%eax)
  c03013:	00 00                	add    %al,(%eax)
  c03015:	41                   	inc    %ecx
  c03016:	0e                   	push   %cs
  c03017:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0301d:	7b c5                	jnp    c02fe4 <_upperDigits+0x730>
  c0301f:	0c 04                	or     $0x4,%al
  c03021:	04 00                	add    $0x0,%al
  c03023:	00 28                	add    %ch,(%eax)
  c03025:	00 00                	add    %al,(%eax)
  c03027:	00 f0                	add    %dh,%al
  c03029:	05 00 00 14 e8       	add    $0xe8140000,%eax
  c0302e:	ff                   	(bad)  
  c0302f:	ff 2d 00 00 00 00    	ljmp   *0x0
  c03035:	41                   	inc    %ecx
  c03036:	0e                   	push   %cs
  c03037:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0303d:	46                   	inc    %esi
  c0303e:	87 03                	xchg   %eax,(%ebx)
  c03040:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c03043:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c03048:	41                   	inc    %ecx
  c03049:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c03050:	24 00                	and    $0x0,%al
  c03052:	00 00                	add    %al,(%eax)
  c03054:	1c 06                	sbb    $0x6,%al
  c03056:	00 00                	add    %al,(%eax)
  c03058:	15 e8 ff ff 1d       	adc    $0x1dffffe8,%eax
  c0305d:	00 00                	add    %al,(%eax)
  c0305f:	00 00                	add    %al,(%eax)
  c03061:	41                   	inc    %ecx
  c03062:	0e                   	push   %cs
  c03063:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c03069:	42                   	inc    %edx
  c0306a:	87 03                	xchg   %eax,(%ebx)
  c0306c:	86 04 55 c6 41 c7 41 	xchg   %al,0x41c741c6(,%edx,2)
  c03073:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c03076:	04 00                	add    $0x0,%al
  c03078:	28 00                	sub    %al,(%eax)
  c0307a:	00 00                	add    %al,(%eax)
  c0307c:	44                   	inc    %esp
  c0307d:	06                   	push   %es
  c0307e:	00 00                	add    %al,(%eax)
  c03080:	0a e8                	or     %al,%ch
  c03082:	ff                   	(bad)  
  c03083:	ff 2c 00             	ljmp   *(%eax,%eax,1)
  c03086:	00 00                	add    %al,(%eax)
  c03088:	00 41 0e             	add    %al,0xe(%ecx)
  c0308b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c03091:	43                   	inc    %ebx
  c03092:	87 03                	xchg   %eax,(%ebx)
  c03094:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c03097:	05 62 c3 41 c6       	add    $0xc641c362,%eax
  c0309c:	41                   	inc    %ecx
  c0309d:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c030a4:	20 00                	and    %al,(%eax)
  c030a6:	00 00                	add    %al,(%eax)
  c030a8:	70 06                	jo     c030b0 <_upperDigits+0x7fc>
  c030aa:	00 00                	add    %al,(%eax)
  c030ac:	0a e8                	or     %al,%ch
  c030ae:	ff                   	(bad)  
  c030af:	ff 1e                	lcall  *(%esi)
  c030b1:	00 00                	add    %al,(%eax)
  c030b3:	00 00                	add    %al,(%eax)
  c030b5:	41                   	inc    %ecx
  c030b6:	0e                   	push   %cs
  c030b7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c030bd:	41                   	inc    %ecx
  c030be:	87 03                	xchg   %eax,(%ebx)
  c030c0:	58                   	pop    %eax
  c030c1:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c030c8:	2c 00                	sub    $0x0,%al
  c030ca:	00 00                	add    %al,(%eax)
  c030cc:	94                   	xchg   %eax,%esp
  c030cd:	06                   	push   %es
  c030ce:	00 00                	add    %al,(%eax)
  c030d0:	04 e8                	add    $0xe8,%al
  c030d2:	ff                   	(bad)  
  c030d3:	ff a7 01 00 00 00    	jmp    *0x1(%edi)
  c030d9:	41                   	inc    %ecx
  c030da:	0e                   	push   %cs
  c030db:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c030e1:	49                   	dec    %ecx
  c030e2:	87 03                	xchg   %eax,(%ebx)
  c030e4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c030e7:	05 03 97 01 c3       	add    $0xc3019703,%eax
  c030ec:	41                   	inc    %ecx
  c030ed:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c030f1:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c030f4:	04 00                	add    $0x0,%al
  c030f6:	00 00                	add    %al,(%eax)
  c030f8:	1c 00                	sbb    $0x0,%al
  c030fa:	00 00                	add    %al,(%eax)
  c030fc:	c4 06                	les    (%esi),%eax
  c030fe:	00 00                	add    %al,(%eax)
  c03100:	7b e9                	jnp    c030eb <_upperDigits+0x837>
  c03102:	ff                   	(bad)  
  c03103:	ff 53 00             	call   *0x0(%ebx)
  c03106:	00 00                	add    %al,(%eax)
  c03108:	00 41 0e             	add    %al,0xe(%ecx)
  c0310b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c03111:	02 4f c5             	add    -0x3b(%edi),%cl
  c03114:	0c 04                	or     $0x4,%al
  c03116:	04 00                	add    $0x0,%al
  c03118:	28 00                	sub    %al,(%eax)
  c0311a:	00 00                	add    %al,(%eax)
  c0311c:	e4 06                	in     $0x6,%al
  c0311e:	00 00                	add    %al,(%eax)
  c03120:	c8 e9 ff ff          	enter  $0xffe9,$0xff
  c03124:	2d 00 00 00 00       	sub    $0x0,%eax
  c03129:	41                   	inc    %ecx
  c0312a:	0e                   	push   %cs
  c0312b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c03131:	46                   	inc    %esi
  c03132:	87 03                	xchg   %eax,(%ebx)
  c03134:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c03137:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c0313c:	41                   	inc    %ecx
  c0313d:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c03144:	28 00                	sub    %al,(%eax)
  c03146:	00 00                	add    %al,(%eax)
  c03148:	10 07                	adc    %al,(%edi)
  c0314a:	00 00                	add    %al,(%eax)
  c0314c:	c9                   	leave  
  c0314d:	e9 ff ff 94 00       	jmp    1553151 <_end+0x94c8d1>
  c03152:	00 00                	add    %al,(%eax)
  c03154:	00 41 0e             	add    %al,0xe(%ecx)
  c03157:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0315d:	46                   	inc    %esi
  c0315e:	87 03                	xchg   %eax,(%ebx)
  c03160:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c03163:	05 02 87 c3 41       	add    $0x41c38702,%eax
  c03168:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c0316c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c0316f:	04 28                	add    $0x28,%al
  c03171:	00 00                	add    %al,(%eax)
  c03173:	00 3c 07             	add    %bh,(%edi,%eax,1)
  c03176:	00 00                	add    %al,(%eax)
  c03178:	34 ea                	xor    $0xea,%al
  c0317a:	ff                   	(bad)  
  c0317b:	ff 2d 00 00 00 00    	ljmp   *0x0
  c03181:	41                   	inc    %ecx
  c03182:	0e                   	push   %cs
  c03183:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c03189:	46                   	inc    %esi
  c0318a:	87 03                	xchg   %eax,(%ebx)
  c0318c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c0318f:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c03194:	41                   	inc    %ecx
  c03195:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c0319c:	20 00                	and    %al,(%eax)
  c0319e:	00 00                	add    %al,(%eax)
  c031a0:	68 07 00 00 35       	push   $0x35000007
  c031a5:	ea ff ff 1e 00 00 00 	ljmp   $0x0,$0x1effff
  c031ac:	00 41 0e             	add    %al,0xe(%ecx)
  c031af:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c031b5:	41                   	inc    %ecx
  c031b6:	87 03                	xchg   %eax,(%ebx)
  c031b8:	58                   	pop    %eax
  c031b9:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c031c0:	28 00                	sub    %al,(%eax)
  c031c2:	00 00                	add    %al,(%eax)
  c031c4:	8c 07                	mov    %es,(%edi)
  c031c6:	00 00                	add    %al,(%eax)
  c031c8:	2f                   	das    
  c031c9:	ea ff ff a5 00 00 00 	ljmp   $0x0,$0xa5ffff
  c031d0:	00 41 0e             	add    %al,0xe(%ecx)
  c031d3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c031d9:	46                   	inc    %esi
  c031da:	87 03                	xchg   %eax,(%ebx)
  c031dc:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c031df:	05 02 98 c3 41       	add    $0x41c39802,%eax
  c031e4:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c031e8:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c031eb:	04 1c                	add    $0x1c,%al
  c031ed:	00 00                	add    %al,(%eax)
  c031ef:	00 b8 07 00 00 a8    	add    %bh,-0x57fffff9(%eax)
  c031f5:	ea ff ff 33 00 00 00 	ljmp   $0x0,$0x33ffff
  c031fc:	00 41 0e             	add    %al,0xe(%ecx)
  c031ff:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c03205:	6f                   	outsl  %ds:(%esi),(%dx)
  c03206:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c03209:	04 00                	add    $0x0,%al
  c0320b:	00 28                	add    %ch,(%eax)
  c0320d:	00 00                	add    %al,(%eax)
  c0320f:	00 d8                	add    %bl,%al
  c03211:	07                   	pop    %es
  c03212:	00 00                	add    %al,(%eax)
  c03214:	bc ea ff ff 2d       	mov    $0x2dffffea,%esp
  c03219:	00 00                	add    %al,(%eax)
  c0321b:	00 00                	add    %al,(%eax)
  c0321d:	41                   	inc    %ecx
  c0321e:	0e                   	push   %cs
  c0321f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c03225:	46                   	inc    %esi
  c03226:	87 03                	xchg   %eax,(%ebx)
  c03228:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c0322b:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c03230:	41                   	inc    %ecx
  c03231:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c03238:	28 00                	sub    %al,(%eax)
  c0323a:	00 00                	add    %al,(%eax)
  c0323c:	04 08                	add    $0x8,%al
  c0323e:	00 00                	add    %al,(%eax)
  c03240:	bd ea ff ff 20       	mov    $0x20ffffea,%ebp
  c03245:	00 00                	add    %al,(%eax)
  c03247:	00 00                	add    %al,(%eax)
  c03249:	41                   	inc    %ecx
  c0324a:	0e                   	push   %cs
  c0324b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c03251:	43                   	inc    %ebx
  c03252:	87 03                	xchg   %eax,(%ebx)
  c03254:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c03257:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  c0325c:	41                   	inc    %ecx
  c0325d:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c03264:	28 00                	sub    %al,(%eax)
  c03266:	00 00                	add    %al,(%eax)
  c03268:	30 08                	xor    %cl,(%eax)
  c0326a:	00 00                	add    %al,(%eax)
  c0326c:	b1 ea                	mov    $0xea,%cl
  c0326e:	ff                   	(bad)  
  c0326f:	ff 9f 00 00 00 00    	lcall  *0x0(%edi)
  c03275:	41                   	inc    %ecx
  c03276:	0e                   	push   %cs
  c03277:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0327d:	46                   	inc    %esi
  c0327e:	87 03                	xchg   %eax,(%ebx)
  c03280:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c03283:	05 02 92 c3 41       	add    $0x41c39202,%eax
  c03288:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c0328c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c0328f:	04 28                	add    $0x28,%al
  c03291:	00 00                	add    %al,(%eax)
  c03293:	00 5c 08 00          	add    %bl,0x0(%eax,%ecx,1)
  c03297:	00 24 eb             	add    %ah,(%ebx,%ebp,8)
  c0329a:	ff                   	(bad)  
  c0329b:	ff 2d 00 00 00 00    	ljmp   *0x0
  c032a1:	41                   	inc    %ecx
  c032a2:	0e                   	push   %cs
  c032a3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c032a9:	46                   	inc    %esi
  c032aa:	87 03                	xchg   %eax,(%ebx)
  c032ac:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c032af:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c032b4:	41                   	inc    %ecx
  c032b5:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c032bc:	1c 00                	sbb    $0x0,%al
  c032be:	00 00                	add    %al,(%eax)
  c032c0:	88 08                	mov    %cl,(%eax)
  c032c2:	00 00                	add    %al,(%eax)
  c032c4:	25 eb ff ff 38       	and    $0x38ffffeb,%eax
  c032c9:	00 00                	add    %al,(%eax)
  c032cb:	00 00                	add    %al,(%eax)
  c032cd:	41                   	inc    %ecx
  c032ce:	0e                   	push   %cs
  c032cf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c032d5:	74 c5                	je     c0329c <_upperDigits+0x9e8>
  c032d7:	0c 04                	or     $0x4,%al
  c032d9:	04 00                	add    $0x0,%al
  c032db:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c032de:	00 00                	add    %al,(%eax)
  c032e0:	a8 08                	test   $0x8,%al
  c032e2:	00 00                	add    %al,(%eax)
  c032e4:	40                   	inc    %eax
  c032e5:	eb ff                	jmp    c032e6 <_upperDigits+0xa32>
  c032e7:	ff 4a 00             	decl   0x0(%edx)
  c032ea:	00 00                	add    %al,(%eax)
  c032ec:	00 41 0e             	add    %al,0xe(%ecx)
  c032ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c032f5:	02 46 c5             	add    -0x3b(%esi),%al
  c032f8:	0c 04                	or     $0x4,%al
  c032fa:	04 00                	add    $0x0,%al
  c032fc:	20 00                	and    %al,(%eax)
  c032fe:	00 00                	add    %al,(%eax)
  c03300:	c8 08 00 00          	enter  $0x8,$0x0
  c03304:	6c                   	insb   (%dx),%es:(%edi)
  c03305:	eb ff                	jmp    c03306 <_upperDigits+0xa52>
  c03307:	ff 1e                	lcall  *(%esi)
  c03309:	00 00                	add    %al,(%eax)
  c0330b:	00 00                	add    %al,(%eax)
  c0330d:	41                   	inc    %ecx
  c0330e:	0e                   	push   %cs
  c0330f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c03315:	41                   	inc    %ecx
  c03316:	87 03                	xchg   %eax,(%ebx)
  c03318:	58                   	pop    %eax
  c03319:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c03320:	28 00                	sub    %al,(%eax)
  c03322:	00 00                	add    %al,(%eax)
  c03324:	ec                   	in     (%dx),%al
  c03325:	08 00                	or     %al,(%eax)
  c03327:	00 66 eb             	add    %ah,-0x15(%esi)
  c0332a:	ff                   	(bad)  
  c0332b:	ff 20                	jmp    *(%eax)
  c0332d:	00 00                	add    %al,(%eax)
  c0332f:	00 00                	add    %al,(%eax)
  c03331:	41                   	inc    %ecx
  c03332:	0e                   	push   %cs
  c03333:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c03339:	43                   	inc    %ebx
  c0333a:	87 03                	xchg   %eax,(%ebx)
  c0333c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c0333f:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  c03344:	41                   	inc    %ecx
  c03345:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c0334c:	20 00                	and    %al,(%eax)
  c0334e:	00 00                	add    %al,(%eax)
  c03350:	18 09                	sbb    %cl,(%ecx)
  c03352:	00 00                	add    %al,(%eax)
  c03354:	5a                   	pop    %edx
  c03355:	eb ff                	jmp    c03356 <_upperDigits+0xaa2>
  c03357:	ff 5a 00             	lcall  *0x0(%edx)
  c0335a:	00 00                	add    %al,(%eax)
  c0335c:	00 41 0e             	add    %al,0xe(%ecx)
  c0335f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c03365:	44                   	inc    %esp
  c03366:	83 03 02             	addl   $0x2,(%ebx)
  c03369:	51                   	push   %ecx
  c0336a:	c3                   	ret    
  c0336b:	41                   	inc    %ecx
  c0336c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c0336f:	04 1c                	add    $0x1c,%al
  c03371:	00 00                	add    %al,(%eax)
  c03373:	00 3c 09             	add    %bh,(%ecx,%ecx,1)
  c03376:	00 00                	add    %al,(%eax)
  c03378:	90                   	nop
  c03379:	eb ff                	jmp    c0337a <_upperDigits+0xac6>
  c0337b:	ff 31                	pushl  (%ecx)
  c0337d:	00 00                	add    %al,(%eax)
  c0337f:	00 00                	add    %al,(%eax)
  c03381:	41                   	inc    %ecx
  c03382:	0e                   	push   %cs
  c03383:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c03389:	6d                   	insl   (%dx),%es:(%edi)
  c0338a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c0338d:	04 00                	add    $0x0,%al
  c0338f:	00 20                	add    %ah,(%eax)
  c03391:	00 00                	add    %al,(%eax)
  c03393:	00 5c 09 00          	add    %bl,0x0(%ecx,%ecx,1)
  c03397:	00 a1 eb ff ff 5c    	add    %ah,0x5cffffeb(%ecx)
  c0339d:	00 00                	add    %al,(%eax)
  c0339f:	00 00                	add    %al,(%eax)
  c033a1:	41                   	inc    %ecx
  c033a2:	0e                   	push   %cs
  c033a3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c033a9:	44                   	inc    %esp
  c033aa:	83 03 02             	addl   $0x2,(%ebx)
  c033ad:	53                   	push   %ebx
  c033ae:	c3                   	ret    
  c033af:	41                   	inc    %ecx
  c033b0:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c033b3:	04 1c                	add    $0x1c,%al
  c033b5:	00 00                	add    %al,(%eax)
  c033b7:	00 80 09 00 00 d9    	add    %al,-0x26fffff7(%eax)
  c033bd:	eb ff                	jmp    c033be <_upperDigits+0xb0a>
  c033bf:	ff 31                	pushl  (%ecx)
  c033c1:	00 00                	add    %al,(%eax)
  c033c3:	00 00                	add    %al,(%eax)
  c033c5:	41                   	inc    %ecx
  c033c6:	0e                   	push   %cs
  c033c7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c033cd:	6d                   	insl   (%dx),%es:(%edi)
  c033ce:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c033d1:	04 00                	add    $0x0,%al
  c033d3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c033d6:	00 00                	add    %al,(%eax)
  c033d8:	a0 09 00 00 ea       	mov    0xea000009,%al
  c033dd:	eb ff                	jmp    c033de <_upperDigits+0xb2a>
  c033df:	ff 23                	jmp    *(%ebx)
  c033e1:	02 00                	add    (%eax),%al
  c033e3:	00 00                	add    %al,(%eax)
  c033e5:	41                   	inc    %ecx
  c033e6:	0e                   	push   %cs
  c033e7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c033ed:	03 1f                	add    (%edi),%ebx
  c033ef:	02 c5                	add    %ch,%al
  c033f1:	0c 04                	or     $0x4,%al
  c033f3:	04 1c                	add    $0x1c,%al
  c033f5:	00 00                	add    %al,(%eax)
  c033f7:	00 c0                	add    %al,%al
  c033f9:	09 00                	or     %eax,(%eax)
  c033fb:	00 ed                	add    %ch,%ch
  c033fd:	ed                   	in     (%dx),%eax
  c033fe:	ff                   	(bad)  
  c033ff:	ff 8a 00 00 00 00    	decl   0x0(%edx)
  c03405:	41                   	inc    %ecx
  c03406:	0e                   	push   %cs
  c03407:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0340d:	02 86 c5 0c 04 04    	add    0x4040cc5(%esi),%al
  c03413:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c03416:	00 00                	add    %al,(%eax)
  c03418:	e0 09                	loopne c03423 <_upperDigits+0xb6f>
  c0341a:	00 00                	add    %al,(%eax)
  c0341c:	57                   	push   %edi
  c0341d:	ee                   	out    %al,(%dx)
  c0341e:	ff                   	(bad)  
  c0341f:	ff c4                	inc    %esp
  c03421:	02 00                	add    (%eax),%al
  c03423:	00 00                	add    %al,(%eax)
  c03425:	41                   	inc    %ecx
  c03426:	0e                   	push   %cs
  c03427:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0342d:	03 c0                	add    %eax,%eax
  c0342f:	02 c5                	add    %ch,%al
  c03431:	0c 04                	or     $0x4,%al
  c03433:	04 1c                	add    $0x1c,%al
  c03435:	00 00                	add    %al,(%eax)
  c03437:	00 00                	add    %al,(%eax)
  c03439:	0a 00                	or     (%eax),%al
  c0343b:	00 fb                	add    %bh,%bl
  c0343d:	f0 ff                	lock (bad) 
  c0343f:	ff 29                	ljmp   *(%ecx)
  c03441:	00 00                	add    %al,(%eax)
  c03443:	00 00                	add    %al,(%eax)
  c03445:	41                   	inc    %ecx
  c03446:	0e                   	push   %cs
  c03447:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0344d:	65 c5 0c 04          	lds    %gs:(%esp,%eax,1),%ecx
  c03451:	04 00                	add    $0x0,%al
	...

Disassembly of section .data:

00c05000 <mesg>:
  c05000:	00 00                	add    %al,(%eax)
  c05002:	00 00                	add    %al,(%eax)
  c05004:	60                   	pusha  
  c05005:	25 c0 00 00 00       	and    $0xc0,%eax
  c0500a:	00 00                	add    %al,(%eax)
  c0500c:	67 25 c0 00 6c 25    	addr16 and $0x256c00c0,%eax
  c05012:	c0 00 80             	rolb   $0x80,(%eax)
  c05015:	25 c0 00 8b 25       	and    $0x258b00c0,%eax
  c0501a:	c0 00 91             	rolb   $0x91,(%eax)
  c0501d:	25 c0 00 9a 25       	and    $0x259a00c0,%eax
  c05022:	c0 00 b3             	rolb   $0xb3,(%eax)
  c05025:	25 c0 00 ba 25       	and    $0x25ba00c0,%eax
  c0502a:	c0 00 c4             	rolb   $0xc4,(%eax)
  c0502d:	25 c0 00 db 25       	and    $0x25db00c0,%eax
  c05032:	c0 00 00             	rolb   $0x0,(%eax)
  c05035:	00 00                	add    %al,(%eax)
  c05037:	00 f7                	add    %dh,%bh
  c05039:	25 c0 00 04 26       	and    $0x260400c0,%eax
  c0503e:	c0 00 2a             	rolb   $0x2a,(%eax)
  c05041:	26 c0 00 34          	rolb   $0x34,%es:(%eax)
  c05045:	26                   	es
  c05046:	c0                   	.byte 0xc0
	...

Disassembly of section .bss:

00c05080 <dolp>:
  c05080:	00 00                	add    %al,(%eax)
	...

00c05084 <peekc>:
  c05084:	00 00                	add    %al,(%eax)
	...

00c05088 <gflg>:
  c05088:	00 00                	add    %al,(%eax)
	...

00c0508c <setintr>:
  c0508c:	00 00                	add    %al,(%eax)
	...

00c05090 <arginp>:
  c05090:	00 00                	add    %al,(%eax)
	...

00c05094 <onelflg>:
  c05094:	00 00                	add    %al,(%eax)
	...

00c05098 <exitstat>:
  c05098:	00 00                	add    %al,(%eax)
	...

00c0509c <___strtok>:
	...

00c050c0 <ab>:
	...

00c054c0 <string>:
	...

00c05500 <ava>:
	...

00c05d00 <av>:
  c05d00:	00 00                	add    %al,(%eax)
	...

00c05d04 <ncoll>:
  c05d04:	00 00                	add    %al,(%eax)
	...

00c05d08 <___strtok>:
  c05d08:	00 00                	add    %al,(%eax)
	...

00c05d0c <___strtok>:
  c05d0c:	00 00                	add    %al,(%eax)
	...

00c05d10 <___strtok>:
  c05d10:	00 00                	add    %al,(%eax)
	...

00c05d14 <___strtok>:
	...

00c05d40 <buf>:
	...

00c06140 <___strtok>:
	...

00c06180 <promp>:
  c06180:	00 00                	add    %al,(%eax)
	...

00c06184 <linep>:
	...

00c061c0 <args>:
	...

00c0628c <treep>:
  c0628c:	00 00                	add    %al,(%eax)
	...

00c06290 <eargp>:
	...

00c062c0 <line>:
	...

00c066c0 <trebuf>:
	...

00c06858 <dolv>:
  c06858:	00 00                	add    %al,(%eax)
	...

00c0685c <dolc>:
  c0685c:	00 00                	add    %al,(%eax)
	...

00c06860 <argp>:
  c06860:	00 00                	add    %al,(%eax)
	...

00c06864 <exitp>:
  c06864:	00 00                	add    %al,(%eax)
	...

00c06868 <treeend>:
  c06868:	00 00                	add    %al,(%eax)
	...

00c0686c <pidp>:
	...

00c06878 <error>:
  c06878:	00 00                	add    %al,(%eax)
	...

00c0687c <elinep>:
  c0687c:	00 00                	add    %al,(%eax)
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
