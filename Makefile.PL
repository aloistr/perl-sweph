#!/usr/local/bin/perl
use 5.016003;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
#
# to build statically linked SwissEphe.so, call
# perl Makefile.PL LIBS='' MYEXTLIB='/home/swehome/libswe.a'

WriteMakefile(
    NAME              => 'SwissEph',
    VERSION_FROM      => 'lib/SwissEph.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ABSTRACT_FROM  => 'lib/SwissEph.pm', # retrieve abstract from module
    AUTHOR         => 'Alois Treindl <alois@astro.ch>',
    LIBS              => ['-L/usr/local/lib64/swe -lswe'], 
    #LIBS              => [''],
    #MYEXTLIB     => '/home/swehome/libswe$(LIB_EXT)',
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
    DISTVNAME         => 'perl_sweph', # 
    # OBJECT            => '$(O_FILES)' . "$O_FILES", # link all the C files too

);

sub MY::postamble {
'
$(MYEXTLIB): /home/swehome/Makefile
	cd /home/swehome && $(MAKE) libswe.a $(PASSTHRU)
';
}
