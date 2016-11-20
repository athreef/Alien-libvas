use Alien::LibVAS;
use Alien::Base::ModuleBuild;
use Config;
Alien::Base::ModuleBuild->new(
    dist_name           => 'Alien::LibVAS',
    alien_name          => 'libvas',
    configure_requires  => { 'Alien::Base::ModuleBuild' => '0.022' }, # required for %{pkg_config}
    alien_version_check => '%{pkg_config} --atleast-version 1.2.3 %n && %{pkg_config} --modversion %n',
    alien_bin_requires => {
        'Alien::CMake' => 0.07,
    },
    alien_build_commands => [
        "cmake -G 'Unix Makefiles' -DCMAKE_MAKE_PROGRAM=$Config{make} -DCMAKE_INSTALL_PREFIX:PATH=%s",
        "$Config{make}",
    ],
   alien_repository => {
     protocol => 'http',
     host     => 'github.com',
     location => '/a3f/libvas/archive/master.tar.gz',
   },
    alien_install_commands => [
        "$Config{make} install",
    ],
)->create_build_script;

