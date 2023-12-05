00000400 <main>:
}

int main(int argc, char *argv[])
{
    /* Print a banner to stdout */
    printf("\nHello World! This is the new glitch test\n");
     400:	6511                    c.lui   x10,0x4
{
     402:	b842                    cm.push {x1},-16
    printf("\nHello World! This is the new glitch test\n");
     404:	80450513                addi    x10,x10,-2044 # 3804 <nmi_end_handler_ret+0x28>
     408:	07d000ef                jal     x1,c84 <puts>

    /* Get error result code */
    result_code = boot_go();

    if (result_code != 0) {
      printf("Unable to find bootable image\n");
     40c:	6511                    c.lui   x10,0x4
     40e:	83050513                addi    x10,x10,-2000 # 3830 <nmi_end_handler_ret+0x54>
     412:	073000ef                jal     x1,c84 <puts>
      while(1) {
        count++;
        if (count > 10) {
          printf("Exiting...\n");
     416:	6511                    c.lui   x10,0x4
     418:	85050513                addi    x10,x10,-1968 # 3850 <nmi_end_handler_ret+0x74>
     41c:	069000ef                jal     x1,c84 <puts>
    }

    printf("Glitched out of loop\n");
    do_boot();
    return EXIT_FAILURE;
}
     420:	bc42                    cm.popretz	{x1},16
        ...
