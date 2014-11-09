
objs/bin/nosh:     file format elf32-i386


Disassembly of section .text:

00c00000 <memcpy>:
  c00000:	55                   	push   %ebp
  c00001:	89 e5                	mov    %esp,%ebp
  c00003:	57                   	push   %edi
  c00004:	56                   	push   %esi
  c00005:	53                   	push   %ebx
  c00006:	8b 45 10             	mov    0x10(%ebp),%eax
  c00009:	8b 55 0c             	mov    0xc(%ebp),%edx
  c0000c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c0000f:	89 c1                	mov    %eax,%ecx
  c00011:	89 d6                	mov    %edx,%esi
  c00013:	89 df                	mov    %ebx,%edi
  c00015:	fc                   	cld    
  c00016:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  c00018:	8b 45 08             	mov    0x8(%ebp),%eax
  c0001b:	5b                   	pop    %ebx
  c0001c:	5e                   	pop    %esi
  c0001d:	5f                   	pop    %edi
  c0001e:	5d                   	pop    %ebp
  c0001f:	c3                   	ret    

00c00020 <newList>:
  c00020:	55                   	push   %ebp
  c00021:	89 e5                	mov    %esp,%ebp
  c00023:	83 ec 18             	sub    $0x18,%esp
  c00026:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c0002a:	74 2d                	je     c00059 <newList+0x39>
  c0002c:	8b 45 08             	mov    0x8(%ebp),%eax
  c0002f:	8b 00                	mov    (%eax),%eax
  c00031:	83 f8 02             	cmp    $0x2,%eax
  c00034:	74 23                	je     c00059 <newList+0x39>
  c00036:	8b 45 08             	mov    0x8(%ebp),%eax
  c00039:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c0003c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  c00043:	83 ec 04             	sub    $0x4,%esp
  c00046:	ff 75 ec             	pushl  -0x14(%ebp)
  c00049:	ff 75 e8             	pushl  -0x18(%ebp)
  c0004c:	6a 02                	push   $0x2
  c0004e:	e8 5d 20 00 00       	call   c020b0 <newObject>
  c00053:	83 c4 10             	add    $0x10,%esp
  c00056:	89 45 08             	mov    %eax,0x8(%ebp)
  c00059:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c00060:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c00067:	8b 45 08             	mov    0x8(%ebp),%eax
  c0006a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c0006d:	83 ec 04             	sub    $0x4,%esp
  c00070:	ff 75 f4             	pushl  -0xc(%ebp)
  c00073:	ff 75 f0             	pushl  -0x10(%ebp)
  c00076:	6a 03                	push   $0x3
  c00078:	e8 33 20 00 00       	call   c020b0 <newObject>
  c0007d:	83 c4 10             	add    $0x10,%esp
  c00080:	c9                   	leave  
  c00081:	c3                   	ret    

00c00082 <yydestruct>:
  c00082:	55                   	push   %ebp
  c00083:	89 e5                	mov    %esp,%ebp
  c00085:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c00089:	75 07                	jne    c00092 <yydestruct+0x10>
  c0008b:	c7 45 08 17 44 c0 00 	movl   $0xc04417,0x8(%ebp)
  c00092:	90                   	nop
  c00093:	5d                   	pop    %ebp
  c00094:	c3                   	ret    

00c00095 <yyparse>:
  c00095:	55                   	push   %ebp
  c00096:	89 e5                	mov    %esp,%ebp
  c00098:	81 ec 28 05 00 00    	sub    $0x528,%esp
  c0009e:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
  c000a5:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  c000ac:	8d 85 00 fe ff ff    	lea    -0x200(%ebp),%eax
  c000b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c000b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c000b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c000bb:	8d 85 e0 fa ff ff    	lea    -0x520(%ebp),%eax
  c000c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c000c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c000c7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c000ca:	c7 45 dc c8 00 00 00 	movl   $0xc8,-0x24(%ebp)
  c000d1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c000d8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c000df:	c7 05 c8 59 c2 00 00 	movl   $0x0,0xc259c8
  c000e6:	00 00 00 
  c000e9:	c7 05 d0 59 c2 00 fe 	movl   $0xfffffffe,0xc259d0
  c000f0:	ff ff ff 
  c000f3:	eb 04                	jmp    c000f9 <yyparse+0x64>
  c000f5:	83 45 e8 02          	addl   $0x2,-0x18(%ebp)
  c000f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c000fc:	89 c2                	mov    %eax,%edx
  c000fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c00101:	66 89 10             	mov    %dx,(%eax)
  c00104:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00107:	05 ff ff ff 7f       	add    $0x7fffffff,%eax
  c0010c:	8d 14 00             	lea    (%eax,%eax,1),%edx
  c0010f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00112:	01 d0                	add    %edx,%eax
  c00114:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  c00117:	0f 87 25 01 00 00    	ja     c00242 <yyparse+0x1ad>
  c0011d:	8b 55 e8             	mov    -0x18(%ebp),%edx
  c00120:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00123:	29 c2                	sub    %eax,%edx
  c00125:	89 d0                	mov    %edx,%eax
  c00127:	d1 f8                	sar    %eax
  c00129:	83 c0 01             	add    $0x1,%eax
  c0012c:	89 45 c8             	mov    %eax,-0x38(%ebp)
  c0012f:	81 7d dc 0f 27 00 00 	cmpl   $0x270f,-0x24(%ebp)
  c00136:	76 05                	jbe    c0013d <yyparse+0xa8>
  c00138:	e9 d3 05 00 00       	jmp    c00710 <yyparse+0x67b>
  c0013d:	d1 65 dc             	shll   -0x24(%ebp)
  c00140:	81 7d dc 10 27 00 00 	cmpl   $0x2710,-0x24(%ebp)
  c00147:	76 07                	jbe    c00150 <yyparse+0xbb>
  c00149:	c7 45 dc 10 27 00 00 	movl   $0x2710,-0x24(%ebp)
  c00150:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00153:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  c00156:	8b 55 dc             	mov    -0x24(%ebp),%edx
  c00159:	89 d0                	mov    %edx,%eax
  c0015b:	01 c0                	add    %eax,%eax
  c0015d:	01 d0                	add    %edx,%eax
  c0015f:	01 c0                	add    %eax,%eax
  c00161:	83 c0 03             	add    $0x3,%eax
  c00164:	83 ec 0c             	sub    $0xc,%esp
  c00167:	50                   	push   %eax
  c00168:	e8 ea 38 00 00       	call   c03a57 <malloc>
  c0016d:	83 c4 10             	add    $0x10,%esp
  c00170:	89 45 c0             	mov    %eax,-0x40(%ebp)
  c00173:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
  c00177:	75 05                	jne    c0017e <yyparse+0xe9>
  c00179:	e9 92 05 00 00       	jmp    c00710 <yyparse+0x67b>
  c0017e:	8b 55 c8             	mov    -0x38(%ebp),%edx
  c00181:	8b 45 c0             	mov    -0x40(%ebp),%eax
  c00184:	83 ec 04             	sub    $0x4,%esp
  c00187:	52                   	push   %edx
  c00188:	ff 75 ec             	pushl  -0x14(%ebp)
  c0018b:	50                   	push   %eax
  c0018c:	e8 6f fe ff ff       	call   c00000 <memcpy>
  c00191:	83 c4 10             	add    $0x10,%esp
  c00194:	8b 45 c0             	mov    -0x40(%ebp),%eax
  c00197:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c0019a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c0019d:	01 c0                	add    %eax,%eax
  c0019f:	83 c0 03             	add    $0x3,%eax
  c001a2:	89 45 bc             	mov    %eax,-0x44(%ebp)
  c001a5:	8b 45 bc             	mov    -0x44(%ebp),%eax
  c001a8:	c1 e8 02             	shr    $0x2,%eax
  c001ab:	c1 e0 02             	shl    $0x2,%eax
  c001ae:	01 45 c0             	add    %eax,-0x40(%ebp)
  c001b1:	8b 55 c8             	mov    -0x38(%ebp),%edx
  c001b4:	8b 45 c0             	mov    -0x40(%ebp),%eax
  c001b7:	83 ec 04             	sub    $0x4,%esp
  c001ba:	52                   	push   %edx
  c001bb:	ff 75 e4             	pushl  -0x1c(%ebp)
  c001be:	50                   	push   %eax
  c001bf:	e8 3c fe ff ff       	call   c00000 <memcpy>
  c001c4:	83 c4 10             	add    $0x10,%esp
  c001c7:	8b 45 c0             	mov    -0x40(%ebp),%eax
  c001ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c001cd:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c001d0:	c1 e0 02             	shl    $0x2,%eax
  c001d3:	83 c0 03             	add    $0x3,%eax
  c001d6:	89 45 b8             	mov    %eax,-0x48(%ebp)
  c001d9:	8b 45 b8             	mov    -0x48(%ebp),%eax
  c001dc:	c1 e8 02             	shr    $0x2,%eax
  c001df:	c1 e0 02             	shl    $0x2,%eax
  c001e2:	01 45 c0             	add    %eax,-0x40(%ebp)
  c001e5:	8d 85 00 fe ff ff    	lea    -0x200(%ebp),%eax
  c001eb:	39 45 c4             	cmp    %eax,-0x3c(%ebp)
  c001ee:	74 0e                	je     c001fe <yyparse+0x169>
  c001f0:	83 ec 0c             	sub    $0xc,%esp
  c001f3:	ff 75 c4             	pushl  -0x3c(%ebp)
  c001f6:	e8 af 36 00 00       	call   c038aa <free>
  c001fb:	83 c4 10             	add    $0x10,%esp
  c001fe:	8b 45 c8             	mov    -0x38(%ebp),%eax
  c00201:	05 ff ff ff 7f       	add    $0x7fffffff,%eax
  c00206:	8d 14 00             	lea    (%eax,%eax,1),%edx
  c00209:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c0020c:	01 d0                	add    %edx,%eax
  c0020e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c00211:	8b 45 c8             	mov    -0x38(%ebp),%eax
  c00214:	05 ff ff ff 3f       	add    $0x3fffffff,%eax
  c00219:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c00220:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c00223:	01 d0                	add    %edx,%eax
  c00225:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c00228:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c0022b:	05 ff ff ff 7f       	add    $0x7fffffff,%eax
  c00230:	8d 14 00             	lea    (%eax,%eax,1),%edx
  c00233:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c00236:	01 d0                	add    %edx,%eax
  c00238:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  c0023b:	77 05                	ja     c00242 <yyparse+0x1ad>
  c0023d:	e9 c5 04 00 00       	jmp    c00707 <yyparse+0x672>
  c00242:	83 7d f4 0e          	cmpl   $0xe,-0xc(%ebp)
  c00246:	75 0d                	jne    c00255 <yyparse+0x1c0>
  c00248:	90                   	nop
  c00249:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  c00250:	e9 d2 04 00 00       	jmp    c00727 <yyparse+0x692>
  c00255:	90                   	nop
  c00256:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00259:	05 b9 43 c0 00       	add    $0xc043b9,%eax
  c0025e:	0f b6 00             	movzbl (%eax),%eax
  c00261:	0f be c0             	movsbl %al,%eax
  c00264:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c00267:	83 7d d8 f6          	cmpl   $0xfffffff6,-0x28(%ebp)
  c0026b:	75 05                	jne    c00272 <yyparse+0x1dd>
  c0026d:	e9 c2 00 00 00       	jmp    c00334 <yyparse+0x29f>
  c00272:	a1 d0 59 c2 00       	mov    0xc259d0,%eax
  c00277:	83 f8 fe             	cmp    $0xfffffffe,%eax
  c0027a:	75 0a                	jne    c00286 <yyparse+0x1f1>
  c0027c:	e8 54 06 00 00       	call   c008d5 <yylex>
  c00281:	a3 d0 59 c2 00       	mov    %eax,0xc259d0
  c00286:	a1 d0 59 c2 00       	mov    0xc259d0,%eax
  c0028b:	85 c0                	test   %eax,%eax
  c0028d:	7f 11                	jg     c002a0 <yyparse+0x20b>
  c0028f:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
  c00296:	8b 45 d0             	mov    -0x30(%ebp),%eax
  c00299:	a3 d0 59 c2 00       	mov    %eax,0xc259d0
  c0029e:	eb 25                	jmp    c002c5 <yyparse+0x230>
  c002a0:	a1 d0 59 c2 00       	mov    0xc259d0,%eax
  c002a5:	3d 04 01 00 00       	cmp    $0x104,%eax
  c002aa:	77 11                	ja     c002bd <yyparse+0x228>
  c002ac:	a1 d0 59 c2 00       	mov    0xc259d0,%eax
  c002b1:	0f b6 80 80 42 c0 00 	movzbl 0xc04280(%eax),%eax
  c002b8:	0f b6 c0             	movzbl %al,%eax
  c002bb:	eb 05                	jmp    c002c2 <yyparse+0x22d>
  c002bd:	b8 02 00 00 00       	mov    $0x2,%eax
  c002c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  c002c5:	8b 45 d0             	mov    -0x30(%ebp),%eax
  c002c8:	01 45 d8             	add    %eax,-0x28(%ebp)
  c002cb:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  c002cf:	78 63                	js     c00334 <yyparse+0x29f>
  c002d1:	83 7d d8 19          	cmpl   $0x19,-0x28(%ebp)
  c002d5:	7f 5d                	jg     c00334 <yyparse+0x29f>
  c002d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c002da:	05 eb 43 c0 00       	add    $0xc043eb,%eax
  c002df:	0f b6 00             	movzbl (%eax),%eax
  c002e2:	0f be c0             	movsbl %al,%eax
  c002e5:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  c002e8:	75 4a                	jne    c00334 <yyparse+0x29f>
  c002ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c002ed:	05 d1 43 c0 00       	add    $0xc043d1,%eax
  c002f2:	0f b6 00             	movzbl (%eax),%eax
  c002f5:	0f b6 c0             	movzbl %al,%eax
  c002f8:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c002fb:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  c002ff:	7f 05                	jg     c00306 <yyparse+0x271>
  c00301:	f7 5d d8             	negl   -0x28(%ebp)
  c00304:	eb 5a                	jmp    c00360 <yyparse+0x2cb>
  c00306:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  c0030a:	74 04                	je     c00310 <yyparse+0x27b>
  c0030c:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
  c00310:	c7 05 d0 59 c2 00 fe 	movl   $0xfffffffe,0xc259d0
  c00317:	ff ff ff 
  c0031a:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c0031d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00320:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
  c00324:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c00327:	8b 15 cc 59 c2 00    	mov    0xc259cc,%edx
  c0032d:	89 10                	mov    %edx,(%eax)
  c0032f:	e9 c1 fd ff ff       	jmp    c000f5 <yyparse+0x60>
  c00334:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00337:	05 a1 43 c0 00       	add    $0xc043a1,%eax
  c0033c:	0f b6 00             	movzbl (%eax),%eax
  c0033f:	0f b6 c0             	movzbl %al,%eax
  c00342:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c00345:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  c00349:	75 14                	jne    c0035f <yyparse+0x2ca>
  c0034b:	90                   	nop
  c0034c:	a1 d0 59 c2 00       	mov    0xc259d0,%eax
  c00351:	83 f8 fe             	cmp    $0xfffffffe,%eax
  c00354:	0f 84 90 02 00 00    	je     c005ea <yyparse+0x555>
  c0035a:	e9 67 02 00 00       	jmp    c005c6 <yyparse+0x531>
  c0035f:	90                   	nop
  c00360:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c00363:	05 93 43 c0 00       	add    $0xc04393,%eax
  c00368:	0f b6 00             	movzbl (%eax),%eax
  c0036b:	0f b6 c0             	movzbl %al,%eax
  c0036e:	89 45 cc             	mov    %eax,-0x34(%ebp)
  c00371:	b8 01 00 00 00       	mov    $0x1,%eax
  c00376:	2b 45 cc             	sub    -0x34(%ebp),%eax
  c00379:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c00380:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c00383:	01 d0                	add    %edx,%eax
  c00385:	8b 00                	mov    (%eax),%eax
  c00387:	89 85 dc fa ff ff    	mov    %eax,-0x524(%ebp)
  c0038d:	83 7d d8 0d          	cmpl   $0xd,-0x28(%ebp)
  c00391:	0f 87 82 01 00 00    	ja     c00519 <yyparse+0x484>
  c00397:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c0039a:	c1 e0 02             	shl    $0x2,%eax
  c0039d:	05 90 44 c0 00       	add    $0xc04490,%eax
  c003a2:	8b 00                	mov    (%eax),%eax
  c003a4:	ff e0                	jmp    *%eax
  c003a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c003a9:	8b 00                	mov    (%eax),%eax
  c003ab:	83 ec 0c             	sub    $0xc,%esp
  c003ae:	50                   	push   %eax
  c003af:	e8 9a 24 00 00       	call   c0284e <eval>
  c003b4:	83 c4 10             	add    $0x10,%esp
  c003b7:	83 ec 0c             	sub    $0xc,%esp
  c003ba:	50                   	push   %eax
  c003bb:	e8 33 26 00 00       	call   c029f3 <display>
  c003c0:	83 c4 10             	add    $0x10,%esp
  c003c3:	e9 52 01 00 00       	jmp    c0051a <yyparse+0x485>
  c003c8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c003cb:	8b 00                	mov    (%eax),%eax
  c003cd:	83 ec 0c             	sub    $0xc,%esp
  c003d0:	50                   	push   %eax
  c003d1:	e8 78 24 00 00       	call   c0284e <eval>
  c003d6:	83 c4 10             	add    $0x10,%esp
  c003d9:	83 ec 0c             	sub    $0xc,%esp
  c003dc:	50                   	push   %eax
  c003dd:	e8 11 26 00 00       	call   c029f3 <display>
  c003e2:	83 c4 10             	add    $0x10,%esp
  c003e5:	e9 30 01 00 00       	jmp    c0051a <yyparse+0x485>
  c003ea:	83 ec 0c             	sub    $0xc,%esp
  c003ed:	6a 00                	push   $0x0
  c003ef:	e8 2c fc ff ff       	call   c00020 <newList>
  c003f4:	83 c4 10             	add    $0x10,%esp
  c003f7:	89 85 dc fa ff ff    	mov    %eax,-0x524(%ebp)
  c003fd:	e9 18 01 00 00       	jmp    c0051a <yyparse+0x485>
  c00402:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c00405:	83 e8 04             	sub    $0x4,%eax
  c00408:	8b 00                	mov    (%eax),%eax
  c0040a:	83 ec 0c             	sub    $0xc,%esp
  c0040d:	50                   	push   %eax
  c0040e:	e8 0d fc ff ff       	call   c00020 <newList>
  c00413:	83 c4 10             	add    $0x10,%esp
  c00416:	89 85 dc fa ff ff    	mov    %eax,-0x524(%ebp)
  c0041c:	e9 f9 00 00 00       	jmp    c0051a <yyparse+0x485>
  c00421:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
  c00428:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
  c0042f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c00432:	8b 00                	mov    (%eax),%eax
  c00434:	89 45 90             	mov    %eax,-0x70(%ebp)
  c00437:	83 ec 04             	sub    $0x4,%esp
  c0043a:	ff 75 94             	pushl  -0x6c(%ebp)
  c0043d:	ff 75 90             	pushl  -0x70(%ebp)
  c00440:	6a 04                	push   $0x4
  c00442:	e8 69 1c 00 00       	call   c020b0 <newObject>
  c00447:	83 c4 10             	add    $0x10,%esp
  c0044a:	89 85 dc fa ff ff    	mov    %eax,-0x524(%ebp)
  c00450:	e9 c5 00 00 00       	jmp    c0051a <yyparse+0x485>
  c00455:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
  c0045c:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
  c00463:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c00466:	8b 00                	mov    (%eax),%eax
  c00468:	89 45 98             	mov    %eax,-0x68(%ebp)
  c0046b:	83 ec 04             	sub    $0x4,%esp
  c0046e:	ff 75 9c             	pushl  -0x64(%ebp)
  c00471:	ff 75 98             	pushl  -0x68(%ebp)
  c00474:	6a 06                	push   $0x6
  c00476:	e8 35 1c 00 00       	call   c020b0 <newObject>
  c0047b:	83 c4 10             	add    $0x10,%esp
  c0047e:	89 85 dc fa ff ff    	mov    %eax,-0x524(%ebp)
  c00484:	e9 91 00 00 00       	jmp    c0051a <yyparse+0x485>
  c00489:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
  c00490:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
  c00497:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c0049a:	8b 00                	mov    (%eax),%eax
  c0049c:	89 45 a0             	mov    %eax,-0x60(%ebp)
  c0049f:	83 ec 04             	sub    $0x4,%esp
  c004a2:	ff 75 a4             	pushl  -0x5c(%ebp)
  c004a5:	ff 75 a0             	pushl  -0x60(%ebp)
  c004a8:	6a 05                	push   $0x5
  c004aa:	e8 01 1c 00 00       	call   c020b0 <newObject>
  c004af:	83 c4 10             	add    $0x10,%esp
  c004b2:	89 85 dc fa ff ff    	mov    %eax,-0x524(%ebp)
  c004b8:	eb 60                	jmp    c0051a <yyparse+0x485>
  c004ba:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
  c004c1:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
  c004c8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c004cb:	8b 00                	mov    (%eax),%eax
  c004cd:	89 45 a8             	mov    %eax,-0x58(%ebp)
  c004d0:	83 ec 04             	sub    $0x4,%esp
  c004d3:	ff 75 ac             	pushl  -0x54(%ebp)
  c004d6:	ff 75 a8             	pushl  -0x58(%ebp)
  c004d9:	6a 07                	push   $0x7
  c004db:	e8 d0 1b 00 00       	call   c020b0 <newObject>
  c004e0:	83 c4 10             	add    $0x10,%esp
  c004e3:	89 85 dc fa ff ff    	mov    %eax,-0x524(%ebp)
  c004e9:	eb 2f                	jmp    c0051a <yyparse+0x485>
  c004eb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c004ee:	83 e8 04             	sub    $0x4,%eax
  c004f1:	8b 00                	mov    (%eax),%eax
  c004f3:	89 45 b0             	mov    %eax,-0x50(%ebp)
  c004f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c004f9:	8b 00                	mov    (%eax),%eax
  c004fb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  c004fe:	83 ec 04             	sub    $0x4,%esp
  c00501:	ff 75 b4             	pushl  -0x4c(%ebp)
  c00504:	ff 75 b0             	pushl  -0x50(%ebp)
  c00507:	6a 02                	push   $0x2
  c00509:	e8 a2 1b 00 00       	call   c020b0 <newObject>
  c0050e:	83 c4 10             	add    $0x10,%esp
  c00511:	89 85 dc fa ff ff    	mov    %eax,-0x524(%ebp)
  c00517:	eb 01                	jmp    c0051a <yyparse+0x485>
  c00519:	90                   	nop
  c0051a:	8b 45 cc             	mov    -0x34(%ebp),%eax
  c0051d:	c1 e0 02             	shl    $0x2,%eax
  c00520:	f7 d8                	neg    %eax
  c00522:	01 45 e0             	add    %eax,-0x20(%ebp)
  c00525:	8b 45 cc             	mov    -0x34(%ebp),%eax
  c00528:	01 c0                	add    %eax,%eax
  c0052a:	f7 d8                	neg    %eax
  c0052c:	01 45 e8             	add    %eax,-0x18(%ebp)
  c0052f:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  c00536:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
  c0053a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c0053d:	8b 95 dc fa ff ff    	mov    -0x524(%ebp),%edx
  c00543:	89 10                	mov    %edx,(%eax)
  c00545:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c00548:	05 85 43 c0 00       	add    $0xc04385,%eax
  c0054d:	0f b6 00             	movzbl (%eax),%eax
  c00550:	0f b6 c0             	movzbl %al,%eax
  c00553:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c00556:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c00559:	83 e8 09             	sub    $0x9,%eax
  c0055c:	0f b6 80 cb 43 c0 00 	movzbl 0xc043cb(%eax),%eax
  c00563:	0f be d0             	movsbl %al,%edx
  c00566:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c00569:	0f b7 00             	movzwl (%eax),%eax
  c0056c:	98                   	cwtl   
  c0056d:	01 d0                	add    %edx,%eax
  c0056f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00572:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c00576:	78 36                	js     c005ae <yyparse+0x519>
  c00578:	83 7d f4 19          	cmpl   $0x19,-0xc(%ebp)
  c0057c:	7f 30                	jg     c005ae <yyparse+0x519>
  c0057e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c00581:	05 eb 43 c0 00       	add    $0xc043eb,%eax
  c00586:	0f b6 00             	movzbl (%eax),%eax
  c00589:	66 0f be d0          	movsbw %al,%dx
  c0058d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c00590:	0f b7 00             	movzwl (%eax),%eax
  c00593:	66 39 c2             	cmp    %ax,%dx
  c00596:	75 16                	jne    c005ae <yyparse+0x519>
  c00598:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c0059b:	05 d1 43 c0 00       	add    $0xc043d1,%eax
  c005a0:	0f b6 00             	movzbl (%eax),%eax
  c005a3:	0f b6 c0             	movzbl %al,%eax
  c005a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c005a9:	e9 47 fb ff ff       	jmp    c000f5 <yyparse+0x60>
  c005ae:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c005b1:	83 e8 09             	sub    $0x9,%eax
  c005b4:	0f b6 80 b3 43 c0 00 	movzbl 0xc043b3(%eax),%eax
  c005bb:	0f be c0             	movsbl %al,%eax
  c005be:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c005c1:	e9 2f fb ff ff       	jmp    c000f5 <yyparse+0x60>
  c005c6:	a1 d0 59 c2 00       	mov    0xc259d0,%eax
  c005cb:	3d 04 01 00 00       	cmp    $0x104,%eax
  c005d0:	77 11                	ja     c005e3 <yyparse+0x54e>
  c005d2:	a1 d0 59 c2 00       	mov    0xc259d0,%eax
  c005d7:	0f b6 80 80 42 c0 00 	movzbl 0xc04280(%eax),%eax
  c005de:	0f b6 c0             	movzbl %al,%eax
  c005e1:	eb 0c                	jmp    c005ef <yyparse+0x55a>
  c005e3:	b8 02 00 00 00       	mov    $0x2,%eax
  c005e8:	eb 05                	jmp    c005ef <yyparse+0x55a>
  c005ea:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  c005ef:	89 45 d0             	mov    %eax,-0x30(%ebp)
  c005f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  c005f6:	75 1d                	jne    c00615 <yyparse+0x580>
  c005f8:	a1 c8 59 c2 00       	mov    0xc259c8,%eax
  c005fd:	83 c0 01             	add    $0x1,%eax
  c00600:	a3 c8 59 c2 00       	mov    %eax,0xc259c8
  c00605:	83 ec 0c             	sub    $0xc,%esp
  c00608:	68 20 44 c0 00       	push   $0xc04420
  c0060d:	e8 ef 01 00 00       	call   c00801 <yyerror>
  c00612:	83 c4 10             	add    $0x10,%esp
  c00615:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
  c00619:	75 39                	jne    c00654 <yyparse+0x5bf>
  c0061b:	a1 d0 59 c2 00       	mov    0xc259d0,%eax
  c00620:	85 c0                	test   %eax,%eax
  c00622:	7f 0e                	jg     c00632 <yyparse+0x59d>
  c00624:	a1 d0 59 c2 00       	mov    0xc259d0,%eax
  c00629:	85 c0                	test   %eax,%eax
  c0062b:	75 27                	jne    c00654 <yyparse+0x5bf>
  c0062d:	e9 d5 00 00 00       	jmp    c00707 <yyparse+0x672>
  c00632:	83 ec 04             	sub    $0x4,%esp
  c00635:	68 cc 59 c2 00       	push   $0xc259cc
  c0063a:	ff 75 d0             	pushl  -0x30(%ebp)
  c0063d:	68 2d 44 c0 00       	push   $0xc0442d
  c00642:	e8 3b fa ff ff       	call   c00082 <yydestruct>
  c00647:	83 c4 10             	add    $0x10,%esp
  c0064a:	c7 05 d0 59 c2 00 fe 	movl   $0xfffffffe,0xc259d0
  c00651:	ff ff ff 
  c00654:	90                   	nop
  c00655:	c7 45 f0 03 00 00 00 	movl   $0x3,-0x10(%ebp)
  c0065c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c0065f:	05 b9 43 c0 00       	add    $0xc043b9,%eax
  c00664:	0f b6 00             	movzbl (%eax),%eax
  c00667:	0f be c0             	movsbl %al,%eax
  c0066a:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c0066d:	83 7d d8 f6          	cmpl   $0xfffffff6,-0x28(%ebp)
  c00671:	74 51                	je     c006c4 <yyparse+0x62f>
  c00673:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
  c00677:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  c0067b:	78 47                	js     c006c4 <yyparse+0x62f>
  c0067d:	83 7d d8 19          	cmpl   $0x19,-0x28(%ebp)
  c00681:	7f 41                	jg     c006c4 <yyparse+0x62f>
  c00683:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c00686:	05 eb 43 c0 00       	add    $0xc043eb,%eax
  c0068b:	0f b6 00             	movzbl (%eax),%eax
  c0068e:	3c 01                	cmp    $0x1,%al
  c00690:	75 32                	jne    c006c4 <yyparse+0x62f>
  c00692:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c00695:	05 d1 43 c0 00       	add    $0xc043d1,%eax
  c0069a:	0f b6 00             	movzbl (%eax),%eax
  c0069d:	0f b6 c0             	movzbl %al,%eax
  c006a0:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c006a3:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  c006a7:	7e 1b                	jle    c006c4 <yyparse+0x62f>
  c006a9:	90                   	nop
  c006aa:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
  c006ae:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c006b1:	8b 15 cc 59 c2 00    	mov    0xc259cc,%edx
  c006b7:	89 10                	mov    %edx,(%eax)
  c006b9:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c006bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c006bf:	e9 31 fa ff ff       	jmp    c000f5 <yyparse+0x60>
  c006c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c006c7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  c006ca:	75 02                	jne    c006ce <yyparse+0x639>
  c006cc:	eb 39                	jmp    c00707 <yyparse+0x672>
  c006ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c006d1:	05 05 44 c0 00       	add    $0xc04405,%eax
  c006d6:	0f b6 00             	movzbl (%eax),%eax
  c006d9:	0f b6 c0             	movzbl %al,%eax
  c006dc:	83 ec 04             	sub    $0x4,%esp
  c006df:	ff 75 e0             	pushl  -0x20(%ebp)
  c006e2:	50                   	push   %eax
  c006e3:	68 3f 44 c0 00       	push   $0xc0443f
  c006e8:	e8 95 f9 ff ff       	call   c00082 <yydestruct>
  c006ed:	83 c4 10             	add    $0x10,%esp
  c006f0:	83 6d e0 04          	subl   $0x4,-0x20(%ebp)
  c006f4:	83 6d e8 02          	subl   $0x2,-0x18(%ebp)
  c006f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c006fb:	0f b7 00             	movzwl (%eax),%eax
  c006fe:	98                   	cwtl   
  c006ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c00702:	e9 55 ff ff ff       	jmp    c0065c <yyparse+0x5c7>
  c00707:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  c0070e:	eb 17                	jmp    c00727 <yyparse+0x692>
  c00710:	83 ec 0c             	sub    $0xc,%esp
  c00713:	68 4e 44 c0 00       	push   $0xc0444e
  c00718:	e8 e4 00 00 00       	call   c00801 <yyerror>
  c0071d:	83 c4 10             	add    $0x10,%esp
  c00720:	c7 45 d4 02 00 00 00 	movl   $0x2,-0x2c(%ebp)
  c00727:	a1 d0 59 c2 00       	mov    0xc259d0,%eax
  c0072c:	83 f8 fe             	cmp    $0xfffffffe,%eax
  c0072f:	74 3d                	je     c0076e <yyparse+0x6d9>
  c00731:	a1 d0 59 c2 00       	mov    0xc259d0,%eax
  c00736:	3d 04 01 00 00       	cmp    $0x104,%eax
  c0073b:	77 11                	ja     c0074e <yyparse+0x6b9>
  c0073d:	a1 d0 59 c2 00       	mov    0xc259d0,%eax
  c00742:	0f b6 80 80 42 c0 00 	movzbl 0xc04280(%eax),%eax
  c00749:	0f b6 c0             	movzbl %al,%eax
  c0074c:	eb 05                	jmp    c00753 <yyparse+0x6be>
  c0074e:	b8 02 00 00 00       	mov    $0x2,%eax
  c00753:	89 45 d0             	mov    %eax,-0x30(%ebp)
  c00756:	83 ec 04             	sub    $0x4,%esp
  c00759:	68 cc 59 c2 00       	push   $0xc259cc
  c0075e:	ff 75 d0             	pushl  -0x30(%ebp)
  c00761:	68 5f 44 c0 00       	push   $0xc0445f
  c00766:	e8 17 f9 ff ff       	call   c00082 <yydestruct>
  c0076b:	83 c4 10             	add    $0x10,%esp
  c0076e:	8b 45 cc             	mov    -0x34(%ebp),%eax
  c00771:	c1 e0 02             	shl    $0x2,%eax
  c00774:	f7 d8                	neg    %eax
  c00776:	01 45 e0             	add    %eax,-0x20(%ebp)
  c00779:	8b 45 cc             	mov    -0x34(%ebp),%eax
  c0077c:	01 c0                	add    %eax,%eax
  c0077e:	f7 d8                	neg    %eax
  c00780:	01 45 e8             	add    %eax,-0x18(%ebp)
  c00783:	eb 2d                	jmp    c007b2 <yyparse+0x71d>
  c00785:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c00788:	0f b7 00             	movzwl (%eax),%eax
  c0078b:	98                   	cwtl   
  c0078c:	0f b6 80 05 44 c0 00 	movzbl 0xc04405(%eax),%eax
  c00793:	0f b6 c0             	movzbl %al,%eax
  c00796:	83 ec 04             	sub    $0x4,%esp
  c00799:	ff 75 e0             	pushl  -0x20(%ebp)
  c0079c:	50                   	push   %eax
  c0079d:	68 7d 44 c0 00       	push   $0xc0447d
  c007a2:	e8 db f8 ff ff       	call   c00082 <yydestruct>
  c007a7:	83 c4 10             	add    $0x10,%esp
  c007aa:	83 6d e0 04          	subl   $0x4,-0x20(%ebp)
  c007ae:	83 6d e8 02          	subl   $0x2,-0x18(%ebp)
  c007b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c007b5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  c007b8:	75 cb                	jne    c00785 <yyparse+0x6f0>
  c007ba:	8d 85 00 fe ff ff    	lea    -0x200(%ebp),%eax
  c007c0:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  c007c3:	74 0e                	je     c007d3 <yyparse+0x73e>
  c007c5:	83 ec 0c             	sub    $0xc,%esp
  c007c8:	ff 75 ec             	pushl  -0x14(%ebp)
  c007cb:	e8 da 30 00 00       	call   c038aa <free>
  c007d0:	83 c4 10             	add    $0x10,%esp
  c007d3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  c007d6:	c9                   	leave  
  c007d7:	c3                   	ret    

00c007d8 <main>:
  c007d8:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  c007dc:	83 e4 f0             	and    $0xfffffff0,%esp
  c007df:	ff 71 fc             	pushl  -0x4(%ecx)
  c007e2:	55                   	push   %ebp
  c007e3:	89 e5                	mov    %esp,%ebp
  c007e5:	51                   	push   %ecx
  c007e6:	83 ec 04             	sub    $0x4,%esp
  c007e9:	e8 a5 1e 00 00       	call   c02693 <built>
  c007ee:	e8 a2 f8 ff ff       	call   c00095 <yyparse>
  c007f3:	b8 00 00 00 00       	mov    $0x0,%eax
  c007f8:	83 c4 04             	add    $0x4,%esp
  c007fb:	59                   	pop    %ecx
  c007fc:	5d                   	pop    %ebp
  c007fd:	8d 61 fc             	lea    -0x4(%ecx),%esp
  c00800:	c3                   	ret    

00c00801 <yyerror>:
  c00801:	55                   	push   %ebp
  c00802:	89 e5                	mov    %esp,%ebp
  c00804:	83 ec 08             	sub    $0x8,%esp
  c00807:	83 ec 08             	sub    $0x8,%esp
  c0080a:	ff 75 08             	pushl  0x8(%ebp)
  c0080d:	68 c8 44 c0 00       	push   $0xc044c8
  c00812:	e8 59 32 00 00       	call   c03a70 <printf>
  c00817:	83 c4 10             	add    $0x10,%esp
  c0081a:	c9                   	leave  
  c0081b:	c3                   	ret    

00c0081c <strlen>:
  c0081c:	55                   	push   %ebp
  c0081d:	89 e5                	mov    %esp,%ebp
  c0081f:	57                   	push   %edi
  c00820:	8b 55 08             	mov    0x8(%ebp),%edx
  c00823:	b8 00 00 00 00       	mov    $0x0,%eax
  c00828:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c0082d:	89 d7                	mov    %edx,%edi
  c0082f:	fc                   	cld    
  c00830:	f2 ae                	repnz scas %es:(%edi),%al
  c00832:	f7 d1                	not    %ecx
  c00834:	49                   	dec    %ecx
  c00835:	89 c8                	mov    %ecx,%eax
  c00837:	5f                   	pop    %edi
  c00838:	5d                   	pop    %ebp
  c00839:	c3                   	ret    

00c0083a <memcpy>:
  c0083a:	55                   	push   %ebp
  c0083b:	89 e5                	mov    %esp,%ebp
  c0083d:	57                   	push   %edi
  c0083e:	56                   	push   %esi
  c0083f:	53                   	push   %ebx
  c00840:	8b 45 10             	mov    0x10(%ebp),%eax
  c00843:	8b 55 0c             	mov    0xc(%ebp),%edx
  c00846:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c00849:	89 c1                	mov    %eax,%ecx
  c0084b:	89 d6                	mov    %edx,%esi
  c0084d:	89 df                	mov    %ebx,%edi
  c0084f:	fc                   	cld    
  c00850:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  c00852:	8b 45 08             	mov    0x8(%ebp),%eax
  c00855:	5b                   	pop    %ebx
  c00856:	5e                   	pop    %esi
  c00857:	5f                   	pop    %edi
  c00858:	5d                   	pop    %ebp
  c00859:	c3                   	ret    

00c0085a <memset>:
  c0085a:	55                   	push   %ebp
  c0085b:	89 e5                	mov    %esp,%ebp
  c0085d:	57                   	push   %edi
  c0085e:	83 ec 04             	sub    $0x4,%esp
  c00861:	8b 45 0c             	mov    0xc(%ebp),%eax
  c00864:	88 45 f8             	mov    %al,-0x8(%ebp)
  c00867:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  c0086b:	8b 55 08             	mov    0x8(%ebp),%edx
  c0086e:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c00871:	89 d7                	mov    %edx,%edi
  c00873:	fc                   	cld    
  c00874:	f3 aa                	rep stos %al,%es:(%edi)
  c00876:	8b 45 08             	mov    0x8(%ebp),%eax
  c00879:	83 c4 04             	add    $0x4,%esp
  c0087c:	5f                   	pop    %edi
  c0087d:	5d                   	pop    %ebp
  c0087e:	c3                   	ret    

00c0087f <fileno>:
  c0087f:	55                   	push   %ebp
  c00880:	89 e5                	mov    %esp,%ebp
  c00882:	8b 45 08             	mov    0x8(%ebp),%eax
  c00885:	8b 00                	mov    (%eax),%eax
  c00887:	5d                   	pop    %ebp
  c00888:	c3                   	ret    

00c00889 <strdup>:
  c00889:	55                   	push   %ebp
  c0088a:	89 e5                	mov    %esp,%ebp
  c0088c:	83 ec 18             	sub    $0x18,%esp
  c0088f:	ff 75 08             	pushl  0x8(%ebp)
  c00892:	e8 85 ff ff ff       	call   c0081c <strlen>
  c00897:	83 c4 04             	add    $0x4,%esp
  c0089a:	83 c0 01             	add    $0x1,%eax
  c0089d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c008a0:	83 ec 0c             	sub    $0xc,%esp
  c008a3:	ff 75 f4             	pushl  -0xc(%ebp)
  c008a6:	e8 ac 31 00 00       	call   c03a57 <malloc>
  c008ab:	83 c4 10             	add    $0x10,%esp
  c008ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c008b1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  c008b5:	75 07                	jne    c008be <strdup+0x35>
  c008b7:	b8 00 00 00 00       	mov    $0x0,%eax
  c008bc:	eb 15                	jmp    c008d3 <strdup+0x4a>
  c008be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c008c1:	83 ec 04             	sub    $0x4,%esp
  c008c4:	50                   	push   %eax
  c008c5:	ff 75 08             	pushl  0x8(%ebp)
  c008c8:	ff 75 f0             	pushl  -0x10(%ebp)
  c008cb:	e8 6a ff ff ff       	call   c0083a <memcpy>
  c008d0:	83 c4 10             	add    $0x10,%esp
  c008d3:	c9                   	leave  
  c008d4:	c3                   	ret    

00c008d5 <yylex>:
  c008d5:	55                   	push   %ebp
  c008d6:	89 e5                	mov    %esp,%ebp
  c008d8:	57                   	push   %edi
  c008d9:	56                   	push   %esi
  c008da:	53                   	push   %ebx
  c008db:	83 ec 1c             	sub    $0x1c,%esp
  c008de:	a1 70 80 c0 00       	mov    0xc08070,%eax
  c008e3:	85 c0                	test   %eax,%eax
  c008e5:	0f 85 95 00 00 00    	jne    c00980 <yylex+0xab>
  c008eb:	c7 05 70 80 c0 00 01 	movl   $0x1,0xc08070
  c008f2:	00 00 00 
  c008f5:	a1 74 80 c0 00       	mov    0xc08074,%eax
  c008fa:	85 c0                	test   %eax,%eax
  c008fc:	75 0a                	jne    c00908 <yylex+0x33>
  c008fe:	c7 05 74 80 c0 00 01 	movl   $0x1,0xc08074
  c00905:	00 00 00 
  c00908:	a1 44 80 c0 00       	mov    0xc08044,%eax
  c0090d:	85 c0                	test   %eax,%eax
  c0090f:	75 0a                	jne    c0091b <yylex+0x46>
  c00911:	a1 04 80 c0 00       	mov    0xc08004,%eax
  c00916:	a3 44 80 c0 00       	mov    %eax,0xc08044
  c0091b:	a1 48 80 c0 00       	mov    0xc08048,%eax
  c00920:	85 c0                	test   %eax,%eax
  c00922:	75 0a                	jne    c0092e <yylex+0x59>
  c00924:	a1 08 80 c0 00       	mov    0xc08008,%eax
  c00929:	a3 48 80 c0 00       	mov    %eax,0xc08048
  c0092e:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00933:	85 c0                	test   %eax,%eax
  c00935:	74 16                	je     c0094d <yylex+0x78>
  c00937:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0093c:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00942:	c1 e2 02             	shl    $0x2,%edx
  c00945:	01 d0                	add    %edx,%eax
  c00947:	8b 00                	mov    (%eax),%eax
  c00949:	85 c0                	test   %eax,%eax
  c0094b:	75 2e                	jne    c0097b <yylex+0xa6>
  c0094d:	e8 ac 11 00 00       	call   c01afe <yyensure_buffer_stack>
  c00952:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00957:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c0095d:	c1 e2 02             	shl    $0x2,%edx
  c00960:	8d 1c 10             	lea    (%eax,%edx,1),%ebx
  c00963:	a1 44 80 c0 00       	mov    0xc08044,%eax
  c00968:	83 ec 08             	sub    $0x8,%esp
  c0096b:	68 00 40 00 00       	push   $0x4000
  c00970:	50                   	push   %eax
  c00971:	e8 f3 0d 00 00       	call   c01769 <yy_create_buffer>
  c00976:	83 c4 10             	add    $0x10,%esp
  c00979:	89 03                	mov    %eax,(%ebx)
  c0097b:	e8 80 0d 00 00       	call   c01700 <yy_load_buffer_state>
  c00980:	8b 35 6c 80 c0 00    	mov    0xc0806c,%esi
  c00986:	0f b6 05 64 80 c0 00 	movzbl 0xc08064,%eax
  c0098d:	88 06                	mov    %al,(%esi)
  c0098f:	89 f7                	mov    %esi,%edi
  c00991:	8b 1d 74 80 c0 00    	mov    0xc08074,%ebx
  c00997:	0f b6 06             	movzbl (%esi),%eax
  c0099a:	0f b6 c0             	movzbl %al,%eax
  c0099d:	8b 04 85 40 45 c0 00 	mov    0xc04540(,%eax,4),%eax
  c009a4:	89 c1                	mov    %eax,%ecx
  c009a6:	0f b7 84 1b 00 45 c0 	movzwl 0xc04500(%ebx,%ebx,1),%eax
  c009ad:	00 
  c009ae:	66 85 c0             	test   %ax,%ax
  c009b1:	74 0c                	je     c009bf <yylex+0xea>
  c009b3:	89 1d 7c 80 c0 00    	mov    %ebx,0xc0807c
  c009b9:	89 35 80 80 c0 00    	mov    %esi,0xc08080
  c009bf:	eb 1e                	jmp    c009df <yylex+0x10a>
  c009c1:	0f b7 84 1b c0 49 c0 	movzwl 0xc049c0(%ebx,%ebx,1),%eax
  c009c8:	00 
  c009c9:	0f bf d8             	movswl %ax,%ebx
  c009cc:	83 fb 18             	cmp    $0x18,%ebx
  c009cf:	7e 0e                	jle    c009df <yylex+0x10a>
  c009d1:	89 c8                	mov    %ecx,%eax
  c009d3:	0f b6 c0             	movzbl %al,%eax
  c009d6:	8b 04 85 40 49 c0 00 	mov    0xc04940(,%eax,4),%eax
  c009dd:	89 c1                	mov    %eax,%ecx
  c009df:	0f b7 84 1b 80 49 c0 	movzwl 0xc04980(%ebx,%ebx,1),%eax
  c009e6:	00 
  c009e7:	0f bf d0             	movswl %ax,%edx
  c009ea:	89 c8                	mov    %ecx,%eax
  c009ec:	0f b6 c0             	movzbl %al,%eax
  c009ef:	01 d0                	add    %edx,%eax
  c009f1:	0f b7 84 00 c0 4a c0 	movzwl 0xc04ac0(%eax,%eax,1),%eax
  c009f8:	00 
  c009f9:	98                   	cwtl   
  c009fa:	39 d8                	cmp    %ebx,%eax
  c009fc:	75 c3                	jne    c009c1 <yylex+0xec>
  c009fe:	0f b7 84 1b 80 49 c0 	movzwl 0xc04980(%ebx,%ebx,1),%eax
  c00a05:	00 
  c00a06:	0f bf d0             	movswl %ax,%edx
  c00a09:	89 c8                	mov    %ecx,%eax
  c00a0b:	0f b6 c0             	movzbl %al,%eax
  c00a0e:	01 d0                	add    %edx,%eax
  c00a10:	0f b7 84 00 00 4a c0 	movzwl 0xc04a00(%eax,%eax,1),%eax
  c00a17:	00 
  c00a18:	0f bf d8             	movswl %ax,%ebx
  c00a1b:	83 c6 01             	add    $0x1,%esi
  c00a1e:	0f b7 84 1b 80 49 c0 	movzwl 0xc04980(%ebx,%ebx,1),%eax
  c00a25:	00 
  c00a26:	66 83 f8 4e          	cmp    $0x4e,%ax
  c00a2a:	0f 85 67 ff ff ff    	jne    c00997 <yylex+0xc2>
  c00a30:	0f b7 84 1b 00 45 c0 	movzwl 0xc04500(%ebx,%ebx,1),%eax
  c00a37:	00 
  c00a38:	0f bf d8             	movswl %ax,%ebx
  c00a3b:	85 db                	test   %ebx,%ebx
  c00a3d:	75 17                	jne    c00a56 <yylex+0x181>
  c00a3f:	8b 35 80 80 c0 00    	mov    0xc08080,%esi
  c00a45:	8b 1d 7c 80 c0 00    	mov    0xc0807c,%ebx
  c00a4b:	0f b7 84 1b 00 45 c0 	movzwl 0xc04500(%ebx,%ebx,1),%eax
  c00a52:	00 
  c00a53:	0f bf d8             	movswl %ax,%ebx
  c00a56:	89 3d d8 59 c2 00    	mov    %edi,0xc259d8
  c00a5c:	89 f2                	mov    %esi,%edx
  c00a5e:	89 f8                	mov    %edi,%eax
  c00a60:	29 c2                	sub    %eax,%edx
  c00a62:	89 d0                	mov    %edx,%eax
  c00a64:	a3 dc 59 c2 00       	mov    %eax,0xc259dc
  c00a69:	0f b6 06             	movzbl (%esi),%eax
  c00a6c:	a2 64 80 c0 00       	mov    %al,0xc08064
  c00a71:	c6 06 00             	movb   $0x0,(%esi)
  c00a74:	89 35 6c 80 c0 00    	mov    %esi,0xc0806c
  c00a7a:	83 fb 0a             	cmp    $0xa,%ebx
  c00a7d:	74 41                	je     c00ac0 <yylex+0x1eb>
  c00a7f:	8b 04 9d 80 4b c0 00 	mov    0xc04b80(,%ebx,4),%eax
  c00a86:	85 c0                	test   %eax,%eax
  c00a88:	74 36                	je     c00ac0 <yylex+0x1eb>
  c00a8a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  c00a91:	eb 23                	jmp    c00ab6 <yylex+0x1e1>
  c00a93:	8b 15 d8 59 c2 00    	mov    0xc259d8,%edx
  c00a99:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c00a9c:	01 d0                	add    %edx,%eax
  c00a9e:	0f b6 00             	movzbl (%eax),%eax
  c00aa1:	3c 0a                	cmp    $0xa,%al
  c00aa3:	75 0d                	jne    c00ab2 <yylex+0x1dd>
  c00aa5:	a1 0c 80 c0 00       	mov    0xc0800c,%eax
  c00aaa:	83 c0 01             	add    $0x1,%eax
  c00aad:	a3 0c 80 c0 00       	mov    %eax,0xc0800c
  c00ab2:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  c00ab6:	a1 dc 59 c2 00       	mov    0xc259dc,%eax
  c00abb:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
  c00abe:	72 d3                	jb     c00a93 <yylex+0x1be>
  c00ac0:	83 fb 0b             	cmp    $0xb,%ebx
  c00ac3:	0f 87 d8 02 00 00    	ja     c00da1 <yylex+0x4cc>
  c00ac9:	8b 04 9d f0 4b c0 00 	mov    0xc04bf0(,%ebx,4),%eax
  c00ad0:	ff e0                	jmp    *%eax
  c00ad2:	0f b6 05 64 80 c0 00 	movzbl 0xc08064,%eax
  c00ad9:	88 06                	mov    %al,(%esi)
  c00adb:	8b 35 80 80 c0 00    	mov    0xc08080,%esi
  c00ae1:	8b 1d 7c 80 c0 00    	mov    0xc0807c,%ebx
  c00ae7:	e9 44 ff ff ff       	jmp    c00a30 <yylex+0x15b>
  c00aec:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c00af1:	0f b6 00             	movzbl (%eax),%eax
  c00af4:	0f be c0             	movsbl %al,%eax
  c00af7:	e9 c0 02 00 00       	jmp    c00dbc <yylex+0x4e7>
  c00afc:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c00b01:	83 ec 0c             	sub    $0xc,%esp
  c00b04:	50                   	push   %eax
  c00b05:	e8 77 20 00 00       	call   c02b81 <atoi>
  c00b0a:	83 c4 10             	add    $0x10,%esp
  c00b0d:	a3 cc 59 c2 00       	mov    %eax,0xc259cc
  c00b12:	b8 02 01 00 00       	mov    $0x102,%eax
  c00b17:	e9 a0 02 00 00       	jmp    c00dbc <yylex+0x4e7>
  c00b1c:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c00b21:	83 ec 0c             	sub    $0xc,%esp
  c00b24:	50                   	push   %eax
  c00b25:	e8 57 20 00 00       	call   c02b81 <atoi>
  c00b2a:	83 c4 10             	add    $0x10,%esp
  c00b2d:	a3 cc 59 c2 00       	mov    %eax,0xc259cc
  c00b32:	b8 02 01 00 00       	mov    $0x102,%eax
  c00b37:	e9 80 02 00 00       	jmp    c00dbc <yylex+0x4e7>
  c00b3c:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c00b41:	83 ec 0c             	sub    $0xc,%esp
  c00b44:	50                   	push   %eax
  c00b45:	e8 37 20 00 00       	call   c02b81 <atoi>
  c00b4a:	83 c4 10             	add    $0x10,%esp
  c00b4d:	a3 cc 59 c2 00       	mov    %eax,0xc259cc
  c00b52:	b8 02 01 00 00       	mov    $0x102,%eax
  c00b57:	e9 60 02 00 00       	jmp    c00dbc <yylex+0x4e7>
  c00b5c:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c00b61:	8b 15 dc 59 c2 00    	mov    0xc259dc,%edx
  c00b67:	83 ea 01             	sub    $0x1,%edx
  c00b6a:	01 d0                	add    %edx,%eax
  c00b6c:	c6 00 00             	movb   $0x0,(%eax)
  c00b6f:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c00b74:	83 c0 01             	add    $0x1,%eax
  c00b77:	83 ec 0c             	sub    $0xc,%esp
  c00b7a:	50                   	push   %eax
  c00b7b:	e8 09 fd ff ff       	call   c00889 <strdup>
  c00b80:	83 c4 10             	add    $0x10,%esp
  c00b83:	a3 cc 59 c2 00       	mov    %eax,0xc259cc
  c00b88:	b8 04 01 00 00       	mov    $0x104,%eax
  c00b8d:	e9 2a 02 00 00       	jmp    c00dbc <yylex+0x4e7>
  c00b92:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c00b97:	83 ec 0c             	sub    $0xc,%esp
  c00b9a:	50                   	push   %eax
  c00b9b:	e8 27 21 00 00       	call   c02cc7 <lookup>
  c00ba0:	83 c4 10             	add    $0x10,%esp
  c00ba3:	a3 cc 59 c2 00       	mov    %eax,0xc259cc
  c00ba8:	b8 03 01 00 00       	mov    $0x103,%eax
  c00bad:	e9 0a 02 00 00       	jmp    c00dbc <yylex+0x4e7>
  c00bb2:	83 ec 0c             	sub    $0xc,%esp
  c00bb5:	68 a8 4b c0 00       	push   $0xc04ba8
  c00bba:	e8 f9 11 00 00       	call   c01db8 <yy_fatal_error>
  c00bbf:	83 c4 10             	add    $0x10,%esp
  c00bc2:	e9 f0 01 00 00       	jmp    c00db7 <yylex+0x4e2>
  c00bc7:	b8 00 00 00 00       	mov    $0x0,%eax
  c00bcc:	e9 eb 01 00 00       	jmp    c00dbc <yylex+0x4e7>
  c00bd1:	89 f2                	mov    %esi,%edx
  c00bd3:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c00bd8:	29 c2                	sub    %eax,%edx
  c00bda:	89 d0                	mov    %edx,%eax
  c00bdc:	83 e8 01             	sub    $0x1,%eax
  c00bdf:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c00be2:	0f b6 05 64 80 c0 00 	movzbl 0xc08064,%eax
  c00be9:	88 06                	mov    %al,(%esi)
  c00beb:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00bf0:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00bf6:	c1 e2 02             	shl    $0x2,%edx
  c00bf9:	01 d0                	add    %edx,%eax
  c00bfb:	8b 00                	mov    (%eax),%eax
  c00bfd:	8b 40 2c             	mov    0x2c(%eax),%eax
  c00c00:	85 c0                	test   %eax,%eax
  c00c02:	75 4d                	jne    c00c51 <yylex+0x37c>
  c00c04:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00c09:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00c0f:	c1 e2 02             	shl    $0x2,%edx
  c00c12:	01 d0                	add    %edx,%eax
  c00c14:	8b 00                	mov    (%eax),%eax
  c00c16:	8b 40 10             	mov    0x10(%eax),%eax
  c00c19:	a3 68 80 c0 00       	mov    %eax,0xc08068
  c00c1e:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00c23:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00c29:	c1 e2 02             	shl    $0x2,%edx
  c00c2c:	01 d0                	add    %edx,%eax
  c00c2e:	8b 00                	mov    (%eax),%eax
  c00c30:	8b 15 44 80 c0 00    	mov    0xc08044,%edx
  c00c36:	89 10                	mov    %edx,(%eax)
  c00c38:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00c3d:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00c43:	c1 e2 02             	shl    $0x2,%edx
  c00c46:	01 d0                	add    %edx,%eax
  c00c48:	8b 00                	mov    (%eax),%eax
  c00c4a:	c7 40 2c 01 00 00 00 	movl   $0x1,0x2c(%eax)
  c00c51:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00c56:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00c5c:	c1 e2 02             	shl    $0x2,%edx
  c00c5f:	01 d0                	add    %edx,%eax
  c00c61:	8b 00                	mov    (%eax),%eax
  c00c63:	8b 50 04             	mov    0x4(%eax),%edx
  c00c66:	a1 68 80 c0 00       	mov    0xc08068,%eax
  c00c6b:	01 c2                	add    %eax,%edx
  c00c6d:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c00c72:	39 c2                	cmp    %eax,%edx
  c00c74:	72 58                	jb     c00cce <yylex+0x3f9>
  c00c76:	8b 15 d8 59 c2 00    	mov    0xc259d8,%edx
  c00c7c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c00c7f:	01 d0                	add    %edx,%eax
  c00c81:	a3 6c 80 c0 00       	mov    %eax,0xc0806c
  c00c86:	e8 35 05 00 00       	call   c011c0 <yy_get_previous_state>
  c00c8b:	89 c3                	mov    %eax,%ebx
  c00c8d:	83 ec 0c             	sub    $0xc,%esp
  c00c90:	53                   	push   %ebx
  c00c91:	e8 ea 05 00 00       	call   c01280 <yy_try_NUL_trans>
  c00c96:	83 c4 10             	add    $0x10,%esp
  c00c99:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c00c9c:	8b 3d d8 59 c2 00    	mov    0xc259d8,%edi
  c00ca2:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  c00ca6:	74 1b                	je     c00cc3 <yylex+0x3ee>
  c00ca8:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c00cad:	83 c0 01             	add    $0x1,%eax
  c00cb0:	a3 6c 80 c0 00       	mov    %eax,0xc0806c
  c00cb5:	8b 35 6c 80 c0 00    	mov    0xc0806c,%esi
  c00cbb:	8b 5d dc             	mov    -0x24(%ebp),%ebx
  c00cbe:	e9 d4 fc ff ff       	jmp    c00997 <yylex+0xc2>
  c00cc3:	8b 35 6c 80 c0 00    	mov    0xc0806c,%esi
  c00cc9:	e9 62 fd ff ff       	jmp    c00a30 <yylex+0x15b>
  c00cce:	e8 f1 00 00 00       	call   c00dc4 <yy_get_next_buffer>
  c00cd3:	83 f8 01             	cmp    $0x1,%eax
  c00cd6:	74 12                	je     c00cea <yylex+0x415>
  c00cd8:	83 f8 02             	cmp    $0x2,%eax
  c00cdb:	0f 84 85 00 00 00    	je     c00d66 <yylex+0x491>
  c00ce1:	85 c0                	test   %eax,%eax
  c00ce3:	74 59                	je     c00d3e <yylex+0x469>
  c00ce5:	e9 cd 00 00 00       	jmp    c00db7 <yylex+0x4e2>
  c00cea:	c7 05 78 80 c0 00 00 	movl   $0x0,0xc08078
  c00cf1:	00 00 00 
  c00cf4:	e8 92 12 00 00       	call   c01f8b <yywrap>
  c00cf9:	85 c0                	test   %eax,%eax
  c00cfb:	74 23                	je     c00d20 <yylex+0x44b>
  c00cfd:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c00d02:	a3 6c 80 c0 00       	mov    %eax,0xc0806c
  c00d07:	a1 74 80 c0 00       	mov    0xc08074,%eax
  c00d0c:	83 e8 01             	sub    $0x1,%eax
  c00d0f:	89 c2                	mov    %eax,%edx
  c00d11:	c1 ea 1f             	shr    $0x1f,%edx
  c00d14:	01 d0                	add    %edx,%eax
  c00d16:	d1 f8                	sar    %eax
  c00d18:	8d 58 0b             	lea    0xb(%eax),%ebx
  c00d1b:	e9 a0 fd ff ff       	jmp    c00ac0 <yylex+0x1eb>
  c00d20:	a1 78 80 c0 00       	mov    0xc08078,%eax
  c00d25:	85 c0                	test   %eax,%eax
  c00d27:	75 13                	jne    c00d3c <yylex+0x467>
  c00d29:	a1 44 80 c0 00       	mov    0xc08044,%eax
  c00d2e:	83 ec 0c             	sub    $0xc,%esp
  c00d31:	50                   	push   %eax
  c00d32:	e8 7a 08 00 00       	call   c015b1 <yyrestart>
  c00d37:	83 c4 10             	add    $0x10,%esp
  c00d3a:	eb 63                	jmp    c00d9f <yylex+0x4ca>
  c00d3c:	eb 61                	jmp    c00d9f <yylex+0x4ca>
  c00d3e:	8b 15 d8 59 c2 00    	mov    0xc259d8,%edx
  c00d44:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c00d47:	01 d0                	add    %edx,%eax
  c00d49:	a3 6c 80 c0 00       	mov    %eax,0xc0806c
  c00d4e:	e8 6d 04 00 00       	call   c011c0 <yy_get_previous_state>
  c00d53:	89 c3                	mov    %eax,%ebx
  c00d55:	8b 35 6c 80 c0 00    	mov    0xc0806c,%esi
  c00d5b:	8b 3d d8 59 c2 00    	mov    0xc259d8,%edi
  c00d61:	e9 31 fc ff ff       	jmp    c00997 <yylex+0xc2>
  c00d66:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00d6b:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00d71:	c1 e2 02             	shl    $0x2,%edx
  c00d74:	01 d0                	add    %edx,%eax
  c00d76:	8b 00                	mov    (%eax),%eax
  c00d78:	8b 50 04             	mov    0x4(%eax),%edx
  c00d7b:	a1 68 80 c0 00       	mov    0xc08068,%eax
  c00d80:	01 d0                	add    %edx,%eax
  c00d82:	a3 6c 80 c0 00       	mov    %eax,0xc0806c
  c00d87:	e8 34 04 00 00       	call   c011c0 <yy_get_previous_state>
  c00d8c:	89 c3                	mov    %eax,%ebx
  c00d8e:	8b 35 6c 80 c0 00    	mov    0xc0806c,%esi
  c00d94:	8b 3d d8 59 c2 00    	mov    0xc259d8,%edi
  c00d9a:	e9 91 fc ff ff       	jmp    c00a30 <yylex+0x15b>
  c00d9f:	eb 16                	jmp    c00db7 <yylex+0x4e2>
  c00da1:	83 ec 0c             	sub    $0xc,%esp
  c00da4:	68 bc 4b c0 00       	push   $0xc04bbc
  c00da9:	e8 0a 10 00 00       	call   c01db8 <yy_fatal_error>
  c00dae:	83 c4 10             	add    $0x10,%esp
  c00db1:	e9 ca fb ff ff       	jmp    c00980 <yylex+0xab>
  c00db6:	90                   	nop
  c00db7:	e9 c4 fb ff ff       	jmp    c00980 <yylex+0xab>
  c00dbc:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c00dbf:	5b                   	pop    %ebx
  c00dc0:	5e                   	pop    %esi
  c00dc1:	5f                   	pop    %edi
  c00dc2:	5d                   	pop    %ebp
  c00dc3:	c3                   	ret    

00c00dc4 <yy_get_next_buffer>:
  c00dc4:	55                   	push   %ebp
  c00dc5:	89 e5                	mov    %esp,%ebp
  c00dc7:	57                   	push   %edi
  c00dc8:	56                   	push   %esi
  c00dc9:	53                   	push   %ebx
  c00dca:	83 ec 3c             	sub    $0x3c,%esp
  c00dcd:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00dd2:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00dd8:	c1 e2 02             	shl    $0x2,%edx
  c00ddb:	01 d0                	add    %edx,%eax
  c00ddd:	8b 00                	mov    (%eax),%eax
  c00ddf:	8b 78 04             	mov    0x4(%eax),%edi
  c00de2:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c00de7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  c00dea:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00def:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00df5:	c1 e2 02             	shl    $0x2,%edx
  c00df8:	01 d0                	add    %edx,%eax
  c00dfa:	8b 00                	mov    (%eax),%eax
  c00dfc:	8b 40 04             	mov    0x4(%eax),%eax
  c00dff:	8b 15 68 80 c0 00    	mov    0xc08068,%edx
  c00e05:	83 c2 01             	add    $0x1,%edx
  c00e08:	01 c2                	add    %eax,%edx
  c00e0a:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c00e0f:	39 c2                	cmp    %eax,%edx
  c00e11:	73 10                	jae    c00e23 <yy_get_next_buffer+0x5f>
  c00e13:	83 ec 0c             	sub    $0xc,%esp
  c00e16:	68 20 4c c0 00       	push   $0xc04c20
  c00e1b:	e8 98 0f 00 00       	call   c01db8 <yy_fatal_error>
  c00e20:	83 c4 10             	add    $0x10,%esp
  c00e23:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00e28:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00e2e:	c1 e2 02             	shl    $0x2,%edx
  c00e31:	01 d0                	add    %edx,%eax
  c00e33:	8b 00                	mov    (%eax),%eax
  c00e35:	8b 40 28             	mov    0x28(%eax),%eax
  c00e38:	85 c0                	test   %eax,%eax
  c00e3a:	75 29                	jne    c00e65 <yy_get_next_buffer+0xa1>
  c00e3c:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c00e41:	89 c2                	mov    %eax,%edx
  c00e43:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c00e48:	29 c2                	sub    %eax,%edx
  c00e4a:	89 d0                	mov    %edx,%eax
  c00e4c:	83 f8 01             	cmp    $0x1,%eax
  c00e4f:	75 0a                	jne    c00e5b <yy_get_next_buffer+0x97>
  c00e51:	b8 01 00 00 00       	mov    $0x1,%eax
  c00e56:	e9 5d 03 00 00       	jmp    c011b8 <yy_get_next_buffer+0x3f4>
  c00e5b:	b8 02 00 00 00       	mov    $0x2,%eax
  c00e60:	e9 53 03 00 00       	jmp    c011b8 <yy_get_next_buffer+0x3f4>
  c00e65:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c00e6a:	89 c2                	mov    %eax,%edx
  c00e6c:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c00e71:	29 c2                	sub    %eax,%edx
  c00e73:	89 d0                	mov    %edx,%eax
  c00e75:	8d 58 ff             	lea    -0x1(%eax),%ebx
  c00e78:	be 00 00 00 00       	mov    $0x0,%esi
  c00e7d:	eb 16                	jmp    c00e95 <yy_get_next_buffer+0xd1>
  c00e7f:	89 f8                	mov    %edi,%eax
  c00e81:	8d 78 01             	lea    0x1(%eax),%edi
  c00e84:	8b 55 c4             	mov    -0x3c(%ebp),%edx
  c00e87:	8d 4a 01             	lea    0x1(%edx),%ecx
  c00e8a:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  c00e8d:	0f b6 12             	movzbl (%edx),%edx
  c00e90:	88 10                	mov    %dl,(%eax)
  c00e92:	83 c6 01             	add    $0x1,%esi
  c00e95:	39 de                	cmp    %ebx,%esi
  c00e97:	7c e6                	jl     c00e7f <yy_get_next_buffer+0xbb>
  c00e99:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00e9e:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00ea4:	c1 e2 02             	shl    $0x2,%edx
  c00ea7:	01 d0                	add    %edx,%eax
  c00ea9:	8b 00                	mov    (%eax),%eax
  c00eab:	8b 40 2c             	mov    0x2c(%eax),%eax
  c00eae:	83 f8 02             	cmp    $0x2,%eax
  c00eb1:	75 2a                	jne    c00edd <yy_get_next_buffer+0x119>
  c00eb3:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00eb8:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00ebe:	c1 e2 02             	shl    $0x2,%edx
  c00ec1:	01 d0                	add    %edx,%eax
  c00ec3:	8b 00                	mov    (%eax),%eax
  c00ec5:	c7 05 68 80 c0 00 00 	movl   $0x0,0xc08068
  c00ecc:	00 00 00 
  c00ecf:	8b 15 68 80 c0 00    	mov    0xc08068,%edx
  c00ed5:	89 50 10             	mov    %edx,0x10(%eax)
  c00ed8:	e9 81 01 00 00       	jmp    c0105e <yy_get_next_buffer+0x29a>
  c00edd:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00ee2:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00ee8:	c1 e2 02             	shl    $0x2,%edx
  c00eeb:	01 d0                	add    %edx,%eax
  c00eed:	8b 00                	mov    (%eax),%eax
  c00eef:	8b 50 0c             	mov    0xc(%eax),%edx
  c00ef2:	89 d8                	mov    %ebx,%eax
  c00ef4:	29 c2                	sub    %eax,%edx
  c00ef6:	89 d0                	mov    %edx,%eax
  c00ef8:	83 e8 01             	sub    $0x1,%eax
  c00efb:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c00efe:	e9 e5 00 00 00       	jmp    c00fe8 <yy_get_next_buffer+0x224>
  c00f03:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00f08:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00f0e:	c1 e2 02             	shl    $0x2,%edx
  c00f11:	01 d0                	add    %edx,%eax
  c00f13:	8b 00                	mov    (%eax),%eax
  c00f15:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c00f18:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c00f1d:	89 c2                	mov    %eax,%edx
  c00f1f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00f22:	8b 40 04             	mov    0x4(%eax),%eax
  c00f25:	29 c2                	sub    %eax,%edx
  c00f27:	89 d0                	mov    %edx,%eax
  c00f29:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c00f2c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00f2f:	8b 40 14             	mov    0x14(%eax),%eax
  c00f32:	85 c0                	test   %eax,%eax
  c00f34:	74 5d                	je     c00f93 <yy_get_next_buffer+0x1cf>
  c00f36:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00f39:	8b 40 0c             	mov    0xc(%eax),%eax
  c00f3c:	01 c0                	add    %eax,%eax
  c00f3e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  c00f41:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  c00f45:	75 19                	jne    c00f60 <yy_get_next_buffer+0x19c>
  c00f47:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00f4a:	8b 50 0c             	mov    0xc(%eax),%edx
  c00f4d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00f50:	8b 40 0c             	mov    0xc(%eax),%eax
  c00f53:	c1 e8 03             	shr    $0x3,%eax
  c00f56:	01 c2                	add    %eax,%edx
  c00f58:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00f5b:	89 50 0c             	mov    %edx,0xc(%eax)
  c00f5e:	eb 0f                	jmp    c00f6f <yy_get_next_buffer+0x1ab>
  c00f60:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00f63:	8b 40 0c             	mov    0xc(%eax),%eax
  c00f66:	8d 14 00             	lea    (%eax,%eax,1),%edx
  c00f69:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00f6c:	89 50 0c             	mov    %edx,0xc(%eax)
  c00f6f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00f72:	8b 40 0c             	mov    0xc(%eax),%eax
  c00f75:	8d 50 02             	lea    0x2(%eax),%edx
  c00f78:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00f7b:	8b 40 04             	mov    0x4(%eax),%eax
  c00f7e:	83 ec 08             	sub    $0x8,%esp
  c00f81:	52                   	push   %edx
  c00f82:	50                   	push   %eax
  c00f83:	e8 d4 0f 00 00       	call   c01f5c <yyrealloc>
  c00f88:	83 c4 10             	add    $0x10,%esp
  c00f8b:	8b 55 dc             	mov    -0x24(%ebp),%edx
  c00f8e:	89 42 04             	mov    %eax,0x4(%edx)
  c00f91:	eb 0a                	jmp    c00f9d <yy_get_next_buffer+0x1d9>
  c00f93:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00f96:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  c00f9d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00fa0:	8b 40 04             	mov    0x4(%eax),%eax
  c00fa3:	85 c0                	test   %eax,%eax
  c00fa5:	75 10                	jne    c00fb7 <yy_get_next_buffer+0x1f3>
  c00fa7:	83 ec 0c             	sub    $0xc,%esp
  c00faa:	68 58 4c c0 00       	push   $0xc04c58
  c00faf:	e8 04 0e 00 00       	call   c01db8 <yy_fatal_error>
  c00fb4:	83 c4 10             	add    $0x10,%esp
  c00fb7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c00fba:	8b 50 04             	mov    0x4(%eax),%edx
  c00fbd:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c00fc0:	01 d0                	add    %edx,%eax
  c00fc2:	a3 6c 80 c0 00       	mov    %eax,0xc0806c
  c00fc7:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c00fcc:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c00fd2:	c1 e2 02             	shl    $0x2,%edx
  c00fd5:	01 d0                	add    %edx,%eax
  c00fd7:	8b 00                	mov    (%eax),%eax
  c00fd9:	8b 50 0c             	mov    0xc(%eax),%edx
  c00fdc:	89 d8                	mov    %ebx,%eax
  c00fde:	29 c2                	sub    %eax,%edx
  c00fe0:	89 d0                	mov    %edx,%eax
  c00fe2:	83 e8 01             	sub    $0x1,%eax
  c00fe5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c00fe8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  c00fec:	0f 84 11 ff ff ff    	je     c00f03 <yy_get_next_buffer+0x13f>
  c00ff2:	81 7d e0 00 20 00 00 	cmpl   $0x2000,-0x20(%ebp)
  c00ff9:	76 07                	jbe    c01002 <yy_get_next_buffer+0x23e>
  c00ffb:	c7 45 e0 00 20 00 00 	movl   $0x2000,-0x20(%ebp)
  c01002:	8b 75 e0             	mov    -0x20(%ebp),%esi
  c01005:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0100a:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01010:	c1 e2 02             	shl    $0x2,%edx
  c01013:	01 d0                	add    %edx,%eax
  c01015:	8b 00                	mov    (%eax),%eax
  c01017:	8b 50 04             	mov    0x4(%eax),%edx
  c0101a:	89 d8                	mov    %ebx,%eax
  c0101c:	8d 3c 02             	lea    (%edx,%eax,1),%edi
  c0101f:	a1 04 80 c0 00       	mov    0xc08004,%eax
  c01024:	83 ec 0c             	sub    $0xc,%esp
  c01027:	50                   	push   %eax
  c01028:	e8 52 f8 ff ff       	call   c0087f <fileno>
  c0102d:	83 c4 10             	add    $0x10,%esp
  c01030:	83 ec 04             	sub    $0x4,%esp
  c01033:	56                   	push   %esi
  c01034:	57                   	push   %edi
  c01035:	50                   	push   %eax
  c01036:	e8 3a 22 00 00       	call   c03275 <read>
  c0103b:	83 c4 10             	add    $0x10,%esp
  c0103e:	a3 68 80 c0 00       	mov    %eax,0xc08068
  c01043:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01048:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c0104e:	c1 e2 02             	shl    $0x2,%edx
  c01051:	01 d0                	add    %edx,%eax
  c01053:	8b 00                	mov    (%eax),%eax
  c01055:	8b 15 68 80 c0 00    	mov    0xc08068,%edx
  c0105b:	89 50 10             	mov    %edx,0x10(%eax)
  c0105e:	a1 68 80 c0 00       	mov    0xc08068,%eax
  c01063:	85 c0                	test   %eax,%eax
  c01065:	75 40                	jne    c010a7 <yy_get_next_buffer+0x2e3>
  c01067:	85 db                	test   %ebx,%ebx
  c01069:	75 1a                	jne    c01085 <yy_get_next_buffer+0x2c1>
  c0106b:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  c01072:	a1 44 80 c0 00       	mov    0xc08044,%eax
  c01077:	83 ec 0c             	sub    $0xc,%esp
  c0107a:	50                   	push   %eax
  c0107b:	e8 31 05 00 00       	call   c015b1 <yyrestart>
  c01080:	83 c4 10             	add    $0x10,%esp
  c01083:	eb 29                	jmp    c010ae <yy_get_next_buffer+0x2ea>
  c01085:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  c0108c:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01091:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01097:	c1 e2 02             	shl    $0x2,%edx
  c0109a:	01 d0                	add    %edx,%eax
  c0109c:	8b 00                	mov    (%eax),%eax
  c0109e:	c7 40 2c 02 00 00 00 	movl   $0x2,0x2c(%eax)
  c010a5:	eb 07                	jmp    c010ae <yy_get_next_buffer+0x2ea>
  c010a7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  c010ae:	8b 15 68 80 c0 00    	mov    0xc08068,%edx
  c010b4:	89 d8                	mov    %ebx,%eax
  c010b6:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  c010b9:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c010be:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c010c4:	c1 e2 02             	shl    $0x2,%edx
  c010c7:	01 d0                	add    %edx,%eax
  c010c9:	8b 00                	mov    (%eax),%eax
  c010cb:	8b 40 0c             	mov    0xc(%eax),%eax
  c010ce:	39 c1                	cmp    %eax,%ecx
  c010d0:	76 78                	jbe    c0114a <yy_get_next_buffer+0x386>
  c010d2:	8b 15 68 80 c0 00    	mov    0xc08068,%edx
  c010d8:	89 d8                	mov    %ebx,%eax
  c010da:	01 c2                	add    %eax,%edx
  c010dc:	a1 68 80 c0 00       	mov    0xc08068,%eax
  c010e1:	d1 e8                	shr    %eax
  c010e3:	01 d0                	add    %edx,%eax
  c010e5:	89 45 d0             	mov    %eax,-0x30(%ebp)
  c010e8:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c010ed:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c010f3:	c1 e2 02             	shl    $0x2,%edx
  c010f6:	01 d0                	add    %edx,%eax
  c010f8:	8b 30                	mov    (%eax),%esi
  c010fa:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c010ff:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01105:	c1 e2 02             	shl    $0x2,%edx
  c01108:	01 d0                	add    %edx,%eax
  c0110a:	8b 00                	mov    (%eax),%eax
  c0110c:	8b 40 04             	mov    0x4(%eax),%eax
  c0110f:	83 ec 08             	sub    $0x8,%esp
  c01112:	ff 75 d0             	pushl  -0x30(%ebp)
  c01115:	50                   	push   %eax
  c01116:	e8 41 0e 00 00       	call   c01f5c <yyrealloc>
  c0111b:	83 c4 10             	add    $0x10,%esp
  c0111e:	89 46 04             	mov    %eax,0x4(%esi)
  c01121:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01126:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c0112c:	c1 e2 02             	shl    $0x2,%edx
  c0112f:	01 d0                	add    %edx,%eax
  c01131:	8b 00                	mov    (%eax),%eax
  c01133:	8b 40 04             	mov    0x4(%eax),%eax
  c01136:	85 c0                	test   %eax,%eax
  c01138:	75 10                	jne    c0114a <yy_get_next_buffer+0x386>
  c0113a:	83 ec 0c             	sub    $0xc,%esp
  c0113d:	68 84 4c c0 00       	push   $0xc04c84
  c01142:	e8 71 0c 00 00       	call   c01db8 <yy_fatal_error>
  c01147:	83 c4 10             	add    $0x10,%esp
  c0114a:	8b 15 68 80 c0 00    	mov    0xc08068,%edx
  c01150:	89 d8                	mov    %ebx,%eax
  c01152:	01 d0                	add    %edx,%eax
  c01154:	a3 68 80 c0 00       	mov    %eax,0xc08068
  c01159:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0115e:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01164:	c1 e2 02             	shl    $0x2,%edx
  c01167:	01 d0                	add    %edx,%eax
  c01169:	8b 00                	mov    (%eax),%eax
  c0116b:	8b 50 04             	mov    0x4(%eax),%edx
  c0116e:	a1 68 80 c0 00       	mov    0xc08068,%eax
  c01173:	01 d0                	add    %edx,%eax
  c01175:	c6 00 00             	movb   $0x0,(%eax)
  c01178:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0117d:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01183:	c1 e2 02             	shl    $0x2,%edx
  c01186:	01 d0                	add    %edx,%eax
  c01188:	8b 00                	mov    (%eax),%eax
  c0118a:	8b 40 04             	mov    0x4(%eax),%eax
  c0118d:	8b 15 68 80 c0 00    	mov    0xc08068,%edx
  c01193:	83 c2 01             	add    $0x1,%edx
  c01196:	01 d0                	add    %edx,%eax
  c01198:	c6 00 00             	movb   $0x0,(%eax)
  c0119b:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c011a0:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c011a6:	c1 e2 02             	shl    $0x2,%edx
  c011a9:	01 d0                	add    %edx,%eax
  c011ab:	8b 00                	mov    (%eax),%eax
  c011ad:	8b 40 04             	mov    0x4(%eax),%eax
  c011b0:	a3 d8 59 c2 00       	mov    %eax,0xc259d8
  c011b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c011b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c011bb:	5b                   	pop    %ebx
  c011bc:	5e                   	pop    %esi
  c011bd:	5f                   	pop    %edi
  c011be:	5d                   	pop    %ebp
  c011bf:	c3                   	ret    

00c011c0 <yy_get_previous_state>:
  c011c0:	55                   	push   %ebp
  c011c1:	89 e5                	mov    %esp,%ebp
  c011c3:	57                   	push   %edi
  c011c4:	56                   	push   %esi
  c011c5:	53                   	push   %ebx
  c011c6:	8b 1d 74 80 c0 00    	mov    0xc08074,%ebx
  c011cc:	8b 35 d8 59 c2 00    	mov    0xc259d8,%esi
  c011d2:	e9 95 00 00 00       	jmp    c0126c <yy_get_previous_state+0xac>
  c011d7:	0f b6 06             	movzbl (%esi),%eax
  c011da:	84 c0                	test   %al,%al
  c011dc:	74 0f                	je     c011ed <yy_get_previous_state+0x2d>
  c011de:	0f b6 06             	movzbl (%esi),%eax
  c011e1:	0f b6 c0             	movzbl %al,%eax
  c011e4:	8b 04 85 40 45 c0 00 	mov    0xc04540(,%eax,4),%eax
  c011eb:	eb 05                	jmp    c011f2 <yy_get_previous_state+0x32>
  c011ed:	b8 01 00 00 00       	mov    $0x1,%eax
  c011f2:	89 c7                	mov    %eax,%edi
  c011f4:	0f b7 84 1b 00 45 c0 	movzwl 0xc04500(%ebx,%ebx,1),%eax
  c011fb:	00 
  c011fc:	66 85 c0             	test   %ax,%ax
  c011ff:	74 0c                	je     c0120d <yy_get_previous_state+0x4d>
  c01201:	89 1d 7c 80 c0 00    	mov    %ebx,0xc0807c
  c01207:	89 35 80 80 c0 00    	mov    %esi,0xc08080
  c0120d:	eb 1e                	jmp    c0122d <yy_get_previous_state+0x6d>
  c0120f:	0f b7 84 1b c0 49 c0 	movzwl 0xc049c0(%ebx,%ebx,1),%eax
  c01216:	00 
  c01217:	0f bf d8             	movswl %ax,%ebx
  c0121a:	83 fb 18             	cmp    $0x18,%ebx
  c0121d:	7e 0e                	jle    c0122d <yy_get_previous_state+0x6d>
  c0121f:	89 f8                	mov    %edi,%eax
  c01221:	0f b6 c0             	movzbl %al,%eax
  c01224:	8b 04 85 40 49 c0 00 	mov    0xc04940(,%eax,4),%eax
  c0122b:	89 c7                	mov    %eax,%edi
  c0122d:	0f b7 84 1b 80 49 c0 	movzwl 0xc04980(%ebx,%ebx,1),%eax
  c01234:	00 
  c01235:	0f bf d0             	movswl %ax,%edx
  c01238:	89 f8                	mov    %edi,%eax
  c0123a:	0f b6 c0             	movzbl %al,%eax
  c0123d:	01 d0                	add    %edx,%eax
  c0123f:	0f b7 84 00 c0 4a c0 	movzwl 0xc04ac0(%eax,%eax,1),%eax
  c01246:	00 
  c01247:	98                   	cwtl   
  c01248:	39 d8                	cmp    %ebx,%eax
  c0124a:	75 c3                	jne    c0120f <yy_get_previous_state+0x4f>
  c0124c:	0f b7 84 1b 80 49 c0 	movzwl 0xc04980(%ebx,%ebx,1),%eax
  c01253:	00 
  c01254:	0f bf d0             	movswl %ax,%edx
  c01257:	89 f8                	mov    %edi,%eax
  c01259:	0f b6 c0             	movzbl %al,%eax
  c0125c:	01 d0                	add    %edx,%eax
  c0125e:	0f b7 84 00 00 4a c0 	movzwl 0xc04a00(%eax,%eax,1),%eax
  c01265:	00 
  c01266:	0f bf d8             	movswl %ax,%ebx
  c01269:	83 c6 01             	add    $0x1,%esi
  c0126c:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c01271:	39 c6                	cmp    %eax,%esi
  c01273:	0f 82 5e ff ff ff    	jb     c011d7 <yy_get_previous_state+0x17>
  c01279:	89 d8                	mov    %ebx,%eax
  c0127b:	5b                   	pop    %ebx
  c0127c:	5e                   	pop    %esi
  c0127d:	5f                   	pop    %edi
  c0127e:	5d                   	pop    %ebp
  c0127f:	c3                   	ret    

00c01280 <yy_try_NUL_trans>:
  c01280:	55                   	push   %ebp
  c01281:	89 e5                	mov    %esp,%ebp
  c01283:	56                   	push   %esi
  c01284:	53                   	push   %ebx
  c01285:	8b 35 6c 80 c0 00    	mov    0xc0806c,%esi
  c0128b:	bb 01 00 00 00       	mov    $0x1,%ebx
  c01290:	8b 45 08             	mov    0x8(%ebp),%eax
  c01293:	0f b7 84 00 00 45 c0 	movzwl 0xc04500(%eax,%eax,1),%eax
  c0129a:	00 
  c0129b:	66 85 c0             	test   %ax,%ax
  c0129e:	74 0e                	je     c012ae <yy_try_NUL_trans+0x2e>
  c012a0:	8b 45 08             	mov    0x8(%ebp),%eax
  c012a3:	a3 7c 80 c0 00       	mov    %eax,0xc0807c
  c012a8:	89 35 80 80 c0 00    	mov    %esi,0xc08080
  c012ae:	eb 21                	jmp    c012d1 <yy_try_NUL_trans+0x51>
  c012b0:	8b 45 08             	mov    0x8(%ebp),%eax
  c012b3:	0f b7 84 00 c0 49 c0 	movzwl 0xc049c0(%eax,%eax,1),%eax
  c012ba:	00 
  c012bb:	98                   	cwtl   
  c012bc:	89 45 08             	mov    %eax,0x8(%ebp)
  c012bf:	83 7d 08 18          	cmpl   $0x18,0x8(%ebp)
  c012c3:	7e 0c                	jle    c012d1 <yy_try_NUL_trans+0x51>
  c012c5:	0f b6 c3             	movzbl %bl,%eax
  c012c8:	8b 04 85 40 49 c0 00 	mov    0xc04940(,%eax,4),%eax
  c012cf:	89 c3                	mov    %eax,%ebx
  c012d1:	8b 45 08             	mov    0x8(%ebp),%eax
  c012d4:	0f b7 84 00 80 49 c0 	movzwl 0xc04980(%eax,%eax,1),%eax
  c012db:	00 
  c012dc:	0f bf d0             	movswl %ax,%edx
  c012df:	0f b6 c3             	movzbl %bl,%eax
  c012e2:	01 d0                	add    %edx,%eax
  c012e4:	0f b7 84 00 c0 4a c0 	movzwl 0xc04ac0(%eax,%eax,1),%eax
  c012eb:	00 
  c012ec:	98                   	cwtl   
  c012ed:	3b 45 08             	cmp    0x8(%ebp),%eax
  c012f0:	75 be                	jne    c012b0 <yy_try_NUL_trans+0x30>
  c012f2:	8b 45 08             	mov    0x8(%ebp),%eax
  c012f5:	0f b7 84 00 80 49 c0 	movzwl 0xc04980(%eax,%eax,1),%eax
  c012fc:	00 
  c012fd:	0f bf d0             	movswl %ax,%edx
  c01300:	0f b6 c3             	movzbl %bl,%eax
  c01303:	01 d0                	add    %edx,%eax
  c01305:	0f b7 84 00 00 4a c0 	movzwl 0xc04a00(%eax,%eax,1),%eax
  c0130c:	00 
  c0130d:	98                   	cwtl   
  c0130e:	89 45 08             	mov    %eax,0x8(%ebp)
  c01311:	83 7d 08 18          	cmpl   $0x18,0x8(%ebp)
  c01315:	0f 94 c0             	sete   %al
  c01318:	0f b6 d8             	movzbl %al,%ebx
  c0131b:	85 db                	test   %ebx,%ebx
  c0131d:	75 05                	jne    c01324 <yy_try_NUL_trans+0xa4>
  c0131f:	8b 45 08             	mov    0x8(%ebp),%eax
  c01322:	eb 05                	jmp    c01329 <yy_try_NUL_trans+0xa9>
  c01324:	b8 00 00 00 00       	mov    $0x0,%eax
  c01329:	5b                   	pop    %ebx
  c0132a:	5e                   	pop    %esi
  c0132b:	5d                   	pop    %ebp
  c0132c:	c3                   	ret    

00c0132d <yyunput>:
  c0132d:	55                   	push   %ebp
  c0132e:	89 e5                	mov    %esp,%ebp
  c01330:	57                   	push   %edi
  c01331:	56                   	push   %esi
  c01332:	53                   	push   %ebx
  c01333:	83 ec 0c             	sub    $0xc,%esp
  c01336:	8b 1d 6c 80 c0 00    	mov    0xc0806c,%ebx
  c0133c:	0f b6 05 64 80 c0 00 	movzbl 0xc08064,%eax
  c01343:	88 03                	mov    %al,(%ebx)
  c01345:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0134a:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01350:	c1 e2 02             	shl    $0x2,%edx
  c01353:	01 d0                	add    %edx,%eax
  c01355:	8b 00                	mov    (%eax),%eax
  c01357:	8b 40 04             	mov    0x4(%eax),%eax
  c0135a:	83 c0 02             	add    $0x2,%eax
  c0135d:	39 d8                	cmp    %ebx,%eax
  c0135f:	0f 86 ed 00 00 00    	jbe    c01452 <yyunput+0x125>
  c01365:	a1 68 80 c0 00       	mov    0xc08068,%eax
  c0136a:	8d 70 02             	lea    0x2(%eax),%esi
  c0136d:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01372:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01378:	c1 e2 02             	shl    $0x2,%edx
  c0137b:	01 d0                	add    %edx,%eax
  c0137d:	8b 00                	mov    (%eax),%eax
  c0137f:	8b 50 04             	mov    0x4(%eax),%edx
  c01382:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01387:	8b 0d 58 80 c0 00    	mov    0xc08058,%ecx
  c0138d:	c1 e1 02             	shl    $0x2,%ecx
  c01390:	01 c8                	add    %ecx,%eax
  c01392:	8b 00                	mov    (%eax),%eax
  c01394:	8b 40 0c             	mov    0xc(%eax),%eax
  c01397:	83 c0 02             	add    $0x2,%eax
  c0139a:	8d 3c 02             	lea    (%edx,%eax,1),%edi
  c0139d:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c013a2:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c013a8:	c1 e2 02             	shl    $0x2,%edx
  c013ab:	01 d0                	add    %edx,%eax
  c013ad:	8b 00                	mov    (%eax),%eax
  c013af:	8b 40 04             	mov    0x4(%eax),%eax
  c013b2:	01 c6                	add    %eax,%esi
  c013b4:	eb 0b                	jmp    c013c1 <yyunput+0x94>
  c013b6:	83 ef 01             	sub    $0x1,%edi
  c013b9:	83 ee 01             	sub    $0x1,%esi
  c013bc:	0f b6 06             	movzbl (%esi),%eax
  c013bf:	88 07                	mov    %al,(%edi)
  c013c1:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c013c6:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c013cc:	c1 e2 02             	shl    $0x2,%edx
  c013cf:	01 d0                	add    %edx,%eax
  c013d1:	8b 00                	mov    (%eax),%eax
  c013d3:	8b 40 04             	mov    0x4(%eax),%eax
  c013d6:	39 f0                	cmp    %esi,%eax
  c013d8:	72 dc                	jb     c013b6 <yyunput+0x89>
  c013da:	89 fa                	mov    %edi,%edx
  c013dc:	89 f0                	mov    %esi,%eax
  c013de:	29 c2                	sub    %eax,%edx
  c013e0:	89 d0                	mov    %edx,%eax
  c013e2:	01 c3                	add    %eax,%ebx
  c013e4:	89 fa                	mov    %edi,%edx
  c013e6:	89 f0                	mov    %esi,%eax
  c013e8:	29 c2                	sub    %eax,%edx
  c013ea:	89 d0                	mov    %edx,%eax
  c013ec:	01 45 0c             	add    %eax,0xc(%ebp)
  c013ef:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c013f4:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c013fa:	c1 e2 02             	shl    $0x2,%edx
  c013fd:	01 d0                	add    %edx,%eax
  c013ff:	8b 00                	mov    (%eax),%eax
  c01401:	8b 15 60 80 c0 00    	mov    0xc08060,%edx
  c01407:	8b 0d 58 80 c0 00    	mov    0xc08058,%ecx
  c0140d:	c1 e1 02             	shl    $0x2,%ecx
  c01410:	01 ca                	add    %ecx,%edx
  c01412:	8b 12                	mov    (%edx),%edx
  c01414:	8b 52 0c             	mov    0xc(%edx),%edx
  c01417:	89 15 68 80 c0 00    	mov    %edx,0xc08068
  c0141d:	8b 15 68 80 c0 00    	mov    0xc08068,%edx
  c01423:	89 50 10             	mov    %edx,0x10(%eax)
  c01426:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0142b:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01431:	c1 e2 02             	shl    $0x2,%edx
  c01434:	01 d0                	add    %edx,%eax
  c01436:	8b 00                	mov    (%eax),%eax
  c01438:	8b 40 04             	mov    0x4(%eax),%eax
  c0143b:	83 c0 02             	add    $0x2,%eax
  c0143e:	39 d8                	cmp    %ebx,%eax
  c01440:	76 10                	jbe    c01452 <yyunput+0x125>
  c01442:	83 ec 0c             	sub    $0xc,%esp
  c01445:	68 b4 4c c0 00       	push   $0xc04cb4
  c0144a:	e8 69 09 00 00       	call   c01db8 <yy_fatal_error>
  c0144f:	83 c4 10             	add    $0x10,%esp
  c01452:	83 eb 01             	sub    $0x1,%ebx
  c01455:	8b 45 08             	mov    0x8(%ebp),%eax
  c01458:	88 03                	mov    %al,(%ebx)
  c0145a:	83 7d 08 0a          	cmpl   $0xa,0x8(%ebp)
  c0145e:	75 0d                	jne    c0146d <yyunput+0x140>
  c01460:	a1 0c 80 c0 00       	mov    0xc0800c,%eax
  c01465:	83 e8 01             	sub    $0x1,%eax
  c01468:	a3 0c 80 c0 00       	mov    %eax,0xc0800c
  c0146d:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01470:	a3 d8 59 c2 00       	mov    %eax,0xc259d8
  c01475:	0f b6 03             	movzbl (%ebx),%eax
  c01478:	a2 64 80 c0 00       	mov    %al,0xc08064
  c0147d:	89 1d 6c 80 c0 00    	mov    %ebx,0xc0806c
  c01483:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c01486:	5b                   	pop    %ebx
  c01487:	5e                   	pop    %esi
  c01488:	5f                   	pop    %edi
  c01489:	5d                   	pop    %ebp
  c0148a:	c3                   	ret    

00c0148b <input>:
  c0148b:	55                   	push   %ebp
  c0148c:	89 e5                	mov    %esp,%ebp
  c0148e:	83 ec 18             	sub    $0x18,%esp
  c01491:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c01496:	0f b6 15 64 80 c0 00 	movzbl 0xc08064,%edx
  c0149d:	88 10                	mov    %dl,(%eax)
  c0149f:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c014a4:	0f b6 00             	movzbl (%eax),%eax
  c014a7:	84 c0                	test   %al,%al
  c014a9:	0f 85 ba 00 00 00    	jne    c01569 <input+0xde>
  c014af:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c014b4:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c014ba:	c1 e2 02             	shl    $0x2,%edx
  c014bd:	01 d0                	add    %edx,%eax
  c014bf:	8b 00                	mov    (%eax),%eax
  c014c1:	8b 50 04             	mov    0x4(%eax),%edx
  c014c4:	a1 68 80 c0 00       	mov    0xc08068,%eax
  c014c9:	01 c2                	add    %eax,%edx
  c014cb:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c014d0:	39 c2                	cmp    %eax,%edx
  c014d2:	76 0d                	jbe    c014e1 <input+0x56>
  c014d4:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c014d9:	c6 00 00             	movb   $0x0,(%eax)
  c014dc:	e9 88 00 00 00       	jmp    c01569 <input+0xde>
  c014e1:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c014e6:	89 c2                	mov    %eax,%edx
  c014e8:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c014ed:	29 c2                	sub    %eax,%edx
  c014ef:	89 d0                	mov    %edx,%eax
  c014f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c014f4:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c014f9:	83 c0 01             	add    $0x1,%eax
  c014fc:	a3 6c 80 c0 00       	mov    %eax,0xc0806c
  c01501:	e8 be f8 ff ff       	call   c00dc4 <yy_get_next_buffer>
  c01506:	83 f8 01             	cmp    $0x1,%eax
  c01509:	74 1c                	je     c01527 <input+0x9c>
  c0150b:	83 f8 02             	cmp    $0x2,%eax
  c0150e:	74 06                	je     c01516 <input+0x8b>
  c01510:	85 c0                	test   %eax,%eax
  c01512:	74 44                	je     c01558 <input+0xcd>
  c01514:	eb 53                	jmp    c01569 <input+0xde>
  c01516:	a1 44 80 c0 00       	mov    0xc08044,%eax
  c0151b:	83 ec 0c             	sub    $0xc,%esp
  c0151e:	50                   	push   %eax
  c0151f:	e8 8d 00 00 00       	call   c015b1 <yyrestart>
  c01524:	83 c4 10             	add    $0x10,%esp
  c01527:	e8 5f 0a 00 00       	call   c01f8b <yywrap>
  c0152c:	85 c0                	test   %eax,%eax
  c0152e:	74 07                	je     c01537 <input+0xac>
  c01530:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  c01535:	eb 78                	jmp    c015af <input+0x124>
  c01537:	a1 78 80 c0 00       	mov    0xc08078,%eax
  c0153c:	85 c0                	test   %eax,%eax
  c0153e:	75 11                	jne    c01551 <input+0xc6>
  c01540:	a1 44 80 c0 00       	mov    0xc08044,%eax
  c01545:	83 ec 0c             	sub    $0xc,%esp
  c01548:	50                   	push   %eax
  c01549:	e8 63 00 00 00       	call   c015b1 <yyrestart>
  c0154e:	83 c4 10             	add    $0x10,%esp
  c01551:	e8 35 ff ff ff       	call   c0148b <input>
  c01556:	eb 57                	jmp    c015af <input+0x124>
  c01558:	8b 15 d8 59 c2 00    	mov    0xc259d8,%edx
  c0155e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01561:	01 d0                	add    %edx,%eax
  c01563:	a3 6c 80 c0 00       	mov    %eax,0xc0806c
  c01568:	90                   	nop
  c01569:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c0156e:	0f b6 00             	movzbl (%eax),%eax
  c01571:	0f b6 c0             	movzbl %al,%eax
  c01574:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01577:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c0157c:	c6 00 00             	movb   $0x0,(%eax)
  c0157f:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c01584:	83 c0 01             	add    $0x1,%eax
  c01587:	a3 6c 80 c0 00       	mov    %eax,0xc0806c
  c0158c:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c01591:	0f b6 00             	movzbl (%eax),%eax
  c01594:	a2 64 80 c0 00       	mov    %al,0xc08064
  c01599:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  c0159d:	75 0d                	jne    c015ac <input+0x121>
  c0159f:	a1 0c 80 c0 00       	mov    0xc0800c,%eax
  c015a4:	83 c0 01             	add    $0x1,%eax
  c015a7:	a3 0c 80 c0 00       	mov    %eax,0xc0800c
  c015ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c015af:	c9                   	leave  
  c015b0:	c3                   	ret    

00c015b1 <yyrestart>:
  c015b1:	55                   	push   %ebp
  c015b2:	89 e5                	mov    %esp,%ebp
  c015b4:	53                   	push   %ebx
  c015b5:	83 ec 04             	sub    $0x4,%esp
  c015b8:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c015bd:	85 c0                	test   %eax,%eax
  c015bf:	74 16                	je     c015d7 <yyrestart+0x26>
  c015c1:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c015c6:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c015cc:	c1 e2 02             	shl    $0x2,%edx
  c015cf:	01 d0                	add    %edx,%eax
  c015d1:	8b 00                	mov    (%eax),%eax
  c015d3:	85 c0                	test   %eax,%eax
  c015d5:	75 2e                	jne    c01605 <yyrestart+0x54>
  c015d7:	e8 22 05 00 00       	call   c01afe <yyensure_buffer_stack>
  c015dc:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c015e1:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c015e7:	c1 e2 02             	shl    $0x2,%edx
  c015ea:	8d 1c 10             	lea    (%eax,%edx,1),%ebx
  c015ed:	a1 44 80 c0 00       	mov    0xc08044,%eax
  c015f2:	83 ec 08             	sub    $0x8,%esp
  c015f5:	68 00 40 00 00       	push   $0x4000
  c015fa:	50                   	push   %eax
  c015fb:	e8 69 01 00 00       	call   c01769 <yy_create_buffer>
  c01600:	83 c4 10             	add    $0x10,%esp
  c01603:	89 03                	mov    %eax,(%ebx)
  c01605:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0160a:	85 c0                	test   %eax,%eax
  c0160c:	74 14                	je     c01622 <yyrestart+0x71>
  c0160e:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01613:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01619:	c1 e2 02             	shl    $0x2,%edx
  c0161c:	01 d0                	add    %edx,%eax
  c0161e:	8b 00                	mov    (%eax),%eax
  c01620:	eb 05                	jmp    c01627 <yyrestart+0x76>
  c01622:	b8 00 00 00 00       	mov    $0x0,%eax
  c01627:	83 ec 08             	sub    $0x8,%esp
  c0162a:	ff 75 08             	pushl  0x8(%ebp)
  c0162d:	50                   	push   %eax
  c0162e:	e8 37 02 00 00       	call   c0186a <yy_init_buffer>
  c01633:	83 c4 10             	add    $0x10,%esp
  c01636:	e8 c5 00 00 00       	call   c01700 <yy_load_buffer_state>
  c0163b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c0163e:	c9                   	leave  
  c0163f:	c3                   	ret    

00c01640 <yy_switch_to_buffer>:
  c01640:	55                   	push   %ebp
  c01641:	89 e5                	mov    %esp,%ebp
  c01643:	83 ec 08             	sub    $0x8,%esp
  c01646:	e8 b3 04 00 00       	call   c01afe <yyensure_buffer_stack>
  c0164b:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01650:	85 c0                	test   %eax,%eax
  c01652:	74 14                	je     c01668 <yy_switch_to_buffer+0x28>
  c01654:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01659:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c0165f:	c1 e2 02             	shl    $0x2,%edx
  c01662:	01 d0                	add    %edx,%eax
  c01664:	8b 00                	mov    (%eax),%eax
  c01666:	eb 05                	jmp    c0166d <yy_switch_to_buffer+0x2d>
  c01668:	b8 00 00 00 00       	mov    $0x0,%eax
  c0166d:	3b 45 08             	cmp    0x8(%ebp),%eax
  c01670:	75 05                	jne    c01677 <yy_switch_to_buffer+0x37>
  c01672:	e9 87 00 00 00       	jmp    c016fe <yy_switch_to_buffer+0xbe>
  c01677:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0167c:	85 c0                	test   %eax,%eax
  c0167e:	74 5a                	je     c016da <yy_switch_to_buffer+0x9a>
  c01680:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01685:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c0168b:	c1 e2 02             	shl    $0x2,%edx
  c0168e:	01 d0                	add    %edx,%eax
  c01690:	8b 00                	mov    (%eax),%eax
  c01692:	85 c0                	test   %eax,%eax
  c01694:	74 44                	je     c016da <yy_switch_to_buffer+0x9a>
  c01696:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c0169b:	0f b6 15 64 80 c0 00 	movzbl 0xc08064,%edx
  c016a2:	88 10                	mov    %dl,(%eax)
  c016a4:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c016a9:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c016af:	c1 e2 02             	shl    $0x2,%edx
  c016b2:	01 d0                	add    %edx,%eax
  c016b4:	8b 00                	mov    (%eax),%eax
  c016b6:	8b 15 6c 80 c0 00    	mov    0xc0806c,%edx
  c016bc:	89 50 08             	mov    %edx,0x8(%eax)
  c016bf:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c016c4:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c016ca:	c1 e2 02             	shl    $0x2,%edx
  c016cd:	01 d0                	add    %edx,%eax
  c016cf:	8b 00                	mov    (%eax),%eax
  c016d1:	8b 15 68 80 c0 00    	mov    0xc08068,%edx
  c016d7:	89 50 10             	mov    %edx,0x10(%eax)
  c016da:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c016df:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c016e5:	c1 e2 02             	shl    $0x2,%edx
  c016e8:	01 c2                	add    %eax,%edx
  c016ea:	8b 45 08             	mov    0x8(%ebp),%eax
  c016ed:	89 02                	mov    %eax,(%edx)
  c016ef:	e8 0c 00 00 00       	call   c01700 <yy_load_buffer_state>
  c016f4:	c7 05 78 80 c0 00 01 	movl   $0x1,0xc08078
  c016fb:	00 00 00 
  c016fe:	c9                   	leave  
  c016ff:	c3                   	ret    

00c01700 <yy_load_buffer_state>:
  c01700:	55                   	push   %ebp
  c01701:	89 e5                	mov    %esp,%ebp
  c01703:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01708:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c0170e:	c1 e2 02             	shl    $0x2,%edx
  c01711:	01 d0                	add    %edx,%eax
  c01713:	8b 00                	mov    (%eax),%eax
  c01715:	8b 40 10             	mov    0x10(%eax),%eax
  c01718:	a3 68 80 c0 00       	mov    %eax,0xc08068
  c0171d:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01722:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01728:	c1 e2 02             	shl    $0x2,%edx
  c0172b:	01 d0                	add    %edx,%eax
  c0172d:	8b 00                	mov    (%eax),%eax
  c0172f:	8b 40 08             	mov    0x8(%eax),%eax
  c01732:	a3 6c 80 c0 00       	mov    %eax,0xc0806c
  c01737:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c0173c:	a3 d8 59 c2 00       	mov    %eax,0xc259d8
  c01741:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01746:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c0174c:	c1 e2 02             	shl    $0x2,%edx
  c0174f:	01 d0                	add    %edx,%eax
  c01751:	8b 00                	mov    (%eax),%eax
  c01753:	8b 00                	mov    (%eax),%eax
  c01755:	a3 44 80 c0 00       	mov    %eax,0xc08044
  c0175a:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c0175f:	0f b6 00             	movzbl (%eax),%eax
  c01762:	a2 64 80 c0 00       	mov    %al,0xc08064
  c01767:	5d                   	pop    %ebp
  c01768:	c3                   	ret    

00c01769 <yy_create_buffer>:
  c01769:	55                   	push   %ebp
  c0176a:	89 e5                	mov    %esp,%ebp
  c0176c:	83 ec 18             	sub    $0x18,%esp
  c0176f:	83 ec 0c             	sub    $0xc,%esp
  c01772:	6a 30                	push   $0x30
  c01774:	e8 cd 07 00 00       	call   c01f46 <yyalloc>
  c01779:	83 c4 10             	add    $0x10,%esp
  c0177c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c0177f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c01783:	75 10                	jne    c01795 <yy_create_buffer+0x2c>
  c01785:	83 ec 0c             	sub    $0xc,%esp
  c01788:	68 d4 4c c0 00       	push   $0xc04cd4
  c0178d:	e8 26 06 00 00       	call   c01db8 <yy_fatal_error>
  c01792:	83 c4 10             	add    $0x10,%esp
  c01795:	8b 55 0c             	mov    0xc(%ebp),%edx
  c01798:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c0179b:	89 50 0c             	mov    %edx,0xc(%eax)
  c0179e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c017a1:	8b 40 0c             	mov    0xc(%eax),%eax
  c017a4:	83 c0 02             	add    $0x2,%eax
  c017a7:	83 ec 0c             	sub    $0xc,%esp
  c017aa:	50                   	push   %eax
  c017ab:	e8 96 07 00 00       	call   c01f46 <yyalloc>
  c017b0:	83 c4 10             	add    $0x10,%esp
  c017b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c017b6:	89 42 04             	mov    %eax,0x4(%edx)
  c017b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c017bc:	8b 40 04             	mov    0x4(%eax),%eax
  c017bf:	85 c0                	test   %eax,%eax
  c017c1:	75 10                	jne    c017d3 <yy_create_buffer+0x6a>
  c017c3:	83 ec 0c             	sub    $0xc,%esp
  c017c6:	68 d4 4c c0 00       	push   $0xc04cd4
  c017cb:	e8 e8 05 00 00       	call   c01db8 <yy_fatal_error>
  c017d0:	83 c4 10             	add    $0x10,%esp
  c017d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c017d6:	c7 40 14 01 00 00 00 	movl   $0x1,0x14(%eax)
  c017dd:	83 ec 08             	sub    $0x8,%esp
  c017e0:	ff 75 08             	pushl  0x8(%ebp)
  c017e3:	ff 75 f4             	pushl  -0xc(%ebp)
  c017e6:	e8 7f 00 00 00       	call   c0186a <yy_init_buffer>
  c017eb:	83 c4 10             	add    $0x10,%esp
  c017ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c017f1:	c9                   	leave  
  c017f2:	c3                   	ret    

00c017f3 <yy_delete_buffer>:
  c017f3:	55                   	push   %ebp
  c017f4:	89 e5                	mov    %esp,%ebp
  c017f6:	83 ec 08             	sub    $0x8,%esp
  c017f9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c017fd:	75 02                	jne    c01801 <yy_delete_buffer+0xe>
  c017ff:	eb 67                	jmp    c01868 <yy_delete_buffer+0x75>
  c01801:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01806:	85 c0                	test   %eax,%eax
  c01808:	74 14                	je     c0181e <yy_delete_buffer+0x2b>
  c0180a:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0180f:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01815:	c1 e2 02             	shl    $0x2,%edx
  c01818:	01 d0                	add    %edx,%eax
  c0181a:	8b 00                	mov    (%eax),%eax
  c0181c:	eb 05                	jmp    c01823 <yy_delete_buffer+0x30>
  c0181e:	b8 00 00 00 00       	mov    $0x0,%eax
  c01823:	3b 45 08             	cmp    0x8(%ebp),%eax
  c01826:	75 16                	jne    c0183e <yy_delete_buffer+0x4b>
  c01828:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0182d:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01833:	c1 e2 02             	shl    $0x2,%edx
  c01836:	01 d0                	add    %edx,%eax
  c01838:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  c0183e:	8b 45 08             	mov    0x8(%ebp),%eax
  c01841:	8b 40 14             	mov    0x14(%eax),%eax
  c01844:	85 c0                	test   %eax,%eax
  c01846:	74 12                	je     c0185a <yy_delete_buffer+0x67>
  c01848:	8b 45 08             	mov    0x8(%ebp),%eax
  c0184b:	8b 40 04             	mov    0x4(%eax),%eax
  c0184e:	83 ec 0c             	sub    $0xc,%esp
  c01851:	50                   	push   %eax
  c01852:	e8 1e 07 00 00       	call   c01f75 <yyfree>
  c01857:	83 c4 10             	add    $0x10,%esp
  c0185a:	83 ec 0c             	sub    $0xc,%esp
  c0185d:	ff 75 08             	pushl  0x8(%ebp)
  c01860:	e8 10 07 00 00       	call   c01f75 <yyfree>
  c01865:	83 c4 10             	add    $0x10,%esp
  c01868:	c9                   	leave  
  c01869:	c3                   	ret    

00c0186a <yy_init_buffer>:
  c0186a:	55                   	push   %ebp
  c0186b:	89 e5                	mov    %esp,%ebp
  c0186d:	83 ec 18             	sub    $0x18,%esp
  c01870:	a1 d4 59 c2 00       	mov    0xc259d4,%eax
  c01875:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c01878:	83 ec 0c             	sub    $0xc,%esp
  c0187b:	ff 75 08             	pushl  0x8(%ebp)
  c0187e:	e8 84 00 00 00       	call   c01907 <yy_flush_buffer>
  c01883:	83 c4 10             	add    $0x10,%esp
  c01886:	8b 45 08             	mov    0x8(%ebp),%eax
  c01889:	8b 55 0c             	mov    0xc(%ebp),%edx
  c0188c:	89 10                	mov    %edx,(%eax)
  c0188e:	8b 45 08             	mov    0x8(%ebp),%eax
  c01891:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
  c01898:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0189d:	85 c0                	test   %eax,%eax
  c0189f:	74 14                	je     c018b5 <yy_init_buffer+0x4b>
  c018a1:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c018a6:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c018ac:	c1 e2 02             	shl    $0x2,%edx
  c018af:	01 d0                	add    %edx,%eax
  c018b1:	8b 00                	mov    (%eax),%eax
  c018b3:	eb 05                	jmp    c018ba <yy_init_buffer+0x50>
  c018b5:	b8 00 00 00 00       	mov    $0x0,%eax
  c018ba:	3b 45 08             	cmp    0x8(%ebp),%eax
  c018bd:	74 14                	je     c018d3 <yy_init_buffer+0x69>
  c018bf:	8b 45 08             	mov    0x8(%ebp),%eax
  c018c2:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
  c018c9:	8b 45 08             	mov    0x8(%ebp),%eax
  c018cc:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
  c018d3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c018d7:	74 19                	je     c018f2 <yy_init_buffer+0x88>
  c018d9:	83 ec 0c             	sub    $0xc,%esp
  c018dc:	ff 75 0c             	pushl  0xc(%ebp)
  c018df:	e8 9b ef ff ff       	call   c0087f <fileno>
  c018e4:	83 c4 10             	add    $0x10,%esp
  c018e7:	85 c0                	test   %eax,%eax
  c018e9:	7e 07                	jle    c018f2 <yy_init_buffer+0x88>
  c018eb:	b8 01 00 00 00       	mov    $0x1,%eax
  c018f0:	eb 05                	jmp    c018f7 <yy_init_buffer+0x8d>
  c018f2:	b8 00 00 00 00       	mov    $0x0,%eax
  c018f7:	8b 55 08             	mov    0x8(%ebp),%edx
  c018fa:	89 42 18             	mov    %eax,0x18(%edx)
  c018fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01900:	a3 d4 59 c2 00       	mov    %eax,0xc259d4
  c01905:	c9                   	leave  
  c01906:	c3                   	ret    

00c01907 <yy_flush_buffer>:
  c01907:	55                   	push   %ebp
  c01908:	89 e5                	mov    %esp,%ebp
  c0190a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c0190e:	75 02                	jne    c01912 <yy_flush_buffer+0xb>
  c01910:	eb 6b                	jmp    c0197d <yy_flush_buffer+0x76>
  c01912:	8b 45 08             	mov    0x8(%ebp),%eax
  c01915:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  c0191c:	8b 45 08             	mov    0x8(%ebp),%eax
  c0191f:	8b 40 04             	mov    0x4(%eax),%eax
  c01922:	c6 00 00             	movb   $0x0,(%eax)
  c01925:	8b 45 08             	mov    0x8(%ebp),%eax
  c01928:	8b 40 04             	mov    0x4(%eax),%eax
  c0192b:	83 c0 01             	add    $0x1,%eax
  c0192e:	c6 00 00             	movb   $0x0,(%eax)
  c01931:	8b 45 08             	mov    0x8(%ebp),%eax
  c01934:	8b 50 04             	mov    0x4(%eax),%edx
  c01937:	8b 45 08             	mov    0x8(%ebp),%eax
  c0193a:	89 50 08             	mov    %edx,0x8(%eax)
  c0193d:	8b 45 08             	mov    0x8(%ebp),%eax
  c01940:	c7 40 1c 01 00 00 00 	movl   $0x1,0x1c(%eax)
  c01947:	8b 45 08             	mov    0x8(%ebp),%eax
  c0194a:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
  c01951:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01956:	85 c0                	test   %eax,%eax
  c01958:	74 14                	je     c0196e <yy_flush_buffer+0x67>
  c0195a:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0195f:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01965:	c1 e2 02             	shl    $0x2,%edx
  c01968:	01 d0                	add    %edx,%eax
  c0196a:	8b 00                	mov    (%eax),%eax
  c0196c:	eb 05                	jmp    c01973 <yy_flush_buffer+0x6c>
  c0196e:	b8 00 00 00 00       	mov    $0x0,%eax
  c01973:	3b 45 08             	cmp    0x8(%ebp),%eax
  c01976:	75 05                	jne    c0197d <yy_flush_buffer+0x76>
  c01978:	e8 83 fd ff ff       	call   c01700 <yy_load_buffer_state>
  c0197d:	5d                   	pop    %ebp
  c0197e:	c3                   	ret    

00c0197f <yypush_buffer_state>:
  c0197f:	55                   	push   %ebp
  c01980:	89 e5                	mov    %esp,%ebp
  c01982:	83 ec 08             	sub    $0x8,%esp
  c01985:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c01989:	75 05                	jne    c01990 <yypush_buffer_state+0x11>
  c0198b:	e9 b8 00 00 00       	jmp    c01a48 <yypush_buffer_state+0xc9>
  c01990:	e8 69 01 00 00       	call   c01afe <yyensure_buffer_stack>
  c01995:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c0199a:	85 c0                	test   %eax,%eax
  c0199c:	74 5a                	je     c019f8 <yypush_buffer_state+0x79>
  c0199e:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c019a3:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c019a9:	c1 e2 02             	shl    $0x2,%edx
  c019ac:	01 d0                	add    %edx,%eax
  c019ae:	8b 00                	mov    (%eax),%eax
  c019b0:	85 c0                	test   %eax,%eax
  c019b2:	74 44                	je     c019f8 <yypush_buffer_state+0x79>
  c019b4:	a1 6c 80 c0 00       	mov    0xc0806c,%eax
  c019b9:	0f b6 15 64 80 c0 00 	movzbl 0xc08064,%edx
  c019c0:	88 10                	mov    %dl,(%eax)
  c019c2:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c019c7:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c019cd:	c1 e2 02             	shl    $0x2,%edx
  c019d0:	01 d0                	add    %edx,%eax
  c019d2:	8b 00                	mov    (%eax),%eax
  c019d4:	8b 15 6c 80 c0 00    	mov    0xc0806c,%edx
  c019da:	89 50 08             	mov    %edx,0x8(%eax)
  c019dd:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c019e2:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c019e8:	c1 e2 02             	shl    $0x2,%edx
  c019eb:	01 d0                	add    %edx,%eax
  c019ed:	8b 00                	mov    (%eax),%eax
  c019ef:	8b 15 68 80 c0 00    	mov    0xc08068,%edx
  c019f5:	89 50 10             	mov    %edx,0x10(%eax)
  c019f8:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c019fd:	85 c0                	test   %eax,%eax
  c019ff:	74 23                	je     c01a24 <yypush_buffer_state+0xa5>
  c01a01:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01a06:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01a0c:	c1 e2 02             	shl    $0x2,%edx
  c01a0f:	01 d0                	add    %edx,%eax
  c01a11:	8b 00                	mov    (%eax),%eax
  c01a13:	85 c0                	test   %eax,%eax
  c01a15:	74 0d                	je     c01a24 <yypush_buffer_state+0xa5>
  c01a17:	a1 58 80 c0 00       	mov    0xc08058,%eax
  c01a1c:	83 c0 01             	add    $0x1,%eax
  c01a1f:	a3 58 80 c0 00       	mov    %eax,0xc08058
  c01a24:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01a29:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01a2f:	c1 e2 02             	shl    $0x2,%edx
  c01a32:	01 c2                	add    %eax,%edx
  c01a34:	8b 45 08             	mov    0x8(%ebp),%eax
  c01a37:	89 02                	mov    %eax,(%edx)
  c01a39:	e8 c2 fc ff ff       	call   c01700 <yy_load_buffer_state>
  c01a3e:	c7 05 78 80 c0 00 01 	movl   $0x1,0xc08078
  c01a45:	00 00 00 
  c01a48:	c9                   	leave  
  c01a49:	c3                   	ret    

00c01a4a <yypop_buffer_state>:
  c01a4a:	55                   	push   %ebp
  c01a4b:	89 e5                	mov    %esp,%ebp
  c01a4d:	83 ec 08             	sub    $0x8,%esp
  c01a50:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01a55:	85 c0                	test   %eax,%eax
  c01a57:	74 16                	je     c01a6f <yypop_buffer_state+0x25>
  c01a59:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01a5e:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01a64:	c1 e2 02             	shl    $0x2,%edx
  c01a67:	01 d0                	add    %edx,%eax
  c01a69:	8b 00                	mov    (%eax),%eax
  c01a6b:	85 c0                	test   %eax,%eax
  c01a6d:	75 05                	jne    c01a74 <yypop_buffer_state+0x2a>
  c01a6f:	e9 88 00 00 00       	jmp    c01afc <yypop_buffer_state+0xb2>
  c01a74:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01a79:	85 c0                	test   %eax,%eax
  c01a7b:	74 14                	je     c01a91 <yypop_buffer_state+0x47>
  c01a7d:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01a82:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01a88:	c1 e2 02             	shl    $0x2,%edx
  c01a8b:	01 d0                	add    %edx,%eax
  c01a8d:	8b 00                	mov    (%eax),%eax
  c01a8f:	eb 05                	jmp    c01a96 <yypop_buffer_state+0x4c>
  c01a91:	b8 00 00 00 00       	mov    $0x0,%eax
  c01a96:	83 ec 0c             	sub    $0xc,%esp
  c01a99:	50                   	push   %eax
  c01a9a:	e8 54 fd ff ff       	call   c017f3 <yy_delete_buffer>
  c01a9f:	83 c4 10             	add    $0x10,%esp
  c01aa2:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01aa7:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01aad:	c1 e2 02             	shl    $0x2,%edx
  c01ab0:	01 d0                	add    %edx,%eax
  c01ab2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  c01ab8:	a1 58 80 c0 00       	mov    0xc08058,%eax
  c01abd:	85 c0                	test   %eax,%eax
  c01abf:	74 0d                	je     c01ace <yypop_buffer_state+0x84>
  c01ac1:	a1 58 80 c0 00       	mov    0xc08058,%eax
  c01ac6:	83 e8 01             	sub    $0x1,%eax
  c01ac9:	a3 58 80 c0 00       	mov    %eax,0xc08058
  c01ace:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01ad3:	85 c0                	test   %eax,%eax
  c01ad5:	74 25                	je     c01afc <yypop_buffer_state+0xb2>
  c01ad7:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01adc:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01ae2:	c1 e2 02             	shl    $0x2,%edx
  c01ae5:	01 d0                	add    %edx,%eax
  c01ae7:	8b 00                	mov    (%eax),%eax
  c01ae9:	85 c0                	test   %eax,%eax
  c01aeb:	74 0f                	je     c01afc <yypop_buffer_state+0xb2>
  c01aed:	e8 0e fc ff ff       	call   c01700 <yy_load_buffer_state>
  c01af2:	c7 05 78 80 c0 00 01 	movl   $0x1,0xc08078
  c01af9:	00 00 00 
  c01afc:	c9                   	leave  
  c01afd:	c3                   	ret    

00c01afe <yyensure_buffer_stack>:
  c01afe:	55                   	push   %ebp
  c01aff:	89 e5                	mov    %esp,%ebp
  c01b01:	83 ec 18             	sub    $0x18,%esp
  c01b04:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01b09:	85 c0                	test   %eax,%eax
  c01b0b:	75 6a                	jne    c01b77 <yyensure_buffer_stack+0x79>
  c01b0d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  c01b14:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01b17:	c1 e0 02             	shl    $0x2,%eax
  c01b1a:	83 ec 0c             	sub    $0xc,%esp
  c01b1d:	50                   	push   %eax
  c01b1e:	e8 23 04 00 00       	call   c01f46 <yyalloc>
  c01b23:	83 c4 10             	add    $0x10,%esp
  c01b26:	a3 60 80 c0 00       	mov    %eax,0xc08060
  c01b2b:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01b30:	85 c0                	test   %eax,%eax
  c01b32:	75 10                	jne    c01b44 <yyensure_buffer_stack+0x46>
  c01b34:	83 ec 0c             	sub    $0xc,%esp
  c01b37:	68 00 4d c0 00       	push   $0xc04d00
  c01b3c:	e8 77 02 00 00       	call   c01db8 <yy_fatal_error>
  c01b41:	83 c4 10             	add    $0x10,%esp
  c01b44:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01b47:	c1 e0 02             	shl    $0x2,%eax
  c01b4a:	89 c2                	mov    %eax,%edx
  c01b4c:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01b51:	83 ec 04             	sub    $0x4,%esp
  c01b54:	52                   	push   %edx
  c01b55:	6a 00                	push   $0x0
  c01b57:	50                   	push   %eax
  c01b58:	e8 fd ec ff ff       	call   c0085a <memset>
  c01b5d:	83 c4 10             	add    $0x10,%esp
  c01b60:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01b63:	a3 5c 80 c0 00       	mov    %eax,0xc0805c
  c01b68:	c7 05 58 80 c0 00 00 	movl   $0x0,0xc08058
  c01b6f:	00 00 00 
  c01b72:	e9 8e 00 00 00       	jmp    c01c05 <yyensure_buffer_stack+0x107>
  c01b77:	a1 5c 80 c0 00       	mov    0xc0805c,%eax
  c01b7c:	8d 50 ff             	lea    -0x1(%eax),%edx
  c01b7f:	a1 58 80 c0 00       	mov    0xc08058,%eax
  c01b84:	39 c2                	cmp    %eax,%edx
  c01b86:	77 7d                	ja     c01c05 <yyensure_buffer_stack+0x107>
  c01b88:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
  c01b8f:	8b 15 5c 80 c0 00    	mov    0xc0805c,%edx
  c01b95:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01b98:	01 d0                	add    %edx,%eax
  c01b9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c01b9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01ba0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c01ba7:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01bac:	83 ec 08             	sub    $0x8,%esp
  c01baf:	52                   	push   %edx
  c01bb0:	50                   	push   %eax
  c01bb1:	e8 a6 03 00 00       	call   c01f5c <yyrealloc>
  c01bb6:	83 c4 10             	add    $0x10,%esp
  c01bb9:	a3 60 80 c0 00       	mov    %eax,0xc08060
  c01bbe:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01bc3:	85 c0                	test   %eax,%eax
  c01bc5:	75 10                	jne    c01bd7 <yyensure_buffer_stack+0xd9>
  c01bc7:	83 ec 0c             	sub    $0xc,%esp
  c01bca:	68 00 4d c0 00       	push   $0xc04d00
  c01bcf:	e8 e4 01 00 00       	call   c01db8 <yy_fatal_error>
  c01bd4:	83 c4 10             	add    $0x10,%esp
  c01bd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c01bda:	c1 e0 02             	shl    $0x2,%eax
  c01bdd:	8b 15 60 80 c0 00    	mov    0xc08060,%edx
  c01be3:	8b 0d 5c 80 c0 00    	mov    0xc0805c,%ecx
  c01be9:	c1 e1 02             	shl    $0x2,%ecx
  c01bec:	01 ca                	add    %ecx,%edx
  c01bee:	83 ec 04             	sub    $0x4,%esp
  c01bf1:	50                   	push   %eax
  c01bf2:	6a 00                	push   $0x0
  c01bf4:	52                   	push   %edx
  c01bf5:	e8 60 ec ff ff       	call   c0085a <memset>
  c01bfa:	83 c4 10             	add    $0x10,%esp
  c01bfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01c00:	a3 5c 80 c0 00       	mov    %eax,0xc0805c
  c01c05:	c9                   	leave  
  c01c06:	c3                   	ret    

00c01c07 <yy_scan_buffer>:
  c01c07:	55                   	push   %ebp
  c01c08:	89 e5                	mov    %esp,%ebp
  c01c0a:	83 ec 18             	sub    $0x18,%esp
  c01c0d:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  c01c11:	76 24                	jbe    c01c37 <yy_scan_buffer+0x30>
  c01c13:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01c16:	8d 50 fe             	lea    -0x2(%eax),%edx
  c01c19:	8b 45 08             	mov    0x8(%ebp),%eax
  c01c1c:	01 d0                	add    %edx,%eax
  c01c1e:	0f b6 00             	movzbl (%eax),%eax
  c01c21:	84 c0                	test   %al,%al
  c01c23:	75 12                	jne    c01c37 <yy_scan_buffer+0x30>
  c01c25:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01c28:	8d 50 ff             	lea    -0x1(%eax),%edx
  c01c2b:	8b 45 08             	mov    0x8(%ebp),%eax
  c01c2e:	01 d0                	add    %edx,%eax
  c01c30:	0f b6 00             	movzbl (%eax),%eax
  c01c33:	84 c0                	test   %al,%al
  c01c35:	74 0a                	je     c01c41 <yy_scan_buffer+0x3a>
  c01c37:	b8 00 00 00 00       	mov    $0x0,%eax
  c01c3c:	e9 9f 00 00 00       	jmp    c01ce0 <yy_scan_buffer+0xd9>
  c01c41:	83 ec 0c             	sub    $0xc,%esp
  c01c44:	6a 30                	push   $0x30
  c01c46:	e8 fb 02 00 00       	call   c01f46 <yyalloc>
  c01c4b:	83 c4 10             	add    $0x10,%esp
  c01c4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c01c51:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c01c55:	75 10                	jne    c01c67 <yy_scan_buffer+0x60>
  c01c57:	83 ec 0c             	sub    $0xc,%esp
  c01c5a:	68 34 4d c0 00       	push   $0xc04d34
  c01c5f:	e8 54 01 00 00       	call   c01db8 <yy_fatal_error>
  c01c64:	83 c4 10             	add    $0x10,%esp
  c01c67:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01c6a:	8d 50 fe             	lea    -0x2(%eax),%edx
  c01c6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01c70:	89 50 0c             	mov    %edx,0xc(%eax)
  c01c73:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01c76:	8b 55 08             	mov    0x8(%ebp),%edx
  c01c79:	89 50 04             	mov    %edx,0x4(%eax)
  c01c7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01c7f:	8b 50 04             	mov    0x4(%eax),%edx
  c01c82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01c85:	89 50 08             	mov    %edx,0x8(%eax)
  c01c88:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01c8b:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  c01c92:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01c95:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  c01c9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01c9e:	8b 50 0c             	mov    0xc(%eax),%edx
  c01ca1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01ca4:	89 50 10             	mov    %edx,0x10(%eax)
  c01ca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01caa:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  c01cb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01cb4:	c7 40 1c 01 00 00 00 	movl   $0x1,0x1c(%eax)
  c01cbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01cbe:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
  c01cc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01cc8:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
  c01ccf:	83 ec 0c             	sub    $0xc,%esp
  c01cd2:	ff 75 f4             	pushl  -0xc(%ebp)
  c01cd5:	e8 66 f9 ff ff       	call   c01640 <yy_switch_to_buffer>
  c01cda:	83 c4 10             	add    $0x10,%esp
  c01cdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01ce0:	c9                   	leave  
  c01ce1:	c3                   	ret    

00c01ce2 <yy_scan_string>:
  c01ce2:	55                   	push   %ebp
  c01ce3:	89 e5                	mov    %esp,%ebp
  c01ce5:	83 ec 08             	sub    $0x8,%esp
  c01ce8:	ff 75 08             	pushl  0x8(%ebp)
  c01ceb:	e8 2c eb ff ff       	call   c0081c <strlen>
  c01cf0:	83 c4 04             	add    $0x4,%esp
  c01cf3:	83 ec 08             	sub    $0x8,%esp
  c01cf6:	50                   	push   %eax
  c01cf7:	ff 75 08             	pushl  0x8(%ebp)
  c01cfa:	e8 05 00 00 00       	call   c01d04 <yy_scan_bytes>
  c01cff:	83 c4 10             	add    $0x10,%esp
  c01d02:	c9                   	leave  
  c01d03:	c3                   	ret    

00c01d04 <yy_scan_bytes>:
  c01d04:	55                   	push   %ebp
  c01d05:	89 e5                	mov    %esp,%ebp
  c01d07:	83 ec 18             	sub    $0x18,%esp
  c01d0a:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01d0d:	83 c0 02             	add    $0x2,%eax
  c01d10:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c01d13:	83 ec 0c             	sub    $0xc,%esp
  c01d16:	ff 75 f0             	pushl  -0x10(%ebp)
  c01d19:	e8 28 02 00 00       	call   c01f46 <yyalloc>
  c01d1e:	83 c4 10             	add    $0x10,%esp
  c01d21:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c01d24:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  c01d28:	75 10                	jne    c01d3a <yy_scan_bytes+0x36>
  c01d2a:	83 ec 0c             	sub    $0xc,%esp
  c01d2d:	68 60 4d c0 00       	push   $0xc04d60
  c01d32:	e8 81 00 00 00       	call   c01db8 <yy_fatal_error>
  c01d37:	83 c4 10             	add    $0x10,%esp
  c01d3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c01d41:	eb 19                	jmp    c01d5c <yy_scan_bytes+0x58>
  c01d43:	8b 55 ec             	mov    -0x14(%ebp),%edx
  c01d46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01d49:	01 c2                	add    %eax,%edx
  c01d4b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c01d4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01d51:	01 c8                	add    %ecx,%eax
  c01d53:	0f b6 00             	movzbl (%eax),%eax
  c01d56:	88 02                	mov    %al,(%edx)
  c01d58:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  c01d5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c01d5f:	3b 45 0c             	cmp    0xc(%ebp),%eax
  c01d62:	72 df                	jb     c01d43 <yy_scan_bytes+0x3f>
  c01d64:	8b 55 ec             	mov    -0x14(%ebp),%edx
  c01d67:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01d6a:	01 c2                	add    %eax,%edx
  c01d6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  c01d6f:	8d 48 01             	lea    0x1(%eax),%ecx
  c01d72:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c01d75:	01 c8                	add    %ecx,%eax
  c01d77:	c6 00 00             	movb   $0x0,(%eax)
  c01d7a:	0f b6 00             	movzbl (%eax),%eax
  c01d7d:	88 02                	mov    %al,(%edx)
  c01d7f:	83 ec 08             	sub    $0x8,%esp
  c01d82:	ff 75 f0             	pushl  -0x10(%ebp)
  c01d85:	ff 75 ec             	pushl  -0x14(%ebp)
  c01d88:	e8 7a fe ff ff       	call   c01c07 <yy_scan_buffer>
  c01d8d:	83 c4 10             	add    $0x10,%esp
  c01d90:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c01d93:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  c01d97:	75 10                	jne    c01da9 <yy_scan_bytes+0xa5>
  c01d99:	83 ec 0c             	sub    $0xc,%esp
  c01d9c:	68 89 4d c0 00       	push   $0xc04d89
  c01da1:	e8 12 00 00 00       	call   c01db8 <yy_fatal_error>
  c01da6:	83 c4 10             	add    $0x10,%esp
  c01da9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c01dac:	c7 40 14 01 00 00 00 	movl   $0x1,0x14(%eax)
  c01db3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c01db6:	c9                   	leave  
  c01db7:	c3                   	ret    

00c01db8 <yy_fatal_error>:
  c01db8:	55                   	push   %ebp
  c01db9:	89 e5                	mov    %esp,%ebp
  c01dbb:	83 ec 08             	sub    $0x8,%esp
  c01dbe:	83 ec 08             	sub    $0x8,%esp
  c01dc1:	ff 75 08             	pushl  0x8(%ebp)
  c01dc4:	68 a7 4d c0 00       	push   $0xc04da7
  c01dc9:	e8 a2 1c 00 00       	call   c03a70 <printf>
  c01dce:	83 c4 10             	add    $0x10,%esp
  c01dd1:	83 ec 0c             	sub    $0xc,%esp
  c01dd4:	6a 02                	push   $0x2
  c01dd6:	e8 66 15 00 00       	call   c03341 <exit>

00c01ddb <yyget_lineno>:
  c01ddb:	55                   	push   %ebp
  c01ddc:	89 e5                	mov    %esp,%ebp
  c01dde:	a1 0c 80 c0 00       	mov    0xc0800c,%eax
  c01de3:	5d                   	pop    %ebp
  c01de4:	c3                   	ret    

00c01de5 <yyget_in>:
  c01de5:	55                   	push   %ebp
  c01de6:	89 e5                	mov    %esp,%ebp
  c01de8:	a1 44 80 c0 00       	mov    0xc08044,%eax
  c01ded:	5d                   	pop    %ebp
  c01dee:	c3                   	ret    

00c01def <yyget_out>:
  c01def:	55                   	push   %ebp
  c01df0:	89 e5                	mov    %esp,%ebp
  c01df2:	a1 48 80 c0 00       	mov    0xc08048,%eax
  c01df7:	5d                   	pop    %ebp
  c01df8:	c3                   	ret    

00c01df9 <yyget_leng>:
  c01df9:	55                   	push   %ebp
  c01dfa:	89 e5                	mov    %esp,%ebp
  c01dfc:	a1 dc 59 c2 00       	mov    0xc259dc,%eax
  c01e01:	5d                   	pop    %ebp
  c01e02:	c3                   	ret    

00c01e03 <yyget_text>:
  c01e03:	55                   	push   %ebp
  c01e04:	89 e5                	mov    %esp,%ebp
  c01e06:	a1 d8 59 c2 00       	mov    0xc259d8,%eax
  c01e0b:	5d                   	pop    %ebp
  c01e0c:	c3                   	ret    

00c01e0d <yyset_lineno>:
  c01e0d:	55                   	push   %ebp
  c01e0e:	89 e5                	mov    %esp,%ebp
  c01e10:	8b 45 08             	mov    0x8(%ebp),%eax
  c01e13:	a3 0c 80 c0 00       	mov    %eax,0xc0800c
  c01e18:	5d                   	pop    %ebp
  c01e19:	c3                   	ret    

00c01e1a <yyset_in>:
  c01e1a:	55                   	push   %ebp
  c01e1b:	89 e5                	mov    %esp,%ebp
  c01e1d:	8b 45 08             	mov    0x8(%ebp),%eax
  c01e20:	a3 44 80 c0 00       	mov    %eax,0xc08044
  c01e25:	5d                   	pop    %ebp
  c01e26:	c3                   	ret    

00c01e27 <yyset_out>:
  c01e27:	55                   	push   %ebp
  c01e28:	89 e5                	mov    %esp,%ebp
  c01e2a:	8b 45 08             	mov    0x8(%ebp),%eax
  c01e2d:	a3 48 80 c0 00       	mov    %eax,0xc08048
  c01e32:	5d                   	pop    %ebp
  c01e33:	c3                   	ret    

00c01e34 <yyget_debug>:
  c01e34:	55                   	push   %ebp
  c01e35:	89 e5                	mov    %esp,%ebp
  c01e37:	a1 4c 80 c0 00       	mov    0xc0804c,%eax
  c01e3c:	5d                   	pop    %ebp
  c01e3d:	c3                   	ret    

00c01e3e <yyset_debug>:
  c01e3e:	55                   	push   %ebp
  c01e3f:	89 e5                	mov    %esp,%ebp
  c01e41:	8b 45 08             	mov    0x8(%ebp),%eax
  c01e44:	a3 4c 80 c0 00       	mov    %eax,0xc0804c
  c01e49:	5d                   	pop    %ebp
  c01e4a:	c3                   	ret    

00c01e4b <yy_init_globals>:
  c01e4b:	55                   	push   %ebp
  c01e4c:	89 e5                	mov    %esp,%ebp
  c01e4e:	c7 05 0c 80 c0 00 01 	movl   $0x1,0xc0800c
  c01e55:	00 00 00 
  c01e58:	c7 05 60 80 c0 00 00 	movl   $0x0,0xc08060
  c01e5f:	00 00 00 
  c01e62:	c7 05 58 80 c0 00 00 	movl   $0x0,0xc08058
  c01e69:	00 00 00 
  c01e6c:	c7 05 5c 80 c0 00 00 	movl   $0x0,0xc0805c
  c01e73:	00 00 00 
  c01e76:	c7 05 6c 80 c0 00 00 	movl   $0x0,0xc0806c
  c01e7d:	00 00 00 
  c01e80:	c7 05 70 80 c0 00 00 	movl   $0x0,0xc08070
  c01e87:	00 00 00 
  c01e8a:	c7 05 74 80 c0 00 00 	movl   $0x0,0xc08074
  c01e91:	00 00 00 
  c01e94:	c7 05 44 80 c0 00 00 	movl   $0x0,0xc08044
  c01e9b:	00 00 00 
  c01e9e:	c7 05 48 80 c0 00 00 	movl   $0x0,0xc08048
  c01ea5:	00 00 00 
  c01ea8:	b8 00 00 00 00       	mov    $0x0,%eax
  c01ead:	5d                   	pop    %ebp
  c01eae:	c3                   	ret    

00c01eaf <yylex_destroy>:
  c01eaf:	55                   	push   %ebp
  c01eb0:	89 e5                	mov    %esp,%ebp
  c01eb2:	83 ec 08             	sub    $0x8,%esp
  c01eb5:	eb 49                	jmp    c01f00 <yylex_destroy+0x51>
  c01eb7:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01ebc:	85 c0                	test   %eax,%eax
  c01ebe:	74 14                	je     c01ed4 <yylex_destroy+0x25>
  c01ec0:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01ec5:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01ecb:	c1 e2 02             	shl    $0x2,%edx
  c01ece:	01 d0                	add    %edx,%eax
  c01ed0:	8b 00                	mov    (%eax),%eax
  c01ed2:	eb 05                	jmp    c01ed9 <yylex_destroy+0x2a>
  c01ed4:	b8 00 00 00 00       	mov    $0x0,%eax
  c01ed9:	83 ec 0c             	sub    $0xc,%esp
  c01edc:	50                   	push   %eax
  c01edd:	e8 11 f9 ff ff       	call   c017f3 <yy_delete_buffer>
  c01ee2:	83 c4 10             	add    $0x10,%esp
  c01ee5:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01eea:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01ef0:	c1 e2 02             	shl    $0x2,%edx
  c01ef3:	01 d0                	add    %edx,%eax
  c01ef5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  c01efb:	e8 4a fb ff ff       	call   c01a4a <yypop_buffer_state>
  c01f00:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01f05:	85 c0                	test   %eax,%eax
  c01f07:	74 16                	je     c01f1f <yylex_destroy+0x70>
  c01f09:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01f0e:	8b 15 58 80 c0 00    	mov    0xc08058,%edx
  c01f14:	c1 e2 02             	shl    $0x2,%edx
  c01f17:	01 d0                	add    %edx,%eax
  c01f19:	8b 00                	mov    (%eax),%eax
  c01f1b:	85 c0                	test   %eax,%eax
  c01f1d:	75 98                	jne    c01eb7 <yylex_destroy+0x8>
  c01f1f:	a1 60 80 c0 00       	mov    0xc08060,%eax
  c01f24:	83 ec 0c             	sub    $0xc,%esp
  c01f27:	50                   	push   %eax
  c01f28:	e8 48 00 00 00       	call   c01f75 <yyfree>
  c01f2d:	83 c4 10             	add    $0x10,%esp
  c01f30:	c7 05 60 80 c0 00 00 	movl   $0x0,0xc08060
  c01f37:	00 00 00 
  c01f3a:	e8 0c ff ff ff       	call   c01e4b <yy_init_globals>
  c01f3f:	b8 00 00 00 00       	mov    $0x0,%eax
  c01f44:	c9                   	leave  
  c01f45:	c3                   	ret    

00c01f46 <yyalloc>:
  c01f46:	55                   	push   %ebp
  c01f47:	89 e5                	mov    %esp,%ebp
  c01f49:	83 ec 08             	sub    $0x8,%esp
  c01f4c:	83 ec 0c             	sub    $0xc,%esp
  c01f4f:	ff 75 08             	pushl  0x8(%ebp)
  c01f52:	e8 00 1b 00 00       	call   c03a57 <malloc>
  c01f57:	83 c4 10             	add    $0x10,%esp
  c01f5a:	c9                   	leave  
  c01f5b:	c3                   	ret    

00c01f5c <yyrealloc>:
  c01f5c:	55                   	push   %ebp
  c01f5d:	89 e5                	mov    %esp,%ebp
  c01f5f:	83 ec 08             	sub    $0x8,%esp
  c01f62:	83 ec 08             	sub    $0x8,%esp
  c01f65:	ff 75 0c             	pushl  0xc(%ebp)
  c01f68:	ff 75 08             	pushl  0x8(%ebp)
  c01f6b:	e8 bc 0a 00 00       	call   c02a2c <realloc>
  c01f70:	83 c4 10             	add    $0x10,%esp
  c01f73:	c9                   	leave  
  c01f74:	c3                   	ret    

00c01f75 <yyfree>:
  c01f75:	55                   	push   %ebp
  c01f76:	89 e5                	mov    %esp,%ebp
  c01f78:	83 ec 08             	sub    $0x8,%esp
  c01f7b:	83 ec 0c             	sub    $0xc,%esp
  c01f7e:	ff 75 08             	pushl  0x8(%ebp)
  c01f81:	e8 24 19 00 00       	call   c038aa <free>
  c01f86:	83 c4 10             	add    $0x10,%esp
  c01f89:	c9                   	leave  
  c01f8a:	c3                   	ret    

00c01f8b <yywrap>:
  c01f8b:	55                   	push   %ebp
  c01f8c:	89 e5                	mov    %esp,%ebp
  c01f8e:	b8 01 00 00 00       	mov    $0x1,%eax
  c01f93:	5d                   	pop    %ebp
  c01f94:	c3                   	ret    
  c01f95:	66 90                	xchg   %ax,%ax
  c01f97:	90                   	nop

00c01f98 <strcat>:
  c01f98:	55                   	push   %ebp
  c01f99:	89 e5                	mov    %esp,%ebp
  c01f9b:	57                   	push   %edi
  c01f9c:	56                   	push   %esi
  c01f9d:	53                   	push   %ebx
  c01f9e:	8b 55 0c             	mov    0xc(%ebp),%edx
  c01fa1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c01fa4:	b8 00 00 00 00       	mov    $0x0,%eax
  c01fa9:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c01fae:	89 d6                	mov    %edx,%esi
  c01fb0:	89 df                	mov    %ebx,%edi
  c01fb2:	fc                   	cld    
  c01fb3:	f2 ae                	repnz scas %es:(%edi),%al
  c01fb5:	4f                   	dec    %edi
  c01fb6:	ac                   	lods   %ds:(%esi),%al
  c01fb7:	aa                   	stos   %al,%es:(%edi)
  c01fb8:	84 c0                	test   %al,%al
  c01fba:	75 fa                	jne    c01fb6 <strcat+0x1e>
  c01fbc:	8b 45 08             	mov    0x8(%ebp),%eax
  c01fbf:	5b                   	pop    %ebx
  c01fc0:	5e                   	pop    %esi
  c01fc1:	5f                   	pop    %edi
  c01fc2:	5d                   	pop    %ebp
  c01fc3:	c3                   	ret    

00c01fc4 <strlen>:
  c01fc4:	55                   	push   %ebp
  c01fc5:	89 e5                	mov    %esp,%ebp
  c01fc7:	57                   	push   %edi
  c01fc8:	8b 55 08             	mov    0x8(%ebp),%edx
  c01fcb:	b8 00 00 00 00       	mov    $0x0,%eax
  c01fd0:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c01fd5:	89 d7                	mov    %edx,%edi
  c01fd7:	fc                   	cld    
  c01fd8:	f2 ae                	repnz scas %es:(%edi),%al
  c01fda:	f7 d1                	not    %ecx
  c01fdc:	49                   	dec    %ecx
  c01fdd:	89 c8                	mov    %ecx,%eax
  c01fdf:	5f                   	pop    %edi
  c01fe0:	5d                   	pop    %ebp
  c01fe1:	c3                   	ret    

00c01fe2 <memcpy>:
  c01fe2:	55                   	push   %ebp
  c01fe3:	89 e5                	mov    %esp,%ebp
  c01fe5:	57                   	push   %edi
  c01fe6:	56                   	push   %esi
  c01fe7:	53                   	push   %ebx
  c01fe8:	8b 45 10             	mov    0x10(%ebp),%eax
  c01feb:	8b 55 0c             	mov    0xc(%ebp),%edx
  c01fee:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c01ff1:	89 c1                	mov    %eax,%ecx
  c01ff3:	89 d6                	mov    %edx,%esi
  c01ff5:	89 df                	mov    %ebx,%edi
  c01ff7:	fc                   	cld    
  c01ff8:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  c01ffa:	8b 45 08             	mov    0x8(%ebp),%eax
  c01ffd:	5b                   	pop    %ebx
  c01ffe:	5e                   	pop    %esi
  c01fff:	5f                   	pop    %edi
  c02000:	5d                   	pop    %ebp
  c02001:	c3                   	ret    

00c02002 <strdup>:
  c02002:	55                   	push   %ebp
  c02003:	89 e5                	mov    %esp,%ebp
  c02005:	83 ec 18             	sub    $0x18,%esp
  c02008:	ff 75 08             	pushl  0x8(%ebp)
  c0200b:	e8 b4 ff ff ff       	call   c01fc4 <strlen>
  c02010:	83 c4 04             	add    $0x4,%esp
  c02013:	83 c0 01             	add    $0x1,%eax
  c02016:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c02019:	83 ec 0c             	sub    $0xc,%esp
  c0201c:	ff 75 f4             	pushl  -0xc(%ebp)
  c0201f:	e8 33 1a 00 00       	call   c03a57 <malloc>
  c02024:	83 c4 10             	add    $0x10,%esp
  c02027:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c0202a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  c0202e:	75 07                	jne    c02037 <strdup+0x35>
  c02030:	b8 00 00 00 00       	mov    $0x0,%eax
  c02035:	eb 15                	jmp    c0204c <strdup+0x4a>
  c02037:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c0203a:	83 ec 04             	sub    $0x4,%esp
  c0203d:	50                   	push   %eax
  c0203e:	ff 75 08             	pushl  0x8(%ebp)
  c02041:	ff 75 f0             	pushl  -0x10(%ebp)
  c02044:	e8 99 ff ff ff       	call   c01fe2 <memcpy>
  c02049:	83 c4 10             	add    $0x10,%esp
  c0204c:	c9                   	leave  
  c0204d:	c3                   	ret    

00c0204e <newList>:
  c0204e:	55                   	push   %ebp
  c0204f:	89 e5                	mov    %esp,%ebp
  c02051:	83 ec 18             	sub    $0x18,%esp
  c02054:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c02058:	74 2d                	je     c02087 <newList+0x39>
  c0205a:	8b 45 08             	mov    0x8(%ebp),%eax
  c0205d:	8b 00                	mov    (%eax),%eax
  c0205f:	83 f8 02             	cmp    $0x2,%eax
  c02062:	74 23                	je     c02087 <newList+0x39>
  c02064:	8b 45 08             	mov    0x8(%ebp),%eax
  c02067:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c0206a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  c02071:	83 ec 04             	sub    $0x4,%esp
  c02074:	ff 75 ec             	pushl  -0x14(%ebp)
  c02077:	ff 75 e8             	pushl  -0x18(%ebp)
  c0207a:	6a 02                	push   $0x2
  c0207c:	e8 2f 00 00 00       	call   c020b0 <newObject>
  c02081:	83 c4 10             	add    $0x10,%esp
  c02084:	89 45 08             	mov    %eax,0x8(%ebp)
  c02087:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c0208e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c02095:	8b 45 08             	mov    0x8(%ebp),%eax
  c02098:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c0209b:	83 ec 04             	sub    $0x4,%esp
  c0209e:	ff 75 f4             	pushl  -0xc(%ebp)
  c020a1:	ff 75 f0             	pushl  -0x10(%ebp)
  c020a4:	6a 03                	push   $0x3
  c020a6:	e8 05 00 00 00       	call   c020b0 <newObject>
  c020ab:	83 c4 10             	add    $0x10,%esp
  c020ae:	c9                   	leave  
  c020af:	c3                   	ret    

00c020b0 <newObject>:
  c020b0:	55                   	push   %ebp
  c020b1:	89 e5                	mov    %esp,%ebp
  c020b3:	83 ec 18             	sub    $0x18,%esp
  c020b6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c020bd:	83 ec 0c             	sub    $0xc,%esp
  c020c0:	6a 0c                	push   $0xc
  c020c2:	e8 90 19 00 00       	call   c03a57 <malloc>
  c020c7:	83 c4 10             	add    $0x10,%esp
  c020ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c020cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c020d1:	74 17                	je     c020ea <newObject+0x3a>
  c020d3:	8b 55 08             	mov    0x8(%ebp),%edx
  c020d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c020d9:	89 10                	mov    %edx,(%eax)
  c020db:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  c020de:	8b 45 0c             	mov    0xc(%ebp),%eax
  c020e1:	8b 55 10             	mov    0x10(%ebp),%edx
  c020e4:	89 41 04             	mov    %eax,0x4(%ecx)
  c020e7:	89 51 08             	mov    %edx,0x8(%ecx)
  c020ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c020ed:	c9                   	leave  
  c020ee:	c3                   	ret    

00c020ef <delObject>:
  c020ef:	55                   	push   %ebp
  c020f0:	89 e5                	mov    %esp,%ebp
  c020f2:	83 ec 08             	sub    $0x8,%esp
  c020f5:	83 ec 0c             	sub    $0xc,%esp
  c020f8:	68 ac 4d c0 00       	push   $0xc04dac
  c020fd:	e8 6e 19 00 00       	call   c03a70 <printf>
  c02102:	83 c4 10             	add    $0x10,%esp
  c02105:	83 ec 0c             	sub    $0xc,%esp
  c02108:	ff 75 08             	pushl  0x8(%ebp)
  c0210b:	e8 e3 08 00 00       	call   c029f3 <display>
  c02110:	83 c4 10             	add    $0x10,%esp
  c02113:	83 ec 0c             	sub    $0xc,%esp
  c02116:	68 b4 4d c0 00       	push   $0xc04db4
  c0211b:	e8 50 19 00 00       	call   c03a70 <printf>
  c02120:	83 c4 10             	add    $0x10,%esp
  c02123:	c9                   	leave  
  c02124:	c3                   	ret    

00c02125 <_car>:
  c02125:	55                   	push   %ebp
  c02126:	89 e5                	mov    %esp,%ebp
  c02128:	83 ec 08             	sub    $0x8,%esp
  c0212b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c0212f:	74 5e                	je     c0218f <_car+0x6a>
  c02131:	8b 45 08             	mov    0x8(%ebp),%eax
  c02134:	8b 00                	mov    (%eax),%eax
  c02136:	83 f8 02             	cmp    $0x2,%eax
  c02139:	75 08                	jne    c02143 <_car+0x1e>
  c0213b:	8b 45 08             	mov    0x8(%ebp),%eax
  c0213e:	8b 40 04             	mov    0x4(%eax),%eax
  c02141:	eb 51                	jmp    c02194 <_car+0x6f>
  c02143:	8b 45 08             	mov    0x8(%ebp),%eax
  c02146:	8b 00                	mov    (%eax),%eax
  c02148:	83 f8 03             	cmp    $0x3,%eax
  c0214b:	75 14                	jne    c02161 <_car+0x3c>
  c0214d:	8b 45 08             	mov    0x8(%ebp),%eax
  c02150:	8b 40 04             	mov    0x4(%eax),%eax
  c02153:	83 ec 0c             	sub    $0xc,%esp
  c02156:	50                   	push   %eax
  c02157:	e8 c9 ff ff ff       	call   c02125 <_car>
  c0215c:	83 c4 10             	add    $0x10,%esp
  c0215f:	eb 33                	jmp    c02194 <_car+0x6f>
  c02161:	83 ec 0c             	sub    $0xc,%esp
  c02164:	68 ac 4d c0 00       	push   $0xc04dac
  c02169:	e8 02 19 00 00       	call   c03a70 <printf>
  c0216e:	83 c4 10             	add    $0x10,%esp
  c02171:	83 ec 0c             	sub    $0xc,%esp
  c02174:	ff 75 08             	pushl  0x8(%ebp)
  c02177:	e8 77 08 00 00       	call   c029f3 <display>
  c0217c:	83 c4 10             	add    $0x10,%esp
  c0217f:	83 ec 0c             	sub    $0xc,%esp
  c02182:	68 d4 4d c0 00       	push   $0xc04dd4
  c02187:	e8 e4 18 00 00       	call   c03a70 <printf>
  c0218c:	83 c4 10             	add    $0x10,%esp
  c0218f:	b8 00 00 00 00       	mov    $0x0,%eax
  c02194:	c9                   	leave  
  c02195:	c3                   	ret    

00c02196 <_cdr>:
  c02196:	55                   	push   %ebp
  c02197:	89 e5                	mov    %esp,%ebp
  c02199:	83 ec 08             	sub    $0x8,%esp
  c0219c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c021a0:	74 6a                	je     c0220c <_cdr+0x76>
  c021a2:	8b 45 08             	mov    0x8(%ebp),%eax
  c021a5:	8b 00                	mov    (%eax),%eax
  c021a7:	83 f8 02             	cmp    $0x2,%eax
  c021aa:	75 08                	jne    c021b4 <_cdr+0x1e>
  c021ac:	8b 45 08             	mov    0x8(%ebp),%eax
  c021af:	8b 40 08             	mov    0x8(%eax),%eax
  c021b2:	eb 5d                	jmp    c02211 <_cdr+0x7b>
  c021b4:	8b 45 08             	mov    0x8(%ebp),%eax
  c021b7:	8b 00                	mov    (%eax),%eax
  c021b9:	83 f8 03             	cmp    $0x3,%eax
  c021bc:	75 20                	jne    c021de <_cdr+0x48>
  c021be:	8b 45 08             	mov    0x8(%ebp),%eax
  c021c1:	8b 40 04             	mov    0x4(%eax),%eax
  c021c4:	83 ec 0c             	sub    $0xc,%esp
  c021c7:	50                   	push   %eax
  c021c8:	e8 c9 ff ff ff       	call   c02196 <_cdr>
  c021cd:	83 c4 10             	add    $0x10,%esp
  c021d0:	83 ec 0c             	sub    $0xc,%esp
  c021d3:	50                   	push   %eax
  c021d4:	e8 75 fe ff ff       	call   c0204e <newList>
  c021d9:	83 c4 10             	add    $0x10,%esp
  c021dc:	eb 33                	jmp    c02211 <_cdr+0x7b>
  c021de:	83 ec 0c             	sub    $0xc,%esp
  c021e1:	68 ac 4d c0 00       	push   $0xc04dac
  c021e6:	e8 85 18 00 00       	call   c03a70 <printf>
  c021eb:	83 c4 10             	add    $0x10,%esp
  c021ee:	83 ec 0c             	sub    $0xc,%esp
  c021f1:	ff 75 08             	pushl  0x8(%ebp)
  c021f4:	e8 fa 07 00 00       	call   c029f3 <display>
  c021f9:	83 c4 10             	add    $0x10,%esp
  c021fc:	83 ec 0c             	sub    $0xc,%esp
  c021ff:	68 d4 4d c0 00       	push   $0xc04dd4
  c02204:	e8 67 18 00 00       	call   c03a70 <printf>
  c02209:	83 c4 10             	add    $0x10,%esp
  c0220c:	b8 00 00 00 00       	mov    $0x0,%eax
  c02211:	c9                   	leave  
  c02212:	c3                   	ret    

00c02213 <_symbol>:
  c02213:	55                   	push   %ebp
  c02214:	89 e5                	mov    %esp,%ebp
  c02216:	83 ec 08             	sub    $0x8,%esp
  c02219:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c0221d:	74 15                	je     c02234 <_symbol+0x21>
  c0221f:	8b 45 08             	mov    0x8(%ebp),%eax
  c02222:	8b 00                	mov    (%eax),%eax
  c02224:	83 f8 05             	cmp    $0x5,%eax
  c02227:	75 0b                	jne    c02234 <_symbol+0x21>
  c02229:	8b 45 08             	mov    0x8(%ebp),%eax
  c0222c:	8b 40 04             	mov    0x4(%eax),%eax
  c0222f:	8b 40 04             	mov    0x4(%eax),%eax
  c02232:	eb 31                	jmp    c02265 <_symbol+0x52>
  c02234:	83 ec 0c             	sub    $0xc,%esp
  c02237:	68 ac 4d c0 00       	push   $0xc04dac
  c0223c:	e8 2f 18 00 00       	call   c03a70 <printf>
  c02241:	83 c4 10             	add    $0x10,%esp
  c02244:	83 ec 0c             	sub    $0xc,%esp
  c02247:	ff 75 08             	pushl  0x8(%ebp)
  c0224a:	e8 a4 07 00 00       	call   c029f3 <display>
  c0224f:	83 c4 10             	add    $0x10,%esp
  c02252:	83 ec 0c             	sub    $0xc,%esp
  c02255:	68 e5 4d c0 00       	push   $0xc04de5
  c0225a:	e8 11 18 00 00       	call   c03a70 <printf>
  c0225f:	83 c4 10             	add    $0x10,%esp
  c02262:	8b 45 08             	mov    0x8(%ebp),%eax
  c02265:	c9                   	leave  
  c02266:	c3                   	ret    

00c02267 <_fncall>:
  c02267:	55                   	push   %ebp
  c02268:	89 e5                	mov    %esp,%ebp
  c0226a:	83 ec 08             	sub    $0x8,%esp
  c0226d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c02271:	74 6f                	je     c022e2 <_fncall+0x7b>
  c02273:	8b 45 08             	mov    0x8(%ebp),%eax
  c02276:	8b 00                	mov    (%eax),%eax
  c02278:	83 f8 05             	cmp    $0x5,%eax
  c0227b:	75 65                	jne    c022e2 <_fncall+0x7b>
  c0227d:	83 ec 08             	sub    $0x8,%esp
  c02280:	6a 01                	push   $0x1
  c02282:	ff 75 0c             	pushl  0xc(%ebp)
  c02285:	e8 ce 04 00 00       	call   c02758 <_eval>
  c0228a:	83 c4 10             	add    $0x10,%esp
  c0228d:	89 45 0c             	mov    %eax,0xc(%ebp)
  c02290:	83 ec 0c             	sub    $0xc,%esp
  c02293:	ff 75 08             	pushl  0x8(%ebp)
  c02296:	e8 78 ff ff ff       	call   c02213 <_symbol>
  c0229b:	83 c4 10             	add    $0x10,%esp
  c0229e:	89 45 08             	mov    %eax,0x8(%ebp)
  c022a1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c022a5:	74 39                	je     c022e0 <_fncall+0x79>
  c022a7:	8b 45 08             	mov    0x8(%ebp),%eax
  c022aa:	8b 00                	mov    (%eax),%eax
  c022ac:	83 f8 09             	cmp    $0x9,%eax
  c022af:	75 13                	jne    c022c4 <_fncall+0x5d>
  c022b1:	8b 45 08             	mov    0x8(%ebp),%eax
  c022b4:	8b 40 04             	mov    0x4(%eax),%eax
  c022b7:	83 ec 0c             	sub    $0xc,%esp
  c022ba:	ff 75 0c             	pushl  0xc(%ebp)
  c022bd:	ff d0                	call   *%eax
  c022bf:	83 c4 10             	add    $0x10,%esp
  c022c2:	eb 51                	jmp    c02315 <_fncall+0xae>
  c022c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c022c7:	8b 00                	mov    (%eax),%eax
  c022c9:	83 f8 08             	cmp    $0x8,%eax
  c022cc:	75 12                	jne    c022e0 <_fncall+0x79>
  c022ce:	83 ec 0c             	sub    $0xc,%esp
  c022d1:	68 f6 4d c0 00       	push   $0xc04df6
  c022d6:	e8 95 17 00 00       	call   c03a70 <printf>
  c022db:	83 c4 10             	add    $0x10,%esp
  c022de:	eb 30                	jmp    c02310 <_fncall+0xa9>
  c022e0:	eb 2e                	jmp    c02310 <_fncall+0xa9>
  c022e2:	83 ec 0c             	sub    $0xc,%esp
  c022e5:	68 ac 4d c0 00       	push   $0xc04dac
  c022ea:	e8 81 17 00 00       	call   c03a70 <printf>
  c022ef:	83 c4 10             	add    $0x10,%esp
  c022f2:	83 ec 0c             	sub    $0xc,%esp
  c022f5:	ff 75 08             	pushl  0x8(%ebp)
  c022f8:	e8 f6 06 00 00       	call   c029f3 <display>
  c022fd:	83 c4 10             	add    $0x10,%esp
  c02300:	83 ec 0c             	sub    $0xc,%esp
  c02303:	68 0c 4e c0 00       	push   $0xc04e0c
  c02308:	e8 63 17 00 00       	call   c03a70 <printf>
  c0230d:	83 c4 10             	add    $0x10,%esp
  c02310:	b8 00 00 00 00       	mov    $0x0,%eax
  c02315:	c9                   	leave  
  c02316:	c3                   	ret    

00c02317 <_list>:
  c02317:	55                   	push   %ebp
  c02318:	89 e5                	mov    %esp,%ebp
  c0231a:	53                   	push   %ebx
  c0231b:	83 ec 04             	sub    $0x4,%esp
  c0231e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c02322:	74 30                	je     c02354 <_list+0x3d>
  c02324:	8b 45 08             	mov    0x8(%ebp),%eax
  c02327:	8b 00                	mov    (%eax),%eax
  c02329:	83 f8 03             	cmp    $0x3,%eax
  c0232c:	75 26                	jne    c02354 <_list+0x3d>
  c0232e:	8b 45 08             	mov    0x8(%ebp),%eax
  c02331:	8b 40 04             	mov    0x4(%eax),%eax
  c02334:	8b 58 08             	mov    0x8(%eax),%ebx
  c02337:	83 ec 0c             	sub    $0xc,%esp
  c0233a:	ff 75 08             	pushl  0x8(%ebp)
  c0233d:	e8 e3 fd ff ff       	call   c02125 <_car>
  c02342:	83 c4 10             	add    $0x10,%esp
  c02345:	83 ec 08             	sub    $0x8,%esp
  c02348:	53                   	push   %ebx
  c02349:	50                   	push   %eax
  c0234a:	e8 18 ff ff ff       	call   c02267 <_fncall>
  c0234f:	83 c4 10             	add    $0x10,%esp
  c02352:	eb 31                	jmp    c02385 <_list+0x6e>
  c02354:	83 ec 0c             	sub    $0xc,%esp
  c02357:	68 ac 4d c0 00       	push   $0xc04dac
  c0235c:	e8 0f 17 00 00       	call   c03a70 <printf>
  c02361:	83 c4 10             	add    $0x10,%esp
  c02364:	83 ec 0c             	sub    $0xc,%esp
  c02367:	ff 75 08             	pushl  0x8(%ebp)
  c0236a:	e8 84 06 00 00       	call   c029f3 <display>
  c0236f:	83 c4 10             	add    $0x10,%esp
  c02372:	83 ec 0c             	sub    $0xc,%esp
  c02375:	68 3b 4e c0 00       	push   $0xc04e3b
  c0237a:	e8 f1 16 00 00       	call   c03a70 <printf>
  c0237f:	83 c4 10             	add    $0x10,%esp
  c02382:	8b 45 08             	mov    0x8(%ebp),%eax
  c02385:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c02388:	c9                   	leave  
  c02389:	c3                   	ret    

00c0238a <_set>:
  c0238a:	55                   	push   %ebp
  c0238b:	89 e5                	mov    %esp,%ebp
  c0238d:	53                   	push   %ebx
  c0238e:	83 ec 14             	sub    $0x14,%esp
  c02391:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c02398:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c0239c:	0f 84 b0 00 00 00    	je     c02452 <_set+0xc8>
  c023a2:	8b 45 08             	mov    0x8(%ebp),%eax
  c023a5:	8b 00                	mov    (%eax),%eax
  c023a7:	83 f8 02             	cmp    $0x2,%eax
  c023aa:	75 76                	jne    c02422 <_set+0x98>
  c023ac:	83 ec 0c             	sub    $0xc,%esp
  c023af:	ff 75 08             	pushl  0x8(%ebp)
  c023b2:	e8 6e fd ff ff       	call   c02125 <_car>
  c023b7:	83 c4 10             	add    $0x10,%esp
  c023ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c023bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c023c1:	74 2f                	je     c023f2 <_set+0x68>
  c023c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c023c6:	8b 00                	mov    (%eax),%eax
  c023c8:	83 f8 05             	cmp    $0x5,%eax
  c023cb:	75 25                	jne    c023f2 <_set+0x68>
  c023cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c023d0:	8b 58 04             	mov    0x4(%eax),%ebx
  c023d3:	83 ec 0c             	sub    $0xc,%esp
  c023d6:	ff 75 08             	pushl  0x8(%ebp)
  c023d9:	e8 b8 fd ff ff       	call   c02196 <_cdr>
  c023de:	83 c4 10             	add    $0x10,%esp
  c023e1:	89 43 04             	mov    %eax,0x4(%ebx)
  c023e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c023e7:	8b 40 04             	mov    0x4(%eax),%eax
  c023ea:	8b 40 04             	mov    0x4(%eax),%eax
  c023ed:	e9 91 00 00 00       	jmp    c02483 <_set+0xf9>
  c023f2:	83 ec 0c             	sub    $0xc,%esp
  c023f5:	68 ac 4d c0 00       	push   $0xc04dac
  c023fa:	e8 71 16 00 00       	call   c03a70 <printf>
  c023ff:	83 c4 10             	add    $0x10,%esp
  c02402:	83 ec 0c             	sub    $0xc,%esp
  c02405:	ff 75 08             	pushl  0x8(%ebp)
  c02408:	e8 e6 05 00 00       	call   c029f3 <display>
  c0240d:	83 c4 10             	add    $0x10,%esp
  c02410:	83 ec 0c             	sub    $0xc,%esp
  c02413:	68 58 4e c0 00       	push   $0xc04e58
  c02418:	e8 53 16 00 00       	call   c03a70 <printf>
  c0241d:	83 c4 10             	add    $0x10,%esp
  c02420:	eb 5e                	jmp    c02480 <_set+0xf6>
  c02422:	83 ec 0c             	sub    $0xc,%esp
  c02425:	68 ac 4d c0 00       	push   $0xc04dac
  c0242a:	e8 41 16 00 00       	call   c03a70 <printf>
  c0242f:	83 c4 10             	add    $0x10,%esp
  c02432:	83 ec 0c             	sub    $0xc,%esp
  c02435:	ff 75 08             	pushl  0x8(%ebp)
  c02438:	e8 b6 05 00 00       	call   c029f3 <display>
  c0243d:	83 c4 10             	add    $0x10,%esp
  c02440:	83 ec 0c             	sub    $0xc,%esp
  c02443:	68 6b 4e c0 00       	push   $0xc04e6b
  c02448:	e8 23 16 00 00       	call   c03a70 <printf>
  c0244d:	83 c4 10             	add    $0x10,%esp
  c02450:	eb 2e                	jmp    c02480 <_set+0xf6>
  c02452:	83 ec 0c             	sub    $0xc,%esp
  c02455:	68 ac 4d c0 00       	push   $0xc04dac
  c0245a:	e8 11 16 00 00       	call   c03a70 <printf>
  c0245f:	83 c4 10             	add    $0x10,%esp
  c02462:	83 ec 0c             	sub    $0xc,%esp
  c02465:	ff 75 08             	pushl  0x8(%ebp)
  c02468:	e8 86 05 00 00       	call   c029f3 <display>
  c0246d:	83 c4 10             	add    $0x10,%esp
  c02470:	83 ec 0c             	sub    $0xc,%esp
  c02473:	68 70 4e c0 00       	push   $0xc04e70
  c02478:	e8 f3 15 00 00       	call   c03a70 <printf>
  c0247d:	83 c4 10             	add    $0x10,%esp
  c02480:	8b 45 08             	mov    0x8(%ebp),%eax
  c02483:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c02486:	c9                   	leave  
  c02487:	c3                   	ret    

00c02488 <mergeString>:
  c02488:	55                   	push   %ebp
  c02489:	89 e5                	mov    %esp,%ebp
  c0248b:	53                   	push   %ebx
  c0248c:	83 ec 14             	sub    $0x14,%esp
  c0248f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c02496:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c0249a:	74 71                	je     c0250d <mergeString+0x85>
  c0249c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c024a0:	74 63                	je     c02505 <mergeString+0x7d>
  c024a2:	ff 75 08             	pushl  0x8(%ebp)
  c024a5:	e8 1a fb ff ff       	call   c01fc4 <strlen>
  c024aa:	83 c4 04             	add    $0x4,%esp
  c024ad:	89 c3                	mov    %eax,%ebx
  c024af:	ff 75 0c             	pushl  0xc(%ebp)
  c024b2:	e8 0d fb ff ff       	call   c01fc4 <strlen>
  c024b7:	83 c4 04             	add    $0x4,%esp
  c024ba:	01 d8                	add    %ebx,%eax
  c024bc:	83 c0 02             	add    $0x2,%eax
  c024bf:	83 ec 08             	sub    $0x8,%esp
  c024c2:	50                   	push   %eax
  c024c3:	ff 75 08             	pushl  0x8(%ebp)
  c024c6:	e8 61 05 00 00       	call   c02a2c <realloc>
  c024cb:	83 c4 10             	add    $0x10,%esp
  c024ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c024d1:	83 ec 08             	sub    $0x8,%esp
  c024d4:	68 83 4e c0 00       	push   $0xc04e83
  c024d9:	ff 75 f4             	pushl  -0xc(%ebp)
  c024dc:	e8 b7 fa ff ff       	call   c01f98 <strcat>
  c024e1:	83 c4 10             	add    $0x10,%esp
  c024e4:	83 ec 08             	sub    $0x8,%esp
  c024e7:	ff 75 0c             	pushl  0xc(%ebp)
  c024ea:	ff 75 f4             	pushl  -0xc(%ebp)
  c024ed:	e8 a6 fa ff ff       	call   c01f98 <strcat>
  c024f2:	83 c4 10             	add    $0x10,%esp
  c024f5:	83 ec 0c             	sub    $0xc,%esp
  c024f8:	ff 75 0c             	pushl  0xc(%ebp)
  c024fb:	e8 aa 13 00 00       	call   c038aa <free>
  c02500:	83 c4 10             	add    $0x10,%esp
  c02503:	eb 0e                	jmp    c02513 <mergeString+0x8b>
  c02505:	8b 45 08             	mov    0x8(%ebp),%eax
  c02508:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c0250b:	eb 06                	jmp    c02513 <mergeString+0x8b>
  c0250d:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02510:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c02513:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02516:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c02519:	c9                   	leave  
  c0251a:	c3                   	ret    

00c0251b <merge>:
  c0251b:	55                   	push   %ebp
  c0251c:	89 e5                	mov    %esp,%ebp
  c0251e:	53                   	push   %ebx
  c0251f:	83 ec 14             	sub    $0x14,%esp
  c02522:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c02529:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c0252d:	0f 84 95 00 00 00    	je     c025c8 <merge+0xad>
  c02533:	8b 45 08             	mov    0x8(%ebp),%eax
  c02536:	8b 00                	mov    (%eax),%eax
  c02538:	83 f8 07             	cmp    $0x7,%eax
  c0253b:	75 17                	jne    c02554 <merge+0x39>
  c0253d:	8b 45 08             	mov    0x8(%ebp),%eax
  c02540:	8b 40 04             	mov    0x4(%eax),%eax
  c02543:	83 ec 0c             	sub    $0xc,%esp
  c02546:	50                   	push   %eax
  c02547:	e8 b6 fa ff ff       	call   c02002 <strdup>
  c0254c:	83 c4 10             	add    $0x10,%esp
  c0254f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c02552:	eb 74                	jmp    c025c8 <merge+0xad>
  c02554:	8b 45 08             	mov    0x8(%ebp),%eax
  c02557:	8b 00                	mov    (%eax),%eax
  c02559:	83 f8 02             	cmp    $0x2,%eax
  c0255c:	75 48                	jne    c025a6 <merge+0x8b>
  c0255e:	83 ec 0c             	sub    $0xc,%esp
  c02561:	ff 75 08             	pushl  0x8(%ebp)
  c02564:	e8 2d fc ff ff       	call   c02196 <_cdr>
  c02569:	83 c4 10             	add    $0x10,%esp
  c0256c:	83 ec 0c             	sub    $0xc,%esp
  c0256f:	50                   	push   %eax
  c02570:	e8 a6 ff ff ff       	call   c0251b <merge>
  c02575:	83 c4 10             	add    $0x10,%esp
  c02578:	89 c3                	mov    %eax,%ebx
  c0257a:	83 ec 0c             	sub    $0xc,%esp
  c0257d:	ff 75 08             	pushl  0x8(%ebp)
  c02580:	e8 a0 fb ff ff       	call   c02125 <_car>
  c02585:	83 c4 10             	add    $0x10,%esp
  c02588:	83 ec 0c             	sub    $0xc,%esp
  c0258b:	50                   	push   %eax
  c0258c:	e8 8a ff ff ff       	call   c0251b <merge>
  c02591:	83 c4 10             	add    $0x10,%esp
  c02594:	83 ec 08             	sub    $0x8,%esp
  c02597:	53                   	push   %ebx
  c02598:	50                   	push   %eax
  c02599:	e8 ea fe ff ff       	call   c02488 <mergeString>
  c0259e:	83 c4 10             	add    $0x10,%esp
  c025a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c025a4:	eb 22                	jmp    c025c8 <merge+0xad>
  c025a6:	8b 45 08             	mov    0x8(%ebp),%eax
  c025a9:	8b 00                	mov    (%eax),%eax
  c025ab:	83 f8 05             	cmp    $0x5,%eax
  c025ae:	75 18                	jne    c025c8 <merge+0xad>
  c025b0:	8b 45 08             	mov    0x8(%ebp),%eax
  c025b3:	8b 40 04             	mov    0x4(%eax),%eax
  c025b6:	8b 40 04             	mov    0x4(%eax),%eax
  c025b9:	83 ec 0c             	sub    $0xc,%esp
  c025bc:	50                   	push   %eax
  c025bd:	e8 59 ff ff ff       	call   c0251b <merge>
  c025c2:	83 c4 10             	add    $0x10,%esp
  c025c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c025c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c025cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c025ce:	c9                   	leave  
  c025cf:	c3                   	ret    

00c025d0 <_quit>:
  c025d0:	55                   	push   %ebp
  c025d1:	89 e5                	mov    %esp,%ebp
  c025d3:	83 ec 08             	sub    $0x8,%esp
  c025d6:	83 ec 0c             	sub    $0xc,%esp
  c025d9:	6a 00                	push   $0x0
  c025db:	e8 61 0d 00 00       	call   c03341 <exit>

00c025e0 <_exec>:
  c025e0:	55                   	push   %ebp
  c025e1:	89 e5                	mov    %esp,%ebp
  c025e3:	83 ec 18             	sub    $0x18,%esp
  c025e6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c025ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c025f4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c025f8:	74 5a                	je     c02654 <_exec+0x74>
  c025fa:	83 ec 0c             	sub    $0xc,%esp
  c025fd:	ff 75 08             	pushl  0x8(%ebp)
  c02600:	e8 16 ff ff ff       	call   c0251b <merge>
  c02605:	83 c4 10             	add    $0x10,%esp
  c02608:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c0260b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  c0260f:	74 43                	je     c02654 <_exec+0x74>
  c02611:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  c02618:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  c0261f:	83 ec 0c             	sub    $0xc,%esp
  c02622:	ff 75 f0             	pushl  -0x10(%ebp)
  c02625:	e8 d5 04 00 00       	call   c02aff <system>
  c0262a:	83 c4 10             	add    $0x10,%esp
  c0262d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c02630:	83 ec 04             	sub    $0x4,%esp
  c02633:	ff 75 ec             	pushl  -0x14(%ebp)
  c02636:	ff 75 e8             	pushl  -0x18(%ebp)
  c02639:	6a 06                	push   $0x6
  c0263b:	e8 70 fa ff ff       	call   c020b0 <newObject>
  c02640:	83 c4 10             	add    $0x10,%esp
  c02643:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c02646:	83 ec 0c             	sub    $0xc,%esp
  c02649:	ff 75 f0             	pushl  -0x10(%ebp)
  c0264c:	e8 59 12 00 00       	call   c038aa <free>
  c02651:	83 c4 10             	add    $0x10,%esp
  c02654:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02657:	c9                   	leave  
  c02658:	c3                   	ret    

00c02659 <builtImpl>:
  c02659:	55                   	push   %ebp
  c0265a:	89 e5                	mov    %esp,%ebp
  c0265c:	83 ec 18             	sub    $0x18,%esp
  c0265f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c02666:	83 ec 0c             	sub    $0xc,%esp
  c02669:	6a 0c                	push   $0xc
  c0266b:	e8 e7 13 00 00       	call   c03a57 <malloc>
  c02670:	83 c4 10             	add    $0x10,%esp
  c02673:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c02676:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c0267a:	74 12                	je     c0268e <builtImpl+0x35>
  c0267c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c0267f:	c7 00 09 00 00 00    	movl   $0x9,(%eax)
  c02685:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02688:	8b 55 08             	mov    0x8(%ebp),%edx
  c0268b:	89 50 04             	mov    %edx,0x4(%eax)
  c0268e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02691:	c9                   	leave  
  c02692:	c3                   	ret    

00c02693 <built>:
  c02693:	55                   	push   %ebp
  c02694:	89 e5                	mov    %esp,%ebp
  c02696:	53                   	push   %ebx
  c02697:	83 ec 04             	sub    $0x4,%esp
  c0269a:	83 ec 0c             	sub    $0xc,%esp
  c0269d:	68 85 4e c0 00       	push   $0xc04e85
  c026a2:	e8 20 06 00 00       	call   c02cc7 <lookup>
  c026a7:	83 c4 10             	add    $0x10,%esp
  c026aa:	89 c3                	mov    %eax,%ebx
  c026ac:	83 ec 0c             	sub    $0xc,%esp
  c026af:	68 25 21 c0 00       	push   $0xc02125
  c026b4:	e8 a0 ff ff ff       	call   c02659 <builtImpl>
  c026b9:	83 c4 10             	add    $0x10,%esp
  c026bc:	89 43 04             	mov    %eax,0x4(%ebx)
  c026bf:	83 ec 0c             	sub    $0xc,%esp
  c026c2:	68 89 4e c0 00       	push   $0xc04e89
  c026c7:	e8 fb 05 00 00       	call   c02cc7 <lookup>
  c026cc:	83 c4 10             	add    $0x10,%esp
  c026cf:	89 c3                	mov    %eax,%ebx
  c026d1:	83 ec 0c             	sub    $0xc,%esp
  c026d4:	68 96 21 c0 00       	push   $0xc02196
  c026d9:	e8 7b ff ff ff       	call   c02659 <builtImpl>
  c026de:	83 c4 10             	add    $0x10,%esp
  c026e1:	89 43 04             	mov    %eax,0x4(%ebx)
  c026e4:	83 ec 0c             	sub    $0xc,%esp
  c026e7:	68 8d 4e c0 00       	push   $0xc04e8d
  c026ec:	e8 d6 05 00 00       	call   c02cc7 <lookup>
  c026f1:	83 c4 10             	add    $0x10,%esp
  c026f4:	89 c3                	mov    %eax,%ebx
  c026f6:	83 ec 0c             	sub    $0xc,%esp
  c026f9:	68 8a 23 c0 00       	push   $0xc0238a
  c026fe:	e8 56 ff ff ff       	call   c02659 <builtImpl>
  c02703:	83 c4 10             	add    $0x10,%esp
  c02706:	89 43 04             	mov    %eax,0x4(%ebx)
  c02709:	83 ec 0c             	sub    $0xc,%esp
  c0270c:	68 91 4e c0 00       	push   $0xc04e91
  c02711:	e8 b1 05 00 00       	call   c02cc7 <lookup>
  c02716:	83 c4 10             	add    $0x10,%esp
  c02719:	89 c3                	mov    %eax,%ebx
  c0271b:	83 ec 0c             	sub    $0xc,%esp
  c0271e:	68 e0 25 c0 00       	push   $0xc025e0
  c02723:	e8 31 ff ff ff       	call   c02659 <builtImpl>
  c02728:	83 c4 10             	add    $0x10,%esp
  c0272b:	89 43 04             	mov    %eax,0x4(%ebx)
  c0272e:	83 ec 0c             	sub    $0xc,%esp
  c02731:	68 96 4e c0 00       	push   $0xc04e96
  c02736:	e8 8c 05 00 00       	call   c02cc7 <lookup>
  c0273b:	83 c4 10             	add    $0x10,%esp
  c0273e:	89 c3                	mov    %eax,%ebx
  c02740:	83 ec 0c             	sub    $0xc,%esp
  c02743:	68 d0 25 c0 00       	push   $0xc025d0
  c02748:	e8 0c ff ff ff       	call   c02659 <builtImpl>
  c0274d:	83 c4 10             	add    $0x10,%esp
  c02750:	89 43 04             	mov    %eax,0x4(%ebx)
  c02753:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c02756:	c9                   	leave  
  c02757:	c3                   	ret    

00c02758 <_eval>:
  c02758:	55                   	push   %ebp
  c02759:	89 e5                	mov    %esp,%ebp
  c0275b:	53                   	push   %ebx
  c0275c:	83 ec 14             	sub    $0x14,%esp
  c0275f:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02762:	88 45 f4             	mov    %al,-0xc(%ebp)
  c02765:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c02769:	0f 84 d7 00 00 00    	je     c02846 <_eval+0xee>
  c0276f:	8b 45 08             	mov    0x8(%ebp),%eax
  c02772:	8b 00                	mov    (%eax),%eax
  c02774:	83 f8 07             	cmp    $0x7,%eax
  c02777:	0f 87 c8 00 00 00    	ja     c02845 <_eval+0xed>
  c0277d:	8b 04 85 9c 4e c0 00 	mov    0xc04e9c(,%eax,4),%eax
  c02784:	ff e0                	jmp    *%eax
  c02786:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
  c0278a:	74 27                	je     c027b3 <_eval+0x5b>
  c0278c:	0f b6 5d f4          	movzbl -0xc(%ebp),%ebx
  c02790:	83 ec 0c             	sub    $0xc,%esp
  c02793:	ff 75 08             	pushl  0x8(%ebp)
  c02796:	e8 78 fa ff ff       	call   c02213 <_symbol>
  c0279b:	83 c4 10             	add    $0x10,%esp
  c0279e:	83 ec 08             	sub    $0x8,%esp
  c027a1:	53                   	push   %ebx
  c027a2:	50                   	push   %eax
  c027a3:	e8 b0 ff ff ff       	call   c02758 <_eval>
  c027a8:	83 c4 10             	add    $0x10,%esp
  c027ab:	89 45 08             	mov    %eax,0x8(%ebp)
  c027ae:	e9 93 00 00 00       	jmp    c02846 <_eval+0xee>
  c027b3:	e9 8e 00 00 00       	jmp    c02846 <_eval+0xee>
  c027b8:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
  c027bc:	74 13                	je     c027d1 <_eval+0x79>
  c027be:	83 ec 0c             	sub    $0xc,%esp
  c027c1:	ff 75 08             	pushl  0x8(%ebp)
  c027c4:	e8 4e fb ff ff       	call   c02317 <_list>
  c027c9:	83 c4 10             	add    $0x10,%esp
  c027cc:	89 45 08             	mov    %eax,0x8(%ebp)
  c027cf:	eb 75                	jmp    c02846 <_eval+0xee>
  c027d1:	0f b6 55 f4          	movzbl -0xc(%ebp),%edx
  c027d5:	8b 45 08             	mov    0x8(%ebp),%eax
  c027d8:	8b 40 04             	mov    0x4(%eax),%eax
  c027db:	83 ec 08             	sub    $0x8,%esp
  c027de:	52                   	push   %edx
  c027df:	50                   	push   %eax
  c027e0:	e8 73 ff ff ff       	call   c02758 <_eval>
  c027e5:	83 c4 10             	add    $0x10,%esp
  c027e8:	8b 55 08             	mov    0x8(%ebp),%edx
  c027eb:	89 42 04             	mov    %eax,0x4(%edx)
  c027ee:	eb 56                	jmp    c02846 <_eval+0xee>
  c027f0:	8b 45 08             	mov    0x8(%ebp),%eax
  c027f3:	8b 40 04             	mov    0x4(%eax),%eax
  c027f6:	83 ec 08             	sub    $0x8,%esp
  c027f9:	6a 00                	push   $0x0
  c027fb:	50                   	push   %eax
  c027fc:	e8 57 ff ff ff       	call   c02758 <_eval>
  c02801:	83 c4 10             	add    $0x10,%esp
  c02804:	89 45 08             	mov    %eax,0x8(%ebp)
  c02807:	eb 3d                	jmp    c02846 <_eval+0xee>
  c02809:	0f b6 55 f4          	movzbl -0xc(%ebp),%edx
  c0280d:	8b 45 08             	mov    0x8(%ebp),%eax
  c02810:	8b 40 04             	mov    0x4(%eax),%eax
  c02813:	83 ec 08             	sub    $0x8,%esp
  c02816:	52                   	push   %edx
  c02817:	50                   	push   %eax
  c02818:	e8 3b ff ff ff       	call   c02758 <_eval>
  c0281d:	83 c4 10             	add    $0x10,%esp
  c02820:	8b 55 08             	mov    0x8(%ebp),%edx
  c02823:	89 42 04             	mov    %eax,0x4(%edx)
  c02826:	0f b6 55 f4          	movzbl -0xc(%ebp),%edx
  c0282a:	8b 45 08             	mov    0x8(%ebp),%eax
  c0282d:	8b 40 08             	mov    0x8(%eax),%eax
  c02830:	83 ec 08             	sub    $0x8,%esp
  c02833:	52                   	push   %edx
  c02834:	50                   	push   %eax
  c02835:	e8 1e ff ff ff       	call   c02758 <_eval>
  c0283a:	83 c4 10             	add    $0x10,%esp
  c0283d:	8b 55 08             	mov    0x8(%ebp),%edx
  c02840:	89 42 08             	mov    %eax,0x8(%edx)
  c02843:	eb 01                	jmp    c02846 <_eval+0xee>
  c02845:	90                   	nop
  c02846:	8b 45 08             	mov    0x8(%ebp),%eax
  c02849:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c0284c:	c9                   	leave  
  c0284d:	c3                   	ret    

00c0284e <eval>:
  c0284e:	55                   	push   %ebp
  c0284f:	89 e5                	mov    %esp,%ebp
  c02851:	83 ec 08             	sub    $0x8,%esp
  c02854:	83 ec 08             	sub    $0x8,%esp
  c02857:	6a 01                	push   $0x1
  c02859:	ff 75 08             	pushl  0x8(%ebp)
  c0285c:	e8 f7 fe ff ff       	call   c02758 <_eval>
  c02861:	83 c4 10             	add    $0x10,%esp
  c02864:	c9                   	leave  
  c02865:	c3                   	ret    

00c02866 <_display>:
  c02866:	55                   	push   %ebp
  c02867:	89 e5                	mov    %esp,%ebp
  c02869:	83 ec 08             	sub    $0x8,%esp
  c0286c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c02870:	0f 84 6b 01 00 00    	je     c029e1 <_display+0x17b>
  c02876:	8b 45 08             	mov    0x8(%ebp),%eax
  c02879:	8b 00                	mov    (%eax),%eax
  c0287b:	83 f8 09             	cmp    $0x9,%eax
  c0287e:	0f 87 44 01 00 00    	ja     c029c8 <_display+0x162>
  c02884:	8b 04 85 00 4f c0 00 	mov    0xc04f00(,%eax,4),%eax
  c0288b:	ff e0                	jmp    *%eax
  c0288d:	83 ec 0c             	sub    $0xc,%esp
  c02890:	ff 75 08             	pushl  0x8(%ebp)
  c02893:	e8 8d f8 ff ff       	call   c02125 <_car>
  c02898:	83 c4 10             	add    $0x10,%esp
  c0289b:	83 ec 0c             	sub    $0xc,%esp
  c0289e:	50                   	push   %eax
  c0289f:	e8 c2 ff ff ff       	call   c02866 <_display>
  c028a4:	83 c4 10             	add    $0x10,%esp
  c028a7:	83 ec 0c             	sub    $0xc,%esp
  c028aa:	68 83 4e c0 00       	push   $0xc04e83
  c028af:	e8 bc 11 00 00       	call   c03a70 <printf>
  c028b4:	83 c4 10             	add    $0x10,%esp
  c028b7:	83 ec 0c             	sub    $0xc,%esp
  c028ba:	ff 75 08             	pushl  0x8(%ebp)
  c028bd:	e8 d4 f8 ff ff       	call   c02196 <_cdr>
  c028c2:	83 c4 10             	add    $0x10,%esp
  c028c5:	83 ec 0c             	sub    $0xc,%esp
  c028c8:	50                   	push   %eax
  c028c9:	e8 98 ff ff ff       	call   c02866 <_display>
  c028ce:	83 c4 10             	add    $0x10,%esp
  c028d1:	e9 09 01 00 00       	jmp    c029df <_display+0x179>
  c028d6:	83 ec 0c             	sub    $0xc,%esp
  c028d9:	68 bc 4e c0 00       	push   $0xc04ebc
  c028de:	e8 8d 11 00 00       	call   c03a70 <printf>
  c028e3:	83 c4 10             	add    $0x10,%esp
  c028e6:	8b 45 08             	mov    0x8(%ebp),%eax
  c028e9:	8b 40 04             	mov    0x4(%eax),%eax
  c028ec:	83 ec 0c             	sub    $0xc,%esp
  c028ef:	50                   	push   %eax
  c028f0:	e8 71 ff ff ff       	call   c02866 <_display>
  c028f5:	83 c4 10             	add    $0x10,%esp
  c028f8:	83 ec 0c             	sub    $0xc,%esp
  c028fb:	68 be 4e c0 00       	push   $0xc04ebe
  c02900:	e8 6b 11 00 00       	call   c03a70 <printf>
  c02905:	83 c4 10             	add    $0x10,%esp
  c02908:	e9 d2 00 00 00       	jmp    c029df <_display+0x179>
  c0290d:	8b 45 08             	mov    0x8(%ebp),%eax
  c02910:	8b 40 04             	mov    0x4(%eax),%eax
  c02913:	8b 00                	mov    (%eax),%eax
  c02915:	83 ec 08             	sub    $0x8,%esp
  c02918:	50                   	push   %eax
  c02919:	68 c0 4e c0 00       	push   $0xc04ec0
  c0291e:	e8 4d 11 00 00       	call   c03a70 <printf>
  c02923:	83 c4 10             	add    $0x10,%esp
  c02926:	e9 b4 00 00 00       	jmp    c029df <_display+0x179>
  c0292b:	8b 45 08             	mov    0x8(%ebp),%eax
  c0292e:	8b 40 04             	mov    0x4(%eax),%eax
  c02931:	83 ec 08             	sub    $0x8,%esp
  c02934:	50                   	push   %eax
  c02935:	68 c3 4e c0 00       	push   $0xc04ec3
  c0293a:	e8 31 11 00 00       	call   c03a70 <printf>
  c0293f:	83 c4 10             	add    $0x10,%esp
  c02942:	e9 98 00 00 00       	jmp    c029df <_display+0x179>
  c02947:	8b 45 08             	mov    0x8(%ebp),%eax
  c0294a:	8b 40 04             	mov    0x4(%eax),%eax
  c0294d:	83 ec 08             	sub    $0x8,%esp
  c02950:	50                   	push   %eax
  c02951:	68 c8 4e c0 00       	push   $0xc04ec8
  c02956:	e8 15 11 00 00       	call   c03a70 <printf>
  c0295b:	83 c4 10             	add    $0x10,%esp
  c0295e:	eb 7f                	jmp    c029df <_display+0x179>
  c02960:	83 ec 0c             	sub    $0xc,%esp
  c02963:	68 cb 4e c0 00       	push   $0xc04ecb
  c02968:	e8 03 11 00 00       	call   c03a70 <printf>
  c0296d:	83 c4 10             	add    $0x10,%esp
  c02970:	eb 6d                	jmp    c029df <_display+0x179>
  c02972:	83 ec 0c             	sub    $0xc,%esp
  c02975:	68 cf 4e c0 00       	push   $0xc04ecf
  c0297a:	e8 f1 10 00 00       	call   c03a70 <printf>
  c0297f:	83 c4 10             	add    $0x10,%esp
  c02982:	8b 45 08             	mov    0x8(%ebp),%eax
  c02985:	8b 40 04             	mov    0x4(%eax),%eax
  c02988:	83 ec 0c             	sub    $0xc,%esp
  c0298b:	50                   	push   %eax
  c0298c:	e8 d5 fe ff ff       	call   c02866 <_display>
  c02991:	83 c4 10             	add    $0x10,%esp
  c02994:	eb 49                	jmp    c029df <_display+0x179>
  c02996:	8b 45 08             	mov    0x8(%ebp),%eax
  c02999:	8b 40 04             	mov    0x4(%eax),%eax
  c0299c:	83 ec 08             	sub    $0x8,%esp
  c0299f:	50                   	push   %eax
  c029a0:	68 d1 4e c0 00       	push   $0xc04ed1
  c029a5:	e8 c6 10 00 00       	call   c03a70 <printf>
  c029aa:	83 c4 10             	add    $0x10,%esp
  c029ad:	eb 30                	jmp    c029df <_display+0x179>
  c029af:	8b 45 08             	mov    0x8(%ebp),%eax
  c029b2:	8b 40 04             	mov    0x4(%eax),%eax
  c029b5:	83 ec 08             	sub    $0x8,%esp
  c029b8:	50                   	push   %eax
  c029b9:	68 e0 4e c0 00       	push   $0xc04ee0
  c029be:	e8 ad 10 00 00       	call   c03a70 <printf>
  c029c3:	83 c4 10             	add    $0x10,%esp
  c029c6:	eb 17                	jmp    c029df <_display+0x179>
  c029c8:	8b 45 08             	mov    0x8(%ebp),%eax
  c029cb:	8b 00                	mov    (%eax),%eax
  c029cd:	83 ec 08             	sub    $0x8,%esp
  c029d0:	50                   	push   %eax
  c029d1:	68 ed 4e c0 00       	push   $0xc04eed
  c029d6:	e8 95 10 00 00       	call   c03a70 <printf>
  c029db:	83 c4 10             	add    $0x10,%esp
  c029de:	90                   	nop
  c029df:	eb 10                	jmp    c029f1 <_display+0x18b>
  c029e1:	83 ec 0c             	sub    $0xc,%esp
  c029e4:	68 cb 4e c0 00       	push   $0xc04ecb
  c029e9:	e8 82 10 00 00       	call   c03a70 <printf>
  c029ee:	83 c4 10             	add    $0x10,%esp
  c029f1:	c9                   	leave  
  c029f2:	c3                   	ret    

00c029f3 <display>:
  c029f3:	55                   	push   %ebp
  c029f4:	89 e5                	mov    %esp,%ebp
  c029f6:	83 ec 08             	sub    $0x8,%esp
  c029f9:	83 ec 0c             	sub    $0xc,%esp
  c029fc:	ff 75 08             	pushl  0x8(%ebp)
  c029ff:	e8 62 fe ff ff       	call   c02866 <_display>
  c02a04:	83 c4 10             	add    $0x10,%esp
  c02a07:	c9                   	leave  
  c02a08:	c3                   	ret    
  c02a09:	66 90                	xchg   %ax,%ax
  c02a0b:	90                   	nop

00c02a0c <memcpy>:
  c02a0c:	55                   	push   %ebp
  c02a0d:	89 e5                	mov    %esp,%ebp
  c02a0f:	57                   	push   %edi
  c02a10:	56                   	push   %esi
  c02a11:	53                   	push   %ebx
  c02a12:	8b 45 10             	mov    0x10(%ebp),%eax
  c02a15:	8b 55 0c             	mov    0xc(%ebp),%edx
  c02a18:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c02a1b:	89 c1                	mov    %eax,%ecx
  c02a1d:	89 d6                	mov    %edx,%esi
  c02a1f:	89 df                	mov    %ebx,%edi
  c02a21:	fc                   	cld    
  c02a22:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  c02a24:	8b 45 08             	mov    0x8(%ebp),%eax
  c02a27:	5b                   	pop    %ebx
  c02a28:	5e                   	pop    %esi
  c02a29:	5f                   	pop    %edi
  c02a2a:	5d                   	pop    %ebp
  c02a2b:	c3                   	ret    

00c02a2c <realloc>:
  c02a2c:	55                   	push   %ebp
  c02a2d:	89 e5                	mov    %esp,%ebp
  c02a2f:	83 ec 18             	sub    $0x18,%esp
  c02a32:	83 ec 0c             	sub    $0xc,%esp
  c02a35:	ff 75 0c             	pushl  0xc(%ebp)
  c02a38:	e8 1a 10 00 00       	call   c03a57 <malloc>
  c02a3d:	83 c4 10             	add    $0x10,%esp
  c02a40:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c02a43:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c02a47:	74 15                	je     c02a5e <realloc+0x32>
  c02a49:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02a4c:	83 ec 04             	sub    $0x4,%esp
  c02a4f:	50                   	push   %eax
  c02a50:	ff 75 08             	pushl  0x8(%ebp)
  c02a53:	ff 75 f4             	pushl  -0xc(%ebp)
  c02a56:	e8 b1 ff ff ff       	call   c02a0c <memcpy>
  c02a5b:	83 c4 10             	add    $0x10,%esp
  c02a5e:	83 ec 0c             	sub    $0xc,%esp
  c02a61:	ff 75 08             	pushl  0x8(%ebp)
  c02a64:	e8 41 0e 00 00       	call   c038aa <free>
  c02a69:	83 c4 10             	add    $0x10,%esp
  c02a6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02a6f:	c9                   	leave  
  c02a70:	c3                   	ret    

00c02a71 <parse>:
  c02a71:	55                   	push   %ebp
  c02a72:	89 e5                	mov    %esp,%ebp
  c02a74:	83 ec 10             	sub    $0x10,%esp
  c02a77:	8b 45 08             	mov    0x8(%ebp),%eax
  c02a7a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c02a7d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c02a84:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02a87:	8b 55 08             	mov    0x8(%ebp),%edx
  c02a8a:	89 10                	mov    %edx,(%eax)
  c02a8c:	eb 56                	jmp    c02ae4 <parse+0x73>
  c02a8e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c02a91:	0f b6 00             	movzbl (%eax),%eax
  c02a94:	0f be c0             	movsbl %al,%eax
  c02a97:	83 f8 20             	cmp    $0x20,%eax
  c02a9a:	75 44                	jne    c02ae0 <parse+0x6f>
  c02a9c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c02a9f:	c6 00 00             	movb   $0x0,(%eax)
  c02aa2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  c02aa6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c02aa9:	0f b6 00             	movzbl (%eax),%eax
  c02aac:	84 c0                	test   %al,%al
  c02aae:	74 0a                	je     c02aba <parse+0x49>
  c02ab0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c02ab3:	0f b6 00             	movzbl (%eax),%eax
  c02ab6:	3c 20                	cmp    $0x20,%al
  c02ab8:	74 e8                	je     c02aa2 <parse+0x31>
  c02aba:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  c02abe:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c02ac1:	3b 45 10             	cmp    0x10(%ebp),%eax
  c02ac4:	7c 05                	jl     c02acb <parse+0x5a>
  c02ac6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c02ac9:	eb 32                	jmp    c02afd <parse+0x8c>
  c02acb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c02ace:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c02ad5:	8b 45 0c             	mov    0xc(%ebp),%eax
  c02ad8:	01 c2                	add    %eax,%edx
  c02ada:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c02add:	89 02                	mov    %eax,(%edx)
  c02adf:	90                   	nop
  c02ae0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  c02ae4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c02ae7:	0f b6 00             	movzbl (%eax),%eax
  c02aea:	84 c0                	test   %al,%al
  c02aec:	75 a0                	jne    c02a8e <parse+0x1d>
  c02aee:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c02af1:	3b 45 08             	cmp    0x8(%ebp),%eax
  c02af4:	74 04                	je     c02afa <parse+0x89>
  c02af6:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  c02afa:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c02afd:	c9                   	leave  
  c02afe:	c3                   	ret    

00c02aff <system>:
  c02aff:	55                   	push   %ebp
  c02b00:	89 e5                	mov    %esp,%ebp
  c02b02:	83 ec 38             	sub    $0x38,%esp
  c02b05:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c02b0c:	6a 0a                	push   $0xa
  c02b0e:	8d 45 c8             	lea    -0x38(%ebp),%eax
  c02b11:	50                   	push   %eax
  c02b12:	ff 75 08             	pushl  0x8(%ebp)
  c02b15:	e8 57 ff ff ff       	call   c02a71 <parse>
  c02b1a:	83 c4 0c             	add    $0xc,%esp
  c02b1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c02b20:	e8 04 03 00 00       	call   c02e29 <fork>
  c02b25:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c02b28:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  c02b2c:	75 2f                	jne    c02b5d <system+0x5e>
  c02b2e:	8b 45 c8             	mov    -0x38(%ebp),%eax
  c02b31:	83 ec 04             	sub    $0x4,%esp
  c02b34:	ff 75 f4             	pushl  -0xc(%ebp)
  c02b37:	50                   	push   %eax
  c02b38:	68 28 4f c0 00       	push   $0xc04f28
  c02b3d:	e8 2e 0f 00 00       	call   c03a70 <printf>
  c02b42:	83 c4 10             	add    $0x10,%esp
  c02b45:	8b 45 c8             	mov    -0x38(%ebp),%eax
  c02b48:	83 ec 04             	sub    $0x4,%esp
  c02b4b:	8d 55 c8             	lea    -0x38(%ebp),%edx
  c02b4e:	52                   	push   %edx
  c02b4f:	ff 75 f4             	pushl  -0xc(%ebp)
  c02b52:	50                   	push   %eax
  c02b53:	e8 98 03 00 00       	call   c02ef0 <exec>
  c02b58:	83 c4 10             	add    $0x10,%esp
  c02b5b:	eb 1d                	jmp    c02b7a <system+0x7b>
  c02b5d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  c02b61:	79 17                	jns    c02b7a <system+0x7b>
  c02b63:	83 ec 0c             	sub    $0xc,%esp
  c02b66:	68 31 4f c0 00       	push   $0xc04f31
  c02b6b:	e8 00 0f 00 00       	call   c03a70 <printf>
  c02b70:	83 c4 10             	add    $0x10,%esp
  c02b73:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  c02b78:	eb 05                	jmp    c02b7f <system+0x80>
  c02b7a:	b8 00 00 00 00       	mov    $0x0,%eax
  c02b7f:	c9                   	leave  
  c02b80:	c3                   	ret    

00c02b81 <atoi>:
  c02b81:	55                   	push   %ebp
  c02b82:	89 e5                	mov    %esp,%ebp
  c02b84:	83 ec 10             	sub    $0x10,%esp
  c02b87:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c02b8e:	eb 37                	jmp    c02bc7 <atoi+0x46>
  c02b90:	8b 45 08             	mov    0x8(%ebp),%eax
  c02b93:	0f b6 00             	movzbl (%eax),%eax
  c02b96:	3c 2f                	cmp    $0x2f,%al
  c02b98:	7e 37                	jle    c02bd1 <atoi+0x50>
  c02b9a:	8b 45 08             	mov    0x8(%ebp),%eax
  c02b9d:	0f b6 00             	movzbl (%eax),%eax
  c02ba0:	3c 39                	cmp    $0x39,%al
  c02ba2:	7f 2d                	jg     c02bd1 <atoi+0x50>
  c02ba4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  c02ba7:	89 d0                	mov    %edx,%eax
  c02ba9:	c1 e0 02             	shl    $0x2,%eax
  c02bac:	01 d0                	add    %edx,%eax
  c02bae:	01 c0                	add    %eax,%eax
  c02bb0:	89 c2                	mov    %eax,%edx
  c02bb2:	8b 45 08             	mov    0x8(%ebp),%eax
  c02bb5:	0f b6 00             	movzbl (%eax),%eax
  c02bb8:	0f be c0             	movsbl %al,%eax
  c02bbb:	01 d0                	add    %edx,%eax
  c02bbd:	83 e8 30             	sub    $0x30,%eax
  c02bc0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c02bc3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c02bc7:	8b 45 08             	mov    0x8(%ebp),%eax
  c02bca:	0f b6 00             	movzbl (%eax),%eax
  c02bcd:	84 c0                	test   %al,%al
  c02bcf:	75 bf                	jne    c02b90 <atoi+0xf>
  c02bd1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c02bd4:	c9                   	leave  
  c02bd5:	c3                   	ret    
  c02bd6:	66 90                	xchg   %ax,%ax

00c02bd8 <strcmp>:
  c02bd8:	55                   	push   %ebp
  c02bd9:	89 e5                	mov    %esp,%ebp
  c02bdb:	57                   	push   %edi
  c02bdc:	56                   	push   %esi
  c02bdd:	8b 45 08             	mov    0x8(%ebp),%eax
  c02be0:	8b 55 0c             	mov    0xc(%ebp),%edx
  c02be3:	89 c7                	mov    %eax,%edi
  c02be5:	89 d6                	mov    %edx,%esi
  c02be7:	fc                   	cld    
  c02be8:	ac                   	lods   %ds:(%esi),%al
  c02be9:	ae                   	scas   %es:(%edi),%al
  c02bea:	75 08                	jne    c02bf4 <strcmp+0x1c>
  c02bec:	84 c0                	test   %al,%al
  c02bee:	75 f8                	jne    c02be8 <strcmp+0x10>
  c02bf0:	31 c0                	xor    %eax,%eax
  c02bf2:	eb 09                	jmp    c02bfd <strcmp+0x25>
  c02bf4:	b8 01 00 00 00       	mov    $0x1,%eax
  c02bf9:	7c 02                	jl     c02bfd <strcmp+0x25>
  c02bfb:	f7 d8                	neg    %eax
  c02bfd:	5e                   	pop    %esi
  c02bfe:	5f                   	pop    %edi
  c02bff:	5d                   	pop    %ebp
  c02c00:	c3                   	ret    

00c02c01 <strlen>:
  c02c01:	55                   	push   %ebp
  c02c02:	89 e5                	mov    %esp,%ebp
  c02c04:	57                   	push   %edi
  c02c05:	8b 55 08             	mov    0x8(%ebp),%edx
  c02c08:	b8 00 00 00 00       	mov    $0x0,%eax
  c02c0d:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c02c12:	89 d7                	mov    %edx,%edi
  c02c14:	fc                   	cld    
  c02c15:	f2 ae                	repnz scas %es:(%edi),%al
  c02c17:	f7 d1                	not    %ecx
  c02c19:	49                   	dec    %ecx
  c02c1a:	89 c8                	mov    %ecx,%eax
  c02c1c:	5f                   	pop    %edi
  c02c1d:	5d                   	pop    %ebp
  c02c1e:	c3                   	ret    

00c02c1f <memcpy>:
  c02c1f:	55                   	push   %ebp
  c02c20:	89 e5                	mov    %esp,%ebp
  c02c22:	57                   	push   %edi
  c02c23:	56                   	push   %esi
  c02c24:	53                   	push   %ebx
  c02c25:	8b 45 10             	mov    0x10(%ebp),%eax
  c02c28:	8b 55 0c             	mov    0xc(%ebp),%edx
  c02c2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c02c2e:	89 c1                	mov    %eax,%ecx
  c02c30:	89 d6                	mov    %edx,%esi
  c02c32:	89 df                	mov    %ebx,%edi
  c02c34:	fc                   	cld    
  c02c35:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  c02c37:	8b 45 08             	mov    0x8(%ebp),%eax
  c02c3a:	5b                   	pop    %ebx
  c02c3b:	5e                   	pop    %esi
  c02c3c:	5f                   	pop    %edi
  c02c3d:	5d                   	pop    %ebp
  c02c3e:	c3                   	ret    

00c02c3f <strdup>:
  c02c3f:	55                   	push   %ebp
  c02c40:	89 e5                	mov    %esp,%ebp
  c02c42:	83 ec 18             	sub    $0x18,%esp
  c02c45:	ff 75 08             	pushl  0x8(%ebp)
  c02c48:	e8 b4 ff ff ff       	call   c02c01 <strlen>
  c02c4d:	83 c4 04             	add    $0x4,%esp
  c02c50:	83 c0 01             	add    $0x1,%eax
  c02c53:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c02c56:	83 ec 0c             	sub    $0xc,%esp
  c02c59:	ff 75 f4             	pushl  -0xc(%ebp)
  c02c5c:	e8 f6 0d 00 00       	call   c03a57 <malloc>
  c02c61:	83 c4 10             	add    $0x10,%esp
  c02c64:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c02c67:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  c02c6b:	75 07                	jne    c02c74 <strdup+0x35>
  c02c6d:	b8 00 00 00 00       	mov    $0x0,%eax
  c02c72:	eb 15                	jmp    c02c89 <strdup+0x4a>
  c02c74:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02c77:	83 ec 04             	sub    $0x4,%esp
  c02c7a:	50                   	push   %eax
  c02c7b:	ff 75 08             	pushl  0x8(%ebp)
  c02c7e:	ff 75 f0             	pushl  -0x10(%ebp)
  c02c81:	e8 99 ff ff ff       	call   c02c1f <memcpy>
  c02c86:	83 c4 10             	add    $0x10,%esp
  c02c89:	c9                   	leave  
  c02c8a:	c3                   	ret    

00c02c8b <hashSymbol>:
  c02c8b:	55                   	push   %ebp
  c02c8c:	89 e5                	mov    %esp,%ebp
  c02c8e:	83 ec 10             	sub    $0x10,%esp
  c02c91:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c02c98:	eb 10                	jmp    c02caa <hashSymbol+0x1f>
  c02c9a:	8b 55 fc             	mov    -0x4(%ebp),%edx
  c02c9d:	89 d0                	mov    %edx,%eax
  c02c9f:	c1 e0 03             	shl    $0x3,%eax
  c02ca2:	01 d0                	add    %edx,%eax
  c02ca4:	33 45 f8             	xor    -0x8(%ebp),%eax
  c02ca7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c02caa:	8b 45 08             	mov    0x8(%ebp),%eax
  c02cad:	8d 50 01             	lea    0x1(%eax),%edx
  c02cb0:	89 55 08             	mov    %edx,0x8(%ebp)
  c02cb3:	0f b6 00             	movzbl (%eax),%eax
  c02cb6:	0f be c0             	movsbl %al,%eax
  c02cb9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c02cbc:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  c02cc0:	75 d8                	jne    c02c9a <hashSymbol+0xf>
  c02cc2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c02cc5:	c9                   	leave  
  c02cc6:	c3                   	ret    

00c02cc7 <lookup>:
  c02cc7:	55                   	push   %ebp
  c02cc8:	89 e5                	mov    %esp,%ebp
  c02cca:	83 ec 18             	sub    $0x18,%esp
  c02ccd:	ff 75 08             	pushl  0x8(%ebp)
  c02cd0:	e8 b6 ff ff ff       	call   c02c8b <hashSymbol>
  c02cd5:	83 c4 04             	add    $0x4,%esp
  c02cd8:	89 c1                	mov    %eax,%ecx
  c02cda:	ba c1 33 c7 d1       	mov    $0xd1c733c1,%edx
  c02cdf:	89 c8                	mov    %ecx,%eax
  c02ce1:	f7 e2                	mul    %edx
  c02ce3:	c1 ea 0d             	shr    $0xd,%edx
  c02ce6:	69 c2 0d 27 00 00    	imul   $0x270d,%edx,%eax
  c02cec:	29 c1                	sub    %eax,%ecx
  c02cee:	89 ca                	mov    %ecx,%edx
  c02cf0:	89 d0                	mov    %edx,%eax
  c02cf2:	01 c0                	add    %eax,%eax
  c02cf4:	01 d0                	add    %edx,%eax
  c02cf6:	c1 e0 02             	shl    $0x2,%eax
  c02cf9:	05 00 81 c0 00       	add    $0xc08100,%eax
  c02cfe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c02d01:	c7 45 f0 0d 27 00 00 	movl   $0x270d,-0x10(%ebp)
  c02d08:	eb 6c                	jmp    c02d76 <lookup+0xaf>
  c02d0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02d0d:	8b 00                	mov    (%eax),%eax
  c02d0f:	85 c0                	test   %eax,%eax
  c02d11:	74 1a                	je     c02d2d <lookup+0x66>
  c02d13:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02d16:	8b 00                	mov    (%eax),%eax
  c02d18:	ff 75 08             	pushl  0x8(%ebp)
  c02d1b:	50                   	push   %eax
  c02d1c:	e8 b7 fe ff ff       	call   c02bd8 <strcmp>
  c02d21:	83 c4 08             	add    $0x8,%esp
  c02d24:	85 c0                	test   %eax,%eax
  c02d26:	75 05                	jne    c02d2d <lookup+0x66>
  c02d28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02d2b:	eb 6d                	jmp    c02d9a <lookup+0xd3>
  c02d2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02d30:	8b 00                	mov    (%eax),%eax
  c02d32:	85 c0                	test   %eax,%eax
  c02d34:	75 2c                	jne    c02d62 <lookup+0x9b>
  c02d36:	83 ec 0c             	sub    $0xc,%esp
  c02d39:	ff 75 08             	pushl  0x8(%ebp)
  c02d3c:	e8 fe fe ff ff       	call   c02c3f <strdup>
  c02d41:	83 c4 10             	add    $0x10,%esp
  c02d44:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c02d47:	89 02                	mov    %eax,(%edx)
  c02d49:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02d4c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  c02d53:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02d56:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  c02d5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02d60:	eb 38                	jmp    c02d9a <lookup+0xd3>
  c02d62:	83 45 f4 0c          	addl   $0xc,-0xc(%ebp)
  c02d66:	81 7d f4 9c 55 c2 00 	cmpl   $0xc2559c,-0xc(%ebp)
  c02d6d:	72 07                	jb     c02d76 <lookup+0xaf>
  c02d6f:	c7 45 f4 00 81 c0 00 	movl   $0xc08100,-0xc(%ebp)
  c02d76:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
  c02d7a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  c02d7e:	79 8a                	jns    c02d0a <lookup+0x43>
  c02d80:	83 ec 0c             	sub    $0xc,%esp
  c02d83:	68 38 4f c0 00       	push   $0xc04f38
  c02d88:	e8 74 da ff ff       	call   c00801 <yyerror>
  c02d8d:	83 c4 10             	add    $0x10,%esp
  c02d90:	83 ec 0c             	sub    $0xc,%esp
  c02d93:	6a 01                	push   $0x1
  c02d95:	e8 a7 05 00 00       	call   c03341 <exit>
  c02d9a:	c9                   	leave  
  c02d9b:	c3                   	ret    

00c02d9c <newSymbolList>:
  c02d9c:	55                   	push   %ebp
  c02d9d:	89 e5                	mov    %esp,%ebp
  c02d9f:	83 ec 18             	sub    $0x18,%esp
  c02da2:	83 ec 0c             	sub    $0xc,%esp
  c02da5:	6a 08                	push   $0x8
  c02da7:	e8 ab 0c 00 00       	call   c03a57 <malloc>
  c02dac:	83 c4 10             	add    $0x10,%esp
  c02daf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c02db2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c02db6:	74 11                	je     c02dc9 <newSymbolList+0x2d>
  c02db8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02dbb:	8b 55 08             	mov    0x8(%ebp),%edx
  c02dbe:	89 10                	mov    %edx,(%eax)
  c02dc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02dc3:	8b 55 0c             	mov    0xc(%ebp),%edx
  c02dc6:	89 50 04             	mov    %edx,0x4(%eax)
  c02dc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02dcc:	c9                   	leave  
  c02dcd:	c3                   	ret    

00c02dce <delSymbolList>:
  c02dce:	55                   	push   %ebp
  c02dcf:	89 e5                	mov    %esp,%ebp
  c02dd1:	83 ec 18             	sub    $0x18,%esp
  c02dd4:	eb 1d                	jmp    c02df3 <delSymbolList+0x25>
  c02dd6:	8b 45 08             	mov    0x8(%ebp),%eax
  c02dd9:	8b 40 04             	mov    0x4(%eax),%eax
  c02ddc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c02ddf:	83 ec 0c             	sub    $0xc,%esp
  c02de2:	ff 75 08             	pushl  0x8(%ebp)
  c02de5:	e8 c0 0a 00 00       	call   c038aa <free>
  c02dea:	83 c4 10             	add    $0x10,%esp
  c02ded:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c02df0:	89 45 08             	mov    %eax,0x8(%ebp)
  c02df3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c02df7:	75 dd                	jne    c02dd6 <delSymbolList+0x8>
  c02df9:	c9                   	leave  
  c02dfa:	c3                   	ret    
  c02dfb:	90                   	nop

00c02dfc <_run>:
  c02dfc:	55                   	push   %ebp
  c02dfd:	89 e5                	mov    %esp,%ebp
  c02dff:	57                   	push   %edi
  c02e00:	56                   	push   %esi
  c02e01:	53                   	push   %ebx
  c02e02:	83 ec 10             	sub    $0x10,%esp
  c02e05:	8b 55 10             	mov    0x10(%ebp),%edx
  c02e08:	8b 75 18             	mov    0x18(%ebp),%esi
  c02e0b:	8b 7d 14             	mov    0x14(%ebp),%edi
  c02e0e:	b8 00 00 00 00       	mov    $0x0,%eax
  c02e13:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c02e16:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c02e19:	cd 80                	int    $0x80
  c02e1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c02e1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c02e21:	83 c4 10             	add    $0x10,%esp
  c02e24:	5b                   	pop    %ebx
  c02e25:	5e                   	pop    %esi
  c02e26:	5f                   	pop    %edi
  c02e27:	5d                   	pop    %ebp
  c02e28:	c3                   	ret    

00c02e29 <fork>:
  c02e29:	55                   	push   %ebp
  c02e2a:	89 e5                	mov    %esp,%ebp
  c02e2c:	83 ec 10             	sub    $0x10,%esp
  c02e2f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c02e36:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c02e3d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c02e44:	ff 75 fc             	pushl  -0x4(%ebp)
  c02e47:	ff 75 f8             	pushl  -0x8(%ebp)
  c02e4a:	ff 75 f4             	pushl  -0xc(%ebp)
  c02e4d:	6a 04                	push   $0x4
  c02e4f:	6a 03                	push   $0x3
  c02e51:	e8 a6 ff ff ff       	call   c02dfc <_run>
  c02e56:	83 c4 14             	add    $0x14,%esp
  c02e59:	c9                   	leave  
  c02e5a:	c3                   	ret    
  c02e5b:	90                   	nop

00c02e5c <_run>:
  c02e5c:	55                   	push   %ebp
  c02e5d:	89 e5                	mov    %esp,%ebp
  c02e5f:	57                   	push   %edi
  c02e60:	56                   	push   %esi
  c02e61:	53                   	push   %ebx
  c02e62:	83 ec 10             	sub    $0x10,%esp
  c02e65:	8b 55 10             	mov    0x10(%ebp),%edx
  c02e68:	8b 75 18             	mov    0x18(%ebp),%esi
  c02e6b:	8b 7d 14             	mov    0x14(%ebp),%edi
  c02e6e:	b8 00 00 00 00       	mov    $0x0,%eax
  c02e73:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c02e76:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c02e79:	cd 80                	int    $0x80
  c02e7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c02e7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c02e81:	83 c4 10             	add    $0x10,%esp
  c02e84:	5b                   	pop    %ebx
  c02e85:	5e                   	pop    %esi
  c02e86:	5f                   	pop    %edi
  c02e87:	5d                   	pop    %ebp
  c02e88:	c3                   	ret    

00c02e89 <strcpy>:
  c02e89:	55                   	push   %ebp
  c02e8a:	89 e5                	mov    %esp,%ebp
  c02e8c:	57                   	push   %edi
  c02e8d:	56                   	push   %esi
  c02e8e:	8b 55 0c             	mov    0xc(%ebp),%edx
  c02e91:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c02e94:	89 d6                	mov    %edx,%esi
  c02e96:	89 cf                	mov    %ecx,%edi
  c02e98:	fc                   	cld    
  c02e99:	ac                   	lods   %ds:(%esi),%al
  c02e9a:	aa                   	stos   %al,%es:(%edi)
  c02e9b:	84 c0                	test   %al,%al
  c02e9d:	75 fa                	jne    c02e99 <strcpy+0x10>
  c02e9f:	8b 45 08             	mov    0x8(%ebp),%eax
  c02ea2:	5e                   	pop    %esi
  c02ea3:	5f                   	pop    %edi
  c02ea4:	5d                   	pop    %ebp
  c02ea5:	c3                   	ret    

00c02ea6 <strcat>:
  c02ea6:	55                   	push   %ebp
  c02ea7:	89 e5                	mov    %esp,%ebp
  c02ea9:	57                   	push   %edi
  c02eaa:	56                   	push   %esi
  c02eab:	53                   	push   %ebx
  c02eac:	8b 55 0c             	mov    0xc(%ebp),%edx
  c02eaf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c02eb2:	b8 00 00 00 00       	mov    $0x0,%eax
  c02eb7:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c02ebc:	89 d6                	mov    %edx,%esi
  c02ebe:	89 df                	mov    %ebx,%edi
  c02ec0:	fc                   	cld    
  c02ec1:	f2 ae                	repnz scas %es:(%edi),%al
  c02ec3:	4f                   	dec    %edi
  c02ec4:	ac                   	lods   %ds:(%esi),%al
  c02ec5:	aa                   	stos   %al,%es:(%edi)
  c02ec6:	84 c0                	test   %al,%al
  c02ec8:	75 fa                	jne    c02ec4 <strcat+0x1e>
  c02eca:	8b 45 08             	mov    0x8(%ebp),%eax
  c02ecd:	5b                   	pop    %ebx
  c02ece:	5e                   	pop    %esi
  c02ecf:	5f                   	pop    %edi
  c02ed0:	5d                   	pop    %ebp
  c02ed1:	c3                   	ret    

00c02ed2 <strlen>:
  c02ed2:	55                   	push   %ebp
  c02ed3:	89 e5                	mov    %esp,%ebp
  c02ed5:	57                   	push   %edi
  c02ed6:	8b 55 08             	mov    0x8(%ebp),%edx
  c02ed9:	b8 00 00 00 00       	mov    $0x0,%eax
  c02ede:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c02ee3:	89 d7                	mov    %edx,%edi
  c02ee5:	fc                   	cld    
  c02ee6:	f2 ae                	repnz scas %es:(%edi),%al
  c02ee8:	f7 d1                	not    %ecx
  c02eea:	49                   	dec    %ecx
  c02eeb:	89 c8                	mov    %ecx,%eax
  c02eed:	5f                   	pop    %edi
  c02eee:	5d                   	pop    %ebp
  c02eef:	c3                   	ret    

00c02ef0 <exec>:
  c02ef0:	55                   	push   %ebp
  c02ef1:	89 e5                	mov    %esp,%ebp
  c02ef3:	57                   	push   %edi
  c02ef4:	56                   	push   %esi
  c02ef5:	53                   	push   %ebx
  c02ef6:	81 ec bc 00 00 00    	sub    $0xbc,%esp
  c02efc:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  c02f03:	c7 85 3b ff ff ff 2f 	movl   $0x6e69622f,-0xc5(%ebp)
  c02f0a:	62 69 6e 
  c02f0d:	c7 85 3f ff ff ff 2f 	movl   $0x2f,-0xc1(%ebp)
  c02f14:	00 00 00 
  c02f17:	8d 85 43 ff ff ff    	lea    -0xbd(%ebp),%eax
  c02f1d:	ba 75 00 00 00       	mov    $0x75,%edx
  c02f22:	be 00 00 00 00       	mov    $0x0,%esi
  c02f27:	89 30                	mov    %esi,(%eax)
  c02f29:	89 74 10 fc          	mov    %esi,-0x4(%eax,%edx,1)
  c02f2d:	8d 58 04             	lea    0x4(%eax),%ebx
  c02f30:	83 e3 fc             	and    $0xfffffffc,%ebx
  c02f33:	29 d8                	sub    %ebx,%eax
  c02f35:	01 c2                	add    %eax,%edx
  c02f37:	83 e2 fc             	and    $0xfffffffc,%edx
  c02f3a:	c1 ea 02             	shr    $0x2,%edx
  c02f3d:	89 df                	mov    %ebx,%edi
  c02f3f:	89 d1                	mov    %edx,%ecx
  c02f41:	89 f0                	mov    %esi,%eax
  c02f43:	f3 ab                	rep stos %eax,%es:(%edi)
  c02f45:	8b 45 08             	mov    0x8(%ebp),%eax
  c02f48:	0f b6 00             	movzbl (%eax),%eax
  c02f4b:	3c 2e                	cmp    $0x2e,%al
  c02f4d:	74 0a                	je     c02f59 <exec+0x69>
  c02f4f:	8b 45 08             	mov    0x8(%ebp),%eax
  c02f52:	0f b6 00             	movzbl (%eax),%eax
  c02f55:	3c 2f                	cmp    $0x2f,%al
  c02f57:	75 14                	jne    c02f6d <exec+0x7d>
  c02f59:	ff 75 08             	pushl  0x8(%ebp)
  c02f5c:	8d 85 3b ff ff ff    	lea    -0xc5(%ebp),%eax
  c02f62:	50                   	push   %eax
  c02f63:	e8 21 ff ff ff       	call   c02e89 <strcpy>
  c02f68:	83 c4 08             	add    $0x8,%esp
  c02f6b:	eb 12                	jmp    c02f7f <exec+0x8f>
  c02f6d:	ff 75 08             	pushl  0x8(%ebp)
  c02f70:	8d 85 3b ff ff ff    	lea    -0xc5(%ebp),%eax
  c02f76:	50                   	push   %eax
  c02f77:	e8 2a ff ff ff       	call   c02ea6 <strcat>
  c02f7c:	83 c4 08             	add    $0x8,%esp
  c02f7f:	83 ec 08             	sub    $0x8,%esp
  c02f82:	6a 00                	push   $0x0
  c02f84:	8d 85 3b ff ff ff    	lea    -0xc5(%ebp),%eax
  c02f8a:	50                   	push   %eax
  c02f8b:	e8 bf 01 00 00       	call   c0314f <open>
  c02f90:	83 c4 10             	add    $0x10,%esp
  c02f93:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c02f96:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
  c02f9a:	75 05                	jne    c02fa1 <exec+0xb1>
  c02f9c:	e9 eb 00 00 00       	jmp    c0308c <exec+0x19c>
  c02fa1:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c02fa4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  c02fa7:	b8 1f 00 00 00       	mov    $0x1f,%eax
  c02fac:	83 7d 0c 1f          	cmpl   $0x1f,0xc(%ebp)
  c02fb0:	0f 4e 45 0c          	cmovle 0xc(%ebp),%eax
  c02fb4:	89 45 d0             	mov    %eax,-0x30(%ebp)
  c02fb7:	b8 04 00 00 00       	mov    $0x4,%eax
  c02fbc:	bb 01 00 00 00       	mov    $0x1,%ebx
  c02fc1:	b9 00 00 00 00       	mov    $0x0,%ecx
  c02fc6:	ba 00 00 00 00       	mov    $0x0,%edx
  c02fcb:	be 00 00 00 00       	mov    $0x0,%esi
  c02fd0:	bf 00 00 00 00       	mov    $0x0,%edi
  c02fd5:	cd 80                	int    $0x80
  c02fd7:	89 45 cc             	mov    %eax,-0x34(%ebp)
  c02fda:	8b 45 cc             	mov    -0x34(%ebp),%eax
  c02fdd:	89 45 c8             	mov    %eax,-0x38(%ebp)
  c02fe0:	8b 45 c8             	mov    -0x38(%ebp),%eax
  c02fe3:	83 e8 80             	sub    $0xffffff80,%eax
  c02fe6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c02fe9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c02ff0:	eb 44                	jmp    c03036 <exec+0x146>
  c02ff2:	8b 45 c8             	mov    -0x38(%ebp),%eax
  c02ff5:	8b 55 dc             	mov    -0x24(%ebp),%edx
  c02ff8:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  c02ffb:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  c02ffe:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c03001:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c03008:	8b 45 10             	mov    0x10(%ebp),%eax
  c0300b:	01 d0                	add    %edx,%eax
  c0300d:	8b 00                	mov    (%eax),%eax
  c0300f:	83 ec 08             	sub    $0x8,%esp
  c03012:	50                   	push   %eax
  c03013:	ff 75 e0             	pushl  -0x20(%ebp)
  c03016:	e8 6e fe ff ff       	call   c02e89 <strcpy>
  c0301b:	83 c4 10             	add    $0x10,%esp
  c0301e:	83 ec 0c             	sub    $0xc,%esp
  c03021:	ff 75 e0             	pushl  -0x20(%ebp)
  c03024:	e8 a9 fe ff ff       	call   c02ed2 <strlen>
  c03029:	83 c4 10             	add    $0x10,%esp
  c0302c:	83 c0 01             	add    $0x1,%eax
  c0302f:	01 45 e0             	add    %eax,-0x20(%ebp)
  c03032:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
  c03036:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c03039:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  c0303c:	72 b4                	jb     c02ff2 <exec+0x102>
  c0303e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  c03041:	89 45 b8             	mov    %eax,-0x48(%ebp)
  c03044:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03047:	89 45 bc             	mov    %eax,-0x44(%ebp)
  c0304a:	8b 45 c8             	mov    -0x38(%ebp),%eax
  c0304d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  c03050:	83 ec 0c             	sub    $0xc,%esp
  c03053:	ff 75 c0             	pushl  -0x40(%ebp)
  c03056:	ff 75 bc             	pushl  -0x44(%ebp)
  c03059:	ff 75 b8             	pushl  -0x48(%ebp)
  c0305c:	6a 0b                	push   $0xb
  c0305e:	6a 03                	push   $0x3
  c03060:	e8 f7 fd ff ff       	call   c02e5c <_run>
  c03065:	83 c4 20             	add    $0x20,%esp
  c03068:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c0306b:	b8 04 00 00 00       	mov    $0x4,%eax
  c03070:	bb 00 00 00 00       	mov    $0x0,%ebx
  c03075:	8b 4d c8             	mov    -0x38(%ebp),%ecx
  c03078:	ba 00 00 00 00       	mov    $0x0,%edx
  c0307d:	be 00 00 00 00       	mov    $0x0,%esi
  c03082:	bf 00 00 00 00       	mov    $0x0,%edi
  c03087:	cd 80                	int    $0x80
  c03089:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  c0308c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c0308f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c03092:	5b                   	pop    %ebx
  c03093:	5e                   	pop    %esi
  c03094:	5f                   	pop    %edi
  c03095:	5d                   	pop    %ebp
  c03096:	c3                   	ret    

00c03097 <execvp>:
  c03097:	55                   	push   %ebp
  c03098:	89 e5                	mov    %esp,%ebp
  c0309a:	83 ec 18             	sub    $0x18,%esp
  c0309d:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  c030a4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c030ab:	eb 32                	jmp    c030df <execvp+0x48>
  c030ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c030b0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c030b7:	8b 45 0c             	mov    0xc(%ebp),%eax
  c030ba:	01 d0                	add    %edx,%eax
  c030bc:	8b 00                	mov    (%eax),%eax
  c030be:	85 c0                	test   %eax,%eax
  c030c0:	75 19                	jne    c030db <execvp+0x44>
  c030c2:	83 ec 04             	sub    $0x4,%esp
  c030c5:	ff 75 0c             	pushl  0xc(%ebp)
  c030c8:	ff 75 f0             	pushl  -0x10(%ebp)
  c030cb:	ff 75 08             	pushl  0x8(%ebp)
  c030ce:	e8 1d fe ff ff       	call   c02ef0 <exec>
  c030d3:	83 c4 10             	add    $0x10,%esp
  c030d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c030d9:	eb 0a                	jmp    c030e5 <execvp+0x4e>
  c030db:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  c030df:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  c030e3:	7e c8                	jle    c030ad <execvp+0x16>
  c030e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c030e8:	c9                   	leave  
  c030e9:	c3                   	ret    
  c030ea:	66 90                	xchg   %ax,%ax

00c030ec <_start>:
  c030ec:	23 25 f0 ff ff ff    	and    0xfffffff0,%esp
  c030f2:	50                   	push   %eax
  c030f3:	51                   	push   %ecx
  c030f4:	e8 df d6 ff ff       	call   c007d8 <main>
  c030f9:	83 c4 08             	add    $0x8,%esp
  c030fc:	50                   	push   %eax
  c030fd:	e8 3f 02 00 00       	call   c03341 <exit>
  c03102:	66 90                	xchg   %ax,%ax

00c03104 <_run>:
  c03104:	55                   	push   %ebp
  c03105:	89 e5                	mov    %esp,%ebp
  c03107:	57                   	push   %edi
  c03108:	56                   	push   %esi
  c03109:	53                   	push   %ebx
  c0310a:	83 ec 10             	sub    $0x10,%esp
  c0310d:	8b 55 10             	mov    0x10(%ebp),%edx
  c03110:	8b 75 18             	mov    0x18(%ebp),%esi
  c03113:	8b 7d 14             	mov    0x14(%ebp),%edi
  c03116:	b8 00 00 00 00       	mov    $0x0,%eax
  c0311b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c0311e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c03121:	cd 80                	int    $0x80
  c03123:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c03126:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c03129:	83 c4 10             	add    $0x10,%esp
  c0312c:	5b                   	pop    %ebx
  c0312d:	5e                   	pop    %esi
  c0312e:	5f                   	pop    %edi
  c0312f:	5d                   	pop    %ebp
  c03130:	c3                   	ret    

00c03131 <strlen>:
  c03131:	55                   	push   %ebp
  c03132:	89 e5                	mov    %esp,%ebp
  c03134:	57                   	push   %edi
  c03135:	8b 55 08             	mov    0x8(%ebp),%edx
  c03138:	b8 00 00 00 00       	mov    $0x0,%eax
  c0313d:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c03142:	89 d7                	mov    %edx,%edi
  c03144:	fc                   	cld    
  c03145:	f2 ae                	repnz scas %es:(%edi),%al
  c03147:	f7 d1                	not    %ecx
  c03149:	49                   	dec    %ecx
  c0314a:	89 c8                	mov    %ecx,%eax
  c0314c:	5f                   	pop    %edi
  c0314d:	5d                   	pop    %ebp
  c0314e:	c3                   	ret    

00c0314f <open>:
  c0314f:	55                   	push   %ebp
  c03150:	89 e5                	mov    %esp,%ebp
  c03152:	57                   	push   %edi
  c03153:	56                   	push   %esi
  c03154:	53                   	push   %ebx
  c03155:	83 ec 20             	sub    $0x20,%esp
  c03158:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c0315f:	ff 75 08             	pushl  0x8(%ebp)
  c03162:	e8 ca ff ff ff       	call   c03131 <strlen>
  c03167:	83 c4 04             	add    $0x4,%esp
  c0316a:	8d 50 01             	lea    0x1(%eax),%edx
  c0316d:	b8 04 00 00 00       	mov    $0x4,%eax
  c03172:	bb 01 00 00 00       	mov    $0x1,%ebx
  c03177:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c0317a:	be 00 00 00 00       	mov    $0x0,%esi
  c0317f:	bf 00 00 00 00       	mov    $0x0,%edi
  c03184:	cd 80                	int    $0x80
  c03186:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c03189:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c0318c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c0318f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  c03196:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c0319d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c031a4:	8b 45 0c             	mov    0xc(%ebp),%eax
  c031a7:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c031aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c031ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c031b0:	ff 75 e0             	pushl  -0x20(%ebp)
  c031b3:	ff 75 dc             	pushl  -0x24(%ebp)
  c031b6:	ff 75 d8             	pushl  -0x28(%ebp)
  c031b9:	6a 02                	push   $0x2
  c031bb:	6a 08                	push   $0x8
  c031bd:	e8 42 ff ff ff       	call   c03104 <_run>
  c031c2:	83 c4 14             	add    $0x14,%esp
  c031c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c031c8:	b8 04 00 00 00       	mov    $0x4,%eax
  c031cd:	bb 00 00 00 00       	mov    $0x0,%ebx
  c031d2:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  c031d5:	ba 00 00 00 00       	mov    $0x0,%edx
  c031da:	be 00 00 00 00       	mov    $0x0,%esi
  c031df:	bf 00 00 00 00       	mov    $0x0,%edi
  c031e4:	cd 80                	int    $0x80
  c031e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c031e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c031ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c031ef:	5b                   	pop    %ebx
  c031f0:	5e                   	pop    %esi
  c031f1:	5f                   	pop    %edi
  c031f2:	5d                   	pop    %ebp
  c031f3:	c3                   	ret    

00c031f4 <close>:
  c031f4:	55                   	push   %ebp
  c031f5:	89 e5                	mov    %esp,%ebp
  c031f7:	83 ec 10             	sub    $0x10,%esp
  c031fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c03201:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c03208:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c0320f:	ff 75 fc             	pushl  -0x4(%ebp)
  c03212:	ff 75 f8             	pushl  -0x8(%ebp)
  c03215:	ff 75 f4             	pushl  -0xc(%ebp)
  c03218:	6a 03                	push   $0x3
  c0321a:	ff 75 08             	pushl  0x8(%ebp)
  c0321d:	e8 e2 fe ff ff       	call   c03104 <_run>
  c03222:	83 c4 14             	add    $0x14,%esp
  c03225:	c9                   	leave  
  c03226:	c3                   	ret    
  c03227:	90                   	nop

00c03228 <_run>:
  c03228:	55                   	push   %ebp
  c03229:	89 e5                	mov    %esp,%ebp
  c0322b:	57                   	push   %edi
  c0322c:	56                   	push   %esi
  c0322d:	53                   	push   %ebx
  c0322e:	83 ec 10             	sub    $0x10,%esp
  c03231:	8b 55 10             	mov    0x10(%ebp),%edx
  c03234:	8b 75 18             	mov    0x18(%ebp),%esi
  c03237:	8b 7d 14             	mov    0x14(%ebp),%edi
  c0323a:	b8 00 00 00 00       	mov    $0x0,%eax
  c0323f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c03242:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c03245:	cd 80                	int    $0x80
  c03247:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c0324a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c0324d:	83 c4 10             	add    $0x10,%esp
  c03250:	5b                   	pop    %ebx
  c03251:	5e                   	pop    %esi
  c03252:	5f                   	pop    %edi
  c03253:	5d                   	pop    %ebp
  c03254:	c3                   	ret    

00c03255 <memcpy>:
  c03255:	55                   	push   %ebp
  c03256:	89 e5                	mov    %esp,%ebp
  c03258:	57                   	push   %edi
  c03259:	56                   	push   %esi
  c0325a:	53                   	push   %ebx
  c0325b:	8b 45 10             	mov    0x10(%ebp),%eax
  c0325e:	8b 55 0c             	mov    0xc(%ebp),%edx
  c03261:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c03264:	89 c1                	mov    %eax,%ecx
  c03266:	89 d6                	mov    %edx,%esi
  c03268:	89 df                	mov    %ebx,%edi
  c0326a:	fc                   	cld    
  c0326b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  c0326d:	8b 45 08             	mov    0x8(%ebp),%eax
  c03270:	5b                   	pop    %ebx
  c03271:	5e                   	pop    %esi
  c03272:	5f                   	pop    %edi
  c03273:	5d                   	pop    %ebp
  c03274:	c3                   	ret    

00c03275 <read>:
  c03275:	55                   	push   %ebp
  c03276:	89 e5                	mov    %esp,%ebp
  c03278:	57                   	push   %edi
  c03279:	56                   	push   %esi
  c0327a:	53                   	push   %ebx
  c0327b:	83 ec 20             	sub    $0x20,%esp
  c0327e:	b8 04 00 00 00       	mov    $0x4,%eax
  c03283:	bb 01 00 00 00       	mov    $0x1,%ebx
  c03288:	b9 00 00 00 00       	mov    $0x0,%ecx
  c0328d:	8b 55 10             	mov    0x10(%ebp),%edx
  c03290:	be 00 00 00 00       	mov    $0x0,%esi
  c03295:	bf 00 00 00 00       	mov    $0x0,%edi
  c0329a:	cd 80                	int    $0x80
  c0329c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c0329f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c032a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c032a5:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  c032ac:	8b 45 10             	mov    0x10(%ebp),%eax
  c032af:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c032b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c032b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c032b8:	ff 75 e0             	pushl  -0x20(%ebp)
  c032bb:	ff 75 dc             	pushl  -0x24(%ebp)
  c032be:	ff 75 d8             	pushl  -0x28(%ebp)
  c032c1:	6a 00                	push   $0x0
  c032c3:	ff 75 08             	pushl  0x8(%ebp)
  c032c6:	e8 5d ff ff ff       	call   c03228 <_run>
  c032cb:	83 c4 14             	add    $0x14,%esp
  c032ce:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c032d1:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%ebp)
  c032d5:	74 11                	je     c032e8 <read+0x73>
  c032d7:	ff 75 e8             	pushl  -0x18(%ebp)
  c032da:	ff 75 ec             	pushl  -0x14(%ebp)
  c032dd:	ff 75 0c             	pushl  0xc(%ebp)
  c032e0:	e8 70 ff ff ff       	call   c03255 <memcpy>
  c032e5:	83 c4 0c             	add    $0xc,%esp
  c032e8:	b8 04 00 00 00       	mov    $0x4,%eax
  c032ed:	bb 00 00 00 00       	mov    $0x0,%ebx
  c032f2:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  c032f5:	ba 00 00 00 00       	mov    $0x0,%edx
  c032fa:	be 00 00 00 00       	mov    $0x0,%esi
  c032ff:	bf 00 00 00 00       	mov    $0x0,%edi
  c03304:	cd 80                	int    $0x80
  c03306:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c03309:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c0330c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c0330f:	5b                   	pop    %ebx
  c03310:	5e                   	pop    %esi
  c03311:	5f                   	pop    %edi
  c03312:	5d                   	pop    %ebp
  c03313:	c3                   	ret    

00c03314 <_run>:
  c03314:	55                   	push   %ebp
  c03315:	89 e5                	mov    %esp,%ebp
  c03317:	57                   	push   %edi
  c03318:	56                   	push   %esi
  c03319:	53                   	push   %ebx
  c0331a:	83 ec 10             	sub    $0x10,%esp
  c0331d:	8b 55 10             	mov    0x10(%ebp),%edx
  c03320:	8b 75 18             	mov    0x18(%ebp),%esi
  c03323:	8b 7d 14             	mov    0x14(%ebp),%edi
  c03326:	b8 00 00 00 00       	mov    $0x0,%eax
  c0332b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c0332e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c03331:	cd 80                	int    $0x80
  c03333:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c03336:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c03339:	83 c4 10             	add    $0x10,%esp
  c0333c:	5b                   	pop    %ebx
  c0333d:	5e                   	pop    %esi
  c0333e:	5f                   	pop    %edi
  c0333f:	5d                   	pop    %ebp
  c03340:	c3                   	ret    

00c03341 <exit>:
  c03341:	55                   	push   %ebp
  c03342:	89 e5                	mov    %esp,%ebp
  c03344:	83 ec 10             	sub    $0x10,%esp
  c03347:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c0334e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c03355:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c0335c:	8b 45 08             	mov    0x8(%ebp),%eax
  c0335f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c03362:	ff 75 fc             	pushl  -0x4(%ebp)
  c03365:	ff 75 f8             	pushl  -0x8(%ebp)
  c03368:	ff 75 f4             	pushl  -0xc(%ebp)
  c0336b:	6a 03                	push   $0x3
  c0336d:	6a 03                	push   $0x3
  c0336f:	e8 a0 ff ff ff       	call   c03314 <_run>
  c03374:	83 c4 14             	add    $0x14,%esp
  c03377:	c9                   	leave  
  c03378:	c3                   	ret    
  c03379:	66 90                	xchg   %ax,%ax
  c0337b:	90                   	nop

00c0337c <memset>:
  c0337c:	55                   	push   %ebp
  c0337d:	89 e5                	mov    %esp,%ebp
  c0337f:	57                   	push   %edi
  c03380:	83 ec 04             	sub    $0x4,%esp
  c03383:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03386:	88 45 f8             	mov    %al,-0x8(%ebp)
  c03389:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  c0338d:	8b 55 08             	mov    0x8(%ebp),%edx
  c03390:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c03393:	89 d7                	mov    %edx,%edi
  c03395:	fc                   	cld    
  c03396:	f3 aa                	rep stos %al,%es:(%edi)
  c03398:	8b 45 08             	mov    0x8(%ebp),%eax
  c0339b:	83 c4 04             	add    $0x4,%esp
  c0339e:	5f                   	pop    %edi
  c0339f:	5d                   	pop    %ebp
  c033a0:	c3                   	ret    

00c033a1 <delMObject>:
  c033a1:	55                   	push   %ebp
  c033a2:	89 e5                	mov    %esp,%ebp
  c033a4:	56                   	push   %esi
  c033a5:	53                   	push   %ebx
  c033a6:	83 ec 10             	sub    $0x10,%esp
  c033a9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c033ad:	75 17                	jne    c033c6 <delMObject+0x25>
  c033af:	83 ec 0c             	sub    $0xc,%esp
  c033b2:	68 50 4f c0 00       	push   $0xc04f50
  c033b7:	e8 b4 06 00 00       	call   c03a70 <printf>
  c033bc:	83 c4 10             	add    $0x10,%esp
  c033bf:	b8 00 00 00 00       	mov    $0x0,%eax
  c033c4:	eb 72                	jmp    c03438 <delMObject+0x97>
  c033c6:	8b 45 08             	mov    0x8(%ebp),%eax
  c033c9:	8b 40 0c             	mov    0xc(%eax),%eax
  c033cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c033cf:	8b 45 08             	mov    0x8(%ebp),%eax
  c033d2:	8b 40 10             	mov    0x10(%eax),%eax
  c033d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c033d8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  c033dc:	74 0b                	je     c033e9 <delMObject+0x48>
  c033de:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c033e1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  c033e4:	89 50 0c             	mov    %edx,0xc(%eax)
  c033e7:	eb 33                	jmp    c0341c <delMObject+0x7b>
  c033e9:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c033ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c033f5:	eb 04                	jmp    c033fb <delMObject+0x5a>
  c033f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  c033fb:	8b 55 08             	mov    0x8(%ebp),%edx
  c033fe:	8b 5a 08             	mov    0x8(%edx),%ebx
  c03401:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c03404:	be 01 00 00 00       	mov    $0x1,%esi
  c03409:	89 d1                	mov    %edx,%ecx
  c0340b:	d3 e6                	shl    %cl,%esi
  c0340d:	89 f2                	mov    %esi,%edx
  c0340f:	39 d3                	cmp    %edx,%ebx
  c03411:	77 e4                	ja     c033f7 <delMObject+0x56>
  c03413:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c03416:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  c03419:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  c0341c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  c03420:	74 09                	je     c0342b <delMObject+0x8a>
  c03422:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c03425:	8b 55 ec             	mov    -0x14(%ebp),%edx
  c03428:	89 50 10             	mov    %edx,0x10(%eax)
  c0342b:	8b 45 08             	mov    0x8(%ebp),%eax
  c0342e:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
  c03435:	8b 45 08             	mov    0x8(%ebp),%eax
  c03438:	8d 65 f8             	lea    -0x8(%ebp),%esp
  c0343b:	5b                   	pop    %ebx
  c0343c:	5e                   	pop    %esi
  c0343d:	5d                   	pop    %ebp
  c0343e:	c3                   	ret    

00c0343f <insertMObject>:
  c0343f:	55                   	push   %ebp
  c03440:	89 e5                	mov    %esp,%ebp
  c03442:	83 ec 08             	sub    $0x8,%esp
  c03445:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c03449:	75 17                	jne    c03462 <insertMObject+0x23>
  c0344b:	83 ec 0c             	sub    $0xc,%esp
  c0344e:	68 80 4f c0 00       	push   $0xc04f80
  c03453:	e8 18 06 00 00       	call   c03a70 <printf>
  c03458:	83 c4 10             	add    $0x10,%esp
  c0345b:	b8 00 00 00 00       	mov    $0x0,%eax
  c03460:	eb 2f                	jmp    c03491 <insertMObject+0x52>
  c03462:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03465:	8b 55 08             	mov    0x8(%ebp),%edx
  c03468:	89 50 0c             	mov    %edx,0xc(%eax)
  c0346b:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0346e:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  c03475:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03478:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  c0347f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c03483:	74 09                	je     c0348e <insertMObject+0x4f>
  c03485:	8b 45 08             	mov    0x8(%ebp),%eax
  c03488:	8b 55 0c             	mov    0xc(%ebp),%edx
  c0348b:	89 50 10             	mov    %edx,0x10(%eax)
  c0348e:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03491:	c9                   	leave  
  c03492:	c3                   	ret    

00c03493 <splitMObject>:
  c03493:	55                   	push   %ebp
  c03494:	89 e5                	mov    %esp,%ebp
  c03496:	53                   	push   %ebx
  c03497:	83 ec 14             	sub    $0x14,%esp
  c0349a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c0349e:	75 1a                	jne    c034ba <splitMObject+0x27>
  c034a0:	83 ec 0c             	sub    $0xc,%esp
  c034a3:	68 b0 4f c0 00       	push   $0xc04fb0
  c034a8:	e8 c3 05 00 00       	call   c03a70 <printf>
  c034ad:	83 c4 10             	add    $0x10,%esp
  c034b0:	b8 00 00 00 00       	mov    $0x0,%eax
  c034b5:	e9 dd 00 00 00       	jmp    c03597 <splitMObject+0x104>
  c034ba:	8b 45 08             	mov    0x8(%ebp),%eax
  c034bd:	8b 40 08             	mov    0x8(%eax),%eax
  c034c0:	d1 e8                	shr    %eax
  c034c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c034c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c034cc:	eb 04                	jmp    c034d2 <splitMObject+0x3f>
  c034ce:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  c034d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c034d5:	ba 01 00 00 00       	mov    $0x1,%edx
  c034da:	89 c1                	mov    %eax,%ecx
  c034dc:	d3 e2                	shl    %cl,%edx
  c034de:	89 d0                	mov    %edx,%eax
  c034e0:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  c034e3:	72 e9                	jb     c034ce <splitMObject+0x3b>
  c034e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c034e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c034eb:	8b 55 08             	mov    0x8(%ebp),%edx
  c034ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c034f1:	01 d0                	add    %edx,%eax
  c034f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c034f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c034f9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  c034ff:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  c03506:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  c0350d:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  c03514:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  c0351b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c0351e:	8b 55 08             	mov    0x8(%ebp),%edx
  c03521:	89 10                	mov    %edx,(%eax)
  c03523:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c03526:	8b 55 f0             	mov    -0x10(%ebp),%edx
  c03529:	89 50 08             	mov    %edx,0x8(%eax)
  c0352c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c0352f:	8b 50 08             	mov    0x8(%eax),%edx
  c03532:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c03535:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  c03538:	8b 15 a8 55 c2 00    	mov    0xc255a8,%edx
  c0353e:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c03543:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
  c03549:	83 e8 80             	sub    $0xffffff80,%eax
  c0354c:	01 d0                	add    %edx,%eax
  c0354e:	83 c0 04             	add    $0x4,%eax
  c03551:	39 c1                	cmp    %eax,%ecx
  c03553:	73 10                	jae    c03565 <splitMObject+0xd2>
  c03555:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c03558:	8b 50 08             	mov    0x8(%eax),%edx
  c0355b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c0355e:	01 c2                	add    %eax,%edx
  c03560:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c03563:	89 02                	mov    %eax,(%edx)
  c03565:	8b 1d a8 55 c2 00    	mov    0xc255a8,%ebx
  c0356b:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c03570:	8b 55 ec             	mov    -0x14(%ebp),%edx
  c03573:	8b 04 90             	mov    (%eax,%edx,4),%eax
  c03576:	83 ec 08             	sub    $0x8,%esp
  c03579:	ff 75 e8             	pushl  -0x18(%ebp)
  c0357c:	50                   	push   %eax
  c0357d:	e8 bd fe ff ff       	call   c0343f <insertMObject>
  c03582:	83 c4 10             	add    $0x10,%esp
  c03585:	8b 55 ec             	mov    -0x14(%ebp),%edx
  c03588:	89 04 93             	mov    %eax,(%ebx,%edx,4)
  c0358b:	8b 45 08             	mov    0x8(%ebp),%eax
  c0358e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  c03591:	89 50 08             	mov    %edx,0x8(%eax)
  c03594:	8b 45 08             	mov    0x8(%ebp),%eax
  c03597:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c0359a:	c9                   	leave  
  c0359b:	c3                   	ret    

00c0359c <mergerMObject>:
  c0359c:	55                   	push   %ebp
  c0359d:	89 e5                	mov    %esp,%ebp
  c0359f:	83 ec 08             	sub    $0x8,%esp
  c035a2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c035a6:	74 06                	je     c035ae <mergerMObject+0x12>
  c035a8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c035ac:	75 12                	jne    c035c0 <mergerMObject+0x24>
  c035ae:	83 ec 0c             	sub    $0xc,%esp
  c035b1:	68 dc 4f c0 00       	push   $0xc04fdc
  c035b6:	e8 b5 04 00 00       	call   c03a70 <printf>
  c035bb:	83 c4 10             	add    $0x10,%esp
  c035be:	eb fe                	jmp    c035be <mergerMObject+0x22>
  c035c0:	8b 45 08             	mov    0x8(%ebp),%eax
  c035c3:	8b 50 08             	mov    0x8(%eax),%edx
  c035c6:	8b 45 08             	mov    0x8(%ebp),%eax
  c035c9:	01 d0                	add    %edx,%eax
  c035cb:	3b 45 0c             	cmp    0xc(%ebp),%eax
  c035ce:	74 26                	je     c035f6 <mergerMObject+0x5a>
  c035d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  c035d3:	8b 50 08             	mov    0x8(%eax),%edx
  c035d6:	8b 45 08             	mov    0x8(%ebp),%eax
  c035d9:	8b 40 08             	mov    0x8(%eax),%eax
  c035dc:	83 ec 0c             	sub    $0xc,%esp
  c035df:	52                   	push   %edx
  c035e0:	ff 75 0c             	pushl  0xc(%ebp)
  c035e3:	50                   	push   %eax
  c035e4:	ff 75 08             	pushl  0x8(%ebp)
  c035e7:	68 08 50 c0 00       	push   $0xc05008
  c035ec:	e8 7f 04 00 00       	call   c03a70 <printf>
  c035f1:	83 c4 20             	add    $0x20,%esp
  c035f4:	eb fe                	jmp    c035f4 <mergerMObject+0x58>
  c035f6:	8b 45 08             	mov    0x8(%ebp),%eax
  c035f9:	8b 50 08             	mov    0x8(%eax),%edx
  c035fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  c035ff:	8b 40 08             	mov    0x8(%eax),%eax
  c03602:	39 c2                	cmp    %eax,%edx
  c03604:	75 48                	jne    c0364e <mergerMObject+0xb2>
  c03606:	8b 45 08             	mov    0x8(%ebp),%eax
  c03609:	8b 40 08             	mov    0x8(%eax),%eax
  c0360c:	8d 14 00             	lea    (%eax,%eax,1),%edx
  c0360f:	8b 45 08             	mov    0x8(%ebp),%eax
  c03612:	89 50 08             	mov    %edx,0x8(%eax)
  c03615:	8b 45 08             	mov    0x8(%ebp),%eax
  c03618:	8b 50 08             	mov    0x8(%eax),%edx
  c0361b:	8b 45 08             	mov    0x8(%ebp),%eax
  c0361e:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  c03621:	8b 15 a8 55 c2 00    	mov    0xc255a8,%edx
  c03627:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c0362c:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
  c03632:	83 e8 80             	sub    $0xffffff80,%eax
  c03635:	01 d0                	add    %edx,%eax
  c03637:	83 c0 04             	add    $0x4,%eax
  c0363a:	39 c1                	cmp    %eax,%ecx
  c0363c:	73 10                	jae    c0364e <mergerMObject+0xb2>
  c0363e:	8b 45 08             	mov    0x8(%ebp),%eax
  c03641:	8b 50 08             	mov    0x8(%eax),%edx
  c03644:	8b 45 08             	mov    0x8(%ebp),%eax
  c03647:	01 c2                	add    %eax,%edx
  c03649:	8b 45 08             	mov    0x8(%ebp),%eax
  c0364c:	89 02                	mov    %eax,(%edx)
  c0364e:	8b 45 08             	mov    0x8(%ebp),%eax
  c03651:	c9                   	leave  
  c03652:	c3                   	ret    

00c03653 <getMObject>:
  c03653:	55                   	push   %ebp
  c03654:	89 e5                	mov    %esp,%ebp
  c03656:	83 ec 18             	sub    $0x18,%esp
  c03659:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  c0365d:	7f 06                	jg     c03665 <getMObject+0x12>
  c0365f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c03663:	79 07                	jns    c0366c <getMObject+0x19>
  c03665:	b8 00 00 00 00       	mov    $0x0,%eax
  c0366a:	eb 5a                	jmp    c036c6 <getMObject+0x73>
  c0366c:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c03671:	8b 55 08             	mov    0x8(%ebp),%edx
  c03674:	8b 04 90             	mov    (%eax,%edx,4),%eax
  c03677:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c0367a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c0367e:	74 16                	je     c03696 <getMObject+0x43>
  c03680:	83 ec 0c             	sub    $0xc,%esp
  c03683:	ff 75 f4             	pushl  -0xc(%ebp)
  c03686:	e8 16 fd ff ff       	call   c033a1 <delMObject>
  c0368b:	83 c4 10             	add    $0x10,%esp
  c0368e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c03691:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c03694:	eb 30                	jmp    c036c6 <getMObject+0x73>
  c03696:	8b 45 08             	mov    0x8(%ebp),%eax
  c03699:	83 c0 01             	add    $0x1,%eax
  c0369c:	83 ec 0c             	sub    $0xc,%esp
  c0369f:	50                   	push   %eax
  c036a0:	e8 ae ff ff ff       	call   c03653 <getMObject>
  c036a5:	83 c4 10             	add    $0x10,%esp
  c036a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c036ab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c036af:	75 07                	jne    c036b8 <getMObject+0x65>
  c036b1:	b8 00 00 00 00       	mov    $0x0,%eax
  c036b6:	eb 0e                	jmp    c036c6 <getMObject+0x73>
  c036b8:	83 ec 0c             	sub    $0xc,%esp
  c036bb:	ff 75 f4             	pushl  -0xc(%ebp)
  c036be:	e8 d0 fd ff ff       	call   c03493 <splitMObject>
  c036c3:	83 c4 10             	add    $0x10,%esp
  c036c6:	c9                   	leave  
  c036c7:	c3                   	ret    

00c036c8 <realizeMHeap>:
  c036c8:	55                   	push   %ebp
  c036c9:	89 e5                	mov    %esp,%ebp
  c036cb:	53                   	push   %ebx
  c036cc:	83 ec 14             	sub    $0x14,%esp
  c036cf:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c036d4:	85 c0                	test   %eax,%eax
  c036d6:	74 25                	je     c036fd <realizeMHeap+0x35>
  c036d8:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c036dd:	83 ec 04             	sub    $0x4,%esp
  c036e0:	68 a8 55 c2 00       	push   $0xc255a8
  c036e5:	50                   	push   %eax
  c036e6:	68 68 50 c0 00       	push   $0xc05068
  c036eb:	e8 80 03 00 00       	call   c03a70 <printf>
  c036f0:	83 c4 10             	add    $0x10,%esp
  c036f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  c036f8:	e9 27 01 00 00       	jmp    c03824 <realizeMHeap+0x15c>
  c036fd:	81 45 08 84 00 00 00 	addl   $0x84,0x8(%ebp)
  c03704:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c0370b:	eb 04                	jmp    c03711 <realizeMHeap+0x49>
  c0370d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  c03711:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c03714:	ba 01 00 00 00       	mov    $0x1,%edx
  c03719:	89 c1                	mov    %eax,%ecx
  c0371b:	d3 e2                	shl    %cl,%edx
  c0371d:	89 d0                	mov    %edx,%eax
  c0371f:	3b 45 08             	cmp    0x8(%ebp),%eax
  c03722:	72 e9                	jb     c0370d <realizeMHeap+0x45>
  c03724:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c03727:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c0372a:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  c0372e:	7f 06                	jg     c03736 <realizeMHeap+0x6e>
  c03730:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  c03734:	79 22                	jns    c03758 <realizeMHeap+0x90>
  c03736:	83 ec 04             	sub    $0x4,%esp
  c03739:	ff 75 08             	pushl  0x8(%ebp)
  c0373c:	68 7c ff ff 7f       	push   $0x7fffff7c
  c03741:	68 a8 50 c0 00       	push   $0xc050a8
  c03746:	e8 25 03 00 00       	call   c03a70 <printf>
  c0374b:	83 c4 10             	add    $0x10,%esp
  c0374e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  c03753:	e9 cc 00 00 00       	jmp    c03824 <realizeMHeap+0x15c>
  c03758:	c7 05 a8 55 c2 00 e0 	movl   $0xc259e0,0xc255a8
  c0375f:	59 c2 00 
  c03762:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c03767:	85 c0                	test   %eax,%eax
  c03769:	75 1a                	jne    c03785 <realizeMHeap+0xbd>
  c0376b:	83 ec 0c             	sub    $0xc,%esp
  c0376e:	68 e4 50 c0 00       	push   $0xc050e4
  c03773:	e8 f8 02 00 00       	call   c03a70 <printf>
  c03778:	83 c4 10             	add    $0x10,%esp
  c0377b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  c03780:	e9 9f 00 00 00       	jmp    c03824 <realizeMHeap+0x15c>
  c03785:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c03788:	ba 01 00 00 00       	mov    $0x1,%edx
  c0378d:	89 c1                	mov    %eax,%ecx
  c0378f:	d3 e2                	shl    %cl,%edx
  c03791:	89 d0                	mov    %edx,%eax
  c03793:	05 84 00 00 00       	add    $0x84,%eax
  c03798:	89 c2                	mov    %eax,%edx
  c0379a:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c0379f:	83 ec 04             	sub    $0x4,%esp
  c037a2:	52                   	push   %edx
  c037a3:	6a 00                	push   $0x0
  c037a5:	50                   	push   %eax
  c037a6:	e8 d1 fb ff ff       	call   c0337c <memset>
  c037ab:	83 c4 10             	add    $0x10,%esp
  c037ae:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c037b3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  c037b6:	bb 01 00 00 00       	mov    $0x1,%ebx
  c037bb:	89 d1                	mov    %edx,%ecx
  c037bd:	d3 e3                	shl    %cl,%ebx
  c037bf:	89 da                	mov    %ebx,%edx
  c037c1:	89 90 80 00 00 00    	mov    %edx,0x80(%eax)
  c037c7:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c037cc:	05 84 00 00 00       	add    $0x84,%eax
  c037d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c037d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c037d7:	ba 01 00 00 00       	mov    $0x1,%edx
  c037dc:	89 c1                	mov    %eax,%ecx
  c037de:	d3 e2                	shl    %cl,%edx
  c037e0:	89 d0                	mov    %edx,%eax
  c037e2:	89 c2                	mov    %eax,%edx
  c037e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c037e7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  c037ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c037f0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  c037f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c037fa:	89 50 08             	mov    %edx,0x8(%eax)
  c037fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c03800:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  c03807:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c0380a:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  c03811:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c03816:	8b 55 f0             	mov    -0x10(%ebp),%edx
  c03819:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  c0381c:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  c0381f:	b8 00 00 00 00       	mov    $0x0,%eax
  c03824:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c03827:	c9                   	leave  
  c03828:	c3                   	ret    

00c03829 <domalloc>:
  c03829:	55                   	push   %ebp
  c0382a:	89 e5                	mov    %esp,%ebp
  c0382c:	83 ec 18             	sub    $0x18,%esp
  c0382f:	83 45 08 0c          	addl   $0xc,0x8(%ebp)
  c03833:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c0383a:	eb 04                	jmp    c03840 <domalloc+0x17>
  c0383c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  c03840:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c03843:	ba 01 00 00 00       	mov    $0x1,%edx
  c03848:	89 c1                	mov    %eax,%ecx
  c0384a:	d3 e2                	shl    %cl,%edx
  c0384c:	89 d0                	mov    %edx,%eax
  c0384e:	3b 45 08             	cmp    0x8(%ebp),%eax
  c03851:	72 e9                	jb     c0383c <domalloc+0x13>
  c03853:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c03856:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c03859:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  c0385d:	7f 06                	jg     c03865 <domalloc+0x3c>
  c0385f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  c03863:	79 1f                	jns    c03884 <domalloc+0x5b>
  c03865:	83 ec 04             	sub    $0x4,%esp
  c03868:	ff 75 08             	pushl  0x8(%ebp)
  c0386b:	68 68 ff ff 7f       	push   $0x7fffff68
  c03870:	68 18 51 c0 00       	push   $0xc05118
  c03875:	e8 f6 01 00 00       	call   c03a70 <printf>
  c0387a:	83 c4 10             	add    $0x10,%esp
  c0387d:	b8 00 00 00 00       	mov    $0x0,%eax
  c03882:	eb 24                	jmp    c038a8 <domalloc+0x7f>
  c03884:	83 ec 0c             	sub    $0xc,%esp
  c03887:	ff 75 f0             	pushl  -0x10(%ebp)
  c0388a:	e8 c4 fd ff ff       	call   c03653 <getMObject>
  c0388f:	83 c4 10             	add    $0x10,%esp
  c03892:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c03895:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  c03899:	74 08                	je     c038a3 <domalloc+0x7a>
  c0389b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c0389e:	83 c0 0c             	add    $0xc,%eax
  c038a1:	eb 05                	jmp    c038a8 <domalloc+0x7f>
  c038a3:	b8 00 00 00 00       	mov    $0x0,%eax
  c038a8:	c9                   	leave  
  c038a9:	c3                   	ret    

00c038aa <free>:
  c038aa:	55                   	push   %ebp
  c038ab:	89 e5                	mov    %esp,%ebp
  c038ad:	53                   	push   %ebx
  c038ae:	83 ec 24             	sub    $0x24,%esp
  c038b1:	8b 45 08             	mov    0x8(%ebp),%eax
  c038b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c038b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c038ba:	83 e8 0c             	sub    $0xc,%eax
  c038bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c038c0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  c038c4:	74 2d                	je     c038f3 <free+0x49>
  c038c6:	8b 15 a8 55 c2 00    	mov    0xc255a8,%edx
  c038cc:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c038d1:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
  c038d7:	83 e8 80             	sub    $0xffffff80,%eax
  c038da:	01 d0                	add    %edx,%eax
  c038dc:	83 c0 04             	add    $0x4,%eax
  c038df:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  c038e2:	72 0f                	jb     c038f3 <free+0x49>
  c038e4:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c038e9:	05 84 00 00 00       	add    $0x84,%eax
  c038ee:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  c038f1:	76 18                	jbe    c0390b <free+0x61>
  c038f3:	83 ec 08             	sub    $0x8,%esp
  c038f6:	ff 75 08             	pushl  0x8(%ebp)
  c038f9:	68 50 51 c0 00       	push   $0xc05150
  c038fe:	e8 6d 01 00 00       	call   c03a70 <printf>
  c03903:	83 c4 10             	add    $0x10,%esp
  c03906:	e9 f7 00 00 00       	jmp    c03a02 <free+0x158>
  c0390b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c0390e:	8b 00                	mov    (%eax),%eax
  c03910:	85 c0                	test   %eax,%eax
  c03912:	74 37                	je     c0394b <free+0xa1>
  c03914:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c03917:	8b 00                	mov    (%eax),%eax
  c03919:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c0391c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c0391f:	8b 40 04             	mov    0x4(%eax),%eax
  c03922:	85 c0                	test   %eax,%eax
  c03924:	75 25                	jne    c0394b <free+0xa1>
  c03926:	83 ec 0c             	sub    $0xc,%esp
  c03929:	ff 75 e8             	pushl  -0x18(%ebp)
  c0392c:	e8 70 fa ff ff       	call   c033a1 <delMObject>
  c03931:	83 c4 10             	add    $0x10,%esp
  c03934:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c03937:	83 ec 08             	sub    $0x8,%esp
  c0393a:	ff 75 f4             	pushl  -0xc(%ebp)
  c0393d:	ff 75 e8             	pushl  -0x18(%ebp)
  c03940:	e8 57 fc ff ff       	call   c0359c <mergerMObject>
  c03945:	83 c4 10             	add    $0x10,%esp
  c03948:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c0394b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c0394e:	8b 50 08             	mov    0x8(%eax),%edx
  c03951:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c03954:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  c03957:	8b 15 a8 55 c2 00    	mov    0xc255a8,%edx
  c0395d:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c03962:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
  c03968:	83 e8 80             	sub    $0xffffff80,%eax
  c0396b:	01 d0                	add    %edx,%eax
  c0396d:	83 c0 04             	add    $0x4,%eax
  c03970:	39 c1                	cmp    %eax,%ecx
  c03972:	73 3d                	jae    c039b1 <free+0x107>
  c03974:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c03977:	8b 50 08             	mov    0x8(%eax),%edx
  c0397a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c0397d:	01 d0                	add    %edx,%eax
  c0397f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c03982:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c03985:	8b 40 04             	mov    0x4(%eax),%eax
  c03988:	85 c0                	test   %eax,%eax
  c0398a:	75 25                	jne    c039b1 <free+0x107>
  c0398c:	83 ec 0c             	sub    $0xc,%esp
  c0398f:	ff 75 e4             	pushl  -0x1c(%ebp)
  c03992:	e8 0a fa ff ff       	call   c033a1 <delMObject>
  c03997:	83 c4 10             	add    $0x10,%esp
  c0399a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c0399d:	83 ec 08             	sub    $0x8,%esp
  c039a0:	ff 75 e4             	pushl  -0x1c(%ebp)
  c039a3:	ff 75 f4             	pushl  -0xc(%ebp)
  c039a6:	e8 f1 fb ff ff       	call   c0359c <mergerMObject>
  c039ab:	83 c4 10             	add    $0x10,%esp
  c039ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c039b1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  c039b8:	eb 04                	jmp    c039be <free+0x114>
  c039ba:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  c039be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c039c1:	8b 50 08             	mov    0x8(%eax),%edx
  c039c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c039c7:	bb 01 00 00 00       	mov    $0x1,%ebx
  c039cc:	89 c1                	mov    %eax,%ecx
  c039ce:	d3 e3                	shl    %cl,%ebx
  c039d0:	89 d8                	mov    %ebx,%eax
  c039d2:	39 c2                	cmp    %eax,%edx
  c039d4:	77 e4                	ja     c039ba <free+0x110>
  c039d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c039d9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c039dc:	8b 1d a8 55 c2 00    	mov    0xc255a8,%ebx
  c039e2:	a1 a8 55 c2 00       	mov    0xc255a8,%eax
  c039e7:	8b 55 e0             	mov    -0x20(%ebp),%edx
  c039ea:	8b 04 90             	mov    (%eax,%edx,4),%eax
  c039ed:	83 ec 08             	sub    $0x8,%esp
  c039f0:	ff 75 f4             	pushl  -0xc(%ebp)
  c039f3:	50                   	push   %eax
  c039f4:	e8 46 fa ff ff       	call   c0343f <insertMObject>
  c039f9:	83 c4 10             	add    $0x10,%esp
  c039fc:	8b 55 e0             	mov    -0x20(%ebp),%edx
  c039ff:	89 04 93             	mov    %eax,(%ebx,%edx,4)
  c03a02:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c03a05:	c9                   	leave  
  c03a06:	c3                   	ret    

00c03a07 <realize>:
  c03a07:	55                   	push   %ebp
  c03a08:	89 e5                	mov    %esp,%ebp
  c03a0a:	83 ec 18             	sub    $0x18,%esp
  c03a0d:	83 ec 0c             	sub    $0xc,%esp
  c03a10:	68 00 00 40 00       	push   $0x400000
  c03a15:	e8 ae fc ff ff       	call   c036c8 <realizeMHeap>
  c03a1a:	83 c4 10             	add    $0x10,%esp
  c03a1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c03a20:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  c03a24:	75 17                	jne    c03a3d <realize+0x36>
  c03a26:	83 ec 0c             	sub    $0xc,%esp
  c03a29:	68 80 51 c0 00       	push   $0xc05180
  c03a2e:	e8 3d 00 00 00       	call   c03a70 <printf>
  c03a33:	83 c4 10             	add    $0x10,%esp
  c03a36:	b8 00 00 00 00       	mov    $0x0,%eax
  c03a3b:	eb 18                	jmp    c03a55 <realize+0x4e>
  c03a3d:	c7 05 10 80 c0 00 29 	movl   $0xc03829,0xc08010
  c03a44:	38 c0 00 
  c03a47:	83 ec 0c             	sub    $0xc,%esp
  c03a4a:	ff 75 08             	pushl  0x8(%ebp)
  c03a4d:	e8 d7 fd ff ff       	call   c03829 <domalloc>
  c03a52:	83 c4 10             	add    $0x10,%esp
  c03a55:	c9                   	leave  
  c03a56:	c3                   	ret    

00c03a57 <malloc>:
  c03a57:	55                   	push   %ebp
  c03a58:	89 e5                	mov    %esp,%ebp
  c03a5a:	83 ec 08             	sub    $0x8,%esp
  c03a5d:	a1 10 80 c0 00       	mov    0xc08010,%eax
  c03a62:	83 ec 0c             	sub    $0xc,%esp
  c03a65:	ff 75 08             	pushl  0x8(%ebp)
  c03a68:	ff d0                	call   *%eax
  c03a6a:	83 c4 10             	add    $0x10,%esp
  c03a6d:	c9                   	leave  
  c03a6e:	c3                   	ret    
  c03a6f:	90                   	nop

00c03a70 <printf>:
  c03a70:	55                   	push   %ebp
  c03a71:	89 e5                	mov    %esp,%ebp
  c03a73:	83 ec 18             	sub    $0x18,%esp
  c03a76:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c03a7d:	8d 45 0c             	lea    0xc(%ebp),%eax
  c03a80:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c03a83:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c03a86:	83 ec 04             	sub    $0x4,%esp
  c03a89:	50                   	push   %eax
  c03a8a:	ff 75 08             	pushl  0x8(%ebp)
  c03a8d:	68 c0 55 c2 00       	push   $0xc255c0
  c03a92:	e8 28 04 00 00       	call   c03ebf <vsprintf>
  c03a97:	83 c4 10             	add    $0x10,%esp
  c03a9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c03a9d:	83 ec 04             	sub    $0x4,%esp
  c03aa0:	ff 75 f4             	pushl  -0xc(%ebp)
  c03aa3:	68 c0 55 c2 00       	push   $0xc255c0
  c03aa8:	6a 01                	push   $0x1
  c03aaa:	e8 2a 07 00 00       	call   c041d9 <write>
  c03aaf:	83 c4 10             	add    $0x10,%esp
  c03ab2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c03ab5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c03ab8:	c9                   	leave  
  c03ab9:	c3                   	ret    
  c03aba:	66 90                	xchg   %ax,%ax

00c03abc <strlen>:
  c03abc:	55                   	push   %ebp
  c03abd:	89 e5                	mov    %esp,%ebp
  c03abf:	57                   	push   %edi
  c03ac0:	8b 55 08             	mov    0x8(%ebp),%edx
  c03ac3:	b8 00 00 00 00       	mov    $0x0,%eax
  c03ac8:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  c03acd:	89 d7                	mov    %edx,%edi
  c03acf:	fc                   	cld    
  c03ad0:	f2 ae                	repnz scas %es:(%edi),%al
  c03ad2:	f7 d1                	not    %ecx
  c03ad4:	49                   	dec    %ecx
  c03ad5:	89 c8                	mov    %ecx,%eax
  c03ad7:	5f                   	pop    %edi
  c03ad8:	5d                   	pop    %ebp
  c03ad9:	c3                   	ret    

00c03ada <memcpy>:
  c03ada:	55                   	push   %ebp
  c03adb:	89 e5                	mov    %esp,%ebp
  c03add:	57                   	push   %edi
  c03ade:	56                   	push   %esi
  c03adf:	53                   	push   %ebx
  c03ae0:	8b 45 10             	mov    0x10(%ebp),%eax
  c03ae3:	8b 55 0c             	mov    0xc(%ebp),%edx
  c03ae6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c03ae9:	89 c1                	mov    %eax,%ecx
  c03aeb:	89 d6                	mov    %edx,%esi
  c03aed:	89 df                	mov    %ebx,%edi
  c03aef:	fc                   	cld    
  c03af0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  c03af2:	8b 45 08             	mov    0x8(%ebp),%eax
  c03af5:	5b                   	pop    %ebx
  c03af6:	5e                   	pop    %esi
  c03af7:	5f                   	pop    %edi
  c03af8:	5d                   	pop    %ebp
  c03af9:	c3                   	ret    

00c03afa <_atoi>:
  c03afa:	55                   	push   %ebp
  c03afb:	89 e5                	mov    %esp,%ebp
  c03afd:	53                   	push   %ebx
  c03afe:	83 ec 10             	sub    $0x10,%esp
  c03b01:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c03b08:	eb 29                	jmp    c03b33 <_atoi+0x39>
  c03b0a:	8b 55 f8             	mov    -0x8(%ebp),%edx
  c03b0d:	89 d0                	mov    %edx,%eax
  c03b0f:	c1 e0 02             	shl    $0x2,%eax
  c03b12:	01 d0                	add    %edx,%eax
  c03b14:	01 c0                	add    %eax,%eax
  c03b16:	89 c3                	mov    %eax,%ebx
  c03b18:	8b 45 08             	mov    0x8(%ebp),%eax
  c03b1b:	8b 00                	mov    (%eax),%eax
  c03b1d:	8d 48 01             	lea    0x1(%eax),%ecx
  c03b20:	8b 55 08             	mov    0x8(%ebp),%edx
  c03b23:	89 0a                	mov    %ecx,(%edx)
  c03b25:	0f b6 00             	movzbl (%eax),%eax
  c03b28:	0f be c0             	movsbl %al,%eax
  c03b2b:	01 d8                	add    %ebx,%eax
  c03b2d:	83 e8 30             	sub    $0x30,%eax
  c03b30:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c03b33:	8b 45 08             	mov    0x8(%ebp),%eax
  c03b36:	8b 00                	mov    (%eax),%eax
  c03b38:	0f b6 00             	movzbl (%eax),%eax
  c03b3b:	3c 2f                	cmp    $0x2f,%al
  c03b3d:	7e 0c                	jle    c03b4b <_atoi+0x51>
  c03b3f:	8b 45 08             	mov    0x8(%ebp),%eax
  c03b42:	8b 00                	mov    (%eax),%eax
  c03b44:	0f b6 00             	movzbl (%eax),%eax
  c03b47:	3c 39                	cmp    $0x39,%al
  c03b49:	7e bf                	jle    c03b0a <_atoi+0x10>
  c03b4b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c03b4e:	83 c4 10             	add    $0x10,%esp
  c03b51:	5b                   	pop    %ebx
  c03b52:	5d                   	pop    %ebp
  c03b53:	c3                   	ret    

00c03b54 <_octal>:
  c03b54:	55                   	push   %ebp
  c03b55:	89 e5                	mov    %esp,%ebp
  c03b57:	83 ec 10             	sub    $0x10,%esp
  c03b5a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c03b61:	8b 45 08             	mov    0x8(%ebp),%eax
  c03b64:	8d 50 04             	lea    0x4(%eax),%edx
  c03b67:	89 55 08             	mov    %edx,0x8(%ebp)
  c03b6a:	8b 55 0c             	mov    0xc(%ebp),%edx
  c03b6d:	83 e2 07             	and    $0x7,%edx
  c03b70:	89 10                	mov    %edx,(%eax)
  c03b72:	c1 6d 0c 03          	shrl   $0x3,0xc(%ebp)
  c03b76:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  c03b7a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c03b7e:	75 e1                	jne    c03b61 <_octal+0xd>
  c03b80:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c03b83:	c9                   	leave  
  c03b84:	c3                   	ret    

00c03b85 <_decimal>:
  c03b85:	55                   	push   %ebp
  c03b86:	89 e5                	mov    %esp,%ebp
  c03b88:	53                   	push   %ebx
  c03b89:	83 ec 10             	sub    $0x10,%esp
  c03b8c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c03b93:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c03b96:	8d 41 04             	lea    0x4(%ecx),%eax
  c03b99:	89 45 08             	mov    %eax,0x8(%ebp)
  c03b9c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  c03b9f:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  c03ba4:	89 d8                	mov    %ebx,%eax
  c03ba6:	f7 e2                	mul    %edx
  c03ba8:	c1 ea 03             	shr    $0x3,%edx
  c03bab:	89 d0                	mov    %edx,%eax
  c03bad:	c1 e0 02             	shl    $0x2,%eax
  c03bb0:	01 d0                	add    %edx,%eax
  c03bb2:	01 c0                	add    %eax,%eax
  c03bb4:	29 c3                	sub    %eax,%ebx
  c03bb6:	89 da                	mov    %ebx,%edx
  c03bb8:	89 d0                	mov    %edx,%eax
  c03bba:	89 01                	mov    %eax,(%ecx)
  c03bbc:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03bbf:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  c03bc4:	f7 e2                	mul    %edx
  c03bc6:	89 d0                	mov    %edx,%eax
  c03bc8:	c1 e8 03             	shr    $0x3,%eax
  c03bcb:	89 45 0c             	mov    %eax,0xc(%ebp)
  c03bce:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  c03bd2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c03bd6:	75 bb                	jne    c03b93 <_decimal+0xe>
  c03bd8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c03bdb:	83 c4 10             	add    $0x10,%esp
  c03bde:	5b                   	pop    %ebx
  c03bdf:	5d                   	pop    %ebp
  c03be0:	c3                   	ret    

00c03be1 <_hex>:
  c03be1:	55                   	push   %ebp
  c03be2:	89 e5                	mov    %esp,%ebp
  c03be4:	83 ec 10             	sub    $0x10,%esp
  c03be7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c03bee:	8b 45 08             	mov    0x8(%ebp),%eax
  c03bf1:	8d 50 04             	lea    0x4(%eax),%edx
  c03bf4:	89 55 08             	mov    %edx,0x8(%ebp)
  c03bf7:	8b 55 0c             	mov    0xc(%ebp),%edx
  c03bfa:	83 e2 0f             	and    $0xf,%edx
  c03bfd:	89 10                	mov    %edx,(%eax)
  c03bff:	c1 6d 0c 04          	shrl   $0x4,0xc(%ebp)
  c03c03:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  c03c07:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  c03c0b:	75 e1                	jne    c03bee <_hex+0xd>
  c03c0d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c03c10:	c9                   	leave  
  c03c11:	c3                   	ret    

00c03c12 <_toNumber>:
  c03c12:	55                   	push   %ebp
  c03c13:	89 e5                	mov    %esp,%ebp
  c03c15:	81 ec 18 01 00 00    	sub    $0x118,%esp
  c03c1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03c1e:	89 85 e8 fe ff ff    	mov    %eax,-0x118(%ebp)
  c03c24:	8b 45 10             	mov    0x10(%ebp),%eax
  c03c27:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
  c03c2d:	c6 45 ff 2b          	movb   $0x2b,-0x1(%ebp)
  c03c31:	c7 45 f8 a4 51 c0 00 	movl   $0xc051a4,-0x8(%ebp)
  c03c38:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c03c3f:	8b 45 20             	mov    0x20(%ebp),%eax
  c03c42:	83 e0 10             	and    $0x10,%eax
  c03c45:	85 c0                	test   %eax,%eax
  c03c47:	74 07                	je     c03c50 <_toNumber+0x3e>
  c03c49:	c7 45 f8 bc 51 c0 00 	movl   $0xc051bc,-0x8(%ebp)
  c03c50:	8b 45 20             	mov    0x20(%ebp),%eax
  c03c53:	83 e0 01             	and    $0x1,%eax
  c03c56:	85 c0                	test   %eax,%eax
  c03c58:	74 04                	je     c03c5e <_toNumber+0x4c>
  c03c5a:	83 65 20 f7          	andl   $0xfffffff7,0x20(%ebp)
  c03c5e:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
  c03c62:	74 0d                	je     c03c71 <_toNumber+0x5f>
  c03c64:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
  c03c6b:	83 65 20 fd          	andl   $0xfffffffd,0x20(%ebp)
  c03c6f:	eb 04                	jmp    c03c75 <_toNumber+0x63>
  c03c71:	83 65 20 fb          	andl   $0xfffffffb,0x20(%ebp)
  c03c75:	8b 45 20             	mov    0x20(%ebp),%eax
  c03c78:	83 e0 04             	and    $0x4,%eax
  c03c7b:	85 c0                	test   %eax,%eax
  c03c7d:	74 16                	je     c03c95 <_toNumber+0x83>
  c03c7f:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
  c03c83:	75 06                	jne    c03c8b <_toNumber+0x79>
  c03c85:	83 6d 1c 02          	subl   $0x2,0x1c(%ebp)
  c03c89:	eb 0a                	jmp    c03c95 <_toNumber+0x83>
  c03c8b:	83 7d 18 08          	cmpl   $0x8,0x18(%ebp)
  c03c8f:	75 04                	jne    c03c95 <_toNumber+0x83>
  c03c91:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  c03c95:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
  c03c99:	75 2b                	jne    c03cc6 <_toNumber+0xb4>
  c03c9b:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  c03ca1:	8b 95 ec fe ff ff    	mov    -0x114(%ebp),%edx
  c03ca7:	85 d2                	test   %edx,%edx
  c03ca9:	79 1b                	jns    c03cc6 <_toNumber+0xb4>
  c03cab:	83 4d 20 02          	orl    $0x2,0x20(%ebp)
  c03caf:	f7 9d e8 fe ff ff    	negl   -0x118(%ebp)
  c03cb5:	83 95 ec fe ff ff 00 	adcl   $0x0,-0x114(%ebp)
  c03cbc:	f7 9d ec fe ff ff    	negl   -0x114(%ebp)
  c03cc2:	c6 45 ff 2d          	movb   $0x2d,-0x1(%ebp)
  c03cc6:	8b 45 24             	mov    0x24(%ebp),%eax
  c03cc9:	99                   	cltd   
  c03cca:	21 85 e8 fe ff ff    	and    %eax,-0x118(%ebp)
  c03cd0:	21 95 ec fe ff ff    	and    %edx,-0x114(%ebp)
  c03cd6:	8b 45 20             	mov    0x20(%ebp),%eax
  c03cd9:	83 e0 02             	and    $0x2,%eax
  c03cdc:	85 c0                	test   %eax,%eax
  c03cde:	74 04                	je     c03ce4 <_toNumber+0xd2>
  c03ce0:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  c03ce4:	8b 45 18             	mov    0x18(%ebp),%eax
  c03ce7:	83 f8 0a             	cmp    $0xa,%eax
  c03cea:	74 25                	je     c03d11 <_toNumber+0xff>
  c03cec:	83 f8 10             	cmp    $0x10,%eax
  c03cef:	74 3b                	je     c03d2c <_toNumber+0x11a>
  c03cf1:	83 f8 08             	cmp    $0x8,%eax
  c03cf4:	75 50                	jne    c03d46 <_toNumber+0x134>
  c03cf6:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  c03cfc:	50                   	push   %eax
  c03cfd:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  c03d03:	50                   	push   %eax
  c03d04:	e8 4b fe ff ff       	call   c03b54 <_octal>
  c03d09:	83 c4 08             	add    $0x8,%esp
  c03d0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c03d0f:	eb 35                	jmp    c03d46 <_toNumber+0x134>
  c03d11:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  c03d17:	50                   	push   %eax
  c03d18:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  c03d1e:	50                   	push   %eax
  c03d1f:	e8 61 fe ff ff       	call   c03b85 <_decimal>
  c03d24:	83 c4 08             	add    $0x8,%esp
  c03d27:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c03d2a:	eb 1a                	jmp    c03d46 <_toNumber+0x134>
  c03d2c:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  c03d32:	50                   	push   %eax
  c03d33:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  c03d39:	50                   	push   %eax
  c03d3a:	e8 a2 fe ff ff       	call   c03be1 <_hex>
  c03d3f:	83 c4 08             	add    $0x8,%esp
  c03d42:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c03d45:	90                   	nop
  c03d46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c03d49:	29 45 1c             	sub    %eax,0x1c(%ebp)
  c03d4c:	8b 45 20             	mov    0x20(%ebp),%eax
  c03d4f:	83 e0 09             	and    $0x9,%eax
  c03d52:	85 c0                	test   %eax,%eax
  c03d54:	75 1b                	jne    c03d71 <_toNumber+0x15f>
  c03d56:	eb 0c                	jmp    c03d64 <_toNumber+0x152>
  c03d58:	8b 45 08             	mov    0x8(%ebp),%eax
  c03d5b:	8d 50 01             	lea    0x1(%eax),%edx
  c03d5e:	89 55 08             	mov    %edx,0x8(%ebp)
  c03d61:	c6 00 20             	movb   $0x20,(%eax)
  c03d64:	8b 45 1c             	mov    0x1c(%ebp),%eax
  c03d67:	8d 50 ff             	lea    -0x1(%eax),%edx
  c03d6a:	89 55 1c             	mov    %edx,0x1c(%ebp)
  c03d6d:	85 c0                	test   %eax,%eax
  c03d6f:	7f e7                	jg     c03d58 <_toNumber+0x146>
  c03d71:	8b 45 20             	mov    0x20(%ebp),%eax
  c03d74:	83 e0 02             	and    $0x2,%eax
  c03d77:	85 c0                	test   %eax,%eax
  c03d79:	74 0f                	je     c03d8a <_toNumber+0x178>
  c03d7b:	8b 45 08             	mov    0x8(%ebp),%eax
  c03d7e:	8d 50 01             	lea    0x1(%eax),%edx
  c03d81:	89 55 08             	mov    %edx,0x8(%ebp)
  c03d84:	0f b6 55 ff          	movzbl -0x1(%ebp),%edx
  c03d88:	88 10                	mov    %dl,(%eax)
  c03d8a:	8b 45 20             	mov    0x20(%ebp),%eax
  c03d8d:	83 e0 04             	and    $0x4,%eax
  c03d90:	85 c0                	test   %eax,%eax
  c03d92:	74 24                	je     c03db8 <_toNumber+0x1a6>
  c03d94:	8b 45 08             	mov    0x8(%ebp),%eax
  c03d97:	8d 50 01             	lea    0x1(%eax),%edx
  c03d9a:	89 55 08             	mov    %edx,0x8(%ebp)
  c03d9d:	c6 00 30             	movb   $0x30,(%eax)
  c03da0:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
  c03da4:	75 12                	jne    c03db8 <_toNumber+0x1a6>
  c03da6:	8b 45 08             	mov    0x8(%ebp),%eax
  c03da9:	8d 50 01             	lea    0x1(%eax),%edx
  c03dac:	89 55 08             	mov    %edx,0x8(%ebp)
  c03daf:	8b 55 f8             	mov    -0x8(%ebp),%edx
  c03db2:	0f b6 52 10          	movzbl 0x10(%edx),%edx
  c03db6:	88 10                	mov    %dl,(%eax)
  c03db8:	8b 45 20             	mov    0x20(%ebp),%eax
  c03dbb:	83 e0 08             	and    $0x8,%eax
  c03dbe:	85 c0                	test   %eax,%eax
  c03dc0:	74 1b                	je     c03ddd <_toNumber+0x1cb>
  c03dc2:	eb 0c                	jmp    c03dd0 <_toNumber+0x1be>
  c03dc4:	8b 45 08             	mov    0x8(%ebp),%eax
  c03dc7:	8d 50 01             	lea    0x1(%eax),%edx
  c03dca:	89 55 08             	mov    %edx,0x8(%ebp)
  c03dcd:	c6 00 30             	movb   $0x30,(%eax)
  c03dd0:	8b 45 1c             	mov    0x1c(%ebp),%eax
  c03dd3:	8d 50 ff             	lea    -0x1(%eax),%edx
  c03dd6:	89 55 1c             	mov    %edx,0x1c(%ebp)
  c03dd9:	85 c0                	test   %eax,%eax
  c03ddb:	7f e7                	jg     c03dc4 <_toNumber+0x1b2>
  c03ddd:	eb 1f                	jmp    c03dfe <_toNumber+0x1ec>
  c03ddf:	8b 45 08             	mov    0x8(%ebp),%eax
  c03de2:	8d 50 01             	lea    0x1(%eax),%edx
  c03de5:	89 55 08             	mov    %edx,0x8(%ebp)
  c03de8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c03deb:	8b 94 95 f4 fe ff ff 	mov    -0x10c(%ebp,%edx,4),%edx
  c03df2:	89 d1                	mov    %edx,%ecx
  c03df4:	8b 55 f8             	mov    -0x8(%ebp),%edx
  c03df7:	01 ca                	add    %ecx,%edx
  c03df9:	0f b6 12             	movzbl (%edx),%edx
  c03dfc:	88 10                	mov    %dl,(%eax)
  c03dfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c03e01:	8d 50 ff             	lea    -0x1(%eax),%edx
  c03e04:	89 55 f4             	mov    %edx,-0xc(%ebp)
  c03e07:	85 c0                	test   %eax,%eax
  c03e09:	7f d4                	jg     c03ddf <_toNumber+0x1cd>
  c03e0b:	8b 45 20             	mov    0x20(%ebp),%eax
  c03e0e:	83 e0 01             	and    $0x1,%eax
  c03e11:	85 c0                	test   %eax,%eax
  c03e13:	74 1b                	je     c03e30 <_toNumber+0x21e>
  c03e15:	eb 0c                	jmp    c03e23 <_toNumber+0x211>
  c03e17:	8b 45 08             	mov    0x8(%ebp),%eax
  c03e1a:	8d 50 01             	lea    0x1(%eax),%edx
  c03e1d:	89 55 08             	mov    %edx,0x8(%ebp)
  c03e20:	c6 00 20             	movb   $0x20,(%eax)
  c03e23:	8b 45 1c             	mov    0x1c(%ebp),%eax
  c03e26:	8d 50 ff             	lea    -0x1(%eax),%edx
  c03e29:	89 55 1c             	mov    %edx,0x1c(%ebp)
  c03e2c:	85 c0                	test   %eax,%eax
  c03e2e:	7f e7                	jg     c03e17 <_toNumber+0x205>
  c03e30:	8b 45 08             	mov    0x8(%ebp),%eax
  c03e33:	c9                   	leave  
  c03e34:	c3                   	ret    

00c03e35 <_toString>:
  c03e35:	55                   	push   %ebp
  c03e36:	89 e5                	mov    %esp,%ebp
  c03e38:	83 ec 10             	sub    $0x10,%esp
  c03e3b:	ff 75 0c             	pushl  0xc(%ebp)
  c03e3e:	e8 79 fc ff ff       	call   c03abc <strlen>
  c03e43:	83 c4 04             	add    $0x4,%esp
  c03e46:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c03e49:	8b 45 08             	mov    0x8(%ebp),%eax
  c03e4c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c03e4f:	8b 45 08             	mov    0x8(%ebp),%eax
  c03e52:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c03e55:	8b 45 14             	mov    0x14(%ebp),%eax
  c03e58:	83 e0 01             	and    $0x1,%eax
  c03e5b:	85 c0                	test   %eax,%eax
  c03e5d:	74 0d                	je     c03e6c <_toString+0x37>
  c03e5f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  c03e62:	8b 45 08             	mov    0x8(%ebp),%eax
  c03e65:	01 d0                	add    %edx,%eax
  c03e67:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c03e6a:	eb 0b                	jmp    c03e77 <_toString+0x42>
  c03e6c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  c03e6f:	8b 45 08             	mov    0x8(%ebp),%eax
  c03e72:	01 d0                	add    %edx,%eax
  c03e74:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c03e77:	ff 75 f0             	pushl  -0x10(%ebp)
  c03e7a:	ff 75 0c             	pushl  0xc(%ebp)
  c03e7d:	ff 75 fc             	pushl  -0x4(%ebp)
  c03e80:	e8 55 fc ff ff       	call   c03ada <memcpy>
  c03e85:	83 c4 0c             	add    $0xc,%esp
  c03e88:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c03e8f:	eb 10                	jmp    c03ea1 <_toString+0x6c>
  c03e91:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c03e94:	8d 50 01             	lea    0x1(%eax),%edx
  c03e97:	89 55 f8             	mov    %edx,-0x8(%ebp)
  c03e9a:	c6 00 20             	movb   $0x20,(%eax)
  c03e9d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  c03ea1:	8b 45 10             	mov    0x10(%ebp),%eax
  c03ea4:	2b 45 f0             	sub    -0x10(%ebp),%eax
  c03ea7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  c03eaa:	7f e5                	jg     c03e91 <_toString+0x5c>
  c03eac:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c03eaf:	39 45 10             	cmp    %eax,0x10(%ebp)
  c03eb2:	0f 4d 45 10          	cmovge 0x10(%ebp),%eax
  c03eb6:	89 c2                	mov    %eax,%edx
  c03eb8:	8b 45 08             	mov    0x8(%ebp),%eax
  c03ebb:	01 d0                	add    %edx,%eax
  c03ebd:	c9                   	leave  
  c03ebe:	c3                   	ret    

00c03ebf <vsprintf>:
  c03ebf:	55                   	push   %ebp
  c03ec0:	89 e5                	mov    %esp,%ebp
  c03ec2:	83 ec 30             	sub    $0x30,%esp
  c03ec5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c03ecc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c03ed3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c03eda:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  c03ee1:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  c03ee8:	c7 45 e4 6c 00 00 00 	movl   $0x6c,-0x1c(%ebp)
  c03eef:	8b 45 08             	mov    0x8(%ebp),%eax
  c03ef2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c03ef5:	e9 69 02 00 00       	jmp    c04163 <vsprintf+0x2a4>
  c03efa:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03efd:	0f b6 00             	movzbl (%eax),%eax
  c03f00:	3c 25                	cmp    $0x25,%al
  c03f02:	0f 85 41 02 00 00    	jne    c04149 <vsprintf+0x28a>
  c03f08:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c03f0f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  c03f16:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  c03f1d:	c7 45 e4 6c 00 00 00 	movl   $0x6c,-0x1c(%ebp)
  c03f24:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03f27:	83 c0 01             	add    $0x1,%eax
  c03f2a:	89 45 0c             	mov    %eax,0xc(%ebp)
  c03f2d:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03f30:	0f b6 00             	movzbl (%eax),%eax
  c03f33:	0f be c0             	movsbl %al,%eax
  c03f36:	83 e8 20             	sub    $0x20,%eax
  c03f39:	83 f8 10             	cmp    $0x10,%eax
  c03f3c:	77 27                	ja     c03f65 <vsprintf+0xa6>
  c03f3e:	8b 04 85 dc 51 c0 00 	mov    0xc051dc(,%eax,4),%eax
  c03f45:	ff e0                	jmp    *%eax
  c03f47:	83 4d fc 01          	orl    $0x1,-0x4(%ebp)
  c03f4b:	eb d7                	jmp    c03f24 <vsprintf+0x65>
  c03f4d:	83 4d fc 02          	orl    $0x2,-0x4(%ebp)
  c03f51:	eb d1                	jmp    c03f24 <vsprintf+0x65>
  c03f53:	83 4d fc 02          	orl    $0x2,-0x4(%ebp)
  c03f57:	eb cb                	jmp    c03f24 <vsprintf+0x65>
  c03f59:	83 4d fc 08          	orl    $0x8,-0x4(%ebp)
  c03f5d:	eb c5                	jmp    c03f24 <vsprintf+0x65>
  c03f5f:	83 4d fc 04          	orl    $0x4,-0x4(%ebp)
  c03f63:	eb bf                	jmp    c03f24 <vsprintf+0x65>
  c03f65:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03f68:	0f b6 00             	movzbl (%eax),%eax
  c03f6b:	3c 2f                	cmp    $0x2f,%al
  c03f6d:	7e 1b                	jle    c03f8a <vsprintf+0xcb>
  c03f6f:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03f72:	0f b6 00             	movzbl (%eax),%eax
  c03f75:	3c 39                	cmp    $0x39,%al
  c03f77:	7f 11                	jg     c03f8a <vsprintf+0xcb>
  c03f79:	8d 45 0c             	lea    0xc(%ebp),%eax
  c03f7c:	50                   	push   %eax
  c03f7d:	e8 78 fb ff ff       	call   c03afa <_atoi>
  c03f82:	83 c4 04             	add    $0x4,%esp
  c03f85:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c03f88:	eb 21                	jmp    c03fab <vsprintf+0xec>
  c03f8a:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03f8d:	0f b6 00             	movzbl (%eax),%eax
  c03f90:	3c 2a                	cmp    $0x2a,%al
  c03f92:	75 17                	jne    c03fab <vsprintf+0xec>
  c03f94:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03f97:	83 c0 01             	add    $0x1,%eax
  c03f9a:	89 45 0c             	mov    %eax,0xc(%ebp)
  c03f9d:	8b 45 10             	mov    0x10(%ebp),%eax
  c03fa0:	8d 50 04             	lea    0x4(%eax),%edx
  c03fa3:	89 55 10             	mov    %edx,0x10(%ebp)
  c03fa6:	8b 00                	mov    (%eax),%eax
  c03fa8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c03fab:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03fae:	0f b6 00             	movzbl (%eax),%eax
  c03fb1:	3c 68                	cmp    $0x68,%al
  c03fb3:	74 1e                	je     c03fd3 <vsprintf+0x114>
  c03fb5:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03fb8:	0f b6 00             	movzbl (%eax),%eax
  c03fbb:	3c 6c                	cmp    $0x6c,%al
  c03fbd:	74 14                	je     c03fd3 <vsprintf+0x114>
  c03fbf:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03fc2:	0f b6 00             	movzbl (%eax),%eax
  c03fc5:	3c 4c                	cmp    $0x4c,%al
  c03fc7:	74 0a                	je     c03fd3 <vsprintf+0x114>
  c03fc9:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03fcc:	0f b6 00             	movzbl (%eax),%eax
  c03fcf:	3c 48                	cmp    $0x48,%al
  c03fd1:	75 15                	jne    c03fe8 <vsprintf+0x129>
  c03fd3:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03fd6:	0f b6 00             	movzbl (%eax),%eax
  c03fd9:	0f be c0             	movsbl %al,%eax
  c03fdc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c03fdf:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03fe2:	83 c0 01             	add    $0x1,%eax
  c03fe5:	89 45 0c             	mov    %eax,0xc(%ebp)
  c03fe8:	8b 45 0c             	mov    0xc(%ebp),%eax
  c03feb:	0f b6 00             	movzbl (%eax),%eax
  c03fee:	0f be c0             	movsbl %al,%eax
  c03ff1:	83 e8 58             	sub    $0x58,%eax
  c03ff4:	83 f8 20             	cmp    $0x20,%eax
  c03ff7:	77 57                	ja     c04050 <vsprintf+0x191>
  c03ff9:	8b 04 85 20 52 c0 00 	mov    0xc05220(,%eax,4),%eax
  c04000:	ff e0                	jmp    *%eax
  c04002:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c04005:	8d 50 01             	lea    0x1(%eax),%edx
  c04008:	89 55 ec             	mov    %edx,-0x14(%ebp)
  c0400b:	8b 55 10             	mov    0x10(%ebp),%edx
  c0400e:	8d 4a 04             	lea    0x4(%edx),%ecx
  c04011:	89 4d 10             	mov    %ecx,0x10(%ebp)
  c04014:	8b 12                	mov    (%edx),%edx
  c04016:	88 10                	mov    %dl,(%eax)
  c04018:	e9 3d 01 00 00       	jmp    c0415a <vsprintf+0x29b>
  c0401d:	c7 45 e4 73 00 00 00 	movl   $0x73,-0x1c(%ebp)
  c04024:	eb 50                	jmp    c04076 <vsprintf+0x1b7>
  c04026:	83 4d fc 04          	orl    $0x4,-0x4(%ebp)
  c0402a:	83 4d fc 10          	orl    $0x10,-0x4(%ebp)
  c0402e:	c7 45 f0 10 00 00 00 	movl   $0x10,-0x10(%ebp)
  c04035:	eb 3f                	jmp    c04076 <vsprintf+0x1b7>
  c04037:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  c0403e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  c04045:	eb 2e                	jmp    c04075 <vsprintf+0x1b6>
  c04047:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
  c0404e:	eb 26                	jmp    c04076 <vsprintf+0x1b7>
  c04050:	8b 45 0c             	mov    0xc(%ebp),%eax
  c04053:	0f b6 00             	movzbl (%eax),%eax
  c04056:	84 c0                	test   %al,%al
  c04058:	74 16                	je     c04070 <vsprintf+0x1b1>
  c0405a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c0405d:	8d 50 01             	lea    0x1(%eax),%edx
  c04060:	89 55 ec             	mov    %edx,-0x14(%ebp)
  c04063:	8b 55 0c             	mov    0xc(%ebp),%edx
  c04066:	0f b6 12             	movzbl (%edx),%edx
  c04069:	88 10                	mov    %dl,(%eax)
  c0406b:	e9 ea 00 00 00       	jmp    c0415a <vsprintf+0x29b>
  c04070:	e9 e5 00 00 00       	jmp    c0415a <vsprintf+0x29b>
  c04075:	90                   	nop
  c04076:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  c0407d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  c04080:	83 e8 48             	sub    $0x48,%eax
  c04083:	83 f8 2b             	cmp    $0x2b,%eax
  c04086:	0f 87 ce 00 00 00    	ja     c0415a <vsprintf+0x29b>
  c0408c:	8b 04 85 a4 52 c0 00 	mov    0xc052a4(,%eax,4),%eax
  c04093:	ff e0                	jmp    *%eax
  c04095:	c7 45 e0 ff 00 00 00 	movl   $0xff,-0x20(%ebp)
  c0409c:	81 65 e0 ff ff 00 00 	andl   $0xffff,-0x20(%ebp)
  c040a3:	8b 45 10             	mov    0x10(%ebp),%eax
  c040a6:	8d 50 04             	lea    0x4(%eax),%edx
  c040a9:	89 55 10             	mov    %edx,0x10(%ebp)
  c040ac:	8b 00                	mov    (%eax),%eax
  c040ae:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c040b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c040b4:	ba 00 00 00 00       	mov    $0x0,%edx
  c040b9:	ff 75 e0             	pushl  -0x20(%ebp)
  c040bc:	ff 75 fc             	pushl  -0x4(%ebp)
  c040bf:	ff 75 f8             	pushl  -0x8(%ebp)
  c040c2:	ff 75 f0             	pushl  -0x10(%ebp)
  c040c5:	ff 75 f4             	pushl  -0xc(%ebp)
  c040c8:	52                   	push   %edx
  c040c9:	50                   	push   %eax
  c040ca:	ff 75 ec             	pushl  -0x14(%ebp)
  c040cd:	e8 40 fb ff ff       	call   c03c12 <_toNumber>
  c040d2:	83 c4 20             	add    $0x20,%esp
  c040d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c040d8:	eb 6d                	jmp    c04147 <vsprintf+0x288>
  c040da:	8b 45 10             	mov    0x10(%ebp),%eax
  c040dd:	8d 50 08             	lea    0x8(%eax),%edx
  c040e0:	89 55 10             	mov    %edx,0x10(%ebp)
  c040e3:	8b 50 04             	mov    0x4(%eax),%edx
  c040e6:	8b 00                	mov    (%eax),%eax
  c040e8:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c040eb:	8b 45 dc             	mov    -0x24(%ebp),%eax
  c040ee:	ba 00 00 00 00       	mov    $0x0,%edx
  c040f3:	ff 75 e0             	pushl  -0x20(%ebp)
  c040f6:	ff 75 fc             	pushl  -0x4(%ebp)
  c040f9:	ff 75 f8             	pushl  -0x8(%ebp)
  c040fc:	ff 75 f0             	pushl  -0x10(%ebp)
  c040ff:	ff 75 f4             	pushl  -0xc(%ebp)
  c04102:	52                   	push   %edx
  c04103:	50                   	push   %eax
  c04104:	ff 75 ec             	pushl  -0x14(%ebp)
  c04107:	e8 06 fb ff ff       	call   c03c12 <_toNumber>
  c0410c:	83 c4 20             	add    $0x20,%esp
  c0410f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c04112:	eb 33                	jmp    c04147 <vsprintf+0x288>
  c04114:	8b 45 10             	mov    0x10(%ebp),%eax
  c04117:	8d 50 04             	lea    0x4(%eax),%edx
  c0411a:	89 55 10             	mov    %edx,0x10(%ebp)
  c0411d:	8b 00                	mov    (%eax),%eax
  c0411f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c04122:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  c04126:	75 07                	jne    c0412f <vsprintf+0x270>
  c04128:	c7 45 e8 d4 51 c0 00 	movl   $0xc051d4,-0x18(%ebp)
  c0412f:	ff 75 fc             	pushl  -0x4(%ebp)
  c04132:	ff 75 f8             	pushl  -0x8(%ebp)
  c04135:	ff 75 e8             	pushl  -0x18(%ebp)
  c04138:	ff 75 ec             	pushl  -0x14(%ebp)
  c0413b:	e8 f5 fc ff ff       	call   c03e35 <_toString>
  c04140:	83 c4 10             	add    $0x10,%esp
  c04143:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c04146:	90                   	nop
  c04147:	eb 11                	jmp    c0415a <vsprintf+0x29b>
  c04149:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c0414c:	8d 50 01             	lea    0x1(%eax),%edx
  c0414f:	89 55 ec             	mov    %edx,-0x14(%ebp)
  c04152:	8b 55 0c             	mov    0xc(%ebp),%edx
  c04155:	0f b6 12             	movzbl (%edx),%edx
  c04158:	88 10                	mov    %dl,(%eax)
  c0415a:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0415d:	83 c0 01             	add    $0x1,%eax
  c04160:	89 45 0c             	mov    %eax,0xc(%ebp)
  c04163:	8b 45 0c             	mov    0xc(%ebp),%eax
  c04166:	0f b6 00             	movzbl (%eax),%eax
  c04169:	84 c0                	test   %al,%al
  c0416b:	0f 85 89 fd ff ff    	jne    c03efa <vsprintf+0x3b>
  c04171:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c04174:	c6 00 00             	movb   $0x0,(%eax)
  c04177:	8b 55 ec             	mov    -0x14(%ebp),%edx
  c0417a:	8b 45 08             	mov    0x8(%ebp),%eax
  c0417d:	29 c2                	sub    %eax,%edx
  c0417f:	89 d0                	mov    %edx,%eax
  c04181:	c9                   	leave  
  c04182:	c3                   	ret    

00c04183 <sprintf>:
  c04183:	55                   	push   %ebp
  c04184:	89 e5                	mov    %esp,%ebp
  c04186:	83 ec 10             	sub    $0x10,%esp
  c04189:	8d 45 10             	lea    0x10(%ebp),%eax
  c0418c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  c0418f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  c04192:	83 ec 04             	sub    $0x4,%esp
  c04195:	50                   	push   %eax
  c04196:	ff 75 0c             	pushl  0xc(%ebp)
  c04199:	ff 75 08             	pushl  0x8(%ebp)
  c0419c:	e8 1e fd ff ff       	call   c03ebf <vsprintf>
  c041a1:	83 c4 10             	add    $0x10,%esp
  c041a4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  c041a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c041aa:	c9                   	leave  
  c041ab:	c3                   	ret    

00c041ac <_run>:
  c041ac:	55                   	push   %ebp
  c041ad:	89 e5                	mov    %esp,%ebp
  c041af:	57                   	push   %edi
  c041b0:	56                   	push   %esi
  c041b1:	53                   	push   %ebx
  c041b2:	83 ec 10             	sub    $0x10,%esp
  c041b5:	8b 55 10             	mov    0x10(%ebp),%edx
  c041b8:	8b 75 18             	mov    0x18(%ebp),%esi
  c041bb:	8b 7d 14             	mov    0x14(%ebp),%edi
  c041be:	b8 00 00 00 00       	mov    $0x0,%eax
  c041c3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  c041c6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c041c9:	cd 80                	int    $0x80
  c041cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c041ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c041d1:	83 c4 10             	add    $0x10,%esp
  c041d4:	5b                   	pop    %ebx
  c041d5:	5e                   	pop    %esi
  c041d6:	5f                   	pop    %edi
  c041d7:	5d                   	pop    %ebp
  c041d8:	c3                   	ret    

00c041d9 <write>:
  c041d9:	55                   	push   %ebp
  c041da:	89 e5                	mov    %esp,%ebp
  c041dc:	57                   	push   %edi
  c041dd:	56                   	push   %esi
  c041de:	53                   	push   %ebx
  c041df:	83 ec 20             	sub    $0x20,%esp
  c041e2:	b8 04 00 00 00       	mov    $0x4,%eax
  c041e7:	bb 01 00 00 00       	mov    $0x1,%ebx
  c041ec:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  c041ef:	8b 55 10             	mov    0x10(%ebp),%edx
  c041f2:	be 00 00 00 00       	mov    $0x0,%esi
  c041f7:	bf 00 00 00 00       	mov    $0x0,%edi
  c041fc:	cd 80                	int    $0x80
  c041fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  c04201:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c04204:	89 45 ec             	mov    %eax,-0x14(%ebp)
  c04207:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  c0420e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  c04215:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c0421c:	8b 45 10             	mov    0x10(%ebp),%eax
  c0421f:	89 45 dc             	mov    %eax,-0x24(%ebp)
  c04222:	8b 45 ec             	mov    -0x14(%ebp),%eax
  c04225:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c04228:	ff 75 e0             	pushl  -0x20(%ebp)
  c0422b:	ff 75 dc             	pushl  -0x24(%ebp)
  c0422e:	ff 75 d8             	pushl  -0x28(%ebp)
  c04231:	6a 01                	push   $0x1
  c04233:	ff 75 08             	pushl  0x8(%ebp)
  c04236:	e8 71 ff ff ff       	call   c041ac <_run>
  c0423b:	83 c4 14             	add    $0x14,%esp
  c0423e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  c04241:	b8 04 00 00 00       	mov    $0x4,%eax
  c04246:	bb 00 00 00 00       	mov    $0x0,%ebx
  c0424b:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  c0424e:	ba 00 00 00 00       	mov    $0x0,%edx
  c04253:	be 00 00 00 00       	mov    $0x0,%esi
  c04258:	bf 00 00 00 00       	mov    $0x0,%edi
  c0425d:	cd 80                	int    $0x80
  c0425f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c04262:	8b 45 e8             	mov    -0x18(%ebp),%eax
  c04265:	8d 65 f4             	lea    -0xc(%ebp),%esp
  c04268:	5b                   	pop    %ebx
  c04269:	5e                   	pop    %esi
  c0426a:	5f                   	pop    %edi
  c0426b:	5d                   	pop    %ebp
  c0426c:	c3                   	ret    

Disassembly of section .rodata:

00c04280 <yytranslate>:
  c04280:	00 02                	add    %al,(%edx)
  c04282:	02 02                	add    (%edx),%al
  c04284:	02 02                	add    (%edx),%al
  c04286:	02 02                	add    (%edx),%al
  c04288:	02 02                	add    (%edx),%al
  c0428a:	02 02                	add    (%edx),%al
  c0428c:	02 02                	add    (%edx),%al
  c0428e:	02 02                	add    (%edx),%al
  c04290:	02 02                	add    (%edx),%al
  c04292:	02 02                	add    (%edx),%al
  c04294:	02 02                	add    (%edx),%al
  c04296:	02 02                	add    (%edx),%al
  c04298:	02 02                	add    (%edx),%al
  c0429a:	02 02                	add    (%edx),%al
  c0429c:	02 02                	add    (%edx),%al
  c0429e:	02 02                	add    (%edx),%al
  c042a0:	02 02                	add    (%edx),%al
  c042a2:	02 02                	add    (%edx),%al
  c042a4:	02 02                	add    (%edx),%al
  c042a6:	02 02                	add    (%edx),%al
  c042a8:	06                   	push   %es
  c042a9:	07                   	pop    %es
  c042aa:	02 02                	add    (%edx),%al
  c042ac:	02 02                	add    (%edx),%al
  c042ae:	02 02                	add    (%edx),%al
  c042b0:	02 02                	add    (%edx),%al
  c042b2:	02 02                	add    (%edx),%al
  c042b4:	02 02                	add    (%edx),%al
  c042b6:	02 02                	add    (%edx),%al
  c042b8:	02 02                	add    (%edx),%al
  c042ba:	02 02                	add    (%edx),%al
  c042bc:	02 02                	add    (%edx),%al
  c042be:	02 02                	add    (%edx),%al
  c042c0:	02 02                	add    (%edx),%al
  c042c2:	02 02                	add    (%edx),%al
  c042c4:	02 02                	add    (%edx),%al
  c042c6:	02 02                	add    (%edx),%al
  c042c8:	02 02                	add    (%edx),%al
  c042ca:	02 02                	add    (%edx),%al
  c042cc:	02 02                	add    (%edx),%al
  c042ce:	02 02                	add    (%edx),%al
  c042d0:	02 02                	add    (%edx),%al
  c042d2:	02 02                	add    (%edx),%al
  c042d4:	02 02                	add    (%edx),%al
  c042d6:	02 02                	add    (%edx),%al
  c042d8:	02 02                	add    (%edx),%al
  c042da:	02 02                	add    (%edx),%al
  c042dc:	02 02                	add    (%edx),%al
  c042de:	02 02                	add    (%edx),%al
  c042e0:	08 02                	or     %al,(%edx)
  c042e2:	02 02                	add    (%edx),%al
  c042e4:	02 02                	add    (%edx),%al
  c042e6:	02 02                	add    (%edx),%al
  c042e8:	02 02                	add    (%edx),%al
  c042ea:	02 02                	add    (%edx),%al
  c042ec:	02 02                	add    (%edx),%al
  c042ee:	02 02                	add    (%edx),%al
  c042f0:	02 02                	add    (%edx),%al
  c042f2:	02 02                	add    (%edx),%al
  c042f4:	02 02                	add    (%edx),%al
  c042f6:	02 02                	add    (%edx),%al
  c042f8:	02 02                	add    (%edx),%al
  c042fa:	02 02                	add    (%edx),%al
  c042fc:	02 02                	add    (%edx),%al
  c042fe:	02 02                	add    (%edx),%al
  c04300:	02 02                	add    (%edx),%al
  c04302:	02 02                	add    (%edx),%al
  c04304:	02 02                	add    (%edx),%al
  c04306:	02 02                	add    (%edx),%al
  c04308:	02 02                	add    (%edx),%al
  c0430a:	02 02                	add    (%edx),%al
  c0430c:	02 02                	add    (%edx),%al
  c0430e:	02 02                	add    (%edx),%al
  c04310:	02 02                	add    (%edx),%al
  c04312:	02 02                	add    (%edx),%al
  c04314:	02 02                	add    (%edx),%al
  c04316:	02 02                	add    (%edx),%al
  c04318:	02 02                	add    (%edx),%al
  c0431a:	02 02                	add    (%edx),%al
  c0431c:	02 02                	add    (%edx),%al
  c0431e:	02 02                	add    (%edx),%al
  c04320:	02 02                	add    (%edx),%al
  c04322:	02 02                	add    (%edx),%al
  c04324:	02 02                	add    (%edx),%al
  c04326:	02 02                	add    (%edx),%al
  c04328:	02 02                	add    (%edx),%al
  c0432a:	02 02                	add    (%edx),%al
  c0432c:	02 02                	add    (%edx),%al
  c0432e:	02 02                	add    (%edx),%al
  c04330:	02 02                	add    (%edx),%al
  c04332:	02 02                	add    (%edx),%al
  c04334:	02 02                	add    (%edx),%al
  c04336:	02 02                	add    (%edx),%al
  c04338:	02 02                	add    (%edx),%al
  c0433a:	02 02                	add    (%edx),%al
  c0433c:	02 02                	add    (%edx),%al
  c0433e:	02 02                	add    (%edx),%al
  c04340:	02 02                	add    (%edx),%al
  c04342:	02 02                	add    (%edx),%al
  c04344:	02 02                	add    (%edx),%al
  c04346:	02 02                	add    (%edx),%al
  c04348:	02 02                	add    (%edx),%al
  c0434a:	02 02                	add    (%edx),%al
  c0434c:	02 02                	add    (%edx),%al
  c0434e:	02 02                	add    (%edx),%al
  c04350:	02 02                	add    (%edx),%al
  c04352:	02 02                	add    (%edx),%al
  c04354:	02 02                	add    (%edx),%al
  c04356:	02 02                	add    (%edx),%al
  c04358:	02 02                	add    (%edx),%al
  c0435a:	02 02                	add    (%edx),%al
  c0435c:	02 02                	add    (%edx),%al
  c0435e:	02 02                	add    (%edx),%al
  c04360:	02 02                	add    (%edx),%al
  c04362:	02 02                	add    (%edx),%al
  c04364:	02 02                	add    (%edx),%al
  c04366:	02 02                	add    (%edx),%al
  c04368:	02 02                	add    (%edx),%al
  c0436a:	02 02                	add    (%edx),%al
  c0436c:	02 02                	add    (%edx),%al
  c0436e:	02 02                	add    (%edx),%al
  c04370:	02 02                	add    (%edx),%al
  c04372:	02 02                	add    (%edx),%al
  c04374:	02 02                	add    (%edx),%al
  c04376:	02 02                	add    (%edx),%al
  c04378:	02 02                	add    (%edx),%al
  c0437a:	02 02                	add    (%edx),%al
  c0437c:	02 02                	add    (%edx),%al
  c0437e:	02 02                	add    (%edx),%al
  c04380:	01 02                	add    %eax,(%edx)
  c04382:	03 04 05 00 09 0a 0a 	add    0xa0a0900(,%eax,1),%eax

00c04385 <yyr1>:
  c04385:	00 09                	add    %cl,(%ecx)
  c04387:	0a 0a                	or     (%edx),%cl
  c04389:	0b 0b                	or     (%ebx),%ecx
  c0438b:	0c 0c                	or     $0xc,%al
  c0438d:	0c 0d                	or     $0xd,%al
  c0438f:	0d 0d 0e 0e 00       	or     $0xe0e0d,%eax

00c04393 <yyr2>:
  c04393:	00 02                	add    %al,(%edx)
  c04395:	01 02                	add    %eax,(%edx)
  c04397:	01 01                	add    %eax,(%ecx)
  c04399:	02 03                	add    (%ebx),%al
  c0439b:	02 01                	add    (%ecx),%al
  c0439d:	01 01                	add    %eax,(%ecx)
  c0439f:	01 02                	add    %eax,(%edx)

00c043a1 <yydefact>:
  c043a1:	00 09                	add    %cl,(%ecx)
  c043a3:	0a 0b                	or     (%ebx),%cl
  c043a5:	00 00                	add    %al,(%eax)
  c043a7:	00 02                	add    %al,(%edx)
  c043a9:	05 04 06 0c 00       	add    $0xc0604,%eax
  c043ae:	08 01                	or     %al,(%ecx)
  c043b0:	03 0d 07 ff 06 0b    	add    0xb06ff07,%ecx

00c043b3 <yydefgoto>:
  c043b3:	ff 06                	incl   (%esi)
  c043b5:	0b 08                	or     (%eax),%ecx
  c043b7:	09 0c 11             	or     %ecx,(%ecx,%edx,1)

00c043b9 <yypact>:
  c043b9:	11 f6                	adc    %esi,%esi
  c043bb:	f6 f6                	div    %dh
  c043bd:	0b 11                	or     (%ecx),%edx
  c043bf:	00 f6                	add    %dh,%dh
  c043c1:	f6 f6                	div    %dh
  c043c3:	f6 11                	notb   (%ecx)
  c043c5:	fa                   	cli    
  c043c6:	f6 f6                	div    %dh
  c043c8:	f6 f6                	div    %dh
  c043ca:	f6 f6                	div    %dh

00c043cb <yypgoto>:
  c043cb:	f6 f6                	div    %dh
  c043cd:	07                   	pop    %es
  c043ce:	f6 f6                	div    %dh
  c043d0:	f7                   	(bad)  

00c043d1 <yytable>:
  c043d1:	0e                   	push   %cs
  c043d2:	11 10                	adc    %edx,(%eax)
  c043d4:	01 02                	add    %eax,(%edx)
  c043d6:	03 04 07             	add    (%edi,%eax,1),%eax
  c043d9:	05 00 00 00 0d       	add    $0xd000000,%eax
  c043de:	0f 01 02             	sgdtl  (%edx)
  c043e1:	03 04 0a             	add    (%edx,%ecx,1),%eax
  c043e4:	05 01 02 03 04       	add    $0x4030201,%eax
  c043e9:	00 05 00 07 0b 03    	add    %al,0x30b0700

00c043eb <yycheck>:
  c043eb:	00 07                	add    %al,(%edi)
  c043ed:	0b 03                	or     (%ebx),%eax
  c043ef:	04 05                	add    $0x5,%al
  c043f1:	06                   	push   %es
  c043f2:	00 08                	add    %cl,(%eax)
  c043f4:	ff                   	(bad)  
  c043f5:	ff                   	(bad)  
  c043f6:	ff 05 06 03 04 05    	incl   0x5040306
  c043fc:	06                   	push   %es
  c043fd:	07                   	pop    %es
  c043fe:	08 03                	or     %al,(%ebx)
  c04400:	04 05                	add    $0x5,%al
  c04402:	06                   	push   %es
  c04403:	ff 08                	decl   (%eax)

00c04405 <yystos>:
  c04405:	00 03                	add    %al,(%ebx)
  c04407:	04 05                	add    $0x5,%al
  c04409:	06                   	push   %es
  c0440a:	08 0a                	or     %cl,(%edx)
  c0440c:	0b 0c 0d 07 0b 0e 0b 	or     0xb0e0b07(,%ecx,1),%ecx
  c04413:	00 0b                	add    %cl,(%ebx)
  c04415:	0e                   	push   %cs
  c04416:	07                   	pop    %es
  c04417:	44                   	inc    %esp
  c04418:	65                   	gs
  c04419:	6c                   	insb   (%dx),%es:(%edi)
  c0441a:	65                   	gs
  c0441b:	74 69                	je     c04486 <yystos+0x81>
  c0441d:	6e                   	outsb  %ds:(%esi),(%dx)
  c0441e:	67 00 73 79          	add    %dh,0x79(%bp,%di)
  c04422:	6e                   	outsb  %ds:(%esi),(%dx)
  c04423:	74 61                	je     c04486 <yystos+0x81>
  c04425:	78 20                	js     c04447 <yystos+0x42>
  c04427:	65                   	gs
  c04428:	72 72                	jb     c0449c <yystos+0x97>
  c0442a:	6f                   	outsl  %ds:(%esi),(%dx)
  c0442b:	72 00                	jb     c0442d <yystos+0x28>
  c0442d:	45                   	inc    %ebp
  c0442e:	72 72                	jb     c044a2 <yystos+0x9d>
  c04430:	6f                   	outsl  %ds:(%esi),(%dx)
  c04431:	72 3a                	jb     c0446d <yystos+0x68>
  c04433:	20 64 69 73          	and    %ah,0x73(%ecx,%ebp,2)
  c04437:	63 61 72             	arpl   %sp,0x72(%ecx)
  c0443a:	64 69 6e 67 00 45 72 	imul   $0x72724500,%fs:0x67(%esi),%ebp
  c04441:	72 
  c04442:	6f                   	outsl  %ds:(%esi),(%dx)
  c04443:	72 3a                	jb     c0447f <yystos+0x7a>
  c04445:	20 70 6f             	and    %dh,0x6f(%eax)
  c04448:	70 70                	jo     c044ba <yystos+0xb5>
  c0444a:	69 6e 67 00 6d 65 6d 	imul   $0x6d656d00,0x67(%esi),%ebp
  c04451:	6f                   	outsl  %ds:(%esi),(%dx)
  c04452:	72 79                	jb     c044cd <yystos+0xc8>
  c04454:	20 65 78             	and    %ah,0x78(%ebp)
  c04457:	68 61 75 73 74       	push   $0x74737561
  c0445c:	65 64 00 43 6c       	gs add %al,%fs:%gs:0x6c(%ebx)
  c04461:	65                   	gs
  c04462:	61                   	popa   
  c04463:	6e                   	outsb  %ds:(%esi),(%dx)
  c04464:	75 70                	jne    c044d6 <yystos+0xd1>
  c04466:	3a 20                	cmp    (%eax),%ah
  c04468:	64 69 73 63 61 72 64 	imul   $0x69647261,%fs:0x63(%ebx),%esi
  c0446f:	69 
  c04470:	6e                   	outsb  %ds:(%esi),(%dx)
  c04471:	67 20 6c 6f          	and    %ch,0x6f(%si)
  c04475:	6f                   	outsl  %ds:(%esi),(%dx)
  c04476:	6b 61 68 65          	imul   $0x65,0x68(%ecx),%esp
  c0447a:	61                   	popa   
  c0447b:	64 00 43 6c          	add    %al,%fs:0x6c(%ebx)
  c0447f:	65                   	gs
  c04480:	61                   	popa   
  c04481:	6e                   	outsb  %ds:(%esi),(%dx)
  c04482:	75 70                	jne    c044f4 <yystos+0xef>
  c04484:	3a 20                	cmp    (%eax),%ah
  c04486:	70 6f                	jo     c044f7 <yystos+0xf2>
  c04488:	70 70                	jo     c044fa <yystos+0xf5>
  c0448a:	69 6e 67 00 00 00 19 	imul   $0x19000000,0x67(%esi),%ebp
  c04491:	05 c0 00 19 05       	add    $0x51900c0,%eax
  c04496:	c0 00 a6             	rolb   $0xa6,(%eax)
  c04499:	03 c0                	add    %eax,%eax
  c0449b:	00 c8                	add    %cl,%al
  c0449d:	03 c0                	add    %eax,%eax
  c0449f:	00 19                	add    %bl,(%ecx)
  c044a1:	05 c0 00 19 05       	add    $0x51900c0,%eax
  c044a6:	c0 00 ea             	rolb   $0xea,(%eax)
  c044a9:	03 c0                	add    %eax,%eax
  c044ab:	00 02                	add    %al,(%edx)
  c044ad:	04 c0                	add    $0xc0,%al
  c044af:	00 21                	add    %ah,(%ecx)
  c044b1:	04 c0                	add    $0xc0,%al
  c044b3:	00 55 04             	add    %dl,0x4(%ebp)
  c044b6:	c0 00 89             	rolb   $0x89,(%eax)
  c044b9:	04 c0                	add    $0xc0,%al
  c044bb:	00 ba 04 c0 00 19    	add    %bh,0x1900c004(%edx)
  c044c1:	05 c0 00 eb 04       	add    $0x4eb00c0,%eax
  c044c6:	c0 00 6c             	rolb   $0x6c,(%eax)
  c044c9:	69 73 70 20 3a 20 25 	imul   $0x25203a20,0x70(%ebx),%esi
  c044d0:	73 0a                	jae    c044dc <yystos+0xd7>
	...

00c04500 <yy_accept>:
  c04500:	00 00                	add    %al,(%eax)
  c04502:	00 00                	add    %al,(%eax)
  c04504:	00 00                	add    %al,(%eax)
  c04506:	0a 00                	or     (%eax),%al
  c04508:	08 00                	or     %al,(%eax)
  c0450a:	02 00                	add    (%eax),%al
  c0450c:	08 00                	or     %al,(%eax)
  c0450e:	03 00                	add    (%eax),%eax
  c04510:	08 00                	or     %al,(%eax)
  c04512:	06                   	push   %es
  c04513:	00 01                	add    %al,(%ecx)
  c04515:	00 08                	add    %cl,(%eax)
  c04517:	00 08                	add    %cl,(%eax)
  c04519:	00 00                	add    %al,(%eax)
  c0451b:	00 07                	add    %al,(%edi)
  c0451d:	00 08                	add    %cl,(%eax)
  c0451f:	00 05 00 08 00 06    	add    %al,0x6000800
  c04525:	00 01                	add    %al,(%ecx)
  c04527:	00 01                	add    %al,(%ecx)
  c04529:	00 07                	add    %al,(%edi)
  c0452b:	00 00                	add    %al,(%eax)
  c0452d:	00 04 00             	add    %al,(%eax,%eax,1)
	...

00c04540 <yy_ec>:
  c04540:	00 00                	add    %al,(%eax)
  c04542:	00 00                	add    %al,(%eax)
  c04544:	01 00                	add    %eax,(%eax)
  c04546:	00 00                	add    %al,(%eax)
  c04548:	01 00                	add    %eax,(%eax)
  c0454a:	00 00                	add    %al,(%eax)
  c0454c:	01 00                	add    %eax,(%eax)
  c0454e:	00 00                	add    %al,(%eax)
  c04550:	01 00                	add    %eax,(%eax)
  c04552:	00 00                	add    %al,(%eax)
  c04554:	01 00                	add    %eax,(%eax)
  c04556:	00 00                	add    %al,(%eax)
  c04558:	01 00                	add    %eax,(%eax)
  c0455a:	00 00                	add    %al,(%eax)
  c0455c:	01 00                	add    %eax,(%eax)
  c0455e:	00 00                	add    %al,(%eax)
  c04560:	01 00                	add    %eax,(%eax)
  c04562:	00 00                	add    %al,(%eax)
  c04564:	02 00                	add    (%eax),%al
  c04566:	00 00                	add    %al,(%eax)
  c04568:	03 00                	add    (%eax),%eax
  c0456a:	00 00                	add    %al,(%eax)
  c0456c:	02 00                	add    (%eax),%al
  c0456e:	00 00                	add    %al,(%eax)
  c04570:	02 00                	add    (%eax),%al
  c04572:	00 00                	add    %al,(%eax)
  c04574:	01 00                	add    %eax,(%eax)
  c04576:	00 00                	add    %al,(%eax)
  c04578:	01 00                	add    %eax,(%eax)
  c0457a:	00 00                	add    %al,(%eax)
  c0457c:	01 00                	add    %eax,(%eax)
  c0457e:	00 00                	add    %al,(%eax)
  c04580:	01 00                	add    %eax,(%eax)
  c04582:	00 00                	add    %al,(%eax)
  c04584:	01 00                	add    %eax,(%eax)
  c04586:	00 00                	add    %al,(%eax)
  c04588:	01 00                	add    %eax,(%eax)
  c0458a:	00 00                	add    %al,(%eax)
  c0458c:	01 00                	add    %eax,(%eax)
  c0458e:	00 00                	add    %al,(%eax)
  c04590:	01 00                	add    %eax,(%eax)
  c04592:	00 00                	add    %al,(%eax)
  c04594:	01 00                	add    %eax,(%eax)
  c04596:	00 00                	add    %al,(%eax)
  c04598:	01 00                	add    %eax,(%eax)
  c0459a:	00 00                	add    %al,(%eax)
  c0459c:	01 00                	add    %eax,(%eax)
  c0459e:	00 00                	add    %al,(%eax)
  c045a0:	01 00                	add    %eax,(%eax)
  c045a2:	00 00                	add    %al,(%eax)
  c045a4:	01 00                	add    %eax,(%eax)
  c045a6:	00 00                	add    %al,(%eax)
  c045a8:	01 00                	add    %eax,(%eax)
  c045aa:	00 00                	add    %al,(%eax)
  c045ac:	01 00                	add    %eax,(%eax)
  c045ae:	00 00                	add    %al,(%eax)
  c045b0:	01 00                	add    %eax,(%eax)
  c045b2:	00 00                	add    %al,(%eax)
  c045b4:	01 00                	add    %eax,(%eax)
  c045b6:	00 00                	add    %al,(%eax)
  c045b8:	01 00                	add    %eax,(%eax)
  c045ba:	00 00                	add    %al,(%eax)
  c045bc:	01 00                	add    %eax,(%eax)
  c045be:	00 00                	add    %al,(%eax)
  c045c0:	02 00                	add    (%eax),%al
  c045c2:	00 00                	add    %al,(%eax)
  c045c4:	01 00                	add    %eax,(%eax)
  c045c6:	00 00                	add    %al,(%eax)
  c045c8:	04 00                	add    $0x0,%al
  c045ca:	00 00                	add    %al,(%eax)
  c045cc:	01 00                	add    %eax,(%eax)
  c045ce:	00 00                	add    %al,(%eax)
  c045d0:	01 00                	add    %eax,(%eax)
  c045d2:	00 00                	add    %al,(%eax)
  c045d4:	01 00                	add    %eax,(%eax)
  c045d6:	00 00                	add    %al,(%eax)
  c045d8:	05 00 00 00 01       	add    $0x1000000,%eax
  c045dd:	00 00                	add    %al,(%eax)
  c045df:	00 05 00 00 00 05    	add    %al,0x5000000
  c045e5:	00 00                	add    %al,(%eax)
  c045e7:	00 01                	add    %al,(%ecx)
  c045e9:	00 00                	add    %al,(%eax)
  c045eb:	00 01                	add    %al,(%ecx)
  c045ed:	00 00                	add    %al,(%eax)
  c045ef:	00 05 00 00 00 01    	add    %al,0x1000000
  c045f5:	00 00                	add    %al,(%eax)
  c045f7:	00 01                	add    %al,(%ecx)
  c045f9:	00 00                	add    %al,(%eax)
  c045fb:	00 01                	add    %al,(%ecx)
  c045fd:	00 00                	add    %al,(%eax)
  c045ff:	00 06                	add    %al,(%esi)
  c04601:	00 00                	add    %al,(%eax)
  c04603:	00 07                	add    %al,(%edi)
  c04605:	00 00                	add    %al,(%eax)
  c04607:	00 07                	add    %al,(%edi)
  c04609:	00 00                	add    %al,(%eax)
  c0460b:	00 07                	add    %al,(%edi)
  c0460d:	00 00                	add    %al,(%eax)
  c0460f:	00 07                	add    %al,(%edi)
  c04611:	00 00                	add    %al,(%eax)
  c04613:	00 07                	add    %al,(%edi)
  c04615:	00 00                	add    %al,(%eax)
  c04617:	00 07                	add    %al,(%edi)
  c04619:	00 00                	add    %al,(%eax)
  c0461b:	00 07                	add    %al,(%edi)
  c0461d:	00 00                	add    %al,(%eax)
  c0461f:	00 08                	add    %cl,(%eax)
  c04621:	00 00                	add    %al,(%eax)
  c04623:	00 08                	add    %cl,(%eax)
  c04625:	00 00                	add    %al,(%eax)
  c04627:	00 05 00 00 00 09    	add    %al,0x9000000
  c0462d:	00 00                	add    %al,(%eax)
  c0462f:	00 01                	add    %al,(%ecx)
  c04631:	00 00                	add    %al,(%eax)
  c04633:	00 05 00 00 00 01    	add    %al,0x1000000
  c04639:	00 00                	add    %al,(%eax)
  c0463b:	00 01                	add    %al,(%ecx)
  c0463d:	00 00                	add    %al,(%eax)
  c0463f:	00 05 00 00 00 0a    	add    %al,0xa000000
  c04645:	00 00                	add    %al,(%eax)
  c04647:	00 0a                	add    %cl,(%edx)
  c04649:	00 00                	add    %al,(%eax)
  c0464b:	00 0a                	add    %cl,(%edx)
  c0464d:	00 00                	add    %al,(%eax)
  c0464f:	00 0a                	add    %cl,(%edx)
  c04651:	00 00                	add    %al,(%eax)
  c04653:	00 0a                	add    %cl,(%edx)
  c04655:	00 00                	add    %al,(%eax)
  c04657:	00 0a                	add    %cl,(%edx)
  c04659:	00 00                	add    %al,(%eax)
  c0465b:	00 01                	add    %al,(%ecx)
  c0465d:	00 00                	add    %al,(%eax)
  c0465f:	00 01                	add    %al,(%ecx)
  c04661:	00 00                	add    %al,(%eax)
  c04663:	00 01                	add    %al,(%ecx)
  c04665:	00 00                	add    %al,(%eax)
  c04667:	00 01                	add    %al,(%ecx)
  c04669:	00 00                	add    %al,(%eax)
  c0466b:	00 01                	add    %al,(%ecx)
  c0466d:	00 00                	add    %al,(%eax)
  c0466f:	00 01                	add    %al,(%ecx)
  c04671:	00 00                	add    %al,(%eax)
  c04673:	00 01                	add    %al,(%ecx)
  c04675:	00 00                	add    %al,(%eax)
  c04677:	00 01                	add    %al,(%ecx)
  c04679:	00 00                	add    %al,(%eax)
  c0467b:	00 01                	add    %al,(%ecx)
  c0467d:	00 00                	add    %al,(%eax)
  c0467f:	00 01                	add    %al,(%ecx)
  c04681:	00 00                	add    %al,(%eax)
  c04683:	00 01                	add    %al,(%ecx)
  c04685:	00 00                	add    %al,(%eax)
  c04687:	00 01                	add    %al,(%ecx)
  c04689:	00 00                	add    %al,(%eax)
  c0468b:	00 01                	add    %al,(%ecx)
  c0468d:	00 00                	add    %al,(%eax)
  c0468f:	00 01                	add    %al,(%ecx)
  c04691:	00 00                	add    %al,(%eax)
  c04693:	00 01                	add    %al,(%ecx)
  c04695:	00 00                	add    %al,(%eax)
  c04697:	00 01                	add    %al,(%ecx)
  c04699:	00 00                	add    %al,(%eax)
  c0469b:	00 01                	add    %al,(%ecx)
  c0469d:	00 00                	add    %al,(%eax)
  c0469f:	00 0b                	add    %cl,(%ebx)
  c046a1:	00 00                	add    %al,(%eax)
  c046a3:	00 01                	add    %al,(%ecx)
  c046a5:	00 00                	add    %al,(%eax)
  c046a7:	00 01                	add    %al,(%ecx)
  c046a9:	00 00                	add    %al,(%eax)
  c046ab:	00 01                	add    %al,(%ecx)
  c046ad:	00 00                	add    %al,(%eax)
  c046af:	00 0c 00             	add    %cl,(%eax,%eax,1)
  c046b2:	00 00                	add    %al,(%eax)
  c046b4:	01 00                	add    %eax,(%eax)
  c046b6:	00 00                	add    %al,(%eax)
  c046b8:	01 00                	add    %eax,(%eax)
  c046ba:	00 00                	add    %al,(%eax)
  c046bc:	01 00                	add    %eax,(%eax)
  c046be:	00 00                	add    %al,(%eax)
  c046c0:	05 00 00 00 0a       	add    $0xa000000,%eax
  c046c5:	00 00                	add    %al,(%eax)
  c046c7:	00 0a                	add    %cl,(%edx)
  c046c9:	00 00                	add    %al,(%eax)
  c046cb:	00 0a                	add    %cl,(%edx)
  c046cd:	00 00                	add    %al,(%eax)
  c046cf:	00 0a                	add    %cl,(%edx)
  c046d1:	00 00                	add    %al,(%eax)
  c046d3:	00 0a                	add    %cl,(%edx)
  c046d5:	00 00                	add    %al,(%eax)
  c046d7:	00 0a                	add    %cl,(%edx)
  c046d9:	00 00                	add    %al,(%eax)
  c046db:	00 01                	add    %al,(%ecx)
  c046dd:	00 00                	add    %al,(%eax)
  c046df:	00 01                	add    %al,(%ecx)
  c046e1:	00 00                	add    %al,(%eax)
  c046e3:	00 01                	add    %al,(%ecx)
  c046e5:	00 00                	add    %al,(%eax)
  c046e7:	00 01                	add    %al,(%ecx)
  c046e9:	00 00                	add    %al,(%eax)
  c046eb:	00 01                	add    %al,(%ecx)
  c046ed:	00 00                	add    %al,(%eax)
  c046ef:	00 01                	add    %al,(%ecx)
  c046f1:	00 00                	add    %al,(%eax)
  c046f3:	00 01                	add    %al,(%ecx)
  c046f5:	00 00                	add    %al,(%eax)
  c046f7:	00 01                	add    %al,(%ecx)
  c046f9:	00 00                	add    %al,(%eax)
  c046fb:	00 01                	add    %al,(%ecx)
  c046fd:	00 00                	add    %al,(%eax)
  c046ff:	00 01                	add    %al,(%ecx)
  c04701:	00 00                	add    %al,(%eax)
  c04703:	00 01                	add    %al,(%ecx)
  c04705:	00 00                	add    %al,(%eax)
  c04707:	00 01                	add    %al,(%ecx)
  c04709:	00 00                	add    %al,(%eax)
  c0470b:	00 01                	add    %al,(%ecx)
  c0470d:	00 00                	add    %al,(%eax)
  c0470f:	00 01                	add    %al,(%ecx)
  c04711:	00 00                	add    %al,(%eax)
  c04713:	00 01                	add    %al,(%ecx)
  c04715:	00 00                	add    %al,(%eax)
  c04717:	00 01                	add    %al,(%ecx)
  c04719:	00 00                	add    %al,(%eax)
  c0471b:	00 01                	add    %al,(%ecx)
  c0471d:	00 00                	add    %al,(%eax)
  c0471f:	00 0b                	add    %cl,(%ebx)
  c04721:	00 00                	add    %al,(%eax)
  c04723:	00 01                	add    %al,(%ecx)
  c04725:	00 00                	add    %al,(%eax)
  c04727:	00 01                	add    %al,(%ecx)
  c04729:	00 00                	add    %al,(%eax)
  c0472b:	00 01                	add    %al,(%ecx)
  c0472d:	00 00                	add    %al,(%eax)
  c0472f:	00 01                	add    %al,(%ecx)
  c04731:	00 00                	add    %al,(%eax)
  c04733:	00 01                	add    %al,(%ecx)
  c04735:	00 00                	add    %al,(%eax)
  c04737:	00 01                	add    %al,(%ecx)
  c04739:	00 00                	add    %al,(%eax)
  c0473b:	00 01                	add    %al,(%ecx)
  c0473d:	00 00                	add    %al,(%eax)
  c0473f:	00 01                	add    %al,(%ecx)
  c04741:	00 00                	add    %al,(%eax)
  c04743:	00 01                	add    %al,(%ecx)
  c04745:	00 00                	add    %al,(%eax)
  c04747:	00 01                	add    %al,(%ecx)
  c04749:	00 00                	add    %al,(%eax)
  c0474b:	00 01                	add    %al,(%ecx)
  c0474d:	00 00                	add    %al,(%eax)
  c0474f:	00 01                	add    %al,(%ecx)
  c04751:	00 00                	add    %al,(%eax)
  c04753:	00 01                	add    %al,(%ecx)
  c04755:	00 00                	add    %al,(%eax)
  c04757:	00 01                	add    %al,(%ecx)
  c04759:	00 00                	add    %al,(%eax)
  c0475b:	00 01                	add    %al,(%ecx)
  c0475d:	00 00                	add    %al,(%eax)
  c0475f:	00 01                	add    %al,(%ecx)
  c04761:	00 00                	add    %al,(%eax)
  c04763:	00 01                	add    %al,(%ecx)
  c04765:	00 00                	add    %al,(%eax)
  c04767:	00 01                	add    %al,(%ecx)
  c04769:	00 00                	add    %al,(%eax)
  c0476b:	00 01                	add    %al,(%ecx)
  c0476d:	00 00                	add    %al,(%eax)
  c0476f:	00 01                	add    %al,(%ecx)
  c04771:	00 00                	add    %al,(%eax)
  c04773:	00 01                	add    %al,(%ecx)
  c04775:	00 00                	add    %al,(%eax)
  c04777:	00 01                	add    %al,(%ecx)
  c04779:	00 00                	add    %al,(%eax)
  c0477b:	00 01                	add    %al,(%ecx)
  c0477d:	00 00                	add    %al,(%eax)
  c0477f:	00 01                	add    %al,(%ecx)
  c04781:	00 00                	add    %al,(%eax)
  c04783:	00 01                	add    %al,(%ecx)
  c04785:	00 00                	add    %al,(%eax)
  c04787:	00 01                	add    %al,(%ecx)
  c04789:	00 00                	add    %al,(%eax)
  c0478b:	00 01                	add    %al,(%ecx)
  c0478d:	00 00                	add    %al,(%eax)
  c0478f:	00 01                	add    %al,(%ecx)
  c04791:	00 00                	add    %al,(%eax)
  c04793:	00 01                	add    %al,(%ecx)
  c04795:	00 00                	add    %al,(%eax)
  c04797:	00 01                	add    %al,(%ecx)
  c04799:	00 00                	add    %al,(%eax)
  c0479b:	00 01                	add    %al,(%ecx)
  c0479d:	00 00                	add    %al,(%eax)
  c0479f:	00 01                	add    %al,(%ecx)
  c047a1:	00 00                	add    %al,(%eax)
  c047a3:	00 01                	add    %al,(%ecx)
  c047a5:	00 00                	add    %al,(%eax)
  c047a7:	00 01                	add    %al,(%ecx)
  c047a9:	00 00                	add    %al,(%eax)
  c047ab:	00 01                	add    %al,(%ecx)
  c047ad:	00 00                	add    %al,(%eax)
  c047af:	00 01                	add    %al,(%ecx)
  c047b1:	00 00                	add    %al,(%eax)
  c047b3:	00 01                	add    %al,(%ecx)
  c047b5:	00 00                	add    %al,(%eax)
  c047b7:	00 01                	add    %al,(%ecx)
  c047b9:	00 00                	add    %al,(%eax)
  c047bb:	00 01                	add    %al,(%ecx)
  c047bd:	00 00                	add    %al,(%eax)
  c047bf:	00 01                	add    %al,(%ecx)
  c047c1:	00 00                	add    %al,(%eax)
  c047c3:	00 01                	add    %al,(%ecx)
  c047c5:	00 00                	add    %al,(%eax)
  c047c7:	00 01                	add    %al,(%ecx)
  c047c9:	00 00                	add    %al,(%eax)
  c047cb:	00 01                	add    %al,(%ecx)
  c047cd:	00 00                	add    %al,(%eax)
  c047cf:	00 01                	add    %al,(%ecx)
  c047d1:	00 00                	add    %al,(%eax)
  c047d3:	00 01                	add    %al,(%ecx)
  c047d5:	00 00                	add    %al,(%eax)
  c047d7:	00 01                	add    %al,(%ecx)
  c047d9:	00 00                	add    %al,(%eax)
  c047db:	00 01                	add    %al,(%ecx)
  c047dd:	00 00                	add    %al,(%eax)
  c047df:	00 01                	add    %al,(%ecx)
  c047e1:	00 00                	add    %al,(%eax)
  c047e3:	00 01                	add    %al,(%ecx)
  c047e5:	00 00                	add    %al,(%eax)
  c047e7:	00 01                	add    %al,(%ecx)
  c047e9:	00 00                	add    %al,(%eax)
  c047eb:	00 01                	add    %al,(%ecx)
  c047ed:	00 00                	add    %al,(%eax)
  c047ef:	00 01                	add    %al,(%ecx)
  c047f1:	00 00                	add    %al,(%eax)
  c047f3:	00 01                	add    %al,(%ecx)
  c047f5:	00 00                	add    %al,(%eax)
  c047f7:	00 01                	add    %al,(%ecx)
  c047f9:	00 00                	add    %al,(%eax)
  c047fb:	00 01                	add    %al,(%ecx)
  c047fd:	00 00                	add    %al,(%eax)
  c047ff:	00 01                	add    %al,(%ecx)
  c04801:	00 00                	add    %al,(%eax)
  c04803:	00 01                	add    %al,(%ecx)
  c04805:	00 00                	add    %al,(%eax)
  c04807:	00 01                	add    %al,(%ecx)
  c04809:	00 00                	add    %al,(%eax)
  c0480b:	00 01                	add    %al,(%ecx)
  c0480d:	00 00                	add    %al,(%eax)
  c0480f:	00 01                	add    %al,(%ecx)
  c04811:	00 00                	add    %al,(%eax)
  c04813:	00 01                	add    %al,(%ecx)
  c04815:	00 00                	add    %al,(%eax)
  c04817:	00 01                	add    %al,(%ecx)
  c04819:	00 00                	add    %al,(%eax)
  c0481b:	00 01                	add    %al,(%ecx)
  c0481d:	00 00                	add    %al,(%eax)
  c0481f:	00 01                	add    %al,(%ecx)
  c04821:	00 00                	add    %al,(%eax)
  c04823:	00 01                	add    %al,(%ecx)
  c04825:	00 00                	add    %al,(%eax)
  c04827:	00 01                	add    %al,(%ecx)
  c04829:	00 00                	add    %al,(%eax)
  c0482b:	00 01                	add    %al,(%ecx)
  c0482d:	00 00                	add    %al,(%eax)
  c0482f:	00 01                	add    %al,(%ecx)
  c04831:	00 00                	add    %al,(%eax)
  c04833:	00 01                	add    %al,(%ecx)
  c04835:	00 00                	add    %al,(%eax)
  c04837:	00 01                	add    %al,(%ecx)
  c04839:	00 00                	add    %al,(%eax)
  c0483b:	00 01                	add    %al,(%ecx)
  c0483d:	00 00                	add    %al,(%eax)
  c0483f:	00 01                	add    %al,(%ecx)
  c04841:	00 00                	add    %al,(%eax)
  c04843:	00 01                	add    %al,(%ecx)
  c04845:	00 00                	add    %al,(%eax)
  c04847:	00 01                	add    %al,(%ecx)
  c04849:	00 00                	add    %al,(%eax)
  c0484b:	00 01                	add    %al,(%ecx)
  c0484d:	00 00                	add    %al,(%eax)
  c0484f:	00 01                	add    %al,(%ecx)
  c04851:	00 00                	add    %al,(%eax)
  c04853:	00 01                	add    %al,(%ecx)
  c04855:	00 00                	add    %al,(%eax)
  c04857:	00 01                	add    %al,(%ecx)
  c04859:	00 00                	add    %al,(%eax)
  c0485b:	00 01                	add    %al,(%ecx)
  c0485d:	00 00                	add    %al,(%eax)
  c0485f:	00 01                	add    %al,(%ecx)
  c04861:	00 00                	add    %al,(%eax)
  c04863:	00 01                	add    %al,(%ecx)
  c04865:	00 00                	add    %al,(%eax)
  c04867:	00 01                	add    %al,(%ecx)
  c04869:	00 00                	add    %al,(%eax)
  c0486b:	00 01                	add    %al,(%ecx)
  c0486d:	00 00                	add    %al,(%eax)
  c0486f:	00 01                	add    %al,(%ecx)
  c04871:	00 00                	add    %al,(%eax)
  c04873:	00 01                	add    %al,(%ecx)
  c04875:	00 00                	add    %al,(%eax)
  c04877:	00 01                	add    %al,(%ecx)
  c04879:	00 00                	add    %al,(%eax)
  c0487b:	00 01                	add    %al,(%ecx)
  c0487d:	00 00                	add    %al,(%eax)
  c0487f:	00 01                	add    %al,(%ecx)
  c04881:	00 00                	add    %al,(%eax)
  c04883:	00 01                	add    %al,(%ecx)
  c04885:	00 00                	add    %al,(%eax)
  c04887:	00 01                	add    %al,(%ecx)
  c04889:	00 00                	add    %al,(%eax)
  c0488b:	00 01                	add    %al,(%ecx)
  c0488d:	00 00                	add    %al,(%eax)
  c0488f:	00 01                	add    %al,(%ecx)
  c04891:	00 00                	add    %al,(%eax)
  c04893:	00 01                	add    %al,(%ecx)
  c04895:	00 00                	add    %al,(%eax)
  c04897:	00 01                	add    %al,(%ecx)
  c04899:	00 00                	add    %al,(%eax)
  c0489b:	00 01                	add    %al,(%ecx)
  c0489d:	00 00                	add    %al,(%eax)
  c0489f:	00 01                	add    %al,(%ecx)
  c048a1:	00 00                	add    %al,(%eax)
  c048a3:	00 01                	add    %al,(%ecx)
  c048a5:	00 00                	add    %al,(%eax)
  c048a7:	00 01                	add    %al,(%ecx)
  c048a9:	00 00                	add    %al,(%eax)
  c048ab:	00 01                	add    %al,(%ecx)
  c048ad:	00 00                	add    %al,(%eax)
  c048af:	00 01                	add    %al,(%ecx)
  c048b1:	00 00                	add    %al,(%eax)
  c048b3:	00 01                	add    %al,(%ecx)
  c048b5:	00 00                	add    %al,(%eax)
  c048b7:	00 01                	add    %al,(%ecx)
  c048b9:	00 00                	add    %al,(%eax)
  c048bb:	00 01                	add    %al,(%ecx)
  c048bd:	00 00                	add    %al,(%eax)
  c048bf:	00 01                	add    %al,(%ecx)
  c048c1:	00 00                	add    %al,(%eax)
  c048c3:	00 01                	add    %al,(%ecx)
  c048c5:	00 00                	add    %al,(%eax)
  c048c7:	00 01                	add    %al,(%ecx)
  c048c9:	00 00                	add    %al,(%eax)
  c048cb:	00 01                	add    %al,(%ecx)
  c048cd:	00 00                	add    %al,(%eax)
  c048cf:	00 01                	add    %al,(%ecx)
  c048d1:	00 00                	add    %al,(%eax)
  c048d3:	00 01                	add    %al,(%ecx)
  c048d5:	00 00                	add    %al,(%eax)
  c048d7:	00 01                	add    %al,(%ecx)
  c048d9:	00 00                	add    %al,(%eax)
  c048db:	00 01                	add    %al,(%ecx)
  c048dd:	00 00                	add    %al,(%eax)
  c048df:	00 01                	add    %al,(%ecx)
  c048e1:	00 00                	add    %al,(%eax)
  c048e3:	00 01                	add    %al,(%ecx)
  c048e5:	00 00                	add    %al,(%eax)
  c048e7:	00 01                	add    %al,(%ecx)
  c048e9:	00 00                	add    %al,(%eax)
  c048eb:	00 01                	add    %al,(%ecx)
  c048ed:	00 00                	add    %al,(%eax)
  c048ef:	00 01                	add    %al,(%ecx)
  c048f1:	00 00                	add    %al,(%eax)
  c048f3:	00 01                	add    %al,(%ecx)
  c048f5:	00 00                	add    %al,(%eax)
  c048f7:	00 01                	add    %al,(%ecx)
  c048f9:	00 00                	add    %al,(%eax)
  c048fb:	00 01                	add    %al,(%ecx)
  c048fd:	00 00                	add    %al,(%eax)
  c048ff:	00 01                	add    %al,(%ecx)
  c04901:	00 00                	add    %al,(%eax)
  c04903:	00 01                	add    %al,(%ecx)
  c04905:	00 00                	add    %al,(%eax)
  c04907:	00 01                	add    %al,(%ecx)
  c04909:	00 00                	add    %al,(%eax)
  c0490b:	00 01                	add    %al,(%ecx)
  c0490d:	00 00                	add    %al,(%eax)
  c0490f:	00 01                	add    %al,(%ecx)
  c04911:	00 00                	add    %al,(%eax)
  c04913:	00 01                	add    %al,(%ecx)
  c04915:	00 00                	add    %al,(%eax)
  c04917:	00 01                	add    %al,(%ecx)
  c04919:	00 00                	add    %al,(%eax)
  c0491b:	00 01                	add    %al,(%ecx)
  c0491d:	00 00                	add    %al,(%eax)
  c0491f:	00 01                	add    %al,(%ecx)
  c04921:	00 00                	add    %al,(%eax)
  c04923:	00 01                	add    %al,(%ecx)
  c04925:	00 00                	add    %al,(%eax)
  c04927:	00 01                	add    %al,(%ecx)
  c04929:	00 00                	add    %al,(%eax)
  c0492b:	00 01                	add    %al,(%ecx)
  c0492d:	00 00                	add    %al,(%eax)
  c0492f:	00 01                	add    %al,(%ecx)
  c04931:	00 00                	add    %al,(%eax)
  c04933:	00 01                	add    %al,(%ecx)
  c04935:	00 00                	add    %al,(%eax)
  c04937:	00 01                	add    %al,(%ecx)
  c04939:	00 00                	add    %al,(%eax)
  c0493b:	00 01                	add    %al,(%ecx)
  c0493d:	00 00                	add    %al,(%eax)
	...

00c04940 <yy_meta>:
  c04940:	00 00                	add    %al,(%eax)
  c04942:	00 00                	add    %al,(%eax)
  c04944:	01 00                	add    %eax,(%eax)
  c04946:	00 00                	add    %al,(%eax)
  c04948:	02 00                	add    (%eax),%al
  c0494a:	00 00                	add    %al,(%eax)
  c0494c:	03 00                	add    (%eax),%eax
  c0494e:	00 00                	add    %al,(%eax)
  c04950:	01 00                	add    %eax,(%eax)
  c04952:	00 00                	add    %al,(%eax)
  c04954:	02 00                	add    (%eax),%al
  c04956:	00 00                	add    %al,(%eax)
  c04958:	01 00                	add    %eax,(%eax)
  c0495a:	00 00                	add    %al,(%eax)
  c0495c:	01 00                	add    %eax,(%eax)
  c0495e:	00 00                	add    %al,(%eax)
  c04960:	01 00                	add    %eax,(%eax)
  c04962:	00 00                	add    %al,(%eax)
  c04964:	01 00                	add    %eax,(%eax)
  c04966:	00 00                	add    %al,(%eax)
  c04968:	01 00                	add    %eax,(%eax)
  c0496a:	00 00                	add    %al,(%eax)
  c0496c:	01 00                	add    %eax,(%eax)
  c0496e:	00 00                	add    %al,(%eax)
  c04970:	01 00                	add    %eax,(%eax)
	...

00c04980 <yy_base>:
  c04980:	00 00                	add    %al,(%eax)
  c04982:	00 00                	add    %al,(%eax)
  c04984:	00 00                	add    %al,(%eax)
  c04986:	12 00                	adc    (%eax),%al
  c04988:	00 00                	add    %al,(%eax)
  c0498a:	4e                   	dec    %esi
  c0498b:	00 0b                	add    %cl,(%ebx)
  c0498d:	00 4e 00             	add    %cl,0x0(%esi)
  c04990:	12 00                	adc    (%eax),%al
  c04992:	18 00                	sbb    %al,(%eax)
  c04994:	1f                   	pop    %ds
  c04995:	00 00                	add    %al,(%eax)
  c04997:	00 23                	add    %ah,(%ebx)
  c04999:	00 2c 00             	add    %ch,(%eax,%eax,1)
  c0499c:	00 00                	add    %al,(%eax)
  c0499e:	37                   	aaa    
  c0499f:	00 06                	add    %al,(%esi)
  c049a1:	00 37                	add    %dh,(%edi)
  c049a3:	00 00                	add    %al,(%eax)
  c049a5:	00 40 00             	add    %al,0x0(%eax)
  c049a8:	00 00                	add    %al,(%eax)
  c049aa:	4e                   	dec    %esi
  c049ab:	00 00                	add    %al,(%eax)
  c049ad:	00 00                	add    %al,(%eax)
  c049af:	00 4e 00             	add    %cl,0x0(%esi)
  c049b2:	0d 00 45 00 47       	or     $0x47004500,%eax
  c049b7:	00 49 00             	add    %cl,0x0(%ecx)
  c049ba:	4b                   	dec    %ebx
  c049bb:	00 00                	add    %al,(%eax)
  c049bd:	00 00                	add    %al,(%eax)
	...

00c049c0 <yy_def>:
  c049c0:	00 00                	add    %al,(%eax)
  c049c2:	18 00                	sbb    %al,(%eax)
  c049c4:	01 00                	add    %eax,(%eax)
  c049c6:	18 00                	sbb    %al,(%eax)
  c049c8:	19 00                	sbb    %eax,(%eax)
  c049ca:	18 00                	sbb    %al,(%eax)
  c049cc:	1a 00                	sbb    (%eax),%al
  c049ce:	18 00                	sbb    %al,(%eax)
  c049d0:	19 00                	sbb    %eax,(%eax)
  c049d2:	19 00                	sbb    %eax,(%eax)
  c049d4:	1b 00                	sbb    (%eax),%eax
  c049d6:	19 00                	sbb    %eax,(%eax)
  c049d8:	1a 00                	sbb    (%eax),%al
  c049da:	1c 00                	sbb    $0x0,%al
  c049dc:	19 00                	sbb    %eax,(%eax)
  c049de:	1a 00                	sbb    (%eax),%al
  c049e0:	08 00                	or     %al,(%eax)
  c049e2:	19 00                	sbb    %eax,(%eax)
  c049e4:	09 00                	or     %eax,(%eax)
  c049e6:	1b 00                	sbb    (%eax),%eax
  c049e8:	1d 00 18 00 1c       	sbb    $0x1c001800,%eax
  c049ed:	00 11                	add    %dl,(%ecx)
  c049ef:	00 00                	add    %al,(%eax)
  c049f1:	00 18                	add    %bl,(%eax)
  c049f3:	00 18                	add    %bl,(%eax)
  c049f5:	00 18                	add    %bl,(%eax)
  c049f7:	00 18                	add    %bl,(%eax)
  c049f9:	00 18                	add    %bl,(%eax)
  c049fb:	00 00                	add    %al,(%eax)
  c049fd:	00 00                	add    %al,(%eax)
	...

00c04a00 <yy_nxt>:
  c04a00:	00 00                	add    %al,(%eax)
  c04a02:	04 00                	add    $0x0,%al
  c04a04:	05 00 05 00 06       	add    $0x6000500,%eax
  c04a09:	00 07                	add    %al,(%edi)
  c04a0b:	00 08                	add    %cl,(%eax)
  c04a0d:	00 09                	add    %cl,(%ecx)
  c04a0f:	00 09                	add    %cl,(%ecx)
  c04a11:	00 0a                	add    %cl,(%edx)
  c04a13:	00 04 00             	add    %al,(%eax,%eax,1)
  c04a16:	04 00                	add    $0x0,%al
  c04a18:	04 00                	add    $0x0,%al
  c04a1a:	0d 00 0b 00 0e       	or     $0xe000b00,%eax
  c04a1f:	00 0d 00 0b 00 18    	add    %cl,0x18000b00
  c04a25:	00 18                	add    %bl,(%eax)
  c04a27:	00 18                	add    %bl,(%eax)
  c04a29:	00 18                	add    %bl,(%eax)
  c04a2b:	00 18                	add    %bl,(%eax)
  c04a2d:	00 0f                	add    %cl,(%edi)
  c04a2f:	00 10                	add    %dl,(%eax)
  c04a31:	00 10                	add    %dl,(%eax)
  c04a33:	00 18                	add    %bl,(%eax)
  c04a35:	00 18                	add    %bl,(%eax)
  c04a37:	00 18                	add    %bl,(%eax)
  c04a39:	00 11                	add    %dl,(%ecx)
  c04a3b:	00 12                	add    %dl,(%edx)
  c04a3d:	00 12                	add    %dl,(%edx)
  c04a3f:	00 12                	add    %dl,(%edx)
  c04a41:	00 14 00             	add    %dl,(%eax,%eax,1)
  c04a44:	18 00                	sbb    %al,(%eax)
  c04a46:	18 00                	sbb    %al,(%eax)
  c04a48:	14 00                	adc    $0x0,%al
  c04a4a:	0d 00 18 00 0e       	or     $0xe001800,%eax
  c04a4f:	00 0d 00 18 00 18    	add    %cl,0x18001800
  c04a55:	00 18                	add    %bl,(%eax)
  c04a57:	00 18                	add    %bl,(%eax)
  c04a59:	00 18                	add    %bl,(%eax)
  c04a5b:	00 18                	add    %bl,(%eax)
  c04a5d:	00 0f                	add    %cl,(%edi)
  c04a5f:	00 15 00 18 00 18    	add    %dl,0x18001800
  c04a65:	00 18                	add    %bl,(%eax)
  c04a67:	00 18                	add    %bl,(%eax)
  c04a69:	00 18                	add    %bl,(%eax)
  c04a6b:	00 18                	add    %bl,(%eax)
  c04a6d:	00 18                	add    %bl,(%eax)
  c04a6f:	00 16                	add    %dl,(%esi)
  c04a71:	00 0d 00 18 00 18    	add    %cl,0x18001800
  c04a77:	00 0d 00 17 00 17    	add    %cl,0x17001700
  c04a7d:	00 17                	add    %dl,(%edi)
  c04a7f:	00 18                	add    %bl,(%eax)
  c04a81:	00 17                	add    %dl,(%edi)
  c04a83:	00 14 00             	add    %dl,(%eax,%eax,1)
  c04a86:	18 00                	sbb    %al,(%eax)
  c04a88:	18 00                	sbb    %al,(%eax)
  c04a8a:	14 00                	adc    $0x0,%al
  c04a8c:	0c 00                	or     $0x0,%al
  c04a8e:	0c 00                	or     $0x0,%al
  c04a90:	13 00                	adc    (%eax),%eax
  c04a92:	13 00                	adc    (%eax),%eax
  c04a94:	0d 00 0d 00 14       	or     $0x14000d00,%eax
  c04a99:	00 14 00             	add    %dl,(%eax,%eax,1)
  c04a9c:	03 00                	add    (%eax),%eax
  c04a9e:	18 00                	sbb    %al,(%eax)
  c04aa0:	18 00                	sbb    %al,(%eax)
  c04aa2:	18 00                	sbb    %al,(%eax)
  c04aa4:	18 00                	sbb    %al,(%eax)
  c04aa6:	18 00                	sbb    %al,(%eax)
  c04aa8:	18 00                	sbb    %al,(%eax)
  c04aaa:	18 00                	sbb    %al,(%eax)
  c04aac:	18 00                	sbb    %al,(%eax)
  c04aae:	18 00                	sbb    %al,(%eax)
  c04ab0:	18 00                	sbb    %al,(%eax)
  c04ab2:	18 00                	sbb    %al,(%eax)
  c04ab4:	18 00                	sbb    %al,(%eax)
	...

00c04ac0 <yy_chk>:
  c04ac0:	00 00                	add    %al,(%eax)
  c04ac2:	01 00                	add    %eax,(%eax)
  c04ac4:	01 00                	add    %eax,(%eax)
  c04ac6:	01 00                	add    %eax,(%eax)
  c04ac8:	01 00                	add    %eax,(%eax)
  c04aca:	01 00                	add    %eax,(%eax)
  c04acc:	01 00                	add    %eax,(%eax)
  c04ace:	01 00                	add    %eax,(%eax)
  c04ad0:	01 00                	add    %eax,(%eax)
  c04ad2:	01 00                	add    %eax,(%eax)
  c04ad4:	01 00                	add    %eax,(%eax)
  c04ad6:	01 00                	add    %eax,(%eax)
  c04ad8:	01 00                	add    %eax,(%eax)
  c04ada:	06                   	push   %es
  c04adb:	00 19                	add    %bl,(%ecx)
  c04add:	00 06                	add    %al,(%esi)
  c04adf:	00 06                	add    %al,(%esi)
  c04ae1:	00 10                	add    %dl,(%eax)
  c04ae3:	00 03                	add    %al,(%ebx)
	...
  c04aed:	00 06                	add    %al,(%esi)
  c04aef:	00 08                	add    %cl,(%eax)
  c04af1:	00 08                	add    %cl,(%eax)
  c04af3:	00 00                	add    %al,(%eax)
  c04af5:	00 00                	add    %al,(%eax)
  c04af7:	00 00                	add    %al,(%eax)
  c04af9:	00 08                	add    %cl,(%eax)
  c04afb:	00 09                	add    %cl,(%ecx)
  c04afd:	00 09                	add    %cl,(%ecx)
  c04aff:	00 09                	add    %cl,(%ecx)
  c04b01:	00 0a                	add    %cl,(%edx)
  c04b03:	00 00                	add    %al,(%eax)
  c04b05:	00 00                	add    %al,(%eax)
  c04b07:	00 0a                	add    %cl,(%edx)
  c04b09:	00 0c 00             	add    %cl,(%eax,%eax,1)
  c04b0c:	00 00                	add    %al,(%eax)
  c04b0e:	0c 00                	or     $0x0,%al
  c04b10:	0c 00                	or     $0x0,%al
	...
  c04b1e:	0c 00                	or     $0x0,%al
  c04b20:	0d 00 00 00 00       	or     $0x0,%eax
	...
  c04b2d:	00 00                	add    %al,(%eax)
  c04b2f:	00 0d 00 0f 00 00    	add    %cl,0xf00
  c04b35:	00 00                	add    %al,(%eax)
  c04b37:	00 0f                	add    %cl,(%edi)
  c04b39:	00 11                	add    %dl,(%ecx)
  c04b3b:	00 11                	add    %dl,(%ecx)
  c04b3d:	00 11                	add    %dl,(%ecx)
  c04b3f:	00 00                	add    %al,(%eax)
  c04b41:	00 11                	add    %dl,(%ecx)
  c04b43:	00 13                	add    %dl,(%ebx)
  c04b45:	00 00                	add    %al,(%eax)
  c04b47:	00 00                	add    %al,(%eax)
  c04b49:	00 13                	add    %dl,(%ebx)
  c04b4b:	00 1a                	add    %bl,(%edx)
  c04b4d:	00 1a                	add    %bl,(%edx)
  c04b4f:	00 1b                	add    %bl,(%ebx)
  c04b51:	00 1b                	add    %bl,(%ebx)
  c04b53:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c04b56:	1c 00                	sbb    $0x0,%al
  c04b58:	1d 00 1d 00 18       	sbb    $0x18001d00,%eax
  c04b5d:	00 18                	add    %bl,(%eax)
  c04b5f:	00 18                	add    %bl,(%eax)
  c04b61:	00 18                	add    %bl,(%eax)
  c04b63:	00 18                	add    %bl,(%eax)
  c04b65:	00 18                	add    %bl,(%eax)
  c04b67:	00 18                	add    %bl,(%eax)
  c04b69:	00 18                	add    %bl,(%eax)
  c04b6b:	00 18                	add    %bl,(%eax)
  c04b6d:	00 18                	add    %bl,(%eax)
  c04b6f:	00 18                	add    %bl,(%eax)
  c04b71:	00 18                	add    %bl,(%eax)
  c04b73:	00 18                	add    %bl,(%eax)
	...

00c04b80 <yy_rule_can_match_eol>:
	...
  c04b88:	01 00                	add    %eax,(%eax)
	...
  c04ba6:	00 00                	add    %al,(%eax)
  c04ba8:	66                   	data16
  c04ba9:	6c                   	insb   (%dx),%es:(%edi)
  c04baa:	65                   	gs
  c04bab:	78 20                	js     c04bcd <yy_rule_can_match_eol+0x4d>
  c04bad:	73 63                	jae    c04c12 <yy_rule_can_match_eol+0x92>
  c04baf:	61                   	popa   
  c04bb0:	6e                   	outsb  %ds:(%esi),(%dx)
  c04bb1:	6e                   	outsb  %ds:(%esi),(%dx)
  c04bb2:	65                   	gs
  c04bb3:	72 20                	jb     c04bd5 <yy_rule_can_match_eol+0x55>
  c04bb5:	6a 61                	push   $0x61
  c04bb7:	6d                   	insl   (%dx),%es:(%edi)
  c04bb8:	6d                   	insl   (%dx),%es:(%edi)
  c04bb9:	65 64 00 66 61       	gs add %ah,%fs:%gs:0x61(%esi)
  c04bbe:	74 61                	je     c04c21 <yy_rule_can_match_eol+0xa1>
  c04bc0:	6c                   	insb   (%dx),%es:(%edi)
  c04bc1:	20 66 6c             	and    %ah,0x6c(%esi)
  c04bc4:	65                   	gs
  c04bc5:	78 20                	js     c04be7 <yy_rule_can_match_eol+0x67>
  c04bc7:	73 63                	jae    c04c2c <yy_rule_can_match_eol+0xac>
  c04bc9:	61                   	popa   
  c04bca:	6e                   	outsb  %ds:(%esi),(%dx)
  c04bcb:	6e                   	outsb  %ds:(%esi),(%dx)
  c04bcc:	65                   	gs
  c04bcd:	72 20                	jb     c04bef <yy_rule_can_match_eol+0x6f>
  c04bcf:	69 6e 74 65 72 6e 61 	imul   $0x616e7265,0x74(%esi),%ebp
  c04bd6:	6c                   	insb   (%dx),%es:(%edi)
  c04bd7:	20 65 72             	and    %ah,0x72(%ebp)
  c04bda:	72 6f                	jb     c04c4b <yy_rule_can_match_eol+0xcb>
  c04bdc:	72 2d                	jb     c04c0b <yy_rule_can_match_eol+0x8b>
  c04bde:	2d 6e 6f 20 61       	sub    $0x61206f6e,%eax
  c04be3:	63 74 69 6f          	arpl   %si,0x6f(%ecx,%ebp,2)
  c04be7:	6e                   	outsb  %ds:(%esi),(%dx)
  c04be8:	20 66 6f             	and    %ah,0x6f(%esi)
  c04beb:	75 6e                	jne    c04c5b <yy_rule_can_match_eol+0xdb>
  c04bed:	64 00 00             	add    %al,%fs:(%eax)
  c04bf0:	d2 0a                	rorb   %cl,(%edx)
  c04bf2:	c0 00 b6             	rolb   $0xb6,(%eax)
  c04bf5:	0d c0 00 b6 0d       	or     $0xdb600c0,%eax
  c04bfa:	c0 00 ec             	rolb   $0xec,(%eax)
  c04bfd:	0a c0                	or     %al,%al
  c04bff:	00 fc                	add    %bh,%ah
  c04c01:	0a c0                	or     %al,%al
  c04c03:	00 1c 0b             	add    %bl,(%ebx,%ecx,1)
  c04c06:	c0 00 3c             	rolb   $0x3c,(%eax)
  c04c09:	0b c0                	or     %eax,%eax
  c04c0b:	00 5c 0b c0          	add    %bl,-0x40(%ebx,%ecx,1)
  c04c0f:	00 92 0b c0 00 b2    	add    %dl,-0x4dff3ff5(%edx)
  c04c15:	0b c0                	or     %eax,%eax
  c04c17:	00 d1                	add    %dl,%cl
  c04c19:	0b c0                	or     %eax,%eax
  c04c1b:	00 c7                	add    %al,%bh
  c04c1d:	0b c0                	or     %eax,%eax
  c04c1f:	00 66 61             	add    %ah,0x61(%esi)
  c04c22:	74 61                	je     c04c85 <yy_rule_can_match_eol+0x105>
  c04c24:	6c                   	insb   (%dx),%es:(%edi)
  c04c25:	20 66 6c             	and    %ah,0x6c(%esi)
  c04c28:	65                   	gs
  c04c29:	78 20                	js     c04c4b <yy_rule_can_match_eol+0xcb>
  c04c2b:	73 63                	jae    c04c90 <yy_rule_can_match_eol+0x110>
  c04c2d:	61                   	popa   
  c04c2e:	6e                   	outsb  %ds:(%esi),(%dx)
  c04c2f:	6e                   	outsb  %ds:(%esi),(%dx)
  c04c30:	65                   	gs
  c04c31:	72 20                	jb     c04c53 <yy_rule_can_match_eol+0xd3>
  c04c33:	69 6e 74 65 72 6e 61 	imul   $0x616e7265,0x74(%esi),%ebp
  c04c3a:	6c                   	insb   (%dx),%es:(%edi)
  c04c3b:	20 65 72             	and    %ah,0x72(%ebp)
  c04c3e:	72 6f                	jb     c04caf <yy_rule_can_match_eol+0x12f>
  c04c40:	72 2d                	jb     c04c6f <yy_rule_can_match_eol+0xef>
  c04c42:	2d 65 6e 64 20       	sub    $0x20646e65,%eax
  c04c47:	6f                   	outsl  %ds:(%esi),(%dx)
  c04c48:	66                   	data16
  c04c49:	20 62 75             	and    %ah,0x75(%edx)
  c04c4c:	66                   	data16
  c04c4d:	66                   	data16
  c04c4e:	65                   	gs
  c04c4f:	72 20                	jb     c04c71 <yy_rule_can_match_eol+0xf1>
  c04c51:	6d                   	insl   (%dx),%es:(%edi)
  c04c52:	69 73 73 65 64 00 66 	imul   $0x66006465,0x73(%ebx),%esi
  c04c59:	61                   	popa   
  c04c5a:	74 61                	je     c04cbd <yy_rule_can_match_eol+0x13d>
  c04c5c:	6c                   	insb   (%dx),%es:(%edi)
  c04c5d:	20 65 72             	and    %ah,0x72(%ebp)
  c04c60:	72 6f                	jb     c04cd1 <yy_rule_can_match_eol+0x151>
  c04c62:	72 20                	jb     c04c84 <yy_rule_can_match_eol+0x104>
  c04c64:	2d 20 73 63 61       	sub    $0x61637320,%eax
  c04c69:	6e                   	outsb  %ds:(%esi),(%dx)
  c04c6a:	6e                   	outsb  %ds:(%esi),(%dx)
  c04c6b:	65                   	gs
  c04c6c:	72 20                	jb     c04c8e <yy_rule_can_match_eol+0x10e>
  c04c6e:	69 6e 70 75 74 20 62 	imul   $0x62207475,0x70(%esi),%ebp
  c04c75:	75 66                	jne    c04cdd <yy_rule_can_match_eol+0x15d>
  c04c77:	66                   	data16
  c04c78:	65                   	gs
  c04c79:	72 20                	jb     c04c9b <yy_rule_can_match_eol+0x11b>
  c04c7b:	6f                   	outsl  %ds:(%esi),(%dx)
  c04c7c:	76 65                	jbe    c04ce3 <yy_rule_can_match_eol+0x163>
  c04c7e:	72 66                	jb     c04ce6 <yy_rule_can_match_eol+0x166>
  c04c80:	6c                   	insb   (%dx),%es:(%edi)
  c04c81:	6f                   	outsl  %ds:(%esi),(%dx)
  c04c82:	77 00                	ja     c04c84 <yy_rule_can_match_eol+0x104>
  c04c84:	6f                   	outsl  %ds:(%esi),(%dx)
  c04c85:	75 74                	jne    c04cfb <yy_rule_can_match_eol+0x17b>
  c04c87:	20 6f 66             	and    %ch,0x66(%edi)
  c04c8a:	20 64 79 6e          	and    %ah,0x6e(%ecx,%edi,2)
  c04c8e:	61                   	popa   
  c04c8f:	6d                   	insl   (%dx),%es:(%edi)
  c04c90:	69 63 20 6d 65 6d 6f 	imul   $0x6f6d656d,0x20(%ebx),%esp
  c04c97:	72 79                	jb     c04d12 <yy_rule_can_match_eol+0x192>
  c04c99:	20 69 6e             	and    %ch,0x6e(%ecx)
  c04c9c:	20 79 79             	and    %bh,0x79(%ecx)
  c04c9f:	5f                   	pop    %edi
  c04ca0:	67                   	addr16
  c04ca1:	65                   	gs
  c04ca2:	74 5f                	je     c04d03 <yy_rule_can_match_eol+0x183>
  c04ca4:	6e                   	outsb  %ds:(%esi),(%dx)
  c04ca5:	65                   	gs
  c04ca6:	78 74                	js     c04d1c <yy_rule_can_match_eol+0x19c>
  c04ca8:	5f                   	pop    %edi
  c04ca9:	62 75 66             	bound  %esi,0x66(%ebp)
  c04cac:	66                   	data16
  c04cad:	65                   	gs
  c04cae:	72 28                	jb     c04cd8 <yy_rule_can_match_eol+0x158>
  c04cb0:	29 00                	sub    %eax,(%eax)
  c04cb2:	00 00                	add    %al,(%eax)
  c04cb4:	66                   	data16
  c04cb5:	6c                   	insb   (%dx),%es:(%edi)
  c04cb6:	65                   	gs
  c04cb7:	78 20                	js     c04cd9 <yy_rule_can_match_eol+0x159>
  c04cb9:	73 63                	jae    c04d1e <yy_rule_can_match_eol+0x19e>
  c04cbb:	61                   	popa   
  c04cbc:	6e                   	outsb  %ds:(%esi),(%dx)
  c04cbd:	6e                   	outsb  %ds:(%esi),(%dx)
  c04cbe:	65                   	gs
  c04cbf:	72 20                	jb     c04ce1 <yy_rule_can_match_eol+0x161>
  c04cc1:	70 75                	jo     c04d38 <yy_rule_can_match_eol+0x1b8>
  c04cc3:	73 68                	jae    c04d2d <yy_rule_can_match_eol+0x1ad>
  c04cc5:	2d 62 61 63 6b       	sub    $0x6b636162,%eax
  c04cca:	20 6f 76             	and    %ch,0x76(%edi)
  c04ccd:	65                   	gs
  c04cce:	72 66                	jb     c04d36 <yy_rule_can_match_eol+0x1b6>
  c04cd0:	6c                   	insb   (%dx),%es:(%edi)
  c04cd1:	6f                   	outsl  %ds:(%esi),(%dx)
  c04cd2:	77 00                	ja     c04cd4 <yy_rule_can_match_eol+0x154>
  c04cd4:	6f                   	outsl  %ds:(%esi),(%dx)
  c04cd5:	75 74                	jne    c04d4b <yy_rule_can_match_eol+0x1cb>
  c04cd7:	20 6f 66             	and    %ch,0x66(%edi)
  c04cda:	20 64 79 6e          	and    %ah,0x6e(%ecx,%edi,2)
  c04cde:	61                   	popa   
  c04cdf:	6d                   	insl   (%dx),%es:(%edi)
  c04ce0:	69 63 20 6d 65 6d 6f 	imul   $0x6f6d656d,0x20(%ebx),%esp
  c04ce7:	72 79                	jb     c04d62 <yy_rule_can_match_eol+0x1e2>
  c04ce9:	20 69 6e             	and    %ch,0x6e(%ecx)
  c04cec:	20 79 79             	and    %bh,0x79(%ecx)
  c04cef:	5f                   	pop    %edi
  c04cf0:	63 72 65             	arpl   %si,0x65(%edx)
  c04cf3:	61                   	popa   
  c04cf4:	74 65                	je     c04d5b <yy_rule_can_match_eol+0x1db>
  c04cf6:	5f                   	pop    %edi
  c04cf7:	62 75 66             	bound  %esi,0x66(%ebp)
  c04cfa:	66                   	data16
  c04cfb:	65                   	gs
  c04cfc:	72 28                	jb     c04d26 <yy_rule_can_match_eol+0x1a6>
  c04cfe:	29 00                	sub    %eax,(%eax)
  c04d00:	6f                   	outsl  %ds:(%esi),(%dx)
  c04d01:	75 74                	jne    c04d77 <yy_rule_can_match_eol+0x1f7>
  c04d03:	20 6f 66             	and    %ch,0x66(%edi)
  c04d06:	20 64 79 6e          	and    %ah,0x6e(%ecx,%edi,2)
  c04d0a:	61                   	popa   
  c04d0b:	6d                   	insl   (%dx),%es:(%edi)
  c04d0c:	69 63 20 6d 65 6d 6f 	imul   $0x6f6d656d,0x20(%ebx),%esp
  c04d13:	72 79                	jb     c04d8e <yy_rule_can_match_eol+0x20e>
  c04d15:	20 69 6e             	and    %ch,0x6e(%ecx)
  c04d18:	20 79 79             	and    %bh,0x79(%ecx)
  c04d1b:	65 6e                	outsb  %gs:(%esi),(%dx)
  c04d1d:	73 75                	jae    c04d94 <yy_rule_can_match_eol+0x214>
  c04d1f:	72 65                	jb     c04d86 <yy_rule_can_match_eol+0x206>
  c04d21:	5f                   	pop    %edi
  c04d22:	62 75 66             	bound  %esi,0x66(%ebp)
  c04d25:	66                   	data16
  c04d26:	65                   	gs
  c04d27:	72 5f                	jb     c04d88 <yy_rule_can_match_eol+0x208>
  c04d29:	73 74                	jae    c04d9f <yy_rule_can_match_eol+0x21f>
  c04d2b:	61                   	popa   
  c04d2c:	63 6b 28             	arpl   %bp,0x28(%ebx)
  c04d2f:	29 00                	sub    %eax,(%eax)
  c04d31:	00 00                	add    %al,(%eax)
  c04d33:	00 6f 75             	add    %ch,0x75(%edi)
  c04d36:	74 20                	je     c04d58 <yy_rule_can_match_eol+0x1d8>
  c04d38:	6f                   	outsl  %ds:(%esi),(%dx)
  c04d39:	66                   	data16
  c04d3a:	20 64 79 6e          	and    %ah,0x6e(%ecx,%edi,2)
  c04d3e:	61                   	popa   
  c04d3f:	6d                   	insl   (%dx),%es:(%edi)
  c04d40:	69 63 20 6d 65 6d 6f 	imul   $0x6f6d656d,0x20(%ebx),%esp
  c04d47:	72 79                	jb     c04dc2 <yy_rule_can_match_eol+0x242>
  c04d49:	20 69 6e             	and    %ch,0x6e(%ecx)
  c04d4c:	20 79 79             	and    %bh,0x79(%ecx)
  c04d4f:	5f                   	pop    %edi
  c04d50:	73 63                	jae    c04db5 <yy_rule_can_match_eol+0x235>
  c04d52:	61                   	popa   
  c04d53:	6e                   	outsb  %ds:(%esi),(%dx)
  c04d54:	5f                   	pop    %edi
  c04d55:	62 75 66             	bound  %esi,0x66(%ebp)
  c04d58:	66                   	data16
  c04d59:	65                   	gs
  c04d5a:	72 28                	jb     c04d84 <yy_rule_can_match_eol+0x204>
  c04d5c:	29 00                	sub    %eax,(%eax)
  c04d5e:	00 00                	add    %al,(%eax)
  c04d60:	6f                   	outsl  %ds:(%esi),(%dx)
  c04d61:	75 74                	jne    c04dd7 <yy_rule_can_match_eol+0x257>
  c04d63:	20 6f 66             	and    %ch,0x66(%edi)
  c04d66:	20 64 79 6e          	and    %ah,0x6e(%ecx,%edi,2)
  c04d6a:	61                   	popa   
  c04d6b:	6d                   	insl   (%dx),%es:(%edi)
  c04d6c:	69 63 20 6d 65 6d 6f 	imul   $0x6f6d656d,0x20(%ebx),%esp
  c04d73:	72 79                	jb     c04dee <yy_rule_can_match_eol+0x26e>
  c04d75:	20 69 6e             	and    %ch,0x6e(%ecx)
  c04d78:	20 79 79             	and    %bh,0x79(%ecx)
  c04d7b:	5f                   	pop    %edi
  c04d7c:	73 63                	jae    c04de1 <yy_rule_can_match_eol+0x261>
  c04d7e:	61                   	popa   
  c04d7f:	6e                   	outsb  %ds:(%esi),(%dx)
  c04d80:	5f                   	pop    %edi
  c04d81:	62 79 74             	bound  %edi,0x74(%ecx)
  c04d84:	65                   	gs
  c04d85:	73 28                	jae    c04daf <yy_rule_can_match_eol+0x22f>
  c04d87:	29 00                	sub    %eax,(%eax)
  c04d89:	62 61 64             	bound  %esp,0x64(%ecx)
  c04d8c:	20 62 75             	and    %ah,0x75(%edx)
  c04d8f:	66                   	data16
  c04d90:	66                   	data16
  c04d91:	65                   	gs
  c04d92:	72 20                	jb     c04db4 <yy_rule_can_match_eol+0x234>
  c04d94:	69 6e 20 79 79 5f 73 	imul   $0x735f7979,0x20(%esi),%ebp
  c04d9b:	63 61 6e             	arpl   %sp,0x6e(%ecx)
  c04d9e:	5f                   	pop    %edi
  c04d9f:	62 79 74             	bound  %edi,0x74(%ecx)
  c04da2:	65                   	gs
  c04da3:	73 28                	jae    c04dcd <yy_rule_can_match_eol+0x24d>
  c04da5:	29 00                	sub    %eax,(%eax)
  c04da7:	25 73 0a 00 00       	and    $0xa73,%eax
  c04dac:	45                   	inc    %ebp
  c04dad:	72 72                	jb     c04e21 <yy_rule_can_match_eol+0x2a1>
  c04daf:	6f                   	outsl  %ds:(%esi),(%dx)
  c04db0:	72 3a                	jb     c04dec <yy_rule_can_match_eol+0x26c>
  c04db2:	20 00                	and    %al,(%eax)
  c04db4:	20 64 65 6c          	and    %ah,0x6c(%ebp,%eiz,2)
  c04db8:	4f                   	dec    %edi
  c04db9:	62 6a 65             	bound  %ebp,0x65(%edx)
  c04dbc:	63 74 20 66          	arpl   %si,0x66(%eax,%eiz,1)
  c04dc0:	75 6e                	jne    c04e30 <yy_rule_can_match_eol+0x2b0>
  c04dc2:	63 74 69 6f          	arpl   %si,0x6f(%ecx,%ebp,2)
  c04dc6:	6e                   	outsb  %ds:(%esi),(%dx)
  c04dc7:	20 75 6e             	and    %dh,0x6e(%ebp)
  c04dca:	73 75                	jae    c04e41 <yy_rule_can_match_eol+0x2c1>
  c04dcc:	70 70                	jo     c04e3e <yy_rule_can_match_eol+0x2be>
  c04dce:	6f                   	outsl  %ds:(%esi),(%dx)
  c04dcf:	72 74                	jb     c04e45 <yy_rule_can_match_eol+0x2c5>
  c04dd1:	2e 0a 00             	or     %cs:(%eax),%al
  c04dd4:	20 69 73             	and    %ch,0x73(%ecx)
  c04dd7:	20 6e 6f             	and    %ch,0x6f(%esi)
  c04dda:	74 20                	je     c04dfc <yy_rule_can_match_eol+0x27c>
  c04ddc:	61                   	popa   
  c04ddd:	20 6c 69 73          	and    %ch,0x73(%ecx,%ebp,2)
  c04de1:	74 2e                	je     c04e11 <yy_rule_can_match_eol+0x291>
  c04de3:	0a 00                	or     (%eax),%al
  c04de5:	20 69 73             	and    %ch,0x73(%ecx)
  c04de8:	20 6e 6f             	and    %ch,0x6f(%esi)
  c04deb:	74 20                	je     c04e0d <yy_rule_can_match_eol+0x28d>
  c04ded:	73 79                	jae    c04e68 <yy_rule_can_match_eol+0x2e8>
  c04def:	6d                   	insl   (%dx),%es:(%edi)
  c04df0:	62 6f 6c             	bound  %ebp,0x6c(%edi)
  c04df3:	2e 0a 00             	or     %cs:(%eax),%al
  c04df6:	6c                   	insb   (%dx),%es:(%edi)
  c04df7:	61                   	popa   
  c04df8:	6d                   	insl   (%dx),%es:(%edi)
  c04df9:	62 64 61 20          	bound  %esp,0x20(%ecx,%eiz,2)
  c04dfd:	75 6e                	jne    c04e6d <yy_rule_can_match_eol+0x2ed>
  c04dff:	73 75                	jae    c04e76 <yy_rule_can_match_eol+0x2f6>
  c04e01:	70 70                	jo     c04e73 <yy_rule_can_match_eol+0x2f3>
  c04e03:	6f                   	outsl  %ds:(%esi),(%dx)
  c04e04:	72 2e                	jb     c04e34 <yy_rule_can_match_eol+0x2b4>
  c04e06:	0a 20                	or     (%eax),%ah
  c04e08:	00 00                	add    %al,(%eax)
  c04e0a:	00 00                	add    %al,(%eax)
  c04e0c:	20 69 73             	and    %ch,0x73(%ecx)
  c04e0f:	20 6e 6f             	and    %ch,0x6f(%esi)
  c04e12:	74 20                	je     c04e34 <yy_rule_can_match_eol+0x2b4>
  c04e14:	61                   	popa   
  c04e15:	20 66 75             	and    %ah,0x75(%esi)
  c04e18:	6e                   	outsb  %ds:(%esi),(%dx)
  c04e19:	63 74 69 6f          	arpl   %si,0x6f(%ecx,%ebp,2)
  c04e1d:	6e                   	outsb  %ds:(%esi),(%dx)
  c04e1e:	20 6e 61             	and    %ch,0x61(%esi)
  c04e21:	6d                   	insl   (%dx),%es:(%edi)
  c04e22:	65 20 6f 72          	and    %ch,%gs:0x72(%edi)
  c04e26:	20 6c 61 6d          	and    %ch,0x6d(%ecx,%eiz,2)
  c04e2a:	62 64 61 2d          	bound  %esp,0x2d(%ecx,%eiz,2)
  c04e2e:	65                   	gs
  c04e2f:	78 70                	js     c04ea1 <yy_rule_can_match_eol+0x321>
  c04e31:	72 65                	jb     c04e98 <yy_rule_can_match_eol+0x318>
  c04e33:	73 73                	jae    c04ea8 <yy_rule_can_match_eol+0x328>
  c04e35:	69 6f 6e 2e 0a 00 20 	imul   $0x20000a2e,0x6e(%edi),%ebp
  c04e3c:	69 73 20 6e 6f 74 20 	imul   $0x20746f6e,0x20(%ebx),%esi
  c04e43:	61                   	popa   
  c04e44:	20 6c 69 73          	and    %ch,0x73(%ecx,%ebp,2)
  c04e48:	74 2e                	je     c04e78 <yy_rule_can_match_eol+0x2f8>
  c04e4a:	77 68                	ja     c04eb4 <yy_rule_can_match_eol+0x334>
  c04e4c:	79 20                	jns    c04e6e <yy_rule_can_match_eol+0x2ee>
  c04e4e:	64 6f                	outsl  %fs:(%esi),(%dx)
  c04e50:	20 74 68 69          	and    %dh,0x69(%eax,%ebp,2)
  c04e54:	73 3f                	jae    c04e95 <yy_rule_can_match_eol+0x315>
  c04e56:	0a 00                	or     (%eax),%al
  c04e58:	20 69 73             	and    %ch,0x73(%ecx)
  c04e5b:	20 6e 6f             	and    %ch,0x6f(%esi)
  c04e5e:	74 20                	je     c04e80 <yy_rule_can_match_eol+0x300>
  c04e60:	61                   	popa   
  c04e61:	20 73 79             	and    %dh,0x79(%ebx)
  c04e64:	6d                   	insl   (%dx),%es:(%edi)
  c04e65:	62 6f 6c             	bound  %ebp,0x6c(%edi)
  c04e68:	2e 0a 00             	or     %cs:(%eax),%al
  c04e6b:	20 61 72             	and    %ah,0x72(%ecx)
  c04e6e:	67 00 74 6f          	add    %dh,0x6f(%si)
  c04e72:	6f                   	outsl  %ds:(%esi),(%dx)
  c04e73:	20 66 65             	and    %ah,0x65(%esi)
  c04e76:	77 20                	ja     c04e98 <yy_rule_can_match_eol+0x318>
  c04e78:	61                   	popa   
  c04e79:	72 67                	jb     c04ee2 <yy_rule_can_match_eol+0x362>
  c04e7b:	75 6d                	jne    c04eea <yy_rule_can_match_eol+0x36a>
  c04e7d:	65 6e                	outsb  %gs:(%esi),(%dx)
  c04e7f:	74 73                	je     c04ef4 <yy_rule_can_match_eol+0x374>
  c04e81:	2e 00 20             	add    %ah,%cs:(%eax)
  c04e84:	00 63 61             	add    %ah,0x61(%ebx)
  c04e87:	72 00                	jb     c04e89 <yy_rule_can_match_eol+0x309>
  c04e89:	63 64 72 00          	arpl   %sp,0x0(%edx,%esi,2)
  c04e8d:	73 65                	jae    c04ef4 <yy_rule_can_match_eol+0x374>
  c04e8f:	74 00                	je     c04e91 <yy_rule_can_match_eol+0x311>
  c04e91:	65                   	gs
  c04e92:	78 65                	js     c04ef9 <yy_rule_can_match_eol+0x379>
  c04e94:	63 00                	arpl   %ax,(%eax)
  c04e96:	71 75                	jno    c04f0d <yy_rule_can_match_eol+0x38d>
  c04e98:	69 74 00 00 45 28 c0 	imul   $0xc02845,0x0(%eax,%eax,1),%esi
  c04e9f:	00 
  c04ea0:	45                   	inc    %ebp
  c04ea1:	28 c0                	sub    %al,%al
  c04ea3:	00 09                	add    %cl,(%ecx)
  c04ea5:	28 c0                	sub    %al,%al
  c04ea7:	00 b8 27 c0 00 f0    	add    %bh,-0xfff3fd9(%eax)
  c04ead:	27                   	daa    
  c04eae:	c0 00 86             	rolb   $0x86,(%eax)
  c04eb1:	27                   	daa    
  c04eb2:	c0 00 45             	rolb   $0x45,(%eax)
  c04eb5:	28 c0                	sub    %al,%al
  c04eb7:	00 45 28             	add    %al,0x28(%ebp)
  c04eba:	c0 00 28             	rolb   $0x28,(%eax)
  c04ebd:	00 29                	add    %ch,(%ecx)
  c04ebf:	00 25 73 00 22 25    	add    %ah,0x25220073
  c04ec5:	73 22                	jae    c04ee9 <yy_rule_can_match_eol+0x369>
  c04ec7:	00 25 64 00 4e 49    	add    %ah,0x494e0064
  c04ecd:	4c                   	dec    %esp
  c04ece:	00 60 00             	add    %ah,0x0(%eax)
  c04ed1:	3c 23                	cmp    $0x23,%al
  c04ed3:	66                   	data16
  c04ed4:	75 6e                	jne    c04f44 <yy_rule_can_match_eol+0x3c4>
  c04ed6:	63 74 69 6f          	arpl   %si,0x6f(%ecx,%ebp,2)
  c04eda:	6e                   	outsb  %ds:(%esi),(%dx)
  c04edb:	20 25 70 3e 00 3c    	and    %ah,0x3c003e70
  c04ee1:	23 6c 61 6d          	and    0x6d(%ecx,%eiz,2),%ebp
  c04ee5:	62 64 61 20          	bound  %esp,0x20(%ecx,%eiz,2)
  c04ee9:	25 70 3e 00 49       	and    $0x49003e70,%eax
  c04eee:	6e                   	outsb  %ds:(%esi),(%dx)
  c04eef:	76 61                	jbe    c04f52 <yy_rule_can_match_eol+0x3d2>
  c04ef1:	6c                   	insb   (%dx),%es:(%edi)
  c04ef2:	20 6f 62             	and    %ch,0x62(%edi)
  c04ef5:	6a 65                	push   $0x65
  c04ef7:	63 74 20 25          	arpl   %si,0x25(%eax,%eiz,1)
  c04efb:	64 00 00             	add    %al,%fs:(%eax)
  c04efe:	00 00                	add    %al,(%eax)
  c04f00:	c8 29 c0 00          	enter  $0xc029,$0x0
  c04f04:	60                   	pusha  
  c04f05:	29 c0                	sub    %eax,%eax
  c04f07:	00 8d 28 c0 00 d6    	add    %cl,-0x29ff3fd8(%ebp)
  c04f0d:	28 c0                	sub    %al,%al
  c04f0f:	00 72 29             	add    %dh,0x29(%edx)
  c04f12:	c0 00 0d             	rolb   $0xd,(%eax)
  c04f15:	29 c0                	sub    %eax,%eax
  c04f17:	00 47 29             	add    %al,0x29(%edi)
  c04f1a:	c0 00 2b             	rolb   $0x2b,(%eax)
  c04f1d:	29 c0                	sub    %eax,%eax
  c04f1f:	00 af 29 c0 00 96    	add    %ch,-0x69ff3fd7(%edi)
  c04f25:	29 c0                	sub    %eax,%eax
  c04f27:	00 3e                	add    %bh,(%esi)
  c04f29:	20 25 73 20 25 64    	and    %ah,0x64252073
  c04f2f:	0a 00                	or     (%eax),%al
  c04f31:	45                   	inc    %ebp
  c04f32:	72 72                	jb     c04fa6 <yy_rule_can_match_eol+0x426>
  c04f34:	6f                   	outsl  %ds:(%esi),(%dx)
  c04f35:	72 0a                	jb     c04f41 <yy_rule_can_match_eol+0x3c1>
  c04f37:	00 73 79             	add    %dh,0x79(%ebx)
  c04f3a:	6d                   	insl   (%dx),%es:(%edi)
  c04f3b:	62 6f 6c             	bound  %ebp,0x6c(%edi)
  c04f3e:	20 74 61 62          	and    %dh,0x62(%ecx,%eiz,2)
  c04f42:	6c                   	insb   (%dx),%es:(%edi)
  c04f43:	65 20 6f 76          	and    %ch,%gs:0x76(%edi)
  c04f47:	65                   	gs
  c04f48:	72 66                	jb     c04fb0 <yy_rule_can_match_eol+0x430>
  c04f4a:	6c                   	insb   (%dx),%es:(%edi)
  c04f4b:	6f                   	outsl  %ds:(%esi),(%dx)
  c04f4c:	77 0a                	ja     c04f58 <yy_rule_can_match_eol+0x3d8>
  c04f4e:	00 00                	add    %al,(%eax)
  c04f50:	5b                   	pop    %ebx
  c04f51:	4d                   	dec    %ebp
  c04f52:	41                   	inc    %ecx
  c04f53:	4c                   	dec    %esp
  c04f54:	4c                   	dec    %esp
  c04f55:	4f                   	dec    %edi
  c04f56:	43                   	inc    %ebx
  c04f57:	5d                   	pop    %ebp
  c04f58:	20 3a                	and    %bh,(%edx)
  c04f5a:	20 54 72 79          	and    %dl,0x79(%edx,%esi,2)
  c04f5e:	69 6e 67 20 74 6f 20 	imul   $0x206f7420,0x67(%esi),%ebp
  c04f65:	72 65                	jb     c04fcc <yy_rule_can_match_eol+0x44c>
  c04f67:	6d                   	insl   (%dx),%es:(%edi)
  c04f68:	6f                   	outsl  %ds:(%esi),(%dx)
  c04f69:	76 65                	jbe    c04fd0 <yy_rule_can_match_eol+0x450>
  c04f6b:	20 61 6e             	and    %ah,0x6e(%ecx)
  c04f6e:	20 65 6d             	and    %ah,0x6d(%ebp)
  c04f71:	70 74                	jo     c04fe7 <yy_rule_can_match_eol+0x467>
  c04f73:	79 20                	jns    c04f95 <yy_rule_can_match_eol+0x415>
  c04f75:	6f                   	outsl  %ds:(%esi),(%dx)
  c04f76:	62 6a 65             	bound  %ebp,0x65(%edx)
  c04f79:	63 74 0a 00          	arpl   %si,0x0(%edx,%ecx,1)
  c04f7d:	00 00                	add    %al,(%eax)
  c04f7f:	00 5b 4d             	add    %bl,0x4d(%ebx)
  c04f82:	41                   	inc    %ecx
  c04f83:	4c                   	dec    %esp
  c04f84:	4c                   	dec    %esp
  c04f85:	4f                   	dec    %edi
  c04f86:	43                   	inc    %ebx
  c04f87:	5d                   	pop    %ebp
  c04f88:	20 3a                	and    %bh,(%edx)
  c04f8a:	20 54 72 79          	and    %dl,0x79(%edx,%esi,2)
  c04f8e:	69 6e 67 20 74 6f 20 	imul   $0x206f7420,0x67(%esi),%ebp
  c04f95:	69 6e 73 65 72 74 20 	imul   $0x20747265,0x73(%esi),%ebp
  c04f9c:	61                   	popa   
  c04f9d:	6e                   	outsb  %ds:(%esi),(%dx)
  c04f9e:	20 65 6d             	and    %ah,0x6d(%ebp)
  c04fa1:	70 74                	jo     c05017 <yy_rule_can_match_eol+0x497>
  c04fa3:	79 20                	jns    c04fc5 <yy_rule_can_match_eol+0x445>
  c04fa5:	6f                   	outsl  %ds:(%esi),(%dx)
  c04fa6:	62 6a 65             	bound  %ebp,0x65(%edx)
  c04fa9:	63 74 0a 00          	arpl   %si,0x0(%edx,%ecx,1)
  c04fad:	00 00                	add    %al,(%eax)
  c04faf:	00 5b 4d             	add    %bl,0x4d(%ebx)
  c04fb2:	41                   	inc    %ecx
  c04fb3:	4c                   	dec    %esp
  c04fb4:	4c                   	dec    %esp
  c04fb5:	4f                   	dec    %edi
  c04fb6:	43                   	inc    %ebx
  c04fb7:	5d                   	pop    %ebp
  c04fb8:	20 3a                	and    %bh,(%edx)
  c04fba:	20 54 72 79          	and    %dl,0x79(%edx,%esi,2)
  c04fbe:	69 6e 67 20 74 6f 20 	imul   $0x206f7420,0x67(%esi),%ebp
  c04fc5:	73 70                	jae    c05037 <yy_rule_can_match_eol+0x4b7>
  c04fc7:	6c                   	insb   (%dx),%es:(%edi)
  c04fc8:	69 74 20 61 6e 20 65 	imul   $0x6d65206e,0x61(%eax,%eiz,1),%esi
  c04fcf:	6d 
  c04fd0:	70 74                	jo     c05046 <yy_rule_can_match_eol+0x4c6>
  c04fd2:	79 20                	jns    c04ff4 <yy_rule_can_match_eol+0x474>
  c04fd4:	6f                   	outsl  %ds:(%esi),(%dx)
  c04fd5:	62 6a 65             	bound  %ebp,0x65(%edx)
  c04fd8:	63 74 0a 00          	arpl   %si,0x0(%edx,%ecx,1)
  c04fdc:	5b                   	pop    %ebx
  c04fdd:	4d                   	dec    %ebp
  c04fde:	41                   	inc    %ecx
  c04fdf:	4c                   	dec    %esp
  c04fe0:	4c                   	dec    %esp
  c04fe1:	4f                   	dec    %edi
  c04fe2:	43                   	inc    %ebx
  c04fe3:	5d                   	pop    %ebp
  c04fe4:	20 3a                	and    %bh,(%edx)
  c04fe6:	20 54 72 79          	and    %dl,0x79(%edx,%esi,2)
  c04fea:	69 6e 67 20 74 6f 20 	imul   $0x206f7420,0x67(%esi),%ebp
  c04ff1:	6d                   	insl   (%dx),%es:(%edi)
  c04ff2:	65                   	gs
  c04ff3:	72 67                	jb     c0505c <yy_rule_can_match_eol+0x4dc>
  c04ff5:	65                   	gs
  c04ff6:	72 20                	jb     c05018 <yy_rule_can_match_eol+0x498>
  c04ff8:	65                   	gs
  c04ff9:	6d                   	insl   (%dx),%es:(%edi)
  c04ffa:	70 74                	jo     c05070 <yy_rule_can_match_eol+0x4f0>
  c04ffc:	72 79                	jb     c05077 <yy_rule_can_match_eol+0x4f7>
  c04ffe:	20 6f 62             	and    %ch,0x62(%edi)
  c05001:	6a 65                	push   $0x65
  c05003:	63 74 73 0a          	arpl   %si,0xa(%ebx,%esi,2)
  c05007:	00 5b 4d             	add    %bl,0x4d(%ebx)
  c0500a:	41                   	inc    %ecx
  c0500b:	4c                   	dec    %esp
  c0500c:	4c                   	dec    %esp
  c0500d:	4f                   	dec    %edi
  c0500e:	43                   	inc    %ebx
  c0500f:	5d                   	pop    %ebp
  c05010:	20 3a                	and    %bh,(%edx)
  c05012:	20 54 72 79          	and    %dl,0x79(%edx,%esi,2)
  c05016:	69 6e 67 20 74 6f 20 	imul   $0x206f7420,0x67(%esi),%ebp
  c0501d:	6d                   	insl   (%dx),%es:(%edi)
  c0501e:	65                   	gs
  c0501f:	72 67                	jb     c05088 <yy_rule_can_match_eol+0x508>
  c05021:	65                   	gs
  c05022:	72 20                	jb     c05044 <yy_rule_can_match_eol+0x4c4>
  c05024:	6e                   	outsb  %ds:(%esi),(%dx)
  c05025:	6f                   	outsl  %ds:(%esi),(%dx)
  c05026:	6e                   	outsb  %ds:(%esi),(%dx)
  c05027:	63 6f 6e             	arpl   %bp,0x6e(%edi)
  c0502a:	74 69                	je     c05095 <yy_rule_can_match_eol+0x515>
  c0502c:	67 75 6f             	addr16 jne c0509e <yy_rule_can_match_eol+0x51e>
  c0502f:	75 73                	jne    c050a4 <yy_rule_can_match_eol+0x524>
  c05031:	20 6f 62             	and    %ch,0x62(%edi)
  c05034:	6a 65                	push   $0x65
  c05036:	63 74 73 0a          	arpl   %si,0xa(%ebx,%esi,2)
  c0503a:	68 65 61 64 20       	push   $0x20646165
  c0503f:	3a 20                	cmp    (%eax),%ah
  c05041:	25 70 20 6c 65       	and    $0x656c2070,%eax
  c05046:	6e                   	outsb  %ds:(%esi),(%dx)
  c05047:	67 74 68             	addr16 je c050b2 <yy_rule_can_match_eol+0x532>
  c0504a:	20 3a                	and    %bh,(%edx)
  c0504c:	20 25 78 0a 74 61    	and    %ah,0x61740a78
  c05052:	69 6c 20 3a 20 25 70 	imul   $0x20702520,0x3a(%eax,%eiz,1),%ebp
  c05059:	20 
  c0505a:	6c                   	insb   (%dx),%es:(%edi)
  c0505b:	65 6e                	outsb  %gs:(%esi),(%dx)
  c0505d:	67 74 68             	addr16 je c050c8 <yy_rule_can_match_eol+0x548>
  c05060:	20 3a                	and    %bh,(%edx)
  c05062:	20 25 78 0a 00 00    	and    %ah,0xa78
  c05068:	5b                   	pop    %ebx
  c05069:	4d                   	dec    %ebp
  c0506a:	41                   	inc    %ecx
  c0506b:	4c                   	dec    %esp
  c0506c:	4c                   	dec    %esp
  c0506d:	4f                   	dec    %edi
  c0506e:	43                   	inc    %ebx
  c0506f:	5d                   	pop    %ebp
  c05070:	20 3a                	and    %bh,(%edx)
  c05072:	20 48 65             	and    %cl,0x65(%eax)
  c05075:	61                   	popa   
  c05076:	70 20                	jo     c05098 <yy_rule_can_match_eol+0x518>
  c05078:	61                   	popa   
  c05079:	6c                   	insb   (%dx),%es:(%edi)
  c0507a:	72 65                	jb     c050e1 <yy_rule_can_match_eol+0x561>
  c0507c:	61                   	popa   
  c0507d:	64                   	fs
  c0507e:	79 20                	jns    c050a0 <yy_rule_can_match_eol+0x520>
  c05080:	65                   	gs
  c05081:	78 69                	js     c050ec <yy_rule_can_match_eol+0x56c>
  c05083:	73 74                	jae    c050f9 <yy_rule_can_match_eol+0x579>
  c05085:	73 2c                	jae    c050b3 <yy_rule_can_match_eol+0x533>
  c05087:	61                   	popa   
  c05088:	64                   	fs
  c05089:	64                   	fs
  c0508a:	72 65                	jb     c050f1 <yy_rule_can_match_eol+0x571>
  c0508c:	73 73                	jae    c05101 <yy_rule_can_match_eol+0x581>
  c0508e:	20 69 73             	and    %ch,0x73(%ecx)
  c05091:	20 25 70 20 61 6e    	and    %ah,0x6e612070
  c05097:	64 20 26             	and    %ah,%fs:(%esi)
  c0509a:	68 65 61 70 20       	push   $0x20706165
  c0509f:	69 73 20 25 70 0a 00 	imul   $0xa7025,0x20(%ebx),%esi
  c050a6:	00 00                	add    %al,(%eax)
  c050a8:	5b                   	pop    %ebx
  c050a9:	4d                   	dec    %ebp
  c050aa:	41                   	inc    %ecx
  c050ab:	4c                   	dec    %esp
  c050ac:	4c                   	dec    %esp
  c050ad:	4f                   	dec    %edi
  c050ae:	43                   	inc    %ebx
  c050af:	5d                   	pop    %ebp
  c050b0:	20 3a                	and    %bh,(%edx)
  c050b2:	20 43 61             	and    %al,0x61(%ebx)
  c050b5:	6e                   	outsb  %ds:(%esi),(%dx)
  c050b6:	20 6f 6e             	and    %ch,0x6e(%edi)
  c050b9:	6c                   	insb   (%dx),%es:(%edi)
  c050ba:	79 20                	jns    c050dc <yy_rule_can_match_eol+0x55c>
  c050bc:	63 72 65             	arpl   %si,0x65(%edx)
  c050bf:	61                   	popa   
  c050c0:	74 65                	je     c05127 <yy_rule_can_match_eol+0x5a7>
  c050c2:	20 68 65             	and    %ch,0x65(%eax)
  c050c5:	61                   	popa   
  c050c6:	70 20                	jo     c050e8 <yy_rule_can_match_eol+0x568>
  c050c8:	30 20                	xor    %ah,(%eax)
  c050ca:	7e 20                	jle    c050ec <yy_rule_can_match_eol+0x56c>
  c050cc:	25 64 2c 62 75       	and    $0x75622c64,%eax
  c050d1:	74 20                	je     c050f3 <yy_rule_can_match_eol+0x573>
  c050d3:	72 65                	jb     c0513a <yy_rule_can_match_eol+0x5ba>
  c050d5:	71 75                	jno    c0514c <yy_rule_can_match_eol+0x5cc>
  c050d7:	65                   	gs
  c050d8:	73 74                	jae    c0514e <yy_rule_can_match_eol+0x5ce>
  c050da:	69 6e 67 20 25 64 0a 	imul   $0xa642520,0x67(%esi),%ebp
  c050e1:	00 00                	add    %al,(%eax)
  c050e3:	00 5b 4d             	add    %bl,0x4d(%ebx)
  c050e6:	41                   	inc    %ecx
  c050e7:	4c                   	dec    %esp
  c050e8:	4c                   	dec    %esp
  c050e9:	4f                   	dec    %edi
  c050ea:	43                   	inc    %ebx
  c050eb:	5d                   	pop    %ebp
  c050ec:	20 3a                	and    %bh,(%edx)
  c050ee:	20 4f 6f             	and    %cl,0x6f(%edi)
  c050f1:	70 73                	jo     c05166 <yy_rule_can_match_eol+0x5e6>
  c050f3:	2c 74                	sub    $0x74,%al
  c050f5:	68 65 20 6d 65       	push   $0x656d2065
  c050fa:	6d                   	insl   (%dx),%es:(%edi)
  c050fb:	6f                   	outsl  %ds:(%esi),(%dx)
  c050fc:	72 79                	jb     c05177 <yy_rule_can_match_eol+0x5f7>
  c050fe:	20 69 73             	and    %ch,0x73(%ecx)
  c05101:	20 66 75             	and    %ah,0x75(%esi)
  c05104:	6c                   	insb   (%dx),%es:(%edi)
  c05105:	6c                   	insb   (%dx),%es:(%edi)
  c05106:	2c 74                	sub    $0x74,%al
  c05108:	65                   	gs
  c05109:	6c                   	insb   (%dx),%es:(%edi)
  c0510a:	6c                   	insb   (%dx),%es:(%edi)
  c0510b:	20 79 6f             	and    %bh,0x6f(%ecx)
  c0510e:	75 72                	jne    c05182 <yy_rule_can_match_eol+0x602>
  c05110:	20 62 6f             	and    %ah,0x6f(%edx)
  c05113:	73 73                	jae    c05188 <yy_rule_can_match_eol+0x608>
  c05115:	0a 00                	or     (%eax),%al
  c05117:	00 5b 4d             	add    %bl,0x4d(%ebx)
  c0511a:	41                   	inc    %ecx
  c0511b:	4c                   	dec    %esp
  c0511c:	4c                   	dec    %esp
  c0511d:	4f                   	dec    %edi
  c0511e:	43                   	inc    %ebx
  c0511f:	5d                   	pop    %ebp
  c05120:	20 3a                	and    %bh,(%edx)
  c05122:	20 43 61             	and    %al,0x61(%ebx)
  c05125:	6e                   	outsb  %ds:(%esi),(%dx)
  c05126:	20 6f 6e             	and    %ch,0x6e(%edi)
  c05129:	6c                   	insb   (%dx),%es:(%edi)
  c0512a:	79 20                	jns    c0514c <yy_rule_can_match_eol+0x5cc>
  c0512c:	61                   	popa   
  c0512d:	6c                   	insb   (%dx),%es:(%edi)
  c0512e:	6c                   	insb   (%dx),%es:(%edi)
  c0512f:	6f                   	outsl  %ds:(%esi),(%dx)
  c05130:	63 20                	arpl   %sp,(%eax)
  c05132:	20 30                	and    %dh,(%eax)
  c05134:	20 7e 20             	and    %bh,0x20(%esi)
  c05137:	25 64 2c 62 75       	and    $0x75622c64,%eax
  c0513c:	74 20                	je     c0515e <yy_rule_can_match_eol+0x5de>
  c0513e:	72 65                	jb     c051a5 <yy_rule_can_match_eol+0x625>
  c05140:	71 75                	jno    c051b7 <yy_rule_can_match_eol+0x637>
  c05142:	65                   	gs
  c05143:	73 74                	jae    c051b9 <_lowerDigits+0x1>
  c05145:	69 6e 67 20 25 64 0a 	imul   $0xa642520,0x67(%esi),%ebp
  c0514c:	00 00                	add    %al,(%eax)
  c0514e:	00 00                	add    %al,(%eax)
  c05150:	5b                   	pop    %ebx
  c05151:	4d                   	dec    %ebp
  c05152:	41                   	inc    %ecx
  c05153:	4c                   	dec    %esp
  c05154:	4c                   	dec    %esp
  c05155:	4f                   	dec    %edi
  c05156:	43                   	inc    %ebx
  c05157:	5d                   	pop    %ebp
  c05158:	20 3a                	and    %bh,(%edx)
  c0515a:	20 54 72 79          	and    %dl,0x79(%edx,%esi,2)
  c0515e:	69 6e 67 20 74 6f 20 	imul   $0x206f7420,0x67(%esi),%ebp
  c05165:	66                   	data16
  c05166:	72 65                	jb     c051cd <_lowerDigits+0x15>
  c05168:	65 20 6e 6f          	and    %ch,%gs:0x6f(%esi)
  c0516c:	6e                   	outsb  %ds:(%esi),(%dx)
  c0516d:	2d 68 65 61 70       	sub    $0x70616568,%eax
  c05172:	20 6d 65             	and    %ch,0x65(%ebp)
  c05175:	6d                   	insl   (%dx),%es:(%edi)
  c05176:	6f                   	outsl  %ds:(%esi),(%dx)
  c05177:	72 79                	jb     c051f2 <_upperDigits+0x22>
  c05179:	20 25 70 0a 00 00    	and    %ah,0xa70
  c0517f:	00 45 78             	add    %al,0x78(%ebp)
  c05182:	63 65 70             	arpl   %sp,0x70(%ebp)
  c05185:	74 69                	je     c051f0 <_upperDigits+0x20>
  c05187:	6f                   	outsl  %ds:(%esi),(%dx)
  c05188:	6e                   	outsb  %ds:(%esi),(%dx)
  c05189:	20 3a                	and    %bh,(%edx)
  c0518b:	20 72 65             	and    %dh,0x65(%edx)
  c0518e:	61                   	popa   
  c0518f:	6c                   	insb   (%dx),%es:(%edi)
  c05190:	69 7a 65 4d 48 65 61 	imul   $0x6165484d,0x65(%edx),%edi
  c05197:	70 28                	jo     c051c1 <_lowerDigits+0x9>
  c05199:	30 78 34             	xor    %bh,0x34(%eax)
  c0519c:	30 30                	xor    %dh,(%eax)
  c0519e:	30 30                	xor    %dh,(%eax)
  c051a0:	30 29                	xor    %ch,(%ecx)
  c051a2:	0a 00                	or     (%eax),%al
  c051a4:	30 31                	xor    %dh,(%ecx)
  c051a6:	32 33                	xor    (%ebx),%dh
  c051a8:	34 35                	xor    $0x35,%al
  c051aa:	36                   	ss
  c051ab:	37                   	aaa    
  c051ac:	38 39                	cmp    %bh,(%ecx)
  c051ae:	61                   	popa   
  c051af:	62 63 64             	bound  %esp,0x64(%ebx)
  c051b2:	65                   	gs
  c051b3:	66                   	data16
  c051b4:	78 00                	js     c051b6 <yy_rule_can_match_eol+0x636>
	...

00c051b8 <_lowerDigits>:
  c051b8:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  c051b9:	51                   	push   %ecx
  c051ba:	c0 00 30             	rolb   $0x30,(%eax)
  c051bd:	31 32                	xor    %esi,(%edx)
  c051bf:	33 34 35 36 37 38 39 	xor    0x39383736(,%esi,1),%esi
  c051c6:	41                   	inc    %ecx
  c051c7:	42                   	inc    %edx
  c051c8:	43                   	inc    %ebx
  c051c9:	44                   	inc    %esp
  c051ca:	45                   	inc    %ebp
  c051cb:	46                   	inc    %esi
  c051cc:	58                   	pop    %eax
  c051cd:	00 00                	add    %al,(%eax)
	...

00c051d0 <_upperDigits>:
  c051d0:	bc 51 c0 00 3c       	mov    $0x3c00c051,%esp
  c051d5:	4e                   	dec    %esi
  c051d6:	55                   	push   %ebp
  c051d7:	4c                   	dec    %esp
  c051d8:	4c                   	dec    %esp
  c051d9:	3e 00 00             	add    %al,%ds:(%eax)
  c051dc:	53                   	push   %ebx
  c051dd:	3f                   	aas    
  c051de:	c0 00 65             	rolb   $0x65,(%eax)
  c051e1:	3f                   	aas    
  c051e2:	c0 00 65             	rolb   $0x65,(%eax)
  c051e5:	3f                   	aas    
  c051e6:	c0 00 5f             	rolb   $0x5f,(%eax)
  c051e9:	3f                   	aas    
  c051ea:	c0 00 65             	rolb   $0x65,(%eax)
  c051ed:	3f                   	aas    
  c051ee:	c0 00 65             	rolb   $0x65,(%eax)
  c051f1:	3f                   	aas    
  c051f2:	c0 00 65             	rolb   $0x65,(%eax)
  c051f5:	3f                   	aas    
  c051f6:	c0 00 65             	rolb   $0x65,(%eax)
  c051f9:	3f                   	aas    
  c051fa:	c0 00 65             	rolb   $0x65,(%eax)
  c051fd:	3f                   	aas    
  c051fe:	c0 00 65             	rolb   $0x65,(%eax)
  c05201:	3f                   	aas    
  c05202:	c0 00 65             	rolb   $0x65,(%eax)
  c05205:	3f                   	aas    
  c05206:	c0 00 4d             	rolb   $0x4d,(%eax)
  c05209:	3f                   	aas    
  c0520a:	c0 00 65             	rolb   $0x65,(%eax)
  c0520d:	3f                   	aas    
  c0520e:	c0 00 47             	rolb   $0x47,(%eax)
  c05211:	3f                   	aas    
  c05212:	c0 00 65             	rolb   $0x65,(%eax)
  c05215:	3f                   	aas    
  c05216:	c0 00 65             	rolb   $0x65,(%eax)
  c05219:	3f                   	aas    
  c0521a:	c0 00 59             	rolb   $0x59,(%eax)
  c0521d:	3f                   	aas    
  c0521e:	c0 00 2a             	rolb   $0x2a,(%eax)
  c05221:	40                   	inc    %eax
  c05222:	c0 00 50             	rolb   $0x50,(%eax)
  c05225:	40                   	inc    %eax
  c05226:	c0 00 50             	rolb   $0x50,(%eax)
  c05229:	40                   	inc    %eax
  c0522a:	c0 00 50             	rolb   $0x50,(%eax)
  c0522d:	40                   	inc    %eax
  c0522e:	c0 00 50             	rolb   $0x50,(%eax)
  c05231:	40                   	inc    %eax
  c05232:	c0 00 50             	rolb   $0x50,(%eax)
  c05235:	40                   	inc    %eax
  c05236:	c0 00 50             	rolb   $0x50,(%eax)
  c05239:	40                   	inc    %eax
  c0523a:	c0 00 50             	rolb   $0x50,(%eax)
  c0523d:	40                   	inc    %eax
  c0523e:	c0 00 50             	rolb   $0x50,(%eax)
  c05241:	40                   	inc    %eax
  c05242:	c0 00 50             	rolb   $0x50,(%eax)
  c05245:	40                   	inc    %eax
  c05246:	c0 00 50             	rolb   $0x50,(%eax)
  c05249:	40                   	inc    %eax
  c0524a:	c0 00 02             	rolb   $0x2,(%eax)
  c0524d:	40                   	inc    %eax
  c0524e:	c0 00 37             	rolb   $0x37,(%eax)
  c05251:	40                   	inc    %eax
  c05252:	c0 00 50             	rolb   $0x50,(%eax)
  c05255:	40                   	inc    %eax
  c05256:	c0 00 50             	rolb   $0x50,(%eax)
  c05259:	40                   	inc    %eax
  c0525a:	c0 00 50             	rolb   $0x50,(%eax)
  c0525d:	40                   	inc    %eax
  c0525e:	c0 00 50             	rolb   $0x50,(%eax)
  c05261:	40                   	inc    %eax
  c05262:	c0 00 3e             	rolb   $0x3e,(%eax)
  c05265:	40                   	inc    %eax
  c05266:	c0 00 50             	rolb   $0x50,(%eax)
  c05269:	40                   	inc    %eax
  c0526a:	c0 00 50             	rolb   $0x50,(%eax)
  c0526d:	40                   	inc    %eax
  c0526e:	c0 00 50             	rolb   $0x50,(%eax)
  c05271:	40                   	inc    %eax
  c05272:	c0 00 50             	rolb   $0x50,(%eax)
  c05275:	40                   	inc    %eax
  c05276:	c0 00 50             	rolb   $0x50,(%eax)
  c05279:	40                   	inc    %eax
  c0527a:	c0 00 47             	rolb   $0x47,(%eax)
  c0527d:	40                   	inc    %eax
  c0527e:	c0 00 26             	rolb   $0x26,(%eax)
  c05281:	40                   	inc    %eax
  c05282:	c0 00 50             	rolb   $0x50,(%eax)
  c05285:	40                   	inc    %eax
  c05286:	c0 00 50             	rolb   $0x50,(%eax)
  c05289:	40                   	inc    %eax
  c0528a:	c0 00 1d             	rolb   $0x1d,(%eax)
  c0528d:	40                   	inc    %eax
  c0528e:	c0 00 50             	rolb   $0x50,(%eax)
  c05291:	40                   	inc    %eax
  c05292:	c0 00 75             	rolb   $0x75,(%eax)
  c05295:	40                   	inc    %eax
  c05296:	c0 00 50             	rolb   $0x50,(%eax)
  c05299:	40                   	inc    %eax
  c0529a:	c0 00 50             	rolb   $0x50,(%eax)
  c0529d:	40                   	inc    %eax
  c0529e:	c0 00 2e             	rolb   $0x2e,(%eax)
  c052a1:	40                   	inc    %eax
  c052a2:	c0 00 95             	rolb   $0x95,(%eax)
  c052a5:	40                   	inc    %eax
  c052a6:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052a9:	41                   	inc    %ecx
  c052aa:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052ad:	41                   	inc    %ecx
  c052ae:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052b1:	41                   	inc    %ecx
  c052b2:	c0 00 da             	rolb   $0xda,(%eax)
  c052b5:	40                   	inc    %eax
  c052b6:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052b9:	41                   	inc    %ecx
  c052ba:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052bd:	41                   	inc    %ecx
  c052be:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052c1:	41                   	inc    %ecx
  c052c2:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052c5:	41                   	inc    %ecx
  c052c6:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052c9:	41                   	inc    %ecx
  c052ca:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052cd:	41                   	inc    %ecx
  c052ce:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052d1:	41                   	inc    %ecx
  c052d2:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052d5:	41                   	inc    %ecx
  c052d6:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052d9:	41                   	inc    %ecx
  c052da:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052dd:	41                   	inc    %ecx
  c052de:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052e1:	41                   	inc    %ecx
  c052e2:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052e5:	41                   	inc    %ecx
  c052e6:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052e9:	41                   	inc    %ecx
  c052ea:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052ed:	41                   	inc    %ecx
  c052ee:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052f1:	41                   	inc    %ecx
  c052f2:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052f5:	41                   	inc    %ecx
  c052f6:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052f9:	41                   	inc    %ecx
  c052fa:	c0 00 5a             	rolb   $0x5a,(%eax)
  c052fd:	41                   	inc    %ecx
  c052fe:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05301:	41                   	inc    %ecx
  c05302:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05305:	41                   	inc    %ecx
  c05306:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05309:	41                   	inc    %ecx
  c0530a:	c0 00 5a             	rolb   $0x5a,(%eax)
  c0530d:	41                   	inc    %ecx
  c0530e:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05311:	41                   	inc    %ecx
  c05312:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05315:	41                   	inc    %ecx
  c05316:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05319:	41                   	inc    %ecx
  c0531a:	c0 00 5a             	rolb   $0x5a,(%eax)
  c0531d:	41                   	inc    %ecx
  c0531e:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05321:	41                   	inc    %ecx
  c05322:	c0 00 9c             	rolb   $0x9c,(%eax)
  c05325:	40                   	inc    %eax
  c05326:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05329:	41                   	inc    %ecx
  c0532a:	c0 00 5a             	rolb   $0x5a,(%eax)
  c0532d:	41                   	inc    %ecx
  c0532e:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05331:	41                   	inc    %ecx
  c05332:	c0 00 a3             	rolb   $0xa3,(%eax)
  c05335:	40                   	inc    %eax
  c05336:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05339:	41                   	inc    %ecx
  c0533a:	c0 00 5a             	rolb   $0x5a,(%eax)
  c0533d:	41                   	inc    %ecx
  c0533e:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05341:	41                   	inc    %ecx
  c05342:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05345:	41                   	inc    %ecx
  c05346:	c0 00 5a             	rolb   $0x5a,(%eax)
  c05349:	41                   	inc    %ecx
  c0534a:	c0 00 5a             	rolb   $0x5a,(%eax)
  c0534d:	41                   	inc    %ecx
  c0534e:	c0 00 14             	rolb   $0x14,(%eax)
  c05351:	41                   	inc    %ecx
  c05352:	c0                   	.byte 0xc0
	...

Disassembly of section .eh_frame:

00c05354 <.eh_frame>:
  c05354:	14 00                	adc    $0x0,%al
  c05356:	00 00                	add    %al,(%eax)
  c05358:	00 00                	add    %al,(%eax)
  c0535a:	00 00                	add    %al,(%eax)
  c0535c:	01 7a 52             	add    %edi,0x52(%edx)
  c0535f:	00 01                	add    %al,(%ecx)
  c05361:	7c 08                	jl     c0536b <_upperDigits+0x19b>
  c05363:	01 1b                	add    %ebx,(%ebx)
  c05365:	0c 04                	or     $0x4,%al
  c05367:	04 88                	add    $0x88,%al
  c05369:	01 00                	add    %eax,(%eax)
  c0536b:	00 28                	add    %ch,(%eax)
  c0536d:	00 00                	add    %al,(%eax)
  c0536f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c05372:	00 00                	add    %al,(%eax)
  c05374:	8c ac ff ff 20 00 00 	mov    %gs,0x20ff(%edi,%edi,8)
  c0537b:	00 00                	add    %al,(%eax)
  c0537d:	41                   	inc    %ecx
  c0537e:	0e                   	push   %cs
  c0537f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05385:	43                   	inc    %ebx
  c05386:	87 03                	xchg   %eax,(%ebx)
  c05388:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c0538b:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  c05390:	41                   	inc    %ecx
  c05391:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05398:	1c 00                	sbb    $0x0,%al
  c0539a:	00 00                	add    %al,(%eax)
  c0539c:	48                   	dec    %eax
  c0539d:	00 00                	add    %al,(%eax)
  c0539f:	00 80 ac ff ff 62    	add    %al,0x62ffffac(%eax)
  c053a5:	00 00                	add    %al,(%eax)
  c053a7:	00 00                	add    %al,(%eax)
  c053a9:	41                   	inc    %ecx
  c053aa:	0e                   	push   %cs
  c053ab:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c053b1:	02 5e c5             	add    -0x3b(%esi),%bl
  c053b4:	0c 04                	or     $0x4,%al
  c053b6:	04 00                	add    $0x0,%al
  c053b8:	1c 00                	sbb    $0x0,%al
  c053ba:	00 00                	add    %al,(%eax)
  c053bc:	68 00 00 00 c2       	push   $0xc2000000
  c053c1:	ac                   	lods   %ds:(%esi),%al
  c053c2:	ff                   	(bad)  
  c053c3:	ff 13                	call   *(%ebx)
  c053c5:	00 00                	add    %al,(%eax)
  c053c7:	00 00                	add    %al,(%eax)
  c053c9:	41                   	inc    %ecx
  c053ca:	0e                   	push   %cs
  c053cb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c053d1:	4f                   	dec    %edi
  c053d2:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c053d5:	04 00                	add    $0x0,%al
  c053d7:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c053da:	00 00                	add    %al,(%eax)
  c053dc:	88 00                	mov    %al,(%eax)
  c053de:	00 00                	add    %al,(%eax)
  c053e0:	b5 ac                	mov    $0xac,%ch
  c053e2:	ff                   	(bad)  
  c053e3:	ff 43 07             	incl   0x7(%ebx)
  c053e6:	00 00                	add    %al,(%eax)
  c053e8:	00 41 0e             	add    %al,0xe(%ecx)
  c053eb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c053f1:	03 3f                	add    (%edi),%edi
  c053f3:	07                   	pop    %es
  c053f4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c053f7:	04 28                	add    $0x28,%al
  c053f9:	00 00                	add    %al,(%eax)
  c053fb:	00 a8 00 00 00 d8    	add    %ch,-0x28000000(%eax)
  c05401:	b3 ff                	mov    $0xff,%bl
  c05403:	ff 29                	ljmp   *(%ecx)
  c05405:	00 00                	add    %al,(%eax)
  c05407:	00 00                	add    %al,(%eax)
  c05409:	44                   	inc    %esp
  c0540a:	0c 01                	or     $0x1,%al
  c0540c:	00 47 10             	add    %al,0x10(%edi)
  c0540f:	05 02 75 00 43       	add    $0x43007502,%eax
  c05414:	0f 03 75 7c          	lsl    0x7c(%ebp),%esi
  c05418:	06                   	push   %es
  c05419:	56                   	push   %esi
  c0541a:	c1 0c 01 00          	rorl   $0x0,(%ecx,%eax,1)
  c0541e:	41                   	inc    %ecx
  c0541f:	c5 43 0c             	lds    0xc(%ebx),%eax
  c05422:	04 04                	add    $0x4,%al
  c05424:	1c 00                	sbb    $0x0,%al
  c05426:	00 00                	add    %al,(%eax)
  c05428:	d4 00                	aam    $0x0
  c0542a:	00 00                	add    %al,(%eax)
  c0542c:	d5 b3                	aad    $0xb3
  c0542e:	ff                   	(bad)  
  c0542f:	ff 1b                	lcall  *(%ebx)
  c05431:	00 00                	add    %al,(%eax)
  c05433:	00 00                	add    %al,(%eax)
  c05435:	41                   	inc    %ecx
  c05436:	0e                   	push   %cs
  c05437:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0543d:	57                   	push   %edi
  c0543e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05441:	04 00                	add    $0x0,%al
  c05443:	00 20                	add    %ah,(%eax)
  c05445:	00 00                	add    %al,(%eax)
  c05447:	00 f4                	add    %dh,%ah
  c05449:	00 00                	add    %al,(%eax)
  c0544b:	00 d0                	add    %dl,%al
  c0544d:	b3 ff                	mov    $0xff,%bl
  c0544f:	ff 1e                	lcall  *(%esi)
  c05451:	00 00                	add    %al,(%eax)
  c05453:	00 00                	add    %al,(%eax)
  c05455:	41                   	inc    %ecx
  c05456:	0e                   	push   %cs
  c05457:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0545d:	41                   	inc    %ecx
  c0545e:	87 03                	xchg   %eax,(%ebx)
  c05460:	58                   	pop    %eax
  c05461:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05468:	28 00                	sub    %al,(%eax)
  c0546a:	00 00                	add    %al,(%eax)
  c0546c:	18 01                	sbb    %al,(%ecx)
  c0546e:	00 00                	add    %al,(%eax)
  c05470:	ca b3 ff             	lret   $0xffb3
  c05473:	ff 20                	jmp    *(%eax)
  c05475:	00 00                	add    %al,(%eax)
  c05477:	00 00                	add    %al,(%eax)
  c05479:	41                   	inc    %ecx
  c0547a:	0e                   	push   %cs
  c0547b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05481:	43                   	inc    %ebx
  c05482:	87 03                	xchg   %eax,(%ebx)
  c05484:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c05487:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  c0548c:	41                   	inc    %ecx
  c0548d:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05494:	20 00                	and    %al,(%eax)
  c05496:	00 00                	add    %al,(%eax)
  c05498:	44                   	inc    %esp
  c05499:	01 00                	add    %eax,(%eax)
  c0549b:	00 be b3 ff ff 25    	add    %bh,0x25ffffb3(%esi)
  c054a1:	00 00                	add    %al,(%eax)
  c054a3:	00 00                	add    %al,(%eax)
  c054a5:	41                   	inc    %ecx
  c054a6:	0e                   	push   %cs
  c054a7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c054ad:	44                   	inc    %esp
  c054ae:	87 03                	xchg   %eax,(%ebx)
  c054b0:	5c                   	pop    %esp
  c054b1:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c054b8:	1c 00                	sbb    $0x0,%al
  c054ba:	00 00                	add    %al,(%eax)
  c054bc:	68 01 00 00 bf       	push   $0xbf000001
  c054c1:	b3 ff                	mov    $0xff,%bl
  c054c3:	ff 0a                	decl   (%edx)
  c054c5:	00 00                	add    %al,(%eax)
  c054c7:	00 00                	add    %al,(%eax)
  c054c9:	41                   	inc    %ecx
  c054ca:	0e                   	push   %cs
  c054cb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c054d1:	46                   	inc    %esi
  c054d2:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c054d5:	04 00                	add    $0x0,%al
  c054d7:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c054da:	00 00                	add    %al,(%eax)
  c054dc:	88 01                	mov    %al,(%ecx)
  c054de:	00 00                	add    %al,(%eax)
  c054e0:	a9 b3 ff ff 4c       	test   $0x4cffffb3,%eax
  c054e5:	00 00                	add    %al,(%eax)
  c054e7:	00 00                	add    %al,(%eax)
  c054e9:	41                   	inc    %ecx
  c054ea:	0e                   	push   %cs
  c054eb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c054f1:	02 48 c5             	add    -0x3b(%eax),%cl
  c054f4:	0c 04                	or     $0x4,%al
  c054f6:	04 00                	add    $0x0,%al
  c054f8:	2c 00                	sub    $0x0,%al
  c054fa:	00 00                	add    %al,(%eax)
  c054fc:	a8 01                	test   $0x1,%al
  c054fe:	00 00                	add    %al,(%eax)
  c05500:	d5 b3                	aad    $0xb3
  c05502:	ff                   	(bad)  
  c05503:	ff ef                	ljmp   *<internal disassembler error>
  c05505:	04 00                	add    $0x0,%al
  c05507:	00 00                	add    %al,(%eax)
  c05509:	41                   	inc    %ecx
  c0550a:	0e                   	push   %cs
  c0550b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05511:	46                   	inc    %esi
  c05512:	87 03                	xchg   %eax,(%ebx)
  c05514:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c05517:	05 03 e2 04 c3       	add    $0xc304e203,%eax
  c0551c:	41                   	inc    %ecx
  c0551d:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c05521:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05524:	04 00                	add    $0x0,%al
  c05526:	00 00                	add    %al,(%eax)
  c05528:	2c 00                	sub    $0x0,%al
  c0552a:	00 00                	add    %al,(%eax)
  c0552c:	d8 01                	fadds  (%ecx)
  c0552e:	00 00                	add    %al,(%eax)
  c05530:	94                   	xchg   %eax,%esp
  c05531:	b8 ff ff fc 03       	mov    $0x3fcffff,%eax
  c05536:	00 00                	add    %al,(%eax)
  c05538:	00 41 0e             	add    %al,0xe(%ecx)
  c0553b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05541:	46                   	inc    %esi
  c05542:	87 03                	xchg   %eax,(%ebx)
  c05544:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c05547:	05 03 ef 03 c3       	add    $0xc303ef03,%eax
  c0554c:	41                   	inc    %ecx
  c0554d:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c05551:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05554:	04 00                	add    $0x0,%al
  c05556:	00 00                	add    %al,(%eax)
  c05558:	28 00                	sub    %al,(%eax)
  c0555a:	00 00                	add    %al,(%eax)
  c0555c:	08 02                	or     %al,(%edx)
  c0555e:	00 00                	add    %al,(%eax)
  c05560:	60                   	pusha  
  c05561:	bc ff ff c0 00       	mov    $0xc0ffff,%esp
  c05566:	00 00                	add    %al,(%eax)
  c05568:	00 41 0e             	add    %al,0xe(%ecx)
  c0556b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05571:	43                   	inc    %ebx
  c05572:	87 03                	xchg   %eax,(%ebx)
  c05574:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c05577:	05 02 b6 c3 41       	add    $0x41c3b602,%eax
  c0557c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c05580:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05583:	04 24                	add    $0x24,%al
  c05585:	00 00                	add    %al,(%eax)
  c05587:	00 34 02             	add    %dh,(%edx,%eax,1)
  c0558a:	00 00                	add    %al,(%eax)
  c0558c:	f4                   	hlt    
  c0558d:	bc ff ff ad 00       	mov    $0xadffff,%esp
  c05592:	00 00                	add    %al,(%eax)
  c05594:	00 41 0e             	add    %al,0xe(%ecx)
  c05597:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0559d:	42                   	inc    %edx
  c0559e:	86 03                	xchg   %al,(%ebx)
  c055a0:	83 04 02 a5          	addl   $0xffffffa5,(%edx,%eax,1)
  c055a4:	c3                   	ret    
  c055a5:	41                   	inc    %ecx
  c055a6:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  c055aa:	04 04                	add    $0x4,%al
  c055ac:	2c 00                	sub    $0x0,%al
  c055ae:	00 00                	add    %al,(%eax)
  c055b0:	5c                   	pop    %esp
  c055b1:	02 00                	add    (%eax),%al
  c055b3:	00 79 bd             	add    %bh,-0x43(%ecx)
  c055b6:	ff                   	(bad)  
  c055b7:	ff 5e 01             	lcall  *0x1(%esi)
  c055ba:	00 00                	add    %al,(%eax)
  c055bc:	00 41 0e             	add    %al,0xe(%ecx)
  c055bf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c055c5:	46                   	inc    %esi
  c055c6:	87 03                	xchg   %eax,(%ebx)
  c055c8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c055cb:	05 03 51 01 c3       	add    $0xc3015103,%eax
  c055d0:	41                   	inc    %ecx
  c055d1:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c055d5:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c055d8:	04 00                	add    $0x0,%al
  c055da:	00 00                	add    %al,(%eax)
  c055dc:	1c 00                	sbb    $0x0,%al
  c055de:	00 00                	add    %al,(%eax)
  c055e0:	8c 02                	mov    %es,(%edx)
  c055e2:	00 00                	add    %al,(%eax)
  c055e4:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
  c055e5:	be ff ff 26 01       	mov    $0x126ffff,%esi
  c055ea:	00 00                	add    %al,(%eax)
  c055ec:	00 41 0e             	add    %al,0xe(%ecx)
  c055ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c055f5:	03 22                	add    (%edx),%esp
  c055f7:	01 c5                	add    %eax,%ebp
  c055f9:	0c 04                	or     $0x4,%al
  c055fb:	04 20                	add    $0x20,%al
  c055fd:	00 00                	add    %al,(%eax)
  c055ff:	00 ac 02 00 00 ad bf 	add    %ch,-0x40530000(%edx,%eax,1)
  c05606:	ff                   	(bad)  
  c05607:	ff 8f 00 00 00 00    	decl   0x0(%edi)
  c0560d:	41                   	inc    %ecx
  c0560e:	0e                   	push   %cs
  c0560f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05615:	44                   	inc    %esp
  c05616:	83 03 02             	addl   $0x2,(%ebx)
  c05619:	87 c5                	xchg   %eax,%ebp
  c0561b:	c3                   	ret    
  c0561c:	0c 04                	or     $0x4,%al
  c0561e:	04 00                	add    $0x0,%al
  c05620:	1c 00                	sbb    $0x0,%al
  c05622:	00 00                	add    %al,(%eax)
  c05624:	d0 02                	rolb   (%edx)
  c05626:	00 00                	add    %al,(%eax)
  c05628:	18 c0                	sbb    %al,%al
  c0562a:	ff                   	(bad)  
  c0562b:	ff c0                	inc    %eax
  c0562d:	00 00                	add    %al,(%eax)
  c0562f:	00 00                	add    %al,(%eax)
  c05631:	41                   	inc    %ecx
  c05632:	0e                   	push   %cs
  c05633:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05639:	02 bc c5 0c 04 04 00 	add    0x4040c(%ebp,%eax,8),%bh
  c05640:	1c 00                	sbb    $0x0,%al
  c05642:	00 00                	add    %al,(%eax)
  c05644:	f0 02 00             	lock add (%eax),%al
  c05647:	00 b8 c0 ff ff 69    	add    %bh,0x69ffffc0(%eax)
  c0564d:	00 00                	add    %al,(%eax)
  c0564f:	00 00                	add    %al,(%eax)
  c05651:	41                   	inc    %ecx
  c05652:	0e                   	push   %cs
  c05653:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05659:	02 65 c5             	add    -0x3b(%ebp),%ah
  c0565c:	0c 04                	or     $0x4,%al
  c0565e:	04 00                	add    $0x0,%al
  c05660:	1c 00                	sbb    $0x0,%al
  c05662:	00 00                	add    %al,(%eax)
  c05664:	10 03                	adc    %al,(%ebx)
  c05666:	00 00                	add    %al,(%eax)
  c05668:	01 c1                	add    %eax,%ecx
  c0566a:	ff                   	(bad)  
  c0566b:	ff 8a 00 00 00 00    	decl   0x0(%edx)
  c05671:	41                   	inc    %ecx
  c05672:	0e                   	push   %cs
  c05673:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05679:	02 86 c5 0c 04 04    	add    0x4040cc5(%esi),%al
  c0567f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c05682:	00 00                	add    %al,(%eax)
  c05684:	30 03                	xor    %al,(%ebx)
  c05686:	00 00                	add    %al,(%eax)
  c05688:	6b c1 ff             	imul   $0xffffffff,%ecx,%eax
  c0568b:	ff 77 00             	pushl  0x0(%edi)
  c0568e:	00 00                	add    %al,(%eax)
  c05690:	00 41 0e             	add    %al,0xe(%ecx)
  c05693:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05699:	02 73 c5             	add    -0x3b(%ebx),%dh
  c0569c:	0c 04                	or     $0x4,%al
  c0569e:	04 00                	add    $0x0,%al
  c056a0:	1c 00                	sbb    $0x0,%al
  c056a2:	00 00                	add    %al,(%eax)
  c056a4:	50                   	push   %eax
  c056a5:	03 00                	add    (%eax),%eax
  c056a7:	00 c2                	add    %al,%dl
  c056a9:	c1 ff ff             	sar    $0xff,%edi
  c056ac:	9d                   	popf   
  c056ad:	00 00                	add    %al,(%eax)
  c056af:	00 00                	add    %al,(%eax)
  c056b1:	41                   	inc    %ecx
  c056b2:	0e                   	push   %cs
  c056b3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c056b9:	02 99 c5 0c 04 04    	add    0x4040cc5(%ecx),%bl
  c056bf:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c056c2:	00 00                	add    %al,(%eax)
  c056c4:	70 03                	jo     c056c9 <_upperDigits+0x4f9>
  c056c6:	00 00                	add    %al,(%eax)
  c056c8:	3f                   	aas    
  c056c9:	c2 ff ff             	ret    $0xffff
  c056cc:	78 00                	js     c056ce <_upperDigits+0x4fe>
  c056ce:	00 00                	add    %al,(%eax)
  c056d0:	00 41 0e             	add    %al,0xe(%ecx)
  c056d3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c056d9:	02 74 c5 0c          	add    0xc(%ebp,%eax,8),%dh
  c056dd:	04 04                	add    $0x4,%al
  c056df:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c056e2:	00 00                	add    %al,(%eax)
  c056e4:	90                   	nop
  c056e5:	03 00                	add    (%eax),%eax
  c056e7:	00 97 c2 ff ff cb    	add    %dl,-0x3400003e(%edi)
  c056ed:	00 00                	add    %al,(%eax)
  c056ef:	00 00                	add    %al,(%eax)
  c056f1:	41                   	inc    %ecx
  c056f2:	0e                   	push   %cs
  c056f3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c056f9:	02 c7                	add    %bh,%al
  c056fb:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c056fe:	04 00                	add    $0x0,%al
  c05700:	1c 00                	sbb    $0x0,%al
  c05702:	00 00                	add    %al,(%eax)
  c05704:	b0 03                	mov    $0x3,%al
  c05706:	00 00                	add    %al,(%eax)
  c05708:	42                   	inc    %edx
  c05709:	c3                   	ret    
  c0570a:	ff                   	(bad)  
  c0570b:	ff b4 00 00 00 00 41 	pushl  0x41000000(%eax,%eax,1)
  c05712:	0e                   	push   %cs
  c05713:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05719:	02 b0 c5 0c 04 04    	add    0x4040cc5(%eax),%dh
  c0571f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c05722:	00 00                	add    %al,(%eax)
  c05724:	d0 03                	rolb   (%ebx)
  c05726:	00 00                	add    %al,(%eax)
  c05728:	d6                   	(bad)  
  c05729:	c3                   	ret    
  c0572a:	ff                   	(bad)  
  c0572b:	ff 09                	decl   (%ecx)
  c0572d:	01 00                	add    %eax,(%eax)
  c0572f:	00 00                	add    %al,(%eax)
  c05731:	41                   	inc    %ecx
  c05732:	0e                   	push   %cs
  c05733:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05739:	03 05 01 c5 0c 04    	add    0x40cc501,%eax
  c0573f:	04 1c                	add    $0x1c,%al
  c05741:	00 00                	add    %al,(%eax)
  c05743:	00 f0                	add    %dh,%al
  c05745:	03 00                	add    (%eax),%eax
  c05747:	00 bf c4 ff ff db    	add    %bh,-0x2400003c(%edi)
  c0574d:	00 00                	add    %al,(%eax)
  c0574f:	00 00                	add    %al,(%eax)
  c05751:	41                   	inc    %ecx
  c05752:	0e                   	push   %cs
  c05753:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05759:	02 d7                	add    %bh,%dl
  c0575b:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c0575e:	04 00                	add    $0x0,%al
  c05760:	1c 00                	sbb    $0x0,%al
  c05762:	00 00                	add    %al,(%eax)
  c05764:	10 04 00             	adc    %al,(%eax,%eax,1)
  c05767:	00 7a c5             	add    %bh,-0x3b(%edx)
  c0576a:	ff                   	(bad)  
  c0576b:	ff 22                	jmp    *(%edx)
  c0576d:	00 00                	add    %al,(%eax)
  c0576f:	00 00                	add    %al,(%eax)
  c05771:	41                   	inc    %ecx
  c05772:	0e                   	push   %cs
  c05773:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05779:	5e                   	pop    %esi
  c0577a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c0577d:	04 00                	add    $0x0,%al
  c0577f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c05782:	00 00                	add    %al,(%eax)
  c05784:	30 04 00             	xor    %al,(%eax,%eax,1)
  c05787:	00 7c c5 ff          	add    %bh,-0x1(%ebp,%eax,8)
  c0578b:	ff b4 00 00 00 00 41 	pushl  0x41000000(%eax,%eax,1)
  c05792:	0e                   	push   %cs
  c05793:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05799:	02 b0 c5 0c 04 04    	add    0x4040cc5(%eax),%dh
  c0579f:	00 18                	add    %bl,(%eax)
  c057a1:	00 00                	add    %al,(%eax)
  c057a3:	00 50 04             	add    %dl,0x4(%eax)
  c057a6:	00 00                	add    %al,(%eax)
  c057a8:	10 c6                	adc    %al,%dh
  c057aa:	ff                   	(bad)  
  c057ab:	ff 23                	jmp    *(%ebx)
  c057ad:	00 00                	add    %al,(%eax)
  c057af:	00 00                	add    %al,(%eax)
  c057b1:	41                   	inc    %ecx
  c057b2:	0e                   	push   %cs
  c057b3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c057b9:	00 00                	add    %al,(%eax)
  c057bb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c057be:	00 00                	add    %al,(%eax)
  c057c0:	6c                   	insb   (%dx),%es:(%edi)
  c057c1:	04 00                	add    $0x0,%al
  c057c3:	00 17                	add    %dl,(%edi)
  c057c5:	c6                   	(bad)  
  c057c6:	ff                   	(bad)  
  c057c7:	ff 0a                	decl   (%edx)
  c057c9:	00 00                	add    %al,(%eax)
  c057cb:	00 00                	add    %al,(%eax)
  c057cd:	41                   	inc    %ecx
  c057ce:	0e                   	push   %cs
  c057cf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c057d5:	46                   	inc    %esi
  c057d6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c057d9:	04 00                	add    $0x0,%al
  c057db:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c057de:	00 00                	add    %al,(%eax)
  c057e0:	8c 04 00             	mov    %es,(%eax,%eax,1)
  c057e3:	00 01                	add    %al,(%ecx)
  c057e5:	c6                   	(bad)  
  c057e6:	ff                   	(bad)  
  c057e7:	ff 0a                	decl   (%edx)
  c057e9:	00 00                	add    %al,(%eax)
  c057eb:	00 00                	add    %al,(%eax)
  c057ed:	41                   	inc    %ecx
  c057ee:	0e                   	push   %cs
  c057ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c057f5:	46                   	inc    %esi
  c057f6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c057f9:	04 00                	add    $0x0,%al
  c057fb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c057fe:	00 00                	add    %al,(%eax)
  c05800:	ac                   	lods   %ds:(%esi),%al
  c05801:	04 00                	add    $0x0,%al
  c05803:	00 eb                	add    %ch,%bl
  c05805:	c5 ff ff             	(bad)  
  c05808:	0a 00                	or     (%eax),%al
  c0580a:	00 00                	add    %al,(%eax)
  c0580c:	00 41 0e             	add    %al,0xe(%ecx)
  c0580f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05815:	46                   	inc    %esi
  c05816:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05819:	04 00                	add    $0x0,%al
  c0581b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c0581e:	00 00                	add    %al,(%eax)
  c05820:	cc                   	int3   
  c05821:	04 00                	add    $0x0,%al
  c05823:	00 d5                	add    %dl,%ch
  c05825:	c5 ff ff             	(bad)  
  c05828:	0a 00                	or     (%eax),%al
  c0582a:	00 00                	add    %al,(%eax)
  c0582c:	00 41 0e             	add    %al,0xe(%ecx)
  c0582f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05835:	46                   	inc    %esi
  c05836:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05839:	04 00                	add    $0x0,%al
  c0583b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c0583e:	00 00                	add    %al,(%eax)
  c05840:	ec                   	in     (%dx),%al
  c05841:	04 00                	add    $0x0,%al
  c05843:	00 bf c5 ff ff 0a    	add    %bh,0xaffffc5(%edi)
  c05849:	00 00                	add    %al,(%eax)
  c0584b:	00 00                	add    %al,(%eax)
  c0584d:	41                   	inc    %ecx
  c0584e:	0e                   	push   %cs
  c0584f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05855:	46                   	inc    %esi
  c05856:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05859:	04 00                	add    $0x0,%al
  c0585b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c0585e:	00 00                	add    %al,(%eax)
  c05860:	0c 05                	or     $0x5,%al
  c05862:	00 00                	add    %al,(%eax)
  c05864:	a9 c5 ff ff 0d       	test   $0xdffffc5,%eax
  c05869:	00 00                	add    %al,(%eax)
  c0586b:	00 00                	add    %al,(%eax)
  c0586d:	41                   	inc    %ecx
  c0586e:	0e                   	push   %cs
  c0586f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05875:	49                   	dec    %ecx
  c05876:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05879:	04 00                	add    $0x0,%al
  c0587b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c0587e:	00 00                	add    %al,(%eax)
  c05880:	2c 05                	sub    $0x5,%al
  c05882:	00 00                	add    %al,(%eax)
  c05884:	96                   	xchg   %eax,%esi
  c05885:	c5 ff ff             	(bad)  
  c05888:	0d 00 00 00 00       	or     $0x0,%eax
  c0588d:	41                   	inc    %ecx
  c0588e:	0e                   	push   %cs
  c0588f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05895:	49                   	dec    %ecx
  c05896:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05899:	04 00                	add    $0x0,%al
  c0589b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c0589e:	00 00                	add    %al,(%eax)
  c058a0:	4c                   	dec    %esp
  c058a1:	05 00 00 83 c5       	add    $0xc5830000,%eax
  c058a6:	ff                   	(bad)  
  c058a7:	ff 0d 00 00 00 00    	decl   0x0
  c058ad:	41                   	inc    %ecx
  c058ae:	0e                   	push   %cs
  c058af:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c058b5:	49                   	dec    %ecx
  c058b6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c058b9:	04 00                	add    $0x0,%al
  c058bb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c058be:	00 00                	add    %al,(%eax)
  c058c0:	6c                   	insb   (%dx),%es:(%edi)
  c058c1:	05 00 00 70 c5       	add    $0xc5700000,%eax
  c058c6:	ff                   	(bad)  
  c058c7:	ff 0a                	decl   (%edx)
  c058c9:	00 00                	add    %al,(%eax)
  c058cb:	00 00                	add    %al,(%eax)
  c058cd:	41                   	inc    %ecx
  c058ce:	0e                   	push   %cs
  c058cf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c058d5:	46                   	inc    %esi
  c058d6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c058d9:	04 00                	add    $0x0,%al
  c058db:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c058de:	00 00                	add    %al,(%eax)
  c058e0:	8c 05 00 00 5a c5    	mov    %es,0xc55a0000
  c058e6:	ff                   	(bad)  
  c058e7:	ff 0d 00 00 00 00    	decl   0x0
  c058ed:	41                   	inc    %ecx
  c058ee:	0e                   	push   %cs
  c058ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c058f5:	49                   	dec    %ecx
  c058f6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c058f9:	04 00                	add    $0x0,%al
  c058fb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c058fe:	00 00                	add    %al,(%eax)
  c05900:	ac                   	lods   %ds:(%esi),%al
  c05901:	05 00 00 47 c5       	add    $0xc5470000,%eax
  c05906:	ff                   	(bad)  
  c05907:	ff 64 00 00          	jmp    *0x0(%eax,%eax,1)
  c0590b:	00 00                	add    %al,(%eax)
  c0590d:	41                   	inc    %ecx
  c0590e:	0e                   	push   %cs
  c0590f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05915:	02 60 c5             	add    -0x3b(%eax),%ah
  c05918:	0c 04                	or     $0x4,%al
  c0591a:	04 00                	add    $0x0,%al
  c0591c:	1c 00                	sbb    $0x0,%al
  c0591e:	00 00                	add    %al,(%eax)
  c05920:	cc                   	int3   
  c05921:	05 00 00 8b c5       	add    $0xc58b0000,%eax
  c05926:	ff                   	(bad)  
  c05927:	ff 97 00 00 00 00    	call   *0x0(%edi)
  c0592d:	41                   	inc    %ecx
  c0592e:	0e                   	push   %cs
  c0592f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05935:	02 93 c5 0c 04 04    	add    0x4040cc5(%ebx),%dl
  c0593b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c0593e:	00 00                	add    %al,(%eax)
  c05940:	ec                   	in     (%dx),%al
  c05941:	05 00 00 02 c6       	add    $0xc6020000,%eax
  c05946:	ff                   	(bad)  
  c05947:	ff 16                	call   *(%esi)
  c05949:	00 00                	add    %al,(%eax)
  c0594b:	00 00                	add    %al,(%eax)
  c0594d:	41                   	inc    %ecx
  c0594e:	0e                   	push   %cs
  c0594f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05955:	52                   	push   %edx
  c05956:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05959:	04 00                	add    $0x0,%al
  c0595b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c0595e:	00 00                	add    %al,(%eax)
  c05960:	0c 06                	or     $0x6,%al
  c05962:	00 00                	add    %al,(%eax)
  c05964:	f8                   	clc    
  c05965:	c5 ff ff             	(bad)  
  c05968:	19 00                	sbb    %eax,(%eax)
  c0596a:	00 00                	add    %al,(%eax)
  c0596c:	00 41 0e             	add    %al,0xe(%ecx)
  c0596f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05975:	55                   	push   %ebp
  c05976:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05979:	04 00                	add    $0x0,%al
  c0597b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c0597e:	00 00                	add    %al,(%eax)
  c05980:	2c 06                	sub    $0x6,%al
  c05982:	00 00                	add    %al,(%eax)
  c05984:	f1                   	icebp  
  c05985:	c5 ff ff             	(bad)  
  c05988:	16                   	push   %ss
  c05989:	00 00                	add    %al,(%eax)
  c0598b:	00 00                	add    %al,(%eax)
  c0598d:	41                   	inc    %ecx
  c0598e:	0e                   	push   %cs
  c0598f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05995:	52                   	push   %edx
  c05996:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05999:	04 00                	add    $0x0,%al
  c0599b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c0599e:	00 00                	add    %al,(%eax)
  c059a0:	4c                   	dec    %esp
  c059a1:	06                   	push   %es
  c059a2:	00 00                	add    %al,(%eax)
  c059a4:	e7 c5                	out    %eax,$0xc5
  c059a6:	ff                   	(bad)  
  c059a7:	ff 0a                	decl   (%edx)
  c059a9:	00 00                	add    %al,(%eax)
  c059ab:	00 00                	add    %al,(%eax)
  c059ad:	41                   	inc    %ecx
  c059ae:	0e                   	push   %cs
  c059af:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c059b5:	46                   	inc    %esi
  c059b6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c059b9:	04 00                	add    $0x0,%al
  c059bb:	00 28                	add    %ch,(%eax)
  c059bd:	00 00                	add    %al,(%eax)
  c059bf:	00 6c 06 00          	add    %ch,0x0(%esi,%eax,1)
  c059c3:	00 d4                	add    %dl,%ah
  c059c5:	c5 ff ff             	(bad)  
  c059c8:	2c 00                	sub    $0x0,%al
  c059ca:	00 00                	add    %al,(%eax)
  c059cc:	00 41 0e             	add    %al,0xe(%ecx)
  c059cf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c059d5:	43                   	inc    %ebx
  c059d6:	87 03                	xchg   %eax,(%ebx)
  c059d8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c059db:	05 62 c3 41 c6       	add    $0xc641c362,%eax
  c059e0:	41                   	inc    %ecx
  c059e1:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c059e8:	20 00                	and    %al,(%eax)
  c059ea:	00 00                	add    %al,(%eax)
  c059ec:	98                   	cwtl   
  c059ed:	06                   	push   %es
  c059ee:	00 00                	add    %al,(%eax)
  c059f0:	d4 c5                	aam    $0xc5
  c059f2:	ff                   	(bad)  
  c059f3:	ff 1e                	lcall  *(%esi)
  c059f5:	00 00                	add    %al,(%eax)
  c059f7:	00 00                	add    %al,(%eax)
  c059f9:	41                   	inc    %ecx
  c059fa:	0e                   	push   %cs
  c059fb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05a01:	41                   	inc    %ecx
  c05a02:	87 03                	xchg   %eax,(%ebx)
  c05a04:	58                   	pop    %eax
  c05a05:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05a0c:	28 00                	sub    %al,(%eax)
  c05a0e:	00 00                	add    %al,(%eax)
  c05a10:	bc 06 00 00 ce       	mov    $0xce000006,%esp
  c05a15:	c5 ff ff             	(bad)  
  c05a18:	20 00                	and    %al,(%eax)
  c05a1a:	00 00                	add    %al,(%eax)
  c05a1c:	00 41 0e             	add    %al,0xe(%ecx)
  c05a1f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05a25:	43                   	inc    %ebx
  c05a26:	87 03                	xchg   %eax,(%ebx)
  c05a28:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c05a2b:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  c05a30:	41                   	inc    %ecx
  c05a31:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05a38:	1c 00                	sbb    $0x0,%al
  c05a3a:	00 00                	add    %al,(%eax)
  c05a3c:	e8 06 00 00 c2       	call   c2c05a47 <_end+0xc1fe0067>
  c05a41:	c5 ff ff             	(bad)  
  c05a44:	4c                   	dec    %esp
  c05a45:	00 00                	add    %al,(%eax)
  c05a47:	00 00                	add    %al,(%eax)
  c05a49:	41                   	inc    %ecx
  c05a4a:	0e                   	push   %cs
  c05a4b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05a51:	02 48 c5             	add    -0x3b(%eax),%cl
  c05a54:	0c 04                	or     $0x4,%al
  c05a56:	04 00                	add    $0x0,%al
  c05a58:	1c 00                	sbb    $0x0,%al
  c05a5a:	00 00                	add    %al,(%eax)
  c05a5c:	08 07                	or     %al,(%edi)
  c05a5e:	00 00                	add    %al,(%eax)
  c05a60:	ee                   	out    %al,(%dx)
  c05a61:	c5 ff ff             	(bad)  
  c05a64:	62 00                	bound  %eax,(%eax)
  c05a66:	00 00                	add    %al,(%eax)
  c05a68:	00 41 0e             	add    %al,0xe(%ecx)
  c05a6b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05a71:	02 5e c5             	add    -0x3b(%esi),%bl
  c05a74:	0c 04                	or     $0x4,%al
  c05a76:	04 00                	add    $0x0,%al
  c05a78:	1c 00                	sbb    $0x0,%al
  c05a7a:	00 00                	add    %al,(%eax)
  c05a7c:	28 07                	sub    %al,(%edi)
  c05a7e:	00 00                	add    %al,(%eax)
  c05a80:	30 c6                	xor    %al,%dh
  c05a82:	ff                   	(bad)  
  c05a83:	ff                   	(bad)  
  c05a84:	3f                   	aas    
  c05a85:	00 00                	add    %al,(%eax)
  c05a87:	00 00                	add    %al,(%eax)
  c05a89:	41                   	inc    %ecx
  c05a8a:	0e                   	push   %cs
  c05a8b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05a91:	7b c5                	jnp    c05a58 <_upperDigits+0x888>
  c05a93:	0c 04                	or     $0x4,%al
  c05a95:	04 00                	add    $0x0,%al
  c05a97:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c05a9a:	00 00                	add    %al,(%eax)
  c05a9c:	48                   	dec    %eax
  c05a9d:	07                   	pop    %es
  c05a9e:	00 00                	add    %al,(%eax)
  c05aa0:	4f                   	dec    %edi
  c05aa1:	c6                   	(bad)  
  c05aa2:	ff                   	(bad)  
  c05aa3:	ff 36                	pushl  (%esi)
  c05aa5:	00 00                	add    %al,(%eax)
  c05aa7:	00 00                	add    %al,(%eax)
  c05aa9:	41                   	inc    %ecx
  c05aaa:	0e                   	push   %cs
  c05aab:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05ab1:	72 c5                	jb     c05a78 <_upperDigits+0x8a8>
  c05ab3:	0c 04                	or     $0x4,%al
  c05ab5:	04 00                	add    $0x0,%al
  c05ab7:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c05aba:	00 00                	add    %al,(%eax)
  c05abc:	68 07 00 00 65       	push   $0x65000007
  c05ac1:	c6                   	(bad)  
  c05ac2:	ff                   	(bad)  
  c05ac3:	ff 71 00             	pushl  0x0(%ecx)
  c05ac6:	00 00                	add    %al,(%eax)
  c05ac8:	00 41 0e             	add    %al,0xe(%ecx)
  c05acb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05ad1:	02 6d c5             	add    -0x3b(%ebp),%ch
  c05ad4:	0c 04                	or     $0x4,%al
  c05ad6:	04 00                	add    $0x0,%al
  c05ad8:	1c 00                	sbb    $0x0,%al
  c05ada:	00 00                	add    %al,(%eax)
  c05adc:	88 07                	mov    %al,(%edi)
  c05ade:	00 00                	add    %al,(%eax)
  c05ae0:	b6 c6                	mov    $0xc6,%dh
  c05ae2:	ff                   	(bad)  
  c05ae3:	ff                   	(bad)  
  c05ae4:	7d 00                	jge    c05ae6 <_upperDigits+0x916>
  c05ae6:	00 00                	add    %al,(%eax)
  c05ae8:	00 41 0e             	add    %al,0xe(%ecx)
  c05aeb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05af1:	02 79 c5             	add    -0x3b(%ecx),%bh
  c05af4:	0c 04                	or     $0x4,%al
  c05af6:	04 00                	add    $0x0,%al
  c05af8:	1c 00                	sbb    $0x0,%al
  c05afa:	00 00                	add    %al,(%eax)
  c05afc:	a8 07                	test   $0x7,%al
  c05afe:	00 00                	add    %al,(%eax)
  c05b00:	13 c7                	adc    %edi,%eax
  c05b02:	ff                   	(bad)  
  c05b03:	ff 54 00 00          	call   *0x0(%eax,%eax,1)
  c05b07:	00 00                	add    %al,(%eax)
  c05b09:	41                   	inc    %ecx
  c05b0a:	0e                   	push   %cs
  c05b0b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05b11:	02 50 c5             	add    -0x3b(%eax),%dl
  c05b14:	0c 04                	or     $0x4,%al
  c05b16:	04 00                	add    $0x0,%al
  c05b18:	1c 00                	sbb    $0x0,%al
  c05b1a:	00 00                	add    %al,(%eax)
  c05b1c:	c8 07 00 00          	enter  $0x7,$0x0
  c05b20:	47                   	inc    %edi
  c05b21:	c7                   	(bad)  
  c05b22:	ff                   	(bad)  
  c05b23:	ff b0 00 00 00 00    	pushl  0x0(%eax)
  c05b29:	41                   	inc    %ecx
  c05b2a:	0e                   	push   %cs
  c05b2b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05b31:	02 ac c5 0c 04 04 00 	add    0x4040c(%ebp,%eax,8),%ch
  c05b38:	20 00                	and    %al,(%eax)
  c05b3a:	00 00                	add    %al,(%eax)
  c05b3c:	e8 07 00 00 d7       	call   d7c05b48 <_end+0xd6fe0168>
  c05b41:	c7                   	(bad)  
  c05b42:	ff                   	(bad)  
  c05b43:	ff 73 00             	pushl  0x0(%ebx)
  c05b46:	00 00                	add    %al,(%eax)
  c05b48:	00 41 0e             	add    %al,0xe(%ecx)
  c05b4b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05b51:	44                   	inc    %esp
  c05b52:	83 03 02             	addl   $0x2,(%ebx)
  c05b55:	6b c5 c3             	imul   $0xffffffc3,%ebp,%eax
  c05b58:	0c 04                	or     $0x4,%al
  c05b5a:	04 00                	add    $0x0,%al
  c05b5c:	20 00                	and    %al,(%eax)
  c05b5e:	00 00                	add    %al,(%eax)
  c05b60:	0c 08                	or     $0x8,%al
  c05b62:	00 00                	add    %al,(%eax)
  c05b64:	26                   	es
  c05b65:	c8 ff ff fe          	enter  $0xffff,$0xfe
  c05b69:	00 00                	add    %al,(%eax)
  c05b6b:	00 00                	add    %al,(%eax)
  c05b6d:	41                   	inc    %ecx
  c05b6e:	0e                   	push   %cs
  c05b6f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05b75:	44                   	inc    %esp
  c05b76:	83 03 02             	addl   $0x2,(%ebx)
  c05b79:	f6 c5 c3             	test   $0xc3,%ch
  c05b7c:	0c 04                	or     $0x4,%al
  c05b7e:	04 00                	add    $0x0,%al
  c05b80:	20 00                	and    %al,(%eax)
  c05b82:	00 00                	add    %al,(%eax)
  c05b84:	30 08                	xor    %cl,(%eax)
  c05b86:	00 00                	add    %al,(%eax)
  c05b88:	00 c9                	add    %cl,%cl
  c05b8a:	ff                   	(bad)  
  c05b8b:	ff 93 00 00 00 00    	call   *0x0(%ebx)
  c05b91:	41                   	inc    %ecx
  c05b92:	0e                   	push   %cs
  c05b93:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05b99:	44                   	inc    %esp
  c05b9a:	83 03 02             	addl   $0x2,(%ebx)
  c05b9d:	8b c5                	mov    %ebp,%eax
  c05b9f:	c3                   	ret    
  c05ba0:	0c 04                	or     $0x4,%al
  c05ba2:	04 00                	add    $0x0,%al
  c05ba4:	20 00                	and    %al,(%eax)
  c05ba6:	00 00                	add    %al,(%eax)
  c05ba8:	54                   	push   %esp
  c05ba9:	08 00                	or     %al,(%eax)
  c05bab:	00 6f c9             	add    %ch,-0x37(%edi)
  c05bae:	ff                   	(bad)  
  c05baf:	ff b5 00 00 00 00    	pushl  0x0(%ebp)
  c05bb5:	41                   	inc    %ecx
  c05bb6:	0e                   	push   %cs
  c05bb7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05bbd:	44                   	inc    %esp
  c05bbe:	83 03 02             	addl   $0x2,(%ebx)
  c05bc1:	ad                   	lods   %ds:(%esi),%eax
  c05bc2:	c5 c3 0c             	(bad)  
  c05bc5:	04 04                	add    $0x4,%al
  c05bc7:	00 18                	add    %bl,(%eax)
  c05bc9:	00 00                	add    %al,(%eax)
  c05bcb:	00 78 08             	add    %bh,0x8(%eax)
  c05bce:	00 00                	add    %al,(%eax)
  c05bd0:	00 ca                	add    %cl,%dl
  c05bd2:	ff                   	(bad)  
  c05bd3:	ff 10                	call   *(%eax)
  c05bd5:	00 00                	add    %al,(%eax)
  c05bd7:	00 00                	add    %al,(%eax)
  c05bd9:	41                   	inc    %ecx
  c05bda:	0e                   	push   %cs
  c05bdb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05be1:	00 00                	add    %al,(%eax)
  c05be3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c05be6:	00 00                	add    %al,(%eax)
  c05be8:	94                   	xchg   %eax,%esp
  c05be9:	08 00                	or     %al,(%eax)
  c05beb:	00 f4                	add    %dh,%ah
  c05bed:	c9                   	leave  
  c05bee:	ff                   	(bad)  
  c05bef:	ff                   	(bad)  
  c05bf0:	79 00                	jns    c05bf2 <_upperDigits+0xa22>
  c05bf2:	00 00                	add    %al,(%eax)
  c05bf4:	00 41 0e             	add    %al,0xe(%ecx)
  c05bf7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05bfd:	02 75 c5             	add    -0x3b(%ebp),%dh
  c05c00:	0c 04                	or     $0x4,%al
  c05c02:	04 00                	add    $0x0,%al
  c05c04:	1c 00                	sbb    $0x0,%al
  c05c06:	00 00                	add    %al,(%eax)
  c05c08:	b4 08                	mov    $0x8,%ah
  c05c0a:	00 00                	add    %al,(%eax)
  c05c0c:	4d                   	dec    %ebp
  c05c0d:	ca ff ff             	lret   $0xffff
  c05c10:	3a 00                	cmp    (%eax),%al
  c05c12:	00 00                	add    %al,(%eax)
  c05c14:	00 41 0e             	add    %al,0xe(%ecx)
  c05c17:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05c1d:	76 c5                	jbe    c05be4 <_upperDigits+0xa14>
  c05c1f:	0c 04                	or     $0x4,%al
  c05c21:	04 00                	add    $0x0,%al
  c05c23:	00 20                	add    %ah,(%eax)
  c05c25:	00 00                	add    %al,(%eax)
  c05c27:	00 d4                	add    %dl,%ah
  c05c29:	08 00                	or     %al,(%eax)
  c05c2b:	00 67 ca             	add    %ah,-0x36(%edi)
  c05c2e:	ff                   	(bad)  
  c05c2f:	ff c5                	inc    %ebp
  c05c31:	00 00                	add    %al,(%eax)
  c05c33:	00 00                	add    %al,(%eax)
  c05c35:	41                   	inc    %ecx
  c05c36:	0e                   	push   %cs
  c05c37:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05c3d:	44                   	inc    %esp
  c05c3e:	83 03 02             	addl   $0x2,(%ebx)
  c05c41:	bd c5 c3 0c 04       	mov    $0x40cc3c5,%ebp
  c05c46:	04 00                	add    $0x0,%al
  c05c48:	20 00                	and    %al,(%eax)
  c05c4a:	00 00                	add    %al,(%eax)
  c05c4c:	f8                   	clc    
  c05c4d:	08 00                	or     %al,(%eax)
  c05c4f:	00 08                	add    %cl,(%eax)
  c05c51:	cb                   	lret   
  c05c52:	ff                   	(bad)  
  c05c53:	ff f6                	push   %esi
  c05c55:	00 00                	add    %al,(%eax)
  c05c57:	00 00                	add    %al,(%eax)
  c05c59:	41                   	inc    %ecx
  c05c5a:	0e                   	push   %cs
  c05c5b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05c61:	44                   	inc    %esp
  c05c62:	83 03 02             	addl   $0x2,(%ebx)
  c05c65:	ee                   	out    %al,(%dx)
  c05c66:	c5 c3 0c             	(bad)  
  c05c69:	04 04                	add    $0x4,%al
  c05c6b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c05c6e:	00 00                	add    %al,(%eax)
  c05c70:	1c 09                	sbb    $0x9,%al
  c05c72:	00 00                	add    %al,(%eax)
  c05c74:	da cb                	fcmove %st(3),%st
  c05c76:	ff                   	(bad)  
  c05c77:	ff 18                	lcall  *(%eax)
  c05c79:	00 00                	add    %al,(%eax)
  c05c7b:	00 00                	add    %al,(%eax)
  c05c7d:	41                   	inc    %ecx
  c05c7e:	0e                   	push   %cs
  c05c7f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05c85:	54                   	push   %esp
  c05c86:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05c89:	04 00                	add    $0x0,%al
  c05c8b:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c05c8e:	00 00                	add    %al,(%eax)
  c05c90:	3c 09                	cmp    $0x9,%al
  c05c92:	00 00                	add    %al,(%eax)
  c05c94:	d2 cb                	ror    %cl,%bl
  c05c96:	ff                   	(bad)  
  c05c97:	ff 8d 01 00 00 00    	decl   0x1(%ebp)
  c05c9d:	41                   	inc    %ecx
  c05c9e:	0e                   	push   %cs
  c05c9f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05ca5:	03 89 01 c5 0c 04    	add    0x40cc501(%ecx),%ecx
  c05cab:	04 1c                	add    $0x1c,%al
  c05cad:	00 00                	add    %al,(%eax)
  c05caf:	00 5c 09 00          	add    %bl,0x0(%ecx,%ecx,1)
  c05cb3:	00 3f                	add    %bh,(%edi)
  c05cb5:	cd ff                	int    $0xff
  c05cb7:	ff 16                	call   *(%esi)
  c05cb9:	00 00                	add    %al,(%eax)
  c05cbb:	00 00                	add    %al,(%eax)
  c05cbd:	41                   	inc    %ecx
  c05cbe:	0e                   	push   %cs
  c05cbf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05cc5:	52                   	push   %edx
  c05cc6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05cc9:	04 00                	add    $0x0,%al
  c05ccb:	00 28                	add    %ch,(%eax)
  c05ccd:	00 00                	add    %al,(%eax)
  c05ccf:	00 7c 09 00          	add    %bh,0x0(%ecx,%ecx,1)
  c05cd3:	00 38                	add    %bh,(%eax)
  c05cd5:	cd ff                	int    $0xff
  c05cd7:	ff 20                	jmp    *(%eax)
  c05cd9:	00 00                	add    %al,(%eax)
  c05cdb:	00 00                	add    %al,(%eax)
  c05cdd:	41                   	inc    %ecx
  c05cde:	0e                   	push   %cs
  c05cdf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05ce5:	43                   	inc    %ebx
  c05ce6:	87 03                	xchg   %eax,(%ebx)
  c05ce8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c05ceb:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  c05cf0:	41                   	inc    %ecx
  c05cf1:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05cf8:	1c 00                	sbb    $0x0,%al
  c05cfa:	00 00                	add    %al,(%eax)
  c05cfc:	a8 09                	test   $0x9,%al
  c05cfe:	00 00                	add    %al,(%eax)
  c05d00:	2c cd                	sub    $0xcd,%al
  c05d02:	ff                   	(bad)  
  c05d03:	ff 45 00             	incl   0x0(%ebp)
  c05d06:	00 00                	add    %al,(%eax)
  c05d08:	00 41 0e             	add    %al,0xe(%ecx)
  c05d0b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05d11:	02 41 c5             	add    -0x3b(%ecx),%al
  c05d14:	0c 04                	or     $0x4,%al
  c05d16:	04 00                	add    $0x0,%al
  c05d18:	1c 00                	sbb    $0x0,%al
  c05d1a:	00 00                	add    %al,(%eax)
  c05d1c:	c8 09 00 00          	enter  $0x9,$0x0
  c05d20:	51                   	push   %ecx
  c05d21:	cd ff                	int    $0xff
  c05d23:	ff 8e 00 00 00 00    	decl   0x0(%esi)
  c05d29:	41                   	inc    %ecx
  c05d2a:	0e                   	push   %cs
  c05d2b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05d31:	02 8a c5 0c 04 04    	add    0x4040cc5(%edx),%cl
  c05d37:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c05d3a:	00 00                	add    %al,(%eax)
  c05d3c:	e8 09 00 00 bf       	call   bfc05d4a <_end+0xbefe036a>
  c05d41:	cd ff                	int    $0xff
  c05d43:	ff 82 00 00 00 00    	incl   0x0(%edx)
  c05d49:	41                   	inc    %ecx
  c05d4a:	0e                   	push   %cs
  c05d4b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05d51:	02 7e c5             	add    -0x3b(%esi),%bh
  c05d54:	0c 04                	or     $0x4,%al
  c05d56:	04 00                	add    $0x0,%al
  c05d58:	1c 00                	sbb    $0x0,%al
  c05d5a:	00 00                	add    %al,(%eax)
  c05d5c:	08 0a                	or     %cl,(%edx)
  c05d5e:	00 00                	add    %al,(%eax)
  c05d60:	21 ce                	and    %ecx,%esi
  c05d62:	ff                   	(bad)  
  c05d63:	ff 55 00             	call   *0x0(%ebp)
  c05d66:	00 00                	add    %al,(%eax)
  c05d68:	00 41 0e             	add    %al,0xe(%ecx)
  c05d6b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05d71:	02 51 c5             	add    -0x3b(%ecx),%dl
  c05d74:	0c 04                	or     $0x4,%al
  c05d76:	04 00                	add    $0x0,%al
  c05d78:	24 00                	and    $0x0,%al
  c05d7a:	00 00                	add    %al,(%eax)
  c05d7c:	28 0a                	sub    %cl,(%edx)
  c05d7e:	00 00                	add    %al,(%eax)
  c05d80:	58                   	pop    %eax
  c05d81:	ce                   	into   
  c05d82:	ff                   	(bad)  
  c05d83:	ff 29                	ljmp   *(%ecx)
  c05d85:	00 00                	add    %al,(%eax)
  c05d87:	00 00                	add    %al,(%eax)
  c05d89:	41                   	inc    %ecx
  c05d8a:	0e                   	push   %cs
  c05d8b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05d91:	42                   	inc    %edx
  c05d92:	87 03                	xchg   %eax,(%ebx)
  c05d94:	86 04 61             	xchg   %al,(%ecx,%eiz,2)
  c05d97:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c05d9b:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05d9e:	04 00                	add    $0x0,%al
  c05da0:	20 00                	and    %al,(%eax)
  c05da2:	00 00                	add    %al,(%eax)
  c05da4:	50                   	push   %eax
  c05da5:	0a 00                	or     (%eax),%al
  c05da7:	00 59 ce             	add    %bl,-0x32(%ecx)
  c05daa:	ff                   	(bad)  
  c05dab:	ff 1e                	lcall  *(%esi)
  c05dad:	00 00                	add    %al,(%eax)
  c05daf:	00 00                	add    %al,(%eax)
  c05db1:	41                   	inc    %ecx
  c05db2:	0e                   	push   %cs
  c05db3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05db9:	41                   	inc    %ecx
  c05dba:	87 03                	xchg   %eax,(%ebx)
  c05dbc:	58                   	pop    %eax
  c05dbd:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05dc4:	28 00                	sub    %al,(%eax)
  c05dc6:	00 00                	add    %al,(%eax)
  c05dc8:	74 0a                	je     c05dd4 <_upperDigits+0xc04>
  c05dca:	00 00                	add    %al,(%eax)
  c05dcc:	53                   	push   %ebx
  c05dcd:	ce                   	into   
  c05dce:	ff                   	(bad)  
  c05dcf:	ff 20                	jmp    *(%eax)
  c05dd1:	00 00                	add    %al,(%eax)
  c05dd3:	00 00                	add    %al,(%eax)
  c05dd5:	41                   	inc    %ecx
  c05dd6:	0e                   	push   %cs
  c05dd7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05ddd:	43                   	inc    %ebx
  c05dde:	87 03                	xchg   %eax,(%ebx)
  c05de0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c05de3:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  c05de8:	41                   	inc    %ecx
  c05de9:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05df0:	1c 00                	sbb    $0x0,%al
  c05df2:	00 00                	add    %al,(%eax)
  c05df4:	a0 0a 00 00 47       	mov    0x4700000a,%al
  c05df9:	ce                   	into   
  c05dfa:	ff                   	(bad)  
  c05dfb:	ff 4c 00 00          	decl   0x0(%eax,%eax,1)
  c05dff:	00 00                	add    %al,(%eax)
  c05e01:	41                   	inc    %ecx
  c05e02:	0e                   	push   %cs
  c05e03:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05e09:	02 48 c5             	add    -0x3b(%eax),%cl
  c05e0c:	0c 04                	or     $0x4,%al
  c05e0e:	04 00                	add    $0x0,%al
  c05e10:	1c 00                	sbb    $0x0,%al
  c05e12:	00 00                	add    %al,(%eax)
  c05e14:	c0 0a 00             	rorb   $0x0,(%edx)
  c05e17:	00 73 ce             	add    %dh,-0x32(%ebx)
  c05e1a:	ff                   	(bad)  
  c05e1b:	ff                   	(bad)  
  c05e1c:	3c 00                	cmp    $0x0,%al
  c05e1e:	00 00                	add    %al,(%eax)
  c05e20:	00 41 0e             	add    %al,0xe(%ecx)
  c05e23:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05e29:	78 c5                	js     c05df0 <_upperDigits+0xc20>
  c05e2b:	0c 04                	or     $0x4,%al
  c05e2d:	04 00                	add    $0x0,%al
  c05e2f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c05e32:	00 00                	add    %al,(%eax)
  c05e34:	e0 0a                	loopne c05e40 <_upperDigits+0xc70>
  c05e36:	00 00                	add    %al,(%eax)
  c05e38:	8f                   	(bad)  
  c05e39:	ce                   	into   
  c05e3a:	ff                   	(bad)  
  c05e3b:	ff d5                	call   *%ebp
  c05e3d:	00 00                	add    %al,(%eax)
  c05e3f:	00 00                	add    %al,(%eax)
  c05e41:	41                   	inc    %ecx
  c05e42:	0e                   	push   %cs
  c05e43:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05e49:	02 d1                	add    %cl,%dl
  c05e4b:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05e4e:	04 00                	add    $0x0,%al
  c05e50:	1c 00                	sbb    $0x0,%al
  c05e52:	00 00                	add    %al,(%eax)
  c05e54:	00 0b                	add    %cl,(%ebx)
  c05e56:	00 00                	add    %al,(%eax)
  c05e58:	44                   	inc    %esp
  c05e59:	cf                   	iret   
  c05e5a:	ff                   	(bad)  
  c05e5b:	ff 32                	pushl  (%edx)
  c05e5d:	00 00                	add    %al,(%eax)
  c05e5f:	00 00                	add    %al,(%eax)
  c05e61:	41                   	inc    %ecx
  c05e62:	0e                   	push   %cs
  c05e63:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05e69:	6e                   	outsb  %ds:(%esi),(%dx)
  c05e6a:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05e6d:	04 00                	add    $0x0,%al
  c05e6f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c05e72:	00 00                	add    %al,(%eax)
  c05e74:	20 0b                	and    %cl,(%ebx)
  c05e76:	00 00                	add    %al,(%eax)
  c05e78:	56                   	push   %esi
  c05e79:	cf                   	iret   
  c05e7a:	ff                   	(bad)  
  c05e7b:	ff 2d 00 00 00 00    	ljmp   *0x0
  c05e81:	41                   	inc    %ecx
  c05e82:	0e                   	push   %cs
  c05e83:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05e89:	69 c5 0c 04 04 00    	imul   $0x4040c,%ebp,%eax
  c05e8f:	00 28                	add    %ch,(%eax)
  c05e91:	00 00                	add    %al,(%eax)
  c05e93:	00 40 0b             	add    %al,0xb(%eax)
  c05e96:	00 00                	add    %al,(%eax)
  c05e98:	64                   	fs
  c05e99:	cf                   	iret   
  c05e9a:	ff                   	(bad)  
  c05e9b:	ff 2d 00 00 00 00    	ljmp   *0x0
  c05ea1:	41                   	inc    %ecx
  c05ea2:	0e                   	push   %cs
  c05ea3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05ea9:	46                   	inc    %esi
  c05eaa:	87 03                	xchg   %eax,(%ebx)
  c05eac:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c05eaf:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c05eb4:	41                   	inc    %ecx
  c05eb5:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05ebc:	1c 00                	sbb    $0x0,%al
  c05ebe:	00 00                	add    %al,(%eax)
  c05ec0:	6c                   	insb   (%dx),%es:(%edi)
  c05ec1:	0b 00                	or     (%eax),%eax
  c05ec3:	00 65 cf             	add    %ah,-0x31(%ebp)
  c05ec6:	ff                   	(bad)  
  c05ec7:	ff 32                	pushl  (%edx)
  c05ec9:	00 00                	add    %al,(%eax)
  c05ecb:	00 00                	add    %al,(%eax)
  c05ecd:	41                   	inc    %ecx
  c05ece:	0e                   	push   %cs
  c05ecf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05ed5:	6e                   	outsb  %ds:(%esi),(%dx)
  c05ed6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05ed9:	04 00                	add    $0x0,%al
  c05edb:	00 28                	add    %ch,(%eax)
  c05edd:	00 00                	add    %al,(%eax)
  c05edf:	00 8c 0b 00 00 78 cf 	add    %cl,-0x30880000(%ebx,%ecx,1)
  c05ee6:	ff                   	(bad)  
  c05ee7:	ff 2d 00 00 00 00    	ljmp   *0x0
  c05eed:	41                   	inc    %ecx
  c05eee:	0e                   	push   %cs
  c05eef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05ef5:	46                   	inc    %esi
  c05ef6:	87 03                	xchg   %eax,(%ebx)
  c05ef8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c05efb:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c05f00:	41                   	inc    %ecx
  c05f01:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05f08:	24 00                	and    $0x0,%al
  c05f0a:	00 00                	add    %al,(%eax)
  c05f0c:	b8 0b 00 00 79       	mov    $0x7900000b,%eax
  c05f11:	cf                   	iret   
  c05f12:	ff                   	(bad)  
  c05f13:	ff 1d 00 00 00 00    	lcall  *0x0
  c05f19:	41                   	inc    %ecx
  c05f1a:	0e                   	push   %cs
  c05f1b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05f21:	42                   	inc    %edx
  c05f22:	87 03                	xchg   %eax,(%ebx)
  c05f24:	86 04 55 c6 41 c7 41 	xchg   %al,0x41c741c6(,%edx,2)
  c05f2b:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05f2e:	04 00                	add    $0x0,%al
  c05f30:	28 00                	sub    %al,(%eax)
  c05f32:	00 00                	add    %al,(%eax)
  c05f34:	e0 0b                	loopne c05f41 <_upperDigits+0xd71>
  c05f36:	00 00                	add    %al,(%eax)
  c05f38:	6e                   	outsb  %ds:(%esi),(%dx)
  c05f39:	cf                   	iret   
  c05f3a:	ff                   	(bad)  
  c05f3b:	ff 2c 00             	ljmp   *(%eax,%eax,1)
  c05f3e:	00 00                	add    %al,(%eax)
  c05f40:	00 41 0e             	add    %al,0xe(%ecx)
  c05f43:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05f49:	43                   	inc    %ebx
  c05f4a:	87 03                	xchg   %eax,(%ebx)
  c05f4c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c05f4f:	05 62 c3 41 c6       	add    $0xc641c362,%eax
  c05f54:	41                   	inc    %ecx
  c05f55:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05f5c:	20 00                	and    %al,(%eax)
  c05f5e:	00 00                	add    %al,(%eax)
  c05f60:	0c 0c                	or     $0xc,%al
  c05f62:	00 00                	add    %al,(%eax)
  c05f64:	6e                   	outsb  %ds:(%esi),(%dx)
  c05f65:	cf                   	iret   
  c05f66:	ff                   	(bad)  
  c05f67:	ff 1e                	lcall  *(%esi)
  c05f69:	00 00                	add    %al,(%eax)
  c05f6b:	00 00                	add    %al,(%eax)
  c05f6d:	41                   	inc    %ecx
  c05f6e:	0e                   	push   %cs
  c05f6f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05f75:	41                   	inc    %ecx
  c05f76:	87 03                	xchg   %eax,(%ebx)
  c05f78:	58                   	pop    %eax
  c05f79:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05f80:	2c 00                	sub    $0x0,%al
  c05f82:	00 00                	add    %al,(%eax)
  c05f84:	30 0c 00             	xor    %cl,(%eax,%eax,1)
  c05f87:	00 68 cf             	add    %ch,-0x31(%eax)
  c05f8a:	ff                   	(bad)  
  c05f8b:	ff a7 01 00 00 00    	jmp    *0x1(%edi)
  c05f91:	41                   	inc    %ecx
  c05f92:	0e                   	push   %cs
  c05f93:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05f99:	49                   	dec    %ecx
  c05f9a:	87 03                	xchg   %eax,(%ebx)
  c05f9c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c05f9f:	05 03 97 01 c3       	add    $0xc3019703,%eax
  c05fa4:	41                   	inc    %ecx
  c05fa5:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c05fa9:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c05fac:	04 00                	add    $0x0,%al
  c05fae:	00 00                	add    %al,(%eax)
  c05fb0:	1c 00                	sbb    $0x0,%al
  c05fb2:	00 00                	add    %al,(%eax)
  c05fb4:	60                   	pusha  
  c05fb5:	0c 00                	or     $0x0,%al
  c05fb7:	00 df                	add    %bl,%bh
  c05fb9:	d0 ff                	sar    %bh
  c05fbb:	ff 53 00             	call   *0x0(%ebx)
  c05fbe:	00 00                	add    %al,(%eax)
  c05fc0:	00 41 0e             	add    %al,0xe(%ecx)
  c05fc3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05fc9:	02 4f c5             	add    -0x3b(%edi),%cl
  c05fcc:	0c 04                	or     $0x4,%al
  c05fce:	04 00                	add    $0x0,%al
  c05fd0:	28 00                	sub    %al,(%eax)
  c05fd2:	00 00                	add    %al,(%eax)
  c05fd4:	80 0c 00 00          	orb    $0x0,(%eax,%eax,1)
  c05fd8:	2c d1                	sub    $0xd1,%al
  c05fda:	ff                   	(bad)  
  c05fdb:	ff 2d 00 00 00 00    	ljmp   *0x0
  c05fe1:	41                   	inc    %ecx
  c05fe2:	0e                   	push   %cs
  c05fe3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c05fe9:	46                   	inc    %esi
  c05fea:	87 03                	xchg   %eax,(%ebx)
  c05fec:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c05fef:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c05ff4:	41                   	inc    %ecx
  c05ff5:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c05ffc:	20 00                	and    %al,(%eax)
  c05ffe:	00 00                	add    %al,(%eax)
  c06000:	ac                   	lods   %ds:(%esi),%al
  c06001:	0c 00                	or     $0x0,%al
  c06003:	00 2d d1 ff ff 1e    	add    %ch,0x1effffd1
  c06009:	00 00                	add    %al,(%eax)
  c0600b:	00 00                	add    %al,(%eax)
  c0600d:	41                   	inc    %ecx
  c0600e:	0e                   	push   %cs
  c0600f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06015:	41                   	inc    %ecx
  c06016:	87 03                	xchg   %eax,(%ebx)
  c06018:	58                   	pop    %eax
  c06019:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c06020:	28 00                	sub    %al,(%eax)
  c06022:	00 00                	add    %al,(%eax)
  c06024:	d0 0c 00             	rorb   (%eax,%eax,1)
  c06027:	00 27                	add    %ah,(%edi)
  c06029:	d1 ff                	sar    %edi
  c0602b:	ff a5 00 00 00 00    	jmp    *0x0(%ebp)
  c06031:	41                   	inc    %ecx
  c06032:	0e                   	push   %cs
  c06033:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06039:	46                   	inc    %esi
  c0603a:	87 03                	xchg   %eax,(%ebx)
  c0603c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c0603f:	05 02 98 c3 41       	add    $0x41c39802,%eax
  c06044:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c06048:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c0604b:	04 1c                	add    $0x1c,%al
  c0604d:	00 00                	add    %al,(%eax)
  c0604f:	00 fc                	add    %bh,%ah
  c06051:	0c 00                	or     $0x0,%al
  c06053:	00 a0 d1 ff ff 33    	add    %ah,0x33ffffd1(%eax)
  c06059:	00 00                	add    %al,(%eax)
  c0605b:	00 00                	add    %al,(%eax)
  c0605d:	41                   	inc    %ecx
  c0605e:	0e                   	push   %cs
  c0605f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06065:	6f                   	outsl  %ds:(%esi),(%dx)
  c06066:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c06069:	04 00                	add    $0x0,%al
  c0606b:	00 28                	add    %ch,(%eax)
  c0606d:	00 00                	add    %al,(%eax)
  c0606f:	00 1c 0d 00 00 b4 d1 	add    %bl,-0x2e4c0000(,%ecx,1)
  c06076:	ff                   	(bad)  
  c06077:	ff 2d 00 00 00 00    	ljmp   *0x0
  c0607d:	41                   	inc    %ecx
  c0607e:	0e                   	push   %cs
  c0607f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06085:	46                   	inc    %esi
  c06086:	87 03                	xchg   %eax,(%ebx)
  c06088:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c0608b:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c06090:	41                   	inc    %ecx
  c06091:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c06098:	28 00                	sub    %al,(%eax)
  c0609a:	00 00                	add    %al,(%eax)
  c0609c:	48                   	dec    %eax
  c0609d:	0d 00 00 b5 d1       	or     $0xd1b50000,%eax
  c060a2:	ff                   	(bad)  
  c060a3:	ff 20                	jmp    *(%eax)
  c060a5:	00 00                	add    %al,(%eax)
  c060a7:	00 00                	add    %al,(%eax)
  c060a9:	41                   	inc    %ecx
  c060aa:	0e                   	push   %cs
  c060ab:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c060b1:	43                   	inc    %ebx
  c060b2:	87 03                	xchg   %eax,(%ebx)
  c060b4:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c060b7:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  c060bc:	41                   	inc    %ecx
  c060bd:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c060c4:	28 00                	sub    %al,(%eax)
  c060c6:	00 00                	add    %al,(%eax)
  c060c8:	74 0d                	je     c060d7 <_upperDigits+0xf07>
  c060ca:	00 00                	add    %al,(%eax)
  c060cc:	a9 d1 ff ff 9f       	test   $0x9fffffd1,%eax
  c060d1:	00 00                	add    %al,(%eax)
  c060d3:	00 00                	add    %al,(%eax)
  c060d5:	41                   	inc    %ecx
  c060d6:	0e                   	push   %cs
  c060d7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c060dd:	46                   	inc    %esi
  c060de:	87 03                	xchg   %eax,(%ebx)
  c060e0:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c060e3:	05 02 92 c3 41       	add    $0x41c39202,%eax
  c060e8:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c060ec:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c060ef:	04 28                	add    $0x28,%al
  c060f1:	00 00                	add    %al,(%eax)
  c060f3:	00 a0 0d 00 00 1c    	add    %ah,0x1c00000d(%eax)
  c060f9:	d2 ff                	sar    %cl,%bh
  c060fb:	ff 2d 00 00 00 00    	ljmp   *0x0
  c06101:	41                   	inc    %ecx
  c06102:	0e                   	push   %cs
  c06103:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06109:	46                   	inc    %esi
  c0610a:	87 03                	xchg   %eax,(%ebx)
  c0610c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c0610f:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c06114:	41                   	inc    %ecx
  c06115:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c0611c:	1c 00                	sbb    $0x0,%al
  c0611e:	00 00                	add    %al,(%eax)
  c06120:	cc                   	int3   
  c06121:	0d 00 00 1d d2       	or     $0xd21d0000,%eax
  c06126:	ff                   	(bad)  
  c06127:	ff                   	(bad)  
  c06128:	38 00                	cmp    %al,(%eax)
  c0612a:	00 00                	add    %al,(%eax)
  c0612c:	00 41 0e             	add    %al,0xe(%ecx)
  c0612f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06135:	74 c5                	je     c060fc <_upperDigits+0xf2c>
  c06137:	0c 04                	or     $0x4,%al
  c06139:	04 00                	add    $0x0,%al
  c0613b:	00 20                	add    %ah,(%eax)
  c0613d:	00 00                	add    %al,(%eax)
  c0613f:	00 ec                	add    %ch,%ah
  c06141:	0d 00 00 38 d2       	or     $0xd2380000,%eax
  c06146:	ff                   	(bad)  
  c06147:	ff 25 00 00 00 00    	jmp    *0x0
  c0614d:	41                   	inc    %ecx
  c0614e:	0e                   	push   %cs
  c0614f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06155:	44                   	inc    %esp
  c06156:	87 03                	xchg   %eax,(%ebx)
  c06158:	5c                   	pop    %esp
  c06159:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c06160:	24 00                	and    $0x0,%al
  c06162:	00 00                	add    %al,(%eax)
  c06164:	10 0e                	adc    %cl,(%esi)
  c06166:	00 00                	add    %al,(%eax)
  c06168:	39 d2                	cmp    %edx,%edx
  c0616a:	ff                   	(bad)  
  c0616b:	ff 9e 00 00 00 00    	lcall  *0x0(%esi)
  c06171:	41                   	inc    %ecx
  c06172:	0e                   	push   %cs
  c06173:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06179:	45                   	inc    %ebp
  c0617a:	86 03                	xchg   %al,(%ebx)
  c0617c:	83 04 02 93          	addl   $0xffffff93,(%edx,%eax,1)
  c06180:	c3                   	ret    
  c06181:	41                   	inc    %ecx
  c06182:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
  c06186:	04 04                	add    $0x4,%al
  c06188:	1c 00                	sbb    $0x0,%al
  c0618a:	00 00                	add    %al,(%eax)
  c0618c:	38 0e                	cmp    %cl,(%esi)
  c0618e:	00 00                	add    %al,(%eax)
  c06190:	af                   	scas   %es:(%edi),%eax
  c06191:	d2 ff                	sar    %cl,%bh
  c06193:	ff 54 00 00          	call   *0x0(%eax,%eax,1)
  c06197:	00 00                	add    %al,(%eax)
  c06199:	41                   	inc    %ecx
  c0619a:	0e                   	push   %cs
  c0619b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c061a1:	02 50 c5             	add    -0x3b(%eax),%dl
  c061a4:	0c 04                	or     $0x4,%al
  c061a6:	04 00                	add    $0x0,%al
  c061a8:	20 00                	and    %al,(%eax)
  c061aa:	00 00                	add    %al,(%eax)
  c061ac:	58                   	pop    %eax
  c061ad:	0e                   	push   %cs
  c061ae:	00 00                	add    %al,(%eax)
  c061b0:	e3 d2                	jecxz  c06184 <_upperDigits+0xfb4>
  c061b2:	ff                   	(bad)  
  c061b3:	ff 09                	decl   (%ecx)
  c061b5:	01 00                	add    %eax,(%eax)
  c061b7:	00 00                	add    %al,(%eax)
  c061b9:	41                   	inc    %ecx
  c061ba:	0e                   	push   %cs
  c061bb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c061c1:	44                   	inc    %esp
  c061c2:	83 03 03             	addl   $0x3,(%ebx)
  c061c5:	01 01                	add    %eax,(%ecx)
  c061c7:	c5 c3 0c             	(bad)  
  c061ca:	04 04                	add    $0x4,%al
  c061cc:	1c 00                	sbb    $0x0,%al
  c061ce:	00 00                	add    %al,(%eax)
  c061d0:	7c 0e                	jl     c061e0 <_upperDigits+0x1010>
  c061d2:	00 00                	add    %al,(%eax)
  c061d4:	c8 d3 ff ff          	enter  $0xffd3,$0xff
  c061d8:	b7 00                	mov    $0x0,%bh
  c061da:	00 00                	add    %al,(%eax)
  c061dc:	00 41 0e             	add    %al,0xe(%ecx)
  c061df:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c061e5:	02 b3 c5 0c 04 04    	add    0x4040cc5(%ebx),%dh
  c061eb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c061ee:	00 00                	add    %al,(%eax)
  c061f0:	9c                   	pushf  
  c061f1:	0e                   	push   %cs
  c061f2:	00 00                	add    %al,(%eax)
  c061f4:	5f                   	pop    %edi
  c061f5:	d4 ff                	aam    $0xff
  c061f7:	ff 75 00             	pushl  0x0(%ebp)
  c061fa:	00 00                	add    %al,(%eax)
  c061fc:	00 41 0e             	add    %al,0xe(%ecx)
  c061ff:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06205:	02 71 c5             	add    -0x3b(%ecx),%dh
  c06208:	0c 04                	or     $0x4,%al
  c0620a:	04 00                	add    $0x0,%al
  c0620c:	20 00                	and    %al,(%eax)
  c0620e:	00 00                	add    %al,(%eax)
  c06210:	bc 0e 00 00 b4       	mov    $0xb400000e,%esp
  c06215:	d4 ff                	aam    $0xff
  c06217:	ff 61 01             	jmp    *0x1(%ecx)
  c0621a:	00 00                	add    %al,(%eax)
  c0621c:	00 41 0e             	add    %al,0xe(%ecx)
  c0621f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06225:	44                   	inc    %esp
  c06226:	83 03 03             	addl   $0x3,(%ebx)
  c06229:	59                   	pop    %ecx
  c0622a:	01 c5                	add    %eax,%ebp
  c0622c:	c3                   	ret    
  c0622d:	0c 04                	or     $0x4,%al
  c0622f:	04 1c                	add    $0x1c,%al
  c06231:	00 00                	add    %al,(%eax)
  c06233:	00 e0                	add    %ah,%al
  c06235:	0e                   	push   %cs
  c06236:	00 00                	add    %al,(%eax)
  c06238:	f1                   	icebp  
  c06239:	d5 ff                	aad    $0xff
  c0623b:	ff 81 00 00 00 00    	incl   0x0(%ecx)
  c06241:	41                   	inc    %ecx
  c06242:	0e                   	push   %cs
  c06243:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06249:	02 7d c5             	add    -0x3b(%ebp),%bh
  c0624c:	0c 04                	or     $0x4,%al
  c0624e:	04 00                	add    $0x0,%al
  c06250:	20 00                	and    %al,(%eax)
  c06252:	00 00                	add    %al,(%eax)
  c06254:	00 0f                	add    %cl,(%edi)
  c06256:	00 00                	add    %al,(%eax)
  c06258:	52                   	push   %edx
  c06259:	d6                   	(bad)  
  c0625a:	ff                   	(bad)  
  c0625b:	ff 5d 01             	lcall  *0x1(%ebp)
  c0625e:	00 00                	add    %al,(%eax)
  c06260:	00 41 0e             	add    %al,0xe(%ecx)
  c06263:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06269:	44                   	inc    %esp
  c0626a:	83 03 03             	addl   $0x3,(%ebx)
  c0626d:	55                   	push   %ebp
  c0626e:	01 c5                	add    %eax,%ebp
  c06270:	c3                   	ret    
  c06271:	0c 04                	or     $0x4,%al
  c06273:	04 1c                	add    $0x1c,%al
  c06275:	00 00                	add    %al,(%eax)
  c06277:	00 24 0f             	add    %ah,(%edi,%ecx,1)
  c0627a:	00 00                	add    %al,(%eax)
  c0627c:	8b d7                	mov    %edi,%edx
  c0627e:	ff                   	(bad)  
  c0627f:	ff 50 00             	call   *0x0(%eax)
  c06282:	00 00                	add    %al,(%eax)
  c06284:	00 41 0e             	add    %al,0xe(%ecx)
  c06287:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0628d:	02 4c c5 0c          	add    0xc(%ebp,%eax,8),%cl
  c06291:	04 04                	add    $0x4,%al
  c06293:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c06296:	00 00                	add    %al,(%eax)
  c06298:	44                   	inc    %esp
  c06299:	0f 00 00             	sldt   (%eax)
  c0629c:	bb d7 ff ff 18       	mov    $0x18ffffd7,%ebx
  c062a1:	00 00                	add    %al,(%eax)
  c062a3:	00 00                	add    %al,(%eax)
  c062a5:	41                   	inc    %ecx
  c062a6:	0e                   	push   %cs
  c062a7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c062ad:	54                   	push   %esp
  c062ae:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c062b1:	04 00                	add    $0x0,%al
  c062b3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c062b6:	00 00                	add    %al,(%eax)
  c062b8:	64 0f 00 00          	sldt   %fs:(%eax)
  c062bc:	b4 d7                	mov    $0xd7,%ah
  c062be:	ff                   	(bad)  
  c062bf:	ff 4a 00             	decl   0x0(%edx)
  c062c2:	00 00                	add    %al,(%eax)
  c062c4:	00 41 0e             	add    %al,0xe(%ecx)
  c062c7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c062cd:	02 46 c5             	add    -0x3b(%esi),%al
  c062d0:	0c 04                	or     $0x4,%al
  c062d2:	04 00                	add    $0x0,%al
  c062d4:	20 00                	and    %al,(%eax)
  c062d6:	00 00                	add    %al,(%eax)
  c062d8:	84 0f                	test   %cl,(%edi)
  c062da:	00 00                	add    %al,(%eax)
  c062dc:	e0 d7                	loopne c062b5 <_upperDigits+0x10e5>
  c062de:	ff                   	(bad)  
  c062df:	ff 1e                	lcall  *(%esi)
  c062e1:	00 00                	add    %al,(%eax)
  c062e3:	00 00                	add    %al,(%eax)
  c062e5:	41                   	inc    %ecx
  c062e6:	0e                   	push   %cs
  c062e7:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c062ed:	41                   	inc    %ecx
  c062ee:	87 03                	xchg   %eax,(%ebx)
  c062f0:	58                   	pop    %eax
  c062f1:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c062f8:	28 00                	sub    %al,(%eax)
  c062fa:	00 00                	add    %al,(%eax)
  c062fc:	a8 0f                	test   $0xf,%al
  c062fe:	00 00                	add    %al,(%eax)
  c06300:	da d7                	fcmovbe %st(7),%st
  c06302:	ff                   	(bad)  
  c06303:	ff 20                	jmp    *(%eax)
  c06305:	00 00                	add    %al,(%eax)
  c06307:	00 00                	add    %al,(%eax)
  c06309:	41                   	inc    %ecx
  c0630a:	0e                   	push   %cs
  c0630b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06311:	43                   	inc    %ebx
  c06312:	87 03                	xchg   %eax,(%ebx)
  c06314:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c06317:	05 56 c3 41 c6       	add    $0xc641c356,%eax
  c0631c:	41                   	inc    %ecx
  c0631d:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c06324:	20 00                	and    %al,(%eax)
  c06326:	00 00                	add    %al,(%eax)
  c06328:	d4 0f                	aam    $0xf
  c0632a:	00 00                	add    %al,(%eax)
  c0632c:	ce                   	into   
  c0632d:	d7                   	xlat   %ds:(%ebx)
  c0632e:	ff                   	(bad)  
  c0632f:	ff 5a 00             	lcall  *0x0(%edx)
  c06332:	00 00                	add    %al,(%eax)
  c06334:	00 41 0e             	add    %al,0xe(%ecx)
  c06337:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c0633d:	44                   	inc    %esp
  c0633e:	83 03 02             	addl   $0x2,(%ebx)
  c06341:	51                   	push   %ecx
  c06342:	c3                   	ret    
  c06343:	41                   	inc    %ecx
  c06344:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c06347:	04 1c                	add    $0x1c,%al
  c06349:	00 00                	add    %al,(%eax)
  c0634b:	00 f8                	add    %bh,%al
  c0634d:	0f 00 00             	sldt   (%eax)
  c06350:	04 d8                	add    $0xd8,%al
  c06352:	ff                   	(bad)  
  c06353:	ff 31                	pushl  (%ecx)
  c06355:	00 00                	add    %al,(%eax)
  c06357:	00 00                	add    %al,(%eax)
  c06359:	41                   	inc    %ecx
  c0635a:	0e                   	push   %cs
  c0635b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06361:	6d                   	insl   (%dx),%es:(%edi)
  c06362:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c06365:	04 00                	add    $0x0,%al
  c06367:	00 20                	add    %ah,(%eax)
  c06369:	00 00                	add    %al,(%eax)
  c0636b:	00 18                	add    %bl,(%eax)
  c0636d:	10 00                	adc    %al,(%eax)
  c0636f:	00 15 d8 ff ff 5c    	add    %dl,0x5cffffd8
  c06375:	00 00                	add    %al,(%eax)
  c06377:	00 00                	add    %al,(%eax)
  c06379:	41                   	inc    %ecx
  c0637a:	0e                   	push   %cs
  c0637b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06381:	44                   	inc    %esp
  c06382:	83 03 02             	addl   $0x2,(%ebx)
  c06385:	53                   	push   %ebx
  c06386:	c3                   	ret    
  c06387:	41                   	inc    %ecx
  c06388:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c0638b:	04 1c                	add    $0x1c,%al
  c0638d:	00 00                	add    %al,(%eax)
  c0638f:	00 3c 10             	add    %bh,(%eax,%edx,1)
  c06392:	00 00                	add    %al,(%eax)
  c06394:	4d                   	dec    %ebp
  c06395:	d8 ff                	fdivr  %st(7),%st
  c06397:	ff 31                	pushl  (%ecx)
  c06399:	00 00                	add    %al,(%eax)
  c0639b:	00 00                	add    %al,(%eax)
  c0639d:	41                   	inc    %ecx
  c0639e:	0e                   	push   %cs
  c0639f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c063a5:	6d                   	insl   (%dx),%es:(%edi)
  c063a6:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c063a9:	04 00                	add    $0x0,%al
  c063ab:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c063ae:	00 00                	add    %al,(%eax)
  c063b0:	5c                   	pop    %esp
  c063b1:	10 00                	adc    %al,(%eax)
  c063b3:	00 5e d8             	add    %bl,-0x28(%esi)
  c063b6:	ff                   	(bad)  
  c063b7:	ff 23                	jmp    *(%ebx)
  c063b9:	02 00                	add    (%eax),%al
  c063bb:	00 00                	add    %al,(%eax)
  c063bd:	41                   	inc    %ecx
  c063be:	0e                   	push   %cs
  c063bf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c063c5:	03 1f                	add    (%edi),%ebx
  c063c7:	02 c5                	add    %ch,%al
  c063c9:	0c 04                	or     $0x4,%al
  c063cb:	04 1c                	add    $0x1c,%al
  c063cd:	00 00                	add    %al,(%eax)
  c063cf:	00 7c 10 00          	add    %bh,0x0(%eax,%edx,1)
  c063d3:	00 61 da             	add    %ah,-0x26(%ecx)
  c063d6:	ff                   	(bad)  
  c063d7:	ff 8a 00 00 00 00    	decl   0x0(%edx)
  c063dd:	41                   	inc    %ecx
  c063de:	0e                   	push   %cs
  c063df:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c063e5:	02 86 c5 0c 04 04    	add    0x4040cc5(%esi),%al
  c063eb:	00 1c 00             	add    %bl,(%eax,%eax,1)
  c063ee:	00 00                	add    %al,(%eax)
  c063f0:	9c                   	pushf  
  c063f1:	10 00                	adc    %al,(%eax)
  c063f3:	00 cb                	add    %cl,%bl
  c063f5:	da ff                	(bad)  
  c063f7:	ff c4                	inc    %esp
  c063f9:	02 00                	add    (%eax),%al
  c063fb:	00 00                	add    %al,(%eax)
  c063fd:	41                   	inc    %ecx
  c063fe:	0e                   	push   %cs
  c063ff:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06405:	03 c0                	add    %eax,%eax
  c06407:	02 c5                	add    %ch,%al
  c06409:	0c 04                	or     $0x4,%al
  c0640b:	04 1c                	add    $0x1c,%al
  c0640d:	00 00                	add    %al,(%eax)
  c0640f:	00 bc 10 00 00 6f dd 	add    %bh,-0x22910000(%eax,%edx,1)
  c06416:	ff                   	(bad)  
  c06417:	ff 29                	ljmp   *(%ecx)
  c06419:	00 00                	add    %al,(%eax)
  c0641b:	00 00                	add    %al,(%eax)
  c0641d:	41                   	inc    %ecx
  c0641e:	0e                   	push   %cs
  c0641f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06425:	65 c5 0c 04          	lds    %gs:(%esp,%eax,1),%ecx
  c06429:	04 00                	add    $0x0,%al
  c0642b:	00 28                	add    %ch,(%eax)
  c0642d:	00 00                	add    %al,(%eax)
  c0642f:	00 dc                	add    %bl,%ah
  c06431:	10 00                	adc    %al,(%eax)
  c06433:	00 78 dd             	add    %bh,-0x23(%eax)
  c06436:	ff                   	(bad)  
  c06437:	ff 2d 00 00 00 00    	ljmp   *0x0
  c0643d:	41                   	inc    %ecx
  c0643e:	0e                   	push   %cs
  c0643f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06445:	46                   	inc    %esi
  c06446:	87 03                	xchg   %eax,(%ebx)
  c06448:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c0644b:	05 60 c3 41 c6       	add    $0xc641c360,%eax
  c06450:	41                   	inc    %ecx
  c06451:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
  c06458:	28 00                	sub    %al,(%eax)
  c0645a:	00 00                	add    %al,(%eax)
  c0645c:	08 11                	or     %dl,(%ecx)
  c0645e:	00 00                	add    %al,(%eax)
  c06460:	79 dd                	jns    c0643f <_upperDigits+0x126f>
  c06462:	ff                   	(bad)  
  c06463:	ff 94 00 00 00 00 41 	call   *0x41000000(%eax,%eax,1)
  c0646a:	0e                   	push   %cs
  c0646b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  c06471:	46                   	inc    %esi
  c06472:	87 03                	xchg   %eax,(%ebx)
  c06474:	86 04 83             	xchg   %al,(%ebx,%eax,4)
  c06477:	05 02 87 c3 41       	add    $0x41c38702,%eax
  c0647c:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
  c06480:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
  c06483:	04                   	.byte 0x4

Disassembly of section .data:

00c08000 <STDOUT>:
  c08000:	01 00                	add    %eax,(%eax)
	...

00c08004 <stdin>:
  c08004:	54                   	push   %esp
  c08005:	80 c0 00             	add    $0x0,%al

00c08008 <stdout>:
  c08008:	00 80 c0 00 01 00    	add    %al,0x100c0(%eax)

00c0800c <yylineno>:
  c0800c:	01 00                	add    %eax,(%eax)
	...

00c08010 <alloc>:
  c08010:	07                   	pop    %es
  c08011:	3a c0                	cmp    %al,%al
	...

Disassembly of section .bss:

00c08040 <___strtok>:
  c08040:	00 00                	add    %al,(%eax)
	...

00c08044 <yyin>:
  c08044:	00 00                	add    %al,(%eax)
	...

00c08048 <yyout>:
  c08048:	00 00                	add    %al,(%eax)
	...

00c0804c <yy_flex_debug>:
  c0804c:	00 00                	add    %al,(%eax)
	...

00c08050 <___strtok>:
  c08050:	00 00                	add    %al,(%eax)
	...

00c08054 <STDIN>:
  c08054:	00 00                	add    %al,(%eax)
	...

00c08058 <yy_buffer_stack_top>:
  c08058:	00 00                	add    %al,(%eax)
	...

00c0805c <yy_buffer_stack_max>:
  c0805c:	00 00                	add    %al,(%eax)
	...

00c08060 <yy_buffer_stack>:
  c08060:	00 00                	add    %al,(%eax)
	...

00c08064 <yy_hold_char>:
  c08064:	00 00                	add    %al,(%eax)
	...

00c08068 <yy_n_chars>:
  c08068:	00 00                	add    %al,(%eax)
	...

00c0806c <yy_c_buf_p>:
  c0806c:	00 00                	add    %al,(%eax)
	...

00c08070 <yy_init>:
  c08070:	00 00                	add    %al,(%eax)
	...

00c08074 <yy_start>:
  c08074:	00 00                	add    %al,(%eax)
	...

00c08078 <yy_did_buffer_switch_on_eof>:
  c08078:	00 00                	add    %al,(%eax)
	...

00c0807c <yy_last_accepting_state>:
  c0807c:	00 00                	add    %al,(%eax)
	...

00c08080 <yy_last_accepting_cpos>:
  c08080:	00 00                	add    %al,(%eax)
	...

00c08084 <___strtok>:
  c08084:	00 00                	add    %al,(%eax)
	...

00c08088 <___strtok>:
	...

00c080c0 <___strtok>:
	...

00c08100 <symbolTable>:
	...

00c2559c <___strtok>:
  c2559c:	00 00                	add    %al,(%eax)
	...

00c255a0 <___strtok>:
  c255a0:	00 00                	add    %al,(%eax)
	...

00c255a4 <___strtok>:
  c255a4:	00 00                	add    %al,(%eax)
	...

00c255a8 <heap>:
  c255a8:	00 00                	add    %al,(%eax)
	...

00c255ac <___strtok>:
	...

00c255c0 <buf>:
	...

00c259c0 <___strtok>:
  c259c0:	00 00                	add    %al,(%eax)
	...

00c259c4 <___strtok>:
  c259c4:	00 00                	add    %al,(%eax)
	...

00c259c8 <yynerrs>:
  c259c8:	00 00                	add    %al,(%eax)
	...

00c259cc <yylval>:
  c259cc:	00 00                	add    %al,(%eax)
	...

00c259d0 <yychar>:
  c259d0:	00 00                	add    %al,(%eax)
	...

00c259d4 <errno>:
  c259d4:	00 00                	add    %al,(%eax)
	...

00c259d8 <yytext>:
  c259d8:	00 00                	add    %al,(%eax)
	...

00c259dc <yyleng>:
  c259dc:	00 00                	add    %al,(%eax)
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
