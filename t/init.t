use Test2::Bundle::Simple;
use Test::Alien 0.05;
use Alien::libvas;

alien_ok 'Alien::libvas';
my $xs = do { local $/; <DATA> };
xs_ok $xs, with_subtest {
    my($module) = @_;
    ok $module->xs_vas_open($$); # Opening own VAS always succeeds
};

done_testing;

__DATA__

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <vas.h>

//void* vas_open(int, int);

void* xs_vas_open(const char *s, int pid) {
    (void)s;
    return vas_open(pid, 0);
}

MODULE = TA_MODULE PACKAGE = TA_MODULE

void *xs_vas_open(class, pid);
 const char *class;
 int pid;

