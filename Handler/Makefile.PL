WriteMakefile(
    LINKTYPE => 'static',
    'NAME'	=> 'Handler',
    'INC'       => $INCLUDES,
    'OBJECT'    => '$(O_FILES)',
    'CFLAGS'   => $CFLAGS,
    'SKIP'      => [qw( test makeaperl xs_o)],
);

__END__
sub MY::static
{
 '
static  :: libhandler$(LIB_EXT) 

dynamic :: static

libhandler$(LIB_EXT): $(O_FILES) $(MYEXTLIB)
	$(AR) cru libhandler$(LIB_EXT) $(O_FILES)
	$(RANLIB) libhandler$(LIB_EXT)

libhandler.$(DLEXT): $(LDFROM) $(MYEXTLIB)
	$(LD) -o libhandler.$(DLEXT) $(LDDLFLAGS) --whole-archive $(LDFROM) $(OTHERLDFLAGS) $(MYEXTLIB) $(PERL_ARCHIVE) $(LDLOADLIBS) $(EXPORT_LIST)
	$(CHMOD) 755 libhandler.$(DLEXT)

';

}

