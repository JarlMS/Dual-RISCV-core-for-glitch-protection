no_glitch:

    1746.000 ns | RVFI |        0 |    425 | 00000448 | fe042623 | M | x8  | 00400000 | x0  | 00000000 | x0  | 00000000 |  WR | 003fffec | 00000000 | main glitch_test.c 27 - sw x0,-20(x8)
    1752.000 ns | RVFI |        0 |    426 | 0000044c | ----37f1 | M | x0  | 00000000 | x0  | 00000000 | x1  | 0000044e |  -- | -------- | -------- | main glitch_test.c 30 - c.jal 418 <boot_go>
    1755.000 ns | RVFI |        0 |    427 | 00000418 | ----1141 | M | x2  | 003fffd0 | x0  | 00000000 | x2  | 003fffc0 |  -- | -------- | -------- | boot_go glitch_test.c 12 - c.addi x2,-16
    1758.000 ns | RVFI |        0 |    428 | 0000041a | ----c622 | M | x2  | 003fffc0 | x8  | 00400000 | x0  | 00000000 |  WR | 003fffcc | 00400000 | boot_go glitch_test.c 12 - c.swsp x8,12(x2)
    1761.000 ns | RVFI |        0 |    429 | 0000041c | ----0800 | M | x2  | 003fffc0 | x0  | 00000000 | x8  | 003fffd0 |  -- | -------- | -------- | boot_go glitch_test.c 12 - c.addi4spn x8,x2,16
    1764.000 ns | RVFI |        0 |    430 | 0000041e | ----57fd | M | x0  | 00000000 | x0  | 00000000 | x15 | ffffffff |  -- | -------- | -------- | boot_go glitch_test.c 13 - c.li x15,-1
    1767.000 ns | RVFI |        0 |    431 | 00000420 | ----853e | M | x0  | 00000000 | x15 | ffffffff | x10 | ffffffff |  -- | -------- | -------- | boot_go glitch_test.c 14 - c.mv x10,x15
    1770.000 ns | RVFI |        0 |    432 | 00000422 | ----4432 | M | x2  | 003fffc0 | x0  | 00000000 | x8  | 00400000 |  RD | 003fffcc | 00400000 | boot_go glitch_test.c 14 - c.lwsp x8,12(x2)
    1773.000 ns | RVFI |        0 |    433 | 00000424 | ----0141 | M | x2  | 003fffc0 | x0  | 00000000 | x2  | 003fffd0 |  -- | -------- | -------- | boot_go glitch_test.c 14 - c.addi x2,16
    1779.000 ns | RVFI |        0 |    434 | 00000426 | ----8082 | M | x1  | 0000044e | x0  | 00000000 | x0  | 00000000 |  -- | -------- | -------- | boot_go glitch_test.c 14 - c.jr x1
    1785.000 ns | RVFI |        0 |    435 | 0000044e | fea42423 | M | x8  | 00400000 | x10 | ffffffff | x0  | 00000000 |  WR | 003fffe8 | ffffffff | main glitch_test.c 30 - sw x10,-24(x8)
    1788.000 ns | RVFI |        0 |    436 | 00000452 | fe842783 | M | x8  | 00400000 | x0  | 00000000 | x15 | ffffffff |  RD | 003fffe8 | ffffffff | main glitch_test.c 32 - lw x15,-24(x8)

glitch:

    1740.000 ns | RVFI |        0 |    423 | 00000440 | fcb42c23 | M | x8  | 00400000 | x11 | 00000000 | x0  | 00000000 |  WR | 003fffd8 | 00000000 | main glitch_test.c 21 - sw x11,-40(x8)
    1743.000 ns | RVFI |        0 |    424 | 00000444 | fe042423 | M | x8  | 00400000 | x0  | 00000000 | x0  | 00000000 |  WR | 003fffe8 | 00000000 | main glitch_test.c 24 - sw x0,-24(x8)
    1746.000 ns | RVFI |        0 |    425 | 00000448 | fe042623 | M | x8  | 00400000 | x0  | 00000000 | x0  | 00000000 |  WR | 003fffec | 00000000 | main glitch_test.c 27 - sw x0,-20(x8)
    1752.000 ns | RVFI |        0 |    426 | 0000044e | ----37f1 | M | x0  | 00000000 | x0  | 00000000 | x1  | 00000450 |  -- | -------- | -------- | main glitch_test.c 30 - sw x10,-24(x8)
    1755.000 ns | RVFI |        0 |    427 | 0000044e | ----1141 | M | x2  | 003fffd0 | x0  | 00000000 | x2  | 003fffc0 |  -- | -------- | -------- | main glitch_test.c 30 - sw x10,-24(x8)
    1758.000 ns | RVFI |        0 |    428 | 0000041a | ----c622 | M | x2  | 003fffc0 | x8  | 00400000 | x0  | 00000000 |  WR | 003fffcc | 00400000 | boot_go glitch_test.c 12 - c.swsp x8,12(x2)
    1761.000 ns | RVFI |        0 |    429 | 0000041c | ----0800 | M | x2  | 003fffc0 | x0  | 00000000 | x8  | 003fffd0 |  -- | -------- | -------- | boot_go glitch_test.c 12 - c.addi4spn x8,x2,16
    1764.000 ns | RVFI |        0 |    430 | 0000041e | ----57fd | M | x0  | 00000000 | x0  | 00000000 | x15 | ffffffff |  -- | -------- | -------- | boot_go glitch_test.c 13 - c.li x15,-1
    1767.000 ns | RVFI |        0 |    431 | 00000420 | ----853e | M | x0  | 00000000 | x15 | ffffffff | x10 | ffffffff |  -- | -------- | -------- | boot_go glitch_test.c 14 - c.mv x10,x15
    1770.000 ns | RVFI |        0 |    432 | 00000422 | ----4432 | M | x2  | 003fffc0 | x0  | 00000000 | x8  | 00400000 |  RD | 003fffcc | 00400000 | boot_go glitch_test.c 14 - c.lwsp x8,12(x2)

